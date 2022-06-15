# accessibility-lounge QAs
#### by [FeeTiki](https://twitter.com/FeeTiki)
---

--- 
> ####  Will this plug-in work well for fast-paced games (like FPS)?

Certain aspects of this plugin are wellsuited to fast paced games like FPS.  Forexample, reacting to users settings forlarge text and dynamic text (e.g. in yourmenus or HUD). 

--- 
> ####  what would you say is the biggest challenge of adding accessibility to unity games?

Depending on your game, it may be hard to find what could be made accessible to your players. I hope this plugin can enable you to do much more than previously available 
Certainly before this plugin it was making anything accessible to VoiceOver. I think now the challenge will be more in how you design your game to accommodate people of different abilities 

--- 
> ####  Awesome work on the Unity plugin - I can't wait to use it! While the session demo'd VoiceOver use with the plugin, is it safe to assume this will work with Voice Control as well? There's that old overlap of accessibility allowing convenience for those that want it and it'd be nice to allow players to do so with additional voice inputs etc.

If you expose accessibility elements via this plugin it will be available to all the accessibility technologies, including Voice Control. 
<@U03HHHDSD2N> Thank you for the answer! That's great to hear - can we add the equivalent of accessibilityUserInputLabels modifier to elements using the plugin? 
For now we can't. We will incorporate this feedback so we could consider this in the future 
No worries. This is fantastic and I'll be sure to give it a try soon this week 
If you'd like to provide more feedback, please use this link on GitHub
<https://github.com/apple/unityplugins/blob/main/Documentation/Feedback.md> 

--- 
> ####  Should SwiftUI .sortPriority modifier on Views work also for Views that dont share the same superview/ancestor?

Yes it should. `accessibilitySortPriority`should work for any views within the same accessibility container, defined by `accessibilityElement(children: .contain)` modifier. 

--- 
> ####  What are some of the best tips and resources for designing and coding for large accessibility size fonts?  At the largest sizes, this seems to be very difficult to do well.

Hi Klayton, a lot of this likely starts at the design stage. The best high-level recommendation we tend to give is to allow for any given label in a design to grow significantly, both in content and in size. In many cases this involves making content scrollable, or adapting horizontal layouts to become vertical at a particular text size. For the latter, I highly recommend checking out ViewThatFits, which is a new view in SwiftUI this year that lets you specify variations of views, allowing the framework to pick the best one depending on the available size.

I’ve also got some links that I highly recommend checking out if you haven’t already: an app challenge from last year, a couple WWDC sessions, as well as the “Text display” section in our Human Interface Guidelines.

If you have specific questions about making sure your app works great with Dynamic Type we’d be happy to answer those too!

<https://developer.apple.com/news/?id=w6r26g7r>
<https://developer.apple.com/videos/play/wwdc2017/245/>
<https://developer.apple.com/videos/play/wwdc2020/10020/>
<https://developer.apple.com/design/human-interface-guidelines/foundations/accessibility#text-display> 
The upcoming talk on SwiftUI's new custom layout system will be helpful too.
<https://developer.apple.com/videos/play/wwdc2022/10056> 
Thanks.  That's helpful.  I really wish some of these new layout tools were available in earlier OS versions or made available to the same set of devices as iOS 15.

For a single word that can't fit on one line, such as someone's name, does a streaming scroll (marquee) element seem better than breaking up that word into multiple lines?  Should it require an app-setting toggle to avoid motion issues for people sensitive to motion? 
I would say multiple lines are much more preferable than implementing marquees 

--- 
> ####  Can SwiftUI support tab key switching to different UI components and use space key to trigger default actions of the UI compoments?

Thanks for your question. Currently SwiftUI controls can be added to tab key loop with the `.focusable` modifier, thus also being able to be triggered by space key. 
Hi Eric, do you have example code for this? I have tried .focusable() for my image button. However, when press space key for it,  the Button action didn’t get hit? Does it also work for Link. Toggle … 
We have a new sample project Food Truck this year
<https://developer.apple.com/documentation/swiftui/food_truck_building_a_swiftui_multiplatform_app>

Button with .focusable modifier should be able to be activated with Space key. If not, we'd love a Feedback!

.focusable() should also work for Link and Toggle:smiley: 

--- 
> ####  What attracted you to working at Apple, and specifically on accessibility?

For me personally, 1. I believe Apple is the best company to work for if you want to change the world and make it a better place with technologies 2. Solutions/products that help people with disabilities could be one of the most impactful things you could do with a known set of inputs/resources 3. Problems in accessibility are really really hard problems, and I get personal satisfaction solving them :slightly_smiling_face: 
I happened to meet someone who worked on this team when I was in school and managed to get an interview for an internship. I didn't get the internship, but I replied back a year later to see if they wanted interns for the next year, because I knew it'd be such a fit for me. The thought that someone was working on accessibility full time was so cool to me, and I knew it was something I wanted to do. I get to make stuff, basically for myself, I don't think I could find a cooler job :sunglasses: 
I've used Apple products since I was 10 years old and Steve Wozniak taught my 5th grade class how to use a Mac laptop. Having been born legally blind, accessibility has always been a passion of mine as it helps improve my quality of life. Since age 10, I've been all Apple, and I wanted to be a part of, and share with others, the amazing things that our technology has done to improve my life. 
I joined pretty much right from university. I was interested in accessibility research at the time and Apple just happened to need help making a newish product accessible (the iPhone). 
Testing and QA is what I already enjoyed doing. I’ve went most of my professional life searching for that missing additional element and I found it at Apple. I realized that found it more meaningful and fulfillment helping others by helping others by ensuring that our Accessibility features are always as expected. In addition, as a disabled person myself, I am able to provide quality feedback on how to improve or suggest new features that will make life easier for other physically challenged people like myself 
I’ve been using a Mac in one form or another since the 80s, and at every step of my vision loss, the product was there to meet me where I was at. The opportunity to work side by side with the people who created a huge part of my personal independence was a powerful dream. I have had this goal since I was in the 8th grade. You know those assignments “What do you want to do when you grow up?” Well, I still have the paper from that 8th grade exit assignment, and it says in my handwriting that I wanted to work for Apple. Decades later I wouldn’t change a thing. 

--- 
> ####  What are some example scenarios of where you could tell a developer tried to meet your accessibility needs but missed something?  Are there patterns?

Yeah, as a low vision user, the most common pattern I've noticed is in Large Text support. It often doesn't exist, or if support does happen, it is often not in a readable way. 
I think sometimes when developers make assumptions about what I need they can sometimes miss the mark. Just because I have low vision doesn't mean I need a totally separate design. When I see apps present a totally different design for VoiceOver users, I am always a bit disappointed. We have so many tools to make almost any design accessible, and people want to enjoy those experiences similarly to how their able bodied friends and peers are experiencing them. Implement APIs to support built in settings we've provided instead, and you'll be headed in the right direction 
One thing I notice is when a developer uses custom UI with several elements on screen, they tend to forget about making  every single element accessible. For example, most of the important elements would be scannable with item mode and the ones at the bottom such as sorting items in a list buttons won’t be accessible 

--- 
> ####  Should Voiceover order be always top-left to bottom-right in LTR language?

Yes, unless a particular UIView has its `semanticContentAttribute` set to `.forceRightToLeft` or if a SwiftUI View has its `layoutDirection` environment set to RTL 
In some specific cases like two columns content, navigating down the first  column before jumping to the second column may make more sense than a strict top-left-bottom-right. 

--- 
> ####  For third party apps that are clearly at least making an effort to be accessible, what are the most common accessibility omissions or errors do you see developers making?

The most common issues I see when we do app audits are bad accessibility labels and improper groupings for VoiceOver users. Labels should be concise, and shouldn't include redundant information like the role (like the word button). And items should be grouped logically. The best advice I give developers is, think about how the information is "digested" visually. Is this group of labels/images conceptually one item when you look at it? Then it probably should be for VoiceOver users too. This isn't something we think about a lot, it's all implicit in the apps we use every day, but taking a step back to notice these things help a lot 
Here's a great talk on writing good accessibility labels: <https://developer.apple.com/wwdc19/254> 
Lack of support for Large Text sizes. I frequently see apps make an effort to be accessible with VoiceOver, but even apps that do a great job with that often do not have support for Large Text. 
Making a choice to use a cross platform development package without first investigating how accessibility will be implemented with that package frequently results in a really bad situation. Your customer might report an accessibility problem, and you may be unable to fix it if the frameworks don’t support our accessibility features. This has been the case for countless apps I have encountered so far. 

--- 
> ####  For Andres: do you know if there is still a lack of assistive technology for reading scientific publications, or have things improved?  For everyone: are there any remaining challenges specific to your life that society or technology could do a better job of addressing? (how?)

Thanks Keith. There have been lots of improvements in accessibility of scientific materials . MathML for instance allows VoiceOver users to read mathematical expressions on the web and other documents. There is still a lot to do in making math and science more accessible to students and professionals with visual disabilities. In particular conveying graphical information such as diagrams, function graphs, etc. is still an area of research and development. 

--- 
> ####  How do header traits and levels work on macOS? I didn’t see a header rotor option available like on iOS. 

So in VoiceOver on macOS the headings rotor will be found using the VoiceOver modifier keyboard shortcut + the U key. This will pop open the available rotors and if you're on an element which has a headings rotor you can use the left and right arrow keys to find it in the rotor menu. The headings rotor will include the level of the heading when announcing each heading. 

--- 
> ####  Is it possible to emulate a switch control in either the Simulator or via an external Bluetooth Keyboard?

Great question. Yes, Switch Control can be configured to respond to external Bluetooth keyboard events!

Make sure your keyboard is paired to your iOS or iPadOS device, then head to Settings &gt; Accessibility &gt; Switch Control &gt; Switches &gt; Add New Switch. Here you get to choose the switch source, so tap External.

Each key on your keyboard could be its own switch, but you have to add them one by one. When you activate a key on your keyboard, Switch Control will ask you to name it and then assign it to an action, this helps you keep track of all the switches you add. 
If you're able, I recommend setting up at least three switches if you're using a keyboard with Switch Control: Select Item, Move to Next Item, and Move to Previous Item. For these you could use the space bar and arrow keys respectively! 
Thanks Drew! This will make switch control development much easier 
Glad to hear it will help! :tada: 

--- 
> ####  Can you give any advice to making a text view with a maximum character limit more accessible, especially with VoiceOver? Visually it shows a counter (eg: 90/100) and highlights text over the limit red.

You can override/set accessibilityValue on the text view to return the entire text. 
For the character limit, you could post an announcement notification when the user starts to go over the limit that says something like "character limit reached". You can also add a hint to the text field that conveys the max number of characters. Also make sure that your counter of 90/100 is an accessibility element, so that VO users can focus on it manually if they want to know the character count 

--- 
> ####  In SwiftUI &amp; macOS 12 How can I move the voice over focus to a presented view?

Accessibility Focus State is gonna be the way go here! You can change the state value to true on an element and it will update VoiceOver focus to that element! <https://developer.apple.com/documentation/swiftui/accessibilityfocusstate|https://developer.apple.com/documentation/swiftui/accessibilityfocusstate> 
Does it make sense to change the focus when showing a new view in place of the old one on macOS? We have a list layout, clicking one of the items "pushes" a new view similar to a navigation controller. Currently VO loses focus and moves elsewhere. 
So if voiceover is really not going where you want in this instance I think you could do that. I would warn about using this too often though because jumping around the voiceover focus can be very distracting. If its a totally custom navigation system than in that instance you probably want to either do that or trying to post a layout change notification. Usually though we either let the system framework and voiceover to decide where best to go, or if your UI has a popup or an alert thats a great way to use focus state. 
I guess there’s a similar property as AccessibilityFocusState in NSAccessibility? I am having some issues to keep the element selected with tabulator keyboard navigation and VoiceOver focus in sync because I have to move the tab focus programmatically in some cases (for example when moving out of a WKWebView to some custom window UI elements below). 
&gt; trying to post a layout change notification.
Will posting a layout notification without passing in a view work? Or is there a way of doing this in SwiftUI? 
So if you change keyboard focus you can send a notification with NSAccessibilityFocusedUIElementChangedNotification to let voiceover know the focus changed. If you want to change voiceover focus from non-keyboard focus changes you can use NSAccessibilityLayoutChangedNotification with a NSAccessibilityUIElementsKey <https://developer.apple.com/documentation/appkit/1534572-nsaccessibilitypostnotificationw?language=objc> 
In that instance <@U03JB2UUT46> if you want to pass a specific element you would use focus state because there isn't really a view to pass it in SwiftUI 
Thanks <@U03HKTXJ4KE>, I‘ll try those notifications. I actually might need LayoutChangedNotification because the elements I‘m programmatically focusing are in a different window, so maybe the NSAccessibilityUIElementsKey is needed to be passed. 
I had a hard time to be able to access window elements in the title bar (if no NSWindowToolbar is used), in the toolbar if it is visible, web content in the WKWebView and those additional UI elements in a separate „Dock“ window below, but in the end it worked with adding views like NSWindow contentView.superview, contentView and the contentView of the separate window to NSWindow accessibilityChildren. Don‘t know if there‘s a better way, but it seems to work correctly now. 

--- 
> ####  Joining a team without any real accessibility support, what would you all consider top priority support? I'd love to do it all but know that proper support takes time and, also, one thing cannot be more "impactful" than another, they are all equally important. How would you consider breaking down a project into incremental wins?

I usually say
1. Dynamic Type support will reach the largest audience
2. Add App Accessibility support will be most impactful for users who need to use ATs (Assistive technologies) - like VoiceOver,Switch Control, Voice Control — because often if app accessibility is NOT provided - they will have no way to access your app 
Other areas like checking for contrast, transparency, motion will have large impacts IF your app has areas that might be problematic (aka - you have light grey text on white backgrounds) and are usually not that much work to implement 
True true, I want to be sure our app is impactful for everyone so taking the small wins were we can. Thanks for the callouts here! 

--- 
> ####  How are swipe buttons on list items regarded from a general discoverability aspect and then more specifically for VoiceOver?  I have a list UI that's more of a fake "tree view" with different types of content on most rows. There are correspondingly different swipe buttons on leading &amp; trailing. Currently have no affordances hinting at them even for sighted users.  The lovely new HIG doesn't even mention them. As they got significant improvements in SwiftUI3 I assumed they are still "blessed" as a UI approach.

Swipe items are exposed to assistive technologies via 'custom actions'.  They typically should be exposed automatically if you are using system UI controls.


<https://developer.apple.com/videos/play/wwdc2019/250/>

<https://developer.apple.com/documentation/uikit/uiaccessibilitycustomaction> 
For VoiceOver specifically, these swipable actions  are exposed in the 'Actions' rotor. 

--- 
> ####  Are there plans to expand the new eye gaze access in iPad OS to allow apps to directly access the high fidelity eye gaze data and opt out of translating eye gaze data into assistive touch events?

Anything is possible. Are you able to explain your use cases in more detail? It may be useful to file a feedback as well so we can look into this in the future. 

--- 
> ####  When supporting dynamic type/large text sizes with custom fonts, is there a good way to limit the maximum size a font can be? Or is this just a bad idea in general?  Use case: While we are working on supporting dynamic type, we've noticed that we can support many of the larger sizes &amp; all the smaller sizes. But the biggest sizes cause some pretty serious layout breaks throughout &amp; it's going to take us a while to chase them all down + QA. I'd love to roll out support for most sizes so my customers can use it earlier &amp; those who need the largest type sizes can at least get partway there.

I suspect you’d want to use UIFontMetrics to help here


```- (UIFont *)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize;``
` 
In general, we would like to NOT cap font sizes, however there are cases within the UI that are very hard to grow given constraints. In iOS and iPadOS we will often use UILargeContentViewer (UIKit/UILargeContentViewer.h) to allow a long press to show text that’s can’t grow well 
In your case, it sounds like it would be reasonable to roll out support for larger sizes and overtime work to adopt the largest sizes. 
I'd reiterate that it's really not recommended to cap text sizes, unless the UI literally cannot grow without being unreasonable (like nav bars and tab bars, in which case use large content viewer like Chris said). Limiting text sizes will significantly impede low vision users from using your app properly. Definitely support what you can for now, but I strongly encourage you to work towards supporting all the sizes rather than capping them to a specific value! 
Yes! Supporting all font sizes is absolutely the plan! Just trying to make it more usable more quickly. Thank you for your answers! 

--- 
> ####  Hello. There are a few new languages added to VoiceOver. I'm talking specifically about Persian. The system falsely identifies Persian texts as Arabic or Urdu. Do we need to somehow tag the texts to make it work with Persian VoiceOver or is this a bug?

Hi Saeed, please file a bug using the <https://feedbackassistant.apple.com|Feedback Assistant>. Is this on macOS or iOS? 
I’ll file it. I’m testing on iOS. 
On iOS you can programmatically set the speech language (`UIAccessibilitySpeechAttributeLanguage` for attributed strings, or by setting `.environment(\.locale, …)` in SwiftUI Texts)

…but I agree that you shouldn’t have to do this. Some more detailed steps will help us get to the bottom of this :slightly_smiling_face: 

--- 
> ####  Are there any specific accessibility API properties/methods we  should use for "Full Keyboard"? I have a view that is fully interacts with voice over but not with an external keyboard. I started using the accessibilityRespondsToUserInteraction boolean and that seems to work for most of the elements, but not all. NOt really sure if this is the correct api property to use in this case. There is not much documentation out there for full keyboard accessibility. thank you!

You can also use the API in &lt;UIKit/UIFocus.h&gt;. FullKeyboardAccess uses the focus engine, so these may be used to customize the FKA experience. 
thanks, John! so, it seems like simply implementing accessibility for voice over does not automatically carry over to full keyboard?

is there any specific accessibility property we should use for keyboards? where you thinking I should use `canBecomeFocused` ? 
Right it does not, we do try to respect `accessibilityRespondsToUserInteraction` and other accessibility methods like `accessibilityElements` but ultimately the focus engine is what determines the behaviour.
Yup! `canBecomeFocused`  is ultimately what the focus engine uses to decide what to focus. 
I was hesitant to use this boolean -- the wwdc '21 "Support Full Keyboard Access in your iOS app" session specifically calls out *not* to use `canBecomeFocused` as this has implications beyond accessibility in the app 
There was a WWDC 2021 talk that could be useful
<https://developer.apple.com/videos/play/wwdc2021/10120> 
do you have any other documentation or videos? that video does not fully cover what we should do besides adding custom actions. also, please see my comment above.

we currently had an a11y audit on our app and this has come up. the team is having a hard time figuring out how to implement this properly 

--- 
> ####  UIKit apps depend on Dynamic Type to adjust their text size to be comfortable for different users. When these apps are brought to the Mac via Catalyst, is there a recommended approach to providing scalable UI text size given there isn't a "system text size" as with iOS and iPadOS?

Short answer: not really.

You could make your own text size slider in settings like Books that uses dynamic type under the hood. 
Users have a few AT options to help with this as well - Zoom, HoverText 

--- 
> ####  In the simulator, you can enable Full Keyboard Access in settings. However, I couldn't find a way to actually use it. Is it actually possible to test Full Keyboard Access in the simulator? And if so, how? Thank you!

This looks like it works to me in Seed 1 
I see! I haven't tried in Xcode 14, but it is something that wasn't working for me in the iOS 15.5 simulator, for example. So you just turn that switch on and it should work right? No other steps needed. Thanks for your help! 
yep looks like it. and then pressing tab on your mac keyboard moves focus 

--- 
> ####  Currently on macOS keyboard accessibility for views like lazy grids is difficult to implement compared to views like NSCollectionView, where you can get it for free. Things like navigation (moving selection) and multi-selection have to be manually implemented, which is a very difficult and heavy task (and easy to deviate from native.)  Are there any recommendations for how we as developers can tackle this or plans to make this easier?

Thanks for the feedback! We would love to hear difficulties that you encountered when implementing keyboard focus in lazy grids through Feedback Assistant.
We also have a new SwiftUI sample app Food Truck that introduces new features and improvements that you could check out
<https://developer.apple.com/documentation/swiftui/food_truck_building_a_swiftui_multiplatform_app>
In addition, you could also join the SwiftUI lounge and Q/A sessions to get more of your questions answered for SwiftUI :slightly_smiling_face: 
Hi Eric! By “keyboard accessibility” here I’m not just referring to keyboard focus, but what happens inside a lazy grid when you press the arrow keys (or tab, actually.) Or are trying to multi-select within a grid (Shift + Arrow Key, or Shift + Option Key + Arrow Key).

`NSCollectionView` and `NSTableView` can give you this out of the box (and you can see it in Finder or other native apps.) But this kind of keyboard accessibility — plus selection state handing — isn’t available in SwiftUI out of the box as far as I can tell.

Hopefully that clarifies my question! 
I hope we can make this more easier. We’d love a Feedback! 

--- 
> ####  My goal is to get visibility into the accessibility elements of a view and it's children. With UIKit, I am able to walk the view hierarchy in code and log all the accessibility properties of a view and it's subviews. What would be the equivalent with SwiftUI? The goal, given a SwiftUI view, log all the accessible elements and their properties.

Thanks for your question! In what context are you trying to get visibility into the accessibility elements? Specifically during debug or some of your app's functionalities rely on this? 
<@U03HEKAJJBF> Good question. I am writing XCTests that snapshot the a11y tree for a few use cases:
1. snapshot the tree to use for regression testing (this is the major use case)
2. identify elements that are missing a11y
3. identify elements that are candidates to combine a11y 
Thanks for clarification! We currently don't support introspecting view hierarchies in SwiftUI views from within your process. The closest tools we have for now are Accessibility Inspector, Xcode Previews, and View Hierarchy Debug.
We'd love a Feedback with your use case if you find you need more than what those tools currently offer :smiley: 
Ok. Unfortunately, the lack of introspection is preventing me from adopting SwiftUI since there is no way too automate a11y checks via XCTest framework.  

--- 
> ####  Were there any updates to the Accessibility Inspector this year?

We have some great improvements for accessibility audits on detecting non-accessible elements in Accessibility Inspector! Please try them and we are very happy to any feedback you have :smiley: 

--- 
> ####  How do all of the examples highlighted in this talk pertain to macOS Safari? Are the techniques all general enough to apply to web standard AX, or only to VoiceOver iOS, or only to VoiceOver on Apple platforms in general?

Everything we went over today is supported on macOS Safari, too (along with other platforms like Watch and TV)!

&gt; Are the techniques all general enough to apply to web standard AX, or only to VoiceOver iOS, or only to VoiceOver on Apple platforms in general?
These techniques definitely apply to assistive technologies of all types of Apple platforms. I'm not familiar with the level of support for these techniques in other browsers — <https://caniuse.com> might be helpful there. 
Thanks! 
The increment/decrement equivalents are accessible by touch or keyboard on macOS…. Look up Mac VoiceOver’s “TrackPad Commander” feature for touch gestures.

To _increment_ with a slider on macOS, you can use unmodified arrow keys in most scenarios. If the user wants to override the default key handling and force an “increment” they’d first “interact with” slider (VO+Shift+Down) and then increment (VO+Up or VO+Right in LTR languages contexts) 

--- 
> ####  Are there any specific guidelines for making interfaces accessibility in the context of embedded web views in native apps? Does WebKit/WKWebView offer any mechanisms separate from web standards to interface with VO for example on an iOS or Mac device?

There are not — accessibility in embedded webviews should, in general, work just as if you had the same HTML loaded in Safari. Just remember to use semantic HTML and / or ARIA attributes on the markup in your embedded HTML :slightly_smiling_face: 
Great, thanks. Good session, sorry you didn't have more Q&amp;A! Hope springs eternal ... 

--- 
> ####  We're now working on a cross-platfrom design system (including Web and Apple platforms). We want to use this project to elevate accessibility of our products and to maintain it at a high level in the long run. What accessibility standards/assistive technologies would you recommend to take into account while building a design system? Do you have any tips to make this project a success in terms of accessibility both on Web and on Apple platforms?

Big question! If I'm reading this right, then I would start with making sure your design system is able to make all components accessible to the same level as the native platforms 
Then you need to transmute those paradigms in your system to the native platforms 
This is very similar to what we did with Unity accessibility plugins <https://developer.apple.com/wwdc22/10151|https://developer.apple.com/wwdc22/10151> 
So there are Unity methods for everything from custom actions to dynamic type. Those get translated to the native iOS  
Thanks! :slightly_smiling_face: 
In addition to Chris' comments, I'll add:

&gt; What accessibility standards/assistive technologies would you recommend to take into account while building a design system?
<https://www.w3.org/TR/WCAG21/|WCAG> has a lot of really great guidelines. If your design system includes web technologies, there are automated tools to test some aspects of accessibility, like:

<https://github.com/dequelabs/axe-core>

These tools can be run in a CI pipeline, allowing you to catch and fix accessibility issues as early as possible.

As far as which assistive technologies to test, VoiceOver is a good one, since often (but not always) if a web app is accessible with VoiceOver it is also accessible with other assistive technologies. But you should still test others! Full Keyboard Access (and even general keyboard navigability) is a good one. Another one to test with is Voice Control. 
Thank you Tyler! I've just submitted another question precisely about automated testing solutions, just a second before seeing your reply! :slightly_smiling_face: 
Tyler 
Great minds think alike :smile: 
Also make sure your design system requirements account for the superset of all available accessibility features.

There are API equivalents for many of these, like `isReduceMotionEnabled` for native Apple platforms and `@media (prefers-reduced-motion)` in Web. Likewise `isDarkerSystemColorsEnabled` vs `@media (prefers-contrast: more)`

Not all features exist on all platforms though, so be sure to account for all in the design, and support the implementation where available. 

--- 
> ####  Search bars now usually do not require hitting "Submit" to search, the results get updated automatically along with the user typing in their request.   Would you say it's a good practice to make VoiceOver announce the number of results as the user types in their search request? Like "5 items found" or "No items found"?

Yes it should be announced but not immediately. There should be a period of quiescence so that your announcements are not interrupting typing feedback  
Thank you! 
You’ll get that announcement-without-interruption for free if you use an ARIA “live region” for the “5 items found” announcement. You don’t always need to use WebSpeech or SSML for general user interface notifications. 
We had a WWDC session cover live regions years ago, but it may be difficult to find now.

The incomplete gist of a live region is:

```&lt;div role="status"&gt;As the contents of this element are changed, screen readers will announce the new text automatically.&lt;/div&gt;``
`
 
A little more here: <https://www.w3.org/TR/wai-aria/#attrs_liveregions> 

--- 
> ####  Are there any solutions for automated testing of accessibility? Would you recommend Apple UI testing framework for these purposes?

I know Benjamin has read this in the thread above, but for posterity I'll post it here too:

<https://github.com/dequelabs/axe-core>

This tool (and others like it) can be used to automatically catch certain types of accessibility errors in your web apps, and can be run as CI pipelines to catch errors as early as possible. 
These tools don't catch every accessibility issue, so make sure to still test with actual assistive technologies like VoiceOver :slightly_smiling_face: 
May I humbly suggest my library for XC UI testing native iOS apps :slightly_smiling_face:
<https://github.com/rwapp/A11yUITests>
(obvs not endorsed by Apple in any way) 
Can't miss an opportunity to say thank you to you <@U03J4DPCXGC> for all your amazing work in this area! We refer to <https://mobilea11y.com/> a lot when it comes to accessibility on Apple platfroms! :heart: 

--- 
> ####  When adding support for dynamic type, are there any guidelines or recommendations on when it’s best to respect the system settings vs offering a screen scoped font size control?  For example reader apps such as Safari and Books offer independent font size controls vs Podcasts and Mail do not.   The pattern I see is apps or features where reading content is the primary experience (which I personally have used vs changing the system wide setting) - but from my earlier example Mail could  also be classed a reader app :thinking_face:  Thank you!

Good question! I think your intuition is right here. For longer form reading content, some people prefer to adjust font size on the fly, as lighting conditions change or their eyes tire. For apps that are not for long form reading content, these controls are really not recommended in my opinion. As of iOS 15, we have per app settings where users can set font sizes per app, and they can be adjusted quickly with our control center module. So users already have a way to quickly adjust text sizes on the fly should they require it. Users are expecting to open your app and see the text size they have set globally (or per app if they've adjusted it), so adding a second control to your app just introduces unnecessary complexity 

--- 
> ####  Is it possible to use attributed accessibility label features - language, spell out, phonetic notation, pitch etc - in SwiftUI? Thank you :)

Hi Rob, there are several `speech` modifiers available for use with Text in SwiftUI, like `speechAdjustedPitch`, `speechAlwaysIncludesPunctuation`, `speechAnnouncementsQueued`, and `speechSpellsOutCharacters`. For changing language, you can override the `locale` environment on a Text view and it should do the trick. 
Sweet, I have never noticed these before. Thank you! 
Also note that since iOS 15, `Text` can natively support attributed string via both new markdown syntax "`Text("this is **bold **")` and `AttributedString` . So if you use those it should also work 

--- 
> ####  When we started adding accessibility modifiers to our SwiftUI views we noticed that our XCTest UI tests got broken. The tree of elements changed - some UI elements impacted by accessibility modifiers became unaccessible/non-hittable.   We didn't find a way to use accessibility modifiers and keep all the elements accessible for the purposes of UI tests. Is it expected?   We ended up creating custom modifiers that would not apply accessibility modifiers in the UI test environment. Is it the best solution at the moment?

Thanks for your question! Accessibility modifiers do affect XCUITests because it may change accessibility elements tree. Currently your solution would be the best at this moment.
We'd really love a Feedback from your specific case! If you would submit a Feedback and attach your example to us, we can see how we could do better! 
Got it, thank you! 

--- 
> ####  is it possible to turn off the reading of MKMapView map POI in Voiceover?

Hi Lior, thank you for your question! It is not possible with MKMapView; however if you subclass it, you might be able to by overriding accessibilityElements. Give that a try and let us know! 
Thank you for your answer, will do! 
There are several OOTB accessibility elements that I wish to disable (f.e. Legal view) their voiceover, hopefully subclass will work. 

--- 
> ####  After an amazing Accessibility Design Review am busy cringe-testing with Voice Over.  I *think* this is an Apple bug, not mine - the permission alert on accessing the camera doesn't read out the text explaining *why*  Should I worry/fix?

Hi Andrew! If this alert is coming from the system, there shouldn't be anything you need to do to make it accessible. If you're finding it's not, please file a bug to us via Feedback Assistant. Note that the heading of the alert and the body are likely separate accessibility elements, and a user must move focus to the body in order to have it read, it won't all read automatically. This is by design 
After a solid half hour of testing, I *think* the problem may have been that it was iOS14 and/or it was my not understanding how to move through things with VoiceOver. I may have been doing a swipe *down* rather than left/right, to try to advance item. Anyway, I now am much more practiced at VoiceOver, have an even healthier respect for the people who designed it, and can not reproduce the problem.

(It's also really hard to reliably trigger the state of _Application has *not yet* been authorised for camera -_ if you reboot the device whilst the alert is in front, it defaults to being disabled, not left ambiguous!) 
Glad you were able to get more familiar with VoiceOver! 
Hah! I just replicated this and it was indeed my misunderstanding voiceover. I'll record a little video as a reminder but the _short version_ is:
1. I thought that _swipe down_ advanced to the next control
2. Whilst a *slow* swipe down will take you through the elements of the alert, a *fast* swipe down will move the focus from the title to the button you end up on, without _having time_ to say the sub-title 
I managed to trigger the application state on a test device where it would show this alert then another 10 minutes of playing around to realise the above sequence is what I'd been doing 
Hmmmm
I spoke too soon, maybe it's a thing about alerts.
The _swipe right_ for _Select the next item_ doesn't work in them. 
what happens when you swipe right? It should be a quick swipe to the right (a flick) and that'll move to the next item 
flicks up/down will activate whatever the current rotor item is 
OK, yeah I was trying to do that. I will have to get back to the state where the "Blah would like to access the camera" alert is shown and re-record with touches captured.

It _seems_ that accessibility swipe right behaviour indeed doesn't behave normally no that particular alert 
ahh Rotor was on Characters not Containers 
I'll dive into this with more testing when have more time and log an issue if I prove out a problem. I'm confused by the Rotor, now I have it appearing. There are a lot more options on <https://support.apple.com/en-au/HT204783> than I see. My rotor only has
Headings
Characters
Words
Speaking Rate
Containers 
The rotor options are dynamic based on the type of control you're on, but you can also add a bunch more in VoiceOver settings   

--- 
> ####  What is the recommended accessible way for infinite scroll in a feed?

Hi Shahla! I don't think there's a ton of special considerations you need to make for infinite scroll views. Assistive Technology users can typically discover and interact with these similarly to mainstream users. Just make sure that the content inside your scroll view is accessible! VO users can navigate via swipe and tap exploration as well. If you have specific questions about your scroll view as it pertains to accessibility, feel free to clarify your question here. :slightly_smiling_face: 

--- 
> ####  How to fix the issue about SwiftUI Textfield with too small hit area? <https://developer.apple.com/forums/thread/703257|https://developer.apple.com/forums/thread/703257>

This looks like a bug for Accessibility Inspector, I have reported this feedback to our engineers. Thanks for the question! 
<@U03HEKAJJBF>, but if we want a more significant hit area, the current SwiftUI didn't support it yet. Is that right? 

--- 
> ####  If I have a sectioned grid of items, what's the best way to expose those sections for easy navigation via Voiceover in SwiftUI?

Thanks for the question!

One thing you could do is to make sure the section headers have "header" accessibility traits via `accessibilityAddTraits(.isHeader)`

The second thing you could do is check out the `accessibilityRotorEntry` API to provide custom rotors for VoiceOver. This can allow VoiceOver users navigate your app more efficiently. 
Thanks Eric! 

--- 
> ####  If this is a good place to ask implementation questions, I have identified what's happening with the screen that was called out in my accessibility review lab. I have a Page Background page with a segmented control at the top and a bunch of stuff that is hidden depending on choosing Photo or Color background.  The visibly hidden items are not hidden from VoiceOver and so it's selecting them as you move through page items. How do I hide them from VoiceOver?

You can use `setAccessibilityElementsHidden` in UIKit or `.accessibilityHidden()` in SwiftUI
<https://developer.apple.com/documentation/objectivec/nsobject/1615080-accessibilityelementshidden?language=objc> 
Just looked at how my UIKit code works. I have a hierarchy inside my main view (xib)

```Swift
UISegmentedControl
UIScrollView
   UIView
       UIView backgroundImage
       UIView backgroundColor
       UIView backgroundShader
``` 

I'm just toggling `backgroundImage.isHidden` (etc) and relying on that to hide all the innermost controls 
what view contains the controls? 
you'd want to set accessibilityElementsHidden on the view that contains all the controls you don't want VoiceOver to see 
yeah I'm just trying that. Sorry for not being more explicit - the three named views in my little diagram contain all the controls (it's a complex screen, as are too many of the detail editors) 
Flicking between this and the alert thread ... I've actually replicated the lab problem as well and confirm you were right - it's speaking the "previous screen items" which is just weird.
*but*
have an added nuance from testing further (after adding the `accessibilityElementsHidden` code and then removing it)

If you tap the segmented control to change to the other elements being visible, VoiceOver is now correctly going through the elements of the page. Tapping it again to change back, it is still correct.

It seems that the explicit toggling of `isHidden` on the parent views is enough to fix things for VoiceOver *but* relying on the initial `isHidden` from the xib, at view load, is not. 
I'm loading these detail editor VCs with

```Swift
func hostVC(_ vc:UIViewController) {

        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }

        addChild(vc)

        vc.view.frame = view.bounds
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vc.view)

        vc.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        vc.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        vc.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        vc.didMove(toParent: self)
    }
``` 

--- 
> ####  Is there a list of the upcoming languages supported by VoiceOver? Also, can we have a way to programmatically ask the accessibility framework what languages are currently supported? We're running into an issue where in visual text we support Vietnamese, but VoiceOver doesn't. We'd prefer VoiceOver to use a fallback like English in that case.

So for this year VoiceOver will add support for Arabic (World), Basque, Bengali (India), Bhojpuri (India), Bulgarian, Catalan, Croatian, Farsi, French (Belgium), Galician, Kannada, Malay, Mandarin (Liaoning, Shaanxi, Sichuan), Marathi, Shanghainese (China), Spanish (Chile), Slovenian, Tamil, Telugu, Ukrainian, Valencian, and Vietnamese! 
To query a list of languages, you can use the `speechVoices` property on `AVSpeechSynthesisVoice`
<https://developer.apple.com/documentation/avfaudio/avspeechsynthesisvoice/1619697-speechvoices?language=objc> 
this will return you a list of all installed voices on disk. Note that a few of the new languages we are supporting do not have built in voices, so they will not show up in this list unless a user downloads them 
But you can basically iterate over this list and query the language property on the voice to figure out a list of languages that are available to the user 
:open_mouth: thank you so much! 
:point_up: <@U03HKTXJ4KE> and <@U03DQ584A76>! 

--- 
> ####  What are best practices for creating a VoiceOver experience for audio recording? Especially if that page includes things like countdown timers or textual prompts for the user?

I'd recommend you use announcement notifications for your prompts and countdowns. We do this in the "Hey Siri" training flow. Basically, whenever there is a prompt, we post an announcement notification, wait for the announcement to finish, and then start the recording session. When the next prompt is being read, we pause the recording. You can find out when an announcement is finished reading via this notification: <https://developer.apple.com/documentation/uikit/uiaccessibilityannouncementdidfinishnotification?language=objc> 
Thank you for the suggestions! 
I still remember the awesome djay Pro demo on iPad, pretty sure it was during the 2016 Design Award ceremony but sadly the video seems to have disappeared.
May be worth looking at their workflow to see if they have other ideas?
<https://www.algoriddim.com/news/267-djay-pro-wins-2016-apple-design-award>

As audio features are important to us, am also interested in ways to make this accessible (could have spent an entire day in that accessibility design lab!).

Would it make sense to use split output, with editing feedback via headphones and performance via speaker (or vice versa?). 
Thanks <@U03JELM0ZNV> - that's a neat reference I hadn't considered I'll definitely check it out.

Designing VO feedback specifically for headphones is definitely an interesting idea :thinking_face::thinking_face::thinking_face:  
That way we could use announcements to call out “30 seconds remaining” (or whatever) and give VO users some of the same countdowns. 

I think really short announcements giving feedback might work too. Just have to make sure they're really targeted &amp; not too distracting… 
(I work on an app for practicing public speaking, for context) 

--- 
> ####  Would the Assessment Mode entitlement be approved for an app that is not strictly administering an assessment, but where a valid use case can be made for programatically enabling Single App Mode for non-MDM devices? e.g., another use intended for teachers in a classroom to use with their students, or people to use in another public environment, that is not assessment-related?

Hey Duncan! I encourage you to explore options of supervising the device yourself using Apple Configurator or other device management tools.

If that doesn't work, I really like your use case and you should absolutely apply for an assessment entitlement. While I am not 100% positive on all of the requirements the review team goes though, I don't see harm in you applying!

Here is the direct link if you need it
<https://developer.apple.com/contact/request/automatic-assessment-configuration/> 
Ok, will do.

In this very specific case, while I don’t regard it as “assessment”, I could probably argue it is formative assessment… The basic format is a quiz that lets students see if they know the names of other kids in the class/school… kinda getting increasingly important as around here (New Zealand) we now have in some schools open-plan learning environments with 90 kids and three teachers. That’s a lot of new names at the start of a school year. 
The real reason for this is… gently… I think turning on Guided Access is a bit confusing for a user who doesn’t ready know what it is. So cutting through to helping the user trigger it as part of a workflow in-app would be amazing. 
I’ve got to run to a lab appointment. Thanks for the great work your team does. Super appreciate it. 
Guided Access requires manual intervention so I agree it doesn't sound perfect for your use case. Autonomous Single App Mode seems more appropriate here. Thanks for hanging out in the lounge with us, enjoy your lab! 

--- 
> ####  I was playing with guided access today and noticed "Time limits" in guided access settings. It only lets me set a sound for a time limit ending. How do I set duration for a time limit?

(for autonomous single access mode, where guided access is entered by triple tap) 
Hello Jaime! :wave::skin-tone-3: When you triple-click to bring up the Guided Access "workspace", you can set the time limit in the options menu there. 
Got it! Thank you 
We have those options in the Guided Access workspace because you may want a different time limit depending on the app, and we want it to be easily accessible rather than making you head back to Settings. Thanks for your question! :smile: 

--- 
> ####  How do I find the "Work space" on my iPhone (so I can set a time limit)?

Hey Thomas, first turn on Guided Access in Settings &gt; Accessibility &gt; Guided Access. Then open the app which you want to lock on to. Then triple-click to perform the accessibility shortcut. Depending on your device, it may be the home button if it has one, or the sleep/wake button. This is where you configure options for Guided Access before you begin, and Time Limit is an option in this menu. 
Here is more information about the Accessibility Shortcut in general if you'd like to know more <https://support.apple.com/en-us/HT204390> 
Got it. Big thanks! 
Time-limit is pretty cool; :slightly_smiling_face: 

--- 
> ####  Do you have any favorite apps that use autonomous single app mode?

I don’t know if I would call it a favorite, but we do see a organizations making testing apps use ASAM mode effectively. When the test time starts, the device locks down, then releases access at the end of test time. There’s an 8 hour limit on ASAM mode, so it can’t be run forever either 
I’m thinking more is there an app you think of that does well in guiding someone in using ASAM for the first time, or one that is clever in how it handles restrictions for guided access 
Ah, sorry. I do not know specific apps 

--- 
> ####  Is there a way to test more advanced accessibility features using XC UI tests? eg custom accessibility actions, custom accessibility content, custom rotors?

Thanks for the question <@U03J4DPCXGC>! We don't have a great way to test this in XCUITests at the moment, but please file a request for this through Feedback Assistant! 

--- 
> ####  Who uses "Automatic Assessment Configuration"? Do teachers comfortably use it or is it only for IT?

Apps that implement the Automatic Assessment Configuration frameworks can create easy-to-use UI to enter a testing session for folks like teachers to use. We also offer wide-scale solutions for teachers managing a classroom full of devices called Apple Classroom. 
There is a lot of information about this topic, more can be found at the link below and I recommend watching past WWDC sessions about assessment mode in particular if you are still interested.

<https://support.apple.com/en-us/HT206151> 

--- 
> ####  In an iOS app, I have a status label in the UI but it's too long and changes too quickly to be appropriate for VoiceOver. Instead I want to announce the beginning and end of a long process, e.g "Preparing ...", "Completed ..." to VoiceOver (triggered by a user action so not out of the blue). What would be the API to trigger such announcements?

you can post an announcement notification using `<http://UIAccessibility.post|UIAccessibility.post>`, and passing in a notification type of announcement, and a string that you want to have spoken 
<https://developer.apple.com/documentation/uikit/1615194-uiaccessibilitypostnotification?language=objc> 
<https://developer.apple.com/documentation/uikit/uiaccessibilityannouncementnotification?language=objc> 
Perfect. Thanks! 

--- 
> ####  I'm building a drawing app using PencilKit. What kinds of things can I do to make it accessible using technologies like VoiceOver? Is PencilKit going to do a bunch of heavy lifting for me in a situation like this?

Any UI that you're getting from PencilKit should get AX for free, like the palette controls etc. As far as accessibility work for the canvas, you'll need to asses what your users are going to use your app for, and build in accommodations around those use cases. Maybe that's announcement notifications if you're doing some sort of guided drawing to tell people if they are on track. It's always good to talk to blind users of your app if you can, and see what feedback they have. If you have more specific questions, feel free to post a question on the developer forums and tag it with accessibility, as the lounge closes soon! 
