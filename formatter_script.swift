#!/usr/bin/swift

import Foundation

struct Channel: Decodable {
    let name: String
    let messages: [Message]
}

struct Message: Decodable {
    let type: String
    let text: String
    let subtype: String?
    let username: String?
    let slackdumpThreadReplies: [Reply]?
}

struct Reply: Decodable {
    let type: String
    let text: String?
}

let arguments = CommandLine.arguments
let filePath = arguments[1]
let twitterUserHandle = arguments[2]


guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
    print("Could not find file at path: '\(filePath)'")
    exit(1)
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let channel = try! decoder.decode(Channel.self, from: data)


var markdownTemplate = """
# \(channel.name) QAs
#### by [\(twitterUserHandle)](https://twitter.com/\(twitterUserHandle)
---

"""

let outputMarkdown = channel
    .messages
    .filter { $0.subtype == "bot_message" && $0.username?.contains("Ask a Question") == true && $0.text.range(of: #"<.*> asked"#, options: .regularExpression) != nil }
    .reduce(into: markdownTemplate) { partialResult, message in
        let formattedMessage = message.text
            .replacingOccurrences(of: "&gt;", with: "")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: #"<.*> asked"#, with: "", options: .regularExpression)
        let messageMarkdown = "> #### \(formattedMessage) \n"
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

print(outputMarkdown)
