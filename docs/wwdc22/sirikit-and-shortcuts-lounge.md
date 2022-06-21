# sirikit-and-shortcuts-lounge QAs
### Lounge Contributors
#### [tikimcfee](https://github.com/tikimcfee)
#### [shirblc](https://github.com/shirblc)
#### [roblacl@github](https://github.com/roblack) / [roblacl@twitter](https://twitter.com/emin_ui)
---

--- 
> ####  Since App Intents don’t support widget configuration yet, is there any way to tell the system that an App Intent and a SiriKit intent are duplicative and/or to only surface App Intents in Shortcuts/Siri/etc.?


|U03H3MTANBZ|:
There are APIs to “match up” your App Intents to existing SiriKit intents.

|U03H3MTANBZ|:
See `CustomIntentMigratedAppIntent` and similar APIs.

|U03H3MTANBZ|:
If you adopt those APIs, the system will automatically only surface the App Intents version in Shortcuts, so your intents aren’t duplicated.

--- 
> ####  Hi, In our app (what3words) we identify exact 3x3m squares with 3 unique words, example: index.home.raft - defines a specific lat/lng pair in the middle of a fixed 3x3m square. I would love to be able to implement an app shortcut like: 'what3words navigate to index home raft'. Is the current implementation supporting `any input type` for a phrase like: `what3words navigate to (.*)` ? Or do you have some other suggestions for implementing this feature?


|U03HJ5M01M0|:
App Shortcuts doesn’t support arbitrary parameters in the initial utterance. Instead, your can specify parameters ahead of time while your app is running. For your use case, if you can specify all the possible options up front, your use case may fit a parameterized shortcut. If not, I’d suggest having a phrase like “what3words navigate”, where you request the parameter in a followup question using a Needs Value prompt

|U03HZ3RKC6R|:
Thanks for your reply.
And this needs value prompt will show up as an input field where users would input the words with a keyboard ?

|U03HJ5M01M0|:
in Siri, Siri will ask the user to dictate a response in voice. In Shortcuts and Spotlight, the user can type the string value using the keyboard

--- 
> ####  Great Session!  ...I'm new to intents in general and am excited about the parameterized options. Is there another way to capture an arbitrary phrase at the end of the intent, like the remainder of what was uttered?


|U03HJ5M01M0|:
App Intents don’t support gathering arbitrary inputs in the initial utterance. But you can always gather additional inputs using followup prompts.

--- 
> ####  Any recommendations around best practices for tracking usage of shortcuts? Very broad question I know, but curious if you have any thoughts.


|U03HJ5M01M0|:
We recommend instrumenting your intent’s `perform()` method using your application’s existing instrumentation system. This method will be called any time your App Shortcut is invoked to run your action, so it’s a great way to get a sense for how often users are using your integration.

--- 
> ####  So, the new intents will be their own Shortcuts, but will they now also always be available as actions to include in other Shortcuts?


|U03J82Z009E|:
Yes! App Shortcuts are made up of App Intents, and the user can add any intent you create to a shortcut of their own. And, your intents can return results that can be used as the input to other actions.

|U03JEUQ9ZF0|:
Awesome! Thanks!

--- 
> ####  In 2019 I installed the iOS beta on a development device, and since it was logged into iCloud, it synced my shortcuts back and they were unusable on my main, non-updated device. Is that still the case this year? If I access my shortcuts on a beta device, will they be synced back and unusable on my other devices?


|U03HJ5LTNEN|:
That shouldn’t be the case this year! Shortcuts created in iOS 16 work on devices running iOS 15, unless they use new actions that were added in iOS 16.

--- 
> ####  Is there downloadable sample code associated with this session?


|U03H3MTANBZ|:
Check out the food truck app, it has some app intents and app shortcuts integration in there.
<https://developer.apple.com/documentation/swiftui/food_truck_building_a_swiftui_multiplatform_app/>

|U03HMBY0SDV|:
Thank you, I'll take a look!

|U03H3MTANBZ|:
Otherwise, let us know what kind of sample code you’d like to see in the future!

|U03H3MTANBZ|:
github link: [<https://github.com/apple/sample-food-truck>].

--- 
> ####  Not as a developer, but as a user, i created an automation on Shortcuts app for battery level, is there a way to conditionally check for power source connection?


|U03HJ5M01M0|:
I don’t think we support this right now, but please file a feedback request!

|U03JRQ81NEL|:
Sure thing :crossed_fingers::skin-tone-2:

--- 
> ####  With App Intents, can we only show a SwiftUI view in response? IF so, can we wrap a UIKit-view in UIViewControllerRepresentable and return that?


|U03HJ5M01M0|:
Custom views in the App Intents framework leverage the same technology as Widgets. This means your views need to be implemented using only SwiftUI — You cannot use UIViewControllerRepresentable.

|U03HZ2VBE21|:
Thanks for the reply. This is different from SiriKit Intents I guess. My existing intents show a custom UI on completion, so I guess I'll have to port that to SwiftUI.

|U03H3MTANBZ|:
<@U03HZ2VBE21> Yes! It’s different (and we think much easier), since you don’t need a separate UI plugin, etc.

--- 
> ####  Haven't had a chance to digest all documentation yet. In Shortcuts on macOS Monterey, there are some built-in actions, like "Add to Bear Note" that allow multiple types on Input and Output in a single parameter.  Is this now possible using the new API? I'll try adding a screenshot for illustration.


|U03H3MTANBZ|:
This is a great idea! We would love a feedback for this so we can take a look at supporting this.

|U03J1UQCFGB|:
Will do! It would make actions so much easier. Currently I need to provide three almost identical actions to support three different kinds of input, in our case text, images and files.

|U03J1UQCFGB|:
<@U03H3MTANBZ> Happens to be for an app you know from your past :wink:

|U03J1UQCFGB|:
Just to make sure we’re talking the same thing: this is what I am referring to…

|U03J3V36VC2|:
Take a look at the Resolver protocol.  <https://developer.apple.com/documentation/appintents/resolver>

|U03J3V36VC2|:
It might let you do some of what you want

|U03J1UQCFGB|:
Thanks for the hint, will do :slightly_smiling_face:

|U03HJ5LTNEN|:
<@U03J1UQCFGB>, one thing worth looking at in App Intents is that we now support “rich text” as a native type, by specifying an `AttributedString` parameter.

|U03HJ5LTNEN|:
If you specify a parameter that takes rich text, it also automatically supports plain text, and attachments (which could be files, images, etc.)

|U03HJ5LTNEN|:
Any attachments will be interpolated into the AttributedString as text attachments (as is standard for attributed strings)

|U03HJ5LTNEN|:
That _should_ be sufficient to achieve the use case you’re outlining - give it a try and please file some feedback if it’s not what you’re looking for!

--- 
> ####  Would you please explain the "Convert to App Intent" a bit more?  Also, if we choose not to upgrade sirkit intents at this time, can we mix them up with new app intents?


|U03HJ9140PM|:
“Convert to App Intent” will create skeleton AppIntent source files for existing SiriKit intents that you select.  It will translate basic information such as types, enumerations, and intent parameters, and add stubs for `perform` and query methods.  You are free to translate only some of your existing intents — SiriKit intents are still recommended if you use Media, Messaging, or Phone domains; or need to be compatible with older systems.

|U03HZ2VBE21|:
I just ran the "Covert to App Intent" with my intent definition file and while it created a bunch of swift files with CustomIntentMigratedAppEnum and CustomIntentMigratedAppIntent. Unfortunately it doesn't label them as @available decorations so I got a bunch of errors as a result, warning me that "LocalizedStringResource' is only available in macOS 13 or newer" etc. Would be nice if that was marked automatically.

|U03HJ9140PM|:
Good suggestion, thank you!

--- 
> ####  Hello, what is the difference between App Intents and App Shortcuts? Seems like Intents power Shortcuts and users use Shortcuts to access Intents - is there a better mental model here?


|U03H3MTANBZ|:
App Intents are how you as a developer create actions the user can run in your app. App Shortcuts are a layer on top, which lets you opt-in certain App Intents and turn them directly into Shortcuts for the user automatically, including Spotlight and built-in Siri support.

|U03HJ5M01M0|:
For more on App Shortcuts, you can checkout my talk (the other Michael :blush:) here: <https://developer.apple.com/wwdc22/10170>

|U03HJ5LTNEN|:
+1 to what <@U03H3MTANBZ> said! And, I think your initial description was right, <@U03JEBK34D9>!

|U03JEBK34D9|:
Thank you for answering - that helps clarify! So you need an Intent in order to create a Shortcut. Are there user-facing things you can do with _only_ Intents or would I pretty much always have at least 1 intent and 1 shortcut?

|U03HJ5M01M0|:
It depends a lot on what your App Intent does. Not every App Intent makes a great shortcut. For more information about what use cases make good App Intents, check out Lynn’s talk tomorrow, Design App Shortcuts: <https://developer.apple.com/wwdc22/10169>

|U03HJ5LTNEN|:
<@U03JEBK34D9>, yes, there are user-facing things you can do with only an intent. If you publish an intent, users can add it to a custom shortcut, by creating one manually in the Shortcuts app.

|U03HJ5LTNEN|:
This is super useful for making your app deeply automatable with Shortcuts. But if you want to make it easy for a user to tap into an intent, definitely expose an App Shortcut so that it’s available with no setup.

--- 
> ####  Hi guys I hope you can help me with something not on the latest announcements... I'm working on a streaming audio app (Catalyst) that handles INPlayMediaIntent fine on iOS, yet on macOS when speaking "Play NPR on MyApp, Siri replies "I can't play from MyApp on this device". How can I begin to figure out why Siri on Mac cannot open my app? I think I've done things correctly by donating intents, setting user vocabulary and calling becomeCurrent on a INMediaUserContext() on launch


|U03HJ9675MZ|:
Siri does not support `INPlayMediaIntent` on MacOS, but it is supported by the Shortcuts app.

|U03HJ5LTNEN|:
Quick correction, `INPlayMediaIntent` is unavailable on macOS in both Siri and Shortcuts.

|U03JCMNA812|:
Oh ok cool I’ve been tearing my hair out thinking it’s me :joy: thank you so much!

--- 
> ####  Can Automations be triggered by events like sending an iMessage, opening an app, or taking a photo?


|U03HJ9MNGPL|:
Those aren’t currently supported, but you can run an automation based on opening or closing an app! You can suggest new triggers by submitting feedback in the Feedback Assistant app.

|U03J1US1SR1|:
Thank you!

--- 
> ####  Is there anyway to create Siri shortcuts that are accessible across all Siri touch points across the ecosystem?  (Watch, iPhone, iPad, Mac, TV, HomePod, AirPods). If so, what's the simplest way to do this? Does your app need to exist on all these platforms to be exposed in each Siri context?


|U03HJ9MNGPL|:
Shortcuts are supported on iPhone, iPad, Watch, Mac, HomePod, and AirPods (not Apple TV). If you implement an intent in your iOS/iPadOS app, it will be available on iPhone, iPad, HomePod, and AirPods. To support Watch, you’ll need to implement intents in your watchOS app, and to support Mac, you’ll need to implement intents in your macOS app.

Note: App Shortcuts (the feature where your app’s shortcuts are made available automatically) are not available on macOS. HomePod support for App Shortcuts is coming later this year.

|U03J8GWEFU7|:
Thank you <@U03HJ9MNGPL>!

So once HomePod support for App Shortcuts comes later this year, a customer could download an iPhone app with bundled App Shortcuts, and then these invocation utterances would be exposed to any HomePod devices in their household?

|U03HBLRDGUW|:
Yes, as long as the HomePod has Personal Requests enabled!

|U03J8GWEFU7|:
Thanks <@U03HBLRDGUW>!!

--- 
> ####  Is there a trick to getting AppIntents to show up in Shortcuts, like something in Info.plist? I have an AppIntents.swift file in my main app target, Xcode shows "Extract app intents metadata" in the build log/timeline, but nothing shows up in Shortcuts on Simulator for my app. I did initially start with an extension target and then deleted it, which may have screwed something up...? Thanks!


|U03HB1A8VRU|:
You do not need to add anything to your Info.plist for things to show up. You may want to try clearing your build products, and making sure `xcode-select` has the Xcode beta selected (this is a known issue). If you have any other issues getting App Intents to appear, you should feel encouraged to file feedback.

|U03KC4368BS|:
I'm guessing it was the xcode-select, I had already tried everything else, but switching xcode-select + resetting the simulator + clean build got things working. Thanks!

--- 
> ####  If I use App Intents to create Shortcuts, how can I make them compatible with iOS 15?


|U03HB1A8VRU|:
App Intents are supported on iOS 16 and later. If you want your Intents to be compatible with earlier versions of iOS, you'll have to use the existing Intents framework. Your custom intents and app intents can coexist and people won't see both on iOS 16, as long as you adopt the `CustomIntentMigratedAction` protocol in your App Intents.

|U03J1US1SR1|:
That's great to know. Thank you!

--- 
> ####  Can you make an HTTP Request through an App Intent?


|U03HWU7JT89|:
Yes you can, as long as it takes less than ten seconds.

|U03JWAY8A3E|:
Thank you Michael :)

--- 
> ####  Is it possible to access BLE with the new changes coming?


|U03HBLRDGUW|:
Yes, this should be possible, as long as the operation takes less than ten seconds. Give it a try and file feedback if it doesn’t work as you might expect!

|U03JWAY8A3E|:
Alright, thank you!

--- 
> ####  What can we expect in terms of backward compatibility if we migrate existing intents to App Intents? Will users' Shortcuts continue to work, etc.?


|U03HJ5LTNEN|:
Yes! See <https://wwdc22.slack.com/archives/C03J26F7XKJ/p1654723060962539?thread_ts=1654723050.268569&amp;cid=C03J26F7XKJ>. Does that help?

--- 
> ####  We have several app extensions in our product like iMessage extension, share &amp; action extensions, safari extension and so on. But our primary product on iOS &amp; iPadOS is a keyboard extension.  I wonder if there's something new in SiriKit that we can adopt for our app extension, especially for the keyboard extension, which have pieces of a common functionality with an app and other extensions.


|U03HB1A8VRU|:
App Intents are not supported in keyboard extensions. Intents are handled by your app process, or a standalone App Intents extension. We'd love to hear what kind of ideas you have for integrating Siri or Shortcuts into your keyboard extension!

|U03JER2C7MX|:
I have some :smile:

Should I apply for a lab?)

|U03JER2C7MX|:
Regarding App Intents, I see that they’re not supported. But can we donate Intents to the Intents extension from the keyboard extension?

|U03HJ5LTNEN|:
Yes! We’ve got a lab coming up on Friday!

|U03HJ5LTNEN|:
I’m not sure what you mean by “donate intents to the intents extension from the keyboard extension”

|U03HJ5LTNEN|:
What would be the use case there?

--- 
> ####  What's going to be the best way to maintain backward compatibility with SiriKit Intents if supporting the new "App Intents"? When I tried the "Convert to App Intent"' option, I started getting a lot of duplicate symbol errors, because the intent-definition file also outputs the same generated files as the App Intent generated files do. Not sure how to best handle this.


|U03H3MTANBZ|:
Hi! Are you seeing duplicate file names, or duplicate symbols?

|U03HZ2VBE21|:
Duplicate symbols.

|U03H3MTANBZ|:
Ah OK. Yeah I would recommend renaming the generated symbols so they don’t collide.

|U03HZ2VBE21|:
Can this be done by the convertor tool? It generated about 30+ different symbols from my intents definition file and it would be tedious to change it manually

|U03H3MTANBZ|:
Outside of that, you have the right idea with migration. If you do the migration or implement the CustomIntentMigratedAppIntent and similar protocols manually, backward compatibility will be maintained.

|U03H3MTANBZ|:
<@U03HZ2VBE21> yes there might be something we can do there. We’ll take that as a request!

|U03H3MTANBZ|:
Also keep in mind, to make sure you get backwards compatibility, keep the schema of parameters the same between the app intent and sirikit intent.

--- 
> ####  Is it possible to include audio (sound design elements) as part of a Supporting Dialog response via Siri?


|U03HJ5LTNEN|:
There’s no explicit support for this, but if your app intent conforms to `AudioStartingIntent` , you should be able to play a brief sound before returning a result from your intent’s `perform()` method. Feel free to give it a try!

|U03J8GWEFU7|:
Thanks <@U03HJ5LTNEN>!

--- 
> ####  I make the app Just Timers and want to be able to have phrasing similar to “start a 5 minute timer” but the video explicitly called this out as not possible because of needing 2 parameters, I know there are types like Duration, how would I define a parameter that can take a time value like that?


|U03HJ5LTNEN|:
It’s not possible for an app shortcut phrase to take an open-ended parameter like a # of minutes. But, you can consider:
1. Using a conversational flow where the user says a phrase like “start Just Timer” and Siri asks “For how many minutes?” and the user specifies a duration that way
2. If there’s a logical way to provide a set of timers ahead of time to Siri, perhaps with nicknames (like “tea timer”, “soup timer”, etc),  the user could use those in their phrase


|U03J4DE461J|:
Makes sense. Is it the number that's the issue or the two parameters? Like, if i made a static phrase "start a X minute timer" where X is a number, would it work? in theory building a few different iterations like hour/second etc

|U03HJ5LTNEN|:
It’s the number that’s the issue! App Shortcuts supports taking only pre-defined parameters.

|U03J4DE461J|:
got it! thank you! that was the only part I wasn’t quite clear on but it makes sense. here’s hoping for next year :crossed_fingers: :slightly_smiling_face: 

--- 
> ####  Are there any changes to donating intents? Or does that still work in the same way for App Intents compared to the previous SiriKit Intents? And are there any changes in the places and way they are presented to users in iOS 16?


|U03HJ5LTNEN|:
You can still donate intents, and provide predictions using the `PredictableIntent` protocol. But, suggestions do work differently in iOS 16 than earlier! Now, at the top level of Spotlight, only donated `INPlayMediaIntent`s are suggested. Other types of donated intents are only suggested in the Siri Suggestions widget.

You should consider adopting the new App Shortcuts API instead! When you adopt App Shortcuts, your shortcuts will be featured in Spotlight at the top-level whenever your app is suggested, and whenever people search for your app in Spotlight. It’s a great way to surface your app’s functionality, and you don’t need to donate for them to appear!

|U03JRPLCM24|:
Good to know, thanks for the info!

--- 
> ####  If I'm coming in fresh on this (and not concerned about pre iOS 16 support), do I need to unpack the SiriKit documentation as complementary info to App Intents? Or can I have have tunnel vision and just focus on the new App Intents docs?


|U03HBLR8UMC|:
App Intents is a great way forward on our platforms! You shouldn't need to use SiriKit unless you specifically want to support Widgets or any of the Siri domains (like Messaging, Media, etc). If you do want to support one of those features, you'll want to also look at the SiriKit documentation as the App Intents framework does not support this at this time.

|U03J8GWEFU7|:
Thanks <@U03HBLR8UMC>!

|U03J8GWEFU7|:
<@U03HBLR8UMC> When you say support Widgets, does that mean creating a Widget that when tapped, would trigger the Shortcut?

|U03HBLR8UMC|:
By supporting widgets, I mean if you want to make a widget for your app.

|U03HBLR8UMC|:
When you make a widget using WidgetKit, the configuration is backed by custom Intents via SiriKit.

|U03HJ5LTNEN|:
See here: <https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget>

|U03J8GWEFU7|:
:pray: thank you!

--- 
> ####  Thanks for the awesome work on AppIntents, a game changer! Perhaps a bit of a basic question, but can you elaborate on how NSUserActivity donation upon say opening a project (and it subsequently surfacing in spotlight) would interact/compare to AppShortcuts that could also say "Open Project X"?


|U03HBLRCS5C|:
Hi! They would both be searchable in Spotlight. You could consider setting the `eligibleForSearch` flag to `false` on your `NSUserActivity` objects, and using App Shortcuts instead to expose functionality in Spotlight.

When you adopt App Shortcuts, your shortcuts will be featured in Spotlight at the top-level whenever your app is suggested, and whenever people search for your app in Spotlight. It’s a great way to surface your app’s functionality, and you don’t need to donate for them to appear.

We’d suggest using App Shortcuts over `NSUserActivity` in this case, as it’s going to be shown more prominently in various places across the operating system, and enable more functionality for your users!

|U03JR73SJUV|:
Perfect, thanks!

--- 
> ####  Is Siri able to process custom App Intents/Shortcuts while offline on iOS? watchOS?


|U03HJ5M01M0|:
Shortcuts that have no followup prompts (confirmations, disambiguations, value prompts) can run completely offline. Shortcuts that ask for followups require a network connection.

|U03JCQQ5CRJ|:
Great! This is possible on watchOS 9 as well? I don't think offline was supported on watchOS 8 last year

|U03HJ5M01M0|:
Yes! This is the case for watchOS 9 on Series 6 watch and later

|U03HJ5M01M0|:
On iOS, offline Siri requires iPhone XS or later

--- 
> ####  Can an App Clip contain an App Intent?


|U03HJ5LTNEN|:
No, only apps can contain App Intents!

|U03HJ5LTNEN|:
(App Intents extensions within apps can also contain App Intents)

|U03J8GWEFU7|:
what is an App Intents extension?

|U03J8GWEFU7|:
<@U03HJ5LTNEN> are you referring to this?  <https://developer.apple.com/documentation/sirikit/intent_handling_infrastructure/creating_an_intents_app_extension>

or is this a new concept within App Intents?

--- 
> ####  What are all of the new actions added in iOS 16?


|U03HJ508QEP|:
Great question! Here are the new actions in iOS 16:
• Notes
    ◦ Added: Delete Notes, Pin Notes, Open Notes Account, Change Notes Setting, Open Notes View, Create Folder, Delete Folders, Move Notes to Folder, Open Folder, Add Tags to Notes, Create Tag, Delete Tags, Open Tag, and Remove Tags from Notes
    ◦ “Create Note” and “Append to Note” now support Rich Text
• Voice Memos
    ◦ Added: Search Voice Memos, Open Folder, Open Recording, Delete Folders, Play Recording, Create Folder, Change Playback Setting, Delete Recordings, and Create Recording
• Mail
    ◦ Added: Open Mailbox, Search Mail
• Books
    ◦ Added: Open Book, Open Collection, Open Tab, Change Theme, Resize Text, Switch Page, and Search Books
• Safari
    ◦ Added: Open Tab Group, Create Tab Group, Open New Tab, Open New Private Tab, and Open View
    ◦ Safari Reader actions are now available on macOS
• Shortcuts
    ◦ Added: Create Shortcut, Delete Shortcuts, Search Shortcuts, and Open Folder
• Clock
    ◦ “Open Tab” opens a specific tab in the Clock app
    ◦ Clock actions are now available on macOS
• “Search Files” starts a search in the Files app
• “Get Parked Car Location” and “Set Parked Car” retrieve and mark the location of your car as displayed in Maps
• “Configure Focus Filter” actions set Focus Filters for apps
• “Optimize File Size of PDF” compresses the images inside a PDF, resulting in a smaller file size
• “Remove Background” removes the background of images, keeping the subject only
And some action improvements in iOS 16:
• “Send Email” now supports rich text on macOS
• “Find Calendar Events” can now filter events for declined or accepted status
• “Set Personal Hotspot” toggles the status of Personal Hotspot on iOS
• “Set Flashlight” can now control the flashlight on watchOS
• “View Content Graph” has an improved interface
• “Open URL” no longer fails to open FaceTime links
• “Shazam It” no longer fails to run from Siri
• “Find Notes” can now retrieve more than 26 notes at a time
• “Find Photos” no longer fails to run when filtering for a photo album that does not exist on the local device
• Evernote actions return content successfully on macOS

--- 
> ####  If I understood correctly, unless you mark the shortcut as needing to open the app, my app will be launched in the background when executing the shortcut. Will the app be left running in that state or will it immediately be closed again? In other words, is there a possibility for the app to transition from this background running state to the fully open state? And finally, is this background running state different from other background states/detectable by querying in my code?


|U03HB1A8VRU|:
When you implement App Intents in your app, your app will be launched in the background to perform the intent, then suspended when it's finished. If your app happens to be already launched and in the foreground, it will remain so after performing the intent.

If you want your app to come into the foreground, you'll need to return `true` from `openAppWhenRun` on your app intent.

If you need more control over this behavior for your use case, we'd love to hear about it! What use case are you looking at for transitioning from the background to the foreground?

|U03JR73SJUV|:
Given we store our data in a group container we have to be very careful with leaving file handles open (we’ve been bitten by crashes due to this fact in the past). It also means we are careful to close our database stack when going to the background. If the app is running and the intents is asked to perform all is good, I’m more worried though about the app being launched in the background and setting up the database stack, then being suspended and crashing due to file handles being left open. Or, the situation where we tear down the database stack after the intent has finished and the app is suspended, and then somehow transitioning to the foreground state without having detected that we need to setup the database stack again. Hence trying to grasp which transitions are possible.

|U03HB1A8VRU|:
The only lifecycle events you will receive are the standard ones sent to your app delegate. If you initialize a database in your perform method or a query, you should clean it up before that method returns.

|U03JR73SJUV|:
Good point, I could definitely verify or defer things in the perform method itself indeed. Thanks!

--- 
> ####  Thank you everyone on the team for all your fantastic work making something that is indispensable to so many of our workflows and integral to the apps we make! And it just keeps getting better!  I have a widgets intent question that I think I know the answer to, but I want to check: Is it possible to hide intent parameters depending on the widget family? As in for an intent that is used for multiple families of widgets, can a specific widget family not show a particular parameter?  Here’s my use case. I make the time-tracking app Timery, and in each of the Home Screen widgets, there’s a parameter to customize the widget’s background (match the system dark mode, always show light or dark, etc.). If I use the same widget for the Lock Screen, that parameter is there when editing the widget, but it isn’t applicable to the accessory circular widget since it doesn’t have a background.  There are a couple other instances in the Home Screen widgets where parameters that are used for larger-sized widgets appear when editing smaller-sized widgets, but they aren’t applicable for it, so they don’t actually do anything.  So it would be nice to be able to selectively hide parameters for specific widget families and not potentially confuse users with a parameter that doesn’t do anything for that widget family, but I’m guessing that’s not possible?


|U03HB1A8VRU|:
It's not possible for parameters to be hidden only in particular widget sizes. You may need to define a separate intent or widget to accomplish what you want.

We'd appreciate a feedback report describing your use case, so we can track this enhancement request.

|U03KKEH7SJC|:
Thank you! I figured it wasn’t possible, but I wanted to check. And thanks for already answering my follow-up question if I should create a separate widget/intent!

--- 
> ####  Is there a way to create a Shortcut, that will pass specific data to some Action or Share extension, but only if that file conforms to the UTI format that these extensions support?


|U03H3MTANBZ|:
Are you talking about an App Intent, or a user-created Shortcut?

|U03H3MTANBZ|:
Sorry <@U03JER2C7MX> looks like I missed a permission! You should be able to reply now.

|U03JER2C7MX|:
Yeah, I should’ve written the whole question in the initial message :smile:

I was mentioning user-created Shortcuts, and the reason why I do so is that I’ve been looking for a way to activate functionality from the Share or Action extensions in the shortcut.

Currently, the `Share with apps` action doesn’t care what kind of data will be passed into the app. The action will simply fail if the UTI of the data is unsupported.

I was curious if that is something that can be achieved by users interacting with actions provided by the app via App Intents API.

E.g., if some previous action always returns a Video as its result, we shouldn’t suggest users share that Video into the Reminders app that is not able to handle it and so on.

|U03HJ5LTNEN|:
<@U03JER2C7MX>, your description of the behavior is correct! The Share with Apps action lets you pick any Share Extension and pass any input to it, and will display an error if the input was not of the expected type.

|U03HJ5LTNEN|:
It needs to work this way because in Shortcuts, input is non-deterministic - we might not know what the type of the input is until the shortcut is run.

|U03HJ5LTNEN|:
I don’t understand exactly why the current implementation is problematic for your use case. Can you explain more about what you are looking to do?

--- 
> ####  Curious if there's a github link or a downloadable version of the App Intents demo?


|U03H3MTANBZ|:
There isn’t a downloadable version of the Library app, but you can check out Food Truck here, which includes App Intents adoption like that shown in SOTU!
<https://github.com/apple/sample-food-truck>

--- 
> ####  Focus Filters look great - i've already got a prototype working in my app, Streaks.  1. Possible to add an icon to a parameter list? I have a `[CustomEntity]` parameter. The multi-item selector in Focus Filter setup works great, but it would be great if an icon could be shown beside each item.  2. Assuming not due to privacy, but Is there a way to get a list of Focus modes? I want users to be able to assign their data to various categories (which would align with focus), so can say "show this task while in Sleep". My prototype has them building their own categories, then they need to select that when setting up the focus filter.


|U03H3MTANBZ|:
1. You should be able to show an icon for each entity in the parameter picker by simply implementing a `displayRepresentation` on your CustomEntity type. The icon can be an image or a SF Symbol. Check out `DisplayRepresentation.Image` for more details.


|U03H3MTANBZ|:
2. We currently do not offer a way to fetch a list of Focus modes, and yes, privacy is one of the reasons behind this. Your proposed solution looks like a very reasonable approach to solve this problem.

|U03JH1D27C1|:
Perfect, thank you!

--- 
> ####  Focus filter followup question:  Is there a way to know if a focus mode is enabled? I could only receive notifications from the system when parameters are changed, but not if a user changed from "no focus mode" to "some focus mode" if no parameters are changed.  My use-case:  I want to show an in-app toggle that appears to allow users to filter data, but I only want it to appear if *some* Focus Mode is enabled.


|U03H3MTANBZ|:
Hi! When the user un-sets the focus mode and goes to “no focus”, you should get the “default” state of your intent performed on your app or extension. You’ll need to make sure that we can construct a “default” state for your action, ie. that all parameters are optional or have default values.

|U03JH1D27C1|:
If they’ve added my app as a focus filter for, say, “Workout”, but haven’t changed any parameters from the defaults, is there any way to know that the focus mode is enabled?

|U03JH1D27C1|:
It would be kind of cool to have access to the Focus Mode icon at least (again, presumably not due to privacy), but it would be useful to use that icon to drive some menu / UI stuff that’s only visible if focus mode is enabled, kind of like how iOS does it.

|U03JH1D27C1|:
Much simpler to use the system level icons / terminology, than add my own taxonomy to my app that simply hooks in with the system stuff.

|U03H3MTANBZ|:
Ah, I see what you mean.

|U03H3MTANBZ|:
No, there is not currently a way to do that, but we would love a Feedback to that effect with your use cases,

|U03JH1D27C1|:
Sure thing - sorry, was having trouble describing it exactly while I fumble through exactly how I want it to work in my app :wink:

|U03JH1D27C1|:
FB10139845

|U03HJ9MNGPL|:
Thanks for filing!

--- 
> ####  Apologies if this is covered in a session I haven't seen yet, but is there direction on how to handle focus modes in watchOS?  Is it just a matter of adding the AppIntent to the watch target, and then the Apple Watch app can read filter parameters accordingly?


|U03H3MTANBZ|:
Yes, Focus Filters are synced between iOS and watchOS on paired phone / watch. If you build the intents into your watch app or an extension, they should be performed.

--- 
> ####  Topic backwards compatibility: are we able to associate the new app intents with current user activities (like interactions from the Intents framework)?


|U03HJ5LTNEN|:
Hi! NSUserActivities can’t be associated with app intents. If you want the capabilities of app intents and NSUserActivities, but you want to avoid duplicate results, you should disable `isEligibleForSearch` and `isEligibleForPrediction` on your NSUserActivities on iOS 16+.

But, app intents can be associated with intents from the Intents framework, by adopting the `CustomIntentMigratedAppIntent` protocol. If you do this, you can provide both custom intents and app intents in your app, and the custom intents will automatically be ignored in iOS 16+.

Does that answer your question?

|U03JN2004TY|:
Mostly :) In the talk I‘ve seen that "open app intents" aren't suggested by the system and some of my user activities are just open screen activities. Does it make sense to migrate those (and if so) can I leave the switches for search and prediction on since the app intents aren't advertised?

|U03HJ5LTNEN|:
Good question… I don’t have guidance there, currently. We’d really like to encourage folks to make app shortcuts that work well without launching your app!

|U03HJ5LTNEN|:
Can you tell me more about cases where it’s important to you to have shortcuts that do launch your app, and where it’s valuable to you for those to show up?

|U03HJ5LTNEN|:
(i.e. Search, Siri Suggestions, etc.)

|U03JN2004TY|:
Sure :) basically it‘s a podcast app and every screen has a user activity so that for example if I open a podcast page every morning at 9am, the systems starts picking up the habit and suggests opening the podcast close to 9am

|U03JN2004TY|:
It is really just a shortcut to a deeplink in my app

|U03HJ5LTNEN|:
Oh got it!

|U03JN2004TY|:
I also have other intents like "Get the number of episodes of podcast X" which will just be migrated to the new app intents

|U03HJ5LTNEN|:
Would you consider making a shortcut to play the podcast in addition to the shortcut to open the podcast page (for suggestion purposes, so the “play” one is the one that would be suggested)?

|U03HJ5LTNEN|:
Oh that’s awesome!

|U03JN2004TY|:
That‘s also coming via donating the INPlayMediaIntent but of couse just when the user plays the episode :) (and removed when it finished cause it‘s rather unlikely that they want to play it again)

|U03HJ5LTNEN|:
For those suggestions, instead of removing play intents once the episode is finished, you might consider using the Upcoming Media API

|U03HJ5LTNEN|:
See <https://developer.apple.com/documentation/sirikit/inupcomingmediamanager>

|U03HJ5LTNEN|:
This allows you to replace predictions for INPlayMediaIntent with whatever media your app would like to suggest

|U03JN2004TY|:
But I think I‘ll add a "Play the newest episode of podcast X" Shortcut

|U03JN2004TY|:
Hmm that looks pretty cool actually :+1::skin-tone-2::+1::skin-tone-2:

|U03HJ5LTNEN|:
It’s good to avoid deleting old INPlayMediaIntent donations since that will cause your play intents to be predicted less often

|U03HJ5LTNEN|:
That sounds great too though, feel free to do both!

|U03JN2004TY|:
Ahhh that‘s super good to know!

|U03JN2004TY|:
I‘m excited what the Podcast app will offer (and tbh also what Castro will do since they have a crazy amount of custom intents and it‘s really inspiring too see what they do :)

--- 
> ####  Is there a recommended way to map an `AppEntity` to a Core Data `NSManagedObejct`?  The sample code uses UUID for AppEntity IDs, so I would presume just using a `UUID` property in Core Data would be sufficient, but wanted to check.


|U03H3MTANBZ|:
Yes creating a UUID property of your own would work. You cannot currently use the NSManagedObjectID directly, but feel free to file a Feedback for that!

--- 
> ####  Is it a known issue that some shortcuts are returning an error "there was problem running the shortcut" and "Couldn't communicate with a helper application."?


|U03H3MTANBZ|:
No that’s not expected. pPlease do file a feedback through the Feedback app. That’s a crash and we will then get the crashlog.

|U03KR2XEKGQ|:
Feedback `FB10118054`

|U03KR2XEKGQ|:
I get 2 different errors. One using `DynamicOptionsProvider` and the other an Int parameter.

|U03HJ9MNGPL|:
Thanks for filing this!

|U03KR2XEKGQ|:
This error seems to be due to defining multiple `AppShortcutsProvider` Only using one fixed the issue.

|U03HJ9MNGPL|:
<@U03KR2XEKGQ> Noted! :thumbsup:

--- 
> ####  Do users have to first enable Siri with your app for Siri AppIntents to work?  In the shortcuts app there was a place to enable siri for the app and until doing that it didn't seem to work.


|U03HJ5LTNEN|:
Yes, the first time people use Siri with your App Shortcut, Siri will ask the user to confirm that they want to use your app’s shortcuts. You can also do this enabling in the Shortcuts app itself, like you found.

It sounds like in your case, the Siri confirmation isn’t working. What phrase are you saying to Siri where that’s happening? The only time we could expect this is if your phrase conflicts with built-in Siri functionality.

|U03KR2XEKGQ|:
Maybe there was a conflict. Basically, none of the phrases were working (from what I could tell) until I enabled it in Shortcuts.

|U03KR2XEKGQ|:
Is there a way to reset that permission so I can try it again?

|U03HJ5LTNEN|:
Yes! Go to your app in Shortcuts (by going to top level of the Shortcuts tab and finding your app in the “App Shortcuts” section), and then press the “(i)” button in the top-right, and turn off “Siri”

|U03HJ5LTNEN|:
That will reset it so you can try it again

|U03KR2XEKGQ|:
Ok perfect. I’ll give that a try and see if it prompts.

|U03HJ5LTNEN|:
Just for my knowledge, can you provide a specific example of a phrase you used that isn’t working?

|U03KR2XEKGQ|:
Originally it was one of these:

```
"Start Metronome in \(.applicationName)"
"Start Metronome at \(\.$tempo) bpm"
"Metronome \(\.$tempo)"
```

|U03KR2XEKGQ|:
none of those worked. I realized after the fact though that $tempo was unbounded (Int) and that wasn’t supposed to work.

|U03KR2XEKGQ|:
After disabling Siri and trying again with a new phrase, it seems to properly prompt me.

|U03KR2XEKGQ|:
So this might of just been user error and a bad phrase that included that unbounded variable.

|U03HJ5LTNEN|:
Ah good to know, thanks Seth!

|U03HJ5LTNEN|:
This is helpful feedback since it should be made more clear when you are hitting the un-bounded case

|U03KR2XEKGQ|:
Yeah. I originally was hoping to be able to include an unbounded variable in a phrase, but I understand that’s not allowed yet.

--- 
> ####  Is it possible to produce a result from an app intent that can be used as an input for a system intent. i.e. Get the newest song released from band X (returning something like an INMediaItem) and the next intent would be an INPlayMediaIntent to play the song?


|U03HJ5LTNEN|:
System intents like INPlayMediaIntent cannot accept inputs in Shortcuts, so you wouldn’t be able to do this - but you could make a new intent for that purpose!

|U03JN2004TY|:
If the intent runs in an extension how do I communicate to launch the app in the background to start the audio session? I‘ve only found a way to open the app in the foreground

|U03HJ5LTNEN|:
For that, you should use in-app intent handling, instead of handling your intent in an extension.

|U03JN2004TY|:
Okay I‘ll try, I hope the app launch doesn't use to much time so the Siri response feels delayed. That‘s why the play media handling is currently run in an extension

|U03HJ5LTNEN|:
Ah I see

|U03HJ5LTNEN|:
I think it’s not possible to launch the app in the background from an intent run in an extension (cc <@U03HFBW311B> to confirm)

|U03HJ5LTNEN|:
<@U03JN2004TY> Wouldn’t the Siri response be further delayed if you need to launch the extension and then also launch the app in the background in order to start media playback?

|U03HFBW311B|:
It’s not possible to launch the app in the background from an intent run in an extension

|U03JN2004TY|:
I‘m still implementing the Siri Media support so I haven‘t tested performance but from the sessions I watched previously I thought that one of the main benefits of an extra extension is that you can do all the filtering/figuring out the specific media item in the small process and then just hand the result over to the app (which just has to play)

|U03HJ5LTNEN|:
<@U03JN2004TY> I think in that case it would actually be faster to just do it in the app, because then you avoid the process launch time of the extension!

|U03HJ5LTNEN|:
Generally, the extension is only faster if you can do an action in the extension without requiring launching the app at all.

|U03JN2004TY|:
Hm true, that makes a lot of sense and I wondered the same thing when I saw the video. But I guess there was a point where it was not possible in the app :blush:

--- 
> ####  Hi there. I have tried the new AppIntents framework, in particular the EntityStringQuery. While the 'suggestedEntities()' method gets called, the 'entities(for ..' and 'entities(matching ..' methods never get called after entering a search in the Shortcut app. Is there anything I am missing?


|U03H3MTANBZ|:
Hi! Are you sure that your methods are correctly overriding the ones from the protocol, with correctly matching parameter labrls and types.

|U03H3MTANBZ|:
If they are correctly overridden, you may be hitting a beta bug. We’d love a feedback, and sample code to reproduce if you have it.

--- 
> ####  Is there a way for Siri to be dismissed after an intent is performed? Right now Siri stays open and the app isn't in focus at perform is returned.


|U03H3MTANBZ|:
Not currently, but this is a good point. We would love to have a feedback for this.

|U03KR2XEKGQ|:
Ok, I’ll submit a feedback suggestion. Would that be the proper channel?

|U03H3MTANBZ|:
yes

|U03KR2XEKGQ|:
Thanks. Submitted `FB10140274`

|U03HJ9MNGPL|:
Thanks for filing!

--- 
> ####  In my app, I have a dedicated "Siri" screen that we added back when SiriKit was first opened, which then evolved to basically showing users the shortcuts they could add for each task.  It makes use of the "Add to Siri" UI button, and allows management of voice shortcuts.  I'm not really sure now what to do with this screen. My hunch is just to remove it completely, and use the new UI buttons in more contextually-aware locations.  The problem is though there are a number of situations where adding this UI doesn't make sense, even though I want the user to know about it.


|U03HJ508QEP|:
Hi Quentin! Yes, the right thing to do is replace the Add to Siri button with the new Siri Tip. Can you tell me a bit more about the different situations where you think the tip won’t make sense?

|U03JH1D27C1|:
On the main screen of the app, where the primary action is performed (and most likely the primary Shortcut that users would want to use).

Don’t get me wrong, the UI button looks great, but it’s nothing something I would want front-and-centre. Understand the recommended approach is to make it dismissable, but still don’t think i would want it featured that prominently.

|U03JH1D27C1|:
*not something, sorry.

|U03JH1D27C1|:
Or if I did have it on the main screen, there are many different actions that can be performed on the main screen, so I would then want that button to open to a “more info” screen, which is basically then the original Siri screen I’m thinking about removing.

|U03JH1D27C1|:
I guess the hard thing to know right now is how much will the system surface for the user in normal phone use, versus how much do I need to tell the user about the available shortcuts.

|U03HJ5LTNEN|:
It’s super important that there be a way inside of your app for people to learn about the Siri functionality! Otherwise a lot of people just won’t see it.

|U03HJ508QEP|:
I see! Another option is to use the new Shortcuts button, which would link the user to the list of shortcuts provided by your app inside the Shortcuts app.

|U03HJ508QEP|:
<https://developer.apple.com/documentation/appintents/shortcutsuibutton>

|U03HJ5LTNEN|:
I agree with Ayaka, could be good to put a Shortcuts button in your Settings screen (or on the Siri screen) so people can hop to Shortcuts and see everything available there

|U03HJ5LTNEN|:
But, additionally, would you consider putting the Siri tips somewhere new, like in the edit screen for a Streak?

|U03HJ5LTNEN|:
I agree it would be difficult to put it on the main screen, but I think the edit screen could be a good place?

|U03JH1D27C1|:
Yea - I think that’s where i’ll need to head with it. It already does some of that but I think that could all use a little bit of love on my side, now that I have more shortcuts

|U03JH1D27C1|:
I think the ShortcutsUIButton will help me dramatically - thanks for pointing that out. I’d seen it in the talks but had forgotten to note it!

|U03HJ5LTNEN|:
Great!

|U03HJ5LTNEN|:
I would encourage you to use the Siri tip also if possible because it’s so user-friendly to see the utterance in a natural point in the app :slightly_smiling_face:

--- 
> ####  Again apologies if this is covered elsewhere - I'm trying to figure out how best to think about AppIntents as a whole.  Long term, should I be converting all internal distinct actions of my app - even if not uses in Shortcuts or otherwise - to be AppIntents?  For example, if the app has a "move to trash" functionality, I have normally workflow to delete data / clean up / whatever. Long term should I be encapsulating this functionality into a single AppIntent?


|U03H3MTANBZ|:
I would focus on moving to AppIntents functionality that you expect you might want to expose to the system (whether that’s Shortcuts, Siri, or other system components).

|U03H3MTANBZ|:
You can even callAsFunction an AppIntent type if you want to execute it from within your app. (This will call perform and donate it to the system).

|U03JH1D27C1|:
But if I’m just adding some new piece of functionality that won’t be exposed, internal to the app, is there value in structuring it as an AppIntent now, rather than migrating it in X years?

|U03H3MTANBZ|:
<@U03JH1D27C1> I wouldn’t say so, no.

|U03JH1D27C1|:
Is `callAsFunction` for AppIntents spoken about or documented somewhere? I’m not familiar with this!

|U03JH1D27C1|:
Or is that a SwiftUI thing :wink:

|U03H3MTANBZ|:
Nope, it’s a Swift feature.

|U03HFBW311B|:
It's a Swift feature that allows you to call a type as a function, here's an example:
```
struct MyIntent: AppIntent {
    static var title: LocalizedStringResource = "My Intent"
    
    func perform() async throws -&gt; some IntentPerformResult {
        return .finished(value: "Result string")
    }
}

let intent = MyIntent()
let result = try await intent()
```

|U03JH1D27C1|:
<https://developer.apple.com/documentation/appintents/appintent/callasfunction(donate:)?changes=latest_minor>

|U03JH1D27C1|:
Great - thanks, didn’t know about that!

|U03JH1D27C1|:
So is it recommended then to use the AppIntent internally as much as possible in order for donations to occur?

|U03JH1D27C1|:
Let me run through my use-case…

|U03JH1D27C1|:
1. I have a “start timer” shortcut now
2. If the user starts the timer in the app, it uses different code, but also donates the INIntent 
So my understanding now is:

1. Convert this shortcut to be an AppIntent
2. When the user starts the timer in the app, run the AppIntent as above so it’s donated
3. No need to manually donate anything

|U03JH1D27C1|:
(so _only_ run the new AppIntent, even internally, not the separate code directly that starts the timer)

|U03H3MTANBZ|:
Yes! That would save you from needing to manually donate.

|U03H3MTANBZ|:
If that doesn’t work, you can always donate manually in a similar pattern to what you already do for INIntent, but yeah the callAsFunction trick is a nice way to avoid having to do donations, and to centralize the code.

|U03JH1D27C1|:
Ok that sounds great!

|U03JH1D27C1|:
Sorry if this is already answered, but can you point me to how to donate an AppIntent manually if I’m not calling it directly?

|U03H3MTANBZ|:
<@U03JH1D27C1> call `donate` on the Intent. Or use `IntentDonationManager`

|U03JH1D27C1|:
Great - thanks. Hadn’t seen that one either!

|U03HFBW311B|:
Also look into the `PredictableIntent`  protocol that would allow the system to provide suggestions for your intents

|U03JH1D27C1|:
<https://developer.apple.com/documentation/appintents/intentdonationmanager?changes=latest_minor>

|U03JH1D27C1|:
<https://developer.apple.com/documentation/appintents/predictableintent?changes=latest_minor>

|U03JH1D27C1|:
Thanks for all the help on this!

--- 
> ####  In a muli-turn interaction (like confirmation or disambiguation) –does Siri manage the dialog state, or is your app in the loop at each turn?


|U03H3MTANBZ|:
Interesting. Can you clarify what you mean by “Dialog State”?

|U03J8GWEFU7|:
I’m trying to get my head around how an app and Siri share responsibility in an active conversation.

|U03H3MTANBZ|:
You make requests using AppIntents API (say “confirm” or “disambiguate”), your app waits using async/await, and gets the result back.

|U03H3MTANBZ|:
While your app is waiting, Siri is interacting with the user and waiting for them to respond.

|U03J8GWEFU7|:
Thanks Michael, that’s really helpful :pray: I’ve never created an Apple app before either!  so i’m  learning a huge amount this week.

|U03J8GWEFU7|:
Would a Swift Playgrounds app be an easy way to start exploring these APIs? Or would the food truck repo in xcode be the better place to start?

|U03HJ9140PM|:
Start with Food Truck — App Intents currently do not work within a playground.

|U03J8GWEFU7|:
thank you <@U03HJ9140PM> !!

--- 
> ####  Hi there! I've gone about implementing a `SetFocusFilterIntent` and my app builds/runs just fine, but the filter is not present in Settings - Focus - Add Focus Filter. I've looked around for potential solutions, one being ensuring the command line tools are set to Xcode 14. I've done this step, but to no avail. Thank you in advance, and congrats on all the great new APIs!


|U03H3MTANBZ|:
Hi! I would make sure to restart your phone, first.

|U03H3MTANBZ|:
Sounds like you’re already aware of the Xcode issue.

|U03H3MTANBZ|:
If that doesn’t work, can you check for a metadata.appintents directory in your built app bundle?

--- 
> ####  I have been an avid enthusiast when it comes to working on shortcuts. I used it a lot during the more restrictive covid days to pick from a list of Services, output was the phone number on QR form. The iPhone then just dials it when the customer taps the confirmation on the screen. I do have a suggestion. can we build blocked actions? and if so, if the only thing that changes is a variable, that could become a block with a drop down menu,…Its not the most efficient when having to duplicate actions over and over.. and scroll is not always precise. I would also love to have the system kill the shortcut or give a signal that it is running.. (thats another bloc, sensory feedback to test progress of the app. I have had to string along 5 segments of an app that I had to test part by part, which means that each one has the command to end the shortcut, so running them daisy chained doesn’t work that well. I have spent a lot of time working on cool little projects.. I have a journal log to a cloud file, and another that goes to a synced Reminder. I did have a very special Work shortcut. Location aware, it first pulled the end time of my shift for that day from a public (but unposted) calendar. from a predetermined set of phrases, it picked one at random. They all said “Hey love, I just arrived at work. I’ll miss you. I will get out at” Add that time variable to the end of that phrase, send it as a message, activate DND, Low battery mode. This can ostensible be included into Focus modes.. courtesy text at the beginning with a due time.. Best part of it is hat I had all my shortcuts as widgets too.. . I would love to speak to someone from the team, I really have enjoyed the journey.. If only the data that I needed to move was that accessible through Swift.. Thank you all, Frederick 


|U03HJ508QEP|:
Hi Frederick! Super exciting to hear that you’re an avid enthusiast of Shortcuts :smile: It sounds like you have a lot of ideas, and we’d love to talk to you about them at the Shortcuts labs tomorrow from 9AM-12PM PDT. If you are available, the sign up for labs is at <https://developer.apple.com/wwdc22/labs/>
