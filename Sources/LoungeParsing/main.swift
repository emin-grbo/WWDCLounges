import Foundation

// MARK: - CLI Args

let arguments = CommandLine.arguments
guard arguments.count == 3 else {
    print("Usage is:\n./formatter_script <root_directory> <your_twitter_handle>")
    exit(1)
}
let twitterUserHandle = arguments[2]
let fileManager = FileManager.default
let rootUrl = URL(fileURLWithPath: arguments[1], isDirectory: true)
print("Starting in \(rootUrl)")

let outputUrl = rootUrl.appendingPathComponent("markdown_output", isDirectory: true)
print("Output to \(outputUrl)")

let contributionsUrl = rootUrl.appendingPathComponent("config/contributors.json", isDirectory: false)
let usermapUrl = rootUrl.appendingPathComponent("config/usermap.json", isDirectory: false)
print("Checking for:", contributionsUrl.lastPathComponent, usermapUrl.lastPathComponent)
let reader: ContributionsReader
let userMap: UsermapReader
do {
    reader = try ContributionsReader(contributionsUrl: contributionsUrl)
    userMap = try UsermapReader(usermapUrl: usermapUrl)
} catch {
    print(error)
    exit(1)
}

// MARK: - Output setup

do {
    try fileManager.createDirectory(at: outputUrl, withIntermediateDirectories: true)
} catch {
    print("Cannot create output directory:\n\(outputUrl)\n", error)
    exit(1)
}

// MARK: - Walk and write

ChannelScanner(sourceDirectory: rootUrl)
    .findChannels(contributionsReader: reader)
    .lazy
    .map {
        ChannelWriter(
            channelSource: $0,
            usermapReader: userMap
        ).write()
    }
    .forEach { writtenChannel in
        let filename = "\(writtenChannel.channel.name).md"
        let channelOutputUrl = outputUrl.appendingPathComponent(filename)
        do {
            try writtenChannel.root.write(to: channelOutputUrl, atomically: true, encoding: .utf8)
            print("Wrote \(filename) to \(channelOutputUrl.path)")
        } catch {
            print("Failed to write output for \(writtenChannel.channel.name)\n", error)
        }
    }
