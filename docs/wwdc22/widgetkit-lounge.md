# widgetkit-lounge QAs
#### by [shirblc](https://github.com/shirblc)
---

> ####  Is AccessoryWidgetBackground supported for the system small, medium and large widgets to give them a transparant background?


|U03HHJ4LRU2|:
No, just the accessory family widgets. It'll be an empty view in system widgets

|U03HKV0T82Y|:
System widgets are always opaque

|U03HKV0T82Y|:
Good question!

|U03JRR4R3CY|:
Ok I will make a feedback suggestion then, it would be great if the small, medium and large widgets could also have the same style background as the the system’s files and clock widgets :slightly_smiling_face:

|U03HKV0T82Y|:
Excellent feedback, thank you!

--- 
> ####  Where does the "Extra Large" complication size fit when migrating from ClockKit, since that supports SwiftUI? Does it just scale up the  .accessoryCircular type?


|U03HHHJT28K|:
Yes it automatically scales up the `.accessoryCircular` family.

|U03HHHJT28K|:
There will be more info about the watch specific accessory widgets in the Go further with Complication in WidgetKit talk on Thursday.

--- 
> ####  How to deal with relative dates in the widget, such as counting down the end of a match, does the relative style update the time every second?


|U03HHJ4LRU2|:
The system will update your relative date text every second, or with whatever fidelity is needed for the current style

|U03HHJ4LRU2|:
That way, you can get secondly updates with only a single timeline entry

|U03JRR4R3CY|:
Great, thanks :slightly_smiling_face:

|U03JRP87THN|:
So the lock screen widgets can get updates every second if needed?

|U03HHHJT28K|:
Relative time will update every second if it’s showing seconds, without needing the widget itself to update.

|U03JRP87THN|:
Thanks!

|U03HHHJT28K|:
Same updating applies to the new ProgressView option.

--- 
> ####  To apply a background to a widget, we use an AccessoryWidgetBackground() view inside a ZStack? Also, does it work for accessoryRectangular widgets?


|U03HHJ4LRU2|:
Yes, a `ZStack` is the best way to use it! It does work on rectangular and corner as well.

|U03HKV0T82Y|:
You got it… exactly what you said.

|U03JRP87THN|:
Thank you!

|U03HHHJT28K|:
If you use it in a `.background` then the size of the view it’s applied to will be the size of the background too. Which can be smaller than the size of the widget.

--- 
> ####  Are widgets able to be made transparent, I know in the past it was not possible to have transparent widgets that were not built in.  I see that lock screen widgets take on transparency but I am not sure about home screen widgets.


|U03HHHK57K5|:
No changes to how home screen widgets are rendered this year.

--- 
> ####  I noticed that users can choose in Settings whether they want widgets to be redacted when the device is locked, similarly to notifications. I looked in my iPhone’s Settings and couldn’t find this option (I guess I just missed it); where is it?


|U03HHJ4LRU2|:
It's under Settings &gt; Face ID &amp; Passcode &gt; "Allow Access When Locked" section

|U03HMBY0SDV|:
Oh, found it! I guess that does make sense in hindsight :sweat_smile:

|U03HMBY0SDV|:
Hmm, when I wake the device after turning that switch off, it seems like the widget content is visible on the Lock Screen for a split second before being redacted as expected. I assume that should be reported as a bug?

|U03HHJ4LRU2|:
That sounds like a bug! Yes, please file a feedback!

|U03HMBY0SDV|:
Alright, done! FB10078325

--- 
> ####  Has the update policy for Complications/Widgets changed or is it still a minimum of 15 minutes?


|U03HHHK57K5|:
It has not changed for WidgetKit but is slightly different from ClockKit (for Complications). ~15 minutes is about right but please see this article for more details <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>

|U03HKV0T82Y|:
Ideally you wouldn’t want to update your widget all that frequently

|U03HHJ4LRU2|:
You can provide timeline entries at a higher frequency than 15 minutes, but there is a quota on timeline reloads.

|U03JELPN197|:
Thanks :raised_hands:.

--- 
> ####  Does WidgetKit get more refresh quota / frequency / budget on macOS this year?


|U03HKV0T82Y|:
No changes

--- 
> ####  How can we reduce the update frequency for widgets? For example, if we know a widget wouldn't update every 15 minutes, but hourly, or even daily.


|U03HAV8SRHC|:
Great question! You can implement a custom TimelineProvider to control this. You can find more details under “Generate a Timeline for Predictable Events” in this article.

<https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>

|U03JRP87THN|:
Thank you very much!

--- 
> ####  Is it somehow possible to sync data from an Intent on the iPhone to a Complication on the Watch "on the fly"? If I would add something with an Intent, a new Donut for example, on my Phone, could you then somehow trigger an update of a Counter Complication on the Watch?


|U03HKV0T82Y|:
Are you saying you’d like to sync user selections of intents between phone &amp; watch?

|U03HKV0T82Y|:
That’s not possible, but seems like a good idea! Please file some feedback!

|U03JELPN197|:
The user of our app are using Phone and Watch a lot, and we have Complications / Widgets for Calories, Activities, Steps and more. Sometimes they track Activities on the Watch, sometimes they add Food on the Phone. The user expects that if the add something on one device that the Widgets / Complications update instantly on their other device.

|U03JELPN197|:
And ofc we already have Siri Intents to add Foods for example

|U03HHJ4LRU2|:
You can use WatchConnectivity or other data sync frameworks to ensure that both devices are able to communicate their inputs. Your watchOS and iOS apps can both request the widget to get reloaded after the data syncs between the two

|U03HHJ4LRU2|:
The WidgetKit framework doesn't provide any utilities to help sync data or entries, though. That'll need to happen as part of your app.

--- 
> ####  Is there a way to change the precision of the Text.DateStyle in Text(Date(), style: .timer) so it doesn't display seconds, for example?


|U03HHHK57K5|:
There isn't currently a way to do that. Please file a Feedback as it's a great suggestion!

|U03HVDDBP0W|:
Thanks, will do!

--- 
> ####  How to ensure widget content up-to-date based on data synced from CloudKit or WatchKit in the background?


|U03HHJ4LRU2|:
After you have new data sync'd, you can request that the system reloads your widget timelines with `WidgetCenter.shared.reloadTimelines(ofKind: ...)`

|U03HHJ4LRU2|:
Check out <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>

|U03JELT4UC9|:
It does refresh eventually, but the system decides when.
However, before refresh happens, the content has become irrelevant to the user

|U03HHJ4LRU2|:
It's typically pretty immediate, unless you've exceeded reload quotas. Please file a feedback if you don't believe that's the case, we'd be happy to look in to it.

|U03JELT4UC9|:
Sure, will do

--- 
> ####  How does a user decide when they want the content on a widget to be redacted? Can this be configured per widget?


|U03HHJ4LRU2|:
Users can specify that they want all widgets redacted or not on iOS under Settings -&gt; Face ID &amp; Passcode. Complications can be individually configured on watchOS under Settings -&gt; Display &amp; Brightness -&gt; Always On

|U03HAV8SRHC|:
Applications can also specify settings for your app and then set redaction in code, on or off. This would allow you to provide your users with fine grain control if required.

|U03HKV0T82Y|:
see `.privacySensitive`, we mentioned it near the end of the talk

--- 
> ####  Is there a time limit for networking and processing when reloading Widgets / Complications?


|U03HHJ4LRU2|:
Yes, there are limits. You can use background download tasks to save runtime. The system will carry out your network request and wake your extension again once it's completed.

|U03HHJ4LRU2|:
There's more details on <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>

|U03HKV0T82Y|:
There is a finite time limit for your extension to give back a timeline, too

--- 
> ####  Hello. Is there any way we could create an analog clock complication/widget using ClockKit/WidgetKit? Does the system allow us to ask for updates every minute?


|U03HHJ4LRU2|:
You can create a widget with minute and hour hands in WidgetKit for sure! You'll want to specify a once a minute timeline when your extension is asked for a timeline to make sure your time stays up to date

|U03JPJ277SQ|:
There’s something I’m still not clear about. You’re saying that I can provide a timeline with data at every minute?
How’s this not hitting the system update budget? I saw you answered something about this in some other question. <@U03HHJ4LRU2>

|U03HHJ4LRU2|:
The budgeting cares much more about the runtime your extension gets (and therefore the amount of times you reload your timeline), not the number of entries you provide. Something like a clock is _highly_ predictable, so you can provide many entries in a single wake of your extension.

|U03JPJ277SQ|:
That’s great. Thanks.

|U03HVF46TEJ|:
Is there a limit to how many entries we should put in a timeline or a limit on how much processor time we have to return a timeline? In the past, I've tried to return a timeline with per-minute updates but any more than around 100 entries/minutes will fail.

--- 
> ####  Hey all! I'm new to Widgets so apologies if this is simple. Can I create a widget that relies on user location, as well as the new WeatherKit API? I'd like to show some weather data for user's current location


|U03HKV0T82Y|:
Yes, widgets can use location: <https://developer.apple.com/documentation/widgetkit/accessing-location-information-in-widgets>

--- 
> ####  It seems like the Link/.widgetURL rules for the new Accessory widget types follow the same as the existing .systemSmall family, is that correct?


|U03HHJ4LRU2|:
Yes! Accessory widgets don't support embedded tap targets, just like systemSmall

--- 
> ####  Thanks for your previous answer. What options do we have at our disposal to make our widgets look more live? I’ve already been using `.timer` in `Text` . Is it possible to use such feature in any other form? Is using TimelineView allowed in WidgetKit? What is the rate limit of updating widgets using the timeline? How many items could we provide in the widget/complication timeline?


|U03HKV0T82Y|:
Sorry to simply throw you at docs, but this is a great read all about timelines! <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>

|U03HKV0T82Y|:
Rates are limited due to power budget.
As well as `.timer` there’s `.relative` for a different text output

--- 
> ####  Are there _XCWidgetFamily equivalents for the new .accessory widget families, for use while testing out the new widget types?  Right now I find myself having to constantly lock and unlock my phone every time I build&amp;run.


|U03HHJ4LRU2|:
Not at the moment. We're actively tracking this

--- 
> ####  I've been having so much fun playing with lock screen widgets! Is there a way to make the text in `Gauge(...) { ... } currentValueLabel: Text("here") }` shrink if it gets too long? Most of the time my data is 4 digits (i.e. 100W) but it could be longer (i.e. 1,200W) in rare cases. It would for it to shrink if it get's too long!


|U03HHHJT28K|:
Please file a Feedback for this. It’s a great suggestion!

--- 
> ####  If a widget displays EventKit data, are the timelines somehow automatically updated when there's a change in EventKit? If not, how can an app keep the widget up-to-date? Thanks!


|U03HHJ4LRU2|:
Nothing will change automatically, but if you know that your data has changed, you can use `WidgetCenter.shared.reloadTimelines(ofKind: ...)` to reload your widget content.

--- 
> ####  It seems like .widgetAccentable serves a similar role as the clockkit .complicationForeground modifier. Are there situations where you'd need to use both? or if we migrate our complications to widgetkit would we switch over to .widgetaccentable?


|U03HKV0T82Y|:
widgetAccentable is the replacement for complicationForeground, they do the same thing

|U03HHJ4LRU2|:
You should still use .complicationForeground() in ClockKit and .widgetAccentable() in WidgetKit. They serve the same purpose, but there's no guarantee that they won't diverge under the hood.

--- 
> ####  Follow-up question on EventKit. It may happen that a certain event is changed in another app. For instance the user edits an event inside the system Calendar app. I assume there’s no way we can get notified of this change while we’re in the background to update our app’s widget?


|U03HHJ4LRU2|:
There isn't a mechanism for this at the moment, as far as I'm aware. I think something to enable this would be a great enhancement though! Please file a feedback :slightly_smiling_face:

--- 
> ####  Is it possible to tint capacity gauge with a gradient? `Gauge(...).gaugeStyle(.accessoryCircularCapacity).tint(Gradient(...))` It seems to only pick the first color and tint it with just that color. Is that expected or a bug?


|U03HHHJT28K|:
Certain styles only use a single color. Please file a Feedback with your use case if you need to use a gradient.

--- 
> ####  Is it possible to share a widget extension between multiple platforms? I'd like to reuse the same widgets on iOS, macOS, and watchOS.


|U03HKV0T82Y|:
You’ll need separate Xcode targets, but you can share code between them.

|U03HKV0T82Y|:
This shows us doing this across iOS &amp; watchOS: <https://developer.apple.com/videos/play/wwdc2022/10050/>

--- 
> ####  Hi, we have an app which currently supports both a watch app with complications and a widget.  If I do nothing and build my app with Xcode 14 will then my watch complication code stop working since my app has a widget extension?  So I need to migrate over to use widget kit for my complication?


|U03HHHJT28K|:
You will need to create a watch specific widget target first.

|U03HHHJT28K|:
But once you do, we will stop asking for updates to your ClockKit complications and only update your WidgetKit ones.

|U03HHHJT28K|:
The talk tomorrow _Go further with Complications in WidgetKit_ goes into more detail.

|U03K2PYH95E|:
Okay thanks. I will check it out.
But basically if I do nothing then my old logic using ClockKit will continue to work then?

|U03HHHJT28K|:
yep!

--- 
> ####  Is it possible to achieve custom date representations, or are you limited to the available style options like .date, .time, and .relative? For example I'd like to show text that reads Due today or Due tomorrow or Due in 4 days or Due next week etc, so custom logic based on today's date in comparison to another date. If not, is it correct the other solution would be to create separate entries at the right times those different formats need to change? Thanks!


|U03HKV0T82Y|:
The auto-updated timer &amp; relative text are handy, but if you have something due “in 4 days” then I’d create timeline entries to update those, since that text isn’t changing frequently. Maybe switch to .timer when the time is getting close

|U03HKV0T82Y|:
I think I echoed your “other solution” there :slightly_smiling_face:

--- 
> ####  Are there best practices our guides available (or plan to be soon available) for writing tests for Widgets, either UI tests or unit tests?


|U03HAV8SRHC|:
Hi Jim, my recommendation is to follow best practices around unit testing and target the logic specific to your widget. Since rendering, etc… is up to the system and it’s a bit difficult to UI test I would recommend focusing on UTs.

I would recommend reaching out to <https://developer.apple.com/wwdc22/topics/swiftui-ui-frameworks/#current|SwiftUI> to see if they have any recommendations if you want to dig more into UI testing.

|U03HL5H29CL|:
Yep! What <@U03HAV8SRHC> said!

|U03HL5H29CL|:
UI Testing for system components will require use of the XCUIApplication initializer that takes a bundle identifier which you can reference here: <https://developer.apple.com/documentation/xctest/xcuiapplication>

--- 
> ####  I have a widget that shows a value driven by a web socket. Is the best approach for `getTimeline` to open the socket, fetch the value, and return a single entry? Is there a more efficient way to do this?  I know the frequency the web socket will update the value. Can I tell the system to ask me again in x seconds? It's not that important that it's super up to date, but it would be nice to set a minimum interval of a minute or two.


|U03HKV0T82Y|:
Hi Samuel. Since you know when the value will change, tou can have the system reload your timeline by using the after(__:)_ refreshPolicy
(See <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>)

|U03HKV0T82Y|:
Be aware that if you try updating your widget every minute or two, you will likely use up your refresh budget quickly, and the widget will stop refreshing

|U03HKV0T82Y|:
There was a video from WWDC 2021 that went into budgets a little more, check it out!

|U03HHJ4LRU2|:
I'm not very familiar with web sockets in particular, but you can also use background URL sessions to have the system carry out network requests and wake your widget when it has been completed

|U03JR73TEKX|:
Thanks <@U03HKV0T82Y> and <@U03HHJ4LRU2>! I’ll definitely check out that session from last year. The lock screen got me excited to make a widget for the first time. So amazing they mostly just work on all of the platforms!

I was just reading about the background networking stuff. It seems like I won’t be able to use web sockets for that. I’ll have to see if there’s a way to download the data using a background session instead.

Thanks again!

--- 
> ####  AccessoryWidgetBackground() seems to have the same layout attributes as a regular SwiftUI color (fills whatever space it is given), are there any special layout considerations we should take when using it?


|U03HHJ4LRU2|:
Nope, it's very much like a color! I think we'd generally recommend against filling the whole background on rectangular, only place it behind content that really needs it there.

|U03HZ5HSU3F|:
Great, thank you.  It also seems like ContainerRelativeShape() wouldn’t be appropriate in the .accessoryRectangular as the container is rectangular, without a rounded border.

--- 
> ####  Is there some way for a widget extension to ask for data from the host application?  We have an api client in our normal iOS app which has accessToken logic. So it knows if it is authenticated and it can refresh the token.  Now I want my widget extension to be able to also fetch new data when it gets reloaded. What is the common approach here?  Do I need a separate api client for the widget extension with its own separate token? Or do you recommend to use the same token and share it.  Or can the widget request data from the iOS app directly?  Thanks


|U03HKV0T82Y|:
That’s a great question!
Typically the extension doesn’t request data from the app. Instead, the app would know there’s new data, and tell WidgetCenter to reload the widgets. The app could have saved data to the file system (shared app container) for the extension to read from &amp; display

|U03HKV0T82Y|:
It sounds reasonable to alternatively have the app save out the access token and then have the extension do the networking.
Just be sure that the extension can respond to getTimeline() in a reasonable timeframe (seconds)

|U03K2PYH95E|:
Okay thanks. I was just interested if there was something similar to WCSession for WidgetKit.

Our use case is that we show the status of your car in the widget. Like if it is locked and the current range etc.
And we want this data to be up to date when the user looks at the widget. And the user might not open the iOS app for some time.

So then I guess we have 2 options.
Either make a push notification to iOS app when the state changes and have it update the shared data for the widget.

Or have the widget update itself regularly and then build some api client into it.

--- 
> ####  Before I download the beta… is there an option to revert to iOS 15-and-earlier style lock screens that take up the entire view?  Some of us don’t put people on the lock screens, but landscapes or architecture, and we don’t mind notifications taking up the whole view.  In some countries, particularly where Islam is the dominant religion, putting someone’s face on the phone would be grounds for chastisement or arrest, so they're not going to find this new view terribly useful.


|U03HHJ4LRU2|:
You can select any picture, just like before! There's many different lock screens, not just photos - like the Astronomy and Emoji lock screens

|U03HVCWP48N|:
Not really what I was asking.

|U03HVCWP48N|:
Can the notifications be set to fill up the whole display rather than be stuck at the bottom (the way it used to behave in iOS 15 and earlier)

|U03HVCWP48N|:
<@U03HHJ4LRU2> - any comment?

|U03HKV0T82Y|:
I think you should try out the beta and see what you think! If you still have feedback, go for it

|U03HVCWP48N|:
…would you send me a test device for free?  :smile: Some of us don’t have that luxury so I was hoping for a straight yes or no answer whether the option exists in beta 1 :slightly_smiling_face:

|U03HVCWP48N|:
I *might* have that option later this summer, but not now.

|U03HAV8SRHC|:
Hi Bradley, there are options in Settings -&gt; Notifications -&gt; “Display As” which will allow you to select the following options

• Count
• Stack
• List
List should give you the notification behavior you are looking for.

|U03JHQ4K125|:
They will still stack from the bottom in List (which seems to be behaving a bit weirdly, but it's only Beta 1, so I'll file feedbacks :slightly_smiling_face: ), but to be honest I find it way easier to reach them that way

--- 
> ####  If we send a push notification to our iOS app whenever important state changes, and the iOS app then call widgetkit to update our widget, does this update call then decrease our widgets update budget?  Our does it stay unaffected since the iOS app called the update function?


|U03HKV0T82Y|:
I believe your budget is not affected by recent notifications. If you feel it should be, please provide feedback.
If your app is in the foreground then you’ll get reloads that are not subject to the budget.

--- 
> ####  I didn't see any specific guidance in the new HIG for the .accessory type widgets, should we mirror the guidance shown in the Complications area for the equivalent Rectangular/Circular/Inline types...or will there be a subsequent update to the HIG with guidance for these new widget types?


|U03HHJ4LRU2|:
Yes! You should follow the HIG for Complications with these accessory widgets as well. They have the same intent. Keep an eye out for updates to the HIG in the future

--- 
> ####  In my iOS home screen (&amp; now lock screen!) widget code, I've been trying to exchange data with other users that have my app, by listening/scanning via Core Bluetooth, then sending characteristics back &amp; forth.  I'm wondering: how can I ensure that other iPhones that have my app installed, show up in this scan, even if the app isn't in the foreground on those devices? How can I schedule these "periphery" apps to also awaken, advertise they are my app users &amp; exchange data, all while the apps are either backgrounded or just using scheduled widget runtime? (imagine all the app users have their iPhones on, in their purse, and all my code has is widget scheduled runtime to exchange data)


|U03HKV0T82Y|:
Doing this in your extension seems like a bad idea – your extension could be running for only a short time and then killed by the system once we have the timeline. There’s no way to predict when it or other devices extensions are running.

|U03HKV0T82Y|:
A good resource would be to request an appointment in the Developer Technical Support Open Hours lab. They offer two chances a day (9-11am, 2-4pm)

--- 
> ####  Hi, when my widget updates after a new timeline event triggered, is it then possible to trigger a local notification which would trigger code in my host iOS app to run?  Maybe so that I could have the iOS host app record some analytics or something.


|U03HHJ4LRU2|:
No, but you can write your analytics to disk in a shared container with your app, and have your app read that and report it when it runs

--- 
> ####  how many different small widgets can we support on the lock screen, and what is the max number of widgets allowed? can users also create multiple widgets like they do now?


|U03HKV0T82Y|:
The Lock Screen can be configured by users to show four (circular) widgets under the time, and one (inline) above

|U03HKV0T82Y|:
So that’s a maximum of five widgets on the lock screen

|U03J20VMS74|:
is there a limit we are allowed to provide like how we can only have 5 different home screen widgets?

|U03HKV0T82Y|:
Your app can provide many many widget kinds!

--- 
> ####  Is it safe to explicitly write the init method of a TimelineProvider and place code in there? Or would you advise against this? The reason for that is to make sure that the code is called at least once before a TimelineProvider life cycle method. The alternative would be to call this code in all three life cycle methods.


|U03HHJ4LRU2|:
This is technically safe to do, but your TimelineProviders may be created and not queried - if they system is querying what widgets you have available, for example, we'll create all your widget configurations, which then create your TimelineProviders. We may not be fetching your widget timelines then, so you'd be fetching your data and spending some of your runtime budget unnecessarily.

|U03HHJ4LRU2|:
I'd recommend waiting until the timeline fetching methods are called to load the needed data. You can certainly cache it to avoid redundant loads between requests, though!

|U03JG18LGAG|:
The background of the question is not about data loading but about accessing CoreData. Before  reading/writing to it we need checked if a migration is necessary and if it is, then perform it.

|U03JG18LGAG|:
So would you recommend to better check (and migrate if necessary) explicitly in the getSnapshot and getTimeline method?

|U03JG18LGAG|:
Or am I overthinking this? Would it be sufficient to only check for the migration in the getSnapshot method, if it is always called before the getTimeline method?

|U03HKV0T82Y|:
I don’t see why init isn’t a totally reasonable place to do that.

|U03JG18LGAG|:
Maybe it could become an issue if in future releases the TimelineProvider implementation and system usage is changed? So when it is not the default *init*() anymore but with e.g. other parameters.

|U03HHJ4LRU2|:
I think getSnapshot and getTimeline would be the right place to do those - don't assume a guaranteed order between them though, you'd want to check in both methods. In general, avoid work specific to providing views in your `init`  and wait for those methods to be called instead. Your TimelineProvider may be created much more often then it's actually asked for views and entries.

--- 
> ####  The .accessoryInline family appears to always override whatever font/size values have been applied to the Text elements it contains.  Are there any ways to customize the appearance of these elements?


|U03HHHJT28K|:
The `Inline` family is designed to match the look and feel of the system.

--- 
> ####  What is the best way to provide an async timeline? For instance, when fetching locations, I pass the completion block to the success methods of location manager. Is this a good practice?


|U03HHJ4LRU2|:
That's the way to do it! We provide the completion block so that you can call it asynchronously whenever you're ready

|U03HHJ4LRU2|:
I'd make sure that you call the completion block in all cases, not just success. You'll burn through your runtime budget if you never call completion

|U03JPJ277SQ|:
I don’t remember the exact error message correctly; but on macOS, I sometimes get an error that I’m calling the completion blocks more than once. I mostly believe that’s not true though. I don’t get a similar error on iOS and by checking the <http://Console.app|Console.app>, I’ve seen the Weather widget on macOS crashes the same way as mine. 

|U03HHJ4LRU2|:
Hm, strange. It could be that the framework providing you data has differences in behavior between the platforms. If this really seems erroneous, please file a feedback!

--- 
> ####  For analytics purpose is there a way from the main app I can know the user have widget installed? or I have to write something in the share container and read it?


|U03HKV0T82Y|:
Have a look at WidgetCenter’s <https://developer.apple.com/documentation/widgetkit/widgetcenter/getcurrentconfigurations(_:)>

|U03JQ7PU1L1|:
I thought this API just return all the available widget types, not the one being installed.

|U03HKV0T82Y|:
It gives a list of user-configured widgets

--- 
> ####  Do I understand correctly the widget only ever is running executing code when it's getting new timeline entries? I'm wondering in the context of CloudKit + Core Data sync, which does occur in the widget, I'm trying to determine when that can happen. For example, if I schedule a week's worth of entries, it won't be run again (and thus won't sync) until it needs to get more entries right?


|U03HKV0T82Y|:
Not just timelines, we want a snapshot and a placeholder too. Other than that, yes, your extension isn’t running or instantiated any other time.

|U03HKV0T82Y|:
<https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date> and look at “refresh policy”. Also see WidgetKit’s WWDC 2021 talk.

|U03HMCT187R|:
Thanks!!

|U03HKV0T82Y|:
An extension is a teeny tiny part of your app that we can quickly load up and get info from, without having to launch your entire app to get the data. The whole idea is to avoid loading &amp; running as much as possible, to save battery. So yeah, we’ll only spool up your extension when absolutely necessary!

--- 
> ####  Thinking about a home audio setup. Is there any option that would allow me to reload my widget more often (songs can change every 3min) or reload the widget, when the Homescreen is shown to the user?


|U03HAV8SRHC|:
Hi Alexander, fantastic question! There are a few cases where WidgetKit does not count reloads against your widget’s budget. One of those is if the widget’s containing app has an active audio or navigation session.

|U03HAV8SRHC|:
This link has some more in depth info on how this all works: <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date>

|U03HZ3WBQBX|:
Thanks for the feedback. That is some good information and I hope I can use that :slightly_smiling_face:

--- 
> ####  [Follow-up] What is your recommended approach for CoreData migrations when CoreData is used in the main app and shared with the widget via app groups. Where would you recommend to handle the migration check? Because before each access to CoreData it has to be checked if a migration is available and if so, the migration has to be performed. In my understanding it can happen after an app update with a new CoreData model that the widget accesses CoreData before the app has been launched.


|U03HKV0T82Y|:
You’re right that the extension could be called before the app is, after an app update.
So yes your CoreData layer would have to be prepared to migrate whether called from your extension or app
An alternative would be for the app to write out a simplified version of the data to JSON (say) for the widget extension to render from

--- 
> ####  Do we need to request Always Authorization to get the location in WidgetKit on watchOS? Scenario is when we have to provide the timeline we need to fetch the current location.


|U03HHHJT28K|:
The same location authorization strategy applies to both watchOS and iOS. And both sides will have to request separately. <https://developer.apple.com/documentation/widgetkit/accessing-location-information-in-widgets>

|U03JN2004TY|:
Ah ok then WhenInUse might work just fine (which we use for iOS Widgets)

|U03HHJ4LRU2|:
The widget gets "In Use" authorization when it's on the active watch face

--- 
> ####  Can Combine be used to handle the asynchronous tasks for getSnapshot or getTimeline? I am asking because Combine needs to store a reference to the AnyCancellable and I think this is not possible because the TimelineProvider struct is a value type (so it cannot have a mutable property).


|U03HHJ4LRU2|:
Even though your struct isn't mutable, you can create a class at init that it references. You can then mutate that and have it hold on to your AnyCancellable

|U03J7BAGWFJ|:
`IntentTimelineProvider` and `TimelineProvider` is a protocol, so you could have it implemented as a class instead of a struct.

|U03JG18LGAG|:
Is it safe to implement the TimelineProvider as a class? I am wondering because in every sample code that I have seen it is always a struct.

|U03J7BAGWFJ|:
If you do use a class, you should be careful about any state you set for sure.  The intent with the methods on the provider are to be stateless, so it matches better with a struct in that sense.

|U03JG18LGAG|:
Maybe it does even make more sense to use a class then. Because if the same instance would call the getSnapshot or getTimeline again and the previous asynchronous combine call would not be finished yet, then it could be cancelled before starting a new one.

|U03J7BAGWFJ|:
Well do keep in mind the configurations of the Intent across calls could also be different, so keep that into consideration as well.

--- 
> ####  For users with multiple widgets of the same app installed, can the app developer somehow do the work of reading widget data from disk once and use it to generate all timelines for all widgets at once?  Or maybe, could the widget extension be notified that it's about to start generating timelines and when it has ended, so we can prepare this info for all widget timeline generation within that time frame?  Thanks!


|U03HHJ4LRU2|:
You can certainly have a data model outside of your timeline providers that is shared between them, like a singleton. It can cache everything you need after the first load so that multiple widgets will benefit from whatever preparation it has done. After your widget content has been fetched, the extension is typically terminated, so there's no need to watch for a notification that it has ended to free up your resources

|U03HMEM4TM5|:
Is it guaranteed to be terminated, though? I wouldn’t want to exhaust the widget budget

|U03HMEM4TM5|:
(or worse, hold on to a SQlite database transaction that prevents the app from checkpointing)

|U03HHJ4LRU2|:
It's not necessarily terminated, but the process is suspended shortly after the last timeline fetch occurs. I think your best bet is ensure your transaction has closed and flushed before calling completion on the timeline methods

|U03HMEM4TM5|:
The problem is, closing the transaction is the thing that is required to happen after all other readers are done. The transaction is what enforces consistent caches that can be reused across different widgets

|U03HHJ4LRU2|:
Hm, I see. I'm not sure that I have enough context on SQLite to be very helpful. I'd suggest maybe reading all the data you need in to memory upfront and closing your transaction afterward, but that could also be costly depending on the amount of data.

--- 
> ####  What is the memory limit for the Widget Extension? Can we embed crypto frameworks? What could be the best approach to ensure security when we need to decrypt content before displaying it inside a Widget?


|U03HHHJT28K|:
The memory limit will be different for different devices and platforms so there is no hard answer.

|U03HHHJT28K|:
You can link any iOS framework you want to your binary.

|U03HHHJT28K|:
The Widget views are created and stored by the system before the widget is displayed.

|U03HHHJT28K|:
You can specify the Data Protection Class using an entitlement. <https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_default-data-protection>

--- 
> ####  On the iOS Lock Screen, is the Inline widget supposed to be configurable? If not, what data do they use?


|U03HHJ4LRU2|:
You can long press on the inline slot to configure it. We're actively tracking discoverability and making this interaction easier!

|U03HVF46TEJ|:
Ah okay! Does that work at all in Beta 1? It doesn't seem to but maybe I'm not doing the right thing?

|U03J7BAGWFJ|:
I think there are some bugs there, yes.

|U03HHJ4LRU2|:
It works intermittently, your mileage may vary. You can use previews in the mean time to test our your intent-based inline widgets!

|U03HKV0T82Y|:
If you’re in the editor, you can long press if you hold near the center of the inline area. It’s intermittently working and in we’re working on it

|U03HVF46TEJ|:
:+1: 

--- 
> ####  Hi there! Really loving the new lock screen widgets.  How can I preview them on the lock screen using Xcode previews?  I can change the family to one of the lock screen ones via .previewContext(WidgetPreviewContext(family: .familyHere)), but I didn't find anything on how to make it appear on the lock screen like in the preview that appears in Complications and widgets: Reloaded.


|U03HHJ4LRU2|:
This didn't make it in to seed 1, but should be in a future seed.

|U03JRP87THN|:
Oh, okay! Thanks!

|U03JHQ4K125|:
If I may add, don't worry if the small widget looks a bit too big and ends up cropped in the small previews, it works fine on a real device.

|U03JRP87THN|:
Ok, thanks!

--- 
> ####  Am I correct in understanding that `.widgetAccentable()` is limited to single concrete `View`s whose `body` return type is also always a concrete view? No `Group`s, no stacks, `ViewBuilder`s, etc.? On a instance of a`View` whose root is a `ZStack` I’m getting `Value of type 'ExampleView' has no member 'widgetAccentable'` and I think I’ve also seen `Value of type 'some View' has no...`


|U03HHJ4LRU2|:
This is intended to work on any View. I'm seeing it work on containers, I'd double check your syntax or try it again in a isolated test. Please file a feedback if you're still encountering issues!

|U03HHJ4LRU2|:
Make sure you import WidgetKit in to the file as well, this modifier doesn't live in SwiftUI proper

|U03KC4368BS|:
Ooh, not importing WidgetKit might have been it. It's good to know what it's intended to work on. Thanks!

--- 
> ####  Are there any plans to document the size of the widgets on the Lock Screen in the HIG? The sizes of the Home Screen widgets are documented but the Lock Screen widgets are missing. Also, any chance you can share the sizes of the Lock Screen widgets with me?


|U03HHHJT28K|:
Keep an eye out for updates to the HIG regarding widgets in the future.

|U03HZ4EJJ05|:
Will do! Thanks for your reply.

--- 
> ####  Can the new widget families that support the Lock Screen be tested in a simulator or with SwiftUI previews, or do they require a physical device?


|U03HKV0T82Y|:
Sure! You certainly can. Additionally, you can pull down on the Home Screen to reach Notification Center, which shows the same widgets

|U03HHHJT28K|:
And as for Previews, we just answered that a couple minutes ago here <https://wwdc22.slack.com/archives/C03HR2EV9DX/p1654884644256969>

|U03J20E7UBV|:
Thank you, <@U03HHHJT28K>!  I just saw that other question, too, lol.  Thank you!

--- 
> ####  Is it possible to support lock screen widgets both on iOS and WatchOS but without having a proper WatchOS app, while just providing WatchOS users those widgets?  Sorry if that question was covered, couldn't find it.


|U03HHHJT28K|:
For Widgets on watchOS you will need to embed the extension into a watch app

--- 
> ####  Is there a way to use `.widgetAccentable()` on say, a particular element of a Chart? I’ve not gotten super deep into it yet, but I haven’t found a way to actually access the `View`s it generates from all of the marks and such we give it.


|U03HHJ4LRU2|:
If you can't access the Views, then I don't believe there's a way to accomplish this. Please file a feedback!

--- 
> ####  Is this a bug? Whenever I run a widget extension without supporting any home screen widget families, a .systemSmall widget briefly appears on the home screen (or sometimes persists). I filed a feedback (FB10118823) but wasn't sure if this is a bug. Video here: <https://twitter.com/samrshi/status/1534723216136192000?s=20&amp;t=hk1CCfdOQbMpfoJl9MFxPQ|https://twitter.com/samrshi/status/1534723216136192000?s=20&amp;t=hk1CCfdOQbMpfoJl9MFxPQ>


|U03J7BAGWFJ|:
Thanks for the feedback!  Yes, this is a bug.

|U03K05YAUHE|:
Perfect. Thanks!! I haven’t verified on a physical device, but for some extra context, this was demoed with:
• Xcode-beta Version 14.0 beta (14A5228q)
• iPhone 13 Simulator Version 14.0 (982)

--- 
> ####  Is there a maximum (or recommended max) size for a timeline, or is it more of a time limit for timeline generation?   I have a widget I update every minute, so I could in theory make a timeline with thousands of entries. In practice, I am only able to *reliably* make a timeline with around 150-200 entries. Is that an actual limit somewhere? I know there’s a limit on how long we can take generating a timeline, but for a simple widget the difference between 200 entries and 500 is negligible. Maybe it’s memory?   (Fun bonus complication: I have to limit my Mac widget to 100 entries because it seems to fail or “get stuck” way more often — does macOS actually have lower limits for widget timeline generation? Or maybe the process is way more throttled and thus more likely to time out?)


|U03J7BAGWFJ|:
Hi Christopher.  Yes, there are limits.  You should be able to have as many entries as you’d like, but be aware of the content that’s contained within them - if they each have unique and different images, you may find that the number of entries you can use are more limited.  Essentially it’s limited by the overall size of the final content that’s generated.

There are also time constraints on generating content that we place on widget authors.  The more entries you have (ie. 1000), the more likely you are to run into constraints against the time allotment of generating your timeline.

|U03HVF46TEJ|:
Thanks. Is there a way to tell what limit(s) I'm hitting? In the debugger, remotely, anywhere?

|U03KC4368BS|:
<@U03J7BAGWFJ> Interesting. I am generating a few images using UIGraphics, but I am then caching them in-memory and reusing the same UIImage on subsequent entries. Would WidgetKit consider those "unique and different" images since it's not caching SwiftUI.Image or an Asset?

|U03J7BAGWFJ|:
We dedupe images where possible for efficiency.  There are scenarios where we do and where we don’t.  As long as you’re referencing the same image, I would expect things to behave as you’d expect.

--- 
> ####  What's the advisable/best-practice approach to passing data (immediately on call) from the main iOS app to home-screen or lock-screen widget, for immediate display/reflection?  What's the best way to access the same (large, added by folder reference rather than asset catalog) folder of images without "Copy Bundle Resources" in Xcode project Build Phases? It's added as a blue folder to main app, but paths to those images don't locate the image by the same NSBundle NSURL from Widget extension code.)


|U03HKV0T82Y|:
You should have your app &amp; extension belong to the same App Group, at which point they can share a data container for file system access. Your app can write to disk (sqlite, json, …) and ask WidgetCenter to reload your widgets. The extension can read that data on disk to create the widget UI

|U03J07GGVDK|:
Thanks. :pray:
For the shared image folder, if I’m building the directory path to an image file like this in the app main bundle: `"FolderName/\(face)/\(color)/_\(suffix)"`  do I need to prepend something like ~/ or ../.. in front when trying to load the same image from the extension?

|U03HKV0T82Y|:
I think you can specify the bundle UIImage(named: inBundle:). Or you could have a shared framework that contains the assets. Or maybe you need NSFileManager’s containerURLForSecurityApplicationGroupIdentifier: ?

--- 
> ####  Some of the built-in Lock Screen widgets are extremely low contrast and hard to read. Is that something likely to be tweaked in upcoming betas?  Regardless — are the opacity values we use in our widgets affecting the final appearance or does the system take full control? Is 100% opacity possible with these “vibrant” appearances? 


|U03HHJ4LRU2|:
Please try to use opaque fill colors and text as much as possible! You can provide contrast between your own layers with varying greyscale values. Our own first party widgets were not updated to follow this guidance in time for seed 1, so don't follow their example.

We are actively investigating contrast and legibility issues. It's intended that any opaque color is legible. The system treatment to your content may change

|U03HVF46TEJ|:
Thanks, good to know! So generally we should stick to Color.primary and .secondary for everything?

|U03HHJ4LRU2|:
`Color.secondary` resolves to a transparent white at the moment; we're investigating if there could be some improvements to make this easier. The accessory Gauge, for example, uses .white for the dot and .black for the track.

|U03HVF46TEJ|:
Oh right, we use all shades of gray. Thanks!

|U03HVF46TEJ|:
And for the record: it would be super useful if Color.secondary resolved to some a standardized opaque gray we should use for “secondary” content, especially because that makes code sharing with full color widgets easier. 

|U03HHJ4LRU2|:
That does sound like a great idea :slightly_smiling_face: If you could file a feedback for that and send me the number, that'd be greatly appreciated!

--- 
> ####  Widgets sometimes fail to update — they get “stuck” on an old value, they turn black, etc. Common non-crash causes (that I know of) include timeouts and using too much memory. What’s the best way to catch and log these problems? Are they logged as crashes or performance issues to App Store Connect? Are they on my device in the Console or logs?


|U03HKV0T82Y|:
You should be able to tell in Console. If things are black it usually means a crash either on us on our end, or in the extension and we’re unable to read any views from it.
Be aware that images are newly restricted in size now – to about the same dimensions as your widget. Unlimited image sizes were causing issues before, so we’ve capped them.

|U03HVF46TEJ|:
“Newly” as of when? iOS 16 or 15.something?

|U03HKV0T82Y|:
the 16 beta

--- 
> ####  Is there a way to request that a widget's timeline only be updated when the device is unlocked, without also redacting the widget contents when the device is locked?  Here's a feedback about this: FB10163412


|U03HHHK57K5|:
There's no way to do this currently but it's a great idea! Thank you for filing the feedback.

|U03HKV0T82Y|:
Curious what the use case here is

|U03JJ2ZPFTK|:
It's an issue for any app that wants to incorporate a HealthKit query into a timeline update.

|U03JJ2ZPFTK|:
I'm not 100% sure, but wouldn't this also be an issue if you set data protection on your shared container and need to read a file out it?

--- 
> ####  This question overlaps expertise with Core Data + CloudKit but do you have any general recommendations for implementing a widget that displays data that the app syncs? Eg, access it in a shared app group or write separate file to the app group from the app, and how to ensure it stays up-to-date? Thanks!


|U03J7BAGWFJ|:
Yes, if you’d like to share data between your widget extension and container application, you’ll want to do that via a shared app group container or use the network to pull the latest data for both.   Be careful if using the file system that if both processes (your extension and app) are running at the same time, accessing and/or mutating any shared cache data is safe for access.

|U03HKV0T82Y|:
SQLite is a reasonable option. It supports the scenario of one writer process (the app) and readers (the widget extension). With SQLite’s WAL I believe the single writer won’t block the reader at all.

|U03HKV0T82Y|:
A small SQLite schema could be used solely for the purpose of sharing data with the extension

|U03HMCT187R|:
Sorry I maybe should have been more precise in noting I’m using Core Data + CloudKit via NSPersistentCloudKitContainer, so indeed do have a SQLite file :slightly_smiling_face:

|U03HKV0T82Y|:
Cool, good to go!

--- 
> ####  Sometimes widgets seem to get ‘stuck’. They no longer update but seem to show an old cached version. Do you know of any common reasons this may happen?


|U03HKV0T82Y|:
This can be a few things. Maybe your extension is crashing. But often it’s because you’re out of budget and have reached a reload limit for the day. This talks about budget: <https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date> and also see WWDC’s 2021 WidgetKit talk

|U03HZ4EJJ05|:
Thanks for your reply!

--- 
> ####  Is WidgetCenter.shared.reloadTimelines rate limited on our behalf, or would triggering that 10x in 1 second (just an example lol) cause it to attempt getTimeline 10x? Do I need to be super careful about how often this can get called in a short amount of time (for example in response to database changes) or does it work similar to `UIView.setNeedsLayout` which will only result in one execution after a bit of a delay?


|U03J7BAGWFJ|:
Yes, they can be rate limited and they may be coalesced by the system.  But depending upon your timing, you should also only call it when necessary.

If you flood the system with a bunch in a short duration, you may exhaust your allocated refresh budget quickly.  Sometimes you may want to do that, for example, if you were updating scores for a sports game.  However, other times you should probably be more exacting with it to ensure a good experience for your users.

I’d encourage coalescing as much as possible before sending a WidgetCenter.shared.reloadTimelines call - especially around a batch of database changes.

--- 
> ####  I've mentioned that after deleting widget from the home screen and calling `WidgetCenter.shared.getCurrentConfigurations` in the opened app sometimes may return the list which includes previously deleted widget.  Rebooting the app should helps, but it doesn't allow us to properly track how many users have our widgets installed.  Is that behavior intentional?


|U03HKV0T82Y|:
That sounds like a bug – please file some Feedback!

--- 
> ####  Re: reloadTimelines budgeting, calling reload while my app is in the foreground doesn’t count against the budget, correct? So what counts as foreground? If I call reload in willResignActive is that foreground? What about calling it in didEnterBackground?


|U03J7BAGWFJ|:
&gt;&gt; If I call reload in willResignActive is that foreground?
Yes.  Resign active is still considered foreground.

&gt;&gt; What about calling it in didEnterBackground?
This will still work as well as long as it’s not async’d.

|U03HVF46TEJ|:
Awesome thanks!

|U03J7BAGWFJ|:
And yes, refreshes while foreground are considered “free” from a budgeting perspective.
