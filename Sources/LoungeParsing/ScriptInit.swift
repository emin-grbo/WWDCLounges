//
//  File.swift
//  
//
//  Created by Ivan Lugo on 6/20/22.
//

import Foundation

// MARK: - Script startup

class ScriptInit {
    let jsonRootUrl: URL
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
        default:
            throw Self.invalidArgs
        }
        
        let jsonRootUrl = try Self.loadRootUrl(path: loadPath)
        self.jsonRootUrl = jsonRootUrl
        self.outputUrl = try Self.determineOutputUrl(rootUrl: jsonRootUrl, outputPath)
        (self.reader, self.usermap) = try Self.loadConfigs(Self.defaultRunPathUrl)
    }
}

extension CommandLine {
    static var argumentList: String {
        "\t\(arguments.joined(separator: "\n\t"))"
    }
}

private extension ScriptInit {
    static let cliArgs = CommandLine.arguments
    static let fileManager = FileManager.default
    static let defaultRunPathUrl = URL(fileURLWithPath: "", isDirectory: true)
    static let defaultRawPathName = "WWDC22rawJSON"
    static let defaultRawOutputName = "docs/wwdc22"
    static var invalidArgs: InitException {
        let message = """
        Unexpected argument count [\(cliArgs.count)].
        \(CommandLine.argumentList)
        
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
            return try Self.loadDefaultOutput()
        }
    }
    
    static func loadTargetOutput(target: URL) throws -> URL {
        print(">> Setting target output:\n\t\(target)")
        try Self.fileManager.createDirectory(at: target, withIntermediateDirectories: true)
        return target
    }
    
    static func loadDefaultOutput() throws -> URL {
        let outputUrl = URL(fileURLWithPath: Self.defaultRawOutputName, isDirectory: true)
        print(">> Setting default output:\n\t\(outputUrl)")
        try Self.fileManager.createDirectory(at: outputUrl, withIntermediateDirectories: true)
        return outputUrl
    }
    
    static func loadRootUrl(path: String) throws -> URL {
        
        let rootUrl = URL(fileURLWithPath: path, isDirectory: true)
        print(">> Loading from: \n\t\(rootUrl.path)")
        
        var isDirectory: ObjCBool = false
        let fileExists = fileManager.fileExists(
            atPath: rootUrl.path,
            isDirectory: &isDirectory
        )
        guard fileExists, isDirectory.boolValue else {
            throw InitException.invalidRoot("Does not exist or is not directory: \(rootUrl.path)")
        }
        
        return rootUrl
    }
    
    static func loadConfigs(_ rootUrl: URL) throws -> (ContributionsReader, UsermapReader)  {
        let contributionsUrl = rootUrl.appendingPathComponent("config/contributors.json", isDirectory: false)
        let usermapUrl = rootUrl.appendingPathComponent("config/usermap.json", isDirectory: false)
        print(">> Checking for configs:\n\t\(contributionsUrl.path)\n\t\(usermapUrl.path)")
        return (try ContributionsReader(contributionsUrl: contributionsUrl),
                try UsermapReader(usermapUrl: usermapUrl))
    }
}

// MARK: - Script Exceptions

enum InitException: Error, CustomStringConvertible {
    case invalidArguments(String)
    case invalidRoot(String)
    var description: String { message }
    var message: String {
        switch self {
        case .invalidArguments(let string): return string
        case .invalidRoot(let string): return string
        }
    }
}
