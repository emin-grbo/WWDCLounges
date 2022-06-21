import Foundation

do {
    let initState = try ScriptInit()
    try ChannelScanner(sourceDirectory: initState.rootUrl)
        .findChannels(contributionsReader: initState.reader)
        .lazy
        .map {
            ChannelWriter(
                channelSource: $0,
                usermapReader: initState.usermap
            ).buildLoungeMarkdown()
        }
        .forEach { markdownChannel in
            let filename = "\(markdownChannel.channel.name).md"
            let channelOutputUrl = initState.outputUrl.appendingPathComponent(filename)
            try markdownChannel.root.write(
                to: channelOutputUrl,
                atomically: true,
                encoding: .utf8
            )
            print("Wrote \(filename) to \(channelOutputUrl.path)")
        }
} catch {
    print(error)
    exit(1)
}
