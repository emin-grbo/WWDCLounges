#!/usr/bin/swift

import Foundation

// MARK: - CLI Args

let arguments = CommandLine.arguments
guard arguments.count == 3 else {
    print("Usage is:\n./formatter_script <root_directory> <your_twitter_handle>")
    exit(1)
}

let fileManager = FileManager.default
let rootUrl = URL(fileURLWithPath: arguments[1], isDirectory: true)
let outputUrl = rootUrl.appendingPathComponent("markdown_output", isDirectory: true)
do {
    try fileManager.createDirectory(at: outputUrl, withIntermediateDirectories: true)
} catch {
    print("Cannot create output directory:\n\(outputUrl)\n", error)
    exit(1)
}

let twitterUserHandle = arguments[2]

// MARK: - Parse strucures

struct Channel: Decodable {
    let name: String
    let messages: [Message]
}

struct Message: Decodable {
    let type: String
    let text: String?
    let subtype: String?
    let username: String?
    let slackdumpThreadReplies: [Reply]?
}

struct Reply: Decodable {
    let type: String
    let text: String?
}

class ParsableChannel {
    let channel: Channel
    lazy var root = """
    # \(channel.name) QAs
    #### by [\(twitterUserHandle)](https://twitter.com/\(twitterUserHandle))
    ---

    """

    init(source: Channel) {
        channel = source
    }
}

extension URL {
    var isDirectory: Bool { hasDirectoryPath }
    var isDirectoryFile: Bool { isFileURL }
    var fileName: String { lastPathComponent }

    func children() -> [URL] {
        do {
            let found = try fileManager.contentsOfDirectory(
                at: self,
                includingPropertiesForKeys: nil,
                options: [.skipsHiddenFiles]
            )
            return found
        } catch {
            print("Failed to iterate children", error)
            return []
        }
    }
}

// MARK: - Data handling

struct ChannelScanner {
    let sourceDirectory: URL

    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func findChannels() -> [ParsableChannel] {
        sourceDirectory.children().compactMap { url in
            guard url.pathExtension == "json" else {
                print("Skipping file: \(url)")
                return nil
            }
            guard let channel = decode(url) else {
                return nil
            }
            return ParsableChannel(source: channel)
        }
    }

    func decode(_ url: URL) -> Channel? {
        guard let data = try? Data(contentsOf: url) else {
            print("Could not find file at path: '\(url)'")
            return nil
        }
        do {
            let channel = try decoder.decode(Channel.self, from: data)
            return channel
        } catch {
            print("Failed to read channel data: \(url)", error)
            return nil
        }
    }
}

struct ChannelWriter {
    let channelSource: ParsableChannel

    func write() -> ParsableChannel {
        channelSource.root = channelSource.channel.messages
            .filter { isMessageIncluded($0) }
            .reduce(into: channelSource.root) { partialResult, message in
                write(message: message, into: &partialResult)
            }
        return channelSource
    }

    private func write(message: Message, into partialResult: inout String) {
        guard let text = message.text else { return }
        let formattedMessage = text
            .replacingOccurrences(of: "&gt;", with: "")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: #"<.*> asked"#, with: "", options: .regularExpression)
        let messageMarkdown = "\n--- \n> #### \(formattedMessage)\n\n"
        let repliesMarkdown: [String] = message.slackdumpThreadReplies?.compactMap { $0.text }.map { text in
            // Need to add a new line when closing a code block
            var stringToReturn = "\(text) \n"
            let regex = try! NSRegularExpression(pattern: "```")
            let matches = regex.matches(in: stringToReturn, range: NSRange(location: .zero, length: stringToReturn.utf16.count))
            matches
                .enumerated()
                .forEach { offset, match in
                    let start = stringToReturn.startIndex
                    let matchStart = offset % 2 == 0 ? match.range.lowerBound : match.range.upperBound
                    let stringIndex = stringToReturn.index(start, offsetBy: matchStart)
                    stringToReturn.insert("\n", at: stringIndex)
                }
            return stringToReturn
        } ?? []

        partialResult.append(messageMarkdown)
        repliesMarkdown.forEach { partialResult.append($0) }
    }

    private func isMessageIncluded(_ message: Message) -> Bool {
        guard let text = message.text else {
            return false
        }
        return message.subtype == "bot_message"
            && message.username?.contains("Ask a Question") == true
            && text.range(of: #"<.*> asked"#, options: .regularExpression) != nil
    }
}

let scanner = ChannelScanner(sourceDirectory: rootUrl)
scanner.findChannels()
    .map { ChannelWriter(channelSource: $0).write() }
    .forEach { writtenChannel in
        let filename = "\(writtenChannel.channel.name).md"
        let channelOutputUrl = outputUrl.appendingPathComponent(filename)
        do {
            try writtenChannel.root.write(to: channelOutputUrl, atomically: true, encoding: .utf8)
            print("Wrote \(filename) to \(channelOutputUrl.path)")
        } catch {
            print("Failed to write output for \(writtenChannel.channel.name)\n", error)
        }
    }
