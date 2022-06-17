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
        return """
        # \(channel.name) QAs
        ### Lounge Contributors
        \(contributorList)
        ---
        
        """
    }
}

struct Contributions: Decodable {
    let markdown: [String: [String]]
}
