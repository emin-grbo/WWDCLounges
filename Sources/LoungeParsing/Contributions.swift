//
//  File.swift
//  
//
//  Created by Ivan Lugo on 6/16/22.
//

import Foundation

class ContributionsReader {
    let contributionsUrl: URL
    let contributions: Contributions
    
    init(contributionsUrl: URL) throws {
        self.contributionsUrl = contributionsUrl
        self.contributions = try JSONDecoder().decode(
            Contributions.self,
            from: try Data(contentsOf: contributionsUrl)
        )
    }
}
