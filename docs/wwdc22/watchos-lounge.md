# watchos-lounge QAs
### Lounge Contributors
#### [tikimcfee](https://github.com/tikimcfee)
#### [shirblc](https://github.com/shirblc)
#### [roblacl@github](https://github.com/roblack) / [roblacl@twitter](https://twitter.com/emin_ui)
---

--- 
> ####  How should we update our complications going forward? Are complication updates from iPhone still supported?


|U03HHJ4LRU2|:
Nothing has changed with the ClockKit API in this release. Your app can request timeline reloads via `CLKComplicationServer.sharedInstance.reloadTimeline(for: ...)`

|U03HHHJT28K|:
And a similar mechanism exists if you move to WidgetKit based complications

|U03HHHJT28K|:
`WidgetCenter.shared.reloadTimelines(ofKind: ...)`

|U03HMEM4TM5|:
I see, thanks! So I assume the data flow is that it’s still up to the Watch app to react from `transferCurrentComplicationUserInfo` , store the data somehow, and trigger an update — in watchOS 9 or later using the WidgetKit API, in earlier watchOS versions using the CLK API, right?

|U03HHHJT28K|:
If you want to simplify, you can call both and the system will only reload your widgets if you’re running on watchOS 9 or later and have adopted WidgetKit based complications.

|U03HHHJT28K|:
After migrating to WidgetKit, your ClockKit based complications will no longer be run.

--- 
> ####  What is the best way to log Watch applications, especially in production builds? Installing logging profiles can be problematic for non-tech users and only lasts for a couple of days


|U03H96N55U5|:
Hi Enrico! Are you asking what is the best way to capture logs from your customers when filing Feedback with Apple, or what is the best way to capture logs for your own use?

|U03JLV0E8RJ|:
The second case is what i’m interested in most. The point is what method would you advise to receive logs from builds that have no debugger attached

|U03HL0NNTEG|:
Hi, Enrico. As far as I know, logging profiles are the only way to get logs for your application on production builds. But maybe somebody else knows of something obscure that I don't!

|U03H96N55U5|:
That’s the only way I know of also!

|U03HMESB695|:
In my own apps, I have a logging system that then pushes logs over WatchConnectivity back to the phone with a debugging view.

|U03JLV0E8RJ|:
Thanks Brian. Is it true that they unfortunately expire after a few days? Any more detail on that?

|U03H96N55U5|:
The profiles expire, but that doesn’t stop you from having your own logging. :slightly_smiling_face:

|U03HL0NNTEG|:
I believe the intention is to expire the profiles because often a user will forget they have it enabled and that can have power and performance implications.

|U03HMESB695|:
If this helps at all, here is my code <https://gist.github.com/aaronpearce/ae5a287d99fce09b4507e708d6aa329e> Uses a watchconnectivity library called Communicator.

--- 
> ####  If we go for watchOS 9 only is it then possible for Watch Series 3 users to load the old Binary of the App from the  "Watch App Store"?


|U03H96N55U5|:
Hi Sebastian. I’m not positive, but I don’t think this will work reliably, especially if your watch app is independent. Is there an API you want to use that would require you to go minOS 9.0?

|U03JELPN197|:
I mean if we update our app to watchOS 9 only in autumn, would it be possible for the Watch Series 3 users to download an old Version of our Watch App that supports watchOS 8, like it is on the App Store, where  users with older devices can still download the latest supported Version of an App?

|U03H96N55U5|:
Yep, I understood the question. :slightly_smiling_face: My question back to you was: is there a reason you want to go watchOS 9 only?

|U03J201SFAP|:
And in a related question, is there anywhere besides Google search - where we developers can get meaningful statistics on WatchOS (or iOS/iPadOS) adoption rates?

|U03JELPN197|:
We would like to go for watchOS 9 only to get rid of the 32bit Binary for Watch Series 3. This increases the App size of the iOS app or am I wrong?

|U03H96N55U5|:
watchOS apps are already thinned for the platform they’re delivered to, so this isn’t something you need to worry about!

|U03H96N55U5|:
both the architectures and the assets are thinned for the device class and size. :slightly_smiling_face:

|U03JELPN197|:
But the Watch Binary is still a part of the iOS Binary right? If a user with a Series 3 downloads the iOS App is then in the Binary  a 32bit Version of the Watch App only or is  the 64bit Version also included?

|U03H96N55U5|:
The watchOS binary is not downloaded to the phone if the paired watch is running watchOS 6.0 or later. It does not make your iOS app any bigger.

|U03JELPN197|:
Ahh good to know thank you :raised_hands:

--- 
> ####  Can you point me in the direction of the Share Sheet documentation? Is it SwiftUI only?


|U03HL004760|:
The documentation is here: <https://developer.apple.com/documentation/swiftui/sharelink>, and there will be a related session available tomorrow: Meet Transferable. ShareLink is SwiftUI only.

--- 
> ####  Is the size for a Watch App still limited to 75mb?


|U03H96N55U5|:
Yes it is.

--- 
> ####  Hello! There is no DatePicker for watchOS. Could creating a List with sections be an alternative? Thanks for your time.


|U03HL0NNTEG|:
Can you please clarify what you mean by "List with sections"?

|U03HHJK2FJ6|:
A list with sections sounds interesting! You can also use multiple Pickers. Please do file a feedback about DatePicker (or any other enhancements you may think of)

|U03HL0NNTEG|:
Yep, a date picker is definitely something that we've been missing for a while.

|U03J21EKNSE|:
Thank you Brian D and Matthew K. I had almost built the app with 3 separate pickers in UIKit, but had problems keeping track of the different number of day requirements (we don’t want anyone saying “June 31”. I have a watchOS lab tomorrow, but wanted to trim down my question (15 min is a short time for the messy situation I

|U03J21EKNSE|:
… I am in (but I will definitely take it!)

|U03J21EKNSE|:
Moving from UIKit to SwiftUI gave me different problems… life is interesting!

|U03J21EKNSE|:
By “List with Sections” I meant a list where I could send user to separate detail views for the entries, or list elements (apologies for the incorrect term) that could hold TextFields. But that is not great in watchOS. BTW: what happened to number pads in watchOS 8?

|U03HHJK2FJ6|:
There's a couple examples of date pickers in some of our watchOS apps. For example, Reminders has a version of a date picker when editing. They reset the day picker's value when the month picker changes, to prevent a user from picking an invalid date.

|U03HHHXDL03|:
Also, please file a feedback about number pads.

|U03HHHXDL03|:
And explain the use case, what you need out of the number pad.

|U03J21EKNSE|:
Thanks; will check Reminders, and type feedback. The number pad is to enter year and a second field for a Date calculation; will elaborate in the feedback report.

|U03HHHXDL03|:
thank you! if you can, follow up here when you have the feedback request number, that would be great.

|U03J21EKNSE|:
Hello! Trying to find out if Scott D received the message sent last night: my watch session did not get approved, so I just submitted two feedback requests: FB10115599 (mentioning the need for a DatePicker in watchOS) and FB10115881 (mentioning watchOS8 needs a number keyboard). Thanks for your time; have a good day!

|U03HHHXDL03|:
Thank you for following up!

--- 
> ####  Does callkit automatically grant us access to the microphone on the watch and if so are we able to access the microphone in third party apps without using callkit using a plist value for example? 


|U03HB0UR9RU|:
No, CallKit does not provide access to the microphone automatically. The user would need to grant the permission.

|U03HZ3L98TF|:
Thank you, does this mean we can get microphone access in other applications? Previously we couldn't to my knowledge but just wondering if this has changed recently. 

|U03HHJK2FJ6|:
AVAudioRecorder is available on watchOS. <https://developer.apple.com/documentation/avfaudio/avaudiorecorder>

|U03HZ3L98TF|:
Looks like what I am looking for! 
Thank you very much for quick response and your help 

|U03HHJK2FJ6|:
Of course! Thank you for you questions!

--- 
> ####  I have developed an app to submit files from the apple watch to the iPhone and from the iPhone to the watch. The file transfer from the Apple watch to the iPhone is successful, but the file transfer from the iPhone to the watch is not. The iPhone is receiving its own sent file.  What am I doing wrong? Ziqiao Chen from apple couldn't find the problem in the DTS Lab Session.


|U03HL004760|:
Hi Paul. It sounds like something is going wrong there. If Ziqiao wasn’t able to help, I think we’ll need more information. Please follow the instructions to install logging profiles and file feedback. Include a code snippet and we’ll get it figured out.

|U03J1TZUPC3|:
I've opened a TSI

|U03J1TZUPC3|:
Thanks

--- 
> ####  I have an existing iPhone+Watch app, when I open it in Xcode it runs great, but there is a warning to update to recommended settings... when I update to recommended settings I get an error related to "Found WatchKit 2.0 app... WhatchKit <http://App.app|App.app> but it does not have a WKWatchKitApp or WKApplication key set to true in its Info.plist" and am not totally sure how to best remediate this error after letting Xcode update to recommended settings?


|U03H96N55U5|:
Hi Matthew! Updating to recommended settings attempted to convert your existing watch project to a single-target app, and missed a setting. Most likely you just need to add `WKApplication` to `1` in your Watch App target’s Info.plist.

|U03H96N55U5|:
if that doesn’t do the trick, we can go into a bit more detail about your project to try to figure it out. :slightly_smiling_face:

|U03J20PPN3U|:
Cool. I went to my Watch App targets Info.plist and added `WKApplication` value `1`. I then got an error saying I have both `WKApplication` and `WKWatchKitApp` and should only have one of those keys. Should I remove `WKWatchKitApp` from the Info.plist?

|U03H96N55U5|:
let’s back up a bit, in that case. Is your app storyboard-based or SwiftUI (App) Lifecycle?

|U03J20PPN3U|:
SwiftUI

|U03H96N55U5|:
if you’re using `App`, you need to annotate your App type with `@main`, e.g.:
```
@main 
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}
```

|U03J20PPN3U|:
In my `WatchApp.swift`  file found in my WatchKit Extension I do have my  App type annotated with `@main` , is that what you are referring to?

|U03H96N55U5|:
yep. we might need to look at your project together, then. can you sign up for one of the watchOS labs and note in your question that you were referred from the digital lounge?

|U03J20PPN3U|:
sure do you have a link to the labs sign up so i make sure i go to the right place?

|U03H96N55U5|:
<https://developer.apple.com/wwdc22/labs/> to submit your request; pick the watchOS lab on Wednesday or Friday.

|U03H96N55U5|:
<https://developer.apple.com/wwdc22/110495> (Wed)
<https://developer.apple.com/wwdc22/110496> (Fri)

|U03J20PPN3U|:
thanks so much! just sent a request for Friday

--- 
> ####  Do you have any tips to run a bigger App with support for Complications and Siri Intents on a real Apple Watch with the debugger? Currently I have to be lucky to get it to work.


|U03HHJK2FJ6|:
Here's a couple tips!

Like any wireless connection, the connection between Apple Watch and iPhone is dependent on network conditions.

When debugging, Apple Watch automatically prefers a WiFi connection to the phone to improve the speed. However, that has some requirements:
• The iPhone and Watch are on the same WiFi network.
• Consider that some Apple Watches only work on 2.4Ghz networks.
• Some networks disable peer to peer connections, which will prevent WiFi from working.
• Network congestion can play a part in causing issues.
• Make sure the Apple Watch is sufficiently charged (we recommend keeping the watch on the charging puck while debugging)
If WiFi is otherwise unavailable, we use Bluetooth for the connection which will be slower.

|U03JELPN197|:
Thank you very much. Will check again whether I can adjust the network somehow better when debugging with a real device.

--- 
> ####  Is there a way to trigger a sysdiagnose on a watch (or iPhone)


|U03JLV0E8RJ|:
on a watch *simulator*, sorry my question was cut

|U03HEM646TX|:
There is! :sunglasses: Instructions on how to do so are available on <https://developer.apple.com/bug-reporting/profiles-and-logs/?platform=watchos>

|U03HHJK2FJ6|:
For the simulator, you can use `xcrun` from your mac. `xcrun simctl sysdiagnose`

|U03JLV0E8RJ|:
Thanks <@U03HHJK2FJ6> that’s very helpful!
How this command behaves if i have multiple simulators open simultaneously? (maybe a watch sim paired with an iphone sim)

|U03HHJK2FJ6|:
The `help` for `simctl` will give some pointers. <https://developer.apple.com/forums/thread/679842|This answer> from the developer forums suggests using the `--uuid` parameter.

--- 
> ####  What happens if a WidgetKit-backed complication update is running while I request another reload of the "widgets"? Is the second request dropped, or enqueued to the end of the current "reload"? Thanks!


|U03HKV0T82Y|:
The second is enqueued. If you add a third… we’ll take a peek at the requests and decide which one to keep

|U03HKV0T82Y|:
This is because a reload might be in-progress just as you get new data, and so your app requests another reload. It’d be mean for us to ignore that second one, since you had no control over when the first reload actually happens

|U03HKV0T82Y|:
But if you give us a third reload request…, well that’s greedy and we will throw one away :)

|U03HKV0T82Y|:
There was a cool WidgetKit talk in WWDC 2021 about reloads and budgets

|U03HMEM4TM5|:
thanks! I mean, if the user makes 3 changes in the app, that does mean that we honestly need to update 3 times

|U03HMEM4TM5|:
I suppose you’d recommend throttling?

|U03HKV0T82Y|:
There’s nothing wrong with requesting a third time, because you don’t control when the reloads will happen. We’ll be sure to keep one of the reload requests queued up, and when budgets allow, we’ll reload your widget with whatever is the current latest content

|U03HKV0T82Y|:
We’ll do throttling too. Depends on several factors such as how frequently your widget is viewed, and there is a daily budget. <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date> has more

--- 
> ####  Is it possible to display location associated with a workout that occurred in a third-party watchOS app that was then written to the Fitness app? Just like with workouts from the Workout app.


|U03H96N55U5|:
You can record the user’s route for some types of workouts; details here: <https://developer.apple.com/documentation/healthkit/workouts_and_activity_rings/creating_a_workout_route/>

|U03H96N55U5|:
You as the developer would be responsible for the visual representation of this data. :slightly_smiling_face:

|U03JELQLESV|:
Thank you! Seems this wouldn't fit for just a pin of a location, like where a tennis workout happened. Unless I'm missing something, I can file this in Feedback Assistant.

|U03H96N55U5|:
Right, Tennis is not a workout for which you can collect a route, but if you request location permissions, you might be able to capture the user’s location at the time the workout was started and/or ended, which would be sufficient for a pin.

--- 
> ####  Can we establish a Socket connection for server-based apps? And also - can we use QUIC for client-server connections on WatchOS?


|U03HHJK2FJ6|:
Sockets are only available for streaming audio. You can use the Network framework for the connection.

--- 
> ####  Thank you for adding CallKit support on WatchOS. In case if user receives voip call on iphone, and he didn't have an watchOS version of this app on his Watch - can he receive incoming call alert or notification on watch in that case? Or we need to have an watchOSApp?


|U03HB0UR9RU|:
No, if the user doesn't have the watchOS version of the app installed on their Watch, they would not be notified of the incoming call.

|U03J2255P42|:
So, am I right that watchOS now will support VoIP notifications for such cases?

|U03J2255P42|:
<@U03HB0UR9RU> sorry, i forgot to mention :disappointed:

|U03HB0UR9RU|:
I am not sure if I understand the question correctly. Just to clarify, the Watch would receive the incoming call notification if the corresponding watchOS app is installed and it would not, if it is not installed.

--- 
> ####  Do the new WidgetKit complications support all existing Watch faces? Or do we still need to handle the older complication families separately using `CLKComplicationTemplateWhatever`?


|U03HHJK2FJ6|:
WidgetKit supports all watch faces that previously used the "graphic" complication templates. Luckily, we also updated a bunch of watch faces to use that "graphic" style in watchOS 9!

|U03HHJK2FJ6|:
Once you start using WidgetKit for complications, the system will always prefer using those complications even if your app provides complications via ClockKit.

|U03HHJK2FJ6|:
There's some great sessions this year that goes over the migration path between ClockKit and WidgetKit.

|U03HVF46TEJ|:
Thanks! Is there a good list of which faces now use graphic complication? That's been a little tricky to piece together in the past. 

|U03H96N55U5|:
All the faces in watchOS 9 support graphic complications.

|U03HHHJT28K|:
The talk on Thursday, Go further with Complications in WidgetKit, goes into more detail about this.

--- 
> ####  Hello everyone! How can we schedule local notifications to be displayed on watchOS apps with a companion iOS app and a custom notification view? I mean, if a notification is scheduled on the iPhone, does this get shown on the Watch using our custom notification view - or do we have to provide additional configuration to "share" notifications across the two devices?


|U03H96N55U5|:
If you have a custom `WKNotificationScene` in your watch app, it will be used to display the notification that’s automatically forwarded to the watch by the system. (IOW, the system handles coordination between the watch and the phone.)

|U03HELSFX3P|:
the local notification scheduled from your iPhone will automatically display on the watch when appropriate, you only need a `WKNotificationScene` if you want to customize the UI of the notification on the watch

|U03JRQ9ADA4|:
Thank you, Lori and Jose - that’s amazing! That’s the clarification I was precisely looking for. Great! :smile:

--- 
> ####  Are we allowed to instantiate a CBPeripheralManager on a watch application and let the watch act as a Btle peripheral?


|U03HL004760|:
No. The Watch app can instantiate a `CBCentralManager` and communicate with peripherals, but it cannot be a peripheral.

--- 
> ####  I know this is likely to change with AppIntents/AppShortcuts - but is there a way to get shortcuts into the watchOS simulator so they can be tested? Currently they can only be added via iOS, and they don't sync across (presumably because they need iCloud)


|U03H96N55U5|:
Hi Quentin! Can you file Feedback about this? (Or if you have, can you post the FB number here?)

|U03JH1D27C1|:
Will do for this specifically. It’s related to this though: FB9980324

|U03JH1D27C1|:
Submitted: FB10081835

--- 
> ####  If we convert our Intent definition files to App Intents, can we deploy to watchOS 8 and earlier and have existing user-created shortcuts continue working?


|U03HHJK2FJ6|:
This would best answered at the SiriKit lounge.

--- 
> ####  Hello! Can anyone suggest an alternative to a DatePicker (still absent from watchOS)? Multiple wheel pickers are a possibility, especially since people would not want to type month/day/year in their Watch. Dictation is another possibility I’m considering; Steppers would have too many numbers for days… thanks in advance for the input!


|U03HELSFX3P|:
Yeah, I think multiple pickers would be the way to go, but don’t be afraid to experiment and find something that fits your app’s needs.

|U03H96N55U5|:
Hi Mayra! Yes, for now multiple pickers is probably the best way to implement a date picker manually. We will absolutely take your Feedback about wanting a `DatePicker` for watchOS, tho!

|U03H96N55U5|:
In the Feedback, tell us the combinations of dates/use cases you’re most interested in!

|U03J21EKNSE|:
Thank you! The multiple picker implementation is almost 95% done in WatchKit/UIKit, but I am moving it to SwiftUI to see if it’s “easier”. The main problem I am encountering is matching the checks needed to make sure days offered are correct with respect to year (leap or not) and 30/31 days for the rest of the months. I hope the new capabilities in watchOS9 and SwiftUI will help me finish!

|U03J21EKNSE|:
Homework accepted: will file tonight!

|U03JEDKRZJ6|:
I'd have thought the watch screen size is just about big enough for the new date picker option on swiftui, would be great to see it there

|U03J21EKNSE|:
Same here, but I’ve been waiting for something like it for two years… I’m sure it will happen right after I hit my last bug. And the official implementation will be better (of course)!

--- 
> ####  This looks to be a great year for watchOS. From the simplified app target to the improvements brought through SwiftUI, I already know I'll be building some better apps this year. Thank you!


|U03H96N55U5|:
That is so awesome to hear. Thanks Josh!

--- 
> ####  Thank you for the presentation! Is there anyway to know what watchOS versions my users are on? My app supports watchOS6, but if no one is using that OS I would like to remove code that is specific to that older version. Thank you!


|U03H96N55U5|:
I think what we really need is someone to write some analytics packages for watchOS. :wink: It’s possible to query the version number from the watch itself, but iirc there isn’t a way to get that info from the phone.

|U03H96N55U5|:
`WKInterfaceDevice.systemVersion` is how to get the info.

|U03J7BXV8KA|:
For a cross-platform / structured data solution there's also: <https://developer.apple.com/documentation/foundation/processinfo/1410906-operatingsystemversion>

|U03JJQ3BMB7|:
Ok thank you. Yes, that would be nice to have analytics package for watchOS! It would be nice to see the break down on AppStore connect for watchOS like you can for iOS :blush:

|U03H96N55U5|:
Definitely file that Feedback!!

--- 
> ####  What's the cool magnifying glass thing that's in your presentation when you are telling us where to go to find more information about SwiftUI? Is there a story there?


|U03HL004760|:
That is a hand lens for examining rocks in the field. I got that one when I was at university getting my degree. After being a geologist for a few years, I’ve spent most of my career as a software engineer. But all of my math, physics, chemistry, biology, and communications serve me well.

--- 
> ####  Howdy :face_with_cowboy_hat: First of all, many thanks for the marvellous updates this year and such a great sessions!  My question is regarding Portrait watch face. I've been playing around with different images and what pique my curiosity was the fact that the same image might be used with depth effect on the new iOS Lock Screen while not supporting Portrait on the watch. It is correct to assume that the reason is different screen dimensions and Depth Effect requires some padding around the subject to work?


|U03HHHK57K5|:
Starting with watchOS 9, the Portraits face _does_ support photos from your entire photos library (not only those taken in Portrait mode), just like the new lock screen. However, I think you're right in your analysis of screen size/shape, padding around the subject, etc. In order for the depth effect to work, there needs to be the right amount of overlap between the foreground subject and the time and the variables you mentioned that are different between the phone and watch would affect that amount.

|U03J22AU6DQ|:
Gotcha, thanks <@U03HHHK57K5>!

|U03HHHK57K5|:
Of course!

--- 
> ####  will the watch ui testing be able to handle complications in clockkit as well as widgetkit soon? It's hard to automate testing for the watch but i need it the most on complications


|U03HHJ4LRU2|:
You should be able to test the SwiftUI views that make up your WidgetKit complications and parts of your ClockKit complications as you would with any other SwiftUI view!

|U03HHJ4LRU2|:
If there's some specific support you're looking for in regards to having a more widget-like environment, please file a feedback and be sure to include specific details about what we can improve on! :slightly_smiling_face:

|U03J7JKA23F|:
ok! yeah! i sorely need ui testing for complications (they multiply like tribbles) - will file feedback if necessary. good to know!!! :tada:

--- 
> ####  Hi all! When developing for watchOS in XCode, we currently use two targets: Apple Watch and Apple Watch Extension. To be honest, I'm still pretty confused about why this is needed, and I feel like both targets use my assets some of the time. Do upcoming releases simplify this workflow into a single target and make it more similar to iOS/macOS development?


|U03H96N55U5|:
hi Jan! When the original Apple Watch was released, it was pretty revolutionary—but not very powerful (at least compared to the current models!). Thus in watchOS 1, the code for third-party WatchKit apps ran on iPhone, as an extension to the companion iOS app, and drove the UI on the Apple Watch.

|U03H96N55U5|:
The code _had_ to be in two targets, because they went to different devices! And the WatchKit Extension target truly was an extension.

|U03H96N55U5|:
This changed in watchOS 2, when the contents of both targets moved to Apple Watch.

|U03H96N55U5|:
We are so excited to simplify the developer experience this year by merging the targets in Xcode, and by offering a new Watch App target that makes your options clearer up front.

--- 
> ####  There are problems with syncing data (application context, messages, ...) between the Watch and iOS simulator (<https://developer.apple.com/forums/thread/682915).|https://developer.apple.com/forums/thread/682915).> Are these problems fixed with Xcode 14?


|U03H96N55U5|:
We gave some guidance about this on Tuesday: <https://wwdc22.slack.com/archives/C03GSLANZJT/p1654637598881109>

|U03JELM0ZNV|:
Debugging tip that may help @Simon, based on a few years now of working on a very complex iMessage app extension. Not quite as hard as WatchKit comms but Messages simulator debugging is pretty fragile too.

Thanks to a friend pushing me, I made the bulk of my complex logic able to compile cleanly on Mac and run unit tests there. (I have a document model that rivals Keynote in complexity, so encode/decode &amp; DOM manipulation is significant - 500 tests now).

That saves me massive time &amp; so can focus on _just_ UI testing on the devices.

--- 
> ####  We use a WKExtendedRuntimeSession (SmartAlarm Mode). When the user dismisses the alarm, we want to send a request to our server. This happens in the `func extendedRuntimeSession(_: WKExtendedRuntimeSession, didInvalidateWith _: WKExtendedRuntimeSessionInvalidationReason, error: Error?)` delegate function. Do we need to use a network background session for that? The normal async URLsession data task does not finish?


|U03H96N55U5|:
Background URLSessions are almost always the right strategy on watchOS, and in this specific case as well. :slightly_smiling_face:

--- 
> ####  Can SwiftUI/Swift be use to create a WatchOS custom keyboard? If so, can you point me to the resources/doc(s) that covers this topic?  Thx


|U03H96N55U5|:
Hi Nolan! This isn’t supported on watchOS yet, but we’ll happily take a Feedback enhancement request!

|U03JUGE7XB5|:
I just sent a Feedback enhancement request; can I expect this functionality by next week? :laughing:

--- 
> ####  If we go with the new app target for an independent Watch app which doesn't contain an iPhone app, will we be able to convert it to a iPhone app with an independent watch app?


|U03HL004760|:
This can be done!
1. Add the iOS App Target
2. On the General settings for the iOS App Target, add the Watch App to the Frameworks, Libraries, and Embedded Content list.
3. On the Build Settings, search for Bundle Identifier. Set the WatchKit Companion App Bundle Identifier to the Bundle Identifier of the Watch App.
4. Delete the iOS Stub target that was originally created when you created the Watch Only app.
5. Delete the iOS Stub from the Watch App scheme Build.


--- 
> ####  Are there any changes to a complication's daily reload budget when using WidgetKit instead of ClockKit? In particular, the WidgetKit docs say that reloads aren't counted when the containing app has an active audio or navigation session. Does this also apply on watchOS?


|U03HHJ4LRU2|:
Yes, audio and navigation sessions also give you unmetered refreshes on watchOS! The timeline reload budget is roughly the same, but the Background App Refresh and runtime budgets are different; the widget extension is metered separately from your main app with WidgetKit

|U03JCQQ5CRJ|:
<@U03HHJ4LRU2> Thanks! Would the watchOS complication get unmetered refreshes if the companion iOS application had an active audio or navigation session? Or only if the watchOS app had an active session?

|U03HHJ4LRU2|:
Only on the same device, there's no sharing between them.

--- 
> ####  In our application we've got a screen with recently played content which pulled from repositories/api client in iOS counterpart app. But when the iOS app is not running then Watch application will never load that screen. The data exchange works through `WatchConnectivity` and in documentation it says "Sending a message from a watchOS app wakes up its paired iOS app if it's reachable." But if we "kill" iOS application the messages will be never delivered (as far as we see the mentioned screen above doesn't loads). Is there any other way to wake it up? Maybe you have any advice how to debug it?


|U03HL004760|:
I’d suggest using the WatchConnectivity’s Application Context to communicate the information from iOS to Watch. The Application Context is intended to be there when the app launches and the values can be updated if something changes. For more information about the different parts of WatchConnectivity and when you might use each one (and other data communication technologies that might be useful), check out this session: <https://developer.apple.com/videos/play/wwdc2021/10003/>.

--- 
> ####  I apologize if this is an overly basic question. When the watch series 6 came out I was very excited about the oxygen sensor. Outside of spot checks I was interested in righting and app to gather oxygen data overnight along with other parameters to provide an additional dataset for people with obstructive sleep apnea to share with their doctors. Is their a way to modify the polling rate on the oxygen sensor to pull more frequently (if so what’s the limit) and what’s the best way to approach this?  Please excuse my ignorance I’m new to Apple Watch and a novice at software development(this is more of a passion project for me not for a job/income and I’m intending to have this app be free and as a conversation starter for people and their physicians who are either diagnosed or think they may have sleep apnea and thus their doctor can conducted additional questioners and sleep studies to make an actual diagnoses or reassessment) 


|U03HL0NNTEG|:
Hi, Ahmed. Unfortunately there's currently no way to do this. But I'd suggest you file a feedback requesting the ability to do this.

|U03JSSE35GQ|:
<@U03JYB15E2G> I would also benefit from this feature. If you file a feedback, please send it to me.

|U03JYB15E2G|:
Thank you will do!

--- 
> ####  Hi all! SwiftUI on watchOS now appears to have a keyboard with QuickType. Can we provide values for QuickType to suggest specific strings? For example, let's say the user is searching in a long list of fruits. By passing the fruits data to QuickType, we could tell the system to suggest specific fruits whose name property matches the user-typed string, so that typing "a" does not suggest "and" but "Apple".  Right now we can pass suggestions to .searchable, but the suggestions are not shown while the user is typing. Instead, they appear as an overlay to List once the user finished typing and returns to the view. Also, .searchable does not bring up the keyboard right away, unlike TextFieldLink.


|U03HHHXDL03|:
Hi again <@U03JMMN8659>! Just to reiterate from yesterday when we talked in the swiftui-lounge, if you can file a feedback request with your use case that would be great.

|U03HHHXDL03|:
Some of us were also in the swiftui-lounge for watch specific questions

|U03JMMN8659|:
Ah, hello <@U03HHHXDL03>! I will file feedback, I just want to exhaust all that is already available before requesting new features :blush: as you see this is a followup to yesterday's thread. Since then, I looked at .searchable as you suggested. Hence my question above. .searchable is nice, but it does not suggest results to the user on watchOS while the user is typing

|U03H96N55U5|:
We would _love_ to have a Feedback about that!

|U03JMMN8659|:
Alright, sent as FB10135103 :slightly_smiling_face:

|U03HHHXDL03|:
great thanks!

|U03JMMN8659|:
thank you <@U03HHHXDL03>!

--- 
> ####  I am currently working on an iOS app that stores data on device in core data. What way would be best to add an optional Watch app, that could be used along side it. (Prefer not to use cloud storage if possible). Similar to how workout functions, but the workout could be started on either iPhone, or Watch. Thanks for keeping the questions open for devs working GMT time :)


|U03HL004760|:
Hi Steven! I’m curious about why you want to avoid using cloud storage. If you used Core Data with CloudKit, then you’d get the data synchronization there.
This session might be helpful in looking at various strategies: <https://developer.apple.com/videos/play/wwdc2021/10003/>. Sometimes you might need to combine strategies to get the right experience.

|U03JG3QTSGL|:
Hi Anne, thanks for replying.  I am hoping as far as possible to allow the user complete control over their data (for privacy), So I was working on the assumption that the most private is on device, then iCloud. So in my mind I had the idea of allowing the user to select either to store data only on their device, or on iCloud. I assumed that with Watch connectivity the data would stay on the Phone, with the Watch having access to it. Thanks for the link to the video, I will going and watch it now. Thanks again.

|U03HL004760|:
So many of us are a lot more conscious now about how our data is being stored and shared, so it’s great that you’re considering this so strongly. :heart: It’s a balancing act. You want to protect everyone’s privacy and also ensure that they don’t lose data should something happen to their phone. Options are always good. I hope the video helps, and definitely read about privacy and security with iCloud. Once you know all the options, you can make the best choice to provide the level of privacy you want to deliver.

|U03JG3QTSGL|:
That video was great, just at the right level too. I see what you mean about maybe needing to think about combining strategies, and also the trade off between privacy and usability.

--- 
> ####  I want to expose a TextField to users on my Watch app but only allow numeric entry. Can I show just a number pad keyboard for input?


|U03HELSFX3P|:
We do not support numeric keyboards at this time. Could you file a feedback with your use case?

|U03J21EKNSE|:
Hello! I posted a feedback about this same thing yesterday (FB <tel:10115881|10115881>), and had been referred to 3 months ago in the Developer Forum. The developer that typed that comment said he had filed a report about the lack of number keyboard in watchOS 8 in August 2021 under the number FB9568384 (searched but couldn’t find it as active). 

|U03H96N55U5|:
Thanks for filing! Duplicates are VOTES. :slightly_smiling_face:

--- 
> ####  Hi, I enjoy the exciting WWDC. I have one question about WatchKit. Can you tell that you are wearing a Apple Watch? I can know the charging status with WKInterfaceDeviceBatteryState. How can the app tell if a user wears an Apple Watch on their wrist? Thank you!


|U03H96N55U5|:
Hi Yoichi! It would be helpful to understand the use case better before responding. If threads are locked by the time you see this, can you please file Feedback and describe what you’re trying to do?

|U03H96N55U5|:
watchOS does support `LocalAuthentication`, so if your case is about, say, requiring that the watch be unclocked or that the user enter their passcode  before showing data, you should be good.

--- 
> ####  I've a game design which relies heavily on the digital crown (conceptually). Am I right in thinking that WKCrownSequencer will allow me to directly capture the rotations so I can map them into manipulating the state of the game, rather than it only being able to change focused pickers?  (It's been a fair while since I dived into WK &amp; gave up as early versions were too constraining)


|U03HW7XJHR7|:
You're correct that you can use the digital crown to drive much more than pickers. But we would recommend looking at the <https://developer.apple.com/documentation/swiftui/form/digitalcrownrotation(_:)|digitalCrownRotation> in SwiftUI instead.

--- 
> ####  The new ShareLink to open a share sheet on watchOS (finally!) is great. Is there a way to make my app a sharing destination on the Watch, like an equivalent to Share and Action Extensions on iOS?


|U03J7BPFP8Q|:
Hi Christopher, I'm so glad you like the new `ShareLink` API! There is not a way to make your app a sharing destination in watchOS 9.0, but please file Feedback with some details about your use case!

--- 
> ####  Question about subscriptions on Apple Watch. I would like to have a single subscription to unlock content in my app across Apple devices.  According to this (<https://developer.apple.com/support/universal-purchase/)|https://developer.apple.com/support/universal-purchase/)> support doc: "To offer your app on iPhone and Apple Watch, create an iOS app with a watchOS counterpart in Xcode and upload the apps to App Store Connect from the same Xcode project. **Watch-only apps cannot be part of a universal purchase**. But during the WWDC22 talk about multiplatform apps: "Both my iOS and macOS app products use the same bundle identifier by default, which is awesome, because that means when I publish them to the App Store, they will be made available for Universal Purchase. **So folks who buy my iOS app will also get my Mac app automatically**." So, question: can we have a single subscription for content in an iOS app, and an independent watchOS app? :face_with_monocle:


|U03H96N55U5|:
Hi Jan. Yes, your watch app is considered part of your iOS app for App Store purposes, but it can still be independent.

|U03H96N55U5|:
Check the Runs Independently of iOS Companion App box in the Xcode project editor to make your watchOS app independent.

|U03JMMN8659|:
Thank you <@U03H96N55U5> :pray:  so it does not matter (for universal subscription) if the watch app targets have their own bundle identifiers that differ from the iOS app?

|U03H96N55U5|:
If I recall correctly, the watchOS app should have the same root identifier as the iOS app. E.g., com.fancyapps.mymealtracker (iOS) and com.fancyapps.mymealtracker.watchkitapp (watchOS)

|U03JMMN8659|:
yep, it does

--- 
> ####  Multi-line text support in TextField is very exciting, but doesn’t seem to work in watchOS 9 beta 1. Will it be supported? And if so, will the keyboard editor support new lines? Currently all newlines are removed from any existing text (collapsing it to a single line) and there’s no way to type a return.


|U03HHHXDL03|:
<@U03HVF46TEJ> Could you please file a feedback request with your use case? and the details about new lines here as well?

|U03HVF46TEJ|:
Sure, will do. Thanks!

--- 
> ####  Checking an analogy here. I've been working for years on an iMessage app extension which also has fragile debugging on simulator. Something that helps hugely is I built a unit test suite that can run on Mac so all my complex data handling logic gets heavily exercised in fast builds there, leaving the on-device testing to being UI-only. Is this a useful strategy for WatchOS?  Kinda a comment-as-question that might help @Simon &amp; others with the sync issues, and am asking for my own benefit as I restart a Watch project.


|U03HL004760|:
This is certainly a reasonable analogy (and not even where something is fragile). The more you make your model testable and test that directly, the more efficient you can make your testing. You can also potentially keep your quality high (assuming your tests are well-designed, of course). :slightly_smiling_face:
UI tests will take longer to develop and run. Having good model tests allows you to focus your UI tests on testing the actual UI.

|U03JELM0ZNV|:
I have a complex document model for encoding games that does things like particle emitters in 1/20th the Apple formats. Lots of bit fields. You bet my tests are exhaustive 500 of them, about 25% of code is test code when I'm working on the core model!
_TDD Purists_ will disagree with some of my torture tests though but I can refactor with impunity :smile:

--- 
> ####  When using WatchKit and the ExtensionDelegate, we could access the root interface controller to change the snapshot controller for instance. Is there a way to do this using SwiftUI lifecycle?


|U03HHJK2FJ6|:
Hi <@U03JPJ277SQ>! New in watchOS 9 is the <https://developer.apple.com/documentation/swiftui/backgroundtask/|BackgroundTask> API, which has a snapshot task type. When you get the task, you can replace the root view of your app when a snapshot is requested from the system. In watchOS 8 and previous, you can use the <https://developer.apple.com/documentation/swiftui/wkextensiondelegateadaptor|WKExtensionDelegateAdaptor> to implement `handle(_ backgroundTasks: Set&lt;WKRefreshBackgroundTask&gt;)`

|U03HHJK2FJ6|:
One more note: If you’ve updated your app to the newest recommended settings from Xcode, you’ll no longer have a watchOS extension and you can use <https://developer.apple.com/documentation/swiftui/wkapplicationdelegateadaptor|WKApplicationDelegateAdaptor> instead of WKExtensionDelegateAdaptor.

|U03JPJ277SQ|:
Oh I didn’t know that. Thanks.

--- 
> ####  Can you use SpriteKit on WatchOS with SwiftUI? Is SpriteKit limited on Watches? I can't find any listed - most stuff goes back to WatchOS2 or 3.


|U03HW7XJHR7|:
You can embed SpriteKit into your SwiftUI views using <https://developer.apple.com/documentation/spritekit/spriteview|SpriteView>.

|U03JELM0ZNV|:
Thanks, partly answering my own question - <https://developer.apple.com/documentation/spritekit/sknode/controlling_user_interaction_on_nodes> neatly side-steps mentioning WatchOS

&gt;  `SKNode` subclasses `UIResponder` in iOS and tvOS, and `NSResponder` in macOS, allowing nodes to respond to user interaction events such as touches and mouse movements

|U03JELM0ZNV|:
are there any *other* significant missing bits of SpriteKit on Watch?

--- 
> ####  Thanks for extending the ask questions workflow (left town right after WWDC 🫠).  Are there any conceptual limitations to building an app with only 1 input method (one finger) and 40mm-45mm screens? With Apple Watches getting more and more independent from iPhones, how far should we take apps (gaming, social media, etc.)?  Also, watchOS supports SceneKit but not Metal (at least not in the Xcode template), is there a reason for this conceptually or just technically?


|U03H96N55U5|:
Hi Ethan! Lots of developers are doing pretty amazing things on Apple Watch—I’ve played some games that were so immersive that I had to rest my arm on a table to keep my shoulder from getting tired. :slightly_smiling_face:

|U03H96N55U5|:
Speaking of your arm getting tired tho, that _is_ a thing, and he primary use case for watchOS apps is quick interactions and glanceable experiences.

|U03H96N55U5|:
As to one-finger interactions, Assistive Touch actually makes it possible to interact with an Apple Watch without having any fingers at all!

|U03HMEDQX55|:
Awesome! Makes the platform feel full of potential discovery. I haven't developed much for watchOS but with SwiftUI getting better I'm excited

|U03HHJK2FJ6|:
In terms of support for Metal, please do file feedback!

|U03HMEDQX55|:
Assistive touch might be one of my favorite Apple Watch features. Absolutely incredible!

|U03HMEDQX55|:
Will do! I really want Metal to come to the watch because the Ray traced Unity Lights showed how capable the watch can be

|U03HHJK2FJ6|:
That watch face really is incredible!

--- 
> ####  I already ask a similar question, but can I use the NSUbiquitousKeyValueStore to sync data between different Complications / Widgets on multiple devices? Example: I tell Siri on my phone that I ate a Donut. I store then an Integer in NSUbiquitousKeyValueStore with the Amount of Donuts I ate. On my Watch I have a Complication that should show the amount of Donuts. Would NSUbiquitousKeyValueStore a good approach to sync data between Siri Intents and Watch Complications?


|U03H96N55U5|:
No. KVS is for syncing configuration/preferences, not data.

|U03H96N55U5|:
From what you’re describing, you don’t need data transfer at all. Your _app_ can store the fact that you ate the donut (your intent could be invoked by something like, “hey Siri, tell MyDietTracker that I ate a donut,” and MyDietTracker records that you ate the donut. The complication can be updated based on that data when the app is running, or using background app refresh.

--- 
> ####  We want to use fall detection on the Watch to be informed when a fall occurs. Will the system continue to handle fall events natively and call the rescure services when we register as a fall detection delegate? Or are we from then on alone responsible for handling the fall event?


|U03HL0NNTEG|:
Hi, Simon.

I have verified that if you use `CMFallDetectionManager`  to observe fall events this does not affect the default system behavior. Your app will be briefly woken up in response to fall events so that it can do a small amount of work, like sending a notification, or something similar.

|U03HL0NNTEG|:
You can also request recent fall event samples from HealthKit.

|U03H96N55U5|:
Keep in mind that you will need an entitlement to use `CMFallDetectionManager`. <https://developer.apple.com/documentation/coremotion/cmfalldetectionmanager>

|U03HL0NNTEG|:
Here's the documentation for the HealthKit fall detection samples: <https://developer.apple.com/documentation/healthkit/hkquantitytypeidentifier/1615592-numberoftimesfallen>

|U03HL0NNTEG|:
For that, you need to authorize HealthKit access to that sample type.

--- 
> ####  Testing SwiftUI on watchOS - is there documentation or a video you would recommend for getting started with this? Thank you!


|U03HL004760|:
The best way to test your SwiftUI app on watchOS is to make your model layer testable and write thorough tests for that with XCTest. This will allow you to concentrate you UI testing on Watch to the UI itself.
You can build a test suite for your model layer and run it to catch any regressions. You can find documentation for XCTest here: <https://developer.apple.com/documentation/xctest>, and there are a lot of great WWDC session videos about designing and writing tests.

|U03JJQ3BMB7|:
Cool thank you. I have my model in a swift package and wrote tests for it with XCTest.  Just need to figure out UI tests now ! :blush:

--- 
> ####  Is there a component, or a way to animate marquee style (horizontal) scrolling for text, like in the Now Playing UI? Back in SwiftUI v1 and watchOS 6 I couldn’t figure it out, has something been added since?


|U03HW7XJHR7|:
There is nothing specifically built for this exact use-case. But I've built similar things using `Canvas` along with a `TimelineView` and an `TimelineAnimationSchedule`

|U03JFUBCW85|:
Ok, thanks for the info. I’ll have a look at those newer APIs to see if I can implement it myself.

|U03JELM0ZNV|:
Or you could use SpriteKit as in <https://www.hackingwithswift.com/forums/swift/opening-credits-crawl-like-star-wars/287> (at the end)

--- 
> ####  Dear WatchOS team: It is so easy to download a WatchOS app through the Apple-watch app on the iPhone as a companion app. Just great. But when our team tried to download an App direct through the Apple Watch Appstore the experience was quite different. Searching for the App, switching to Passcode mode, trying to enter the AppleID - not what we want to customers to endure. Any other way to download an independent Apple Watch App?


|U03H96N55U5|:
Watch-only (and independent Watch) apps can be found on the iOS App Store, and installation can be triggered from there, yes. I honestly install my Watch apps from the App Store on Apple Watch, tho.

|U03H96N55U5|:
At this point I have over 90 third-party watchOS apps on my watch; most of them were installed automatically because I have the companion iOS app, but I often search for apps directly on my watch because it’s pretty fast to download from there—and sometimes I only want the watchOS app.

|U03H96N55U5|:
For example, I only ever use Insight Timer on my watch, so I install it from the App Store on Apple Watch. :slightly_smiling_face:

|U03HVD9QKHU|:
Thanks for the insight!:slightly_smiling_face::de:

--- 
> ####  In watchos 7, the CoreBluetoooth framework worked great in the background, allowing for a constantly updated app interface on the watch. Especially if this application communicates via BLE with a peripheral that has more than 20 characteristics. There are problems with the BLE connection, and then the application has to connect to the periphery every time and read the initial values of the characteristics. This process could take up to 10 seconds for my app. Starting with watchos 8, the application on the watch, going into the background, stops communicating with the periphery. How will the CoreBluetooth framework change in the future to properly design my application on the watch?


|U03J7BPFP8Q|:
Hi Sergey! Starting in watchOS 9.0, bluetooth peripherals that your app connects to will stay connected even when the application is suspended. In addition, there are some nifty new features like Timely Alerts which will wake your application in the background if a characteristic marked as Notify on Change is changed! I recommend watching the "Get Timely Alerts from Bluetooth Devices on watchOS" video, new this year to learn about all the details of the new capabilities!

<https://developer.apple.com/videos/play/wwdc2022/10135/>

|U03JZ0QA8BD|:
:+1:

--- 
> ####  What's the best way to sending fast messages with less enery using with WatchConnectivity? Does sending as Data instead of Dictionary performs better? Do you recommend sending a big payload as smaller parts or at once? Also is there any payload size limit?


|U03HL0NNTEG|:
Hi, Emre. There are a couple of parts to this question, but I think the most important part is whether it's better to do a large amount of work spread out over a longer period of time or to do it all at once.

There are a couple of great WWDC talks that address this. One that really helped me to get into the right mindset about this was this one: <https://developer.apple.com/videos/play/wwdc2015/707/>

Doing a task on a mobile device requires spinning up whatever hardware is needed to do the task. That can be a CPU, or wireless radios. All of those things require power to run, and turning them on and off frequently is a very quick way to burn down the user's battery. So the best thing to do is to do as much work as you can in as short a time as possible and then let the device go back to sleep.

|U03HL0NNTEG|:
There's also a great talk from last year about watch connectivity: <https://developer.apple.com/wwdc21/10003>

|U03HL0NNTEG|:
That one was done by <@U03HL004760>!

|U03J5EP5RSB|:
Thank you! :pray:

--- 
> ####  With the new sleep stage? is it possible to monitor and reading from realtime in extending runtime of what stage the user is in? Or all these data are still calculated and write to healthkit when the user wake up


|U03KCE3N7EV|:
It is not possible to monitor sleep stage in realtime. I would suggest you file a Feedback.

|U03HVD9QKHU|:
Really would support sleep stages in real time!

--- 
> ####  Is there a way to send a message from the iPhone application to wake up the associated AppleWatch application ? Note: the AppleWatch application is already started, I just need to wake it up.


|U03H96N55U5|:
Hi Frederic! What do you mean that the application is already started, and you just need to wake it up? Can you elaborate on your use case?

|U03JSSE35GQ|:
Yes. The application is a workout application with a workout in progress. I just would like the iPhone application to send it a message in order to update some data that are only available on the iPhone so that when the user raise his/her hand, he/she can see the updated data immediately.

|U03H96N55U5|:
OK, so it’s not really about “waking” the watch or the app (it’s already running); you’re looking for data to be transferred immediately.

|U03JSSE35GQ|:
Yes, but when the Watch application is in the inactive state (watch screen is off).

|U03H96N55U5|:
OK then no, there is no way for you to wake the screen programmatically.

|U03H96N55U5|:
You can still send data over, and the user will see it when they raise their wrist (if that’s how you’ve designed the UI, of course).

|U03H96N55U5|:
I’m assuming you’ve already seen <@U03HL004760>’s great talk <https://developer.apple.com/videos/play/wwdc2021/10003/>

|U03H96N55U5|:
:slightly_smiling_face:

|U03JSSE35GQ|:
Thanks! I did miss this WWDC21 video and from the code examples it seems that i will be able to implement my use case. thanks again!

--- 
> ####  How can I make sure that my CoreData (CloudKitContainer) objects sync over correctly from watchOS to iOS?    When does the watchOS app start the sync?  Or is CoreData with iCloud maybe not the best way to sync Objects?   It’s one of the most recurring complaint from my users at the moment. Sorry if it’s not detailed enough but I’m a bit lost, A modern example of CoreData support between watchOS and iOS would be amazing :smile: 


|U03H96N55U5|:
Hi Hidde! So nice to meet you in person on Monday. :blush: CoreData sync via iCloud is pretty much automatic, but keep in mind that when syncing happens is based on system and network conditions. _Usually_ data is available pretty quickly, but sometimes it can take longer.

|U03H96N55U5|:
It’s helpful to design your experience with the expectation that data might not arrive immediately.

|U03HMDG985D|:
I can relate to the question. A lot of my support questions were related to ‘stale’ data (which would correct itself in just a few seconds upon launch of the Watch app).

One thing that helped is communicating proper expectations to my users. Overall, CoreData+CloudKit was super convenient for both myself and my users. I just had to temper their expectations: Yes, your data is safe. You just need to be patient if you’re doing a fresh launch of the app.

|U03H96N55U5|:
Yep! And it is possible to design experiences that don’t leave users waiting and wondering. :slightly_smiling_face: It’s just a little different than designing iOS experiences, which more developers have experience with. :joy:

|U03JMMN8659|:
I will probably relate to this soon, since I want to expand my app to watchOS. <@U03HMDG985D> could this be solved with a loading indicator (e.g. progress view) while the data is being loaded? Can we even detect that data after a fresh launch is still being loaded?

|U03HMDG985D|:
If you’re doing the CloudKit yourself, I think you could. If you’re using `NSPersistentCloudKitContainer`, there is no way to know when the syncing begins (though you might be able to tell when it ends via the associated events notifications).

In my case, I’m using the persistent cloud kit container, so I can’t provide that UI to my users. (I tried; it wasn’t consistent.) Which is where informing/instructing my user was more valuable.

|U03JMMN8659|:
Thanks, that's very insightful. I am using NSPersistentCloudKitContainer. So I guess I will go with a simple disclaimer. Can we even detect that the user already has some data in CloudKit, so that the disclaimer will not be shown to users who are totally new to the app?

|U03HMDG985D|:
Wouldn’t that map directly to the presence of data in your persistent container?

|U03JMMN8659|:
I suppose. But if I just set up a disclaimer to show once container receives data, the disclaimer will also appear if a new user creates some data

|U03H96N55U5|:
what is the data that y’all are waiting for? fwiw I was thinking along the lines of relying on data that’s already on the watch (because it’s generated by the watch, or stored there) whenever possible, and augmenting with data from other sources when it becomes available. this isn’t _always_ possible, of course; if you have a reminders/task or grocery list app across platforms, the user is going to expect those to sync, and in that case spinners and other syncing UI might be approrpriate.

|U03HMDG985D|:
And even if your app has no local data on first launch and you show your ‘new user’ UI, once your local Core Data store syncs up, you could update your UI. So the disclaimer would go away. And maybe the disclaimer can include wording that, if they have used the app on another device with the same Apple ID, that they can expect to see data soon.

--- 
> ####  Hi! :wave: We’re using HKLiveWorkoutBuilder for tracking indoor swimming. But the workoutBuilderDidCollectEvent for the distance datatype is coming in delayed and resulting in an inaccurate data.  Usually 2 or more laps of distance (~50m) are missing. Could you maybe help me with this issue?


|U03HL0NNTEG|:
Hi, <@U03J7AWBLDT> and I'm sorry you're running into trouble with your swimming app. This sounds very much like something the Health team would like to look at. Can you please file feedback about this? Thanks!

--- 
> ####  How can we hook into assistive touch? (Sorry if covered in videos, due 16hr time diff &amp; being busy elsewhere haven't seen them yet).  I've been in love with the feature since a staffer at local Apple Store was wizzing through but I can't find an API, just UIKit stuff.


|U03HELSFX3P|:
You can! The “<https://developer.apple.com/videos/play/wwdc2022/10052/|What’s New in SwiftUI>” video shows how you can use the `accessibilityQuickAction` API to configure what will happen when the user makes an assistive touch gesture.

|U03HHHXDL03|:
Also, here's the documentation link for this. <https://developer.apple.com/documentation/swiftui/view/accessibilityquickaction(style:content:)>
It's a new API available for watchOS only in watchOS9. The user does need to have accessibility quick actions enabled via Settings -&gt; Accessibility -&gt; Quick Actions -&gt; On. It's also limited to detecting the double pinch gesture only.

|U03JELM0ZNV|:
I'd also found last years's video <https://developer.apple.com/videos/play/wwdc2021/10223/> but no matching docs, was looking at the code.

|U03HHJK2FJ6|:
AssistiveTouch works with the same accessibility infrastructure as VoiceOver. Following best practices for <https://developer.apple.com/documentation/swiftui/view-accessibility|Accessibility in SwiftUI> will make your app work well with AssistiveTouch.

--- 
> ####  Is it possible to know that the Watch App will exceed the 75mb limit before it has been submitted and processed in App Store connect?


|U03HL004760|:
I don’t have a great recommendation for how to check this in advance. But in general, are you having issues with this when submitting your app?
I know we all want to be good Watch app citizens and some devices are quite limited on storage. If you’re using a lot of storage, people might get frustrated and uninstall your app. Have you considered  ways to reduce the size of your app and still deliver a great experience? I know this is a constant challenge.

--- 
> ####  if you make the decision to make a Watch only app - does that mean you have to distribute it separately or can it still be sold with an iPhone app. Functionally they could be used separately but buying the iPhone app would provide the watch app too? Is that the definition of "companion app"?


|U03H96N55U5|:
Hi Dan! You should only make a watch-only app if you don’t have an iOS app with the same or related functionality already. Functionally a watch app that can run independently of its iOS companion app operates as if it is watch only if its companion is not installed, as in my Insight Timer use case from an earlier thread (I only install Insight Timer on the watch, and never install the companion iOS app).

|U03H96N55U5|:
that’s a lot of words, I realize. :stuck_out_tongue:

|U03H96N55U5|:
If you have an iOS app, and your watchOS app offers the same or related functionality, they should be considered “the same app” and submitted together.

|U03JELM0ZNV|:
In iMessage apps, another restriction is lack of access to IAP for an extension-only app. So you're strongly encouraged there to have a "real" parent app.

|U03H96N55U5|:
hi Andrew, that’s unrelated

|U03H96N55U5|:
Watch apps are not extensions of iOS apps.

|U03JELM0ZNV|:
are you saying Watch-only apps have store IAP access?

|U03H96N55U5|:
and Watch apps do support IAP!

|U03H96N55U5|:
yes!

|U03JELM0ZNV|:
yay!

|U03JELM0ZNV|:
Thanks for clarifying the architecture - I started with WatchOS when they were much more tightly coupled.

|U03H96N55U5|:
yeah! I have a little bit on the history in a previous thread; let me find it.

|U03J1UGE04B|:
Thanks! I think watch-only would be rare.

|U03H96N55U5|:
<https://wwdc22.slack.com/archives/C03GSLANZJT/p1654725594769139?thread_ts=1654725447.910529&amp;cid=C03GSLANZJT>

|U03H96N55U5|:
Watch-only is less common, certainly, but there are still several hundred watch-only apps in the App Store. :slightly_smiling_face:

|U03J1UGE04B|:
Ah yes - I do have one called Geneva Moon that shows you moon phases and can locate the moon with the compass! Very fun

|U03H96N55U5|:
Yeah! Watch-only apps are also a _great_ way to learn SwiftUI, especially for students. You can create small and useful applications without having to worry about also building an iOS app.

|U03J1UGE04B|:
How does the connection to Xcode work? I don’t think I’ve tried since Xcode 12 - but it seemed like getting a real device to connect was difficult. It still has to go through a paired iPhone, right?

|U03H96N55U5|:
yes, plug in the iPhone via lightning cable (don’t try to do WiFi debugging on the phone and then also debug the watch app!)

|U03H96N55U5|:
you don’t want to do more hops than you need to. :slightly_smiling_face:

|U03H96N55U5|:
Matthew had some good advice here: <https://wwdc22.slack.com/archives/C03GSLANZJT/p1654634872820659?thread_ts=1654634863.147179&amp;cid=C03GSLANZJT>

|U03J1UGE04B|:
I’m looking forward to Xcode 14 connecting to my iPhone better - I had to do my share of rebooting to get my iPhone connected with Xcode 13. And the AppleTV is easier to deploy to through TestFlight than directly across my house :dizzy_face:

|U03J1UGE04B|:
Thanks so much for those tips… now that I’m thinking about it - I was using a S2 watch so that wasn’t probably very quick either. I’ll have to try with Xcode 14 and my S7! :rocket:

|U03HHJK2FJ6|:
Yes! That should help. Series 7 supports 5Ghz WiFi as well. :crossed_fingers: you should have a better time.

|U03H96N55U5|:
omg yes please use a Series 6 or later if you have one!

|U03J1UGE04B|:
It got to be a challenge to see how long my S2 could last - it was something like 5 years!

|U03H96N55U5|:
I still have a Series 2 that I use to test various scenarios, but I definitely don’t debug on it. :slightly_smiling_face:

--- 
> ####  Back when developing against watchOS 6, Watchdog killed my app after the binary grew too big. Removing some dependencies solved the issue.  But I want to ask:  is this size limit documented somewhere, and has it been raised in the last few releases?


|U03HHHXDL03|:
<@U03JFUBCW85> Could you elaborate on what issue you see? What are the error messages / symptoms when the problem occurs?

|U03HHHXDL03|:
or... rather, what were they when you were hitting the issue in watchOS 6.

|U03H96N55U5|:
Spoiler alert: It’s not the binary size that’s the problem here. :slightly_smiling_face:

|U03JFUBCW85|:
So this was happening during the watchOS 6 beta period. Haven’t tested out the limit since.
As I remember it, Watchdog killed the app, but maybe I’m misremembering and it was happening in App Store Connect? Like was just mentioned here: <https://wwdc22.slack.com/archives/C03GSLANZJT/p1654795299375599>
Not sure anymore I’m afraid.

|U03H96N55U5|:
So Sebastian is asking about the size limit when submitting to the App Store (because that’s where the 75MB limit applies).

|U03JFUBCW85|:
I see, that’s probably what I was hitting as well then. I’m a bit hazy on the details, as it’s been so long.

|U03H96N55U5|:
give it another whirl! :slightly_smiling_face:

|U03JFUBCW85|:
I will, for sure. Thanks for the info. These lounges are really great!

--- 
> ####  What's the best way to wake up iOS app from Watch app to keep it running? My iOS app is connecting to a server by socket and keep sending real time data to the Watch app. Is sending short messages to iPhone with an interval good way? Thank you


|U03HHJ68LDR|:
Hi, Emre.

Sending a message via WatchConnectivity from your Watch App will wake the iOS app. However, you can't due this forever, as the messaging will be limited eventually.

Can you tell us a bit more about what you're trying to do here?

|U03H96N55U5|:
Sorry to say we have to wrap up now, so we’ll be turning threading off.
