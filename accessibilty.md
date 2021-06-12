## Tuesday

### Q:
As a relatively new iOS developer, what should I keep in mind for developing more accessible apps?

### A:
This is a great question! For starters, I’d familiarize myself with Voice Over. Spend some time with it and get an idea of how to use it. Once you do, you’ll start to get a feel for what would work well with it. If you’re into SwiftUI, you’ll find that the accessibility modifiers are simple tools that can do a ton of work. Likewise, UIKit offers the same functionality with UIAccessibility. I encourage you to dig into some of the documentation to see what you can find.

My recommendation for new iOS devs is to stick as much as possible to native components as they're accessible out of the box. You may start running into problems when developing custom components and I would do that only if necessary, and as Adrian says, if you are familiar with UIAccessibility and the SwiftUI accessibility modifiers available.

---

### Q:
What are some of the best practices of testing for accessibility?

### A:
That depends on what part of accessibility you want to test, I guess.

Personally I (and my team) test Voice Over and swipe navigation on a physical device with VO turned on, the screen turned black (triple tap with three fingers) and head phones on (so my peers won’t beat me up)
Dynamic font sizes and responsive layout I test inside the simulator changing accessibility settings in Xcode.
But there is so much more to accessibility than this. Having a clean, straightforward design and using default views, controls and so on will do the heavy lifting for you in most situations.
A crucial part is to find people that rely on accessibility features and get them to test your app for you. Creating a test group that is diverse is key here. It can be hard to get those especially for independent developers, I guess.
So the least you can do is to give them the ability to send you feedback on your app’s accessibility and make this way of giving feedback as accessible as possible.

---

### Q:
Hi, I have some questions about voiceover:
1. Voiceover read all of the contents in table view cell. I found the only way to turn it off is to set the accessibility label to empty string for the cell. Is there any other way?
2. How to prevent voiceover keep reading the contents in fast updating view?

### A:
Are you trying to exclude only specific contents from your table cell? One option might be to make the cell itself an accessibility element so that it doesn’t expose its children, and then override `accessibilityLabel` on the cell. Then any controls within the cell you can expose via `accessibilityCustomActions`. https://developer.apple.com/documentation/objectivec/nsobject/1615150-accessibilitycustomactions
You can probably use the `updatesFrequently` trait for this: https://developer.apple.com/documentation/uikit/uiaccessibility/uiaccessibilitytraits/1620187-updatesfrequently

We also have a WWDC talk on “Tailor the VoiceOver experience in your data-rich apps” this Friday!
https://developer.apple.com/videos/play/wwdc2021/10121/

---

### Q:
Hey guys! This is my first WWDC! I am a developer with a disability called Cerebral Palsy. I use a joystick and the on screen keyboard on my iMac to code! I also have a iPad Pro that I work with my nose. Who should I connect with at Apple about making the iPad experience even better for people like me.
:heart:

### A:
Adrian (Apple)  4 days ago
Hey Josh! While people often use the Feedback Assistant for bugs, it’s also a great tool for suggesting features and improvements. If you’ve got something in mind, we’d love to hear about it. Simply file feedback :slightly_smiling_face:


---

### Q:
Hello! Some slightly in the weeds questions, but things I've never quite figured out :)
- Why do all `NSObjects` implement accessibility features such as `accessibilityLabel` etc, rather than just starting with `UIView`?
- Why is `accessibilityIdentifier` part of `UIAccessibility`?  I understand its purpose is for identifying the view for UI Testing, but I'm unclear on the accessibility connection. Is this used on Mac for tools like automator or for 3rd party assistive tech? Is there any use for this on iOS other than UI testing?
- Why is there no `textField` accessibility trait? I suspect the answer to this is obvious :)

### A:
axLabel and friends can be used on many kinds of objects. `UIView`, `CALayers`, `NSStrings` (in the case of `UISegments`, `SpriteKit` nodes and many more)

Almost all automation relies on the accessibility runtime system to provide its information. When no axIdentifier is present, it falls back to axLabel. So that is the connection at least.

---

### Q:
Whats the best practice for using `UIAccessibility.post(notification: .announcement, argument: "Announcement")` for informing VoiceOver users of status updates. eg form validation errors, toasts etc? Is there a way we can guarantee the utterance will be announced in full without VO interrupting it when changing focus?

Someone 😀 wrote a [library](https://github.com/spanage/AccessibilityAnnouncer) that kinda does what I want here, but I wondered if there was something that was preferred?
I don't find `UIAccessibilitySpeechAttributeQueueAnnouncement` to be that reliable

### A:
There is also this: https://developer.apple.com/documentation/uikit/uiaccessibilityspeechattributequeueannouncement/

So I believe that is all there currently is, i.e. listening for `UIAccessibilityAnnouncementDidFinishNotification` or trying `UIAccessibilitySpeechAttributeQueueAnnouncement`.


---

### Q:
Is there a way to make status update announcements with VoiceOver in SwiftUI, similar to `UIAccessibility.post(notification: .announcement, argument: "Announcement")` in UIKit?

### A:
Hi there :wave: I’m an indie dev (not from Apple). But I recently added an extension to my Views in SwiftUI that receives a message and post it with `UIAccessibility.post(notification: .announcement, argument: message)` if `UIAccessibility.isVoiceOverRunning`, and it works like a charm. I hope this helps!

Aside from avoiding the work, doing the announcement notification is essentially a no-op is VoiceOver isn't running

---

### Q:
When using `accessibilityFrame` I would expect the frame to be discoverable by touch if the frame is larger than the view, but it appears that the view is only discoverable by touch when the visual frame of the view is explored, is this expected? If so is there a way to get a view to absorb explore by touch from an area larger than its bounds?

### A:
You would probably need to override the axFrame for the upper views.
Otherwise when the touch event goes down the view chain, it will get clipped out by a parent that is "too small".

---

### Q:
I'm currently working on some new interactions for my iOS app, and some of the solutions I'm exploring rely in swipe interactions. From an accessibility point of view, I wondered if that's ok or it's better to explore other alternatives. And if I need that kind of interaction, what's the best way to handle them with VoiceOver in SwiftUI. Thanks!

### A:
Voice Over includes a ton of support for swiping, but if you want to make your own actions, I’d suggest taking a look at https://developer.apple.com/documentation/uikit/uiaccessibilitycustomaction
Swipe actions are great candidates to get folded into Accessibility Custom Actions — custom actions for VoiceOver, Switch Control and more! Here’s a great talk on them: https://developer.apple.com/videos/play/wwdc2019/250/

---

### Q:
In our app running iOS 14.x, we used `UISegmentedControl`. I've noticed that when scaling for bigger dynamic font the `UISegmentedControl` stays the same size and doesn't reflect the accessibility font trait. The same happens in iOS 14.x app "Phone" - "Last calls" tab. Because of that I had to build own `UIControl` that would mimic the `UISegmentedControl`. Here's the question, since the minimal tappable size according to Human Interface Guidelines should be 44x44 pt and the mentioned `UISegmentControl` doesn't scale more than 32pt on height, isn't this an accessibility issue? Is there a solution that I maybe missing? :)
One of the ideas was to keep the mimic size if our custom like UISegmentControl `UIControl` and the provide some hacking with larger tappable areas, but I don't like it.

### A:
If you long-press the UISegmentedControl, a larger version of the segments will appear under the segments that also indicates which segment is selected and you can use that to move between segments.

You can see more info at https://developer.apple.com/videos/play/wwdc2019/261/ and https://developer.apple.com/videos/play/wwdc2017/245/

---

### Q:
What animation options can we have if user has enabled reduced motion?

### A:
Fade in and fade out work well for this. This video has a great section on reduce motion: https://developer.apple.com/videos/play/wwdc2018/230/

---

### Q:
In yesterday's keynote during the segment on new APIs, I noticed an API titled "Virtual Game Controller". Is this related to the new feature that allows game developers to put up onscreen controls in their games if no physical controller is paired?

### A:
Please check out this awesome session by the Game Technologies team if you haven't already. The resources here will be super helpful, too! https://developer.apple.com/videos/play/wwdc2021/10081/

---

## Wednesday

### Q:
When coming to Haptics does iOS provide a way to check if users want haptics enabled? Thanks!

### A:
Great question! When your app uses the Core Haptics Framework, iOS will handle the delivery of haptics based on the user’s setting for System Haptics. You don’t need to worry about accidentally breaking this setting. For devices that don’t support Core Haptics, like iPads and iPods, you can check the device’s capability and use that to make decisions about what kind of feedback to give to the user.

```swift
var supportsHaptics: Bool = false
...
// Check if the device supports haptics.
let hapticCapability = CHHapticEngine.capabilitiesForHardware()
supportsHaptics = hapticCapability.supportsHaptics
```

---

### Q:
Are there any any accessibility considerations to using haptics aside  from the general usability guidelines set out in the HIG? eg, are there circumstances where we shouldn't be using them, should be using lighter haptics etc? Or perhaps are there places where you would recommend haptics are essential as part of an accessible app?

### A:
VoiceOver actually implements an entire set of its own haptics that work system-wide so it may be the case that an app’s haptics could conflict with VoiceOver and cause confusion for a user.
One idea might be to offer the ability to turn your app haptics off if VoiceOver users find the combined experience to be overwhelming

---

### Q:
The new material backgrounds look stunning, but I'm concerned about the accessibility of the thinner options. Does the system do anything to remedy this when 'reduce transparency' or 'increase contrast' is enabled, or should we be proceeding with caution?

### A:
In general this is a case where reduce transparency should replace the material with a solid color. Using system components ensures that these settings will get applied at the right time.

---

### Q:
What behavioural changes happen in VoiceOver or other assistive tech with the `.tabBar` accessibility trait?

### A:
This lets VoiceOver notify users they are currently navigating a tab bar. for example it might say “Movies, tab 1 of 5”

---

### Q:
What behavioural changes happen in VoiceOver or other assistive tech with the `.keyboardKey` accessibility trait?

### A:
This may control what input/typing rotors are presented by VoiceOver. Also, it may affect what sound effects VoiceOver plays when the key is activated. Normally VoiceOver plays its activate sound when an element is activated but keys often play their own sound the the activate sound is not necessary.

---

### Q:
What are the behavioural differences between the `.playsSound` and `.startsMediaSession` traits? Should they be used together? Or perhaps never together?

### A:
PlaysSound will ensure VoiceOver doesn't play its own sounds when an item is “activated.” Example is a keyboard key that plays its own click sound when pressed

StartsMediaSession will make VoiceOver not output any speech or sound after an item is activated. Good for a play button in an audio app where you don't want VO to interrupt the content

---

### Q:
What approaches do you think that could be used to improve the accessibility for apps with highly customised UI? And I mean specifically apps that have highly variable and even parametric UI, such as TouchOSC (not the developer).

I understand that in general the most efficient approach is to extract meaning from the views hierarchy and find an alternative way to translate it for the user to understand. For example rendering it using speech in VoiceOver instead of using pixels in the screen.

But these kind of apps essentially are interactive dashboards with controls that may not hold a hierarchical relationship. And I'm wondering if it would make sense to think of the whole app UI as a canvas. And try to provide haptic feedback based on the borders and shapes of the controls, so that the users that are not able to see the screen can still explore the canvas and learn the position of the controls using their fingertips.

Do you know of any apps that use a similar approach? How else do you think we could make these apps accessible?

### A:
One thing to consider is that directly touching-to-explore is not the only way to use VoiceOver. Some users perform the discrete gestures like swipe to navigate by element. Other users pair a Braille display and do not touch the screen at all.

---

### Q:
Seems like with `accessibilityRepresentation` we have to rebuild our UI again with views that can handle default accessibility. Is this correct? Ex: Custom List, I have to rebuild with a regular list?

### A:

We have made LazyVStack accessible, and you should not use `accessibilityRepresentation { List ... }`. Its ideal for custom controls, like your custom button if you do not use Button

---

### Q:
Is there a list available of UI elements that are best served with accessibilityRepresentation because they don’t translate well accessibility-wise?

### A:
The ideal use case is controls made with shapes and other views that are not accessible by default.

> Gotcha, so as I understand it, it's mainly for shapes and custom views? Essentially an easy way to add accessibility for when it doesn't come “free”?

Yes. You wouldn't need to use it on something like Button, because we make it accessible by default. But for custom controls, one would often need the "right" value, label, traits and actions. So accessibilityRepresentation can give users the same experience as standard controls, regardless of how you choose to design the control
Or in cases like the SymbolButtonStyle I demoed. Checkout the sample project for more interesting use cases

---

### Q:
Will `accessiblityRepresentation` override any accessibility I had on the view it's being placed on? Or are those `accessibiltyLabel`s getting merged somehow?

### A:

It will override. It will replace the accessibility of all views at the point it is called.
`accessibilityChildren { ... }.accessibilityElement(children: .combine)` can be used to add a child and then merge its properties

---

### Q:
Some of my more complex windows cannot have a preview. Are these values accessible if I dump the graph to Xcode in debug sessions? Or what would be a rule of thumb to actually make sure everything is properly accessible by looking at code only?

If I look at a piece of code, without having any other means to know whether this is accessibility enabled or not, what few modifiers would you add up to any given element to make sure the application is properly accessible, at least for the minimum (other than testing in Voiceover for example)

### A:
There is no substitute to testing in VoiceOver. That's what we do, for example, in our Accessibility Design labs with third party developers.

The AX Inspector is a powerful tool for rapidly iterating, but for determining "is my app really accessible", the best way to do that is to use VoiceOver, especially with a screen curtain on (so you can't see what's on screen). If you can use your app that way, you have done a great job.

> My biggest hurdle right now is striking the balance between too much and two little Voice Overs and descriptive elements. I feel like the rotor will be a game changer for discoverability.

Have you considered accessibilityCustomContent? its ideal for when you want to add many descriptions to the same element, but do not want each spoken together

> I want to get the VO on what you select, but once you selected it, I need to add up “selected the upper right text zone” and probably “containing your text \whattheuserwrote)”

If you are trying to model a selected state, dont include selected in the label. Instead, use `accessibilityAddTraits(.isSelected)`. For example: `accessibilityAddTraits(isSelected ? .isSelected : [])`

---

### Q:
In this year of automatic UX testing, have automation started being shown up in accessibility? I feel like multiple representations, children and alternate ways be a nightmare of maintainability under the premises of great features.

### A:
We have made quite a few changes to improve the information returned for SwiftUI accessibility elements for automation. Is that what you are asking?

> Automated testing in particular.
You should see much more show up in automation now, including elements that were combined to make a new element and hidden elements. Elements should also have the right automation type.

---

### Q:
Hello! What are best practices around an accessibility label being different to the content on screen. For example, an equation such as 'xyz / x', would 'x times y times z, divide by x' be a good accessibility label? Or would 'xyz divide by x' better? My concern is the accessibility label being too different to the original string, especially when the equations get a little more complicated and I would need to add many commas to an accessibility label to make the operations clear.

### A:
It’s fine to have Accessibility labels that differ a bit from what is on-screen.

The best way to determine what is a good AX label is by trying the app with something like VoiceOver, and getting a sense of what it is like to use it that way. For example, a label might be too long, which might make it difficult to navigate the app. Or it might be not specific enough or clear, where it doesn’t convey enough information to the user. (edited)

We have a WWDC Session from an earlier year that talks about accessibility labels specifically and how to write them. https://developer.apple.com/videos/play/wwdc2019/254/

---

### Q:
It is not a question! But I want to say thank you to the whole SwiftUI Accessibility team for the great work you have done. These new APIs so easy to use to achieve great UX.

### A:
Thank you! We are hoping that as some of these things like Rotors, synthetic elements, and AX Focus are brought into SwiftUI, and are easier to achieve, that will lead to more apps with exceptional and high quality VoiceOver experiences!

I forgot to mention Accessibility Preview! It is so easy to monitor AX during development without need to run accessibility inspector.

---

### Q:
What are the best practices around accessibility and displaying progress or loading states to users?
For example if there is a HUD indicate a loading state, should developer implement special handling for voiceover users by announcing the loading state is still occurring?

### A:
The best practice here would be to make sure your indicator has an appropriate accessibility label, like "Loading" or "Downloading". If you know the progress of the loading state, you could add an accessibility value like "45%" and include the .updatesFrequently trait.

Is this a blocking loading state? Can the user interact with your app while this is happening meaningfully?

> Originally, I was thinking of a blocking loading state. But I guess it's applicable to also non-blocking state.
So if a state is non-blocking, and the loading indicator is not interactive, it might make sense just to use an announcement.

I believe that is what pull to refresh does. You let the user know they are refreshing, but you don’t need to interrupt their VoiceOver focus, etc.

However, if the loading state is blocking, and certainly if it might be interactive such as allow a cancel action, it would probably make sense to have the VoiceOver user land on the indicator.

Terence, you can use accessibilityRepresentation { ProgressView(...) } as a starting point to make a custom progress view accessible.

If it works in your app, you can also make a custom ProgressViewStyle and use that for your ProgressView. Then you dont need accessibilityRepresentation since you are using ProgressView directly.

---

### Q:
Is there a string for `accessibilityValue` or `accessibilityLabel` that is interrupted as Silence?
Context: I use `accessibilityIncrement()` and `accessibilityDecrement()` to control media. But these function always end up calling accessibilityValue, interrupting media playback. I can't use " " (space), or punctuation. I used "  " 2 spaces which is voiced as drum banging.

### A:
Add the startsMediaSession trait to the element with accessibilityAddTraits so that VoiceOver knows not to interrupt the audio.

> Tried that. It doesn’t work: it appears that startsMediaSession does not apply to accessibilityIncrement() and accessibilityDecrement().

startsMediaSession only applies when you activate an object (not necessarily for incrementing)

if you just return nil for axValue is that not what you want?

> If I return nil, it’ll read accessibilityLabel and try to speak that. Is there a string that is interpreted as silence?

when you adjust (swipe up or down) it reads the label again?  "  " should be intrepreted as silence

---

### Q:
Is there a UIKit equivalent to `accessibilityRepresentation` or is it SwiftUI only? Either way this is an awesome idea thank you for building it!

### A:
Sorry there isn't an equivalent in UIKit. We welcome any feedback if thats something you would be interested in! Well you can achieve this similarly by overriding accessibilityElements

What are you trying to do with it? There is usually a way to achieve the same with UIKit, but those ways might differ depending on what you would be using accessibilityRepresentation for.

> Didnt have a specific case in mind but we pretty notoriously re-write native UI components for various designs. In the event we can subclass it all works great, but if theyre really custom it might be nice to get the native UI accessibility behavior "for free"

Ah I see. Yes in that case pretty much anything should be achieve-able with UIKit AX API, but it might require a couple more lines of code and might be a little differently abstracted, i.e. you might want to add an action + a value + a label, for example.

But yes, simplifying that is a part of why accessibilityRepresentation was created.

---

### Q:
If I have a custom, complex view that doesn't look like a button but  I want to add functionality when tapped, I may just add a tap gesture recognizer to it. Is there an accessible alternative so a VoiceOver user can know the view is tappable?

### A:
Usually VoiceOver users expect that buttons are tappable. So add the isButton trait. Is this complex view a singular control?

> Yep it is! So I could just add the isButton trait to the base view then?
Yes. You may want to consider creating a custom ButtonStyle. This has a few benefits, 1) you get all the AX stuff we do for Button for free, and 2) all the other SwiftUI defaults for Button work, like keyboard shortcuts

---

### Q:
Is there a native-SwiftUI way to add an attributed label or hint? I asked a question on SO here: https://stackoverflow.com/q/66863764/14351818, but ended up using UIViewRepresentable.

### A:
SwiftUI Text can contain attributes.  Although there is no way to add those specific attributes, yet.  There are also new swiftUI modifiers for accessibility related text stuff, like zspeechAdjustedPitch`. SwiftUI now supports attributed values and labels based on how the Text is marked up automatically, like font, color, etc


---

### Q:
Should we expect to change our limiting `.sizeCategory` based on the watch screen size (38mm vs 44mm)? It seems like on the 38mm it would need a much lower limit before for going vertical.

### A:
That's definitely one approach! If possible stick with a smaller number of cases here though, and if your UI allows, do try to wrap the content in a way that allows the content size to grow without needing to adjust the layout at all

---

### Q:
Just a quick question. I have a free watchOS complication called Roughly; it's on the App Store now. It tells the approximate time in words, in many languages, but I'm not a good programmer! It would be great to see this rolled into watchOS properly by Apple; some people who suffer from dyscalculia use this to tell time without reading numbers. Supporting many more languages is a tricky problem too, as different countries tell time in very different ways. Also, I've got a minor issue with VoiceOver. Although the one-line complications are read out correctly when tapped, the three-line complication is not — only the first line (e.g. "It's about" instead of "It's about ten to three") is read out. Any ideas why that might be?
Thanks in advance, and please keep up the great work on Accessibility.

### A:
Thanks for the idea!

2. This sounds like a bug. Do you have a code snippet of the complication type you're using so we can confirm we can check the same thing?

> The one that has issues is `.modularLarge`
>
> ```swift
> case .modularLarge:
      > let template = CLKComplicationTemplateModularLargeStandardBody()
> ```
>
> I’m just using the standard template and populating all three lines:
>
> ```swift
> template.headerTextProvider = CLKSimpleTextProvider(text: theItsAbout, shortText: theItsAbout)
      > template.body1TextProvider = CLKSimpleTextProvider(text: thisFirstLine, shortText: thisFirstLine)
      > template.body2TextProvider = CLKSimpleTextProvider(text: thisSecondLine, shortText: thisSecondLine)
> ```
thanks!

> And just to be clear, only the headerTextProvider is being read out.
k, writing up a radar now

---

### Q:
I don't remember the name of it but there is a new `accessibilityModifier` in SwiftUI that allows you to add a hierarchy of SwiftUI views and have VoiceOver look at those instead of the non accessibility Views.

Are there any issues of syncing the non-accessibility views with the accessibility views during dynamic changes? I'm just curious about best practices.

### A:
I think you are referring to accessibilityElement(children: ..)

Im not sure I understand your question though. Are you referring to how it works with dynamic number of elements?

> Yes that’s the one I’m referring to. if I understand correctly `accessibilityElement(children: ..)` is replacing the view hierarchy in VoiceOver with whatever you input as the children, correct?
>
> If so, could there be issues if the view hierarchy inside of accessibilityElement(children: ..) doesn’t match the hierarchy of SwiftUI views for your sighted users?

zaccessibilityElement(children: )z creates or updates an accessibility elements visibility. Such as, `accessibilityElement(children: .contain)` would wrap children in an new accessibility container element. Are you perhaps mixing up `accessibilityChildren`, which allows you to pass in views as children?

> No I guess I was misunderstanding the purpose of `.accessibilityElement(children: ..)`
>
> I guess the purpose of it is to add accessibilityChildren if the view doesn’t already have children (like in the example of that custom Canvas View)?

Yes `accessibilityChildren` is used to add "synthetic" children, which are not directly visible (though could be positioned to match whats drawn in Canvas).

`accessibilityElement(children: )` transforms the exiting accessibility tree, to make a new container or combine child properties into a new element

> Is it possible to use accessibilityChildren in the use case of replacing the children in the accessibility tree (if the children in the tree are problematic)?

Yes it can be used anywhere. I go more into details in the Beyond the Basics talk: https://developer.apple.com/videos/play/wwdc2021/10119/

Attached to that talk is a sample project where we have some examples of accessibilityChildren

---

### Q:
How do you handle potential “over verbosity” when using VoiceOver. Sometimes if a table cell for instance has a great deal of content I can sometimes be unsure if I should err on the side of reading most of it (and the user potentially have a bunch of stuff read at them), or read less so they can quickly scan. Do you have any advice on how you manage this?

### A:
Hey Christian! We have a session coming up this Friday called “Tailor the VoiceOver experience in your data-rich apps”, and it will cover precisely this, so stay tuned! I’d ask the presenter any questions you have afterward during that watch party.

## Thursday

### Q:
When designing Accessibility Label/Value/Hint content, what considerations do we need to think about for refreshable braille displays?

### A:
VoiceOver already abbreviates common UI words, like button to shorter forms. There's not too much API level control over what gets sent to the Braille display at this time

I think in general, the same advice applies for spoken axLabels - which is try to be concise, but accurate. Don't be overly verbose, and front-load the important information

---

### Q:
I learned that apple created a people locator that helped blind people during the pandemic!

### A:
https://support.apple.com/guide/iphone/people-detection-iph41bdfe6c7/ios

---

### Q:
Do you know of any good guides for learning how to use VoiceOver on macOS?

### A:
Try this! It should get you started.
https://support.apple.com/guide/iphone/turn-on-and-practice-voiceover-iph3e2e415f/ios

---

### Q:
When should we be using the link trait rather than the button trait? On web the general rule is that a link goes somewhere and a button does something, but this doesn't always match up in a native app.
Should a text button be presented as a link? Should links only be links that are external to your app - say opening web pages in safari or making phone calls? Is it ok to have a button that opens a web link, or should this always be a link?

### A:
If a control takes you out to a webpage usually we use link. If the control operates some function within the app we call it a button.
I think we have usually avoided marking something as a button AND a link

---

### Q:
What's the recommendation when working with a long list of items in a table view and voice control.
should we put the same label in the `accessibilityUserInputLabels` so the user will say it's name then automatically after the OS will shows the indices or is it better to expose instead the specific cell title for example ? thanks

### A:
It would depend on your label and what’s appropriate for it. Generally you should put the name the cell or the relevant content. But if the cell has a super long label, you might want to put something shorter in `userInputLabels`. Like if it’s a travel app and the cell label is like “New York, a bustling city with tons of nightlife and famous attractions” a good `userInputLabel` might be just “New York” — this makes it easier to speak.

Today’s Voice Control Challenge will actually have some good tips on this topic. But if you have a screenshot I can take a more detailed look.

---

### Q:
Our app has over 20 different Font text styles. If we want to support dynamic type through UIFontMetrics, is there any way we can extend the 11 we get with `UIFont.TextStyle`?

### A:
Gold to hear your interest in fonts! We have a talk from WWDC17 that I think might help. Take a look:
https://developer.apple.com/wwdc17/245 Check out Building Apps with Dynamic Type

UIFontMetrics can also give you a scalar to scale a custom font appropriately based on the user’s text size.

---

### Q:
How can I incorporate accessibility inspector (command line interface) into my CI pipeline to provide me insight into my current accessibility audit level?

### A:
We are aware of this limitation, and unfortunately we do not have this functionality at the present time. Thank you for your feedback!

---

### Q:
I'm working on a UI for a tooltip on iOS 13+. It has some text and a close button. It's not modal, so you can still read content without dismissing it. Do you have any tips or examples for the best accessibility (specifically VoiceOver) experience for a component like this?

### A:
I think the main question to answer is where in the list of elements should this be placed. Either at the beginning of everything, end of everything or inter-mixed. If this is for a specific component in the UI, i would try to put it in the UI element list after the component it references. This could be done by overriding `accessibilityElements` for a containerView that contains both of those views.

---

### Q:
What is Apple's recommended methods to using or creating numeric telephone specific keyboard?

### A:
If you use our standard keyboard, and set the type to phonePad, then this should already be accessible. https://developer.apple.com/documentation/uikit/uikeyboardtype/phonepad

If you’re rolling your own, I’d recommend keeping it as similar to the the stock on for VO, etc. as possible. You’ll also want to use (on phone number text) `UITextContentType` of `.TelephoneNumber`

And for SwiftUI: https://developer.apple.com/documentation/swiftui/menu/keyboardtype(_:)

Also some related talks just for good measure!
https://developer.apple.com/wwdc20/10115
https://developer.apple.com/wwdc17/242

---

### Q:
Not totally related to the talk - but I tried using VoiceControl on my app that has DatePickers. I must be missing something because I find moving the picker to be impossible. It says "swipe up or down with 1 finger to adjust the value" but that doesn't work

### A:

You can say “Increment <element>” or “Decrement <element>” to increment and decrement date pickers The “swipe up or down with 1 finger to adjust the value” comes from VoiceOver. Are you using VoiceOver at the same time?

> Yes - I have voiceover turned on and I selected the element of the picker
Ok got it. So a UIDatePicker should be accessible by default via and up/down swipe when the cursor is on it. (This is b/c it uses the .adjustable trait). Are you doing anything particularly custom with this item?

> Don’t think so - I was trying to find another stock example - but when I’m in VoiceOver I don’t know how to get the control center. And it seems like the Things app removes the  “+ Add Reminder” control when VoiceOver is on

VO gestures (for Control Center, etc) are explained here: https://support.apple.com/guide/iphone/operate-iphone-using-voiceover-gestures-iph3e2e2329/ios

> OK - we can’t do VoiceOver in the simulator can we?

VoiceOver is only supported on device.

---

### Q:
I never knew about Tab-Z! During the talk I hit it and Slack gave me a summary of how to arrow around. And now it's gone - is it a one time thing, or am I doing something wrong?

### A:
Tab + Z while Full Keyboard Access is running should bring up the Custom Actions for the currently selected element. Tab + H should bring up the help menu which shows you all your FKA commands!

Tab + Z will not show anything if the currently selected element has no custom actions associated with it. Something like a “send” button may only have 1 operation and thus would likely not have custom actions, for example.

---

### Q:
Thank you for the fantastic talk! I was wondering if there are any special considerations we need to make with regards to Full Keyboard Access when the user has mirrored their iPad display to an external display for a larger view of their screen?

### A:
Full Keyboard Access should work exactly the same when the screen is mirrored to another device! If you’re doing a presentation and want the cursor to be larger or brighter, there are color and thickness settings in the Full Keyboard Access settings area!

---

### Q:
Hi! Can I ask for any advice on how to make sure a ML model is accessible for any user? You might say they inherently are, especially if they're performing sound recognition. However, it would be great to know which accessibility features can make sure they are as straightforward as possible to use, for everyone. Thank you!

### A:
This will be a great question for the Accessibility + ML event happening in at 4PM! Both these videos talk about this topic, in terms of inclusion,

https://developer.apple.com/wwdc21/10275
https://developer.apple.com/wwdc21/10304

It's all about making sure your data is collected and annotated in a way that honors the differences in us all

---

### Q:
Is Full Keyboard Access a good way for developers to test our apps' experience with Switch Control? Or is there a better way to do that without specialized hardware?

### A:
You can test SC w/o specialized hardware by adding a Screen switch in the Switch Control menu - this allows you to tap anywhere on the screen to activate the switch. You can also use (new in iOS 15) Sound Actions to test w/o specialized hardware - just my making sounds like “shh” or “pop”


## Friday

### Q:
One of my favorite features on Apple TV is the High-Contrast Focus Style. This feature adds an additional white border around focused cells. I've never been able to find an API to implement this for a custom collection view cell. A similar question was asked in the forums a few years ago and has more details: https://developer.apple.com/forums/thread/99313

### A:
Good point Christopher. We dont currently have public API for this setting but we should add it.

---

### Q:
Is the VoiceOver Image Description available on macOS or only iOS/iPadOS?

### A:
It is available on both. It is on macOS as well! Once enabled in VoiceOver Utility, you can get a description by focusing on an element and pressing VO+Shift+L

---

### Q:
Do you know of any good examples of apps that support drawing via VoiceOver/Voice Control or Switch Control? Annotating using Switch Control/Voice Over would be an awesome feature to provide.

### A:
Switch Control itself provide freehand drawing tools in the Switch Control menu. These allow SC-users to draw beautiful art, etc using Switch Control. I’m trying to find the name of an App that’s particularly popular with some of our SC users.

Procreate is the app - you can see a video it in use here: https://www.youtube.com/watch?v=N034rhJJe8g

---

### Q:
What would be ideal experience from auto capture perspective and Voice Over? We have SDK where one of the entry point allows user to change between Auto Capture and Manual Capture.  If person who needs accessibility starts screen with auto capture enabled, our logic announces detecting object and captures it. Sometimes its too fast and doesn't allow breathing room to let user understand what is happening. Any Suggestion?

### A:
That's a great question. One idea might be to give more feedback about the capture before it happens. For example you could use the `UIAcccessibilityPostNotification()` function to make announcements about the orientation of what's going to be captured, or other feedback that might be useful if someone could not see the screen.

Additionally there could be a small timer announcement of a second or two where if the user holds the phone steady for that time, only then does the capture occur.

I believe Vision framework has API called image registration that would be useful in determining if the camera frames appear constant (i.e. little movement)

---

### Q:
What considerations should we give to accessibility when using a `UIPageControl`?

### A:
You should include the label: "Page", value: "1 of 5", traits: adjustable, button then implement accessibilityIncrement/Decrement and accessibilityActivate (which moves forward one page at a time)

---

### Q:
I had a question related to languages. I have a Dutch soccer app (with a lot of Dutch names and terms). We know that we have some users that use Voice over and have their system language set to English. Other then forcing the accessibility language to dutch, is there a better way to let the system and user know the app is in Dutch? Translating the entire app to English wouldn't help much because of all the dutch names and their pronunciations.

### A:
I think in this case I would recommend using accessibilityLanguage property or the UIAccessibility or UIAccessibilitySpeechAttributeLanguage in the attributed string to mark up certain words in the right language

---

### Q:
Is `AXCustomContent` used in any Apple apps?

### A:
Photos and Calendar (in the detail view)

---

### Q:
Does anyone have any advice or inspiring examples of a great accessibility experience for color swatches? Specifically I'm experimenting with the differentiate without color feature when choosing the color of shoes, clothing, and jewelry in our app.

### A:
There’s a fantastic talk from last year’s WWDC on combining colors, symbols, and text together to make a really solid experience. Might not be 100% what you’re going for, but it’s definitely worth a look! I’ll attach the link


---

### Q:
Can SwiftUI views support AXCustomContent?

### A:
yes! hang on :slightly_smiling_face: details at the end of the video!

---

### Q:
This is excellent. It is absolutely relevant to my app, it's just the dogs are people. :) This gets at a challenge I have as a sighted developer. I use VoiceOver myself for some functional tasks, such as reading out content I'd rather hear than read myself. But it is hard to get to know the deeper layers of VoiceOver. One key third party app for teaching even the main VoiceOver gestures and interactions has been discontinued. What resources do you recommend for people to learn good interaction patterns for VoiceOver beyond the surface level?

### A:
Check this out..
https://support.apple.com/guide/iphone/learn-voiceover-gestures-iph3e2e2281/ios

---

### Q:
This has been really helpful to understand how to move content rich material to the "More Content" section of the Rotor. Are there other features of the Rotor that likewise require explicit developer implementation like this?

### A:
Checkout Accessibility Custom Rotors session from WWDC 2020 https://developer.apple.com/videos/play/wwdc2020/10116/ (edited)

---

### Q:
What has been the most challenging Apple app to work on for accessibility?

### A:
Personally, I would say, non UIKit based apps, like PDFs and Photos app!

---
