//
//  File.swift
//  
//
//  Created by Ivan Lugo on 6/15/22.
//

import Foundation

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
    let user: String?
}

class ParsableChannel {
    let channel: Channel
    let reader: ContributionsReader
    
    lazy var root = makeRoot()
    
    init(source: Channel,
         reader: ContributionsReader) {
        self.channel = source
        self.reader = reader
    }
    
    private func makeRoot() -> String {
        let contributorList = reader.contributions
            .markdown[channel.name]?
            .map { "#### \($0)" }
            .joined(separator: "\n")
            ?? "#### No contributors listed"
        
        let externalLinks = populateExternalLinks(for: channel.name)
        
        return """
        # \(channel.name) QAs
        ### Lounge Contributors
        \(contributorList)
        \(externalLinks)
        \n
        """
    }
    
    private func populateExternalLinks(for channel: String) -> String {
        if channel == "swiftui-lounge" || channel == "design-lounge" {
            return "#### 📓Notion variant 👉 [check it out](https://blog.timing.is/wwdc-22-digital-design-lounge-archive/)"
        }
        return ""
    }
}

struct Contributions: Decodable {
    let markdown: [String: [String]]
}

struct UserMap: Decodable {
    let known: [String: String]
}
