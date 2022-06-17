//
//  File.swift
//  
//
//  Created by Ivan Lugo on 6/15/22.
//

import Foundation

struct ChannelScanner {
    let sourceDirectory: URL
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func findChannels(contributionsReader: ContributionsReader) -> [ParsableChannel] {
        sourceDirectory.children().compactMap { url in
            guard url.pathExtension == "json" else {
                print("Skipping file: \(url)")
                return nil
            }
            guard let channel = decode(url) else {
                return nil
            }
            return ParsableChannel(
                source: channel,
                reader: contributionsReader
            )
        }
    }
    
    private func decode(_ url: URL) -> Channel? {
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
        print("Handling channel messages: \(channelSource.channel.name)")
        
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
        partialResult.append(messageMarkdown)
        
        message.slackdumpThreadReplies?
            .lazy
            .compactMap { reply -> String? in
                guard let replyText = reply.text else { return nil }
                let userId = reply.user ?? "[?]"
                let stringBlock = "\n|\(userId)|:\n\(replyText)\n"
                let stringToReturn = Self.CodeBlockRegex.stringByReplacingMatches(
                    in: stringBlock,
                    range: NSRange(stringBlock.startIndex..., in: stringBlock),
                    withTemplate: Self.CodeBlockTemplate
                )
                return stringToReturn
            }.forEach { formatted in
                partialResult.append(formatted)
            }
    }
}

private extension ChannelWriter {
    static let CodeBlockRegex = {
        try! NSRegularExpression(pattern: "`\\s*?`\\s*?`\\s*?([\\S\\s]*)`\\s*?`\\s*?`\\s*?")
    }()
    
    static let CodeBlockTemplate = {
        "```\n$1\n```"
    }()
    
    func isMessageIncluded(_ message: Message) -> Bool {
        guard let text = message.text else {
            return false
        }
        return message.subtype == "bot_message"
        && message.username?.contains("Ask a Question") == true
        && text.range(of: #"<.*> asked"#, options: .regularExpression) != nil
    }
}
