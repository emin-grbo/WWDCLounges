//
//  File.swift
//  
//
//  Created by Ivan Lugo on 6/15/22.
//

import Foundation

extension URL {
    var isDirectory: Bool { hasDirectoryPath }
    var isDirectoryFile: Bool { isFileURL }
    var fileName: String { lastPathComponent }
    
    func children() -> [URL] {
        do {
            let found = try FileManager.default.contentsOfDirectory(
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
