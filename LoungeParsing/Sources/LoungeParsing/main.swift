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

do {
    try fileManager.createDirectory(at: outputUrl, withIntermediateDirectories: true)
} catch {
    print("Cannot create output directory:\n\(outputUrl)\n", error)
    exit(1)
}

ChannelScanner(sourceDirectory: rootUrl)
    .findChannels()
    .lazy
    .map { ChannelWriter(channelSource: $0).write() }
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
