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
    lazy var root = """
    # \(channel.name) QAs
    #### by [\(twitterUserHandle)](https://twitter.com/\(twitterUserHandle))
    ---
    
    """
    
    init(source: Channel) {
        channel = source
    }
}
