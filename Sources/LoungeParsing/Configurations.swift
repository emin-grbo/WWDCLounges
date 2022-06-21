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

class UsermapReader {
    let usermapUrl: URL
    let usermap: UserMap
    
    init(usermapUrl: URL) throws {
        self.usermapUrl = usermapUrl
        self.usermap = try JSONDecoder().decode(
            UserMap.self,
            from: try Data(contentsOf: usermapUrl)
        )
    }
}

// MARK: - CLI Args

enum InitException: Error, CustomStringConvertible {
    case invalidArguments(String)
    case invalidRoot(String)
    var message: String {
        switch self {
        case .invalidArguments(let string): return string
        case .invalidRoot(let string): return string
        }
    }
    var description: String {
        switch self {
        case .invalidArguments(let string): return string
        case .invalidRoot(let string): return string
        }
    }
}

// MARK: - Script startup

class ScriptInit {
    let rootUrl: URL
    let outputUrl: URL
    let reader: ContributionsReader
    let usermap: UsermapReader
    
    init() throws  {
        let loadPath: String
        var outputPath: String?
        switch Self.cliArgs.count {
        case 1: // Load from default; output to default
            loadPath = Self.defaultRawPathName
        case 2: // Load from requested; output to default
            loadPath = Self.cliArgs[1]
        case 3: // Load from requested; output to requested
            loadPath = Self.cliArgs[1]
            outputPath = Self.cliArgs[2]
        default: throw Self.invalidArgs
        }
        
        let rootUrl = try Self.loadRootUrl(path: loadPath)
        self.rootUrl = rootUrl
        self.outputUrl = try Self.determineOutputUrl(rootUrl: rootUrl, outputPath)
        (self.reader, self.usermap) = try Self.loadConfigs(rootUrl)
    }
}

private extension ScriptInit {
    static let cliArgs = CommandLine.arguments
    static let fileManager = FileManager.default
    static let defaultRawPathName = "WWDC22rawJSON"
    static let defaultRawOutputName = "markdown_output"
    static var invalidArgs: InitException {
        let message = """
        Unexpected argument count [\(cliArgs.count)].
        \t\(cliArgs.joined(separator: "\n\t"))
        
        Usage is: ./LoungeParsingRunner <[1] relative load path> <[2] relative output path>
            [1] - Optional. Defaults to :: \(defaultRawPathName)
            [2] - Optional. Defaults to :: \(defaultRawOutputName)
        
        """
        return InitException.invalidArguments(message)
    }
}

private extension ScriptInit {
    static func determineOutputUrl(rootUrl: URL, _ outputPath: String?) throws -> URL {
        if let target = outputPath {
            let targetOutput = URL(fileURLWithPath: target, isDirectory: true)
            return try Self.loadTargetOutput(target: targetOutput)
        } else {
            return try Self.loadDefaultOutput(rootUrl: rootUrl)
        }
    }
    
    static func loadTargetOutput(target: URL) throws -> URL {
        try Self.fileManager.createDirectory(at: target, withIntermediateDirectories: true)
        print(">> Setting target output:\n\t\(target)")
        return target
    }
    
    static func loadDefaultOutput(rootUrl: URL) throws -> URL {
        let outputUrl = rootUrl.appendingPathComponent(Self.defaultRawOutputName, isDirectory: true)
        try Self.fileManager.createDirectory(at: outputUrl, withIntermediateDirectories: true)
        print(">> Setting default output:\n\t\(outputUrl)")
        return outputUrl
    }
    
    static func loadRootUrl(path: String) throws -> URL {
        let rootUrl = URL(fileURLWithPath: path, isDirectory: true)
        print(">> Loading from: \n\t\(rootUrl)")
        
        var isDirectory: ObjCBool = false
        let fileExists = fileManager.fileExists(
            atPath: rootUrl.path,
            isDirectory: &isDirectory
        )
        guard fileExists, isDirectory.boolValue else {
            throw InitException.invalidRoot("Does not exist or is not directory: \(rootUrl)")
        }
        
        return rootUrl
    }
    
    static func loadConfigs(_ rootUrl: URL) throws -> (ContributionsReader, UsermapReader)  {
        let contributionsUrl = rootUrl.appendingPathComponent("config/contributors.json", isDirectory: false)
        let usermapUrl = rootUrl.appendingPathComponent("config/usermap.json", isDirectory: false)
        print("Checking for:", contributionsUrl.lastPathComponent, usermapUrl.lastPathComponent)
        return (try ContributionsReader(contributionsUrl: contributionsUrl),
                try UsermapReader(usermapUrl: usermapUrl))
    }
}
