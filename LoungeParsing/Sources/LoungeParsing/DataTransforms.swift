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
        
        let repliesMarkdown: [String] = message.slackdumpThreadReplies?.compactMap { $0.text }.map { text in
            // Need to add two new lines around text as GitHub-flavoured markdown treats a single line break as none
            var stringToReturn = "\n\(text)\n"
            let regex = try! NSRegularExpression(pattern: "```")
            let matches = regex.matches(in: stringToReturn, range: NSRange(location: .zero, length: stringToReturn.utf16.count))
            
            matches
                .enumerated()
                .forEach { offset, match in
                    let start = stringToReturn.startIndex
                    // Need to add a line break when opening and when closing a code block
                    let matchStart = offset % 2 == 0 ? match.range.lowerBound : match.range.upperBound - 1
                    let matchEnd = min(matchStart + 4, match.range.upperBound)
                    let stringIndex = stringToReturn.index(start, offsetBy: matchStart)
                    let stringEnd = stringToReturn.index(start, offsetBy: matchEnd)
                    // Need to add a new line when closing and opening a code block
                    stringToReturn.insert("\n", at: stringIndex)
                    stringToReturn.insert("\n", at: stringEnd)
                }
            
            return stringToReturn
        } ?? []
        
        partialResult.append(messageMarkdown)
        repliesMarkdown.forEach { partialResult.append($0) }
    }
}

private extension ChannelWriter {
    func isMessageIncluded(_ message: Message) -> Bool {
        guard let text = message.text else {
            return false
        }
        return message.subtype == "bot_message"
        && message.username?.contains("Ask a Question") == true
        && text.range(of: #"<.*> asked"#, options: .regularExpression) != nil
    }
}
