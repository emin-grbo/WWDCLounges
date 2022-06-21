import Foundation



do {
    print("--- Starting")
    print(CommandLine.argumentList)
    
    let initState = try ScriptInit()
    
    print("\n--- Starting markdown generation")
    try ChannelScanner(sourceDirectory: initState.jsonRootUrl)
        .findChannels(contributionsReader: initState.reader)
        .lazy
        .map { parsedChannel -> ChannelWriter in
            return ChannelWriter(
                channelSource: parsedChannel,
                usermapReader: initState.usermap
            )
        }
        .map { writer -> ParsableChannel in writer.buildLoungeMarkdown() }
        .forEach { markdownChannel in
            let filename = "\(markdownChannel.channel.name).md"
            let channelOutputUrl = initState.outputUrl.appendingPathComponent(filename)
            try markdownChannel.root.write(
                to: channelOutputUrl,
                atomically: true,
                encoding: .utf8
            )
            print("... finished \(channelOutputUrl.path)")
        }
} catch {
    print(error)
    exit(1)
}
