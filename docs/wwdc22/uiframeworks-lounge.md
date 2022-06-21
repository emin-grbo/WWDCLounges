# uiframeworks-lounge QAs
### Lounge Contributors
#### [tikimcfee](https://github.com/tikimcfee)
#### [shirblc](https://github.com/shirblc)
#### [roblacl@github](https://github.com/roblack) / [roblacl@twitter](https://twitter.com/emin_ui)
---

--- 
> ####  Was something changed on UIDragInteraction? When I tried doing local drag and drop (move) in my app, the drop gets cancelled if my finger is not perfectly still when I lift it. Bug?


|U03H31CT6S3|:
That may be bug. Feel free to file a feedback and join a UIFrameworks lab where we can look into this together!

|U03HELXCTGV|:
It would also be interesting to know if you have any conflicting gesture recognizers. If you do have any other gesture recognizers attached, I would suggest disabling all of them and enabling them one at a time to see which one is causing the conflict.

|U03J20E1BPD|:
That’s a very good suggestion <@U03HELXCTGV>! I have a soup of gesture recognizers. Might be a UISwipeGR!

|U03J20E1BPD|:
Any chance we can lower the duration of the lift gesture (without doing some ugly hacks)?

|U03J20E1BPD|:
I know the duration is reduced if it’s dragged with a pointer.

--- 
> ####  Does the browser-style navigation bar/controller manage the forward navigation stack automatically, and if so, is it accessible for, say, a custom swipe forward gesture a la Safari?


|U03HELWFGKF|:
The browser mode doesn’t manage a forward navigation stack, so you’ll have to bring your own implementation (and a gesture if you like).

|U03HELWFGKF|:
It may also be more flexible to bring your own back/forward stack for this case, as if your app adapts to compact modes you may want to fallback to a more traditional navigation style (the navigation bar will do so automatically)

|U03J4DRK4SY|:
Looking at the UINavigationItem docs, I see there's a new `backAction`  property but there's not a corresponding one for going forwards. So is the forwards button itself something I'd also need to add myself?

|U03HELWFGKF|:
typically for forward/backward navigation we would recommend using `UIBarButtonItem`s for that (in the leading position)

|U03HELWFGKF|:
the `backAction` gets translated slightly differently, and would (in browser mode) produce a typical back button rather than what you likely want for “go back” in the browsing stack

|U03HELWFGKF|:
its _certainly_ a subtlety here, but this is what Files does and what we would probably say is best

|U03J4DRK4SY|:
I see. So putting my own bar button item in the leading position would place it after the builtin back button but before the title

|U03J4DRK4SY|:
And to match the appearance, it seems like the back button is just using the chevron.left SF symbol in the default size/config

|U03HELWFGKF|:
the default is `chevron.backward` (which is left in LTR). If you specify this as the image for a `UIBarButtonItem` UIKit will supply the proper symbol config to match

|U03HELWFGKF|:
so to sum up, to get File’s style, set 2 items with `chevron.backward` &amp; `chevron.forward` and manage your own stack (replacing content as necessary). Then you can reorganize when in compact to a more traditional UI

|U03J4DRK4SY|:
Awesome, thank you!

--- 
> ####  Thanks for the great session! Love UIKit so much. In a UIKit app if you enable Mac Catalyst with the Mac idiom, is it possible to opt into native macOS SwiftUI? By default it uses the iOS style for Form for example which isn't ideal when you're building UI that'll only be used in your Mac app. Thanks!


|U03HB0D5W22|:
No, you can either use SwiftUI in native macOS (AppKit) mode, or Catalyst (UIKit) mode, but not both.

--- 
> ####  Thank you for such a great improvments! As of iOS 15, when you`re using .estimated() size of NSCollectionLayoutSection`s boundarySupplementaryItems you can`t simultaneously use its visibleItemsInvalidationHandler properly. Does that fixed in iOS 16?


|U03HL03H7QC|:
Hi, we still don’t support mutating items via `visibleItemsInvalidationHandler` in Compositional Layouts that are self-sizing. If you’d like to talk about your specific use case, I’m happy to talk about alternatives, in either our Q&amp;A later today (Pacific Time), or in a 1:1 Lab session.

|U03HW7TNB5F|:
Probably a 1-1 lab might be better for this question.

|U03J223TNSE|:
Thank you! 1-1 lab sounds good

--- 
> ####  Will multiple windows be supported in iOS? Right now we need to use UIKit lifecycle if we want to show HUD that overlays the entire app. For example: <https://www.fivestars.blog/articles/swiftui-windows/|https://www.fivestars.blog/articles/swiftui-windows/>


|U03HELXCTGV|:
Hi there, do you mean supported in _SwiftUI_? I think this might be a better question for the <#C03HX19UNCQ|>.

|U03JMMN8659|:
Hi <@U03HELXCTGV>, thank you, yes you're right

--- 
> ####  We'd like to improve our app &amp; framework to have a better desktop-class experience. For that, we'd like to utilize `UIContextMenuInteraction` and the new `UIEditMenuInteraction`. How should we decide where to use one or the other? Can context menus on iPadOS be presented "in place", like on macOS, without a targeted preview?


|U03H31CT6S3|:
`UIEditMenuInteraction` powers the new light-weight edit menu. With edit menu interaction, on right-click on iPadOS (and macOS), it’ll also automatically present the more compact context menu without a targeted preview. Use Edit menu interaction in contexts where you don’t need a preview, or where the menu shouldn’t block the content (i.e. text, or some canvas type view like Keynote).

|U03JRN827HN|:
Thank you! If I understand correctly, would you recommend using Edit menu to present actions for inserting objects onto a canvas like in Keynote (after a long press or a right click), because a context menu would block the content?

|U03HB0D4JLE|:
`UIEditMenuInteraction` also has an arrow you can point at something, unlike `UIContextMenuInteraction`.

|U03JRN827HN|:
Thank you, Glen! And from what I’ve seen so far, Edit menu can be triggered programmatically as a result of a user action or custom gesture. To make sure: can context menus be triggered in that way as well?

|U03JRN827HN|:
Anyway, thank you both for taking the time to answer my question!

|U03H31CT6S3|:
We do not allow for programmatic activation of context menus, and only for the lightweight edit menu.

|U03JRN827HN|:
Got it. Thank you for clarifying this!

--- 
> ####  In iOS 15, compositional layout with orthogonal scrolling behaviour with a single section in non-full screen size also scrolls vertically, what is the correct way to prevent vertical scrolling for single horizontal section?


|U03HELWUJN9|:
If it is the outer (collection) view that is scrolling, you can set `alwaysBounceVertical = false` on it to prevent the scrolling. However if it is just a single section you may be better of not using an orthogonal section but just a horizontally scrolling collection view. This might be a great question to discuss in the labs later this week to find a solution that works best for you.

|U03JRQ81NEL|:
Thanks, other solution we tried to go back with the flow layout but we then loose the nice things about the declarative relation as in compositional layout.

--- 
> ####  In new UICalendarView, is it possible to change the layout? Like in the iOS Calender app?


|U03H31CT6S3|:
That isn’t possible at the moment. Please file a feedback for us if this is something you’d like to see us add in the future.

|U03JRQ81NEL|:
Sure, thanks.

--- 
> ####  Since setValue:forKey: on UIDevice is not longer supported to force orientation. Is there are step by step explanation of how to force landscape orientation for 1 UIViewController only?


|U03HELY8LR3|:
You can call `+[UIViewController attemptRotationToDeviceOrientation]` and return an updated `UIInterfaceOrientationMask` from `-[UIViewController supportedInterfaceOrientations]`.

|U03HELWUJN9|:
It’s also important to note that `setValue:forKey:` to access and modify internal state is never a supported way to do things. You might get lucky but you should really consider this as not being supported and should file feedback to request API for the feature you are trying to access.

|U03JRR4R3CY|:
Thanks, I somehow missed `attemptRotationToDeviceOrientation` so I’m going to give it a try in a sample project. If that doesn’t work i’m going to see if I can join a lab.

I’ve always avoided using setValue:forKey: but a client was stubborn and demanded a fullscreen button that turned the orientation so I had too.

But thanks I’m going to give it a try :slightly_smiling_face:

|U03JEKFMT4Z|:
Hey <@U03JRR4R3CY> we have also such a button and the same problem now. After the button press we support that the user can rotate back with a physical orientation change. It's not a nice solution in my opinion, but it seems to work to temporarily override supportedInterfaceOrientation, call attemptRotationToDeviceOrientation() and then reset supportedInterfaceOrientation to all normally allowed orientations again.

I started making a prototype here. Maybe it's useful for you too.

--- 
> ####  Is there a way to customize the colors of the chevron that’s shown in the UINavigationBar when returning a UIMenu in the new titleMenuProvider function on UINavigationItem?


|U03J7BUNTDW|:
The chevron will adapt automatically for light/dark mode, but there's no way to specify custom colors. If you feel that this is necessary for your app, please file a feedback report!

|U03HZ4EJJ05|:
Ouch, that’s unfortunate! But thanks for answering my question :pray:

--- 
> ####  The session mentioned NSWindow.collectionBehavior, but how will Stage Manager interact with NSWindow.level? More specifically, if I have a window in my app that I globally float above all other windows by setting the level to NSWindow.Level.screenSaver, will that window still appear in Stage Manager?


|U03HB0LK3FY|:
Window levels still work the same way in Stage Manager, in that they’ll impact the z-ordering of your window with respect to other windows on screen. Otherwise, its relationship to other windows in center stage (like whether it’s considered “floating” or “auxiliary”) is dictated by its collection behavior.

|U03JHTBKY59|:
Thank you Jeff!

--- 
> ####  I'd really love to learn some more about ExtensionKit/ExtensionFramework and extension UIs. Are there any sessions that cover these, and if not, what would be a good lounge/lab to ask?


|U03HB0LK3FY|:
There aren’t any videos or labs specifically about ExtensionKit, but there’s some new documentation that explains how it (plus ExtensionFoundation) work together to host UI and non-UI extensions  <https://developer.apple.com/documentation/extensionkit>

|U03JKSLQ7J6|:
I’ve been checking out that documentation! It looks awesome. It appears that there may need to be some additional host configuration (perhaps in the Info.plist) to register extension points. Is that right, and is that documented anywhere?

|U03JKSLQ7J6|:
The documentation specifically says “A Mac app can also declare its own extension points so that other apps can extend the Mac app’s functionality.“, but I cannot find any details on how.

|U03HB0LK3FY|:
It looks like the details on that might be under-documented in the current seed. Could you write up a docs feedback using the Feedback Assistant app?

|U03JKSLQ7J6|:
Filed FB10061654. Thank you so much!

|U03JKSLQ7J6|:
Are there any good labs for asking about these frameworks?

|U03HB0LK3FY|:
There aren’t any labs about ExtensionKit this year. One thing I did notice, though, which might be catching you — if your documentation viewer is set to Objective-C, you won’t see the Swift-only API in ExtensionKit and ExtensionFoundation.

|U03JKSLQ7J6|:
Ah yes, look at that! I was using the Swift view though.

|U03JKSLQ7J6|:
It looks like I’ll have to wait for updated docs - as far as I can tell, it is impossible to configure a hosting app without some additional information.

|U03JNQ1ABFC|:
Hi <@U03JKSLQ7J6>,

|U03JNQ1ABFC|:
There is some additional extension point configuration required. The "Host" app must declare an extension point by installing am `.appextensionpoint` file in the app bundle's `Extensions` directory. This is a minimal extension point declaration file:

|U03JKSLQ7J6|:
<@U03JNQ1ABFC> oh wow this is incredibly helpful, I’m really excited to check this out!

--- 
> ####  If I have an app that's primarily written in AppKit, is there any way to use SwiftUI to define toolbar items from within an AppKit window? Or does the window itself need to be created by SwiftUI too for that to work?


|U03HHJAKKA7|:
You can attach your own NSView hierarchies to NSToolbarItems. Within these, you can use the `NSHostingController` or `NSHostView` classes offered by SwiftUI to embed a SwiftUI view hierarchy in an AppKit view hierarchy.

|U03HB0LK3FY|:
It is correct that the SwiftUI `.toolbar()` modifier only works with windows that are created and managed by SwiftUI. But, as Chris said, you can bring SwiftUI content into your `NSToolbar` using a hosting view.

|U03HMDFMVNK|:
Got it, thanks!

--- 
> ####  Assuming I am not doing anything custom or low-level involving Metal, are there any AppKit-specific APIs to be aware of to fully support ProMotion displays?


|U03HHJAKKA7|:
macOS 12 added these new APIs to NSScreen.
```
// Variable Rate Refresh
@interface NSScreen ()

/** The maximum frames per second this screen supports.
*/
@property (readonly) NSInteger maximumFramesPerSecond API_AVAILABLE(macos(12.0));

/** The minimum refresh interval this screen supports, in seconds.

    This is the shortest amount of time a frame will be present on screen.
    minimumRefreshInterval and maximumRefreshInterval will be the same for displays that do not support variable refresh rates.
*/
@property (readonly) NSTimeInterval minimumRefreshInterval API_AVAILABLE(macos(12.0));

/** The maximum refresh interval this screen supports, in seconds.

    minimumRefreshInterval and maximumRefreshInterval will be the same for displays that do not support variable refresh rates.
*/
@property (readonly) NSTimeInterval maximumRefreshInterval API_AVAILABLE(macos(12.0));

/** The update granularity of the screen's current mode, in seconds.

    The display will update at the next boundary defined by the granularity, after the minimum refresh interval has been reached. When 0, the display can update at any time between the minimum and maximum refresh rate intervals of the screen. Fixed refresh rate screen modes will return the refresh interval as the update granularity (e.g. 16.66ms for 60Hz refresh rates), meaning updates only occur at refresh rate boundaries.
*/
@property (readonly) NSTimeInterval displayUpdateGranularity API_AVAILABLE(macos(12.0));

/** The time at which the last framebuffer update occurred on the display, in seconds since startup that the system has been awake.
*/
@property (readonly) NSTimeInterval lastDisplayUpdateTimestamp API_AVAILABLE(macos(12.0));

@end
```

|U03HHJAKKA7|:
If you are managing your own refresh timer, these can be helpful.

|U03HHJAKKA7|:
But if you’re just doing normal AppKit stuff, you don’t need to take any action. NSAnimation functionality, for example, will “do the right thing.”

--- 
> ####  In Jeff’s AppKit session, he mentioned heightOfRow  timing will be different in Ventura for dynamic row heights. Does it still work with auto-layout auto-resized row heights? I don’t implement heightOfRow.


|U03J7C29YGY|:
Row height estimation as discussed in the session only apply to NSTableViews whose delegate implements heightOfRow. Auto-layout based rows will continue work as before.

|U03JENQA0TB|:
Excellent. Thanks. Sorry for the double post.

--- 
> ####  Hi again! Another question that Myke said would be best for this venue. Still working with SwiftUI, Xcode 13.4 under macOS Monterey: tried to restrict orientation for deployed app to iPhone/portrait orientation by using the check box in GeneralDeployment orientation, but it still tries to work when going to landscape left/right. In the process, it refuses to scroll in those orientations, and when I return to portrait the headers/UI elements are “scrunched.” This is not solved until I send the app to background, and open the app again. Any ideas on how to tackle this would be appreciated, thanks!


|U03HB0DC1PY|:
You have a portrait-only iPhone app deployed to the Mac App Store, and on the Mac, the app is rotatable, in spite of being portrait-only?

|U03HB0DC1PY|:
That should not happen. Please use Feedback Assistant to file a bug report! Good catch!

|U03J21EKNSE|:
Apologies for the confusion, and incorrect question submission: this is an iPhone app still in development, and has not been deployed to the Mac App Store. 

|U03HB0DC1PY|:
Ah, thank you for clarifying!

|U03J21EKNSE|:
Is there a lounge where SwiftUI/iOS questions could be submitted? I obviously lost my way…

|U03HB0DC1PY|:
We do have swiftui-lounge for SwiftUI questions, but this might be a more generic UIKit question, so you're not in the wrong place, here.

|U03HHJNTFM0|:
For context, is the entire app SwiftUI?

|U03HHJNTFM0|:
&gt; Is there a lounge where SwiftUI/iOS questions could be submitted?
There's a SwiftUI Q&amp;A later today:
<https://developer.apple.com/wwdc22/110393>

|U03J21EKNSE|:
Apologies for the delayed response: it is entirely in SwiftUI. The original version of the app was in UIKit, and the problem is not present there.

|U03J21EKNSE|:
Thank you for the info on the SwiftUI Q&amp;A lounge!

|U03HHJNTFM0|:
np!

|U03HHJNTFM0|:
We're following up with some SwiftUI folks on the expectation here

|U03HHJNTFM0|:
<@U03J21EKNSE>, I just created a super simple SwiftUI test project and scoped it to portrait only on the iPhone in "Deployment Info -&gt; iPhone Orientation" and the app doesn't rotate when I rotate the device physically

|U03HHJNTFM0|:
If you have more information on this we'd love to hear it

|U03HHJNTFM0|:
Otherwise, if you can reduce this to a sample project and file a feedback we'd like to look into it!

|U03J21EKNSE|:
Hello again Steve M. Thanks for doing this. Were you using Xcode 14 for this test project? I am seeing this in Xcode 13.4. I am having trouble downloading 14 (not surprising with everyone trying to download!). I will search for info on how to submit feedback (never done it before); hope to get it fixed!

|U03J21EKNSE|:
Thank you for the follow up; have a good afternoon!

|U03HHJNTFM0|:
I was using Xcode 14.

|U03HHJNTFM0|:
And for Feedback, there's a handy page here: <https://developer.apple.com/bug-reporting/>

|U03J21EKNSE|:
Thank you: incentive to dare use a beta version of Xcode (another first time!)

--- 
> ####  Does NSTableView support dynamic row heights for multi-column tables? When I tried that, if I had multiple columns, it didn't resize the row to the tallest cell's content.


|U03J7C29YGY|:
Automatic row height rows should size to fit the tallest cell's content. If that's not working for you, we'd love you to write a feedback, ideally with a sample project.

|U03JENQA0TB|:
Ok will do. Thanks.

--- 
> ####  How can NSWindow.collectionBehavior be set in a SwiftUI app? And if it can be, does that apply to the entire app or only a specific WindowGroup/DocumentGroup?


|U03HB0LK3FY|:
There isn’t currently a way to request different collection behaviors from SwiftUI — so that would be an excellent enhancement request in Feedback Assistant!

--- 
> ####  Is there a way to present the menu of a UIEditMenuInteraction that’s associated with an instance of UITextInput? I’m working on a text editor where I’m programmatically showing the menu. Previously I could use `UIMenuController.shared.showMenu(from:rect:)`. What’s the equivalent with UIEditMenuInteraction to show a menu with all the standard editing actions?


|U03HELXCTGV|:
Yep, UIEditMenuInteraction has a method called `presentEditMenu(with:configuration)`, which can be used in the same way.

|U03HELXCTGV|:
The default menu will contain the standard edit actions. You can override the menu if you'd like via `menuForConfiguration` on UIEditMenuInteractionDelegate.

|U03HZ4EJJ05|:
<@U03HELXCTGV> Thanks for your replies.

I tried grabbing the UIEditMenuInteraction from UITextInput’s interactions and present it with `presentEditMenu(with:)` . However, I’ll need to pass a configuration with an ID. When supplying `nil`  as ID, the menu isn’t shown because it doesn’t have any command and/or actions.

If I pass `UITextSelectionView.SelectionCommands`  as ID it works but that feels a bit wrong. I’ve only gotten this ID by happenstance because my console showed some errors earlier.

|U03HZ4EJJ05|:
Is this the recommended way of doing it?

|U03H31CT6S3|:
You should install your own UIEditMenuInteraction; if nothing is showing when you call `presentEditMenu(with:)` , then there’s a good chance that nothing is responding YES to canPerformAction:withSender: so I’d verify that your actions can be performed.

|U03HB0D4JLE|:
Also, if you _just_ want to add/remove/change some menu items for the edit menu that comes up on a `UITextInput` like text view etc., you can override `buildMenuWithBuilder:` on any suitable view controller in your hierarchy and use `UIMenuBuilder` to change the menu.

--- 
> ####  Xcode 13.4.1 / M1 Max MacBook Pro / macOS 12.4 a pure SwiftUI app run on "My Mac (Mac Catalyst)"   choosing a SignInWithAppleButton() added in a view crashes the app with:  _AuthenticationServices_SwiftUI/SignInWithAppleButton.swift:303: Fatal error: Attempting to present ASAuthorizationController from a SwiftUI view not in a hierarchy. This should not be possible, please file feedback.  Anyone ware of this and what might be done to fix this?


|U03HL05FX6Y|:
This sounds like a bug in SwiftUI. Please, file a Feedback request and attach this sample project

|U03JH6HKC66|:
Already did (FB10033240).
Was hoping for some additional clues :slightly_smiling_face:
This currently prevents me from updating an active app in the store with SignInWithApple functionality :confused:

|U03HHJP6N3C|:
Thanks for the feedback number, I’m taking a look now

|U03HHJP6N3C|:
On the new SDKs, I’m not reproducing a crash with the attached sample app. Have you tried with the new Xcode beta yet?

|U03JH6HKC66|:
not yet. Lacking a second M1 config to install beta on without compromising my working production enviroment.

|U03HHJP6N3C|:
I’ve added some detail to the bug, and also sent it to the AuthenticationServices team to double check. I don’t have an immediate workaround, but from what I’m seeing this should be resolved in the newer SDKs, so please update us once you have the chance to test if you’re still encountering issues

|U03J22A0C4S|:
<@U03JH6HKC66> You can run the Xcode 14 beta alongside your existing Xcode install without issue.

|U03JH6HKC66|:
Thank you. I will try to get the beta SDKs running on my system asap so i can double check.
Would be a shame if it could only be resolved with the new SDKs as it will be a while until i can upload to AppStore with them.

|U03JH6HKC66|:
<@U03J22A0C4S> i was under the impression i would need macOS 13 for Xcode 14. But seems i misread that. It's the other way around.

|U03J22A0C4S|:
Yeah, runs fine under 12.4. 13 is incompatible with Xcode 13. (Hopefully not permanently.)

|U03JH6HKC66|:
<@U03HHJP6N3C> i tried with Xcode 14.0 / macOS 12.4

I can still reproduce this behavior with Xcode 14.0 / macOS 12.4.
Make sure to add and run *Supported Destination* _Mac Catalyst_. _Designed for iPad_ is working fine.

iOS Deployment Target 15.5 / macOS 12.3 (any higher settings give me a "The app is incompatible with the current version of macOS" on macOS 12.4).

|U03HHJP6N3C|:
Thank you for the additional info, after changing some project settings I am reproducing the crash. Looking…

|U03HHJP6N3C|:
Based on the crash backtrace, this does seem to be a bug with the SignInWithAppleButton in Mac Catalyst. I’ve gotten it to the right folks, we don’t have a workaround for you right away but we’ll update the bug as we look into it. Thank you for bringing this to our attention!

|U03JH6HKC66|:
Thank you.
I am happy you were able to reproduce the bug so i am sure it’s not something i am doing wrong. Looking forward for a fix / updates.

--- 
> ####  Does "UIFrameworks" mean not Swift UI? Is this code for non-SwiftUI UIFrameworks?


|U03HW7TNB5F|:
If this is a pure SwiftUI question you should use the SwiftUI lounges. If this is a question about how to use UIKit/Appkit with SwiftUI this might be a good lounge to ask your question.

|U03JH1ULBCH|:
K. Point I am making is general, that maybe using "UIFrameworks" as a way of saying "Not Swift UI" is not clear. I think UIKit could get its own room (IDK what AppKit people would want).

Apple is probably going to be making this distinction for a while so maybe think about what you call "UIFrameworks but not SwiftUI"

--- 
> ####  Starting from iOS 16, buttons on the screen don’t receive touches when a UIMenuController (nay, a menu of a UIEditMenuInteraction) is presented. When attempting to select a button on the screen that’s outside of the menu, the menu will be dismissed but the selected button will not receive the touches. This is a change from iOS 15. Is this intentional or a bug in beta 1?  The behavior in iOS 16 poses a problem in my app that lets users select some text, in which case the UIMenuController may be shown, and act on that selected text by selecting a button on the screen.


|U03H31CT6S3|:
Hey hey! This is definitely a bug and we are tracking this internally already.

|U03HZ4EJJ05|:
Awesome! Glad to hear that. Thanks for your reply <@U03H31CT6S3>

|U03H31CT6S3|:
Yeah np! And if you find any issues, please feel free to file a feedback for us to address as soon as we can!

|U03HW7TNB5F|:
Filing feedback on issues like this is very helpful!

|U03HZ4EJJ05|:
It’s filed as FB10080311

--- 
> ####  Is the new `UIHostingConfiguration` bound only to collection and table view cells? Or is this API designed to be used in other places where I might "inject" SwiftUI views in the middle of custom UIKit view hierarchies?


|U03HW7U6QF3|:
UIHostingConfiguration is designed to be used with UICollectionView and UITableView cells. Watch the video “Use SwiftUI with UIKit” coming on Thursday later this week to learn more about it, and other ways to integrate SwiftUI into your UIKit app! <https://developer.apple.com/wwdc22/10072>

|U03JRN827HN|:
Thank you! So if I’m vending a mostly UIKit-based framework and I want my users to be able to customize/replace a part of the hierarchy with SwiftUI, embedding a child `UIHostingController` continues to be the most recommended way to support this? `UIHostingController` looked to be a _much_ better fit… :smile:

|U03HW7U6QF3|:
`UIHostingController` is the most general-purpose API to embed SwiftUI inside your UIKit app. Because it is a view controller, you can use it anywhere you can present or embed a view controller in UIKit, and all SwiftUI features are supported inside of it (including ones that require a connection to the view controller hierarchy in UIKit). UIHostingController also has some new features in iOS 16, so be sure to watch the “Use SwiftUI with UIKit” video to learn more about all of this later this week.

|U03JRN827HN|:
Noted, I’ll be sure to do so. Thanks again for answering my questions!

--- 
> ####  Most SF Symbols appear to have transparent background colours. In AppKit, is there a way to get a white background colour so that coloured symbols look good on NSPopupButtons? Right now when the selection is hovering over an NSMenuItem with a coloured SF Symbol for the image, the symbol colour doesn't change to make it viewable. For example, if your accent colour is yellow and the NSMenuItem's image is yellow, it basically disappears from view (yellow on yellow).


|U03HB0LK3FY|:
In general, we don’t alter color images for states like menu highlight, because your image might be something like an icon which doesn’t make sense to draw with a white foreground.

However, I think your SF Symbol example is a good case where we could be smarter, since we know more about the underlying symbol image. That would be an excellent enhancement request for us.

|U03JENQA0TB|:
Excellent. I’ll submit feedback for it. When setting to multi-coloured SF Symbols, NSPopupButton just completely removes all the colours. But explicitly setting colours for them using pallet configuration does show the colours, but doesn’t invert or change the highlight state when traversing the popup button.

|U03JENQA0TB|:
Here’s my popup button example with SF Symbols.

|U03HEM646TX|:
`NSMenu` does have a delegation mechanism that can tell you when an item has been highlighted. Try implementing `-menu:willHighlightItem:`, and altering the highlighted item. Since these are symbols, you could use `-[NSImage imageWithSymbolConfiguration:]` to get a new image with a different configuration, and set that to the highlighted item’s `image` property. Just be sure to restore the original image back to the previously-highlighted menu item and when the menu closes (`-menuDidClose:`).

--- 
> ####  Is it possible to access swiftui environment/modifiers inside UIViewRepresentables?


|U03HB0D5W22|:
Yes. The context passed to `make/updateUIView(context:)`
has an `environment` property you can read from.

<https://developer.apple.com/documentation/swiftui/uiviewrepresentable/makeuiview(context:)>

|U03HB0D5W22|:
Or you can use `@Environment` in your representable struct.

|U03JRQ81NEL|:
Thanks :blush: 

--- 
> ####  Is there a known issue with keyboard shortcuts in UITextView where if you type command-B then press ‘B’ straight after, the ‘B’ key press is not registered? (It’s when the keystroke is the same letter as the previous command key combination.)  I thought it was our bug originally, but haven’t made any headway into what’s causing it.


|U03HELXATD3|:
Is this a new issue in iOS 16? Are you able to reproduce this in a sample app? This is not a known issue at the moment

|U03HELXCTGV|:
Are you still holding the command key on the second 'B' press?

|U03J1R49EVB|:
This is an issue in iOS 15 (not tried in 16). Definitely not still holding command. 

Sample app is our next step, although we hit it in two apps so far (but with some shared code so the bug could be in there).

|U03HELXATD3|:
Unfortunately I’m not able to reproduce this in a UITextView with allowsEditingTextAttributes enabled. Hitting ⌘B toggles boldface on the selected text, then hitting B replaces the now-bold text into a “b”.

|U03HELXATD3|:
If you’re able to reproduce this in a sample app, and file a bug report with the report attached (and post the report here), that would help us investigate the issue further!

--- 
> ####  What should I do when I encounter performance issue when I have hundreds of CAShapeLayers (ink strokes) inside a huge UIScrollView content view? Should I consider rasterization solutions such as CATiledLayer?


|U03HELXCTGV|:
To start, it might be better to try and see if you can flatten it and use a single shape layer instead of several separate ones. You should be able to combine the shapes together by using things like `CGPathCreateCopyByUnioningPath`.

|U03HELXCTGV|:
Depending on what you're trying to do, it might even be better to try and use a Metal shader instead.

|U03HELXCTGV|:
I encourage you to schedule a lab appointment so we can look at it together!

|U03J20E1BPD|:
<@U03HELXCTGV> Actually having one giant shape layer with huge amount of points is performing worse. I had to split a long stroke into multiple CAShapeLayers to prevent frame drops.

|U03J20E1BPD|:
I’ve never used Metal before, it seems daunting. Where should I start? I’m simply trying to add a lot of bezier paths into the canvas.

|U03HB0D4JLE|:
You can try `shouldRasterize = YES`, which can be set on the shape layer or some super layer. Sometimes that will avoid the perf issues.

|U03HB0D5W22|:
You might want to try using SwiftUI Canvas, which you can embed in your UIKit app if you need to. SwiftUI Canvas uses Metal to render the draw commands you issue it, so it’s very performant.

|U03HB0D5W22|:
<https://developer.apple.com/documentation/SwiftUI/Canvas>

|U03HB0D4JLE|:
Caveat: `shouldRasterize` does slow down animation though, so keep it on only when your UI is at rest.

|U03HB0D5W22|:
It won’t give you as much control as using Metal directly, but if you just need simple bezier paths, it might be a good higher level fit.

|U03J20E1BPD|:
Actually it’s for inking, so I’ll need to be able to dynamically add points, as well as moving them around.

|U03HELXCTGV|:
You may also want to try making a custom UIView subclass, override `drawRect()` , and use CoreGraphics to draw the ink strokes instead. This will allow you to only draw the strokes that are visible (in the rect parameter passed in to `drawRect`).

|U03HB0D4JLE|:
Yeah, so you would bracket your addition/animation/moving code with `shouldRasterize = NO` and `shouldRasterize = YES`.

|U03J20E1BPD|:
Does scrolling in the scroll view count as animation?

|U03J20E1BPD|:
Also, if I turn on `shouldRasterize`, things get blurry after I zoom in. How do I trigger a rerender?

|U03HB0D4JLE|:
It shouldn't, but YMMV. The idea is that if nothing changes within the shape layer, it should be safe to rasterize w/o negative impact.

|U03HELXCTGV|:
I think you should be able to call `setNeedsDisplay`

|U03HB0D5W22|:
Scrolling does not count as animation. Animation would be if you were animating the individual CAShapeLayer between different bezier paths. Animating the position of CAShapeLayers with shouldRasterize enabled should also be okay.

|U03J20E1BPD|:
So, I have a giant container UIView (inside a scrollview), containing a ton of small but overlapping CAShapeLayers. What’s the difference between turning on `shouldRasterize` on the container view vs. the individual shapelayers?

|U03HB0D4JLE|:
I would guess that rasterizing the container view would be most performant, because scrolling would only be moving the one rasterized bitmap, rather than having to recomposite multiple bitmaps. But you'll really have to try this out to see if it works for you.

|U03HELXCTGV|:
Another thing you can try is setting `drawsAsynchronously = true` on the shape layers. This will allow the layers to perform the actual drawing on background threads, which may be faster, but since it won't be synchronized with the main loop, you might "see" the strokes being drawn independent of the current CA transaction.

|U03HB0D5W22|:
I _think_ setting shouldRasterize on only the container view will rasterize all of the overlapping CAShapeLayers into one bitmap. Setting shouldRasterize on the only the individual CAShapeLayers will rasterize each bezier path separately, and CA will not cache the composition of them all together. I’m not sure which of these is more or less performant, and the answer might depend on your implementation.

|U03J20E1BPD|:
Say I have a 10000pt height container view with two tiny shape layers on top-left and bottom-right, does setting shouldRasterize on the container view create a giant bitmap that will kill the app due to memory pressure?

|U03HB0D4JLE|:
When I worked practically on these sorts of issues, I would have to tweak `shouldRasterize` depending on what was being displayed. E.g. turn it off for large shapes, turn it on for small shapes. You may even have to figure out which shapes could be combined in a rasterization e.g. by putting them in a common layer and setting the flag there.

|U03HB0D4JLE|:
The main advantage of `CAShapeLayer` here (vs some manual rasterization like drawing into a context) is good memory use for large, unrasterized shapes and inbuilt animation between states.

|U03J20E1BPD|:
I noticed that with a lot of `CAShapeLayer`, `backboardd` gets saturated causing the frame drops, while none of my app’s CPU and GPU are high.

|U03HB0D5W22|:
CALayers (including CAShapeLayer) are rendered with Metal in another process (as you’ve observed), so that’s why you’re seeing that process get saturated, not your own.

|U03HB0D5W22|:
&gt; Say I have a 10000pt height container view with two tiny shape layers on top-left and bottom-right, does setting shouldRasterize on the container view create a giant bitmap that will kill the app due to memory pressure?
I think the memory pressure would be in another process, not your app (since CAShapeLayer is rendered out of process), but in general I think this would cause memory pressure on the system. So I don’t think you want to use `shouldRasterize` on large layers.

|U03J20E1BPD|:
Is there a way to debug memory use by this rendering process?

|U03HB0D5W22|:
That’s a good question, and I’m not sure. Can you put these questions together in a developer forum post? If you paste the link to a post here, I can forward it on to the Core Animation team.

|U03J20E1BPD|:
Hmm, I’m afraid I don’t have time right now to write a post. Is there a lab I can go to to talk to the CA team? Is it Core Graphics Lab or UIKit lab?

|U03HB0D5W22|:
I’m afraid not. A forum post is the best way to communicate with the Core Animation team.

|U03HELXCTGV|:
Yes, we have labs on Thursday and Friday. Make sure to sign up!

--- 
> ####  What's the simplest way to edit the AirDropped file's thumbnail and filename for the iOS sharesheet?  Is there an updated or modern best practice version of the sample code: <https://developer.apple.com/library/archive/samplecode/sc2273/Introduction/Intro.html#//apple_ref/doc/uid/DTS40013842|https://developer.apple.com/library/archive/samplecode/sc2273/Introduction/Intro.html#//apple_ref/doc/uid/DTS40013842>


|U03H31CQZ0F|:
Provide a `LPLinkMetadata` object to the activity view controller. The easiest way to do this is using a `UIActivityItemsConfiguration` object.

```
let sharedItem = NSItemProvider(contentsOf: url)

let aic = UIActivityItemsConfiguration(itemProviders: [sharedItem])

let previewImage = UIImage(...)
let previewImageProvider = NSItemProvider(object: previewImage)

let lm = LPLinkMetadata()
lm.URL = url
lm.imageProvider = previewImageProvider

aic.linkMetadata = lm

let avc = UIActivityViewController(activityItemsConfiguration: aic)

// present avc
```

--- 
> ####  Hi, how can I change some properties of NSWindow (such as the titlebar color) when using Catalyst?


|U03H31N3E9M|:
Use the `UITitlebarTitleVisibilityHidden` option on `UITitlebar.titleVisibility` to disable the titlebar material, window title, and its toolbar. You can then provide your own view underneath. The window’s safe area insets still apply and the area beyond those insets remain draggable. Note that the `UITitlebar` cannot have an `NSToolbar` in order for this to work.

|U03H31N3E9M|:
Also feel free to file feedback requesting enhancements if you wish to do this while maintaining a window toolbar!

|U03HZ81AHCN|:
Therefore there is no way I can keep the window toolbar so that the user can still see (for example) the window title (and modify the background color at the same time)?

|U03HHJP6N3C|:
That is correct, there is no way to do that by default. But if you set the titlebar visibility hidden, since you then manage your own content in that region you can add a UILabel with the window title

|U03HB0LK3FY|:
Design-wise, on macOS we do generally prefer to use the standard toolbar/titlebar backing for consistency across the system. It plays an important role in communicating which window is currently frontmost. There are exceptions, like the new Weather app, but they’re fairly exceptional.

|U03HB0LK3FY|:
It’s totally OK to go for something custom (we love creative designs!) but if you do, you’re also taking responsibility for those affordances.

|U03HZ81AHCN|:
<@U03HB0LK3FY> Thanks for the suggestion! In fact, I was trying to keep the titlebar in order to give the Catalyst app a more “macOS” feel, but without simulating the default appearance with custom labels, since it almost never looks quite the same as the system

--- 
> ####  I saw an app that shows the multitasking dots at the top of the screen, but still hides the reset of the status area. I could not figure out how to do that. Do you have a suggestion on how best to do this?


|U03HB0D5W22|:
I think returning `true` from an override of `prefersStatusBarHidden` on a view controller in your app will achieve this effect.

|U03J22P9WKH|:
Ah, yes, that does it. Thank you!

--- 
> ####  UIHostingConfiguration question - I was expecting onAppear calls to be made on the hosted Views as cells move on screen, but it seems that they line up with (I assume?) the reused cell population.  If I adjust your UseSwiftUIWithUIKit demo to increase the cell counts and add a print on onAppear I see fewer logs than I would expect to see.  And no logging once I scroll through all of the content.  Curious if this expected behavior before, or a function of this being beta?


|U03HW7U6QF3|:
Great question, the intent is for `onAppear` used inside UIHostingConfiguration to behave like it does in a SwiftUI `List`, however it’s a known issue in the current iOS 16 beta that it isn’t called with the expected timing :thumbsup:

|U03J1UU7HS7|:
Fantastic, thank you!

--- 
> ####  I would like to allow users to configure command keys for menus in my app. However, I have not found a way to change the command keys (or add / remove  menus) after the initial builder phase occurs (via the AppDelegate). As a test, I built my menus, and then used a Dispatch after to remove the View menu after 4 seconds. I'm reusing the same builder that was passed in. However, nothing happens. Is the expected? Is there a way to update the command keys after launch?


|U03HELXATD3|:
Updating the main menu needs to happen synchronously in the `-buildMenuWithBuilder:` method. If you want to update the main menu later, you need to call UIMenuSystem.main.setNeedsRebuild(), and that’ll call buildMenuWithBuilder again (lazily).

|U03J22P9WKH|:
awesome!

|U03HB0DC1PY|:
Also note that on macOS / Catalyst, it is best to avoid a dynamically changing menu bar structure.
All items should be in the same location at all times, so they're easy to discover and their location is easy to remember.
Instead of adding/removing items, use validation to disable items when they are not applicable.

--- 
> ####  Catalyst question: I would like create a custom cursor that is dependent on settings in the UI that only works inside a specific view (e.g., a tool). Normally on Mac, that would be done with an NSTrackingArea. Since UIPointerInteraction is not supported on Mac, how should I go about doing this?


|U03HHJP6N3C|:
UIPointerInteraction should work with Mac Catalyst, and allow you to customize the cursor using NSCursor API when hovering inside a view using its UIPointerInteractionDelegate methods. Can you share some more detail about where you are seeing this not work? If this isn’t working, please file a feedback with a sample project so we can take a closer look!

|U03J22P9WKH|:
OK - I'm a little confused by what you wrote. I have code which uses UIPointerInteraction and implements the delegate's
`func pointerInteraction(_ interaction: UIPointerInteraction,styleFor region: UIPointerRegion)`
 On iOS, I get the desired cursor:
`let cursor = UIBezierPath(ovalIn: rect)`
`return UIPointerStyle(shape: UIPointerShape.path(cursor))`
That does not do anything on Mac. It sounds like I should conditionalize inside the delegate method and call NSCursor?

|U03J22P9WKH|:
Ah, I should use willEnter /willExit and call NSCursor.

|U03HHJP6N3C|:
Ah, yes. UIPointerStyle is available on Mac Catalyst to reduce conditionalization, but won’t affect the NSCursor appearance the same way it does on iPad. And yep, that was just the answer I was typing out!

|U03J22P9WKH|:
Thank you - the thing I noticed is that if the cursor is already in the view, then the cursor doesn't get set (e.g., if you have the mouse over something and you click, which then displays a new view which now encompasses the cursor. In that case, the methods for willEnter gets called but the cursor doesn't update for some reason. I have to move the cursor out of the view and back in (I have logging to show that).

|U03J22P9WKH|:
If that's not expected, I can make a project + feedback.

|U03HHJP6N3C|:
This is definitely at least something we’d like to take a look at, so please file a feedback!

|U03J22P9WKH|:
FB10082348 submitted.

--- 
> ####  Is it now possible to create custom app-specific extensions that are not pre-defined by Apple or am I misreading the ExtensionKit docs? If this is possible, is there a good session to watch this week?


|U03HS8NL6UF|:
Here is a previous question on ExtensionKit. Seems like there is no session on that this year, though. <https://wwdc22.slack.com/archives/C03H9K1JYJY/p1654627443299689>

|U03JNQ1ABFC|:
&gt; Is it now possible to create custom app-specific extensions that are not pre-defined by Apple or am I misreading the ExtensionKit docs?
It is possible for macOS apps to define an extension point. Other 3rd party apps can then embed AppExtensions that target the extension point.
&gt; If this is possible, is there a good session to watch this week?
There are no sessions planned for ExtensionKit this week. (edited)

|U03JE2L47J8|:
Great news! This is something I'm excited for even if it only works with macOS.

|U03JE2L47J8|:
Are these extensions App Store compatible?

|U03JNQ1ABFC|:
Yes.

--- 
> ####  Probably it is more core services but I can't find anything like that, so: We have a case where iPad is the heart of a system. Or rather iPads. In the aircraft cockpit it is one of the most powerful and flexible units. Now - we need two or more devices to communicate (pilot, co-pilot, cabin crew...). Yet regulators have very specific need that one device is a master and manages synchronization with others.  We found that iPad is not providing things like services (e.g. http/soap/rest/socket server) that would be running no matter if app is open or closed (pilots are using many apps for different purposes) - is that achievable in any way?  Clients would love to see iPad-only solution but we are limited now to use windows machine acting as server and iPad devices are just clients (with quite similar functionality).


|U03HELWUJN9|:
This is a very great question. Right now it is not generally possible to have code running indefinitely while an app is in the background. We have special endpoints for things like voip but do not support generic background processes. I’d suggest filing feedback and also reaching out to evangelism about potential use cases that you might have for this.

|U03HELWUJN9|:
Also a disclaimer: this question has legal implications since you are mentioning aviation which is explicitly mentioned in the iPadOS license agreement under 7.5. So the answer above is purely based on the technical feasibility as we can not give you legal advice here.

|U03HME38VK9|:
<@U03JFDDG9QD> Wondering if Multipeer Connectivity framework would work for you.

|U03J4EZ3ZHA|:
Multipeer is odd cause there's no real “host” and “client”…. You could manage a host using communicated meta data though.

I also think you disconnect from the network when the app gets backgrounded too…

|U03H31CQZ0F|:
You might want to take a look at CoreBluetooth, as it explicitly allows an app to continue scanning for peripherals while backgrounded. See [this doc](<https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/CoreBluetoothBackgroundProcessingForIOSApps/PerformingTasksWhileYourAppIsInTheBackground.html|https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Concep[…]orIOSApps/PerformingTasksWhileYourAppIsInTheBackground.html>)

This is _not_ a recommendation for your application. Please contact developer relations to explore legal and other implications.

|U03JELM0ZNV|:
In case you're still checking your thread - talk to the folks at ditto.live who are ex-Realm engineers doing a *lot* of work with in-plane communications.

--- 
> ####  Looks great! I assume apps that already have a More (overflow) menu should migrate the items to additionalOverflowItems. Is that correct?


|U03HELWFGKF|:
for iOS 16 I would say definitely! In part it will help you a lot in Stage Manager, as you won’t have to do as much to respond to size changes

|U03HELWFGKF|:
there are a few different ways to interact with it. centerItemGroups will flow into it first, but so will trailing items (as a group via the older `rightBarButtonItems` API, and by-group in the new `trailingItemGroups` API).

|U03HELWFGKF|:
there is also the `additionalOverflowItems` that can be used to add content directly to the overflow button’s menu – we think this will be rare, but can be useful for specific use cases.

|U03K11CE03T|:
Thank you. And from the sample code, it looks like the optional group does NOT flow into the overflow button's menu.

|U03HELWFGKF|:
optional groups should flow if there isn’t enough room

|U03HELWFGKF|:
but items that are not in the customization currently go no where (not directly accessible). We’re considering some control over that behavior however.

|U03K11CE03T|:
That was what I was getting at. For apps with lots of commands, that would be helpful. Would you like a radar :slightly_smiling_face:

|U03HELWFGKF|:
always helpful!

|U03K11CE03T|:
Will do. Excellent presentation, David. Thank you.

--- 
> ####  This may not be a question with a straightforward answer, but... A degree of consensus in the developer community prior to the current beta releases has been that using SwiftUI inside Catalyst is the most difficult path, and it would be better to target macOS natively directly with SwiftUI. In trying to give the best desktop-class experience on iPad, would it be your recommendation to using a native SwiftUI app, if that is an option, or a Catalyst app with SwiftUI components?


|U03J4D1FEP6|:
Poorly worded as of course what I mean is desktop-class experience on iPad while also targeting macOS as well...

|U03HW7TNB5F|:
Catalyst support is continuously improving. I think that it really depends on on which works best for your App. If you have the luxury to try both you might want to compare the outcomes of each.

|U03HELWUJN9|:
Basically use whatever works best for your concrete situation. There is no one size fits all solution. The range here can be from an app 100% written in UIKit to 100% written in SwiftUI. And it could be a macOS version written in AppKit, using Catalyst or SwiftUI.

|U03HHJNTFM0|:
In what state is your current code base?

|U03HHJNTFM0|:
Is this an iPad app you're transitioning to the Mac?

|U03HHJNTFM0|:
&gt; Poorly worded as of course what I mean is desktop-class experience on iPad while also targeting macOS as well...
Oops, just saw this

|U03JRQ6JMHN|:
What stood out for me in the What's New in SwiftUI session was the advances in Forms. Previously, Forms on macOS seemed to require some, platform specific additions to get nice looking layouts without using Catalyst. With iOS 16 and macOS 13, it looks like you can get great looking Form layouts with nearly the same SwiftUI views. Really nice!

|U03J4D1FEP6|:
Late to the party to see these additional replies. :slightly_smiling_face: My app code base is currently all UIKit, pretty tidy, ready to be modular and move to the next ideal UI architecture.

--- 
> ####  Are there any particular reasons (that you can reveal) for why there’s no general UIHostingView, only UIHostingController, whereas AppKit has NSHostingView available?


|U03HELXCTGV|:
This is intentional, because our architecture relies on a UIView being a part of a view controller hierarchy (and thus, being "owned" by a view controller). Think of things like modal presentations, responder chain, etc.

|U03HL05BUJG|:
This is partially touched on in Use SwiftUI with UIKit as well! <https://developer.apple.com/wwdc22/10072>

|U03J1UAEU4B|:
Thank you!

--- 
> ####  Will SwiftUI slowly replace UIKit? I'm surprised that there is still a lot of content focused on UIKit this year. This video is mostly about UIKit code and I was wondering how I can implement them in SwiftUI, like the editor style toolbar?


|U03HELXCTGV|:
SwiftUI and UIKit are two different layers of abstraction, and one is not supplanting the other. When deciding what to use for your app, you should pick whatever is the best tool for the job.

|U03HELXCTGV|:
Taylor K also had a great answer to this: <https://wwdc22.slack.com/archives/C03HX19UNCQ/p1654645179571169?thread_ts=1654645084.628639&amp;cid=C03HX19UNCQ>

|U03HELWUJN9|:
To add to this, for a lot of developers this means a mix of UIKit and SwiftUI, but it can also mean to start a new app that is written 100% in SwiftUI or UIKit.

|U03HW7NMP6D|:
For the last bit of your question, there will be a couple SwiftUI talks later in the week that go into the new iPad features:
<https://developer.apple.com/videos/play/wwdc2022/110343/>
<https://developer.apple.com/videos/play/wwdc2022/10058>

--- 
> ####  Is there any reason why Live Text feature is not supported in iOS Keyboard extensions?  Using the API either crashes the extension or just prints error logs, depending on the iOS version.


|U03H31CU1C7|:
Have you filed a feedback for this yet? It would be helpful to have the crash logs so we can take a look at what happened - if you have a feedback ID I can pass it on to the appropriate people

|U03HELXCTGV|:
Keep in mind also that the operating system maintains a much stricter memory allowance for keyboard extensions, so it's pretty likely that your extension is being killed by the OS for using too much memory.

|U03JER2C7MX|:
<@U03HELXCTGV> 100% it didn't. 
I was testing it on the template project + I have nightmares where I see our keyboard crashing in 2022 with the same OOM crash, using more than 66 Mb :rolling_on_the_floor_laughing::rolling_on_the_floor_laughing::rolling_on_the_floor_laughing: ... so I won't confuse it :innocent:
In case you're interested about details of why it affects me and my team so much, the feedback ID is *FB10034138*. Would really appreciate for any response on that.

<@U03H31CU1C7> sure. *FB10022377*
There's no system diagnose, but you won't need it, cz there's a test project attached to the ticket.

Thanks in advance.

--- 
> ####  For UIEditMenuInteraction, all the examples in the sessions showed APPPENDING items to the menu. Is it possible to have our custom items at the beginning or even mixed in with the 'suggested' ones if we appropriately shuffle them into the returned menu?


|U03HELXCTGV|:
You can! `suggestedActions` is just an array, so you can prepend to it, append to it, or just return a UIMenu with an entirely different set of children if you want.

--- 
> ####  What sessions can we watch to start learning more about Live Activities for the iOS home screen?


|U03HW7TNB5F|:
Please schedule a 1-1 lab and we will probably be able to better answer this question. Or come to our QA again tomorrow.

--- 
> ####  When an iPad is connected to a low dpi external monitor, will apps run at a 1x scale factor with 1x assets used? Or will they stay at 2x with some sort of downscaling?


|U03HHJNTFM0|:
1x external displays will always be reflected as 2x today.

|U03HHJNTFM0|:
So you do not need to worry about providing 1x assets

|U03KDARQ0QY|:
Thanks!

|U03HHJNTFM0|:
Np!

--- 
> ####  For UIMenuElements, if I change the UIMenuElementAttributesHidden attribute while it's visible, will it disappear?


|U03JFCP39T4|:
Similarly, if I change the title/image, do they update if already visible?

|U03J7BUNTDW|:
No, it won't. The only way to update a visible menu is using `UIContextMenuInteraction.updateVisibleMenu()` if you're using `UIContextMenuInteraction` directly, or by setting the button's `menu` property to a new value if you're using a `UIButton`. Menus are copied when consumed by the system, so any instance you may be holding onto is no longer directly connected to what's visible.

|U03JFCP39T4|:
(off to Feedback Assistant)

--- 
> ####  Not sure if this is the right time for this, but... In iOS 16 UIDevice.name has changed to only return the model name (E.g "iPhone" instead of "Matt's internet communicator"). I think in one of the sessions I heard that there is an entitlement to get the old behaviour, but I can't find any reference to it anywhere.


|U03HELXN8CV|:
The entitlement is `com.apple.developer.device-information.user-assigned-device-name`. You can find out more about it in the “What’s new in privacy” video.

|U03HELXN8CV|:
There are some restrictions around what you can do with it (more in that video).

|U03JUCK9B16|:
In my case it would be on supervised devices, so hopefully not too restrictive

--- 
> ####  What is the behavior of `UIDevice.name`? Would it return iPhone 13 Pro or just iPhone if you don't have the entitlement to get the device's name? Thanks!


|U03HELXCTGV|:
Just "iPhone" or "iPad".

|U03HELXN8CV|:
Yeah, it returns the same thing as UIDevice.model.

|U03JUCK9B16|:
I’m trying to remember. Is there a method that returns the internal model number i.e “iPhone10,6”

|U03HHJNTFM0|:
Off the top of my head, I think the answer for `UIDevice` and this is no, but I'm checking

|U03HHJNTFM0|:
No, I don't believe that is something `UIDevice` will return

|U03HELXN8CV|:
It would be worth filing a feedback report if you need more fine-grained model delineation, with a description of what you intend to use it for. It’s useful for us to hear things like that first-hand and have documented requests to consider.

|U03HHJNTFM0|:
I believe there are lower level unix functions that will return this (perhaps `sysctl` or `uname`)

|U03JEMNCV18|:
It would be useful for setting up a support request message prefilled with the user's device type (along with app version, etc)

|U03HMCT187R|:
Yes my use case matches that of Lowell :slightly_smiling_face: FB5524321 UIDevice API desired to get model name as it appears in Settings 48331816

|U03JUCK9B16|:
yeah - I think in the past I used sysctl - can’t remember the key though

|U03HHJNTFM0|:
Searching seems to indicate both `uname` and `sysctl` `hw.model` key might return this, but I haven't verified that at all

|U03HHJNTFM0|:
Might be worth a try at least

|U03JUCK9B16|:
Seems its via `utsname` and `uname`:
<https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model>

|U03JUCK9B16|:
(Assuming that code still works in iOS 16)

--- 
> ####  Navigation item center groups: does it make sense to swap them completely based on some factor, like object selection state? If so, should one change `UINavigationItem.customizationIdentifier` then? Any other considerations?


|U03HELWFGKF|:
It can, and thats a valid use for multiple customization identifiers on a single UINavigationItem. We should continue to properly save &amp; restore state when you update. I’m pretty sure we’ll update things properly regardless of the relative ordering of you setting .centerItemGroups vs .customizationIdentifier, but if you find that not to be the case file a report

|U03HELWFGKF|:
if you just want to conditionally make functionality available though, you might look at using the `hidden` property we just added to `UIBarButtonItem` and `UIBarButtonItemGroup`

|U03JM92AMJ5|:
Ohh, I missed `hidden` , seems useful. But I think for completely different modes, using different customization identifiers might make more sense. I will try to implement it and maybe on tomorrows labs (assuming I will get my ticket :wink:) I will share my experience.

|U03JM92AMJ5|:
As a side note: would be great if one could present “vertical” edit menu from `UIBarButtonItems`, even if initialised via touch.

|U03HELWFGKF|:
you mean the `EditMenuInteraction`?

|U03JM92AMJ5|:
Yes. I’m sure there is a way to initialise it from `UIBarButtonItem`, but my note was specifically about _always_ using vertical style in such case.

|U03HELWFGKF|:
I don’t think we’ve really thought that much about it actually, usually you want the edit interaction to be directly on whatever thing is being edited. I think there are ways you might be able to get something useful like that, but I’d want to talk to the engineer that worked on edit menu interaction

|U03JM92AMJ5|:
So, another thing to chat about on labs. Thank you David :slightly_smiling_face:

--- 
> ####  Do you think it's a good idea trying to convert modals to use structured concurrency on iOS? So instead of usual callback the caller would await on result property.


|U03HB0D5W22|:
Yes! For modal flows that return a result via a delegate, I think using structured concurrency to await the result instead is an interesting approach to try.

--- 
> ####  Do UIMenuElementAttributesKeepsMenuPresented and UIMenuElementSize translate to same/similar behaviour in Mac Catalyst?


|U03J7BUNTDW|:
Since macOS menus are modal, `UIMenuElementAttributesKeepsMenuPresented` has no effect on the Mac. Small or medium `UIMenuElementSize`s will produce standard (full width) menu elements since that design paradigm doesn't exist on the Mac.

|U03JM92AMJ5|:
I thought so, but was worth asking :slightly_smiling_face: Not having  `UIMenuElementAttributesKeepsMenuPresented` -like behaviour seems particularly problematic, since it enables great UX on iPad. With no direct Mac behaviour, one must look for completely different solution there.

|U03J7BUNTDW|:
Yeah, that's totally understandable. It's just incompatible with how Mac menus work currently.

--- 
> ####  I am wondering how many of these API are available in a native SwiftUI app?   I am taking my iOS app to both iPadOS and macOS in a current redesign, which will require iOS 16/can require macOS 13, but I need to decide between using Catalyst vs. going SwiftUI native.


|U03HL05FX6Y|:
If your writing a pure SwiftUI app, then you should compile it native for each platform.

|U03J4D1FEP6|:
e.g. disabling the traffic light buttons when not applicable.

|U03HL05FX6Y|:
does your SwiftUI app rely on UIKit for something?

|U03J4D1FEP6|:
The question is the opposite, really. It’s currently a UIKit app. I am at the point of needing to decide—do I ship it for macOS with Catalyst, or given I’m doing a major redesign anyway, do I migrate it to be a SwiftUI app.

I am wondering—are any of the features/capabilities shown here in deploying as a Catalyst app that are not available on macOS using a native SwiftUI app?

|U03HL05FX6Y|:
This would be a good question for the SwiftUI lounge.

|U03J4D1FEP6|:
OK

|U03HHJP6N3C|:
If you already have a UIKit app that’s working well, proceeding with a Catalyst app would definitely be the quickest path to Mac, and you can always start to mix and match SwiftUI alongside at the same time if you aren’t ready to commit fully. As far as how these properties are exposed in SwiftUI, I’m not sure off the top of my head, but there are additional SwiftUI Q&amp;As that should be able to provide a concrete answer for you

--- 
> ####  We have a CallKit VOIP app that supports iPad (along with iPhone) and we want to use it as a Mac app for Apple silicon Macs. We have two issues:  1) On Mac there is no request for microphone access. The microphone request as it is on iOS/iPadOS is not compatible on macOS? We should add different permission requests according the available platform (iOS vs macOS)?  2) On Mac there is no CallKit UI for the incoming calls? The expectation here is to just run our app and make the app's windows the front window without any CallKit UI view or status bar indicator?  Thank you!!


|U03HB0DC1PY|:
PushKit will deliver the VoIP push, and it's delivered to the app, which is launched if needed.
But on macOS, CallKit will not provide any UI. It is up to your app to provide its own UI when it receives the payload.

I'm not certain about the microphone access question.
That might be something best asked in one of the upcoming labs for AVAudioSession, AVKit, or AVFoundation.

|U03HB0DC1PY|:
Which API are you using to attempt microphone access?

|U03HB0DC1PY|:
<@U03J217TL5R>?

|U03J217TL5R|:
Oh, I see! So, the launch of the app is what expected on VoIP push reception without UI. Then, we are OK with that! 

We should only see the microphone access issue… 

Hmm, I don't have access in our code right now (out of office time zone here). But, as far as remember we use AVAudioSession and we check if category == PLAY_AND_RECORD in order to check microphone availability…

|U03HB0DARPG|:
There are two upcoming AVAudioSession labs: June 9th from 11-2 PDT and June 10th from 1-3 PDT. That would be the best place to get your microphone access question answered.

|U03J217TL5R|:
Thank you guys, <@U03HB0DARPG>  and <@U03HB0DC1PY> I'll check the labs and I'll be prepared with the exact microphone request code that we use! :wave:

--- 
> ####  I'm trying to hide my UINavigationBar bar with .slide. However, the hiding animation is broken, it disappears in one go. The show animation slides in correctly though. Is this a known issue?


|U03HELWFGKF|:
I would suspect that your doing something that UIKit isn’t really prepared to manage properly – can you paste in the code your using?

|U03HELWFGKF|:
even without an example, my rough guess here would be that if your setting `UINavigationController.isNavigationBarHidden`  we are probably just pulling the navigation bar out of the hierarchy before your animation begins. If you are calling it with `animated:true` then we may just be doing things that preclude your animation entirely. And if your setting `UINavigationBar.isHidden` then that won’t be animatable

|U03J4J6MMK8|:
I'm hiding the status bar simultaneously to get a full screen experience. When I remove the status bar animation, the nav bar animates fine. FB8980917 has a sample app.

|U03HELWFGKF|:
I pulled up the sample from that issue, it seems to be working in iOS 16, have you tried it there? (I haven’t checked on anything older at the moment, so not sure if this is a new change or not)

--- 
> ####  Are there any ways to support bulleted lists (unordered and ordered) via the UITextView? Or what is the preferred approached here. Thanks


|U03HELXN8CV|:
This wasn’t available in UIKit until this year, but in the betas you’ll see NSTextList (a long-standing feature available only in AppKit until now).

|U03HELXN8CV|:
Check out this video tomorrow for more: <https://developer.apple.com/wwdc22/10090>

|U03HZ52HR8V|:
This is great! Thank you!

--- 
> ####  I'm currently trying to use a UICellAccessory with a custom view in a UICollectionViewListCell, but I get a degenerate layout feedback loop when expanding a list section. Is there something I need to be doing differently?


|U03HL04N5EY|:
It's possible. Every layout feedback loop is different. I strongly recommend signing up for a lab where an engineer can do some joint debugging with you. If you can't get a lab, please try the developer forums. Meanwhile, I'll see if I can help you a little here. Do you have logs from the layout feedback loop debugger?

|U03JU8F54C8|:
I have a feedback with sample project for this issue as I believe it is an unexpected behavior. If someone would be willing to take a look it would be much appreciated! FB9207332

|U03HL04N5EY|:
Awesome! I love a sample project!

|U03JU8F54C8|:
Me too! Thanks for your response!

|U03HL04N5EY|:
<@U03JU8F54C8> I'm not reproducing the LFL on an iPad with your sample app. Of course, I'm working on an unreleased build, and it's possible we have a fix for the issue. On the other hand, maybe this is device specific, and I should be trying this on an iPhone instead?

|U03HL04N5EY|:
Oh! I'll check the screen recording…

|U03HL04N5EY|:
I'll try it on a phone. If we have a fix, I'll be duping your FB report

|U03JU8F54C8|:
Just opened my sample. It does happen for me on the iPhone sim in Xcode 14 beta 1. We experienced this issue intermittently on the iPad as well but my specific example may not exactly produce it. Were you able to reproduce on the iPhone simulator?

|U03JU8F54C8|:
Just also reproduced on a test device. Since I'd bet it's not encouraged to post files here, I'll post my debugger output to the feedback. Apologies that it's very long, I think I set the debugging threshold high.

|U03JU8F54C8|:
Ok. Just attached that file to the feedback. Thanks so much again for taking a look.

--- 
> ####  macOS ExtensionKit question. Does an extension have to be delivered within an app bundle? Is it possible to build a standalone `.appex` and have it be discoverable by an hosting application?


|U03JNQ1ABFC|:
It is not possible to deliver an extension outside of an app bundle. Extensions must be contained in an app bundle in the `Extensions` directory. 

|U03JKSLQ7J6|:
Ah hello! Thanks for your help yesterday!

Would be awesome to not need to create wrapper apps to deliver extension-only payloads. I’ll file a bug report.

Will all of ExtensionKit’s capabilities be available to apps delivered outside the App Store using Developer ID?

|U03JNQ1ABFC|:
Happy to help. 

|U03JNQ1ABFC|:
Yes ExtensionKit’s capabilities are supported apps delivered outside of the App Store. The host app and the extension must be code signed and the extension must be sandboxed. 

|U03JKSLQ7J6|:
Ah this is great info - particularly about the sandboxing requirements for extensions!

I’m just getting started, so perhaps this is a silly question. But, I’ve been playing with the extension Xcode template, and it is helpful it getting an idea of how to structure everything. I find myself doing awkward things to get at the NSXPCConnection and its properties, since it is only available from the AppExtensionConfiguration. I’m just passing it right though back up to the main extension class. Does this sound like it makes sense?

|U03JKSLQ7J6|:
Is there any way for my main app to pass security-scoped bookmarks, or other privileged file-access mechanism back down to the extension, or will each extension that needs this kind of thing need to request access from the user itself?

|U03JNQ1ABFC|:
ExtensionKit doesn't provide specific API to grant file access to an extension. I'm not knowledgeable enough about security scoped bookmarks to comment at the moment. 

|U03JKSLQ7J6|:
Ok that’s totally understandable. But, could an extension create an open dialog for gaining file access?

|U03JNQ1ABFC|:
Yes, extensions can use NSOpenPannel

|U03JKSLQ7J6|:
Ok wonderful! And from my frantic internet searching just now, it does seem possible to share file accesses between apps and XPC services. So, I feel like that covers what I would need.

|U03JKSLQ7J6|:
I realize that I’m perhaps monopolizing your time/attention. Please feel free to ignore as needed :smiley:

Do you have any thoughts on the best way to communicate the `NSXPCConnection` from the configuration back up to the extension class? I’m envisioning needing to use the `remoteObject` and `exportedObject` from extensions for bidirectional communication with the host app.

|U03JNQ1ABFC|:
WRT configuring XPC connections:

We recommend that the app that defines the extension point provided a framework to extension developers. This framework should specialize the ExtensionKit protocols. This is a quick example of something such a framework might implement 

```
struct ExampleConfiguration&lt;E:ExampleExtension&gt;: AppExtensionConfiguration {
    
    let exportedObject: ExportedObject
    
    init(_ appExtension: E) {
        self.exportedObject = ExportedObject(appExtension)
    }
    
    /// Determine whether to accept the XPC connection from the host.
    func accept(connection: NSXPCConnection) -&gt; Bool {
        
        connection.exportedInterface = NSXPCInterface(with: TextTransformerXPCProtocol.self)
        connection.exportedObject = exportedObject
        connection.resume()
        
        return true
    }
    
    class ExportedObject: NSObject, TextTransformerXPCProtocol {
        let appExtension: E
 
        init(_ appExtension: E) {
            self.appExtension = appExtension
        }
          
        func transform(text: String, reply: (String) -&gt; Void) {
            let transformedText = appExtension.transform(text: text)
            reply(transformedText)
        }
    }
}

/// The AppExtension protocol to which this extension will conform.
/// This is typically defined by the extension host in a framework.
protocol ExampleExtension : AppExtension {
    func transform(text: String) -&gt; String
}

extension ExampleExtension {
    var configuration: ExampleConfiguration&lt;some ExampleExtension&gt; {
        // Return your extension's configuration upon request.
        return ExampleConfiguration(self)
    }
}

```

|U03JNQ1ABFC|:
An extension implementation would look like this:

```
@main
final class ExampleAppExtension: ExampleExtension {

    func transform(text: String) -&gt; String {
        return text.uppercased()
    }
}
```


|U03JKSLQ7J6|:
ok this makes total sense, and is really helpful. Thank you very much!

|U03JKSLQ7J6|:
Is there any way that I could accept-list locally-bundled extensions within the host app? Or, would those always need explicit user approval as well?

|U03JKSLQ7J6|:
Oh, and I assume `EXAppExtensionBrowserViewController` is the only way to approve extensions?

|U03JNQ1ABFC|:
Correct 

|U03JKSLQ7J6|:
so even host-bundled extensions must be given explicit approval?

|U03JNQ1ABFC|:
Yes, you can file feedback if this will cause problems. 

|U03JKSLQ7J6|:
My cursory testing with extensions seems to have a lower first-request latency than a plain XPC service, which would be really cool! Am I right about that?

|U03JNQ1ABFC|:
Extensions are launched when the host creates the `AppExtensionProcess` instance so it is already running by the time you send the first XPC message. If you include the time waiting for the `AppExtensionProcess` instance to be created I suspect the overall latency will be equivalent. I have not measured this. 

|U03JKSLQ7J6|:
Ok this makes sense.

I was also curious about the `.appextensionpoint` file. Aside from documentation, which I assume is forthcoming, it was interesting this wasn’t incorporated into the app’s Info.plist. Is there something here than made separate files a better fit?

|U03JNQ1ABFC|:
I have an answer for this:
&gt; Is there any way for my main app to pass security-scoped bookmarks, or other privileged file-access mechanism back down to the extension, or will each extension that needs this kind of thing need to request access from the user itself?
You can expect Security scoped bookmarks to grant the extension access to files that the host app has access to.

|U03JKSLQ7J6|:
That is awesome news. Sandboxing was, so far, the thing giving me the most concern.

|U03JKSLQ7J6|:
Is the app-bundling requirement for extensions something that might change before Ventura ships?

|U03JNQ1ABFC|:
Extensions must be bundled in a container app's bundle. Beyond that I cant comment on the future direction of the platform.

|U03JKSLQ7J6|:
I understand. Thank you so much for your time, you’ve been immensely helpful. I’m incredibly excited about these APIs, and cannot wait to do some real work with them.

|U03JNQ1ABFC|:
Glad to help. I'm excited to see what people do with these APIs. 

--- 
> ####  The new self-sizing UITableView and UICollectionView cells look fantastic. Is there anything similar for table view headers and footers? Is there a recommended technique to have headers and footers resize to accomodate dynamic type for example?


|U03HW7U6QF3|:
The new `selfSizingInvalidation` functionality, including manually calling `invalidateIntrinsicContentSize`  yourself, as well as the automatic `.enabledIncludingConstraints` mode for Auto Layout, work in `UITableViewHeaderFooterView` too! The feature is not just limited to cells :smiley:

|U03HW7U6QF3|:
(And for UICollectionView, this includes self-sizing supplementary views too.)

|U03J22HDMSN|:
Thank you, that’s great news!

--- 
> ####  I saw that the San Francisco font has new compressed, condensed and expanded style widths. However I do I access these styles with UIFont or UIFontDescriptor?


|U03HELXN8CV|:
You can use `UIFontDescriptor.TraitKey.width`with a float value.

We know that some suggested constants for the various ‘standard’ widths would be helpful - like the constants for ‘standard’ widths for the use with `UIFontDescriptor.TraitKey.weight`, so keep an eye out for them in future betas.

|U03JRR4R3CY|:
Great, thanks. Are the float values for the width described anywhere?

|U03HELXN8CV|:
<https://developer.apple.com/documentation/uikit/uifontwidthtrait?language=objc>

|U03HELXN8CV|:
…or probably more useful, <https://developer.apple.com/documentation/uikit/uifontdescriptor/traitkey/1616684-width>

|U03HELXN8CV|:
&gt; The valid value range is from `-1.0` to `1.0`. The value of `0.0` corresponds to the regular glyph spacing.


--- 
> ####  Would you be able to share some insight on how the various Collection Views are implemented within the Calendar app? The paging that goes on endlessly is something I have been trying to recreate for a while but it's tricky. Any hints would be greatly appreciated :)


|U03HELWUJN9|:
You can achieve endless scrolling by essentially adding and removing sections while scrolling and making sure to adjust the content offset when doing so. `UIScrollView` (and thus `UICollectionView`) will keep its inertia and make it look seamless. If you have specific use cases this might be a great thing to discuss in a 1on1 lab.

|U03JEMNCV18|:
Thanks, i’ll try applying for a lab again :crossed_fingers:

--- 
> ####  iOS 16 offers a great new API addition in the way of UIHostingConfiguration for rendering SwiftUI views in List CollectionView cells, however we’d love to support this type of interop on iOS 15 too.  When using UIHostingControllers in UICollectionView list cells, is there any specific considerations that should be taken into account in addition to managing cell reuse issues?


|U03HW7U6QF3|:
Unfortunately there isn’t an officially supported way to use SwiftUI inside of UIKit cells prior to iOS 16. Embedding a UIHostingController inside of cells is not recommended.

|U03J1TN6WBD|:
Just to be clear, it's not recommended due to performance issues, right?

|U03JU8F54C8|:
<@U03HW7U6QF3> This is great to know, thank you! Is there any further light you can shed on why? As Lior comments, I am guessing due to performance overhead or reuse pitfalls?

|U03J7JKA23F|:
i love this new feature!!!!

|U03HW7U6QF3|:
While performance is certainly a concern, the main issue is really around the nature of needing to embed a view controller (the UIHostingController) in each cell. Generally speaking, putting view controllers inside cells is discouraged in UIKit. This is because of how cell reuse works, as well as the way information propagates through the view controller and view hierarchy in UIKit. So using UIHostingController in cells creates problems and can result in some surprising bugs. (A common example we’ve seen are issues with safe area information propagating into SwiftUI.) These are all things that the new UIHostingConfiguration API addresses!

|U03JEMNCV18|:
TIL

|U03JU8F54C8|:
Makes complete sense. So glad to see the new UIHostingConfiguration API and we'll be eager to adopt it once our minimum version is 16! Thanks to you and team for your hard work.

|U03HW7U6QF3|:
Despite that advice not to use UIHostingController in cells, provided that you are using the supported UIHostingConfiguration API starting with iOS 16, if you are able to get something working with UIHostingController on previous iOS versions and you have tested it well enough yourself that you know it works and meets your needs, you can _probably_ get away with that because UIKit &amp; SwiftUI aren’t changing anymore on those older iOS versions. And since you’re using UIHostingConfiguration going forward, you won’t run into any new issues with the unsupported UIHostingController implementation in the future. But again, this is not officially supported, so you are on your own, and you need to thoroughly test to make sure you can find an implementation that works well enough.

|U03KDARQ0QY|:
<@U03HW7U6QF3> would these concerns also apply to general usage of UIHostingControllers for leaf node views, like buttons? VC pattern would generally not be used there in pure UIKit world, and UIHostingControllers force us into it. Are there perf concerns? Is leaf node SwiftUI in UIKit discouraged, or is it okay if we properly add the VCs in the VC hierarchy?

|U03HW7U6QF3|:
Not really, the specific issues mentioned above are really about having view controllers inside cells (inside of a UIScrollView), due to cell reuse and scrolling performance.

|U03JU8F54C8|:
Don't tempt me too much Tyler! I seem to have a knack for finding myself in uncharted territory, and will occasionally go to great lengths to avoid making a xib or writing constraints! :joy: 

|U03KDARQ0QY|:
Thanks <@U03HW7U6QF3>! I will misuse this thread to once again request a UIHostingView for leaf node SwiftUI views in UIKit :smile: FB10019256

|U03HW7U6QF3|:
Feedback requests are greatly appreciated :pray:

|U03HW7U6QF3|:
Be sure to check out the video “Use SwiftUI with UIKit” when it goes live tomorrow as well! <https://developer.apple.com/videos/play/wwdc2022/10072/>

--- 
> ####  What happens to the display scale when connecting to external displays of different resolutions? Thanks!


|U03HHJNTFM0|:
1x displays will be reflected as 2x when connected to the iPad

|U03HMEM4TM5|:
Cool. What about 6k displays, are those still 2x?

|U03HHJNTFM0|:
I believe so, but will check

|U03J22P9WKH|:
I don't know if it's okay to jump in here, and I may not be understanding the question. But, for non-M1 iPads, external displays are treated as 1x displays in my experience (I get a UIScreen that is 3840 x 2160 with a scale of 1x). I brought this up in my lab meeting today with Owen and I've filed a feedback report on it.

|U03HHJNTFM0|:
I believe that is expected

|U03HHJNTFM0|:
And there should be no change there between iOS 15 and iOS 16

|U03J22P9WKH|:
OK - then I didn't understand the answer you had where 1x displays are reflected as 2x.

|U03HHJNTFM0|:
You were talking with Owen - was this a question about Catalyst?

|U03HHJNTFM0|:
Because that's very different.

|U03J22P9WKH|:
It was in the catalyst lab yes, but I'm running my catalyst app on iPad.

|U03HHJNTFM0|:
My answer assumed the question was related to Stage Manager, I should have clarified

|U03HMEM4TM5|:
Sorry, let me rephrase then. On iPadOS, when using stage mode on an external display, what does the system return to my app as the `displayScale` in `UITraitCollection`? E.g. if I read it from my `UIWindowScene`’s `rootViewController`?

|U03HHJNTFM0|:
6k will come across as 2x, 1x displays will come across as 2x, and we don't support anything greater than 6k at the moment, so you should see 2x in this case

|U03HMEM4TM5|:
thanks!

|U03HHJNTFM0|:
np!

--- 
> ####  Is there a way to make a palette window in a Catalyst app (like a Photoshop palette - it gets events, but it's not a true document window), and it has a smaller title bar / HUD appearance?


|U03HELXCTGV|:
This is not currently possible. We would appreciate a feedback request detailing your use case though!

|U03J22P9WKH|:
Here it is:FB10114581

--- 
> ####  In the past I’ve tried incorporating UITableView / UICollectionView into a SwiftUI app using UIViewRepresentable (for the advanced drag and drop features). After experiencing some bugginess with the table’s cell reuse, I was advised by an Apple engineer to build a UIKit or AppKit app. A year later, with this latest iteration of SwiftUI, do Apple engineers stand by that guidance or has SwiftUI become more hospitable to complex UIKit elements like UITableView and UICollectionView? For Apple’s apps that are comprised mostly of SwiftUI (like Shortcuts), I’m curious if you could share which framework is used for the life cycle (foundation). Thanks for all the great work!


|U03HL03H7QC|:
Hi, we have a couple of sessions coming out tomorrow that will talk about this in some more detail:
*<https://developer.apple.com/videos/play/wwdc2022/10072/|Use SwiftUI with UIKit>* and *<https://developer.apple.com/videos/play/wwdc2022/10075/|Use SwiftUI with AppKit>.* In addition, we also have a Q&amp;A for SwiftUI &amp; UIFrameworks tomorrow morning at 8 AM PDT. I’d encourage you to ask again there, as well as sign up for a SwiftUI Lab to discuss specific use cases!

|U03J286S5LP|:
Will do, thank you!!

--- 
> ####  Documentation mentions `UITextView` in iOS16 uses TextKit 2. I’ve managed to disable word wrap via `textContainer.widthTracksTextView = false` and setting the `textContainer.size` to a value wider than the view’s bounds, but looks like `UITextView` still doesn’t support horizontal scrolling, nor it tracks the cursor. Is that something that’s expected to work, or not yet?


|U03HELXN8CV|:
If I’m understanding you correctly, I don’t believe that this is intended to be supported. Did it used to work for you with TextKit 1?

|U03J4LBDUDB|:
No, but I was under the impression that the new TextKit engine is going to support it.

|U03HELXN8CV|:
I suspect you have good reasons why you’re not doing this, but if you need a one-line text input (no wrapping, scrolls) UITextField is your class.

|U03HELXN8CV|:
You could likely set up a UITextView to _not_ scroll and be at your desired width, then place it inside a UIScrollView - but you would not get any sort of autoscrolling.

|U03HELXN8CV|:
…but you could scroll yourself by setting content offset when the text view’s reports to its delegate that the selection has changed. (Obviously your question is still rolling around in my head :slightly_smiling_face:)

|U03HELXN8CV|:
If this is something you really need and are unable to accomplish reasonably, feedback is always appreciated (<https://developer.apple.com/bug-reporting/>).

|U03J4LBDUDB|:
I’d like the content to overflow beyond the view’s bounds, without wrapping text, which is preferred in plain text (fixed-width font) editors (code editor, markdown, etc). Think of it as a soft-wrap feature, where the `UITextView` on an iPhone screen or a windowed iPad app is actually narrower and doesn’t fit the 80-column text content.

I noticed that the `NSTextContainer` allows for a wider content than the viewport’s size, but the `UITextView`  doesn’t seem to implement auto-scrolling, as the caret moves beyond the text view’s visible area.

|U03HELXN8CV|:
Makes sense. You could try implementing `UITextViewDelegate.textViewDidChangeSelection(_:)`  and calling `setContentOffset` with the result of something calculated from `caretRectForPosition:`  or the like (note that `UITextView` implements all of `UITextInput`, which has a bunch of methods about geometry).

But you’re definitely doing something that is not in the designed-for use cases.

|U03J4LBDUDB|:
Thanks for the suggestion, I just tried it, but it seems that the `widthTracksTextView` is not supported on iOS/iPadOS. As soon as the `UITextView` ’s frame changes its size, the `textCointainer`’s size is set and the lines are wrapped.

I also filed the suggestion: FB10115560

|U03HELXN8CV|:
Ah - yeah, you’re right. We override those based on the ’scrollEnabled

|U03HELXN8CV|:
' state.

|U03HELXN8CV|:
I will return to my ‘non-scrollable text view inside a scroll view’ suggestion then. But I realize it’s clunky.

|U03HELXN8CV|:
Thanks for filing the feedback!

--- 
> ####  Like 'func playerViewController(_ playerViewController: AVPlayerViewController, willTransitionToVisibilityOfTransportBar visible: Bool, with coordinator: AVPlayerViewControllerAnimationCoordinator)` there is no callback methods to track info-pannel visibility. Whats the best way to identify when info-pannel appears and disappears?


|U03HHJNTFM0|:
This is a better question for AVKit. It looks like there's an AVKit lab at 3 PM on Thursday, June 9th:

<https://developer.apple.com/wwdc22/110548>

|U03JXLMAJBE|:
Noted thanks!

|U03HHJNTFM0|:
np!

--- 
> ####  I have a view controller that has multiple UITextFields. When I’m in one of those text fields and press tab on an iPad, it focuses on subsequent text fields. However, when I run via Catalyst on macOS, tabbing while in a text field inserts a tab character instead of focusing on the next text field. Do you know how to enable tabbing to focus on the next text field?


|U03HELWUJN9|:
This was a bug that should be fixed in macOS Ventura

|U03JRPCEVNU|:
Ok awesome, thanks!

|U03J1UX2CQK|:
Is there a known workaround for this issue in macOS Big Sur? <@U03HELWUJN9> 

|U03HELWUJN9|:
unfortunately there is not but you should check on latest betas.

|U03J1UX2CQK|:
Thanks!

--- 
> ####  Does Continuity Camera support a file promise? Previously only the data itself was returned with `kPasteboardTypeFilePromiseContent`.


|U03HL05FX6Y|:
NSFilePromiseReceiver should handle this type of pasteboard data as a file promise.

|U03HL05FX6Y|:
how are you trying to call in the file promise?

|U03HZ4PT2ER|:
<@U03HL05FX6Y> Sorry for the wait, lab. We were doing it manually with the older APIs

|U03HZ4PT2ER|:
We had not yet adopted NSFilePromiseProvider/Receiver

|U03HZ4PT2ER|:
Our code dates to 2019

|U03HL05FX6Y|:
NSFilePromiseReceiver is pretty nice because it's compatible with any code using the other techniques

|U03HZ4PT2ER|:
At the time we implemented Continuity Camera the file promise was never "kept", only extracting the data in-process worked

|U03HZ4PT2ER|:
And we use file promises in other places, we're familiar with the technique

|U03HL05FX6Y|:
Try it out with NSFilePromiseReceiver. If it's still failing, file a feedback report with a small sample project.

|U03HZ4PT2ER|:
ok

--- 
> ####  Hi,  I’m currently trying to update my Apple Watch app to support watchOS 9 however the VideoPlayer in SwiftUI is crashing when playing a video and Xcode prints something to do with volume HUD class name changing and just wondering if this is something that’s changed with watchOS 9 or it’s something that I need to update in my code somewhere. 


|U03HW7TN41F|:
Can you ask in the <#C03GSLANZJT|> or the <#C03HX19UNCQ|>?

|U03HELXATD3|:
Also, if you’re able to provide them the crash log, that’ll help investigate the issue!

|U03HZ3L98TF|:
Yep I can do both, I'll make sure to be on my Mac too so I can get the log for them.
Thanks both :) 

--- 
> ####  Hi, In my CarPlay app, In `templateApplicationScene(_:didConnect:)` I get the provided `interfaceController` and store a reference to it, but most of the times when I try to access `interfaceController.carTraitCollection` The app crashes because `carTraitCollection` is `Uninitialized`, so it makes creating image for different display scale (2x, 3x) or different display styles (dark, light) impossible. I tried to make sure that I always access it from main thread but still have the same problem.


|U03HHJNTFM0|:
This is a better question for someone on the CarPlay team. There's a Q&amp;A Digital Lounge on Friday at 1 PM Pacific time.

|U03HHJNTFM0|:
Also, probably worth filing a feedback on it in case it isn't being tracked anywhere!

|U03HHJNTFM0|:
Looks like we do have feedback tracking this and the CarPlay team is looking into it.

--- 
> ####  With UIActivityViewController, is it possible to provide multiple representations of the same object (a URL and text, e.g., through an NSItemProvider) as well as LPLinkMetadata?   UIActivityItemsConfigurationReading is the only way I've gotten the NSItemProvider to work, but that doesn't support link metadata. And UIActivityItemSource supports the metadata, but not the item provider.


|U03H31CQZ0F|:
You can provide link metadata using `UIActivityItemsConfigurationReading` by implementing the `activityItemsConfigurationMetadata(key:)` function, and watching for the `linkPresentationMetadata` key.

|U03H31CQZ0F|:
Remember also that you have the option of using the prebuilt `UIActivityItemsConfiguration` class, which has properties that you can set for these metadata.

|U03J4DRK4SY|:
When I return `LPLinkMetadata` from the `UIActivityItemsConfiguration.metadataProvider` closure, it doesn't use the image, title, or subtitle in the metadata

|U03J4DRK4SY|:
Strike that, the metadataProvider closure is never even called with the linkPresentationMetadata key

|U03J4DRK4SY|:
<@U03H31CQZ0F> I've filed FB10116030 about this

|U03H31CQZ0F|:
Thank you. I’ll take a look.

--- 
> ####  In Catalyst, is there a way to only show the preview for a link when dragging a link in a UITextView instead of the whole view? The associated UIDragInteractionDelegate methods don't seem to work.


|U03J7BUNTDW|:
Can you elaborate a bit more on your setup and what you're seeing? Are you installing your own `UIDragInteraction` on the `UITextView`? Are you seeing different behavior on iOS vs macOS?

|U03J7BUNTDW|:
If it's difficult to describe in Slack, I encourage you to sign up for one of the UIKit labs tomorrow or Friday.

|U03JEEU1MF1|:
Yes, it's a custom UIDragInteraction and it works correctly on iOS

|U03JEEU1MF1|:
If you drag on iOS, only the area around the link is highlighted, but if you drag on Catalyst, the entire view is highlighted

|U03J7BUNTDW|:
Is there a reason you couldn't rely on the text view's built in drag interaction and customize the behavior via `UITextDragDelegate`?

|U03JEEU1MF1|:
I think it's because my text view has isEditable and isSelectable set to false. But also using the UITextDragDelegate methods doesn't work either.

--- 
> ####  With the new self-sizing cells, is there a way to run an animation alongside a cell resize animation (or at least, adding a custom completion handler to the system-provided resize animation)?


|U03HW7U6QF3|:
With the new `selfSizingInvalidation` feature (aka “self-resizing cells”), when a cell is resized with animation, the cell will also receive a full layout pass as part of the same animation. This means that any layout changes to subviews inside the cell’s `contentView` will also animate by default alongside the resizing of the cell itself.

There isn’t an explicit way to manually attach animations to that resize animation when it’s initiated directly by a cell via `invalidateIntrinsicContentSize` — do you have something specific in mind you’re trying to do?

|U03HW7U6QF3|:
You can of course continue to use the `apply` method on diffable data source (re-applying the current snapshot), or `performBatchUpdates` on the collection/table view directly if you are not using a diffable data source, to resize visible cells as you would prior to iOS 16. And both of those APIs do provide a completion handler you can use.

|U03J4DRK4SY|:
I've got a text view that I'm hiding/showing that I want to appear to progressively expand as the cell grows. I've had some trouble doing this previously with the old beginUpdates/endUpdates, but it sounds like it should be doable with the self-resizing cells stuff

|U03J4DRK4SY|:
Relatedly, the text view is in a stack view and the cell isn't automatically detecting the change when isHidden is changed on the text view (which should, AIUI, cause the stack view to change its internal constraints which should count as an auto layout change). I have to call invalidateIntrinsicContentSize myself to get the size to update. Could that be something on my end, or is it more likely a framework bug?

|U03HW7U6QF3|:
&gt; I’ve got a text view that I’m hiding/showing that I want to appear to progressively expand as the cell grows. I’ve had some trouble doing this previously with the old beginUpdates/endUpdates, but it sounds like it should be doable with the self-resizing cells stuff
The new self-resizing cells functionality does work great with multiline UITextView (`scrollEnabled = false`) inside of the cell `contentView`, when you want the cell to size-to-fit the text view as more text is added!

I’m still not sure what you had in mind around adding alongside animations or completions though.

|U03HW7U6QF3|:
&gt; Relatedly, the text view is in a stack view and the cell isn’t automatically detecting the change when isHidden is changed on the text view (which should, AIUI, cause the stack view to change its internal constraints which should count as an auto layout change). I have to call invalidateIntrinsicContentSize myself to get the size to update. Could that be something on my end, or is it more likely a framework bug?
If you have an easy place to call `invalidateIntrinsicContentSize`  yourself, that’s actually the best option in general combined with the default `selfSizingInvalidation = .enabled` . The `.enabledIncludingConstraints` mode can be more expensive, as it requires checking for size changes on any Auto Layout constraint changes.

But based on your description this does sound like something that is supposed to work automatically when you have set `.enabledIncludingConstraints` , so if you don’t see any obvious issues on your end, it would be great if you could submit a Feedback report with a small sample project attached for us to take a look at! <https://feedbackassistant.apple.com>

|U03J4DRK4SY|:
It's not adding/removing text from the view that I'm doing, but hiding it wholesale. And since it's in a stack view, it was getting removed from the view hierarchy altogether—without being animated, so I thought I'd need a custom animation to cover that up. Now I'm thinking it would work better to add a constraint setting the height to 0 to "hide" it without removing it, and thus letting it animate

|U03J4DRK4SY|:
I can stick to calling that method myself, it's pretty easy to do, I was just hoping for a little magic, lol. I'll try to drum up a sample project for a feedback that repros the issue, though

|U03HW7U6QF3|:
Gotcha — and yes a sample project would be great!

|U03J1UU7HS7|:
“…when a cell is resized with animation, the cell will also receive a full layout pass as part of the same animation.”  Is this true for updates via performBatchUpdates as well?  My recollection is that there were issues around the cell view instance getting swapped out which would end up killing the animation within the cell.  Are cell views always preserved across empty batch updates, or am I misremembering?

|U03HW7U6QF3|:
&gt; My recollection is that there were issues around the cell view instance getting swapped out which would end up killing the animation within the cell. Are cell views always preserved across empty batch updates, or am I misremembering?
For empty batch updates, as well as the new iOS 16 self-sizing invalidation feature, the existing cells won’t be replaced or reused. Only when using the `reload` API to reload an item/section will the cell get replaced with a new one.

|U03J1UU7HS7|:
Thanks Tyler!

|U03HW7U6QF3|:
(Don’t forget about the `reconfigure` API introduced in iOS 15 to update cells without replacing them, too!)

--- 
> ####  Is there a way to get a notification when a new item (e.g. image) is added to UIPasteboard remotely (e.g. through Universal Clipboard). Currently I can poll `changeCount` to detect changes, but I receive no `changedNotification` unless the copy originated from the app itself. I'm trying to implement a feature where the app conveniently offers a paste button when there's something on the UIPasteboard.


|U03JER2C7MX|:
That would've been handy.

We do the same but with users' texts, suggesting them a button that Creates document right from the pasteboard.

But it probably doesn't work with universal clipboard. I'm not sure if it works for us in the iPad split view, but I assume we check pasteboard everytime our app becomes active.

However, AFAIK, it is not possible with universal clipboard

|U03HB0D4JLE|:
We generally discourage polling the pasteboard in any way, it can be resource-intensive. However, feel free to request a public notification for when the pasteboard changes, you can check for item count + metadata w/o triggering the paste alert.

|U03HB0D4JLE|:
The new paste button does enable/disable itself when the something appears on the pasteboard though.

|U03JER2C7MX|:
Hmm, is it customizable? Would be grateful for a link on the session about that )

|U03J20E1BPD|:
“However, feel free to request a public notification for when the pasteboard change”. Is there an API to do this? Did you mean I should file a feedback?

|U03J20E1BPD|:
Also, there seems to be an issue where the UIPasteboard.general.changeCount gets incremented by two every time I start editing a text view (without copying anything)

|U03HB0D4JLE|:
<https://developer.apple.com/wwdc22/10068?time=683>

|U03HB0D4JLE|:
&gt; Did you mean I should file a feedback?
Yes.

|U03J20E1BPD|:
“you can check for item count + metadata w/o triggering the paste alert.” When you said metadata, are there any existing ones I can look at (to detect duplicates) without showing the alert?

|U03HB0D4JLE|:
Re: `changeCount`, we don't guarantee that it will increment +1 each time. Multiple processes etc. may end up bumping it up more.

|U03J20E1BPD|:
I see

|U03HB0D4JLE|:
metadata = types of items. So e.g. `-[UIPasteboard hasStrings]` is a _metadata_ query, but `-[UIPasteboard strings]` is a _data_ query.

|U03J20E1BPD|:
So, assuming I want to detect when a new image is pasted elsewhere… `hasStrings` will not change (already true), and `changeCount` is an unreliable way of detecting new ones. So I’m basically out of luck…

|U03HB0D4JLE|:
You can also run pattern detection w/o triggering the paste alert, so e.g. looking for URL's and addresses via `detectPatternsForPatterns:completionHandler:`. This is also considered metadata and won't trigger the alert.

|U03HB0D4JLE|:
`changeCount` will get incremented with a new image

|U03J20E1BPD|:
“`changeCount` will get incremented with a new image”. Yes, I’m observing that. However since `changeCount` gets incremented no matter what the type of the content is, it seems like I cannot get a image-specific `changeCount`, is that correct?

|U03HB0D4JLE|:
You can check if the data is an image _and_ the change count is incremented.

|U03J20E1BPD|:
You’re right! I have a bug in my code :man-facepalming:. Thanks!

--- 
> ####  Does SwiftUI support the new toolbar modes for iPad or do you need to use UIKit?


|U03HW7QCHK3|:
It does!

Check out the toolbar role API: <https://developer.apple.com/documentation/swiftui/view/toolbarrole(_:)>

And the secondary action toolbar item placement: <https://developer.apple.com/documentation/swiftui/toolbaritemplacement/secondaryaction>

For more information, I go into these APIs in the 2 part of SwiftUI on iPad series:
<https://developer.apple.com/videos/play/wwdc2022/10058>
<https://developer.apple.com/videos/play/wwdc2022/10058>

|U03J22FSUUS|:
Thank you so much!

--- 
> ####  Hello, should we approach SwiftUI views as data models for real views? Where should we place data formatting logic? If SwiftUI view is a data model we can data formatting logic there? How can we test our data formatting logic in this case?


|U03HELTEP9T|:
The most convenient way to unit test your data formatting logic (like a Foundation FormatStyle) will be to factor the formatter out and assert against the String it produces

|U03HELTEP9T|:
I generally wouldn't consider a SwiftUI view to be a data model

|U03HELTEP9T|:
Factoring out the formatter might take the form of lifting into a model or view model

|U03HELTEP9T|:
Or it might just take the form of specifying it in a computed property on the View and running the assertion against that

|U03J0GP5L6R|:
So, we can use property testing to assert data formatting directly inside SwiftUI Views. Is it good practice? How do you deal with this problem at Apple in big projects?

|U03HELTEP9T|:
Unit testing is a bit of an art and so I wouldn't say it's a necessarily a good or bad practice to assert directly against the SwiftUI view.

I think the concerns are more pragmatic: how easy is it to assert against the SwiftUI view vs against a model. Does one way or the other require extra boilerplate? Does one way or the other lead to fewer false negatives?

|U03J0GP5L6R|:
Thanks Kyle for your answers :raised_hands:

--- 
> ####  Does this new APIs are backward comaptible with UIKit project or just only iOS 16?


|U03HELWUJN9|:
In general all APIs that are introduced in new versions of our operating systems always require those versions to be used. However you can conditionalize your code to only use those new features when running on that OS and have your app back deploy to old versions without those features.

|U03HPFD1GG7|:
Ok got it, but it might double the implementation and maintenance

|U03HELWUJN9|:
That, unfortunately, is a technical limitation. These features are implemented in frameworks that are shipping with the OS and that are heavily integrated with the OS, so they require the new OS to work. In a lot of cases you can just add the new features when running on the new OS and just do nothing on older versions, in which case it is enough to just check the current version you are running at run time before calling out to the new APIs.

|U03HPFD1GG7|:
Ok got it thanks, I think we might need to wait until next two years lol :smile:

--- 
> ####  What’s the naming convention you’d recommend using for a SwiftUI view - with or without `View` suffix? I think I’ve seen both in Apple examples.


|U03J7BQQNPJ|:
A good rule of thumb is that if the name we are picking has a clear visual representation, say `Text`, `Image`, `Toggle`, we omit the view suffix.

In cases like `ProgressView` where `Progress` really would feel more like the data itself than its visual representation we add the `View` suffix. Specifically in the case of `Progress` we would clash with `Foundation.Progress` which will require developer to always fully qualify the type name which is not ideal.

|U03JKEKF1TP|:
How does one ask a new question in this channel? I don't see a way to do it.

|U03JN2CBSEM|:
That makes a lot of sense, thank you Luca!

|U03J3BK549Y|:
Clint – click the + in the bottom left and select “Ask a question”:

|U03JKEKF1TP|:
Thanks for clarifying--the message next to that plus button says "only certain people can post" so that threw me off

--- 
> ####  Once again, here goes the question about SwiftUI views in Table/Collection cell. :grin: If we'd like to tinker with our own UIHostingConfiguration to support older OS versions, what would be the recommended way to update cell's height when used with DiffableDataSource? Currently, the most common scenario I see is a pair of  tableView.beginUpdates() tableView.endUpdates()  It would be nice to recap on our available options.


|U03HW7U6QF3|:
On iOS 15 and earlier, you request an update to the size of self-sizing cells in UICollectionView and UITableView by:
• If using diffable data source, re-applying the diffable data source’s current snapshot with `animatingDifferences: true`
• If not using diffable data source, performing empty batch updates on the collection or table view directly (that’s the same as the begin/end updates you mentioned)


|U03J22AU6DQ|:
Got it, thanks!

--- 
> ####  Is there a proper way to implement dynamic menu items on macOS with CommandMenu? (Menu items that change with keyboard modifier keys.) I'm currently polling on a timer, but that is... unsatisfying. In AppKit, this was done using the isAlternate property.  (FB9406583)


|U03HW7PE3SM|:
There is not a way to do this at the moment. Thanks for filing (and referencing) the feedback, we will route it to the appropriate component!

--- 
> ####  We've experiencing a watchdog termination in the background due to a function inside UIKit sleeping. Please see the following backtrace:  ``` Thread 0 Crashed: 0   libsystem_kernel.dylib        	0x00000002065bba2c __semwait_signal + 8 1   libsystem_c.dylib             	0x00000001d9c700e4 nanosleep + 220 (nanosleep.c:104) 2   libsystem_c.dylib             	0x00000001d9c70e14 usleep + 68 (usleep.c:52) 3   QuartzCore                    	0x00000001d292bc84 CABackingStoreCollectBlocking + 264 (x-misc.cpp:186) 4   UIKitCore                     	0x00000001d1184778 __35-[UIWindowScene _prepareForSuspend]_block_invoke + 60 (UIWindowScene.m:1273) 5   UIKitCore                     	0x00000001d1243b90 -[_UIContextBinder purgeContextsWithPurgeAction:afterPurgeAction:] + 472 (_UIContextBinder.m:221) 6   UIKitCore                     	0x00000001d12874ec -[UIWindowScene _prepareForSuspend] + 88 (UIWindowScene.m:1271) 7   UIKitCore                     	0x00000001d1ec935c __130-[UIApplication _updateStateRestorationArchiveForBackgroundEvent:saveState:exitIfCouldNotRestoreState:updateSnapshot:windowScene:]_block_invoke_2 + 228 (UIApplication.m:11237) 8   UIKitCore                     	0x00000001d128e4dc -[_UIAfterCACommitBlock run] + 72 (_UIAfterCACommitQueue.m:137) 9   UIKitCore                     	0x00000001d11a1864 -[_UIAfterCACommitQueue flush] + 192 (_UIAfterCACommitQueue.m:228) 10  libdispatch.dylib             	0x00000001ce7eae6c _dispatch_call_block_and_release + 32 (init.c:1517) 11  libdispatch.dylib             	0x00000001ce7eca30 _dispatch_client_callout + 20 (object.m:560) 12  libdispatch.dylib             	0x00000001ce7faf48 _dispatch_main_queue_drain + 928 (inline_internal.h:2622) 13  libdispatch.dylib             	0x00000001ce7fab98 _dispatch_main_queue_callback_4CF + 44 (queue.c:7770) 14  CoreFoundation                	0x00000001ceb3d800 __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__ + 16 (CFRunLoop.c:1795) 15  CoreFoundation                	0x00000001ceaf7704 __CFRunLoopRun + 2532 (CFRunLoop.c:3144) 16  CoreFoundation                	0x00000001ceb0abc8 CFRunLoopRunSpecific + 600 (CFRunLoop.c:3268) 17  GraphicsServices              	0x00000001eac3e374 GSEventRunModal + 164 (GSEvent.c:2200) 18  UIKitCore                     	0x00000001d147a648 -[UIApplication _run] + 1100 (UIApplication.m:3511) 19  UIKitCore                     	0x00000001d11fbd90 UIApplicationMain + 364 (UIApplication.m:5064) 20  [REDACTED]                   	0x0000000104e87460 main + 112 (main.m:27) 21  dyld                          	0x00000001055e5ce4 start + 520 (dyldMain.cpp:879) ```


|U03HHJNTFM0|:
Hi there! This looks like a potentially issue in CoreAnimation. If you haven't already, can you file a feedback with the entire crash log?

|U03JKFBJG69|:
Sure thing. Thanks! :slightly_smiling_face:

|U03HHJNTFM0|:
Thank you!

|U03HELXN8CV|:
Apps generally have around 5 seconds to stop processing when they’re backgrounded. If an app is still ‘alive’ and doing things at that point, it will be terminated to preserve system responsiveness.

In this 5 seconds, we usually reconfigure your apps interface multiple times (rotating, switching to light/dark mode etc.) to take screenshots to use in the application switcher UI.

What might be happening here is that your app is taking a long time to lay out for these screenshots. It may be finishing in just _under_ five seconds - then this system code (which frees up memory used by CA that’s not necessary while your app has nothing on screen) runs - and during that we hit the timeout.

If your crash trace has a “termination reason” that mentions “watchdog” that’s an indication that this might be happening.

|U03HELXN8CV|:
Thanks for reading my novel.

|U03J20RJQ2X|:
<@U03HELXN8CV> That's super interesting! I never considered how much work goes into creating screenshots for the app switcher

--- 
> ####  My doubt is regarding drag and drop on SwiftUI I think there are 2 approaches but I am stuck with both the approaches  WWDC22 - When using the new `draggable`, `dropDestination`, `Transferable` API, I am only able to drag single items. I am unable to drag multiple items in a list. I have filed a feedback FB10128110  WWDC21 - I have faced a couple of issues for drag and drop introduced in WWDC21 (onDrag, onDrop, itemIdentifier), the Feedback ids are FB9854301, FB9854569, FB9855245, FB9855532, FB9855567, FB9855575.  Note: All feedbacks include a sample project with detail steps and some even have screenshots and videos  Please let me know me if my approach is wrong or if I am missing something. Unfortunately I didn't manage to get a SwiftUI lab session (got declined), so any assistance on the above would be much appreciated


|U03HW7P2WTB|:
Hi <@U03JCHKCDB4>! First, thank you for filing the radars! Getting feedback on the new APIs and knowing which enhancements are anticipated is important. For now, I have one pointer that could be useful: for Lists and ForEach, we expect you to use the `onInsert` modifier. `onDrag` is designed for other types of views.

|U03HVFXKB5L|:
FYI, `onInsert` on a `Table` with 0 rows did not work last year (FB9265795) on macOS, it seems the problem persists this year with macOS. Haven’t test it in iOS, which now supports Tables too.

|U03JCHKCDB4|:
&gt; Thanks for the response, I am a bit confused here, so when should I use `draggable`? Did you mean `draggable` instead of `onDrag`?

|U03HW7P2WTB|:
Yeah, I was talking about last year APIs. `draggable` is new this year, analogous to `onDrag` and making use of `Transferable`

|U03JCHKCDB4|:
1. Ok that clarifies one part, please bear with me as I slowly understand this. So `draggable` is the new approach however does it only support simple cases now (like single item drag for non-list and non-ForEach views)?
2. Also using `draggable` I noticed there was no way to generate *preview*, or specify the item is to be `moved` (no green + circle) instead of `copied` 
3. So would slowly `draggable` grow powerful that would one day support all cases instead of `ondrag`?

|U03JCHKCDB4|:
<@U03HW7P2WTB> 4. Also I would be really over the moon, if someone could have a look at the above posted Feedback IDs, as it would help me ship my app which is a bit stuck.

|U03HW7P2WTB|:
1. Yes.

|U03HW7P2WTB|:
2. This is correct as well

|U03HW7P2WTB|:
3. Can’t comment on that.

|U03HW7P2WTB|:
4. Sure! Can’t promise anything, but thanks for bringing them up

|U03JCHKCDB4|:
<@U03HW7P2WTB>
• Thanks a lot!!! Fingers crossed
• So in the meantime I think I will continue to use the older APIs (`onDrag` / `onInsert` / `onDrop` / `itemProvider`) 
• I however I am excited about the new APIs with `Transferable` looks pretty cool, fingers crossed again one day I get to use them.
• Thanks for patiently answering all the questions, really appreciate it

|U03JCHKCDB4|:
<@U03HVFXKB5L> I am a huge fan of your blog posts and app, has helped me tremendously including for drag and drop, most of my above questions were on the mac. Thanks a lot!!!

|U03HVFXKB5L|:
Thanks <@U03JCHKCDB4>, it seems I have a lot of work ahead to update both the app and the blog :wink: So excited with some of the additions this year, specially Layout and NavigationPath.

|U03JCHKCDB4|:
<@U03HW7P2WTB> Thank you so much for helping me get the lab appointment, really appreciate it, made my day!!! You guys have no clue how excited i was … I am really grateful to you guys for answering all my questions. I am so sorry i forgot note down his name … I have been watching so many videos to get his name to tag him on this post. Please let him know as well

|U03HW7P2WTB|:
Sure! Thank you as well for filing the feedback and asking great questions! It was nice meeting you today.

--- 
> ####  Are there any major limitations to be aware of with the new UIHostingConfiguration for collection view cells using SwiftUI, that may not be addressed in the session video?


|U03HL05BUJG|:
We do try to address the majority of the limitations in the video! Theres a spot at the end where we talk about how `UIViewControllerRepresentable` will not work there. The video also covers considerations around data flow.
<https://developer.apple.com/wwdc22/10072>

|U03JEMNCV18|:
Ok, still waiting for the session to become available. Thanks :grin:

--- 
> ####  I was wondering if we can use the SwiftUI View protocol with the new 'any' keyword? And if it'll be helpful or a good solution in some example use-case?


|U03J7BQQNPJ|:
`any View` does not itself conform to `View`, so is not a replacement for `AnyView` today. Also `any View` is only defining an existential container that you can use in a type signature but you can’t instantiate that type.

There might be use cases for using `any View` to store that into collection, for example: `[any View]`.  But most of the time, if you’re in the situation where you think you need `[AnyView]` or `[any View]`, what you should likely do is invert the view dependency flow and have `[AnyDataModel]` or `[any DataModel]`  instead, then create your views based on the type of data provided at runtime.

|U03HMDKEWJK|:
Great, thank you for the detailed explanation!

|U03J7BQQNPJ|:
You are welcome! Was your question based on a concrete problem you are trying to solve?

|U03HMDKEWJK|:
No, I just watched the Embrace Generics session today and this question immediately popped to mind :slightly_smiling_face:

--- 
> ####  We have compositional layout with CollectionView and content is coming from remote including image so based on the image height we adjust the height of the cells, so until we determine the height of the image we have ideal height, but the problem is user can keep scrolling down while images are getting downloaded cells are drawn with ideal height but when image get downloaded we fix the height for the cell during which we see collection view jitters/jump up down due to content size changes Any ways to improve this?


|U03HPFD1GG7|:
Here is the video

|U03HL03H7QC|:
Hi Pavan, there are a few different strategies you can take here, depending on how you’re updating your cells. What you’ll want to do is to apply a content offset to the scroll view that is the _inverse_ of the increase in the size from cells above the currently visible area. This would need to be performed synchronously, however. The details here depend on the specifics of your layout definition, though.

Another alternative is to use `.estimated` for your item definitions, Then, if their size changes, UICollectionView will automatically adjust the content offset to preserve the semantic scroll position.

|U03HPFD1GG7|:
Hi Aditya, yes we are using `estimated` height and the above results with that, so what we are doing once we get actual size we are reloading the section to determine the actual height but during which content size changes hence collection view jumps

|U03HPFD1GG7|:
I didn’t understand the inversion logic you said, sorry

|U03HL03H7QC|:
Ah, reloading the _section._ That is unfortunately a known issue with UICollectionView currently, where we don’t preserve the scroll position when items/sections are reloaded.

|U03HPFD1GG7|:
I see, do you think this could be solved in SwiftUI using ScrollView + LazyVStack?

|U03HPFD1GG7|:
Any other recommendation is to improve this UI will be great help since this just works fine in android where our customers complaints for iOS :disappointed:

|U03HL03H7QC|:
Have you tried reconfiguring the individual items instead? Use either the
reconfigure method on diffable data source, <https://developer.apple.com/documentation/uikit/nsdiffabledatasourcesnapshot/3804468-reconfigureitems>

or `UICollectionView.reconfigureItems(at:)` :
<https://developer.apple.com/documentation/uikit/uicollectionview/3801889-reconfigureitems>

reloading performs a delete + insert

|U03HPFD1GG7|:
hmm i see, but our app supports from iOS 13 but this API looks like from iOS 15.0 unfortunately

|U03HL03H7QC|:
Prior to iOS 15, you can update the contents of the cells directly (by fetching them from `UICollectionView.cellForItem(at:)`, and call `performBatchUpdates:`  with an empty block to update their visible sizes.

|U03HL03H7QC|:
Cells that are off screen, or not currently prepared for display (like prefetched cells) will return nil from `cellForItem(at:)` , and you can just specify the full-size image when they’re dequeued the next time.

|U03HPFD1GG7|:
&gt; Cells that are off screen, or not currently prepared for display (like prefetched cells) will return nil from `cellForItem(at:)` , and you can just specify the full-size image when they’re dequeued the next time.
Do i need to return nil for this specific case?

|U03HPFD1GG7|:
&gt; Prior to iOS 15, you can update the contents of the cells directly (by fetching them from `UICollectionView.cellForItem(at:)`, and call `performBatchUpdates:`  with an empty block to update
So with this approach will collection view preserves the scroll offset?

|U03HL03H7QC|:
No, you’d be calling cellForItem(at:) on the UICollectionView, so it will return nil if a prepared cell does not currently exist.

&gt;  So with this approach will collection view preserves the scroll offset?
Yes! That should preserve the scroll offset.

|U03HPFD1GG7|:
aha  it’s just like below?
```
psuedo code
// loop over cells
let cell = UICollectionView.cellForItem(at:...)
cell.image.height = xxx

// Call performBatchUpdates
collectionView.performBatchUpdates { &lt;empty&gt; }
```

|U03HL03H7QC|:
yep! That should work! Definitely encourage you to try it out.

|U03HPFD1GG7|:
Ok thanks a lot for the great tips let me give a try :slightly_smiling_face:

|U03HPFD1GG7|:
Just curious to know, does this issue can be solved if we adapt SwiftUI from iOS 14.0?

|U03HL03H7QC|:
Also, an alternative approach to all of this would be–if you had control over the server–for the server to tell you what the size of the image is before-hand. If that’s not possible, you could also try reading the first few bytes of the image data to get the size.

|U03HPFD1GG7|:
unfortunately that would be hard to get the sizes from the server since we don’t control the data instead merchants does in our platform, but anyways we could give a try with suggested approach first and see

|U03HL03H7QC|:
Fair. Feel free to file a feedback if you run into issues, perhaps even try to get a lab appointment.

|U03HPFD1GG7|:
Yes i got one for tomorrow but will give a shot on this, thanks

--- 
> ####  Hello! How can I get started with UIKit? I currently know SwiftUI only (which, in my opinion, is amazing btw!), but I'd like to learn a little bit of UIKit too, because I might use it in some cases too in the future.


|U03HELWUJN9|:
Thanks for asking this question. It’s always good to know both frameworks so you can leverage the power of both and choose whatever is best for the problem you are solving. There are great, brand new documentations this year for both SwiftUI and UIKit. You can find a guide to get started here: <https://developer.apple.com/tutorials/app-dev-training#uikit-essentials>

|U03JRP87THN|:
Thank you very much!

|U03JRP87THN|:
Really appreciate it.

|U03HELWUJN9|:
We also have a new sample app this year that we are using for the Desktop Class App talks, which is a very feature rich app that I would recommend checking out here: <https://developer.apple.com/documentation/uikit/app_and_environment/building_a_desktop-class_ipad_app>

|U03JRP87THN|:
Thank you!

|U03HELWUJN9|:
Aside from that there are also tons of other resources on the internet that have a very high quality, so I’d also suggest looking around a bit there and see what people recommend.

|U03JRP87THN|:
I must say that the tutorials are amazing. I followed some of them to learn Swift and SwiftUI. Thank you for this great tutorials and documentation!

--- 
> ####  Using ShareLink in SwiftUI and Transferable, we will now be able to share custom types between users. How does this compare to sharing Core Data entities using a .shared CloudKit database? As I understand, the main difference is that sharing using Transferable copies the item from User A and pastes it for User B, so in the end there will be 2 instances of this item, with no synchronization. Any subsequent changes to any of the items will remain local for that user. In contrast, sharing using .shared CloudKit database means a single entity will be synchronized for both users. Am I on the right track? Are there some other key differences to be aware of?


|U03HW7P2WTB|:
Hi Jan!

|U03HW7P2WTB|:
&gt; How does this compare to sharing Core Data entities using a .shared CloudKit database?
There is a difference: `ShareLink` is used for sharing here and now, not for persistent storage. Core Data is a database–and its intended use is for storing items on the disk.

&gt; As I understand, the main difference is that sharing using Transferable copies the item from User A and pastes it for User B
It depends on which transport APIs we are using. For example, Drag and Drop allows sharing items within a single process or between different processes. Copy/paste works similarly.

If we are using `FileRepresentation`, we can specify the `allowAccessingOriginalFile` parameter for `SentTransferredFiles` and tell the system if should make the copy, or not.

`Transferable` doesn’t provide any synchronization, just passes around data.

|U03JMMN8659|:
Thank you <@U03HW7P2WTB>! So in a use case where we are sharing persistent data between users of the same app (for example, a recipe created by the user in a recipe app), is using ShareLink discouraged in favour of sharing using Core Data + CloudKit?

|U03HW7P2WTB|:
I wouldn’t say *discouraged*, it just has different purpose. `ShareLink` allows to present the share sheet or another system sharing interface, so users could send over the recipes to their friends in Messages, or pasted into Notes, etc. Does this make sense?

|U03JMMN8659|:
Yes I think so - in this case, the recipe would have to be converted to something Messages/Notes can understand, like String or Image. Right?

--- 
> ####  Good morning! Thank you for a wonderful WWDC! I was trying to play around with the new PhotoPicker. I’m able to initiate the picker but I’m not quite sure how to assign the selected photo to an image in my SwiftUI view. Would you please provide a code sample? I was trying to look into the documentation but I couldn’t find anything that would resolve my problem. 


|U03HB07LNLW|:
Good morning Euguene.

We're glad you enjoyed WWDC!

Did you try out the code snippets from the What's new talk? That has an example covering that.

|U03JL6ZAKAQ|:
Yup. Also didn't work on my machine 

|U03JL6ZAKAQ|:
The PhotoPicker won't dismiss itself. And also I'm not sure where/how to grab that image 

|U03J20KFJG3|:
It's a bug. Check my thread here for a fix. <https://twitter.com/xmcgraw/status/1534557535495147520?s=21&amp;t=wihRQOSc4PXqFcu1fWt-dQ|https://twitter.com/xmcgraw/status/1534557535495147520?s=21&amp;t=wihRQOSc4PXqFcu1fWt-dQ>

|U03J20KFJG3|:
You can access the Data of the image (Transferable).

--- 
> ####  Having implemented several SwiftUI apps, I still consider its constraints concerning custom designs a challenge to communicate to designers. Apart from HIG or trying out, do you know any resources/tooling which helps to implement good design? Like are their Sketch export tools to generate code for components/symbols?


|U03HELTEP9T|:
I know there are Figma (and potentially Sketch) plugins for generating SwiftUI code from designs, however I haven't personally used them so I can't vouch for how well they work

|U03HELTEP9T|:
Apple also provides design tool plugins, which make it easier for designers to create mock ups that use stock system components and styles:

<https://developer.apple.com/design/resources/>

|U03HELTEP9T|:
Of course, nothing is going to be as high fidelity as the designer jumping into SwiftUI directly.

Many designers have found SwiftUI to be surprisingly approachable and there are a number of SwiftUI resources available on the internet targeted at teaching designers to code SwiftUI views.

|U03JRNE4KJL|:
Yeah, stock components are well supported and I know it’s in Apples interest to push in that direction (which I like), but reality bites more often with custom tweaks and they are sometimes really hard to solve…

|U03JRNE4KJL|:
I wish PaintCode would be updated to export to SwiftUI…

--- 
> ####  Is there a way to coordinate between SwiftUI DragGesture with their UIKit counterparts in the UIGestureRecognizerDelegate like `shouldBegin` or `shouldRequireFailure`?


|U03HHJNTFM0|:
Sorry, no, there's no interop between SwiftUI gestures and UIKit gestures.

|U03JELT4UC9|:
How about multiple SwiftUI DragGestures? <@U03HHJNTFM0> 

|U03HHJNTFM0|:
You can ensure exclusivity with this:
<https://developer.apple.com/documentation/swiftui/gesture/exclusively(before:)>

|U03JELT4UC9|:
Does it work if there are two DragGestures applying to different views?

|U03HELT4EG5|:
No, the exclusivity is only for a single gesture application.

|U03JELT4UC9|:
Then my question would be how to coordinate them
They seem to conflict each other, and optionally I want to disable one over another

|U03HELT4EG5|:
It's not supported. Please file a feedback request for this.

|U03JELT4UC9|:
Will do, thanks <@U03HHJNTFM0>  <@U03HELT4EG5> 

--- 
> ####  About SwiftUI’s Layout: When creating a custom Layout, is it OK to use another Layout within the func like sizeThatFits or placeSubviews, including the built-in Layout (like HStack)?  More specifically, is it possible to compose some HStack and VStack within my custom Layout? In that case I have to create a LayoutSubview by myself, is it possible?


|U03HELTEP9T|:
Yes this is an explicit use case the Layout protocol was designed to support

|U03J7BPCWMN|:
Yes, that should be fine, although you'll need to manage the cache(s) of any intermediate layouts you use. (E.g. store them in your own layout's cache storage, and invalidate them as needed.)

|U03J7BPCWMN|:
You can also create subsets of the subviews collection, to pass to the inner layouts.

|U03J7BPCWMN|:
… use the LayoutSubviews subscript(bounds:) operator for that.

|U03JLPYRCFK|:
Any examples of layouts inside layouts we could look at?

|U03J7BPCWMN|:
I don't think there are any available examples of that yet.

|U03JLPYRCFK|:
I’ve made one that works but doesn’t yet deal with cache completely. <https://gist.github.com/ryanlintott/d03140dd155d0493a758dcd284e68eaa>

|U03JRP2D5NC|:
For example, I’m implementing the (Vertical) Flow Layout. After doing some calculation and chunked the `subviews`, firstly I use those chunked subviews to make some `HStack`s, then I should embed these `HStack` into a `VStack` but I cannot convert these `HStack`s to `LayoutSubviews` that I can pass to `VStack`’s `subviews`parameter, right?

--- 
> ####  Hi there! What's the recommended way to repeatedly fetch data in a SwiftUI app, (so that we don't push updates from a different thread)?


|U03J7BQQNPJ|:
In general, I would suggest to factor out the logic that fetches the data into its own type. You always want to execute this kind of side effect not on the main thread and the hop back onto the main thread to set the data on the model.

Swift’s actors are a great tool to encapsulate this kind of logic. So for example you could the model that is offered to the view be an `ObservableObject` that is bound to the main actor, and have a separate actor (hence running on a separate thread) that takes care of the fetching and report back new data to your observable object.

|U03HZ60G5K7|:
do you have an example of that?

|U03JRP87THN|:
Thanks! In my case, I had a model that conformed to ObservableObject, but somehow I still got the warning. Will look into it though!

|U03JHV01DFC|:
I would like to see sample code for this. Words do not describe the nuts and bolts of coding.....

|U03JMMN8659|:
I think conformance to ObservableObject is not the issue here. What you want is for your function to be wrapped in the Main actor, so updates to UI are pushed on the main thread: @MainActor func getData() {}

|U03JRP87THN|:
Yeah, I understood that the conformance to ObservableObject is not the problem, but rather the way I used to asynchronously fetch data to the model. Thanks!

|U03JRP87THN|:
Here’s a link about Swift Actors that i just found: <https://developer.apple.com/videos/play/wwdc2021/10133/>

--- 
> ####  Would you use SwiftUI or UIKit to implement a list that can change layout between a table and grid layouts? I currently have a UICollectionView with different layouts but I can't animate between the layout change.


|U03JRNE4KJL|:
~…what’s your iOS target version~ :smiling_imp:

|U03HELWUJN9|:
As always we recommend using the tool that is best for the job. UICollectionView does support animating layout changes via `setLayout:animated:` so there is no need to rewrite this in SwiftUI. If there are specific things you want to achieve that can only be achieved in SwiftUI, then of course converting it to that is a very valid option.

|U03JB2UUT46|:
<@U03JRNE4KJL> 15 and 16

|U03HELWUJN9|:
This also might be a good question for a 1on1 lab if you are facing specific issues with collection view animating between layouts.

|U03JB2UUT46|:
If there is time available I'll try to grab one :sweat_smile: I forget if I was using `setLayout` before and what the crash was. I'm using compositional layout and returning a different `NSCollectionLayoutSection` based on if the layout should be a grid or list, and calling ``self.collectionView.collectionViewLayout.invalidateLayout()` , but I can try that and see if it works, or maybe there is a better way to construct multiple layouts?

|U03HL03H7QC|:
Right, UICollectionView can’t currently animate changes to the layout stemming from an invalidation. If you require an animation, I would call `setCollectionViewLayout(_:animated:completion:)`

--- 
> ####  Assume that I keep the whole app state in the state object in my app struct? This way I can make sure that all the views are in a consistent state and have a single source of truth. How can I tune performance because in this case, SwiftUI starts diffing the whole app view hierarchy on every single change of the app state?


|U03HKVDCL7N|:
You’re completely right that with a single observable object, you’ll end up invalidating large parts of your view hierarchy whenever a change occurs. Invalidating even large amounts of the SwiftUI view hierarchy should be an inexpensive operation, as view descriptions are rather lightweight, but if you are running into performance issues here, there are a few things you can do to help. The first recommendation I have is to split out some of the values which are only relevant to a certain subset of views into their own observable object. This is likely going to get you the most performance win of any of these suggestions, but if you don’t want to make that architectural change, there are still some things you can do:

• Avoid marking non-published values of your `ObservableObject` published
• (Assuming you’re using `EnvironmentObject` to make sure your single `StateObject` can be accessed throughout your view hierarchy) ensuring you only declare dependencies on the `EnvironmentObject` in places it’s needed
• And if you still need to optimize further, writing a custom `objectWillChange` implementation for your `StateObject`s which only does invalidation when changes that should actually affect the UI occur (in cases, for example, where published values have multiple different representations that should display in the same manner).


|U03J0GP5L6R|:
Thanks Sam :+1:

--- 
> ####  What is correct way to specify file type that allowed for Drag&amp;Drop from Finder. I mean if I use ```UTType.fileURL``` it allows to Drop any type of files, but if I specify ```UTType.image``` that not allow Drop at all. What is correct approach if I want allow Drop only images from Finder?


|U03HL05FX6Y|:
Use the generic UTType.fileURL. And also override draggingEntered to inspect the exact file types on the pasteboard. Return true/false as appropriate.

|U03HL05FX6Y|:
Also when inspecting the pasteboard, use the options to auto filter the list for you.
func readObjects(
    forClasses classArray: [`AnyClass`],
    options: [`NSPasteboard`.`ReadingOptionKey` : Any]? = nil
) -&gt; [Any]?

|U03J21F2PQS|:
If I use SwiftUI
```
DropDelegate.dropEntered(info:)
```
how I can get access to the pasteboard from DropInfo object? Or there is another approach in this case?

|U03HW7P2WTB|:
Let me chime in. `DropInfo` has a member called `hasItemsConforming(to:)` member, <https://developer.apple.com/documentation/swiftui/dropinfo/hasitemsconforming(to:)-47irh>, which allows to check for the content types you are interested in. Does this help?

|U03J21F2PQS|:
I try to use it, but unfortunately, it does not help in my case. Or maybe I just do something wrong. This method only checks the dropped content type. In my case it’s
```
UTType.fileURL
```
but it does not check is this an image or an mp4 file.

|U03HW7P2WTB|:
Is it iOS or Mac?

|U03J21F2PQS|:
macOS

|U03HW7P2WTB|:
Then the first idea on top of my head is to try to initialize `NSImage` with the URL/Data from the `NSItemProvider` and see if it succeeds.

|U03HW7P2WTB|:
If the app isn’t restricted to images from Finder only, you could register for receiving `NSImage.imageTypes`

|U03J21F2PQS|:
Oh, great idea. I’ll try to initialize
```
NSImage from NSImageProvider
```
Thank you Julia!

--- 
> ####  I'm trying to mimic the 3-view layout in Xcode, Pages, Numbers, etc.  using SwiftUI.  Sidebar | Document | Inspector  I can use the NavigationSplitView for the Sidebar and Document, but I can't find a way to animate the Inspector in a right sidebar. The SwiftUI animation usually animates all the child views in the Inspector's view. Is there a way to do this in SwiftUI on the Mac?


|U03HHJH9C66|:
Hi James - thanks for the question. One thought we had here is potentially using an `HSplitView` as the view for your detail, and having one of its children be the inspector. The animation not working is likely a bug, and we'd definitely appreciate a feedback about it.

|U03HHJH9C66|:
How are you trying to do the animation currently, if I may ask?

|U03KAP7FKPB|:
I’ve tried something like

|U03KAP7FKPB|:
with previous code (NavigationView is apparently deprecated)

_NavigationView {_

      _SideBarView(survey: $document.survey)_

      _HSplitView {_
        _DetailView(document: $document)_
          _.padding()_

        _InspectorPane(survey: $document.survey)_
          _.animation(.linear, value: uiState.showInspectorPane) // looks terrible_
      _}_
    _}_

I’ve tried moving the _.animation_ inside the InspectorPane() struct, but the effect is still bad.

|U03HHJH9C66|:
Ok, sorry you're hitting that. It would be helpful if you could include those details in the feedback.

|U03KAP7FKPB|:
But this is the expected approach, but using NavigationSplitView?

|U03HHJH9C66|:
That feels like a good expression of this structure, yes

|U03KAP7FKPB|:
Thanks.

--- 
> ####  Is there a way to allow duplicate CommandMenu item .keyboardShortcuts? In AppKit macOS menus, this works, but not in SwiftUI.  The duplicate shortcuts are never active at the same time - they depend on the type of the selection focus. (FB9931615)


|U03HB0DC1PY|:
Assigning the same shortcut to different menu items is not recommended, even for AppKit apps.

The user should be able to predict the outcome of each shortcut. If the selection focus changes which menu item is invoked, that would be confusing.

|U03HZ42MBV3|:
The context (math vs text selection) is different enough to avoid confusion,  but more importantly the change from AppKit to SwiftUI forces a UI change in the new app version which breaks current users muscle memory.

|U03HB0DC1PY|:
I see you've already filed feedback, thanks.

|U03HB0DC1PY|:
I don't suppose that the two different actions are similar enough that you could combine them into the same menu item, with the same shortcut?
The Copy menu item is a good example of something that applies in a variety of different circumstances, and is strongly responder chain / focus driven...

|U03HZ42MBV3|:
In the one case where I had overloaded a shortcut, no. (Command-I for italics in text, as people are very used to. In math, formatting is determined by content, so there is no Italic action. Command-I was overloaded for Isolate, and had been for 30 years, even before the app supported text blocks at all. It is a very, very old application.)

|U03HZ42MBV3|:
I have rewritten 35 years of code in Swift and SwiftUI with the goal of maximum bug-for-bug compatibility. While there are inevitably going to be differences, I would like to make the transition as seamless as possible for users, many of whom have been using the software for decades.

|U03HB0N777G|:
Ron, in your AppKit version, did you use the same selector for each item that had a matching command key? I’m asking just to understand the approach that worked for you in the old codebase.

--- 
> ####  SwiftUI Layout isn't possible for dynamic content, right? Since each subview need to be there at calculation time.


|U03HELTEP9T|:
It could depend what you mean by dynamic content

|U03HELTEP9T|:
The SwiftUI layouts you write yourself, like the system provided HStack and VStack, require all children up front

|U03HELTEP9T|:
However, often we use "dynamic" within the team to refer to content driven by a ForEach

|U03HELTEP9T|:
And that is absolutely supported with custom SwiftUI Layouts

|U03JLPYRCFK|:
If the subviews change size the layout should respond to those size changes.

|U03HELTEP9T|:
The main thing that SwiftUI Layout doesn't support today is the lazy/incremental layouts that don't need to load all views up front

|U03HELTEP9T|:
There is not a way to build your own LazyHStack and LazyVStack on top of SwiftUI Layout... or at least not one that is as efficient in lazy loading content

|U03HELTEP9T|:
But as <@U03JLPYRCFK> alluded to, the SwiftUI framework automatically manages dependencies between views and will recall your layout's sizeThatFits or placeSubviews whenever anything needs to be recomputed (including child size changes)

|U03J1VDSTA7|:
Thanks for the answer, <@U03HELTEP9T>. I mean something like Lazy in my question, which you already answered :grin:

|U03JRP87THN|:
So, if the Layouts could’ve been lazy, that means that the views in the Layout would’ve been loaded only when needed (when they appeared on screen)? I’m asking this to make sure I understood the concept of lazy grids.

|U03HELTEP9T|:
<@U03JRP87THN> That's correct. A lazy Layout theoretically wouldn't have access to all of its children up front from sizeThatFits or placeSubviews, and so that limits some of the things it can calculate up front. Paul covers this well at the beginning of the "Compose custom layouts with SwiftUI" talk from yesterday: <https://developer.apple.com/videos/play/wwdc2022/10056/>

|U03JRP87THN|:
Thank you very much for the clarification!

--- 
> ####  When using SwiftUI with Core Data, should we setup the predicate and sort descriptors for a FetchRequest in the View init or in the onAppear of the View, when they’re based on object passed from the containing View? I noticed some issues when using the onAppear because items are displayed then removed (with animation).


|U03J7BQQNPJ|:
If you want to be sure that the `FetchRequest` is setup before the view does any work you might want to set that up in the initializer.

I think it would be worth to file a feedback regarding the issue that you are seeing with `onAppear`.

|U03JRQ81NEL|:
How to update FetchRequest for searchbar changes?


|U03JMMN8659|:
On this point in particular, I think we deserve a more SwiftUI-esque layer for communicating with Core Data. Turning the process of fetching data into a View is not very intuitive and breaks MVVM

|U03J22FSUUS|:
Is there a best practice for Core Data and Swift UI app project on <http://developer.apple.com|developer.apple.com>?

|U03JMMN8659|:
<@U03JRQ81NEL> here I can help. You pass the searchValue to your view with FetchRequest. Then in the init, you add an NSPredicate specifying that only results that contain searchValue should be shown, and then create a FetchRequest with that predicate

|U03J20KFJG3|:
Thanks <@U03J7BQQNPJ>. I'll fill a feedback.

Do you confirm that the FetchRequest is reset when the containing View is redrawn? For example, if the SubView customises the predicate or sortDescriptor (in a context where the SubView apply some filters). The FetchRequest is not tied to the View lifecycle contrary to State or StateObject.

--- 
> ####  Is there a specific session this week that discusses App Extensions, and the new AppExtension API (<https://developer.apple.com/documentation/extensionfoundation/appextension)?|https://developer.apple.com/documentation/extensionfoundation/appextension)?> I tried searching and found nothing.


|U03HKVDCL7N|:
Hi! There’s no session related to AppExtensions, but if you have specific questions about it, feel free to submit those and we’ll respond as best we can :slightly_smiling_face:

|U03HYBRAJNB|:
Just an introduction and overview. Is there some sample code. The docs are pretty sparse. For example, will this API allow me as Developer A to open up a part of my app and UI to Developer B to extend, or is it limited to extending Apple apps?

|U03JNQ1ABFC|:
Currently we have no documentation beyond the  published API reference. 

--- 
> ####  In SwiftUI, is there a way to listen for navigation events or would that have to be custom from UIKit delegates?


|U03HW7P0HQR|:
Thanks for the question, Martin.

With the new iOS 16 NavigationStack, you can bind a path to the stack. Then you can use the `.onChange()` modifier to watch for changes to the path.

|U03HMCTSM2B|:
What about non navigation events like dismissal of sheets or full screen modals? Is there a stateful way to be informed of when these events are done so we can say present a follow up confirmation or pop the navigation stack back?

|U03HW7P0HQR|:
Hey. David. Those dismiss events will reset the binding that caused the modal presentation to appear. So the same recommendation works there. You can use `onChange()` to observe that binding too.

|U03HMCTSM2B|:
What if you’re programmatically changing those bindings? If I set an isPresented var to false to dismiss a modal, how would I be able to know when the modal is actually gone? If I change the navigation backing state right away to pop a view or try and set a sheet as not to display , I’m usually presented with inconsistent UI behavior or a message saying that I’m trying to present / dismiss in an invalid state.

|U03HW7P0HQR|:
Ah, I see.

|U03HMCTSM2B|:
I’m usually stuck doing something like asyncAwait after and then playing with the timeframe and that’s, well, gross.

|U03HW7P0HQR|:
The delay hack is one approach.

|U03HMCTSM2B|:
Yah, and I does work for sure

|U03HW7P0HQR|:
Another approach people seem to have some success with is using a common `sheet` modifier for a variety of presentations.

|U03HW7P0HQR|:
Then you can drive the sheet with an optional enum state.

|U03HW7P0HQR|:
Set it to `nil` to dismiss, or switch between different non-nil values to present different sheets.

|U03HW7P0HQR|:
We’re also made some improvements in iOS 16 to make the invalid state issue much less common. For example, we try to delay the presentation of the next sheet until the previous one is gone. So you might find that things just work now. :slightly_smiling_face:

|U03HMCTSM2B|:
Yah, and that does work, but when you mixing sheets, full screen modals (leveraging into uirepresentable) and navigation stack changes, the interaction doesn’t line up nicely. OK, I’ll have to test around and file some feedbacks if I still find cases.

|U03HMCTSM2B|:
Thanks

|U03HW7P0HQR|:
I’d love a Feedback with details of your use case.

|U03HMCTSM2B|:
Sure; I’ll see if I can extract out the sample cases.

|U03HW7P0HQR|:
Thank you!

--- 
> ####  Do ids in a ForEach just need to be unique within that ForEach or globally? For instance using the new Charts, all my data is keyed by date and there are several places where I have adjacent ForEaches that include mostly the same dates.


|U03J7BPCWMN|:
The IDs must be unique within the container, so for example if you have a List with two ForEach's inside it, they must generate unique IDs within that List.

--- 
> ####  I am new to SwiftUI, what is the best way to Switch between Views? For example, depending on the condition of a @State variable how can I switch between a HomeView, SignInView and SignUpView?


|U03JEUDCNKV|:
I’ve personally done this before with a parent “container” view, an `enum` to represent the different possible views, and an `@State`  var that I use in a `switch` statement to swap out views. I have `@Binding` vars in all my child views so they can programatically change what’s shown in the parent.

However, with programatic navigation in `NavigationStack` that’d probably be the preferred way to do this, check out the <https://developer.apple.com/videos/play/wwdc2022/10054/|SwiftUI cookbook for navigation >session by <@U03HW7P0HQR> for more

|U03H318N6T1|:
You can actually use `switch` statements directly in SwiftUI! e.g.

```
enum Screen {
    case home
    case signIn
    case signUp
}

...

@State private var selectedScreen: Screen

...

var body: some View {
    switch selectedScreen {
    case .home:
        HomeView()
    case .signIn:
        SignInView()
    case .signUp:
        SignUpView()
    }
}
```

|U03JEUDCNKV|:
Yeah that’s how I’ve done it

|U03JEUDCNKV|:
But I mostly did that because I couldn’t use a `NavigationStack` on macOS before

|U03JRP87THN|:
`NavigationView`  is what I used before the new navigations were introduced.

|U03H318N6T1|:
Depending on your needs, `NavigationStack` is also a great tool to use for this, directly manipulating the current path :+1:

But if you just need to swap views in and out, a `switch` works just fine. For example, it’s common to use a `switch` to choose the detail view of a `NavigationSplitView` based on the current selection.

|U03JHQDJ31C|:
Thank you so much!

--- 
> ####  TextKit 2 question: just watching the video about how glyph APIs are no longer available.   I have code that capitalises characters at glyph rendering time, by finding the appropriate character range for the glyph range, converting to upper case, and re-generating glyphs for the new string.   It’s important to me to not change the contents of my text storage to have the upper case characters — this should behave like a display time attribute.   How would you go about doing this in TextKit 2?


|U03HELXN8CV|:
We don’t have any TextKit 2 experts around this morning - but there’s a lab tomorrow morning at 10AM PDT - that would be a great place to ask this. The TextKit folks are very friendly :-)

|U03HELXN8CV|:
Look for “TextKit 2, Fonts, and SFSymbols Adoption lab”.

|U03J1R49EVB|:
I will ask there!

|U03JB2WCEPL|:
I'd love to know the answer to this too

--- 
> ####  SwiftUI: When using Self._printChanges() in the body of Views, what should we pay close attention to? Is @Self printed often harmful? What are the numbers @44 we see when using FetchRequest in the View.


|U03J7BQQNPJ|:
`@Self` self is not inherently harmful. The purpose of `Self._printChanges()` is not to indicate that something is wrong but rather as a tool to match your expectation with what is happening at runtime.

What you want to be on the look out for is that you don’t do unnecessary invalidation which might cause performance issue.

If you see `@` followed by any number it means that we couldn’t find the field (property) name, so printed the byte offset of the swift view struct field instead.

|U03J20KFJG3|:
Thanks <@U03J7BQQNPJ> for the precisions! Helpful. I'm seeing lots of @Self printed when a View has an EnvironmentObject dependency (a Core Data object), and the object publishes a change. For example, a List of Core Data objects (owned) related to the EnvironmentObject (owner). If I update an owned object from the List, the relationship between the owner and the owned is updated, the owner EnvironmentObject publishes an update. This break the animation that should be displayed when updating the owned item in the List.

--- 
> ####  Hi ! I’m still having an issue with generic view models in SwiftUI. I’m having trouble to understand what should I choose between `@ObservableObject` or `@StateObject` when injecting a generic view model into a SwiftUI view.  I’m commonly doing this: ```swift protocol ViewModelProtocol { }  struct MyView&lt;ViewModel: ViewModelProtocol: View {     @ObservedObject var viewModel: ViewModel }  let myViewModel = MyViewModel() let myView = MyView(viewModel: myViewModel) ```  In this case, the `viewModel` property should be `@StateObject` or `@ObservableObject` ?


|U03J2125SNP|:
I may add some precision to my code example. The `ViewModelProtocol` conforms to `ObservableObject`. And `MyViewModel` should be a `class` conforming to `ViewModelProtocol`

|U03HL00QL68|:
This particular example should be `@ObservedObject` <https://developer.apple.com/wwdc22/10072>. There are a few nuances that are explained in this year's _Use SwiftUI with UIKit_ and last year's _Data Essentials_ sessions. With `@StateObject` , `MyView` would _own_ the model, and is at liberty to make a copy of it when initialized. That means that the `myViewModel` variable would become "disconnected" from the `@StateObject` .

|U03HL00QL68|:
<https://developer.apple.com/videos/play/wwdc2020/10040|Data Essentials in SwiftUI>

|U03J2125SNP|:
Thanks for the quick reply ! What is a common case where `@StateObject` should be useful ? I feel like when I’m using it, I can’t mock any data because the model can’t be injected so it makes unit test or screenshots automation harder

|U03HB1A8VRU|:
If your view wants to own an ObservableObject view model, and the lifetime of that object should match the lifetime of the identity of the view, you should use StateObject.

You can initialize a StateObject with an external value using this code in your initializer:
```
_viewModel = StateObject(wrappedValue: existingModel)
```
Note that the value passed to that initializer is accessed once and can't change over time.

|U03J2125SNP|:
Thank you. It makes sense. With your solution, `@StateObject` allows me to mock the data passed to the view (example: if the view displays a list of books, I can pass the mocked book list to the view initializer and then instantiate the `StateObject`). But it does not allow me to mock the state of the view (example : if the view model controls wether or not the view is in editing mode)

Edit : typo

--- 
> ####  Using SwiftUI cells in UIKit is a fantastic feature in iOS 16, however that will not work if my app is still supporting iOS prior to iOS 13. Right ?


|U03HELWUJN9|:
The use of new APIs requires iOS 16, so unfortunately you can not use these in iOS 15 or before. However you can use them in an app that is available on iOS 15 and before conditionally when the user is running iOS 16.

|U03JR3BQQJ2|:
Thanks <@U03HELWUJN9>
So I will always need to wrap my code in the `if @available` block

|U03HELWUJN9|:
Correct. That is the recommended way to do this.

|U03JR3BQQJ2|:
Thanks for confirming <@U03HELWUJN9> :pray::skin-tone-2:

--- 
> ####  Hi there! This might not be a UI-specific question (sorry for that), but I'd like to know the answer to use the new SwiftUI APIs.  How can I make sure I support older iOS versions, for example iOS 15 in my SwiftUI app, while still using the new features for iOS 16 users? Are there any macros for that?


|U03HELXATD3|:
You can conditionalize your code based on whether iOS 16 APIs are available like this:
```
if #available(iOS 16, *) {
    // iOS 16 code
} else {
    // iOS 15 and earlier code
}
```

|U03JRP87THN|:
Thanks!

|U03JRP87THN|:
This is exactly what I was searching for.

|U03JRP87THN|:
Is there any difference between `if #available`  and `@available` ?

|U03HVFXKB5L|:
Also note that Xcode will see that you are targeting an older version and will offer to put that check for you automatically. Either as `if #available`, or prefix your entire function or struct with `@available(iOS 16.0, *)`

|U03JRP87THN|:
I saw someone talk about `@available` in another thread, the question above this one.

|U03JRP87THN|:
Thank you!

|U03HELXATD3|:
`@available` is used to annotate your declarations to mark them as requiring a newer iOS version. For example, if you have a method that takes in an object/struct only available on iOS 16, then you need to annotate the method as `@available(iOS 16, *)`

|U03HELWUJN9|:
`#available` is a runtime check to be used in a condition. `@available` is an annotation for a method that makes that method unavailable. If your iOS 16 only code is run in a method that is only available in iOS 16 then the compiler won’t complain. So you can use a mixture of both.

|U03JRP87THN|:
Thank you!

|U03HELXATD3|:
Right, the compiler will then complain if you try to call that method on an older iOS version. Frameworks like UIKit and SwiftUI use this to prevent new API introduced in iOS 16 from being called on iOS 15, for example.

|U03JRP87THN|:
Interesting! Thank you very much, I really appreciate it!

|U03HVFXKB5L|:
Usually one way suffice, but sometimes, you can use both together:

```
struct ContentView: View {
    var body: some View {
        VStack {
            if #available(macOS 13.0, *) {
                MyNewView()
            } else {
                // Fallback on earlier versions
                MyOldView()
            }
        }
    }
}


@available(macOS 13.0, *)
struct MyNewView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Hello")
            }
            GridRow {
                Image(systemName: "hand.wave")
            }
        }
    }
}

struct MyOldView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Image(systemName: "hand.wave")
        }
    }
}
```


--- 
> ####  Is there a way of disabling scrolling on a List, or would the best option be to use UIHostingConfiguration inside of a UICollectionView that's wrapped in a UIViewRepresentable so that I can disable scrolling on the collection view itself?


|U03HELT4EG5|:
Use the new `scrollDisabled` modifier. <https://developer.apple.com/documentation/swiftui/menu/scrolldisabled(_:)>

|U03J4DRK4SY|:
Ah, I completely missed that, nice!

--- 
> ####  Is there an analog to AppKit's flangsChanged notification, to change the appearance of SwiftUI controls based on keyboard modifiers? I'm currently polling on a timer to do this, but that is unsatisfying. (FB9601140)


|U03H32HKZ0F|:
Hi Ron,

You could try using something like this:
```
import AppKit
import SwiftUI

class KeyboardModifierMonitor: ObservableObject {
    @Published var eventModifiers = EventModifiers()
    var localEventMonitor: Any?
    var globalEventMonitor: Any?
    
    init() {
        localEventMonitor = NSEvent.addLocalMonitorForEvents(
            matching: [.flagsChanged],
            handler: { [weak self] event in
                self?.eventModifiers = EventModifiers(event.modifierFlags)
                return event
            }
        )
        globalEventMonitor = NSEvent.addGlobalMonitorForEvents(
            matching: [.flagsChanged],
            handler: { [weak self] event in
                self?.eventModifiers = EventModifiers(event.modifierFlags)
            }
        )
    }
    
    deinit {
        localEventMonitor.map { NSEvent.removeMonitor($0) }
        globalEventMonitor.map { NSEvent.removeMonitor($0) }
    }
}

extension EventModifiers {
    init(_ flags: NSEvent.ModifierFlags) {
        self.init()
        if flags.contains(.capsLock) { insert(.capsLock) }
        if flags.contains(.shift) { insert(.shift) }
        if flags.contains(.control) { insert(.control) }
        if flags.contains(.option) { insert(.option) }
        if flags.contains(.command) { insert(.command) }
        if flags.contains(.numericPad) { insert(.numericPad) }
        if flags.contains(.function) { insert(.function) }
    }
}```
which you would then use in your controls like so:
```public struct MyAmazingButton: View {
    @StateObject fileprivate var eventMonitor = KeyboardModifierMonitor()

    public var body: some View {
        let modifiers = eventMonitor.eventModifiers
        let isOptionHeld = modifiers.contains(.option)
        let isShiftHeld = modifiers.contains(.shift)
&lt;...&gt;
```

|U03HZ42MBV3|:
Nice! Will do.

|U03HZ42MBV3|:
Oh darn! I did try exactly that a year ago.

|U03HZ42MBV3|:
The problem is that while the macOS menu is down, the message is not delivered.

|U03HZ42MBV3|:
The behavior in AppKit of opening a menu, then trying the modifier keys to see what changes while the menu is down is lost.

|U03HL05FX6Y|:
EventMonitors don't fire during tracking loops, and while a menu is open, AppKit is tracking that via an event tracking loop.

|U03HL05FX6Y|:
You can submit a feedback request to get modifier changes during event tracking.

|U03HL05FX6Y|:
But what it really sounds like is that you want a way to provide alternate menu items via SwiftUI.

|U03HZ42MBV3|:
Should I file a separate fb to get modifer events during event tracking, or is FB9601140 sufficient since all I really want is alternate menu items via SwiftUI.

|U03HL05FX6Y|:
<@U03HZ42MBV3> FB9601140 does't discuss menus at all.  Observing modifier changes to update what's in the menu isn't the right way to go about it. Please file a FB requesting what you really need, which is a way to specify alternate menu items in SwiftUI.

|U03HZ42MBV3|:
Sorry, wrong number, juggling too many open issues. that should have been FB9406583

|U03HL05FX6Y|:
Ah, yes. That radar covers it. Thanks!

--- 
> ####  UINavigationBarAppearances have different behavior between iOS 13 and iOS 15.  How can we get the behavior of iOS 13 in the current version of iOS (where the navigation bar doesn't disappear upon scrolling and can take a background color easily)?  And wouldn't it make sense if a breaking change is introduced to document the code necessary to restore the previous behavior?


|U03HELWFGKF|:
The primary change from iOS 13 to iOS 15 is that the `scrollEdgeAppearance` always applies regardless of if you have a collapsible section or not (large title or collapsing search bar)

|U03HELWFGKF|:
so if you want the pre iOS 15 behavior, just configure the `scrollEdgeAppearance` the same as the `standardAppearance`, which should just be 1 extra line of code to assign your configured `standardAppearance` to the `scrollEdgeAppearance` .

|U03JWV00USX|:
I tried that but it didn't work -- it wouldn't take the named color.

|U03HELWFGKF|:
can you post the code your using?

|U03JWV00USX|:
`*let* nav = UINavigationController(rootViewController: spotListVC!)`
    `*self*.window!.rootViewController = nav`

    `*let* spotBlue = UIColor(named: String("PrimaryBlue"))`
    *`if`* `*#available*(iOS 15.0, *) {`
      `// iOS 15 and above`
      `*let* navigationBarAppearace = UINavigationBarAppearance()`
      `navigationBarAppearace.configureWithOpaqueBackground()`
      `navigationBarAppearace.backgroundColor = spotBlue`
      `navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.lightText]`

      `nav.navigationItem.standardAppearance = navigationBarAppearace`
      `nav.navigationItem.scrollEdgeAppearance = navigationBarAppearace`

      `*let* buttonAppearance = UIBarButtonItemAppearance()`
      `buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]`
      `nav.navigationItem.standardAppearance?.buttonAppearance = buttonAppearance`
      `nav.navigationItem.compactAppearance?.buttonAppearance = buttonAppearance`

     `} *else* {      // iOS 14 and below`
      `// Fallback on earlier versions`
      `*let* navigationBarAppearace = UINavigationBar.appearance()`
      `navigationBarAppearace.tintColor = spotBlue`
      `navigationBarAppearace.barTintColor = spotBlue`
      `navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]`
      `nav.navigationBar.tintColor = UIColor.white`
    `}`

|U03HELWFGKF|:
Try adding `let _ = nav.navigationBar.standardAppearance` and seeing if that resolves it. I think you might be hitting a bug when exclusively using per-item appearance only

|U03JWV00USX|:
Ok, let me check

|U03JWV00USX|:
No joy.  Was there a particular place to add that line?

|U03HELWFGKF|:
no where in particular no.

|U03HELWFGKF|:
do you have a feedback request on this? or can you attach a sample (assuming we can do that here!)

|U03JWV00USX|:
When I add these lines:

`nav.navigationItem.compactAppearance = navigationBarAppearace`
`nav.navigationBar.standardAppearance = navigationBarAppearace`

it will engage the blue background upon scrolling...

|U03JWV00USX|:
But it will disappear as soon as the tableView reaches the top edge again.

|U03JWV00USX|:
And no, I don't have any feedback request -- this is my first interaction regarding this topic.

|U03HELWFGKF|:
you would want to set the `scrollEdgeAppearance` as well – the `compactAppearance` is used in landscape on smaller phones only

|U03HELWFGKF|:
(and realistically unless you need to customize `compactAppearance` separately from `standardAppearance` it is rarely necessary to customize it at all)

|U03JWV00USX|:
Oops, I think I added standard twice.

|U03JWV00USX|:
I think I just found it.  I wasn't distinguishing between navigationBar and navigationItem

|U03JWV00USX|:
Sometimes I think a handy little diagram to go along with the explanations would go a long way toward making some of this documentation easier to follow because it can be easy to miss a subtle word change like that.

|U03JWV00USX|:
Thanks for your help!

|U03HELWFGKF|:
no problem!

|U03JWV00USX|:
One last minor issue in the button on the navBar.  The backButton word is the proper color, but the "&lt;" chevron is not.  What controls that?

|U03JWV00USX|:
Right now I have:

`*let* navigationBarAppearace = UINavigationBarAppearance()`
      `navigationBarAppearace.configureWithOpaqueBackground()`
      `navigationBarAppearace.backgroundColor = spotBlue`
      `navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]`

      `nav.navigationItem.standardAppearance = navigationBarAppearace`
      `nav.navigationItem.scrollEdgeAppearance = navigationBarAppearace`
      `nav.navigationItem.compactAppearance = navigationBarAppearace`
      `nav.navigationBar.standardAppearance = navigationBarAppearace`
      `nav.navigationBar.scrollEdgeAppearance = navigationBarAppearace`
      `nav.navigationBar.compactAppearance = navigationBarAppearace`

`*let* buttonAppearance = UIBarButtonItemAppearance()`
      `buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]`

      `nav.navigationItem.standardAppearance?.buttonAppearance = buttonAppearance`
      `nav.navigationItem.scrollEdgeAppearance?.buttonAppearance = buttonAppearance`
      `nav.navigationItem.compactAppearance?.buttonAppearance = buttonAppearance`
      `nav.navigationBar.standardAppearance.buttonAppearance = buttonAppearance`
      `nav.navigationBar.scrollEdgeAppearance?.buttonAppearance = buttonAppearance`
      `nav.navigationBar.compactAppearance?.buttonAppearance = buttonAppearance`

|U03HELWFGKF|:
I think thats still controlled by the navigation bar’s tintColor only.

|U03HELWFGKF|:
its unfortunate, but feedback is always welcome

|U03JWV00USX|:
I don't see that as a possible setting of the UINavigationBarAppearance

|U03HELWFGKF|:
correct, you’d have to set it on the navigation bar directly. thats part of the unfortunate-ness :cry:

|U03JWV00USX|:
Ah, I just did that...

|U03JWV00USX|:
Ok, so now I get it

|U03JWV00USX|:
Whew...

|U03JWV00USX|:
Glad you guys were here this week!

|U03HELWFGKF|:
:smile:

|U03HELWFGKF|:
its definitely come up a few times that having that available in the appearance objects would be super helpful, just hasn’t been high enough priority to get it done yet. Feedback is definitely appreciated in this area though!

--- 
> ####  With MenuBarExtra, is it possible to have a primary action that's triggered when the menu bar item is clicked and then a separate menu that's shown when the item is option clicked?


|U03HHJH9C66|:
Hi - thanks for the question. This isn't something we have support for at the moment, but a feedback with any details you can provide would certainly be helpful.

|U03J4DRK4SY|:
FB10134356!

--- 
> ####  SwiftUI and EnvironmentObject: do we have to pass the object every time we use a NavigationLink?  My app crashes when ViewA adds an EnvironmentObject Post when displaying ViewB, and ViewB navigates to ViewC where ViewC accesses the Post object. Cf: <https://developer.apple.com/forums/thread/707659|https://developer.apple.com/forums/thread/707659>


|U03HL00QL68|:
I think the answer on the Dev Forums is the correct one, does it solve this problem?
&gt;  Your `TagView` requires BOTH a post and a tag but you are only passing a tag environment object...

|U03J20KFJG3|:
I posted an answer but it seems the post failed. So writing it again here: the TagView can only be accessed from a PostView where the post is in the environment (because it's the purpose of the PostView to display the Post and details about it). So why isn't the Post object available from the Environment in the context of the TagView if I push a View from this PostView? <@U03HL00QL68> 

|U03HW7P0HQR|:
Navigation destinations inherit their environment from the stack in which they appear, not from the context in which they are presented.

|U03HW7P0HQR|:
So the navigation environment of a previous view on the stack doesn’t affect the subsequent view.

|U03HW7P0HQR|:
I think you could move your `.navigationDestination(for: Tag.self)` into `PostView`, then propagate both the tag and the post into the TagView from there.

|U03J20KFJG3|:
Thanks <@U03HW7P0HQR> this works (I was doing that). But I’m still not sure I understand exactly: only EnvironmentObject set on the `NavigationStack { }.environmentObject(store)` are available for all views presented by NavigationLinks in the Stack? If I pass an object from within the Stack (like in my example), then it's not really in the Environment for views presented from within the Stack?

|U03HW7P0HQR|:
Right.

|U03HW7P0HQR|:
The parent environment is the one for the whole stack.

|U03HW7P0HQR|:
By which I mean the surrounding `NavigationStack`, not the views on the stack.

|U03HW7P0HQR|:
(Tough to describe this without pictures.)

|U03J20KFJG3|:
Thanks <@U03HW7P0HQR> for the explanations. 

But in my example, I pass the post as an EnvironmentObject when a Post is selected. And it's directly available in the PostView. So this post object is passed in the Environment but not for pushed Views from the PostView. I was expected the object to be available in all the “flow” (cf screenshot).

|U03J20KFJG3|:
Or this flow. I thought that if a Cart object created in the UserLogin View (probably in a NavigationStack) and passed in the Environment from this UserLogin View, it was accessible in the PaymentDetails in the same Stack. But this is only true if the Cart is passed before the NavigationStack?

|U03HW7P0HQR|:
A view can’t have two parent environments. Consider the two ways we could propagate the environment:
```
┌────────────────────────┐                             ┌────────────────────────┐              
│    NavigationStack     │                             │    NavigationStack     │              
└────────────────────────┘                             └────────────────────────┘              
             │                                                      │                          
             │  ┌──────────────────────┐                            │  ┌──────────────────────┐
             ├─▶│      Root View       │                            └─▶│      Root View       │
             │  └──────────────────────┘                               └──────────────────────┘
             │                                                                     │           
             │                                                                     ▼           
             │  ┌──────────────────────┐                               ┌──────────────────────┐
             ├─▶│     Pushed View      │                               │     Pushed View      │
             │  └──────────────────────┘                               └──────────────────────┘
             │                                                                     │           
             │                                                                     ▼           
             │  ┌──────────────────────┐                               ┌──────────────────────┐
             └─▶│     Pushed View      │                               │     Pushed View      │
                └──────────────────────┘                               └──────────────────────┘
```

|U03HW7P0HQR|:
We chose the one on the left and leave it to developers to propagate any additional information as needed. This reduces the number of dependencies.

--- 
> ####  As of Monterey, `List` supports drag-and-drop reordering of items on macOS and iOS/iPadOS, but it seems that other types (e.g., `HStack`, `VStack`, etc.) support drag-and-drop reordering of items on macOS _only_ in Catalyst apps. In any other kind of macOS app, the same SwiftUI code that works as expected in iOS/iPadOS and Catalyst doesn't work (i.e., a drag cannot be started at all). The code compiles just fine, but it doesn't actually work.  How can I support drag-and-drop reordering of items (or sub-`View`s) in SwiftUI code in `HStack`s, `VStack`s, etc. in _non-Catalyst_ macOS apps?


|U03HW7P2WTB|:
Hi John! Could you please file a feedback via Feedback Assistant? It would also be great if you could include a code snippet and describe the desired behavior vs what you see.

|U03JET5HAV7|:
Here's some code that allows a drag to be started on macOS in Catalyst but not on macOS outside Catalyst: <https://pastebin.com/VvJgDq0x>

|U03HW7P2WTB|:
Hm, have you tried to provide the contents to the `NSItemProvider` instead of `nil` ? It is possible that empty `NSItemProvider`s are treated slightly differently on different platforms.

|U03JET5HAV7|:
Changing that line to this worked. Thanks!

`*return* NSItemProvider(item: item *as* NSSecureCoding, typeIdentifier: "public.text")`

--- 
> ####  Hi, is there any recommended way of making controls inside a SwiftUI’s `Form` look more native on macOS in an app made with Catalyst? Would I have to have an AppKit bundle/plugin that renders those SwiftUI views?


|U03HB0DC1PY|:
To enable macOS-native UI in your Catalyst app, go to your target's settings: General → Deployment Info → Mac Catalyst Interface, and switch from "Scaled to Match iPad" to "Optimize for Mac".

Controls in SwiftUI will automatically adapt to be more Mac-like in that mode. Also check out the new Form styles, to have the controls arranged in a traditional Mac columnar layout.

|U03HMCT187R|:
From what I understand, this will put Mac controls into the iOS style Form - it will not enable the macOS style Form. Unless this is changing this year, there’s no way to get native macOS SwiftUI in Catalyst.

|U03HMCT187R|:
FB9994506: Ability to use macOS SwiftUI in iOS app using Catalyst optimized for Mac idiom

|U03HW7NMP6D|:
This year, there is the new `FormStyle` support, with `FormStyle.columns` available on all platforms, including Catalyst. That creates a Form layout like the default on native macOS with trailing aligned labels next to the leading aligned controls

|U03HW7NMP6D|:
```
Form {
    Picker("Notify Me About:", selection: $notifyMeAbout) {
        Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
        Text("Mentions").tag(NotifyMeAboutType.mentions)
        Text("Anything").tag(NotifyMeAboutType.anything)
    }
    Toggle("Play notification sounds", isOn: $playNotificationSounds)
    Toggle("Send read receipts", isOn: $sendReadReceipts)

    Picker("Profile Image Size:", selection: $profileImageSize) {
        Text("Large").tag(ProfileImageSize.large)
        Text("Medium").tag(ProfileImageSize.medium)
        Text("Small").tag(ProfileImageSize.small)
    }
    .pickerStyle(.inline)
}
.formStyle(.columns)
```

|U03HW7NMP6D|:
<https://developer.apple.com/documentation/swiftui/formstyle/columns>

|U03HMCT187R|:
Woooo I love that for us thanks!!

|U03JEKM4LFK|:
<@U03HW7NMP6D> Is there any possibility of creating my own form style? For example if I wanted to backport the new `.columns` style back to macOS Monterey.

|U03HW7NMP6D|:
`FormStyle` is only public this year, so not able to be backported. You would have to create your own `Form` replacement as a whole to do something like that

|U03JEKM4LFK|:
Awesome, thanks for your help!

--- 
> ####  Perhaps a bit of a simple question for such a space, but I am really wondering the best way to get started with SwiftUI. I have done the Apple App Dev course where I build scrumdinger, I've perused the documentation, and I'm very familiar with c, bash, and 6502 assembly (I build games for the NES). However, I'm having a bit of a hard time remembering the syntax. Mostly though, I guess I'm looking for a place to start my own development, for ideas of things to implement to get better at Swift. I have always wanted to at one point in my life work for Apple, like since I saw the iPhone come out in 2007, I'm 19 now. Sorry if this has been a bit all over the place, I'm just so excited to be here.


|U03HELTEP9T|:
Hi Jakob!

&gt; However, I'm having a bit of a hard time remembering the syntax. Mostly though, I guess I'm looking for a place to start my own development, for ideas of things to implement to get better at Swift.
I'd recommend not worrying about learning and getting better at Swift or SwiftUI. Instead I'd recommend finding something you're excited to build and... just building it.

I've found when you do that, you end up learning the language syntax and framework APIs without even trying :slightly_smiling_face:

|U03JTH9NTGD|:
When you say building it, what parts of it? That is a great suggestion though, thanks!

|U03HELTEP9T|:
Just building an app or a game for yourself using Swift/SwiftUI, like it sounds like you're already doing for NES!

|U03HELTEP9T|:
Don't worry about "writing the code the right way" to start. Just worry about getting something working

|U03JTH9NTGD|:
Ahhh gotcha, I read your response wrong, thank you.

|U03JTH9NTGD|:
I have a big problem with putting more effort into looking like I'm doing work rather than actually doing it, so it's refreshing to hear that I'm not really correct for that

--- 
> ####  Can onTapGesture be used more than once on a single view?  Like single-click to select, double-click to open in a window?  ItemView()   .onTapGesture(perform: selectItem)    .onTapGesture(count: 2, perform: openItemInWindow)


|U03HB07LNLW|:
`onTapGesture` can indeed be used more than once but you need to get them in the right order, so that the double-tap fails before the single-tap succeeds.

Something like this:
```
ItemView()
    .onTapGesture(count: 2) {
        ...
    }
    .onTapGesture {
        ...
    }
```

|U03KAP7FKPB|:
Thanks. I'll give it a try. 

--- 
> ####  What is the recommended way to conditionalize code for view modifiers that are only available on newer versions of iOS? For example, if I have a View, and previously was using the regular `onTapGesture` modifier on iOS 15, but when running on iOS 16, I want to instead use the new version that provides `location`?


|U03HW7PE3SM|:
We recommend factoring out the common parts and then using `if #available` checks to use the relevant modifier. Something like this:
```
let common = commonViewParts
if #available(iOS 16.0, macOS 13.0, *) {
    return common.newModifier()
} else {
    return common.oldModifier()
}
```

|U03J2AD912N|:
Thanks. It would be great to have a cleaner way to do this in the future, especially as new modifiers get added in future versions of the operating systems (imagine an app targeting iOS 18, that had conditional branches for 18, 17, 16, and 15)

|U03HW7PE3SM|:
Please do file some feedback with this request!

|U03J2AD912N|:
Just filed FB10135113

|U03HW7PE3SM|:
thank you!

--- 
> ####  Hi, I asked this yesterday and was told to ask the SwiftUI team and include a log so here I am… I’m trying to update my watchOS app to support watchOS 9 however when trying to play a video using VideoPlayer the app crashes immediately and the console shows “Unable to find class NACVolumeController”. Is there any around this or should I file a feedback? 


|U03HL05BUJG|:
HI <@U03HZ3L98TF> that sounds like a potential issue in the Seed would you mind filling a feedback on it and posting the feedback number here so we can take a look for you! Thank you!

|U03HL05BUJG|:
Any additional details on how you’re calling the videoPlayer or even a small sample project if it repros will be super helpful!

|U03HZ3L98TF|:
Hi, 
Thank you I'm just making a small project and filing a feedback…. I should have something soon 

|U03HZ3L98TF|:
Error reproduced, filing feedback  

|U03HL05BUJG|:
Small additional request from the watch team if its not too much of a hassle is to get a sysdiagnose from a watch when it crashes. Instructions here:
<https://download.developer.apple.com/iOS/watchOS_Logs/sysdiagnose_Logging_Instructions.pdf>

|U03HZ3L98TF|:
Sorry for late reply busy multitasking, the link says I don't have permission to view it… I am logged in and have a paid developer membership. Not sure why 

|U03HL05BUJG|:
hmm <https://developer.apple.com/bug-reporting/profiles-and-logs/?platform=watchos>
its the sysdiagnose instructions from this page

|U03HZ3L98TF|:
Yep that appears to have worked 
Thank you right I'll get the log and finish the feedback 

--- 
> ####  When it comes to concurrency and SwiftUI, how are you managing creation/injections of your actor objects/business layer so that your views have access to them or do you have any specific recommendations based on the newer Swift concurrency model. I've been reviewing through some of the 2021 videos in conjunction with the new discussions this year and I tend to see `.shared` in the sample code, which would mean a singleton which I'd frankly rather avoid. We been injecting interactors through the @Environment or @Environment object but this has issues because using @StateObjects we don't necessarily have access to the @Environment object during init when we've been trying to binding subscriptions to our @Published vars. If we use .task {} would we have access to @Enviroment at the time the task closure is run? In this way we could probably set access to our common actors through the @Environment or @EnvironmentObject and then set up flows that just bind to @State via an async Sequence. Is there a way to know when @Environment is actual set for a view so we can respond to in within a @StateObject to set up subscription bindings either through publishers or async sequences?


|U03J7BQQNPJ|:
For pretty much any property wrapper in SwiftUI its value become available just before the body of the view is called. If you have ever implemented a custom `DynamicProperty` that is exactly when `update()` is called.

Yes, by the time the `.task` closure run your environment is available and you can capture its value.

I just want to remind you that you should not conform an actor to `ObservableObject` because the expectation is that all the `ObservableObject` instance are isolated to the main thread.

|U03HMCTSM2B|:
Yah, of course the ObservableObject would not be an actor. The actor is that business layer object that we need to call in to perform operations and that’s what I’m trying to figure out how the best way for a view to reach out to them would be. I don’t like making actors singletons as I’d rather have them injected or passed to the View so we can have a test version, etc.

|U03J21F2PQS|:
Thank you!

|U03HMCTSM2B|:
I’ve found that because there is some unknown amount of time between init() of a view or especially the init() of the @StateObject of view and when the environment is set that it’s hard to know when to run configuration code related to this injection.

|U03J7BQQNPJ|:
It’s only safe to access any of the property wrapper from within body

--- 
> ####  The `offerCodeRedemption(isPresented:onCompletion:)` modifier seems very specific and maybe should have been something exported from StoreKit.    Going forward will specialized UI like this always be added to core SwiftUI or will we start seeing other frameworks implement SwiftUI modifiers.


|U03HELTEP9T|:
`offerCodeRedemption(isPresented:onCompletion:)` is actually exported from StoreKit like you're asking.

We're curious to learn what gave you the impression that it was exported from SwiftUI directly (and if that's a bad thing)?

|U03HVEXFEK0|:
Interesting!  The documentation here: <https://developer.apple.com/documentation/swiftui/view/offercoderedemption(ispresented:oncompletion:)?changes=latest_minor>
makes it look like it is part of core SwiftUI.  I don't see anything that indicates it is part of StoreKit.

|U03HELTEP9T|:
Ya that is very subtle. Thanks for pointing that out

--- 
> ####  Is it possible with SwiftUIs new NavigationStack to hide the tabbar of a TabView when the destionation view appears. With the existing NavigationView it was possible but not so easy to handle the navigation title and buttons.


|U03HW7QCHK3|:
Take a look at the new toolbar visibility accepting modifier. This is new in SwiftUI and allows configuring the hiding or showing of different bars like the navigation bar, or the tab bar.

```
ContentView()
 .toolbar(.hidden, in: .tabBar)
```
See <https://developer.apple.com/documentation/swiftui/presentedwindowcontent/toolbar(_:in:)>

--- 
> ####  When using Charts to draw a line graph, is there a way to get the last point to be at the trailing edge of the chart view? I’m finding that it always has the trailing edge as a multiple of values used on the x axis. 


|U03HL00QL68|:
You can use the `.chartXAxis(content:)` modifier passing an `AxisContentBuilder` that either completely customizes the x-axis, or you could first try out this initializer of `AxisMarks`  passing `true` for those `roundLowerBound` and `roundUpperBound```
`/// Automatically determines the values for the markers,
/// approximating the target number of values.
public static func automatic(
    desiredCount: Int? = nil,
    roundLowerBound: Bool? = nil,
    roundUpperBound: Bool? = nil
) -&gt; Values
```

|U03K9095Y7K|:
Thank you. I'll have a look at using that. 

--- 
> ####  SwiftUI in UIKit: What is the recommended way of animating changes to SwiftUI view size when inside a UIHostingController? The problem I’m facing is that while the SwiftUI view itself will animate, and with the new sizing options the UIHostingController will do intrinsic content size invalidation automatically, the hosting view bounds change isn’t animated, it just jumps. This is a problem especially when other UIViews are constrained to the hosting view with Auto Layout. Is there any way to solve this other than manually tracking SwiftUI size changes and triggering a separate layout pass + animation of the hosting view superview?


|U03HELT4EG5|:
Could you please file a feedback for this?

|U03KDARQ0QY|:
Sure! Does that mean there's no solution to this at this time, or you just need an example?

|U03HELT4EG5|:
Both!

--- 
> ####  I wrote small testing NavigationStack ```struct ContentView: View {     var body: some View {         NavigationStack {             VStack {                 NavigationLink(value: 123) {                     Text("Click Me")                 }             }             .toolbar {                 ToolbarItem {                     Button {                      } label: {                         Text("Done")                     }                 }             }             .navigationTitle("Title")             .navigationDestination(for: Int.self) { value in                 DetailView()             }         } //        .toolbar(.hidden, in: .windowToolbar)     } }  struct DetailView: View {     var body: some View {         Text("Detail View")             .navigationTitle("Title")             .toolbar {                 ToolbarItem {                     Button {                                              } label: {                         Text("New Button")                     }                 }             }     } }```  But when I click on 'Click Me' button the back button automatically appear in the toolbar. How I can hide or customize this back button? PS: It's on macOS


|U03HL00QL68|:
It isn't possible to hide the back button, but a feedback asking for this could help us gauge additional interest for it :pray:

|U03HL00QL68|:
Especially whether you'd like to hide _or_ customize

|U03J21F2PQS|:
Thank you! I will post a feedback report.

|U03J21F2PQS|:
Can I somehow show an alert or make some operation when a user clicks the back button in the toolbar? Or now it isn’t possible too? For example to stop a task or to warning a user that there is some unsave changes and wait for user response.

--- 
> ####  I'm trying to have .onDelete for delete and .swipeActions for other actions. It is not working this way. Any idea? The thing is I try to have delete as part of .swipeActions. However, I can't find the way to set up the delete animation like the one .onDelete has.


|U03J7BQQNPJ|:
The moment you add `.swipeActions` it up to you to define the delete action (SwiftUI will stop synthesize that for you in the swipe action drawer).

You want to create a button with a destructive role to achieve the same result:

```
Button(role: .destructive) {
    delete()
} label: {
    Label("Delete", systemImage: "trash")
}
```

|U03JCHKCDB4|:
<@U03J7BQQNPJ> On the iPad, In a list when a swipe action is used which shows a confirmation dialogue, the popup is not shown on the correct cell. For Example cell 5 is swiped, confirmation dialogue points to a different cell cell. Feedback `FB10026540`

|U03J7BQQNPJ|:
<@U03JCHKCDB4> thank you for taking the time to file a feedback.

|U03JP7XR46Q|:
<@U03J7BQQNPJ>, thanks for the reply. I do have destructive button like you mentioned. However, it doesn't have the animation like the one onDelete has. Any idea how to set it up?

|U03JCHKCDB4|:
<@U03J7BQQNPJ> Regarding feedback `FB10026540` I have updated the project and added more details on my observation. Thanks a ton for the immediate response!!!

--- 
> ####  In SwiftUI when you had a List view with items that were continuously synced with a server and you displayed the details view of a selected item then the app jumps back to the main list. Are NavigationStacks solving this problem?


|U03HW7P0HQR|:
Hi, Arnfried. Thanks for the question!

|U03HW7P0HQR|:
Generally the popping back problem is because there is a state change that’s invalidating the view that contains the `NavigationView`. This causes SwiftUI to discard the `NavigationView` and create a new one, popping you back to the root.

|U03HW7P0HQR|:
Check out Demystify SwiftUI from #wwdc21
<https://developer.apple.com/wwdc21/10022> for more details on view invalidation and identity.

|U03HW7P0HQR|:
With `NavigationStack`, you can bind a path, so the popping back shouldn’t happen.

|U03HW7P0HQR|:
But you should still investigate why the identity is changing. That’s likely a source of performance problems, since lots of extra work will happen. In the new navigation API, that new work will be to replace the entire navigation hierarchy.

|U03J21F2PQS|:
Isn’t it better to stop syncing List with a server in time if you are in the detail view?

|U03HW7P0HQR|:
That’s really up to the specific app design. Many times that would be right, but some apps might want the root view to be always correct immediately when the user pops the stack. Or maybe the backend doesn’t vend the details separately.

|U03KA8R05HP|:
Hi Alexey, stopping the sync is in our case not possible. As Curt C mentioned, it can als be a state change that causes the back popping. It is really the NavigationLink as he said. I tried to set identifiers for the link itself or the destination view but the effect is still there. But I will test it with the new NavigationStack. Maybe this solves the problem.

|U03HW7P0HQR|:
Explicitly setting an identifier isn’t a solution if the structural identity of the view containing the NavigationStack is also changing.

|U03HW7P0HQR|:
Explicit identifiers can be used to force an identity change, but not to prevent one.

|U03HW7P0HQR|:
In practice the identity of a view is a combination of its structural and explicit identity.

--- 
> ####  We're using an attributed string with the `labelColor` on a `NSStatusItem `s button. However, when displaying this on an inactive display the color isn't dimmed as expected. Is there a way to have the text appear dim when on an inactive display using this approach?


|U03HEM646TX|:
Hey <@U03JKFBJG69>! Status items should automatically look great on secondary displays, with no extra work needed for apps to support this appearance. :sunglasses:

:thinking_face: However, if you’re not seeing that is the case for a status item that you’re using or creating, please provide this feedback through <http://feedbackassistant.apple.com|feedbackassistant.apple.com>.

A sample project and the version of macOS would be greatly helpful in reproducing this issue. Feel free to send me a link to that feedback you’ve filed, in this thread. :+1:

|U03JKFBJG69|:
Thank you :slightly_smiling_face:

|U03HEM646TX|:
Is there other content in the status item? For example, does the status item’s button have a (templated) image?

|U03JKFBJG69|:
Yes, the status item’s button has a image

|U03JKFBJG69|:
which is a template image

|U03HEM646TX|:
Ah ha. Thanks for that info! :slightly_smiling_face:

|U03JKFBJG69|:
<@U03HEM646TX> Filed as `FB10144807` I can reproduce this on macOS 12.4. You should be able to reproduce it via the following code snippet:

```
import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let useTemplateImage = true // set this to false and notice how the text appears for the status item on an inactive display
        
        statusItem.button?.imagePosition = .imageRight
        statusItem.button?.attributedTitle = NSAttributedString(string: "Hello World", attributes: [NSAttributedString.Key.foregroundColor : NSColor.labelColor])
        statusItem.button?.image = NSImage(named: useTemplateImage ? NSImage.quickLookTemplateName : NSImage.statusAvailableName)
    }
} 
```

--- 
> ####  Is there a way to recreate the appearance of the widgets on the Lock Screen using UIVisualEffectView in an app using either SwiftUI or UIKit? I'm specifically interested in recreating the appearance of the circular widget.


|U03HKVDCL7N|:
A variety of the gauge styles used in circular complications on the Lock Screen are available in app as well! You can access them using any of the SwiftUI gauge styles with an “accessory” prefix. Please be aware though that those styles are really only intended for Lock Screen / widgets and contexts in your app that should have a similar look and feel, so please be thoughtful about where you use them.

|U03HZ4EJJ05|:
<@U03HKVDCL7N> Thanks for your reply. I realise that my question was poorly phrased. I’m looking for a way to recreate the vibrancy that the Lock Screen widgets use. Would that be done using a UIVisualEffectView?

|U03HELWFGKF|:
with `UIVisualEffectView` you can try the `UIVibrancyEffect`s created with a `UIBlurEffectStyleSystem*Material`, but I’m not sure that will necessarily match what the lock screen is doing

--- 
> ####  The documentation for makeCoordinator states: "Creates the custom instance that you use to communicate changes from your view to other parts of your SwiftUI interface." could you explain what that means? It doesn't make sense to me because normally the coordinator is an NSObject that is the delegate to a UIView. I have seen some examples of Coordinator classes that take in an @Binding, that was passed in to the UIViewRepresentable and then into the Coordinator. Is that what this means?


|U03HB1A8VRU|:
The Coordinator you return can be any type, including an NSObject subclass. That coordinator will then be passed into `makeUIView` and you can assign it as the delegate of your view.

|U03HB1A8VRU|:
I explained this in my session "Use SwiftUI with AppKit", starting at around 12:38 into the video.

<https://developer.apple.com/videos/play/wwdc2022/10075/>

|U03J1V9TNLT|:
Thanks <@U03HB1A8VRU> I just watched it. I've never seen that technique of initing the coordinator with self and also setting self in updateNSView. Seems overly complex to me but I'll try it and see how it compares with just forwarding the @Binding.

|U03J1V9TNLT|:
I think it would be useful if the documentation for makeCoordinator was updated to say - instance that communicates changes back to the UIViewRepresentable struct.

|U03HB1A8VRU|:
Passing a binding works great as well, but doesn't scale as well if you have multiple pieces of state to pass through. You're welcome to do it either way!

--- 
> ####  There's no way of posting images on the question. But I ll add it once the question gets posted. Using SwiftUI, I m trying to use SwiftChart to add color underneath my line graph. I was wondering if there's a good resource on how I can do that?


|U03HL00QL68|:
Yes, let's see what you're trying to do!

|U03HL00QL68|:
Check out `AreaMark`!

|U03JDDPLMHD|:
The design is on the right for my Stair Climber app (join beta here <https://stairmasterclimber.com>) and what i got is on the left

|U03JDDPLMHD|:
On it right now

|U03HL00QL68|:
I forget the exact modifier to specify the color underneath the area mark, it may be `foregroundStyle`

|U03HL00QL68|:
passing a gradient in this case probably from orange to clear

|U03JDDPLMHD|:
:OOOOO YOU ARE A GENIUS

|U03HL00QL68|:
:bow:

|U03JDDPLMHD|:
And is there a way to add the border color?

|U03HL00QL68|:
Which border color are we talking?

|U03JDDPLMHD|:
Oops i mean the line color

|U03JDDPLMHD|:
On the top of the area

|U03HL00QL68|:
Ah this is one of my favorite parts of Charts

|U03JRP87THN|:
Swift Charts are amazing!

|U03HL00QL68|:
So you can have multiple marks in one chart

|U03JDDPLMHD|:
You see the line on top of the area? Would I basically just need to add a line chart on top? :open_mouth:

|U03HL00QL68|:
There may be a modifier specifically for the line color of an `AreaMark` so, I'll check with some Swift Charts engineers, but in the meantime, it's still instructive to add a `LineMark` plotting the same data after the `AreaMark`

|U03HL00QL68|:
The line mark will be superimposed on top of the area mark

|U03HL00QL68|:
So literally you have two charts on top of each other, but conceptually, it looks like a single styled chart

|U03HL00QL68|:
I hope you're adding HealthKit integration ;)

|U03JDDPLMHD|:
YES I AM

|U03JDDPLMHD|:
Health Kit &amp; Game Kit

|U03HL00QL68|:
Well if you've successfully gamified Stair Stepping, that sounds awesome

|U03JDDPLMHD|:
StairMasterClimber, because elevators are so old-school

|U03JDDPLMHD|:
We have 30 people so far, I would be honored

|U03JDDPLMHD|:
100 privacy safe and no ads

|U03JRP87THN|:
Sounds really interesting!

|U03HL05BUJG|:
:partying_face: alright HealthKit and Swift Charts :raised_hands::skin-tone-2: going to be awesome

|U03JDDPLMHD|:
You’re a genius sir. Almost there, just need to add the gradient!! <@U03HL00QL68>

|U03JDDPLMHD|:
One last question, how can I add the little circle dots for the data points? Do i need to create a new question for that? This is my code currently, Unbelievably short and easy

--- 
> ####  What's the recommended way of using a property wrapper such as `@FocusState` such that it will compile targeting iOS 14 for example? AFAIK you can't add an availability annotation


|U03H318N6T1|:
You are correct that you can’t apply availability to stored properties in Swift.

There are a few techniques you can use to work around this. Most commonly, you can factor out the portion of your UI that uses this property into it’s own `View`, and apply availability to that entire view. However, the best way to structure the code really depends on your specific use case, and we agree that this can be tricky to handle in some situations.

|U03H318N6T1|:
If you have a specific use case you’re okay with sharing, please file feedback. Real-world code examples are incredibly helpful when designing future improvements to the language and the framework.

|U03J4CGDGH2|:
Thanks for the reply, would be helpful if it was possible to directly init a FocusState

--- 
> ####  SWIFT-UI question:  How to identify the visibility (in index or id) inside a TableColumn View for paginate remote content.


|U03HW7NMP6D|:
Hi Ratnesh! Similar to techniques of paginating content in Lists, you can also use `onAppear` for TableColumn views in Table as well using the same technique. You’d want to compare the `id` of the column element to what you consider the “last” element’s id

|U03JRQ81NEL|:
Thanks for the reply :blush:. Is this same technique work for macOS target also?

|U03HW7NMP6D|:
Yes, it does. We even using that technique in Photos in macOS Ventura :slightly_smiling_face:

|U03JRQ81NEL|:
:star-struck: awesome 

--- 
> ####  By default UIHostingController configures a navigation bar. What is the best way to hide it?  Overriding viewWillAppear to call setNavigationBarHidden does not always give the expected result.  The best result I got was by overriding viewWillAppear and NOT calling super.viewWillAppear.  Is there any risk with this method?


|U03HW7QCHK3|:
I would not recommend overriding viewWillAppear and not calling super.

Generally, I’d recommend either using a `navigationBarHidden(false)` or the new `toolbar(.hidden)` modifier inside of your SwiftUI view. Or if you are managing a UINavigationController yourself, and you can’t use those modifiers, you should be able to set the `isNavigationBarHidden` property to false yourself and the hosting controller will try to respect that.

I’ll call out though the release note in the first beta of iOS 16:
&gt; SwiftUI might incorrectly modify the isNavigationBarHidden property on UINavigationControllers not created by SwitftUI.

|U03HVC03PC6|:
It seems that this does not only concern iOS16...

|U03HW7QCHK3|:
If you’re having trouble with this on older releases, I’d recommend trying to use `.navigationBarHidden()` for hiding the navigation bar.

If you are unable to do that, then you could try subclassing the UINavigationController to avoid hiding or showing the navigation bar if SwiftUI incorrectly tries to mutate that property.

|U03HVC03PC6|:
Thank you <@U03HW7QCHK3>
Subclassing UIHostingController is the solution for which I asked you advice.
To prevent SwiftUI to set isNavigationBarHidden to true, we have to override viewWillAppear (and better yet: don't call super.viewWillAppear)
Why do you say that it is not recommended?

--- 
> ####  Question about SwiftUI. We have background task that may generate errors and application shows alert when this error appears. If we use alert(…) modifier on parent view, it works. But when parent view displays some child view, parent view can’t show this alert and app shows warning in console “Attempt to present &lt;Alert on &lt;ParentView which is already presenting &lt;ChildView".  As workaround we can use identical alert(…) modifiers for parent and ALL child views (sheets, popovers, action sheets, etc.). But in this case we still have warning in console.  How can we display “global” alerts in SwiftUI without warnings in console? Or perhaps we can ignore these warnings?


|U03HELT4EG5|:
This looks like a bug, could you please file a feedback with the reproducing project so we can take a closer look?

|U03JYBU2FR7|:
Should i attach sample here?

|U03HELT4EG5|:
Please attach it to the feedback report you create.

|U03JYBU2FR7|:
Thanks for the answer! It doesn’t look like a bug, more like a limitation. We need to show alert in unknown period of time. We may show it from .sheet or from the parent view. In parent view it will not be displayed if sheet is already on the screen.

--- 
> ####  Is there a way to know when a drop has been cancelled with `.onDrag` and the `DropDelegate`? While dragging I want to change the opacity of the view for the duration of the drag. I tried providing a preview view and using `onDisappear` but it isn't called either. There is `dropExited` but the user can still be dragging.


|U03HB1A8VRU|:
There is no API for this, and as you noted, the drop session state in DropDelegate is different than the drag session state. We'd love to hear your use case for this, so could you file a feedback report asking for this functionality?

--- 
> ####  How would I go about making a Grid where all the cells are the same size based on the cell that needs the largest size to appropriately display its content?


|U03HELTEP9T|:
To do this today you would need to do something more custom like creating a custom Layout.

Though you might be able to to implement the custom Layout so that it calls into Grid itself, reusing its internal logic.

|U03HMDKEWJK|:
Hi, I’ve done something similar recently in iOS 15. For this I created a child size reader (you can search for that) and then keep track of the largest size. Lastly, simply apply the size to grid items using .frame.
Not sure if you’re already doing that and simply wanted a neater solution for iOS 16…

--- 
> ####  The auto-magical conversion from UiNavigationBars to NSToolbar in Catalyst is an awesome addition, but I’m not sure how it works with multiple columns. I have an app with UISplitViewController and 3 columns. All of the view controllers in each columns have their own buttons, and the one in the secondary view controller has a search bar. Which of these should appear in the Mac toolbar? Ideally they would all appear in their own “section” of the toolbar, like they do on iPad. But in testing, only the buttons from the secondary VC appear — no buttons from the other columns and no search bar. Is that expected? Is there a way to separate toolbar like we can using NSToolbar?


|U03HELWFGKF|:
The translation does bias towards supporting the secondary section (in the API its called `content`) primarily as thats is where we expect o have the most “room” in the toolbar.

|U03HELWFGKF|:
We do have some issues with properly supporting split views in the current beta, but it would be great to get feedback on what you are seeing and what you might expect

|U03HL04N5EY|:
I'd especially appreciate the feedback because I'm surprised that your search bar isn't migrating, and would like to see your example

|U03HVF46TEJ|:
Ah my appologies — I said “secondary” but meant “supplementary”. My supplementary column has a search field. All columns have buttons. When run on Mac, the buttons from my supplementary column appear in the toolbar (at the far right, no columns in the toolbar) but no other buttons or the search field appear.

|U03HELWFGKF|:
yea, I think we don’t translate search from anything other than the detail column currently. We may have bugs here as well, so please send your samples so we can make sure your translation is fantastic!

--- 
> ####  When we use UIHostingController, should we register it to responder chain? by presentation or adding as a child view controller. Otherwise what would be happening? for example just retaining UIHostingController and then just adding view to the parent view.


|U03HL05BUJG|:
I cover this in the “Use SwiftUI with UIKit” talk! Its right at the beginning.
You just need to add it as a child viewcontroller
```
// Add the hosting controller as a child view controller
viewController.addChild(hostingController)
viewController.view.addSubview(hostingController.view)
hostingController.didMove(toParent: viewController)
```
<https://developer.apple.com/wwdc22/10072>

|U03HL05BUJG|:
At the end I cover some of the limitations of UIHostingController and speak to why its necessary to embed in as a childViewController

|U03J22CB2PL|:
oh I missed that video! I would check it. Thanks!

I wonder if I could create a UIView that supports rendering SwiftUI view like UIHostingConfiguration for supporting older iOS version.

<https://github.com/muukii/CompositionKit/pull/7|https://github.com/muukii/CompositionKit/pull/7>

|U03KDARQ0QY|:
Awesome talk <@U03HL05BUJG>! What would your recommended approach be for small leaf node SwiftUI views in UIKit, which would not usually be full VCs? Even given the pitfalls of separating the hosting view, we find that we need to do this in ui libraries where clients expect UIViews, not view controllers. Thanks! (FB10019256)

--- 
> ####  Is there a way in the SwiftUI document model to access updateChangeCount directly, in order to decouple document saving from the undo stack? (Certain operations don't make sense to undo, but do change the document's file state.) (FB9974481)


|U03HW7P2WTB|:
Hi Ron! For now, there is no API available in SwiftUI for `updateChangeCount`. But also I want to thank you for filing the feedback, it is important to know which functionality is anticipated.

--- 
> ####  How do i get points on my lineMark in swift charts? (See Image for comparison)


|U03JDDPLMHD|:
Left is current, right is design

|U03JDDPLMHD|:
MAKING PROGRESS, thank you for your help!!! how can I add the little circle dots for the data points? This is my code currently, Unbelievably short and easy (edited)

|U03HL05BUJG|:
You can either add a `PointMark` on top of the `LineMark` or by adding a symbol to the linemark
```
LineMark(x: .value("xvalue", point.x),
         y: .value("yvalue", point.y))
    .symbol(Circle())
```

|U03HL05BUJG|:
My “Use SwiftUI in UIKit” sample project actually has an example of this <https://developer.apple.com/documentation/uikit/views_and_controls/using_swiftui_with_uikit>
as does I believe some of the Swift Charts talks sample code too!

|U03JDDPLMHD|:
<@U03HL05BUJG> what if i want to add the numerical values (eg: 15) above that PointMark?

|U03JDDPLMHD|:
TextMark?

|U03HL05BUJG|:
as an annotation?

|U03JDDPLMHD|:
Yes

|U03HL05BUJG|:
Let me find the docs for that…

|U03HL05BUJG|:
It should be an annotation modifer on the mark!
```
 .annotation(position: .top, alignment: .leading) 
```

|U03HL05BUJG|:
<https://developer.apple.com/documentation/charts/visualizing_your_app_s_data>
the swift charts example project has an example of this!

|U03JDDPLMHD|:
You are the best! Got it! Anywhere I can follow you on social media?

|U03HL05BUJG|:
Ahh sorry I don’t have any social media!

--- 
> ####  Is it possible in SwiftUI on Mac to use a modifier with a mouse click like ⌘-leftClick? I like to select non-adjacent items like in Photos and Finder.


|U03HW7NMP6D|:
Gestures have  `.modifiers(_:)` modifier, which allows restricting that gesture to only respond when the modifier is active. So in this case you could use a Tap gesture with `.modifiers(.command)`

--- 
> ####  For complex views, I often define subviews inside computed vars to keep my `body` block more readable.  Especially for components that don't need to be reused elsewhere in the app, so they don't seem to warrant a reusable struct. Example:  struct MyView: View {     var body: some View {         someText         someButton     }     private var someText: some View {         Text("Hello")     }     private var someButton: some View {         Button("Press") {}     } }  I've heard that this can be bad for performance - is that true? And does using @ViewBuilder on some computed vars have any impact?


|U03HKVDCL7N|:
SwiftUI’s traversal of your view tree isn’t impacted at all by whether you chose to use new structs, or computed properties, for small pieces of views, etc. So this is totally reasonable. Using `@ViewBuilder` here also shouldn’t have a performance impact. I would highly recommend doing so!

The only thing that you should pay attention to is your mechanisms for invalidating your views will be a bit less fine-grained, as you’re making a larger part of your view hierarchy dependent on the sources of truth specified by `MyView` . Make sure you’re paying attention to what pieces of your view depend on which pieces of data, and when you see computed properties that have completely disparate dependencies from the rest of the view, you consider breaking those out.

--- 
> ####  Are the new navigation bar styles (<https://developer.apple.com/documentation/uikit/uinavigationitem/3987969-style)|https://developer.apple.com/documentation/uikit/uinavigationitem/3987969-style)> supported on SwiftUI? 


|U03HW7QCHK3|:
Howdy! You can find the answer to this in this slack thread: <https://wwdc22.slack.com/archives/C03H9K1JYJY/p1654786985779439>

--- 
> ####  Hi all, thanks for all the great work this year.   What approaches would you recommend to start integrating SwiftUI into existing codebases that support iOS 14/15?


|U03HB1A8VRU|:
I'd suggest trying to adopt it in a view controller first, and replace the existing view controller with a UIHostingController and try to recreate the existing layout.

A great place to start is a settings view, where you can use Form to put a list of fields, switches, sliders, and more.

--- 
> ####  In continuation of my question about NavigationStack <https://wwdc22.slack.com/archives/C03H9K1JYJY/p1654791464924449|https://wwdc22.slack.com/archives/C03H9K1JYJY/p1654791464924449>  Can I somehow show an alert or make some operation when a user clicks the back button in the toolbar? Or now it isn’t possible too? For example, stop a task or warn a user that there are some not saved changes and wait for the user’s response.


--- 
> ####  Is there a way to specify the tabbing order of text fields, akin to textView.nextKeyView (FB10020959). My app has a combination of SwiftUI TextField Views and NS/UITextView wrapping in NS/UIViewRepresentable, and I've seen some odd cases where the default tabbing order is quite unintuitive.


|U03HW7NMP6D|:
By default the key view loop follows the same default order as AppKit — leading to trailing, then top to bottom — do please file a feedback if you find a situation where that’s not the case.

There is support for customizing that order by describing the sections that separate your UI using `focusSection()` (<https://developer.apple.com/documentation/swiftui/view/focussection()?changes=_4>)

|U03HZ42MBV3|:
focusSection would have been perfect, but my bug is occurring on the iOS app.

|U03HZ42MBV3|:
It does seem to be following leading to trailing, top to bottom in terms of the entire screen, however, the View with logically grouped TextField’s can happen to be in a column next to unrelated NSTextViews far away, but along the same leading to trailing line horizontally.

|U03HW7NMP6D|:
Ah, thanks for clarifying, and I see in the feedback that you provided a test flight — thank you! We’ll check that out and follow up if we have any more questions on that

--- 
> ####  Is it possible to have a self-sizing list in SwiftUI similar to how LazyVStack works? List has support for drag and drop through `onMove` while LazyVStack does not.


|U03HB1A8VRU|:
List doesn't size itself based on the height of the content like LazyVStack. You'll need to give it a fixed height using the `.frame(height: ...)` modifier. List has support for reordering, swipe actions, and other features that LazyVStack does not.

We'd love to hear about your use case in a feedback report. Specifically let us know what kind of experience you're trying to achieve, but can't.

--- 
> ####  I have a couple of apps written in SwiftUI in the past two years that are broken now because they rely on lists and the background color can’t be changed anymore using the UITableView.appearance() API.  How can we change the default background color for List in SwiftUI?


|U03HW7PE3SM|:
Please see our earlier post in the channel here: <https://wwdc22.slack.com/archives/C03H9K1JYJY/p1654793028152169>

|U03KDBPBXAL|:
Awesome! Thanks for your reply and sorry for not paying attention :D I really hope I won't have to throw away my years worth of code for such a small detail :P

|U03HW7PE3SM|:
No worries :slightly_smiling_face:

--- 
> ####  Is there SwiftUI equivalent of new UINavigationItem.backAction?


|U03HW7QCHK3|:
There is no equivalent in SwiftUI, but a feedback would be appreciated!

--- 
> ####  How can I adjust the width or thickness of a linemark in swift charts? 


|U03HL05BUJG|:
you can use a LineStyle! <https://developer.apple.com/documentation/charts/chartcontent/linestyle(_:)>
`.lineStyle(StrokeStyle(lineWidth: 3))`

--- 
> ####  We have an app that has a 50+ components built using UIKit. We are trying to use SwiftUI by reusing our existing components but we are facing multiple challenges. 1. It seems that UIViewRepresentable doesn't work out of the box with views that are built using auto-layout. We have a generic container (IntrinsicContentHeight&lt;View) that tries to calculate the size of the UIKit view and return it to the intrinsicContentSize. Is there a better solution?  2. We noticed performance issues using UIViewRepresentable views in SwiftUI Lists. It seems that Lists always re-create the UIViewRepresentable views and never recycle cells. Are we doing anything wrong?  3. Our design system slightly modifies the line-height of our texts. We have a solution using NSAttributedString that works well for UIKit but haven't found a solution for SwiftUI. Text supports line spacing but it can only increase the default line spacing, it cannot decrease it (passing negative values does nothing). Is there anything we can do to customize the line height of a Text in SwiftUI?


|U03HELT4EG5|:
I only have an answer for the first question. We have new API that allows you to more finely control how your `UIViewRepresentable` interacts with the SwiftUI layout system. Please see: <https://developer.apple.com/documentation/swiftui/uiviewrepresentable/sizethatfits(_:uiview:context:)-9ojeu>

|U03JRJWPYKB|:
Thank you, Raj! I will check if we can build a solution for iOS 16 with sizeThatFits and our other container for older versions.

|U03HW7PE3SM|:
For your last question, can you please file a feedback with your request? In particular, it would be good to know what kind of customization you need for line spacing/line height? It it going to be a fixed value, or certain percentage, or a delta applied, or a value relative to Dynamic Type sizes? Thanks!

|U03JRJWPYKB|:
Value relative to the dynamic type size sounds like the thing that will work for me. I will make sure to file feedback to give more details. Thank you for answering, Paul!

--- 
> ####  Is there any thought to making UITextInteraction spell-checking API public? UITextInteraction respects the spellCheckingType property of UITextInputTraits. If the value is UITextSpellCheckingTypeDefault or UISpellCheckingTypeYes, spell checking occurs as expected. Unfortunately, UITextInteraction uses the private UITextReplacement class to handle spell checking. When it encounters a misspelled word, it correctly presents a menu with the spelling options. However, when you tap the correction, it attempts to call the private `replace:` method with a sender of private class UITextReplacement. The replacementText property of the sender contains the misspelling. The code works fine, but using this private method and property earns you a rejection from app review, so it isn’t possible to use the spell-checking features of UITextInteraction.


|U03HELXCTGV|:
This seems like an oversight on our part. Have you filed a feedback request for this?

|U03K11CE03T|:
FB10136384

|U03HELXCTGV|:
Thanks. I think the expectation is that `replaceRange:withText:` should be invoked instead of the private `replace:` method. In the meantime, you should try implementing `shouldChangeTextInRange:replacementText:` and see if that gets called before/after the call to `replace` . That would be a way to get the replacement text without using private API.

--- 
> ####  Did anything change in UITextInteraction with respect to dictation? On iOS 16, dictation in a custom view that supports UITextInteraction always fails. The same (shipping) code works on iOS 15.


|U03HELXCTGV|:
Changes were made to dictation to support the new "modeless" dictation feature. If this has broken a custom text view implementation, it was unintentional and a feedback request would be appreciated.

|U03K11CE03T|:
Will do. I notice that dictation seems to be failing in Pages too, but not Notes old this (old) iPad.

--- 
> ####  Is there a way to use app-specific UIActivities with SwiftUI’s new ShareLink?


|U03HELXCTGV|:
This might be a better question for the <#C03HX19UNCQ|>.

--- 
> ####  The new find stuff is great — it took 30 seconds to integrate with my UITextView. On Catalyst, the find panel seems to have some issues, namely that clicking on the buttons doesn’t work — the search field is focused and I can type it in, but clicking doesn’t do anything. Is that a known issue with beta 1 or is there something I should investigate on my end?


|U03HELXCTGV|:
This is a known issue (but feedback requests still appreciated). A workaround currently is to call `layoutSubviews` on the UITextView after the find panel appears.

--- 
> ####  A bit late to the party, due to a lab appointment, so still working my way through the video. Can you advise: is there an API to enable me to add custom data detectors in text editing in my app? For instance, I'd like to be able to have a data detector that adds text decoration or other features to any time someone inserts the name of a person in their text, from a list of names of people already in the app (say, several thousand people). Is there an API/mechanism for this?


|U03H31CT6S3|:
Unfortunately, that is not something that is supported today. Please file a feedback request for us to look at in the future :slightly_smiling_face:

|U03HELXN8CV|:
Obviously not as nice as a dedicated API , but you could do it very manually, by watching the delegate methods of `UITextView` for text changes, and then maybe overlaying things or editing the text to add links.

--- 
> ####  Honestly, it’s been a while since I last checked this, but is there an API in UIKit these days that I can query to check whether an external hardware keyboard is present?


|U03HELXCTGV|:
There is no API for this, it's not really something we think developers should have to account for, generally. Do you have a specific use case in mind?

|U03HELXCTGV|:
(We usually encourage developers to use the keyboard layout guide for laying out UI instead).

|U03JDNMQDKN|:
I once worked on a hex editor for iPad as a side project. I wanted to show a custom inputView with a hex keypad when no hardware keyboard is attached, but wanted to use the default keyboard when there is a hardware keyboard present so that there is no on-screen keyboard shown.

|U03JDNMQDKN|:
I think I filed a feedback about this after a WWDC20 lab session, let me find the ID

|U03JDNMQDKN|:
FB7777442

|U03JDNMQDKN|:
This year’s enhancements kinda make me want to continue working on it, but since there are no guarantees in iOS/iPadOS when an app is (not) terminated in the background, I still don’t feel too confident about it

|U03K11CE03T|:
It would be helpful to know if a hardware keyboard is attached because you can optimize what functions are offered in the assistant. In screenwriting, for example, the tab key is important enough to add to the bar if you don't have a keyboard attached.

|U03HELXCTGV|:
Oh gosh, that was me you talked to! Well, thanks for the reminder, I will try my best.

|U03JDNMQDKN|:
Oh yes, I totally missed that sentence :smile:

|U03KDARQ0QY|:
One case we're hitting where we would love to check for HW keyboard - in our custom text editing view we offer intelligent word completion. When HW keyboard is connected we'd like the prompt to reference the "tab" key. When it's not connected, we'd like to instead tell the user to swipe right.

|U03HELXCTGV|:
Your hex editor needs to run in the background indefinitely? Why?

|U03JDNMQDKN|:
Let’s say you are moving around large chunks of data stored on a slow USB drive. If the OS decides to kill the app while the app is still busy writing data, data corruption occurs, I guess? Maybe this is not an issue with journaled file systems, but what about plain old FAT32?

--- 
> ####  The UIFindInteraction doesn't seem to fire off a new query on my session when the user removes all text from the search box. Is this intended? Is there another way of listening for this so we can clear our custom text highlights?


|U03HELXCTGV|:
You should get a call to `invalidateFoundResults` instead.

|U03KDARQ0QY|:
Thank you for answering the last minute Q! I totally thought `invalidateFoundResults` was only there to be called by us, not the system.

|U03HELXCTGV|:
Ah, indeed, the documentation is wrong. Thanks for pointing that out!

--- 
> ####  Hi, In my CarPlay app, In `templateApplicationScene(_:didConnect:)` I get the provided `interfaceController` and store a reference to it, but most of the times when I try to access `interfaceController.carTraitCollection` The app crashes because `carTraitCollection` is `Uninitialized`, so it makes creating image for different display scale (2x, 3x) or different display styles (dark, light) impossible. I tried to make sure that I always access it from main thread but still have the same problem.  This code always crashes for me: ``` // CarPlay connected     func templateApplicationScene(         _ templateApplicationScene: CPTemplateApplicationScene,         didConnect interfaceController: CPInterfaceController     ) {         self.interfaceController = interfaceController;         self.interfaceController?.delegate = self;           print(interfaceController.carTraitCollection) } ```


|U03HJA80GLS|:
Thanks for the report! We’re aware of the issue and we’re tracking it. Your app shouldn’t be crashing, though - in a Swift app, you’ll want to handle this variable potentially being nil, perhaps by assuming a default screen scale (2x) if the trait collection isn’t yet available.

|U03JBFATXM2|:
Thanks for the answer. I do that in my real app, I assume 2x for images and dark for the style, but is there any specific point in the life cycle that it will be initialized for sure?

|U03HJA80GLS|:
It should be non-nil if your app has been launched on the CarPlay screen, but it’ll likely be nil if your app has not been launched in CarPlay. Please also give this a try in iOS 16 seed 1; this should be improved!

|U03JBFATXM2|:
how can I know that app is launch in the CarPlay?

|U03HJA80GLS|:
The `CPInterfaceControllerDelegate` callbacks will inform your app when it has been launched in CarPlay (and disconnected from CarPlay)

|U03HJA80GLS|:
The same one you have above :slightly_smiling_face:

|U03JBFATXM2|:
Thanks, and the value will remain non-nil after the first appearance on the app on CarPlay screen?

|U03HJA80GLS|:
Sorry, do you mean the trait collection, the scene, something else? The trait collection should not be nil, but this is an issue we are tracking :slightly_smiling_face:

|U03HWUTHA1X|:
The value will get updated at some point after the sceneDidConnect callback, but unfortunately we don't have a delegate callback to inform your app when this happens. As Jonathan said, we are aware of this issue, but please feel free to file a feedback on this!

|U03JBFATXM2|:
&gt; yes, I mean the interfaceController.carTraitCollection


|U03JBFATXM2|:
We already have filed a feedback in December 2020: It is  FB8926706

|U03JBFATXM2|:
&gt; Thanks <@U03HVCNN2DU> , do you mean that `interfaceController.carTraitCollection` can also be nil when I get the CPInterfaceControllerDelegate
&gt;  call back as Jonathan said?

|U03HJA80GLS|:
Yes, that is the issue we’re describing here :slightly_smiling_face:

|U03HWUTHA1X|:
Yes, the bug is that sometimes the trait collection is not initialized at the time of the scene-connect delegate callback, but it will eventually get initialized

|U03JBFATXM2|:
Thank you Kevin and Jonathan.

|U03JBFATXM2|:
another related question that I noticed, looking at another thread, <@U03HJA80GLS> When using UIImageAsset, the pickup of the correct asset also depends on the interfaceController.carTraitCollection which is nil at some point, so if we use an image asset to create the template when the carTraitCollection is nil we will get the wrong asset, or no asset at all.
Is there any workaround for this?

--- 
> ####  Hi, I've a question about the Car Play simulator . I added arm64 in the excluded architecture to run in the iPhone simulator for my M1 mac.  Now I get this error in  carplay simulator “Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Unsupported object &lt;CPTabBarTemplate: …. “ , I think it crashes because of arm64 in the excluded architecture. Can you please help ?


|U03HJA80GLS|:
Hi! This is most likely caused by a library or third-party dependency in your app that does not have an arm64 slice. We’d recommend you work with your vendor(s) as needed to get an updated version of all of your dependencies. Here’s a similar thread with some more detail: <https://developer.apple.com/forums/thread/698332>

|U03HJA80GLS|:
You might also try running your app on-device with the new CarPlay Simulator app on your Mac, available under the Additional Tools downloads on the developer site.

|U03J8ND0AH2|:
Thank you so much. I downloaded that tool and planning to use the CarPlay simulator.

--- 
> ####  When your CarPlay app is running but your screen on your device is locked, is your app considered "in the foreground?"  For example, can I run something like a Timer if I'm just within the CarPlay UI?


|U03HWUTHA1X|:
When an app is launched in CarPlay and visible on the CarPlay display, the corresponding UIScene (specifically a `CPTemplateApplicationScene`) is foregrounded. As with UIScene in general, your app's overall application state is the highest activation state of all of its connected scenes.

|U03HQMRPRTR|:
Thanks!

--- 
> ####  Do push notifications (non-time sensitive) work like normal when in the CarPlay UI? As in, can I process them and do everything I would expect to do just like when my app is open on my device?


|U03J83E86Q0|:
Yes, user notifications work in CarPlay but the app must be allowed in CarPlay. When requesting notifications authorization, include the `allowInCarPlay` option:
<https://developer.apple.com/documentation/usernotifications/unnotificationcategoryoptions/1649281-allowincarplay>

And then make sure to post the notification with that category. Separate out notifications intended for CarPlay into their own category to avoid other notifications your app might post that aren’t relevant while driving from appearing in CarPlay.

|U03J83E86Q0|:
For more information see this video starting around 14:20: <https://developer.apple.com/videos/play/wwdc2017/719>

|U03HQMRPRTR|:
Thanks!

|U03J83E86Q0|:
However, notifications are limited to certain app categories and for those categories (such as VoIP and Messaging apps) the notification is handled using a Siri intent.

|U03HQMRPRTR|:
<@U03J83E86Q0> So for example, in a quick food ordering app, can we get notifications say for the status of your order just like we currently do on device? I might have missed anything in the docs about which entitlements could receive notifications

|U03J83E86Q0|:
Quick food ordering does *not* support notifications

|U03HQMRPRTR|:
In no way at all? So, what would be standard on a device to receive a notification when there is an update to the status of your order so that I can update the UI in my app…that is not supported? If not, what mechanisms are available for the CarPlay app to get say an updated status?

|U03J83E86Q0|:
App icon badges will appear in CarPlay, that’s one way to communicate that your app has new information.

|U03HJ9M2WKV|:
Definitely file feedback too if you think it could be useful for your app!

|U03HQMRPRTR|:
Will do. Although this may be an entire project killer at this point.

--- 
> ####  Does the new CarPlay Simulator app only function with devices running iOS 16? – I couldn't get it to actually display CarPlay visuals from my plugged-in iOS 15.5 iPhone (No error messages; just …nothing happening)


|U03HBMBDJ7Q|:
CarPlay Simulator is supported for iPhones with iOS 15.2 and above.
Can you share more information about what model Mac you are using to run CarPlay Simulator?

|U03JEEUJPMJ|:
Ah. I’m on:
• MacBook Air (M1, 2020)
• macOS 12.4 (21F79)

|U03JEEUJPMJ|:
For reference: this is what I see when I launch the app, with my unlocked iPhone (15.5) connected. Buttons are responsive to clicks, but …nothing I wildly click causes CarPlay visuals to appear. [Here’s hoping I’m not being really silly here! :crossed_fingers::skin-tone-3:]

|U03JCQQ5CRJ|:
Same issue for me. iPhone 12 mini on iOS 15.4.1; Macbook Pro 13" i5 2020 (MacBookPro16,2) on macOS 12.4

|U03HBMBDJ7Q|:
Can you try the steps in the CarPlay Simulator Help "Troubleshooting CarPlay Simulator"? In particular note if your iPhone has Personal Hotspot enabled.

|U03HBMBDJ7Q|:
We are also tracking one known issue that we expect to have a fix for relatively soon.

|U03JCQQ5CRJ|:
None of the steps in the Troubleshooting guide worked for me, including adding CarPlay Simulator to the Firewall settings

|U03HBMBDJ7Q|:
I'm sorry the steps didn't resolve the issue. This sounds like something we need some more information on. Could you please submit feedback for this issue with both macOS and iOS sysdiagnose?

|U03HLM4KG7N|:
It's also worth trying the latest beta of iOS 15 - 15.6 beta 2, it includes a fix to an issue that can lead to this problem.

|U03JEEUJPMJ|:
(FYI: CarPlay Simulator just kicked into life for me once I’d turned off Personal Hotspot :+1::skin-tone-3:)

--- 
> ####  I've been snapshotting a SwiftUI View (`UIHostingController` = `UIImage`) to create Point of Interest images. This works in the iOS Simulator (with CarPlay external display), but I've found on a real car head-unit that: - when my app is launched from CarPlay (and hasn't been launched on the device), - or the device is locked, I just get an empty image rendered when run via CarPlay.  This seems to be related to the 'on-device app' being inactive, despite the CarPlay app being active. I'm hitting walls in my knowledge of iOS app activation states–– is there there some way (API) you can think of that I could call in my CarPlay side of things, to 'wake up' (:man-shrugging::skin-tone-3:) the 'on-device app'?


|U03HBMBDJNS|:
Double check your scene delegates and that you are doing your drawing work on the carplay scene/display

|U03HBMBDJNS|:
otherwise please file a feedback with a small sample app replicating the issue you are seeing

|U03JEEUJPMJ|:
<@U03HBMBDJNS> When you say ‘doing your drawing work on the carplay scene/display’, I’m not quite sure what you mean? I’m currently calling the `CPPointOfInterestTemplate` ’s `setPointsOfInterest` method, and the drawing code, inside a `DispatchQueue.main.async` call (because that was the first thing I tried when having UI-related issues), if that’s of any relevance? (This code path runs in response to the delegate’s `didChangeMapRegion` and also `CLLocationManager`’s `didUpdateLocations`)

(Re: work in the right place -&gt; do you know if there’s a specific queue/etc I should be calling drawing code via, when in CarPlay, for it to function?)

|U03HWUTHA1X|:
This is probably a question better answered by the SwiftUI team, but filing a feedback with a sample app would be helpful for us to understand if this use case is expected to work.

|U03JEEUJPMJ|:
Noted, thanks :relaxed:

|U03HWUTHA1X|:
And, to answer your question about 'waking up' the app on the phone, there is no means of doing this. Apps are only launched (given scenes) by the system (generally this is because the user launched the app in that environment)

--- 
> ####  For a generic notification that shows up when your app is not in the foreground...are those just time-sensitive notifications or are those restricted to only certain types of entitlements?


|U03HBMB6TPG|:
Hi!
We only allow notifications for certain categories such as navigation apps, parking apps, and EV charging apps. Notifications are also allowed, but further restricted for some categories, (such as VoIP and Messaging apps) where the notification is handled using a Siri intent.

|U03HBMB6TPG|:
When requesting notifications authorization for user notifications, include the `allowInCarPlay` option:
<https://developer.apple.com/documentation/usernotifications/unnotificationcategoryoptions/1649281-allowincarplay>
And make sure to post the notification with that category. Separate out notifications intended for CarPlay into their own category to avoid other notifications your app might post that aren’t relevant while driving from appearing in CarPlay.

--- 
> ####  Is there any way to have two different icons for each tab? one for when the tab is selected and one for when the tab is not selected? I have tried to change the tab icon when the template appears/disappears, but it does not work.


|U03HJA80GLS|:
You should get a `CPTabBarTemplateDelegate` callback when the active tab changes, but any changes to the tab image will only be picked up when the tab bar template is created OR reloaded with a new set of tabs, via `updateTemplates:`. This would be a great feedback to file!

|U03JBFATXM2|:
Thank, I will file a feedback

--- 
> ####  Can a CarPlay app run in the background, for location updates, and trigger a local notification? (i.e. location services background mode)  (Or do CarPlay apps not have access to the same functionality when 'closed'?)  Use case = an EV charging app, which launches Maps to navigate to a charging station, but monitors location updates in the background, and – when the user is a few miles from the charging station location – checks the station's availability again; to notify the user if the station is no longer available.


|U03J83E86Q0|:
Background app activity policies are the same in CarPlay. If your app already supports a background location service such as an arrival geofence for that charger the app will continue to support that behavior when launched or backgrounded in CarPlay as well.

|U03JEEUJPMJ|:
Yay! :partying_face:

--- 
> ####  Do I have any access to car information through carplay?


|U03HLM4KG7N|:
Can you please clarify the use case you are trying to address here?

|U03JPBUSHLZ|:
I was hoping for mileage information, for trip durations, and just noting this mileage is being recorded as a business trip or a personal trip.

|U03HLM4KG7N|:
Unfortunately that information isn't passed over, no.

--- 
> ####  What is the expected image size for the section header button (introduced in iOS 15)?


|U03HBMB6TPG|:
Hello!
`CPMaximumListSectionImageSize` will give you the maximum size of the section header image.

In the `CPListSection` header, note the following on the initializer that includes the `headerImage` :
&gt; *@note* The maximum size of the section header image is given by `CPMaximumListSectionImageSize`.


|U03HBMB6TPG|:
Using the value you retrieve from `CPMaximumListSectionImageSize` will always be correct for the version of iOS on your user’s device

|U03JBFATXM2|:
&gt; `CPMaximumListSectionImageSize`
&gt; returns something like 20*20 but the image looks larger than that. when I provide a system images, the size looks good on simulator and different head units, but when I provide my image (and I size the image based on `CPMaximumListSectionImageSize` ) the image appears with different sizes on different head units, some times it is larger that it should be, some times very smaller.
)

|U03JBFATXM2|:
and my other question is that what should happens if I provides an image with wrong size? Will CarPlay resize that image to fit?

|U03JBFATXM2|:
What if I provide a pdf or svg image?

|U03JBFATXM2|:
<@U03HBMB6TPG> would you please take a look at these questions?

|U03HBMB6TPG|:
Your image will be resized to the maximum size if it's too large, but it won't be scaled up if its too small.
It's worth mentioning that you should size images to the car’s display scale, using `carTraitCollection`

|U03JBFATXM2|:
Thanks <@U03HBMB6TPG> any idea how something like this can happen?

|U03HBMB6TPG|:
Thank you for the note <@U03JBFATXM2>!
We’re aware of the issue and are tracking it

|U03JBFATXM2|:
Is there any workaround for this at the moment <@U03HBMB6TPG>?

|U03HJA80GLS|:
In the meantime, if your app can resize the image to `CPMaximumListSectionImageSize` first, it should result in the right size on the car screen

|U03JBFATXM2|:
&gt; Sorry may be my question was not clear enough, I was asking about the section header button from the beginning, not the section header image. Is CPMaximumListSectionImageSize also applies to the header button? <@U03HBMB6TPG>?


|U03HJA80GLS|:
You’re right! That button also needs to be resized. CPMaximumListSectionImageSize should be a good starting point there too. We’ll definitely look into this

|U03HBMB6TPG|:
for the CPButton, `CPButtonMaximumImageSize` is provided

|U03JBFATXM2|:
Thank you for the answers <@U03HBMB6TPG>. Is there any estimate for when this will be fixed, will it be fixed for iOS 16 release?

|U03HBMB6TPG|:
No problem <@U03JBFATXM2>, thank you for developing with us!
We’re investigating the issue, but can't share a timeframe at this time

--- 
> ####  In iOS Simulator, with the additional CarPlay external display options enabled via `defaults`, there's `Load` and `Save` functionality for simulation config (screen dimensions, scale, etc)  Are there any `defaults` that can be set to enable load/save functionality in the new CarPlay Simulator app? (Use case: swapping between different 'cars' for testing)


|U03HBMBDJ7Q|:
Unfortunately this isn't a currently supported feature, but please file a feedback request for this!

|U03JEEUJPMJ|:
Noted :+1::skin-tone-3:

`FB10165659 (Support loading+saving of CarPlay Simulator configuration)`

--- 
> ####  When it comes to color of icons and images, it seems as those need to already be the color you want them to be for displaying.  It doesn't seem that I can tint them when displaying them in the CarPlay UI. Is that correct or am I doing something wrong?


|U03HJA80GLS|:
Hi! It will depend on the specific UI element you’re looking at. Some elements, like nav bar leading and trailing buttons, are tinted by the system, while images in your list items and grid templates should support any custom colors you provide

|U03HJA80GLS|:
Maybe you can share which elements you’re looking at? Thanks!

|U03HQMRPRTR|:
ok. I’m specifically thinking of like icons in the list and grid template. I’ve tried the way we do it in the iPhone app with tinting, and that just hasn’t seemed to work so far. I most recently tried `withTintColor` for example. I was trying to avoid running them through something like UIGraphicsImageContext

|U03HJA80GLS|:
Maybe another thing to try is to use `UIImageAsset` wherever possible, which should let you provide a day/night variant of each image (for day/night mode in CarPlay)

|U03HJA80GLS|:
If things aren’t looking right though, please file a feedback issue and we will look into it :slightly_smiling_face:

|U03HQMRPRTR|:
thanks!

|U03JBFATXM2|:
<@U03HJA80GLS> When using UIImageAsset, the pickup of the correct asset also depends on the interfaceController.carTraitCollection which is nil at some point, so if we use an image asset to create the template when the carTraitCollection is nil we will get the wrong asset.

|U03JBFATXM2|:
Is there any workaround for this?

|U03HJA80GLS|:
Thanks! That’s worth a separate feedback for sure. I don’t think we have any workaround to share right now, but it’s under investigation.

--- 
> ####  For testing CarPlay with iOS Simulator, it appears that the CarPlay window shown with iOS Simulator is not responding to external inputs on Apple silicon. Is that a known issue?


|U03HJ9M2WKV|:
Hi there — we're aware of an issue with inputs on the Xcode Simulator and are looking into it.

|U03HZ462JCV|:
Cool thanks ^^

|U03HZ462JCV|:
Just want to make sure I didn’t do something dumb :sweat_smile:

--- 
> ####  Any chance for an answer previous question regarding the ability to share text from one CarPlay app to another?


|U03HJA80GLS|:
Hi! Maybe you can share more about your particular use case?

In general, lots of third party services offer libraries/frameworks for these kinds of text operations, which could be an option for you.

Another possibility is if you’re looking for a specific app, you can use URL schemes. There you can open a URL on your template application scene, which should cause the desired app to launch in CarPlay (with the payload you provide), but again that’ll be specific to the particular app you’re integrating with.

|U03JER2C7MX|:
<@U03HJA80GLS> Yeah, I just didn’t save the question and it probably was lost among other CarPlay questions…

Here’s the case:

The user is in the car and he wants to send an email via some mailing app. He can do it using voice commands - dictate some text and requests to send.

We’d like to provide the user an ability to dictate that text in our app for CarPlay, which will perform some manipulations with the text (grammar checks, punctuation fixes, etc.) and “return” it to the user, so that he could send it to another app (e.g. Mail app) using some voice command.

Is it possible to implement such an app and would it be possible to let the user send it to another app - either using a direct command or using some copy/paste flow?

|U03J83E86Q0|:
See the CarPlay App Programming Guide for the supported categories of apps in CarPlay: <https://developer.apple.com/carplay/documentation/CarPlay-App-Programming-Guide.pdf>

|U03JER2C7MX|:
Technically, we can fit under the communication category )

But is there gonna be a way for the user to use Siri and ask her to send our text to someone using, for example, iMessage?
