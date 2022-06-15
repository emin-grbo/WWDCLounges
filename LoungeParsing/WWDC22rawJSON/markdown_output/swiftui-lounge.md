# swiftui-lounge QAs
#### by [FeeTiki](https://twitter.com/FeeTiki)
---

--- 
> ####  Great session and thank you for all the new features! But, most importantly, was the cake as nice as it looked!?!?!?!? :D


Yup! It was chocolate, and delicious. We had some deleted scenes with the sliced cake, but we don't release WWDC Bloopers and Deleted Scenes unfortunately

--- 
> ####  Thanks for so many great improvements!  Are any of these changes back-deployable to previous OSes (e.g., like the new Section initialisers were last year)


Not this year!
Last year we had some nice syntactic refinements that we were able to back deploy, but many of the features this year require fundamental new support in the OS.

--- 
> ####  What is the best venue to ask SwiftUI questions during the year? Swift Forums is amazingly useful for Swift language and library questions, with many of the implementers frequenting it, but it is focussed solely on the Swift language itself. Is there any comparable place where y'all converse during the year?


The developer forums are a great place to ask questions! We monitor them throughout the year and reply when we can, and so do other members of the community!

I’ve queued up a year’s worth of questions for my 30 minutes in the lab :slightly_smiling_face: but this week is a bit overwhelming with all the new stuff too to make much of a dent.

What I've appreciated more about the Apple Developer Forums is that engineers who work on the relevant frameworks will come in with their expertise.

There's also full-year lab-style code-level assistance from <https://developer.apple.com/support/technical/|Developer Technical Support> to facilitate your SwiftUI questions.

Don’t be worried that you’ll “waste” your DTS contacts!

When DTS confirms that the issue raised is a bug and a bug is filed by the developer, would it make sense if DTS can mark it as a verified bug so that it gets the attention of the relevant team?

DTS commonly elevates that feedback to the engineering team.

We have a fantastic partnership with DTS. They’re just the best!

Apple Developer Forums have lots of unanswered questions, especially the complex ones / edge cases. Also, there’s sadly little engagement from the community as a whole, so if an Apple engineer misses the question, you’re out of luck.

Not sure I've ever seen a good answer on the Apple Developer Forums but I've seen my own questions asked w/o any answers many times. The results there are so low that I've never asked a question there myself. It doesn't seem useful.

You’ll never get an answer if you don’t ask. :slightly_smiling_face:

--- 
> ####  With graphics and custom layouts being added, when should we use native elements vs custom styling? How far should custom designs go?


It entirely depends on your use case! We ultimately trust your sense of design on this one since only you know what’s right for your app. To give some general guidance though: Take native elements as far as you can, and if you find you need further customization beyond that to finely polish the experience, then don’t be afraid to use it!

One quick disclaimer: It can be easy to drop to custom layouts prematurely. Stacks and Grids are incredibly powerful already, so be sure you can’t get what you need with them before you use the new layout protocol. (edited)

--- 
> ####  I saw that VStack and HStack conform to Layout. Does that mean using an if-else to switch between the two with the same content will now animate the change?


Yes!

To animate between layouts you'll need to switch between the layouts using `AnyLayout`  for example:

```
let layout = isVertical ? AnyLayout(VStack()) : AnyLayout(HStack())
layout {
    Text("Hi")
    Text("World")
}
```

Check out the Compose custom layouts with SwiftUI talk tomorrow for more details!

Looking forward to it. Thank you!

This sounds great!  Looking forward to getting rid of some UIStackViews

These kinds of examples will be in the code snippets soon too! Both that table layout code, and the grid morphing to a scattered layout will be included

--- 
> ####  Hi great stuff so far. Thank you! I was wondering if there are any updates, or opinionated best practices when it comes to large scaled applications using SwiftUI in terms of state management and dependency management/injection. Thanks :v:


SwiftUI is not opinionated on a specific architecture for state management. We offer the building blocks to build whatever best fit your use case.

It might be good to sign up for a lab so that we can discuss the specific of your use case and give you targeted advices

I tried signing up for a lab and was denied. It seems the demand is too high for what you guys are able to provide. That is an absolute shame

You can also try the DTS Open Hours labs, and I can help you there as well.

That's the one I signed up for... and was denied

There are DTS labs throughout the week, so you may have missed the first set of appointments. There are still many more openings, though!

It would be great to capture your use case in Feedback Assistant before the labs as well, so we can get started quickly or can follow up after the conference, if needed.

I was hoping to have some type of lab each day. Having requested that one and then denied, precluded me from requesting any other lab for the day. It's frustrating. I don't know whether I'll get a single lab in this week at this rate. I'll try and use Feedback Assistant like you said, but I don't know about using it in this way... I've only ever used it to send bug reports and feature suggestions. This would be entirely different. I'm new to WWDC this year, and so far this has been a soured experience

--- 
> ####  Thanks for the great session! Talking about Charts, will it be possible to add a gradient color filling the area underneath the line in a line chart?


It is! I made one like this while putting the talk together, I can't remember exactly how I did it. I may have used an `AreaMark`

that fills the area under the line, and they also stack to make some really cool area charts

When you're making those kinds of charts, using `Color.clear` as a part of your gradient makes the Chart look a lot neater in light and dark appearances IMO

Thanks a lot! This will enable me to migrate from my custom made charts to SwiftCharts in my existing app! :heart_eyes:

I have to say, it's extremely fun to see how quickly you can make custom-rolled charts from various apps in Swift Charts. Like a speed run, only with accessibility, dynamic type, and localization built in

There are several sessions about SwiftCharts as well! Definitely check them out.

--- 
> ####  Where's this SwiftUI party at? And don't tell me the cake is a lie..


The cake was baked locally in San Francisco, and we even piped the SwiftUI bird on there ourselves! Using the new `.frosting(.blue)` modifier

That is not real ^

The cake is, in fact, not a lie. :birthday: <@U03HL00QL68> made it!
And the SwiftUI party is everywhere that you’re using SwiftUI. Celebrate with us. :partying_face:

Can we file feedback for a `.frosting()` modifier? Maybe it could wrap PencilKit or something. And make sure it tastes delicious, too.

File that along with an enhancement request for a replicator. I need iOS to replicate the cake on demand. :smile:

Is it an Apple cake?

The cake will be sold in exactly 0 Apple Stores

--- 
> ####  Does Grid replace VGrid?


`LazyVGrid` and `LazyHGrid` arrange their children lazily and so are great fits for large amounts of content within a scroll view

`Grid` requires all of its children be loaded up front and because of that has some powerful features that the lazy grids do not

Yeah, check out the Composing custom layouts with SwiftUI talk tomorrow for more info

--- 
> ####  Is there any new control in SwiftUI like the NSSegmentedControl used under tables to add / delete a row? This is a common pattern in macOS applications and the current SwiftUI segmented control does not fit to this use case.


Good news: There’s not a _new_ control, but an old one :smile:

Last year we introduced `ControlGroup`  that enables building these kinds of controls (which you might have used `NSSegmentedControl` for with AppKit).
You can create one with Buttons, Toggles, and more!

Nice, didn’t know about this one. Will try it out. Thanks! :thumbsup:

--- 
> ####  What is the difference between .onChange and .onReceive modifier.? ".onReceive is like a combination of .onAppear and .onChange", is this the complete and accurate picture?


`onReceive` is specifically to subscribe to Combine’s `Publisher` types and produce a side effect.

`onChange` is used to produce a side effect when a property of your view changes. For example you can use that to produce a side effect when the scene phase in the environment changes.

Okay, thank you for the explanation! If I use both .onReceive and .onChange on a Published property, will there be a difference in behaviour and is one recommended over the other in this case?

It really depends on your use case: Is the value equatable? Is it a lightweight event? Does your view have constraints to adhere to, such as de-duping, debouncing, exponential backoff, etc.

--- 
> ####  Curious if there's updates related to UI testing in SwiftUI apps? Or should I be thinking more in terms of testing the model layer that drives the declarative UI?


Our recommendation is still to thoroughly test your model layer. In my experience, the best SwiftUI apps move their logic into model code, using SwiftUI as a declarative mapping from that model state to views. Then your tests of the model layer are effectively tests of the resulting UI as well :slightly_smiling_face:

--- 
> ####  Is it possible enumerate a NavigationPath or replace certain elements?


It’s not currently possible to enumerate a `NavigationPath`. Because it’s type-erased, the elements could only be exposed as `any Hashable` so  aren’t directly useful.

Generally, if the set of things that can be added to a path form a closed set, which would be the case if you can usefully enumerate it, I’d recommend wrapping your presented values in an enum with associated types.

I’m wondering if having a mutable collection of enum values might be generally more useful than using a NavigationPath.

Snap!

Then use an array of that enum instead of NavigationPath.

Sounds like that could work better and might fit nicely with some form of Coordinator-esque style pattern.

Thanks!

--- 
> ####  Terrific updates all around! When animating the `Font` on a Text, when can we expect the font to smoothly interpolate instead of crossfade?


Generally changing weights and sizes of the same font will interpolate, but not changing fonts

--- 
> ####  Is it possible to set default focus on TextField when it appeared first time? Without workarounds with delay?


Yeah, checkout the new `defaultFocus` modifier!  :smile:
<https://developer.apple.com/documentation/swiftui/view/defaultfocus(_:_:priority:)>

--- 
> ####  Does the new NavigationSplitView preserve state when we switch to a new navigation destination like tab bar in UIKit, or do we need to roll our state restoration, like what we had to deal with using the old TabView?


If you want to switch to a TabView in narrow size classes, you’ll want to design a navigation model type that provides selection information for the NavigationSplitView in regular size classes and a different projection of the same information to a TabView that’s shown in narrow size classes.

I’d love Feedback with specific use cases. I’m very interested in making this easier.

--- 
> ####  Does Transferable also support asynchronous behavior like NSFilePromiseProvider, e.g. if you do not have an file URL yet (e.g. cause a file first needs to be downloaded from a web server, but only when the drag operation ends)


Definitely, the `FileRepresentation` transfer representation does what you’re describing. <@U03HW7P2WTB>’s amazing talk “Meet Transferable” will be out with more detail tomorrow ( June 8 ) :smile:

--- 
> ####  What is the correct way to implement invalidation when conforming some type to `DynamicProperty`? Should hosting another builtin `DynamicProperty` enough? Are these wrapped properties like @State or @ObservedObject guaranteed to work as expected in `DynamicProperty`?


Dynamic properties are fully composable, so any other dynamic properties you use inside of their declarations will be picked up on and invalidated properly. That means supporting invalidation as you would expect is often just a matter of utilizing the support already built into other dynamic properties, like `@State`

--- 
> ####  How can I hide the disclosure indicator for a NavigationLink within a List? For example, if I was wanting to implement the built-in Reminders app with the grid icons in the List header.


Hi, Christian. The disclosure indicator isn’t currently customizable.

With the new `NavigationStack` and path binding, you can use a regular Button and append your value directly to the path.

I’d love a Feedback about your use case for hiding the indicator though!

Ooh. Appending directly to the path is gonna be super helpful. 

Yep, I think appending the path is the best solution. Thanks <@U03HW7P0HQR>. This is an example of the use case, mimicking the Reminders app. Noticing the disclosure indicators at for `All` and `Today`.

Submitted as `FB10082608`

--- 
> ####  Hello everyone! I'm amazed by the new text animations, can we animate text with any font? Does the font need to respect some criteria? Thank you!


Yes, you can use any font.

Thanks a lot!

However, you can't go from one font to another

or animate from one font family to another. For example, italic to non-italic will not animate

Clear thanks, how about variable fonts that can change weight?

I mean if I use static fonts (that have one file for bold, one for medium etc…) I suppose I cannot either change weight becas

*because it would be another font family, right?

Correct, I wouldn't expect that to ~work~ animate

--- 
> ####  Hi, is there anything different visually, to the user, between a NavigationView and a NavigationStack? 


They’re both structural components, but they do behave a bit differently.

Can you elaborate in what way they behave differently? 

`NavigationView` renders differently depending on how many views you pass to it and what navigationViewStyle you set on it.

`NavigationStack` takes a single root view and always renders as a stack.

Gotcha, thanks for the clarification :) 

--- 
> ####  When opening the Control Center via the Menu Bar Extra, the button remains highlighted while the Control Center is visible. Is there a way to replicate this using the new MenuBarExtra API?


Hi - thanks for the question! I think this is likely just a bug with the framework at the moment, and that it should behave similar to Control Center by default. If you could please file a feedback for this, I'd appreciate it.

Thanks for your response. Honestly, I have not tried the new API yet, I just saw the behavior in a WWDC session video. I will try it once I have installed the beta and will file a feedback if necessary.

Excellent, thanks!

<@U03HHJH9C66> FB10086096

--- 
> ####  Is it possible to reorder items and insert into an outline group?


SwiftUI doesn’t have much in the way of automatic support for that, I’m afraid. I’d love a Feedback with details of your specific use case.

We did expose public API for `disclosureGroupStyle` this year, which might be worth investigating.

The use case would be a sidebar that the user can organize on their own.

I was thinking this could be a normal list, but there a limits with cross-section item moves that I end up tripping over. 

Makes sense. With the current API, I’d use a view model that vends the items as if they are a flat array, then style the items based on their apparent depth. That would let you use `onMove` or the awesome new editing support on `List` to update your view model.

Yeah, I think biggest trick there is figuring out that “offset 20” is actually “offset 2 of parent 4” or something like that.

Thanks for your input. It's not the first time I've read this solution, and since there's nothing new in this area for 2022, I think I may need to take the plunge and go for it.

--- 
> ####  Pages and Numbers are both document-based apps which have a beautiful onboarding experience. How do I build such an onboarding experience for my document-based app using SwiftUI?


Hi - this is a great question! While we do not currently have a high-level concept in SwiftUI for this type of flow, it may be possible to combine the  new `Window` scene together with the new `OpenDocumentAction` and `NewDocumentAction` to create it. You would need to define the `Window` as the primary (first) scene in your app, however. It's possible there may be some drawbacks to this approach, so I'd love a feedback for an enhancement in this area.

Thanks for the idea. I'll try!

--- 
> ####  I currently use NavigationView in my app with NavigationLink to go from parent view to child destination view. It works fine for what I want. Do I need to migrate to using NavigationStack in my case, especially if I’m just linking to destination views and not needing to link by value?


`NavigationView` is only soft-deprecated and so will continue to work fine in all its existing use cases with no compiler warnings. If writing new code, however, we recommend you start using `NavigationStack`.

Ok. So `NavigationStack` with a `NavigationLink` to a destination view will work the same for me?

Yup!

--- 
> ####  ViewThatFits has some strange effects when the size is animated.  Is it intended to work with animation or should it be avoided?


`ViewThatFits` should support animations, could you file a feedback for this one and share right here?

( hi <@U03HL00QL68> :wave: )

Will do

Hi Christian!

FB10082380

--- 
> ####  On iPadOS in a NavigationView, Is it possible to switch between two column and three column layout depending on what is selected in my sidebar?


It isn’t possible to do that directly.

Often those style of UIs can be built by swapping the view in the detail area between a single root view and an HStack with two-elements.

That is, instead of conceiving of it as a two or three column `NavigationSplitView`, think of it as a two-column one, where the detail column itself has one or two columns.

Great, that's exactly what I'm doing now. It's working fine, just a little extra work to coordinate with my compact view. Thanks!

Awesome! I’m glad you found a solution.

--- 
> ####  Is there a better way to prevent DynamicProperty from invalidating a view’s body based on different criteria? I am currently doing this with a private ObservableObject backing that manages its objectWillSend calls, which seems to works well but also feels like I am doing some backflips (the context is being able to scope in on specific changes on an ObservableObject model for performance reasons).


There is no direct way to prevent `DynamicProperty` from updating.

What you are doing is a way to do it. If the purpose is to manage `ObservableObject` invalidation I would suggest consider refactoring your model into multiple model.
Keep in mind that you can also implement your own `objectWillChange` Publisher.

Makes sense. Thanks!

--- 
> ####  Previously in NavigationView on iPad, the detail view would be displayed with the ForEach list being collapsed in a sidebar. With the new NavigationSplitView, can I use a modifier to not collapse the ForEach list?


Thanks for the question. `NavigationSplitView` takes a `columnVisibility` binding. You can set it to `.all` to reveal all the columns programmatically!

Great, thank you!

--- 
> ####  Is it possible to use SwiftUI Navigation for iOS 15? How can we transition to it on the existing project?


To learn how to transition your existing projects to the new navigation types, see this handy migration guide: <https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types>

Annnnd add to reading list. Thanks!

--- 
> ####  Hi Curt, in your talk you used objectWillChangeSequence but I can't find it in the new Xcode beta, where is it? Thanks


Hi, Malcolm!

That’s a method that I implemented on my NavigationModel but didn’t fit into the slides.

Ok thanks

It’s in the Copy Code for the talk accessible in the Developer app though

I think you can use `for await _ in store.objectWillChange.values` in a similar way?

That’s close, Christian!

You have to buffer the values too.

```
    var objectWillChangeSequence:
        AsyncPublisher&lt;Publishers.Buffer&lt;ObservableObjectPublisher&gt;&gt;
    {
        objectWillChange
            .buffer(size: 1, prefetch: .byRequest, whenFull: .dropOldest)
            .values
    }
```

Great thanks, for some reason the copy codes aren't appearing for me

Bummer.

There’s also a sample app with similar code: <https://developer.apple.com/documentation/swiftui/bringing_robust_navigation_structure_to_your_swiftui_app>

The sample app is a little more complex than what I shared in the talk.

<@U03HW7P0HQR> Instead of `objectWillChangeSequence` would it be possible to use `onChange(of: perform)` to track any selection changes and update `@SceneStorage` data variable?

Yep. That approach will work too.

I used `task` in the talk so the restore and save code was in one block, but splitting them into separate `onAppear` and `onChange` should also work.

--- 
> ####  How does ViewThatFits decide if a view fits? I find it a bit strange that Text with a line limit of 1 still "fits" even if it's truncated for example.


`ViewThatFits` consults the view's ideal frame size for both dimensions.

The latter behavior isn't intended. A feedback # and keeping an eye on later seeds is a good strategy here

Adding a fixedSize(horizontal: true, vertical: false) seems to fix the issue but also seems unnecessary. I’ll file a feedback

FB10082577

2 for Ryan :slightly_smiling_face:

--- 
> ####  Does Swift Charts have a way to highlight values on a line chart  for a specific X position?


There's a Swift Charts Q&amp;A at 11am PT on Thu. Please ask there!

In the meantime, you can always try drawing an additional mark for the highlight.

Its possible to modify the `.foregroundStyle` to have a different color per X position, it depends on what kind of highlight you want to call out. It might be possible to do an annotation as well but the charts team will be the experts!

The Build a Productivity App for Apple Watch talk, coming tomorrow, has an example of exactly that!

<https://developer.apple.com/wwdc22/10133>

You can use `PointMark` (possibly with annotations) to highlight values on a line, such as:
```
Chart {
    // Create the line.
    ForEach(data) {
        LineMark(
            x: .value("X", $0.x),
            y: .value("Y", $0.y)
        )
    }
    // Highlight a point.
    PointMark(
        x: .value("Highlight X", 10),
        y: .value("Highlight Y", 50)
    )
    .foregroundStyle(highlightColor)
    // You can also add textual annotations to the point:
    .annotation(position: .top) {
        Text("Highlight")
    }
}
```

I am sorry for not being clear. What I want is having a vertical line when I tap on a specific X position so that all datapoints on that X position are highlighted.

You would decompose the problem into 1) using a chart proxy to get the x position for a tap and 2) highlighting the data points at that x. The lollipop tooltip we have in the Swift Charts sample app may be a starting point to look at.

--- 
> ####  Is there a way to access DragSession from DropDelegate (like UIKit)?


Hi Harry, this API is not available. However, we'd be interested in learning more about your use case here. Could you please explain your scenario and the expected behavior in <https://feedbackassistant.apple.com|Feedback Assistant> for the SwiftUI team to consider for a future release?

Will do
One primary use is to determine if the drag started from the same app (either same view or from another scene)
The other reason is to use that to pass data (where NSItemProvider works but is async and may be out of order)

This could be semi-related, but at the moment if a drag begins and ends without any movement (i.e. you let your finger go immediately after the drag was activated) there’s no communication back to the app. So, for example, if the drag trigger activates a specific UI state, then when the drag is released, it won’t be de-activated because it considers the drag to still be (incorrectly) active.

Yes, I think both of these use cases should be captured as feedback. Providing context like this is very helpful in prioritizing new features. Thank you, both

--- 
> ####  how can i get simething similar to autolayout priorities, of being able to have 2 views in a stack equal but only up to a certain width


You can pass any kind of information you like to an adopter of `Layout`.  So that "certain width" could be passed to the instance of the `Layout` itself. And the layout priority can be provided via the subviews proxy of `Layout`.

In the swiftinterface file there is discussion of this:

```
/// Views have layout values that you set with view modifiers.
/// Layout containers can choose to condition their behavior accordingly.
/// For example, a built-in ``HStack`` allocates space to its subviews based
/// in part on the priorities that you set with the ``View/layoutPriority(_:)``
/// view modifier. Your layout container accesses this value for a subview by
/// reading the proxy's ``LayoutSubview/priority`` property.
```


You can see the rendered version of that text in the docs under the heading “Access Layout Values”: <https://developer.apple.com/documentation/swiftui/layout>

Thinking about this more....

Reasoning about this in terms of autolayout might make things tricker than they need to be, especially for 2 views.  For instance you could instead use a custom `LayoutValueKey` to say that View A should take 70% of the proposed size, and View B should take 30%.

Rough sample code:
```
MyCustomLayout(widthThreshold: 300.0) {
    viewA.oversizedWidthPercentage(0.7)
    viewB.oversizedWidthPercentage(0.3)
}
```

i was thinking something more like breaking "constraints" due to certain conditions based (if possible)

Is there something similar for simple Views? E.g. a view which calculates its required height based on the available width. What's the best practice to solve something like this?

--- 
> ####  What's the intended use for `DynamicProperty`'s `update()` method? It seems most of the time the `DynamicProperty`'s members are `@State`ful objects managing their own state and using `update()` with them requires a dispatch async (to the next runloop cycle).


You’re definitely correct that the state management dynamic properties do is usually handled using their own sub-dynamic properties, and custom logic! The update method is called directly before the corresponding view’s `body` is called, and is more a place for any logic that needs to happen before body runs to occur.

So, for things that I assume are not stateful in nature, just derivates of the state?

That tends to be the case. That said, there may be some examples of property wrappers that use information about when the view is rendered to drive stateful systems. When debugging, I’ll sometimes use a `DynamicProperty` with an `Int` `wrappedValue` that increments whenever the surrounding view’s body is drawn, for example :slightly_smiling_face:

That’s a neat trick! Thanks for sharing and for the answer!

Of course! Thanks for the question!

--- 
> ####  Can we set the NavigationPath from onContinueUserActivity and onOpenURL?


Hi - great question! This is certainly something you can do, and is a good example of how you can support something like deep linking, for example, by parsing the URL provided to onOpenURL and using it to construct your navigation path.

--- 
> ####  Is there a way to show a preview of a view when the user taps and holds on a NavigationLink (similar to how a website is previewed when holding on a link in Safari)? I tried using the contextMenu modifier, but it only seems to render Button views.  NavigationLink( ... )     .contextMenu {         ViewIWantToPreview() // is not previewed         Button { ... } // other options show correctly     }


Yes, use the new `contextMenu` overload that accepts a preview view.

```
NavigationLink( ... )
    .contextMenu {
        Button { ... }
    } preview: {
        ViewIWantToPreview()
    }
```

Wow, handy. Nice work!

Thank you, this seems to work quite well! This was one of the things I was stuck trying to figure out for a while while making my Swift Student Challenge submission (and ultimately never figured out :sweat_smile:)

Here’s some more detail on that new modifier: <https://developer.apple.com/documentation/swiftui/view/contextmenu(menuitems:preview:)>

Can I have the user tap the preview to open another view (the “full” view) as well? I'm playing around with it in Xcode previews and it seems like tapping the preview just closes the context menu.

No, it's not currently supported— please file a feedback request.

Alright, done! FB10083104
Thanks for the SwiftUI improvements this year by the way, they've been great!

--- 
> ####  Hello! Thank you for amazing sessions! I am curious is it possible to navigate from SwiftUI view to UIViewController.   Is it possible to pop out from the SwiftUI view  back to UIViewController? 


I’m glad you’re enjoying the sessions!

You can push a `UIViewRepresentable` onto a `NavigationStack`, and use that to wrap a `UIView`.

That works with the view-destination `NavigationLink`s inside a `NavigationView` as well for previous releases.

--- 
> ####  Hello all, i believe this is the channel for this question. I’m wanting to get your take on how SwiftUI’s data flow can change how we architect our apps? It seems as if, with EnvironmentObjects, ObservableObjects and possibly more, they change where you get your data from, which could cause variations in, let’s say MVVM. What do you guys think is a good way to make use of these property wrappers and could it change how we architect things? Thanks!


The data flow primitives we provide in SwiftUI were designed to be agnostic to the way you design your model. Think of them less as parts of a specific design pattern and more as tools to allow you to hook your model (however you think it would be best designed) into SwiftUI.

If you want more information on this, I recommend you check out the fantastic talk by my colleagues, Raj, and Luca: <https://developer.apple.com/videos/play/wwdc2020/10040/|Data Essentials in SwiftUI>

Thanks for the response, that’s an excellent way of putting it. It’s definitely difficult explaining this to an Android developer who relies on older “architecture” or design patterns. This will probably help a lot. I’m not sure if this would be good to add here, but i created some SwiftUI pattern i think could be beneficial for my team and it leverages wrappers. The thing is, it’s difficult convincing others that it could work since this is how SwiftUI handles data flow. I will definitely check out this video though, this is what i was envisioning too, maybe you can provide some feedback if any:

Providing feedback on specific designs is hard to do in this venue, but definitely sign up for a lab! They tend to do better for long-form discussions / questions.

Great! I will sign up for the SwiftUI Lab thanks.

<@U03HKVDCL7N> Is there any session explaining how to debug SwiftUI views (techniques such as `Self._printChanges()`)?

Sometimes I notice `@96 has changed` being printed but wasn’t sure which dependency was responsible. I suspect it was `@FecthRequest` but wasn’t sure

There is the SwiftUI Lab which i think would be best fit for any SwiftUI in depth question. You can check it out here: <https://developer.apple.com/wwdc22/labs-and-lounges/dashboard/upcoming?q=SwiftUI>

Fingers crossed it gets accepted, i have a lot of feedback IDs and doubts :slightly_smiling_face:

--- 
> ####  What is the best way to resign (text field) focus from some distant view in the view hierarchy. `scrollDismissesKeyboard` is a great step in the direction I need, but I'd like to programmatically trigger that same behavior, for example, on some button tap.


For example, looking at ways to replace this code:

```
UIApplication.shared
       .sendAction(#selector(UIResponder.resignFirstResponder),
                        to: nil, from: nil, for: nil)

// as an action to perform on a view:

extension View {
    func resignFocus() {
        UIApplication.shared.sendAction(...)
    }
}
```

You can do this with the Focus State API: <https://developer.apple.com/documentation/swiftui/focusstate>

You want to bind a focus state property to your text field using `View.focused(_:equals:)`, and then set the binding's value to `nil`/`false` from your button action as a way to programmatically resign focus and dismiss the keyboard when the bound text field has focus.

Making the action available to distant views is a matter of arranging your app's data flow appropriately. There's no single answer, but for example, you could declare your focus state property on your scene's root view and pass a reset action down to any descendant views that need it. Or if the action is created by a leaf view, you can use the preferences system to make the action available to ancestors.

Preferences is an interesting idea. Trying to make the focusstate “globally accessible” was challenging. I’ll give these suggestions a shot! Thanks.

--- 
> ####  Not sure if this was already asked before since it's such a common question. But, what's the recommended way to use a `@ViewBuilder` for custom components: calling it right away in the `init()` and storing the view, or calling it later inside the `body` and storing the view builder itself?


We’d generally recommend resolving it right away and storing the view

Thank you, much appreciated!

Storing the view will have better performance than storing a closure (potentially avoiding allocations).

Of course, if you need to dynamically resolve a view from a closure (such as if it takes parameters), then storing the closure is also fine!

Is this the same for Layout? The example code for AnyLayout shows creating a layout in the body instead of in the View.

You can now (last year?) also declare the viewbuilder as just a property. In SwiftUI 1, you had to manually implement the init, but no longer needed. Best (IMHO) to use synthesized init when you can.

```
struct MyView&lt;Content: View&gt;: View {

    @ViewBuilder var content: Content

}
```
(I believe is the correct code, coding from memory)

Yes you can attach `@ViewBuilder` to properties!

You can actually support it on both view and closure properties, depending on whichever you need:

```
struct MyView&lt;Content: View&gt;: View {

  @ViewBuilder var content: Content

  // or

  @ViewBuilder var content: (Int) -&gt; Content

}
```

&gt; Is this the same for Layout? The example code for AnyLayout shows creating a layout in the body instead of in the View.
Apologies, not sure I fully understand the question. Just in case: creating views in `body` is fine, we’re specifically talking about _stored properties_, and storing views versus closures for creating views.

Sorry not sure if this is not the right place to ask this.
When a view uses `ScrollViewReader` and the parent view’s state changes, the the child view gets reloaded and the scroll position in the child view changes. This happens only when `scroll(to:)` has been executed. I have filed a feedback `FB10037533`

Talking about this, can you confirm it’s best for performance to have the @ViewBuilder be a computed (lazy ?) var than a function in my View struct whenever possible?

BTW there is a 3rd-party article explains why the view is preferable than the closure <https://rensbr.eu/blog/swiftui-escaping-closures/> (If you don’t mind posting 3rd-party article)

--- 
> ####  When using the Layout protocol, is it possible to resolve an alignment guide for the layout container, not a subview, to align the subviews relative to the container correctly? For instance, a Layout that proposes size (100, 50) would resolve HorizontalAlignment.center to 50 (if unmodified). If not, what is the correct way to do this?


You may be able to use the `alignmentGuide` modifier to define how an alignment guide for a view will resolve

My goal is to get the CGFloat value from the container view for its own alignment guides in the placeSubviews function. (Specifically, to do a layout similar to VStack where the children align in the left middle or right)

Well, you get the bounds of the region that you are laying out inside of, so you can know the midpoint in each dimension, for example

You can also set explicit alignment guides for the layout container by implementing either or both of the explicit alignment methods:
• <https://developer.apple.com/documentation/swiftui/layout/explicitalignment(of:in:proposal:subviews:cache:)-8ofeu>
• <https://developer.apple.com/documentation/swiftui/layout/explicitalignment(of:in:proposal:subviews:cache:)-3iqmu>

Ok, thank you. I also thought maybe using the largest subviews’ guides as the base, then it would work with custom AlignmentIDs

--- 
> ####  What happens to a subview if you don't call .place() on it in placeSubviews in a Layout? What happens if you call it twice?


If you call the method more than once for a subview, the last call takes precedence. If you don’t call this method for a subview, the subview appears at the center of its layout container and uses the layout container’s size proposal.

I found this function a bit strange as I was expecting it to return an array of placements instead of running a place function. Is it more efficient the way it’s set currently set up?

Actually, one more follow-up. Is there a way to simply not place a view or have it hidden? Imagine a coverflow style view where you only want to show a small set of subviews.

You interact with the subviews from within the layout protocol via the subview proxies that you get as input. This lets you do things like propose a size or place the view, but not perform arbitrary operations on the view, or apply arbitrary modifiers. If there’s something specific that you’d like to do but can’t, please do file a feedback with your use case.

--- 
> ####  When is onAppear/onDisappear called? How do they compare to the UIKit equivalents of did/willAppear?


hi, the framework makes no guarantees on the specific timeframes on when these methods are called, but you _can_ be sure that onAppear will _always_ be called before the view is visible to the user and onDisappear will _never_ be called while the view is on screen.

We have recently updated the documentation for these methods online to clarify these details; see <https://developer.apple.com/documentation/SwiftUI/AnyView/onAppear(perform:)> and <https://developer.apple.com/documentation/SwiftUI/AnyView/onDisappear(perform:)>

in terms of a comparison to UIKit, there is not a direct parallel. The UIKit methods are invoked specifically around when views become visible/not visible to the user, whereas the SwiftUI calls are tied more to when the views are constructed/torn down, rather than visually presented.

--- 
> ####  Love the new `toolbarBackground(_:in:)` and `toolbarColorScheme(_:in:)` modifiers in iOS 16! Is there any way to have them take effect always? They seem to only make a difference when content scrolls up beneath the navigation toolbar and using something like `.toolbar(.visible, in: .navigationBar)` doesn't seem to make a difference.  (My basic goal here is to control the navigation bar background color and the status bar style, so if there's a better way to do that please let me know!).


Hi - thanks for the question. `.toolbarBackground(.visible)` should work for this. If you are not seeing that, please file a feedback

Okay! Once I file the feedback I'll drop the # here

`FB10084072`

--- 
> ####  Is it possible to have a presented view that switches between the popover/sheet presentation styles depending on the size class (i.e., sheet in compact, popover in regular)?


Yes! You can do this by creating a custom view modifier that uses looks at the `UserInterfaceSizeClass`. Custom modifiers are great for conditional combinations of other modifiers, views, etc. and this is a perfect use case :slightly_smiling_face:

Brilliant, thank you!

We have an example of this use case in the <https://developer.apple.com/documentation/swiftui/bringing_multiple_windows_to_your_swiftui_app|BookClub sample app>, in `ProgressEditor.swift`.

Doing it this way, the popover/sheet disappears when the size class changes from regular to compact (though not the other way around) due to window resizing on iPad. Does this seem like a framework bug or something I've overlooked?

--- 
> ####  FWIK it's a good practice to have state changes the deeper in the view hierarchy as you can get, in order to avoid redundant redraws. Are there any best practices to achieve that besides breaking views down to tiny elements and composing them together?


The right way to structure your state varies by app.

I’m interested in understanding your specific use case. Are you asking this when using `@State` or `ObservableObject`?

Both actually. My use case involves a ViewModel which has @Published variables, together with diff element which is kind of a half drawer that involves @State for it's open/closed state.

For State, I would generally recommend defining it at the level where you are going to use it.

For your ViewModel it could be useful to break your model into multiple `ObservableObject` that are specific to a specific functionality (like a cell, or a single screen).
But I would avoid prematurely breaking you model into very small pieces.

SwiftUI does diff your view and will only re-render if it detects that something has changed.

• Everything suggested in the Demystify SwiftUI Session from a year or two back is definitely useful
• Keeping `Identifier`s separate from values is recommended generally (but not a hard and fast rule), especially in Navigation APIs.

--- 
> ####  Are there any types of macos apps or interfaces where you would still recommend using appkit rather than swiftui?  I'm yet to invest the considerable amount of time learning swiftui and I keep reading mentions of people saying it's still a mixed bag for macos development, so I don't want to potentially waste time.  Thanks!


Good question! Across all platforms, we’d recommend comparing your needs to what SwiftUI provides (so no hard rules/recommendations) — and keeping in mind that you can adopt SwiftUI incrementally.

Within Apple’s own apps on macOS, we’re ourselves using the full spectrum of approaches. From just a specific view/views in an app, e.g. in Mail, iWork, Keychain Access; to an entire portion of the UI or a new feature, e.g. in Notes, Photos, Xcode; and all the way to the majority of an application, e.g. Control Center, Font Book, System Settings.

But in the end, I’d recommend starting with a part you’re comfortable with and building up from there! You should look at SwiftUI as another tool in your toolset in enabling you to build the best apps you can.

Great answer.  Thanks.

--- 
> ####  When using the new MenuBarExtra in window style is it possible to control the width and maximum height of the content window?


Hi - great question. The window size should be derived from the content provided to it, though we do impose a minimum and maximum on the resulting size. If you are seeing unexpected behavior in this area, please do file a feedback with a sample to reproduce it, and we can take a look.

I experience a pretty large minimum width and a pretty small maximum height. I'll file a feedback with a project. 

--- 
> ####  Can text animate fluidly when using matchedGeometryEffect and one is set to a fixedSize(horizontal: true) and the other is not?


Hi Bardia, I'd expect that to work, especially because text transitions work well when the text is changing layouts (multiple lines/alignments). We realize that it can be a little tricky to know how far exactly you can push those beautiful text transitions. Have you tried this out and seen otherwise?

Ah I can reply now :slightly_smiling_face: Sorry for the late response (it was very late in London last night). Yep, I’ve tried and have logged FB9156668 including code/clip.

Basically it animates perfectly back-and-forth when both text are visible on a single line.

However, when the one text goes over two lines – due to larger text size for example – and me allowing it to (via fixedSize(vertical: true)), this causes the animation in either direction to not be fluid (best demonstrated in the video).

I think that feedback is a different one you've filed. That one looks Text Avoidance related

Whoops! FB10101271

--- 
> ####  Hello, is it possible to present a popover as popover on iPhone, like it's the case with iOS?


On iPhone, the `.popover(…)` modifier always presents as a sheet. There isn’t currently a way to customize that behavior.

I’d love a Feedback with details of your use case though!

<@U03HW7P0HQR> On a similar note, `confirmationDialog` for iOS presents an alert, iPadOS presents a popup, macOS presents an alert. Is it possible to make it present an action sheet for iOS?

Please file a feedback with your request!

(and feel free to paste that feedback in here once it’s filed)

If a 3rd party solution is ok, I made a library: <https://github.com/aheze/Popovers>

--- 
> ####  Hello! Talking about the Date Picker with multiple dates, can they allow to choose date ranges (like when you book a flight), so with just two dates possible and the highlight spanning over all of the days in between?


Hi Cristina, currently, MultiDatePicker only supports non-contiguous date selection. So range selection is not supported at the moment.

Speaking of booking flights... <https://developer.apple.com/documentation/weatherkit/fetching_weather_forecasts_with_weatherkit|FlightPlanner> sample app now available.

Would be great to have, maybe also with a two months view! If you think you can consider something like this in the future I could file a feedback

Yes please do! We'd highly appreciate that

&gt; Speaking of booking flights... <https://developer.apple.com/documentation/weatherkit/fetching_weather_forecasts_with_weatherkit|FlightPlanner> sample app now available.
Great! I’m downloading it, thanks!

--- 
> ####  When creating a `MenuBarExtra`, is it possible to create something that runs on its own, separate from the parent app? I have an app that users can save data to by means of various app extensions. If the app is closed, however, those changes don't get synced to CloudKit. I was thinking of having a menu bar app that would essentially be my workaround: always listening, always active. Can a MenuBarExtra do that for me?


Hi - you can certainly define a SwiftUI `App` with only a `MenuBarExtra` `Scene`. If your app should not show a Dock icon, that will require some changes to the `Info.plist` file, which should be noted in the documentation for `MenuBarExtra`

See <https://developer.apple.com/documentation/swiftui/menubarextra>

Posting that bit of documentation here as well:
&gt; For apps that only show in the menu bar, a common behavior is for the app to not display its icon in either the Dock or the application switcher. To enable this behavior, set the `LSUIElement` flag in your app’s `Info.plist` file to `true`.

Good to know. So it sounds like I would want to create a separate, `MenuBarExtra`-only app.

Can I bundle that with my Mac app on the App Store?

(Wrong lounge, I know…)

Hmm, I'm afraid I do not know the answer to that App Store question.

That’s alright. I had to ask anyway.

Do MenuBarExtra’s support other SwiftUI features, like keyboard shortcuts, so I could invoke it or an action it has via a (global?) shortcut?

--- 
> ####  Are Deep Links possible in SwiftUI?  If so, does it work well?  Are there any limitations vs what is possible in UIKit?


Check out the _SwiftUI Cookbook for Navigation_ session and the _What's New in SwiftUI_ session for 2 examples of deep links

They are indeed possible, and we think they work pretty well :wink: Of course, there's a lot of routing to consider with any app — for instance if your deep link is behind some authentication token, you'll need to do the extra work there.

The general idea is that a deep link is certain destinations presented — in order — on a navigation stack, and with this years' new APIs you can have full control over what is on the navigation stack.

--- 
> ####  What architecture is recommended for Enterprise apps when using SwiftUI?  For instance: Coordinator Pattern, Dependency Injection Containers, etc.


Thanks for the question!

One of the strengths of SwiftUI as a framework is that it works well with a variety of architectures.

We might be opinionated about API design :slightly_smiling_face:, but we want you to have the flexibility to design the data model that works best for your app.

The particular data model of any individual app depends on the domain of that app. For example, a car rental app might have a very different architecture from a news reader app.

Can you recommend a website that provides various examples of architecture using SwiftUI?

One challenge I’ve come across is that the coordinator pattern doesn’t translate well to SwiftUI. You will often have `NavigationLink`s in your views, whereas the coordinator pattern wants to separate that logic from the view itself.

But this years `NavigationStack` is going to make new coordinator-like patterns *much* easier to implement. I’m curious to experiment with that this week.

--- 
> ####  Is it possible in general to use TimelineView as a "global clock" that can be synced by all the devices (that use the app) in order to display/show something at the same exact time? (if so, what precision should be expect?)


While `TimelineView` can be used to update views at a specific point in time, it isn’t designed specifically for cross-device synchronization. You may be able to use it for that kind of use case, but it wouldn’t provide any better precision than using a `Timer` or other scheduling mechanism

--- 
> ####  That presentation was simply beautiful. I am awestruck at how SwiftUI has accelerated this year. Congrats to the team that built it, and thank you.


Thanks so much! We listen closely to community feedback. We may not always respond directly to the Feedback you file — there’s a lot of it :slightly_smiling_face:  — but it really helps us prioritize the work.

We love seeing all the great things you all are building!

--- 
> ####  S0 - AnyLayout could be user selectable (if selection changed @State)?


Yes! As Paul showed in the video any State or property can drive conditional logic to choose between different Layouts using AnyLayout

That is very powerful! Gets rid of all sorts of Case and If views :grinning:

--- 
> ####  Can a column span partial columns in Grid? i.e. If I have 8 items in a three column Grid, I want the last row to have two cells that are 1½ columns each.


The column spanning uses an integer, but you could try doubling the number of columns you're using

Hmm… that could work, thanks!

Using integer multiples works really well. If you want one view to be 3/5 of the width and the other 2/5 you just use 3 and 2 on each (assuming they each take all available space)

--- 
> ####  Can I use custom layout to create a hierarchical tree map/view of rectangular boxes of data items connected with lines?


That’s a fascinating question, Andrew!

Layout could readily handle positioning the boxes.

The lines would be the interesting part.

Sounds like a good challenge :slightly_smiling_face:

I'm just not sure of any other way to do this currently for an app view I want to do. 

You might experiment with using the layout values to route information.

You could also experiment with using Canvas to do the drawing, though that’s a low-level approach that wouldn’t give you accessibility out of the box. Check out the accessibilityRepresentation modifier for that.

Any ideas on how to “route”?

Ultimately, that’s “just” math. There are a few open source frameworks for diagram drawing. You might be able to see what algorithms they are using.

Maybe alternate row of boxes &amp; row of custom Paths? Use the layout info from the boxes to feed the custom Paths.

In fact you can do it using SwiftUI 2021. <http://objc.io|objc.io> made a series of video to demo how to draw tree image using pure SwiftUI (sorry for 3rd-party resource)
<https://talk.objc.io/episodes/S01E293-advanced-alignment-part-3>

--- 
> ####  Do LayoutValueKey values travel up through nested Layouts? Also, how are they different from PreferenceKey?


LayoutValueKeys only travel up to the nearest Layout container

OK, good to know

One reason for this is for Layout to facilitate building of encapsulations that can be composed without having unanticipated effects on the other views that surround it

--- 
> ####  Do all system stacks implement the Layout protocol for use in AnyLayout? Is this documented anywhere?


The goal is for as many system provided layouts to conform to the Layout protocol as possible, including the stacks.

You can find what protocols a type conforms to in the developer documentation

Yup, scroll down on this page: <https://developer.apple.com/documentation/swiftui/hstack>

Thanks!

--- 
> ####  What examples of custom layouts do you think a new layout protocol is a best choice for?


Flow layouts are great for it. There’s a good example in the Food Truck sample app.

Whatever you can imagine :upside_down_face:

In the State of the Union we mentioned Flow and Radial layouts as good examples

A custom layout can be a good fit if there's something super custom in your app

I am thinking of a dynamic layout case for seating order around tables. User could create a new Table, specify if the table is rectangular, oval or circular, and specify the number of guests at each side. We could then get a layout for the table as specified, and the user can fill in the guests. In code terms, this could mean that the specific layout should be created dynamically. Would something like this be possible?

It's an even better fit for building a generic layout container that you can reuse across your app (like Flow referenced above)

Or if you like bee hives… <https://twitter.com/ryanlintott/status/1534367196251574272>

Even really subtle, nuanced layouts can bring a little extra level of polish — plus be composed together! For higher level features like the new form style on macOS we’re using several small custom layouts to get it to perfectly match what the design specs described

Jan, that sort of thing is definitely possible! In fact, in the what's new in SwiftUI talk, they show an example of a layout which is very similar to what you’re describing to make a seating chart for SwiftUI’s birthday party!

Thanks <@U03HKVDCL7N>, that's great! Yea I saw that, I just hope we can let user specify the dimensions/shape of the table

that talk is what got me going on the idea :slightly_smiling_face:

--- 
> ####  Is there a way to build a Layout that would effect each child view with ViewModifiers? Let's say I always want to style the first view one way and the second another.


LayoutValueKey allows you to pass information from your view hierarchy along to layout, but please note that layout can't use this information to make style changes to the view, only to determine its layout.

The information is passed through to layout through layout proxies, so the original view isn't accessible from the layout protocol.

I guess what I’m looking for is a way to apply modifiers to a Group that would only apply to specific subview indexes. It would only need to apply in one direction. I guess it’s time to write another Feedback.

--- 
> ####  Are all the new layout features available on non-iOS platforms? watchOS, macOS, tvOS...


Yes, there are :tada:

Excellent, thank you! :partying_face: looking forward to the multiplatform targets with this one

And just for reference, you can always check the availability of a bit of API right at the top of the page. For example, for `Layout`:

Thank you <@U03HELSV45B>! I didn't know the new stuff was already documented and 'out there' :blush:

--- 
> ####  I'm noticing a huge hit to scrolling performance when I add a contextMenu to cells in my lazyvstack. When I profiled the app, it showed that buttons in the contextMenu was what was taking so long to render. Does a context menu have to render on creation of a view? Is there any way to create a lazy context menu?


Hi - we believe that this issue was fixed in a recent software update. If you are still seeing this, could you please file a feedback?

Yes for sure. Thanks!

Also <@U03HHJH9C66> what is the best category for SwiftUI feedback? Developer tools, or iOS &amp; iPadOS?

<@U03HHJH9C66> i noticed that contextMenu on rows are not updated when the row is updated (for example update the text or symbol based on an action taken). Is this fixed now?

--- 
> ####  Why would anyone use observable object instead of state object?


You might want to use `@ObservedObject` if the lifecycle of your model is not owned by your view.

An example is if you are using `UIHostingConfiguration` and you have your model owned by UIKit in a `UIViewController` and just passed to a SwiftUI cell.

Also @Published properties in ObservableObjects use Combine publishers, which can have their own basket of use cases too

Also, in general you want to use `@StateObject` in a parent view, and if you pass the same `ObservableObject` instance to child views you can use just `@ObservedObject`.

--- 
> ####  ViewModifier question: What’s the difference between a custom ViewModifier (without DynamicProperty) that uses some built-in modifiers in body(content:), and a custom View extension func that just use those built-in modifiers?  Similarly, what’s the difference between a custom ViewModifier with some DynamicProperty and a custom View with some DynamicProperty (also has a @ViewBuilder content property to receive content to modify) ? I think two have the same render result and behavior.


Because of the way a ViewModifier is expressed, the engine knows it's not changing the `content` passed in and can apply performance optimizations (compared to just an extension on View)

--- 
> ####  A bit off topic to Grids / Layouts but not to Customization - Is there any way in SwiftUI to create multiple Windows (or Window like things) on Mac (and maybe iPad) or Pages on iOS?


Hi - thanks for the question! You can certainly compose the different `Scene` types available in your `App` to create the functionality you'd like. For instance a `WindowGroup` and a `Window` or `DocumentGroup` and a `WindowGroup`, etc.

hey, I was gonna ask that question later today :joy: Right now we need to use UIKit lifecycle if we want to show HUD that overlays the entire app. For example: <https://www.fivestars.blog/articles/swiftui-windows/>
it would be really useful to be able to do this without relying on SceneDelegate!

I have the same question as well, what would be the recommended way to do what <@U03JMMN8659> says? I thought about using the overlay modifier on the root view of the app but what if there are presented views?

Something like what is in that blog post is likely worth a feedback for an enhancement request. Thanks!

--- 
> ####  Hi there! This is not really related to the Layouts video we just watched, but rather a question that I had a while ago. The video was really clear. Thanks for the amazing explanations!  Moving on to the question, dan we use SwiftUI to create a numeric text field? I was looking for something that allows typing Int numbers.   In my case, I had to work to with 4 digit numbers, and a stepper wasn't the best choice. Instead, I went for a TextField that checks if it can convert the input string to an Int when a button is clicked. Is there a better way to achieve this?


Check out the TextField initializers that take a formatter.

Just noticed a typo, I meant can instead of dan:sweat_smile:

Thank you!

Really appreciate it.

If this is for iOS see also the `keyboardType(_:)` modifier.

This was for the Swift Student Challenge, and I ran my app both in the iPad Simulator and as a Mac app using Mac Catalyst. Thanks!

--- 
> ####  Is there a way to use a capacity `Gauge` outside of the lock screen?


Yes! Gauge is usable outside of the Lock Screen, and also has a whole host of new styles! I would take a look at the linearCapacity, accessoryLinearCapacity, and accessoryCircularCapacity styles. Please note though that gauge styles prefixed with “accessory” are really intended to appear in contexts like the Lock Screen / widgets, or some similar design context within your app proper, so please give careful consideration to where you use them.

--- 
> ####  I implemented the new searchable APIS yesterday. One issue I have is that when suggestions are presented, it completely blocks out the entire search view. I'm wanting to implement something similar to the Photos search feature where you can see a small box at the top with search suggestions, while also display existing results. Is there a way to accomplish this with searchable?


If you’d like search suggestions to be rendered inline your results, you should consider them as part of your results and not provide any suggestion views to the searchable modifier.

Note though that in iOS 16.0, for a regular width size class, a search bar that is displayed in the trailing navigation bar will display suggestions in a menu rather than over the main content like on macOS. Take a look at the SearchSuggestionsPlacement type and searchSuggestions(_:in:) modifier for customizing your UI around this behavior.

--- 
> ####  I am using three pickers in a row to allow me to enter hours/minutes/seconds. However, the tap targets for the pickers are all off by some factor, such that if I try to scroll to the right of the middle of a picker, it actually scrolls the picker to the right instead. Is this a known issue? Is there a workaround?


Hey Micheal, could you please file a radar fro this issue?
That would be greatly appreciated.

Will do - thank you! :grinning:

Is this a wheel picker? If so, been there, done that, it's a known bug, but we found a workaround. Lemme know

--- 
> ####  ViewThatFits feels very convenient but I'm concerned about making copies of the same content for each layout option. I assume a custom layout would be required to achieve this?


ViewThatFits is a convenience that might not be appropriate if you need something with animated transitions, or in general something with more complex behavior.

--- 
> ####  Can the new Charts API allow for scrolling? similar to the health app's charts


Sorry, late answer forgot to hit send: Yes, charts should behave just like any other view in this regard. though you may have to set explicit frames on the chart to specify how big (wide? tall?) you want it to be

We just couldn’t wait till the next Q&amp;A, Ok I promise we are done now!!! :nerd_face:

Hey <@U03J21CNQ1G> I just realized the health app chart does scrolling that keeps the y-axis stationary, that specifically isn't supported, but we've received a few requests about this, but few feedbacks. So if you file a feedback for the Charts team, we'd appreciate it

--- 
> ####  Hey! Is it possible to customise the font on pickers and menu this release? I’ve had to create my own menu (quite a workload) to workaround this styling limitation.


Could you confirm which platform you’re seeing this issue with? The font should be customizable on macOS but is not currently on iOS. We’d love to hear more about your use case and please do file a feedback with more details so that we can take it into consideration for the future.

Yep, it’s on iOS that I’m referring to. I will, okay! The use case is basically wanting to create a bespoke experience that involves using a custom font (Avenir Next). It’s inconsistent/less cohesive if controls such as menus use a different font.

i see. yes, please do file a feedback with a sample app if you can, and feel free to paste the number here once you do so that we can send it along to the right place!

--- 
> ####  How does Layout interact with other view modifiers or constructs that can provide layout data, like offset, geometry reader, anchor preferences, etc? (For context I've got a card game-type view that currently lays out cards in columns all powered by GeometryReader and anchor preferences, because I need specific frame data when a user performs a drag gesture to drag a card over a region of the screen to perform logic. I'm wondering if it's possible to re-implement it in Layout, but I'm unclear about if it's possible to get at the anchor preference frame data.)


A layout is only able to position its direct subviews.

It can  be superior to GeometryReader because it's able to do that while also computing a sizeThatFits.

If you're trying to arrange things that are crossing parent-child boundaries, though, anchor preferences will likely still be necessary.

A Layout that contained and positioned all of my card subviews would therefore know their positions - and I imagine I could put those in the cache. I guess I'm wondering if there's a way my layout can provide that information out to my model layer when a drag gesture finishes?

More generally - can a Layout relay its layout information externally in some way? Or is that not possible?

--- 
> ####  What is recommended way to style navigation bar in SwiftUI?


Check out the `.toolbarBackground` modifier, new in iOS 16 and aligned releases.

What about  iOS 14, 15

is it still UINavigationBar appearance?

Sorry. The new API is not able to be back deployed.

Does `.toolbarBackground` apply to only that view or any view pushed into navigation stack as well?

I believe it applies to the current view, so you can change the behavior at different levels of the hierarchy.

Awesome, is it safe to assume it takes care of animations too? For example can I set an opaque background on one view and a transparent one on the detail view?

<@U03HW7P0HQR> by the way, I’d like to use this opportunity to thank you for the awesome cookbook presentation and thank the team for all the goodies this year. :innocent:

There’s also `toolbarColorScheme` if you need to control the text appearance.

Finally, you can use a toolbar item in the `principal` placement to replace the default navigation bar title with an arbitrary SwiftUI view.

Does it apply to both large style and inline style?

--- 
> ####  How do I actually apply Variable Color to an SF Symbol along with the percentage I want highlighted vs dimmed? Is there a SwiftUI modifier for this?


You can make a variable color symbol with:
```
Image(systemName: "wifi", variableValue: signalStrength)
```
It’s part of initializing the image, not a separate modifier you apply.

Thanks Jacob!!

--- 
> ####  Hello! I am trying to create a new custom Layout. I would like to know how to access LayoutValueKeys from within a Layout.


The documentation for the new layout API is fantastically written and should have all of the information you need to get up and running! It explains it far better than I could in a short question answer. You can check out the docs for `LayoutValueKey` here. It even has a walkthrough that shows you how to create, set, and retrieve keys!

<https://developer.apple.com/documentation/swiftui/layoutvaluekey/>

Thanks!

Yeah, it definitely is fantastically written! Amazing work!

--- 
> ####  Fairly new to Swift &amp; SwiftUI.  Curious if there are any changes to Core Data/SwiftUI integration this year. Using ManagedObjects with SwiftUI seems to results in View that know a lot about Models or Models that have a mix of business logic and view logic which can be confusing.  Any suggested best practices for using Managed Objects with SwiftUI?  I tried writing value type wrappers to do MVVM but that breaks down with relationships.


This is a topic that deserves its own WWDC :joy: I really, really recommend Paul Hudson's videos on this. He helped me a lot with understanding the relationships between SwiftUI and Core Data. Especially important if you plan to use SectionedFetchRequest or generic FetchRequest :zap: There is still a lot of improvement to make Core Data more SwiftUI-esque, here's hoping for WWDC23 :innocent:

Hi Tom,
Great question. There were no additions to SwiftUI in regards to Core Data. However, we do have our <https://developer.apple.com/documentation/coredata/loading_and_displaying_a_large_data_feed|CoreData ><https://developer.apple.com/documentation/coredata/loading_and_displaying_a_large_data_feed|Earthquakes><https://developer.apple.com/documentation/coredata/loading_and_displaying_a_large_data_feed| sample app> and <https://github.com/orgs/apple/repositories?q=sample-cloudkit&amp;type=all&amp;language=&amp;sort=|CloudKit sample apps> all showing best practices with SwiftUI and background contexts.

The former performs batch inserts and merges changes on a background thread, then publishes the changes to SwiftUI on the main thread.

One place I am struggling with right now is providing the ability to edit an entity with the idea of "cancel" and "save".

<@U03HELS8GHK> Thank you for sharing Earthquakes example, I’ll definitely check it out. Any chance I can get your attention to FB8545866 pretty please? For a very simple Core Data + List implementation, app crashes whenever an item is deleted from the List. It would be awesome if there was a guideline around more complex implementations.

&gt; One place I am struggling with right now is providing the ability to edit an entity with the idea of "cancel" and "save".
This notion of edit propagation is described in the <https://developer.apple.com/tutorials/swiftui/working-with-ui-controls|Landmarks app> in the SwiftUI Tutorials

My current plan is to do MVVM by using classes with Value Semantics instead of actual value types but I've just started down that path.

Thanks for all the pointers!

<@U03HELS8GHK> I'm not sure we can compare the Landmark app based on Struct with an app using Core Data with objects in contexts. How can we use child contexts with SwiftUI? What would be the best approach to edit entities in a child context?

Great follow-up question, Axel. We don't have a sample today detailing this exact scenario, so you'll have to apply the same concepts from the Landmarks app to the merge flow shown in Earthquakes. I'd suggest requesting more samples via Feedback Assistant, though, so we can consider more opportunities to improve our learning resources.

To clarify, the Earthquakes sample uses private contexts to perform its batch inserts and merges the changes into the main context. So, that sample is a great place to start.

Thanks. I explored a lot these sample projects and took some inspiration. But they don't really cover UI edits made by a user. I'll fill some FB.

--- 
> ####  Heya! I have a macOS app where I am attempting to 'tear off' certain SwiftUI views as floating free form windows. I've looked into some of the WindowGroup API, but it doesn't seem like it supports what I'm looking for. Essentially, I have N views of various sizes that can either be docked into a main window, or float above it. I'm running in to issues like sharing state between the docked version and the windowed one, as there seems to be a difference in the relationship between how a standard SwiftUI update bindings works for windows or views. Given that, what would be some ways that I could go about this method of 'docking / undocking' SwiftUI views, and keeping their state in tact?  Thank you!


Hi - this is really interesting! I'm not really sure we have any API that entirely fits your concept here, but I'd love to learn more. Can you speak to how you are accomplishing this at the moment? Also a feedback for this with any details you provide would be great!

Absolutely! I’m doing this right now in my project at <http://github.com/tikimcfee/LookAtThat|github.com/tikimcfee/LookAtThat>.

Posting this now to respond to you, and will follow up real quick with a screenshot and a code snippet.

The key classes are all here:

<https://github.com/tikimcfee/LookAtThat/tree/4dbe4a8f93f5dafd56752433df917352076da664/Interop/Views/FloatableView>

`FloatableView` swift basically takes some bindings to an enumerable state type (floating, docked), and then either presents the view directly as a child, or acts as an intermediary ‘adapter’ between the parent hosting view and a floating window. The window itself ends up as a separate instance of the view, but seems to be more or less functional since it still can participate in shared state updates.

The other classes, window delegate and the extensions, help construct and manage the window lifecycle a bit.

The two things that are tricky are that the view is still technically bound to an `EmptyView` that lets the state remain active, and the window is its own ‘thing’. It seems like there would be a way to sever that connection between the root view that owns the docked version of the view and the window (which is why I was really trying to consider WindowGroups), but I just couldn’t crack this one.

And hey, is that feedback from the dev-feedback-app? If so, I’d be happy to share this and our discussion with it.

And since I was rude and forgot, _thank you_ for taking your time to talk and take a look!

Yep, there should be an app called Feedback Assistant that you can use. Any info you can put in there, like what you have above would certainly be useful.

<@U03HHJH9C66> Done! I have a fancy-pants ID too : FB10112377

--- 
> ####  Why does NavigationLink pre-render the destination when it's being rendered? I am loading Heart Rate data in my destination View and this slows down rendering significantly. What's a better pattern to prevent accidental pre-loading of data?


In general we discourage to do any expensive work in the init of a view. SwiftUI expects the creation of views to be cheap.
We recommend doing any side effect or data loading with either `.task` or `.onAppear`.

Even `.onAppear`  ran last time I tried. Currently I am using this workaround from StackOverflow:

```
public struct NavigationLazyView&lt;Content: View&gt;: View {
    public let build: () -&gt; Content
    public init(_ build: @autoclosure @escaping () -&gt; Content) {
        self.build = build
    }
    public var body: Content { build() }
}
```

Starting loading of data in `onAppear`  causes some time the user has to wait for the heart rate graph. Also not super desireable.

Check out the new `NavigationStack`. Inside that `NavigationLink`s can present values instead of views. The resulting view can then do work in `onAppear` or using `task`.

--- 
> ####  When using UIHostingController, is it better to add it to the view controller hierarchy (with addChildViewController), or could we use its rootView and simply add it as a subView ?


You want to always add a `UIHostingController` as a `childViewController`.
```
// Add the hosting controller as a child view controller
self.addChild(hostingController)
self.view.addSubview(hostingController.view)
hostingController.didMove(toParent: self)
```
without the view controller relationship things that depend on the `UIViewController` hierarchy won’t work. Such as `UIViewControllerRepresentable`

There are a few other types as well that depend on this relationship in their underlying representations so its best practice to add the parent/child relationship.

I am building a design system implementation where I’m providing reusable components that other teams can simply build their features. I usually start with SwiftUI but this view controller relationship makes things very hard at times, especially if the view in question is complex. I believe there is `NSHostingView` on the Mac, I wish we had the same on iOS. For the time being, given the requirement, is there any recommendation to fulfill this requirement? For example, can we even use window’s `rootViewController` as a parent or is there a better way?

yes the AppKit underlying infrastructure makes `NSHostingView` work while UIKit is not able to do so due to the hierarchy requirements.
It depends on exactly what you are trying to build, but potentially you could make a reusable view controller that your teams can use instead depending on where the complexity is at. Parenting at the `rootViewController`  would have issues with any navigation calls you might try to make in SwiftUI.

Ah got it, thanks for clarifying. It is a little bit overhead to ask the teams to add a child view controller just for a button from the design system. :sweat_smile: And it’s extra challenging if they are adding it to a `UIView` subclass down in the view hierarchy where they don’t have access to any view controller for example.

--- 
> ####  Should Layout work fine with UIKit-representable views?


Yes! To get more control over how UIViewControllerRepresentables size themselves in SwiftUI layout you may want to implement their new `sizeThatFits` method: <https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable/sizethatfits(_:uiviewcontroller:context:)-35p75>

--- 
> ####  With the new MenuBarExtra. Is it possible to get a callback when the content window appears or disappears. I’ve tried onAppear but it’s only called on first appearance. OnDisappear is never called.


Hi - thanks for the question. This sounds like it is probably a bug. Could you please file a feedback for this?

--- 
> ####  While I was working with Canvas and rendering images, shapes, and text, I was trying to sort out if there was a way to get the offset for the baseline value from a ResolvedText. I wanted to align the text baseline to a visual element that I was drawing in canvas, and the only path I found to getting sizes of discrete elements was to resolve them and measure them - something akin to: ``` let captionedTextSampleSize: CGSize = context.resolve(Text(label).font(.caption)).measure(in: size) ```  This hands back CGSize, which mostly worked for what I needed, but I'd really like to align to that baseline - and for that I need to determine an offset. Is there any public API to help me do that, or a technique I could use to get said offset that uses other frameworks or libraries?


The GraphicsContext.ResolvedText type also has `firstBaseline` (and `lastBaseline`) methods. So you can do something like:
```
let baseline = context.resolve(myText).firstBaseline(in: size)
```

:face_palm: I totally missed that. Thank you Jacob!!!!

--- 
> ####  SwiftUI Mac specific question: When using .contextMenu on a List , how can I find out what was actually selected? When looking at Finder, the selected (=item on which the action should be performed on) is either the selection (1 or more) OR it is the item that has been right clicked on directly. How can I replicate this behavior using SwiftUI?


Check out the new context menu API that accepts a `forSelectionType` parameter. This passes the value of the selection into the modifier for you to act on.

```
List(selection: $selection) {
 ...
}
.contextMenu(forSelectionType: MySelection.self) { selection in
 // check selection
}
```
Be sure to match the type of your lists selection to the type you provide to the context menu modifier.

<https://developer.apple.com/documentation/swiftui/view/contextaction(forselectiontype:action:)>

That is awesome, thank you!
Are there any plans to back port "smaller" API changes like this into macOS Monterey and earlier?

--- 
> ####  I’m a teacher but also write iOS/iPadOS apps. I watched Curt’s Cooking/Recipe section and am trying to understand state restoration. I thought Curt said adding SceneStorage and the Task to check if navigationDetail was nil would do it but it doesn’t seem to work. Do you still need to use the onContinueUserActivity and then have each view in the stack hierarchy have a .userActivity to create/describe a NSUserActivity for that view?


Hi, David! I was a teacher before I went full-time software engineer.

What I shared in the talk and in the Copy Code associated with it should work. Or check out the sample project here: <https://developer.apple.com/documentation/swiftui/bringing_robust_navigation_structure_to_your_swiftui_app>

You shouldn’t need to use user activity directly at all for this.

Hi Curt, yes, we corresponded when you were a teacher and then spent your sabbatical at OmniGroup. I’ve been tempted by some Apple positions, but can’t relocate right now. Hmm. I tried running it in simulator. I select Apple Pie, select Fruit Pie Filling, press Shift-Cmd-H. Press the stop button in Xcode, and then relaunch the app and it starts at the initial Categories screen. Am I not testing it correctly?

Ah! Yeah, Xcode kills background storage unless you hold it “just right”.

The pattern when working with Xcode, is to (1) background the app in the simulator or on device, (2) wait 10 seconds for the system to do its backgrounding work, (3) kill the app using the Stop button in Xcode.

Then when you run the app again, it should use the saved value.

Ah, I waited a few seconds, but probably not 10. Also, I did the next best thing to joining Apple myself - one of my students is now there (Jeremy who did the AV Foundation “Creating a more responsive media app” talk this year.

Hmm, I waited more than 10 seconds and still doesn’t work. After navigating, I press Shift-Cmd-H to return to home screen, wait 15 seconds, press stop in Xcode, and then relaunch from Simulator and still starts over with the Category list. If I use the Run button in Xcode, it starts over at the “Choose your navigation experience”? I’m using an iPhone simulator (iPhone 13) not an iPad simulator if that makes ay difference.

Also, I chose Stack as the navigation experience

Hmm. And this is with the sample code project?

Yes, downloaded from here: <https://developer.apple.com/documentation/swiftui/bringing_robust_navigation_structure_to_your_swiftui_app>

I’m afraid I have to go with “it works for me” for the moment, and then double check with the developer build. Sorry for the frustration here.

The 2020 SwiftUI State Restoration example that uses NSUserActivity seems to work. <https://developer.apple.com/documentation/swiftui/restoring_your_app_s_state_with_swiftui>

Ok, thanks. I can check back in a week to see if the code on the website has been updated.

Interesting, scene storage uses the same mechanism under the hood.

That 2020 example also has SceneStorage at one spot:

in the ContentView it has @SceneStorage(“ContentView.selectedProduct) as an optional string.

but still uses .onContinueUserActivity

--- 
> ####  Just starting out with SwiftUI. One of the things that is hard to get my head around is the following. In UIKit, I have a label that pulses (grows and shrinks) based on certain events, so I'd typically have an outlet to the label and a method 'pulse'.  In SwiftUI, I accomplished the same by having a binding labelState which I change in the containing View. So while UIKit would have an outlet for multiple labels, in SwiftUI I'd have a binding state for each label. Is that typically the correct pattern?


That seems like a totally reasonable approach! Generally, when you have some value that you want to change in SwiftUI, you want to make sure that there’s a clear source of truth for that value. That source of truth can either be `@State`, or a property within an `ObservableObject`.

When you have a fixed number of controls, having a separate piece of state backing each of those controls is completely reasonable.

That said, the sources of truth you provide for your state should mirror your UI, so if you dynamically generate your labels from an array of data, you might then want to have an array of data as the source of truth state for your ui components. If you see that your sources of truth for your data mirror the structure of your UI, you’re probably on the right track :slightly_smiling_face:

ok thanks. A bit of looking at the problem from a different axis.

--- 
> ####  Using `.buttonStyle(MyCustonStyle())` instead of `MyCustomButton(...)` is more SwiftUI-y. But why should I prefer one over the other (considering `MyCustomButton` uses `MyCustonStyle` under the hood)?


Hi Peter,
We strongly recommend separating semantic controls and styles as it provides a lot more flexibility.
For example, using the button style modifier will apply to the whole hierarchy, so if you decide you want specific parts of your app to use a different button style, you can just apply it to that specific hierarchy without changing the control itself.

With this approach you also get multi-platform behaviors for free.

My app’s design uses kerning on most of its buttons, but I can’t put that inside of my `ButtonStyle` because kerning is only available on `Text`, which `ButtonStyleConfiguration.Label` is not. I have a feedback open suggesting passing kerning through the environment (FB10020695).

In the meantime, do you have any suggestions on how to do this without having to separately use `.kerning()` on _every_ button label?

Moved out here :smile:
<https://wwdc22.slack.com/archives/C03HX19UNCQ/p1654722720194909>

--- 
> ####  My question is about some code in the SwiftUI Cookbook for Navigation session. Around 23 minutes in, Curt uses the `task` modifier to run an async `for` loop over the model's `objectWillChange` publisher. In the loop, he then accesses an `@Published` property of the model. But a `@Published` property fires the `objectWillChange` property *before* it updates its `wrappedValue`. Doesn't that mean that when the code accesses `navModel.jsonData`, it will get the out-of-date model values? Or is there some async magic that guarantees the loop body will not run until later after the `objectWillChange` publisher has finished publishing and the `@Published` property has updated its `wrappedValue`?


Great question! Task schedules its body on the main actor, which is also where the view update happens. So objectWillChange enqueues the body of the for loop, but it’s enqueued behind the update of the data model.

--- 
> ####  What is the advantage of using custom Symbols rather than SVG with `template` rendering mode?  The ability to programmatically change the colors of several layers? Any other reason?


Inlining within Text is a nice benefit, but doesn't seem to work with custom multicolor symbols.

In addition to the great color support, using a custom symbol also helps it better fit with text by growing with fonts, respecting bold text, and matching baselines.

Christopher, if you haven’t already, can you file a feedback about that?

I have, also submitted a question here about it FB10001506

Thank you!

--- 
> ####  Would it be possible to create an “infinite” paged collection view in SwiftUI? Similar to the week view in the calendar app where you can swipe through weeks endlessly. Thanks!


On way to achieve that would be to have `onAppear` on a the individual views that the `List` is scrolling over and use that load in more data.

What if you want the @State data to not grow as the user continues to page? Removing items from the array would offset the data and causes a jarring affect. 

I would be happy to submit a feature request for something that would allow me to build this, I’m just not sure what that would look like :dizzy_face:‍:dizzy:

One way you can solve the problem is by keeping only identifiers in the `@State` so that the storage doesn’t grow too much, and load on the demand the actual data as view are coming on screen.

A feedback would be great. You can simply describe your use case, what you are trying to achieve, and what kind of road block you are finding.

That sounds interesting, ill give it a shot. Currently using the .page TabViewStyle but have also been playing with UICollectionViews as well. Ill submit a request if that doesn't work out. Thanks

Any tips to avoid a `List` to scroll to top whenever `@State` gets updated?

Like in the calendar example, I’d probably want to be able to scroll in both directions and have the view appear somewhere in the middle.

I think ideally a way to detect when scrolling was finished for that TabView case would be great, because the onChange fires before it’s done scrolling

--- 
> ####  SwiftUI on macOS question: Is there a way to position the windows when they are opened? In my app, the position of the next window always depend on the last, offset a bit to the right and down. So they are slowly crawling down the screen, which is not nice.


Hi - thanks for the question! The cascading of windows is the default behavior for `WindowGroup`. We've also added a new `Scene` modifier - `defaultPosition`, which allows you to specify an initial position to use absent any previous state for the window. It takes a `UnitPoint`, so for example, it would be something like `defaultPosition(.topTrailing)`. Did you have some other behavior in mind? It'd be great to get more info, if so.

It would be nice if I could position a new window just beside the already open window, e.g. to the right or left, depending on the available space.
The second window is a “compagnon” to the document, used for editing.

Ah, I see. That makes sense given your use case there. Would you mind filing a feedback for an enhancement?

So I have currently a `DocumentGroup` and a `WindowGroup` . The `WindowGroup`  instance would have a one-to-one relation to an open document.

Ok. Please include those details in the feedback, its definitely helpful when we are designing APIs

--- 
> ####  Hi! Hope non-standard behavior out of SwiftUI is your cup of tea, because I have a really “interesting” question. This happens using SwiftUI in Xcode 13.4 on an iMac running macOS 12.4. When using .datePickerStyle(.compact), and I touch the date to bring up the calendar, the final displayed date changes format depending on the chosen date. “June 19, 2022” looks ok, but then I get “6/20/22” when I move to the next day. It gets better: after going left to right in the month, and seeing “6/22/22”, when I start moving right to left from June 24, 2022, the output for the 22nd comes out as “June 22, 2022”. Any ideas would be welcome! Apologies for the weird problem!


You're not alone, I noticed this behavior ever since last summer or so. :slightly_smiling_face:

REALLY?! Thank you for letting me know I’m not imagining things!

Hi Mayra,
Thanks for the feedback. This is a known issue :smiley: and we are fixing it!

Hooray! Thank you. Will this be in Xcode 14?

Oops… sorry, can’t comment on future work…

--- 
> ####  What are good tells that I should use implicit vs explicit animations in SwiftUI?


I usually default to `withAnimation` to set up animations based on when a change occurs. That way, whatever UI changes as a result will implicitly be animated.

In some cases, `View.animation` is useful when you have a certain view or view hierarchy you always want to change with an animation, regardless of what triggered it. A good example is the knob of a Switch: it should just always animate when it changes. (And make sure to pass an appropriate value, like `.animation(myAnimation, value: mySwitchValue)`, so that you only animate when the property you care about changes, and don’t accidentally animate too often.)

Thank you for your reply Jacob I’ve been having some difficulties deciding on best approaches especially when creating reusable components with baked in behaviours.
This might be stretching it, but this is a gist that lays out my problem: <https://gist.github.com/kanevP/a9d54f5c60eddabca000b1a45a59e70b>
Would love to hear your thoughts on the different animation usages.

--- 
> ####  I have some custom multicolor symbols that I want to inline with `Text`, e.g.  `Text(“Look at my pretty symbol \(Image(“mySymbol).symbolRenderingMode(.multicolor))”`  But they don’t render as multi color, is this an expected limitation? Can you think of any work arounds that still provide all of the benefits of inlining? It works great for system provided multicolor symbols…    FB10001506 has a sample project.


it could be a bug, or it could be some problem with your symbol template. For instance the template must be at least version 2 to support multicolor. Does the SF Symbols app work with it and is it able to display the symbol in multicolor?

Yeah, they render properly outside of Text

And in the symbols app

oh, the problem only occurs when the symbol is used inline with text?

Correct

Even duplicating a system/apple provided multicolor symbol has the same result, so nothing to do with _my_ template

if the symbol is working correctly in other contexts, that sounds like it could just be a bug on our side let me look into it further

--- 
> ####  In a WWDC20 session "Data Essentials in SwiftUI" there's a point in the video where the presenter touches on using a single data model that can have multiple ObservableObject projections to target SwiftUI updates to specific views. How can I achieve this?


The exact solution really depend on your data model but its can simply be as having a model that contains a bunch of properties where each of these type is an `ObservableObject`; or you could have a function that given an identifier return you the `ObservableObject` that corresponds to that id.

What we wanted to get across was that you want and you can scope your `ObservableObject` to specific screen of functionality of your app.

I think I understand, thank you <@U03J7BQQNPJ>!

--- 
> ####  In our app, we can push a view containing a custom view above the navigation bar. We achieved it by using a NavigationView inside a NavigationView (displaying a custom view with the back button hidden).  Is it possible to have a custom view above the navigation bar with NavigationStack? Is it possible to use a similar workaround?


Nested navigation stacks don’t compose the same way. An inner navigation stack is effectively a no-op; it doesn’t add anything and any path bound to it should be ignored.

Are you trying to achieve something like a very tall navigation bar?

I’d love a Feedback with details of your use case!

Thanks for the follow-up! You can find the use case, a video and a sample project demonstrating our current approach with a NavigationView inside a NavigationView in this radar:
<https://feedbackassistant.apple.com/feedback/10112679>

I would love to achieve the same effect with NavigationStack

--- 
> ####  Forgive me if this question has the same answer as the scrolling chart question, but could we utilize a scrollview and a chart to display a live chart? So new data added is always visible to the user, instead of having to manually scroll it into view.


Yes, this should work, but will extra work. You may have to observe the data and manually keep the scroll view positioned at the very end

It sounds like you want to use to be able to scroll backwards through an otherwise-live feed, but if that isn't the case, the data plotted in your chart could always be just the last 7 elements of an array or something conceptually similar

Yeah, basically keep a horizontal scrollview fixed to the end and allow the user to scroll back to the left (start) of the view. Is there a modifier or additional context to manually position the location of the scrollbar in a scrollview?

Have you seen <https://developer.apple.com/documentation/swiftui/scrollviewreader|ScrollViewReader>s?

Ah I have not. This is perfect thanks!

<@U03HL00QL68> When I use a `ScrollViewReader` and the parent state changes the scroll position changes. I have filed a feedback `FB10037533`

Thank you for the sample project. Definitely a bug!

<@U03HL00QL68> thanks a ton!! for confirming that, hope it gets fixed

--- 
> ####  Question regarding the SwiftUI Instrument: Is there a value of avg. duration that no View's body should go above when rendering for avoiding performance issues/hitches ?


View’s body properties should be cheap and avoid any potentially expensive work. If there are things you need in your views body, its best to pre-compute that into a piece of state that you can pass your views.

Concretely, each frame has a hard deadline of generally 1/60s or 1/120s (depending on the refresh rate of the display) to render its content. Thats 8ms in the fastest case.

Thats for the entire screen to render its content though, not just your single view . So if any one view is taking more than a few ms to finish calling body, you’ll run into issues.

If you’re using Swift concurrency to move work off the main thread, consider watching this session: <https://developer.apple.com/videos/play/wwdc2022/110350/>

This is all mostly related to scrolling performance. Other kinds of things like app launch or navigation pushes will typically take longer than multiple frames to render, but those situations have different expectations around frame deadlines.

--- 
> ####  We can now use .foregroundColor(.white.shadow(…)) on SFSymbols. Will this work with custom PNGs/SVGs as well?


`foregroundStyle`s apply only to shapes, image masks, and text. If the `Image` is configured as a template, then foreground styles should be applied. If the image is non-template, they won't

Yes if you set render as to template for your image asset

Excellent, thank you! :pray:

Thanks Mirko! and thanks for the great question Jan

--- 
> ####  Is it possible to have a customizable toolbar with SwiftUI on iPad?


Hey Johan,
Yes it is possible :tada: Checkout the "What's new in SwiftUI" talk on the Advanced Controls section to have a peak.

And make sure to tune in for the "SwiftUI on iPad: Add toolbars, and documents, and more" talk tomorrow to dive deeper. :smiley:

Note that the same APIs will work on macOS too.

--- 
> ####  SwiftUI Mac specific question: When using NavigationView, is there a way to start the app with a the sidebar already collapsed (or do it programmatically)? I saw this in on of the videos. Bonus question: Can this also be done on macOS Monterey?


Hi - thanks for your question. The new `NavigationSplitView` API provides an initializer which takes a binding indicating the visibility of the columns. This can be used on macOS to indicate that the sidebar should be initially collapsed.

There is an example in the documentation here:
<https://developer.apple.com/documentation/swiftui/navigationsplitview/>

Thank you!

--- 
> ####  Hi there, is there any way to get my offscreen nested StateObjects to not be deallocated when scrolled offscreen within a Lazy*Stack? The only solution I've found is to "hoist" them to the top level of the Lazy*Stack, e.g. within the Content of a ForEach, but that feels kinda clunky to have to do in every scenario—wondering if there's another option.


I think "hoisting" your state into an ancestor is your best bet here

As an aside, StateObject is more commonly used with model objects and you generally don't want to tie your model object's lifecycle to the view

In the case of a model object it might make sense for an ancestor model object to be maintaining references to these children model objects

<@U03HELTEP9T> What guarantees (if any) do we have about the longevity of a `StateObject`  property on a view? Should I try to move view-owned objects to the root App struct and inject them via EnvironmentObject?

I've already run into issues when changing device orientation, with my view hierarchy being torn down and recreated, losing any ephemeral state

Thanks! Yes in this scenario it's effectively a `State` , just incidentally modeled as a `StateObject` for other reasons — however we were finding that a `State` was getting reset as well back to the initial value as well in that same scenario. I assume that's expected as well?

<@U03JX6SFGMS> ya State would be expected to behave the same as StateObject here since the motivation is to limit memory growth by avoiding preserving state for an unbounded number of (offscreen) views

--- 
> ####  Is there a way on watchOS for SwiftUI to present a modal where the stays bar is hidden? For example, how the keyboard menu in the phone app hides the time. The entered phone number is displayed in the status bar area instead. Thank you!


<@U03JJQ3BMB7> if you present a modal that has a confirmation action, the time will be hidden for you automatically, but otherwise, the time will always be there.

Ok, thank you. Is it possible to do this with watch kit or is the time always shown? I'm just wondering if it's possible for me to recreate the keyboard menu in the phone app. Thank you!

I don't think so. Can you provide a screenshot of the menu on the phone that you are trying to mimic ?

I am trying to make a calculator like app, and liked this layout from the phone app. I liked that the input pad keys were large and the entered numbers were in the status bar area

if you wanted to do that, you can do it in a modal sheet on watchOS, and you can provide a custom confirmation action as a button in the top right (like the delete button is), and you could provide a navigationTitle for content in the navigation bar, and then provide your own cancellationAction.

but the time will only hide if you actually put content in the navigation bar in that spot (via confirmation action placement toolbar)

Great thank you! Would you mind pointing me towards the documentation on custom confirmation actions, please? Thank you! 

<https://developer.apple.com/documentation/swiftui/toolbaritem/init(id:placement:showsbydefault:content:)>

and then tap on the placement link

Should describe those

That’s awesome! Thank you for your help! :grinning:

no problem! feel free to check in back here and `@` me to say whether it works or not

<@U03HHHXDL03> - Thank you for your help the other day! I got it working! :grinning:

That is so cool! I'm happy to hear!

--- 
> ####  Is there a way to have an `onChange(of:perform:)` Modifier but only call the closure, when the state was changed by the user and not programmatically?


`onChange` executes its closure whenever the value change (that’s why we require the value to be `Equatable`). So onChange only know about comparing the value that your are providing.

If you want to make that distinction you probably should model that difference in your state.

We have the same use case and we’re hooking into the action closure of a button separately for example.

I’d love to have a way similar to `.valueChanged` events from UIKit though. :sweat_smile:

--- 
> ####  Are there any Xcode build settings that might cause SwiftUI previews in a large/existing project to render text incorrectly?   I've noticed that `Text("\(doubleValue) \(floatValue)")` will incorrectly render doubles as `-NaN` in previews/simulators. Doubles renders correctly on device, and floats don't have the issue.


Thank you for reporting this issue. Did you file a feedback with this information? If not we would really appreciate if you could do that.

I haven't been able to reproduce this in a small, isolated project. The same code works without issue in a Swift Playground or a new Xcode project. What's the best way to file a feedback in this case without uploading my full repository and all of its dependencies?

You can start with just the information you posted here.

<@U03J7BQQNPJ> thanks, please see FB10112975

It's an issue on both Xcode 13 and Xcode 14

Thank you :man-bowing::skin-tone-3:

<@U03J7BQQNPJ> LOL right after I submitted the FB, I found the source of the issue. It was the Xcode scheme's "Localization debugging: Show non-localized strings" setting that was apparently clobbering the SwiftUI strings. Unexpected nevertheless—I'll update the FB now.

--- 
> ####  There has been a lot of controversy regarding the ObservedObject(wrappedValue: ) initializer. Is it safe (and encouraged) to use it, or do we have an alternative for it this year?


This initializer is fine to use! In fact, the `ObservedObject(wrappedValue:)` initializer is invoked every time you construct an `ObservedObject` , even if you don’t explicitly write it yourself. When you write: `@ObservedObject var myObservedObject = myModel`, The Swift compiler converts that standard property wrapper syntax to a call that looks something like: `var _myObservedObject = ObservedObject(wrappedValue: myModel)`.

The controversy I think you’re referring to is using that initializer explicitly in the initializer for one of your views. Typically, we see people doing this to allow observed objects to be instantiated with specific information. That is also something which we think is fine to do. We recognize that the ergonomics of that case is not ideal (since you have to access the de-sugared property wrapped (in the example I gave, `_myObservedObject`), but it’s not at all harmful.

What about the State initializer?

I think the confusion comes from this comment:
```
/// Don't call this initializer directly. Instead, declare a property
/// with the ``State`` attribute, and provide an initial value:
```

I think `ObservedObject` also has a the initialiser `init(initialValue:)` is that preferred? The documentation doesn't mention any warning on this initialiser

The state initializer worries me a bit more. Not because it’s dangerous — it’s totally fine to use it yourself (as I mentioned, the normal syntax is just sugar for the fully spelled out case) — but because I can’t think of as many cases where you need that syntax for `@State` that aren’t dangerous.

Remember that `@State` is initialized once per lifetime of the whole view, *not* once per time a view’s initializer is called The views representation will be recreated on demand. That means that if you’re re-initializing the state every time the views init is called, you’re going to be clobbering your own state.

So that’s fine to do, but make sure that you’re only using it to set the initial value of a state, and that you’re not resetting your state depending on some initializer value.

<@U03HKVDCL7N> I believe same applies for `@Binding` and co. too?

Yup!

But for `@Binding` is it still harmful? Because source of truth is already on a parent view or somewhere up there?

Yeah, binding is also one of the cases that would sound alarm bells for me :warning:

Yeah fair, I’d still be cautious instead of making assumptions. Very nice tip though, thank you! :heart:

As a final note: regarding the “don’t call this initializer directly,” that’s mostly because as I mentioned, the cases where you “need” the underlying initializer (for `@State` and `@Binding` especially) are few and far between. Most of the time, you’d want to be using the standard property wrapper syntax, so we want to make sure people reading the docs look there first.

Is the concern because State variable's lifetime is outside the view's lifetime and initialising the State variable in the view's initialiser would keep creating a new State every time the view get's created?

A recent use case where i would have used it was to pass in a value to a structs initializer, where that struct is also @State

Interesting.  The place I was using it was that I had a @FetchRequest that was based on a relationship to another object, so I was passing the object into init and then creating the fetch request based on it but was keeping that object as State.

Maybe I don't really need it to be State.

But maybe I shouldn't be creating the FetchRequest wrapper that way either?

<@U03J21ZD15Y> I noticed in this case that the FetchRequest is init everytime the View is init. It does not behave like a State or StateObject where the property is tied to the lifetime of the View. So if I use a predicate or sortDescriptors updated by my subview, any update in the super view will reset the predicate/sortDescriptor. So these should be higher in the hierarchy, or based on a State.

<@U03J20KFJG3> <@U03J21ZD15Y> same thing here FB9956812. The FetchRequest struct mistakenly contains a var object that it inits every time which breaks SwiftUI's View identity matching so body is called every time. Really hope it is fixed in this beta cycle.

@Tom you can init a FetchRequest with params like this:

`private var fetchRequest: FetchRequest&lt;Appointment&gt;`
    `private var appointments: FetchedResults&lt;Appointment&gt; {`
      `fetchRequest.wrappedValue`
    `}`

    `init(date: Date, userID: String) {`
      `fetchRequest = FetchRequest(fetchRequest: Appointment.sortedFetchRequest(userId: userId, date: date))`
    `}`

That wrappedValue trick is taken from the SectionedFetchRequest header comments.

--- 
> ####  Is using `@EnvironmentObject` for dependency injection of entities not directly related to the view state, like a Service (to fetch values from network) or a telemetry logger, considered bad practice? Thinking on a MVVM architecture context.


I wouldn't consider it a bad practice

Be mindful when using plain `@Environment`, that if you're passing a struct, any change in value will invalidate any views reading that value from the environment

But if you're using `@EnvironmentObject` with a class that's effectively immutable that shouldn't be a problem

In an MVVM context, as `@Environment` and `@EnvironmentObject` values are passed into the view, how can we get them out of the view  to view model or any other helper type?

I wish I could use `@Environment` and `@EnvironmentObject` directly in the view model that is associated with the view for example

<@U03HELTEP9T> Is there any documentation on `Self._printChanges()` There was one instance where it said `@96 changed` I was not sure what it referred to. Does it refer to `@FetchRequest`?

<@U03J1V9U7U3> it's best to learn the View struct, it is actually a view model so you don't need another view model object in SwiftUI. If you do use them you'll just get the bugs typical of objects that SwiftUI has been designed to eliminate by its use of value type structs.

For simple use cases, yes, I agree. I do exactly this in my own app, but it doesn’t scale in a larger team working on a complex project. Especially as we’re adopting SwiftUI incrementally.

--- 
> ####  I have a UIKit app on iOS. I am at the point of needing to decide—do I ship it for macOS with Catalyst, or given I’m doing a major redesign anyway, do I migrate it to be a SwiftUI app.  I am wondering—are any of the features/capabilities that I would have in a Catalyst app to make the app more "Mac like" that are not available on macOS using a native SwiftUI app? e.g., the "Bring your iOS app to the Mac" session showed the ability in Catalyst to enable/disable the traffic light buttons when they were not appropriate for that window. Is this kind of control also available in SwiftUI on macOS?


Hi - thanks for the question! With regards to your last part around the window controls (traffic lights) - SwiftUI will enable/disable these depending on the content of the scene. So, for example, a content view with a fixed size, will have the zoom and fullscreen button disabled. I'd also like to point out that on macOS Ventura, SwiftUI App lifecycle windows will be fully flexible by default (they can be resized to the maximum allowed by the screen). This can be opted out with a new `Scene` modifier - `windowResizability`. ie:
```
WindowGroup {
}
.windowResizability(.contentSize)
```

Enabling/disabling of full screen behavior is also related to the maximum size of the window's contents and how that relates to the screen size of the device

If there are other aspects that you would like to customize here, a feedback would be appreciated as well.

--- 
> ####  What is the best way to debug issues with the Live Preview when an error isn't thrown / the build doesn't actually fail and the "Diagnostic" button isn't available? In some instances when I resume the Preview, a "Build for Previews" is launched and then stops shortly after, pausing the preview again


In the new Xcode the diagnostic button is now always available in Xcode's menu Editor &gt; Canvas &gt; Diagnostics, so you can access them even when the canvas doesn't show an error banner.

Hard to say without the diagnostics (and potentially your project) what the root cause is, but from the symptoms it sounds like maybe your project has a script phase that modifies some of the source as part of the build? If you file a feedback with the diagnostic we might be able to help narrow down where things are going wrong.

--- 
> ####  I noticed a month ago on one of my Views that any TextField I add to my Form (within a VStack) extends the space below the Form. I only noticed as the view contains the Form in question and then an HStack with buttons. The space between the Form and HStack increases with each TextField I add to the Form. I created a stackoverflow question (linked at end) but couldn't figure it out. I got around this by surrounding it in a ScrollView (realized my other forms were fine and that's why) so I continued on. Figured I'd ask here though. :) <https://stackoverflow.com/questions/72293879/the-textfields-on-my-swiftui-macos-project-are-making-my-window-height-too-tall|https://stackoverflow.com/questions/72293879/the-textfields-on-my-swiftui-macos-project-are-making-my-window-height-too-tall>


hi, this does look unexpected. could you file a feedback with a sample project that reproduces it attached?

please do paste the number here so that we can make sure it gets routed to the right place

Sure. Where do I go to file the feedback again?

you can use the feedback assistant on your Mac or iOS device if they are enrolled in the apple developer or public betas, as well as <http://feedbackassistant.apple.com|feedbackassistant.apple.com>

a Mac enrolled in the beta programs should have Feedback Assistant visible in Launchpad; an iOS device should have an icon for it on the Home Screen. On a Mac, you can also open the assistant directly from `/System/Library/CoreServices/Applications` .

Just created it (through XCode). FB10112924

It's uploading the attachments right now

--- 
> ####  on watchOS is it possible to call the keyboard from swiftUI straight from a complication? i think we still have to do a wkinterfacecontrol or go through a textfield.


<@U03J7JKA23F> no, unfortunately not with TextField or TextFieldLink. Could you please file a feedback requeset?

--- 
> ####  Is there a recommended best practice for managing `StateObjects`/`ObservableObjects` in a primary-detail type setup? I've been commonly using `StateObject(wrappedValue:)` to inject a stateobject into a detail view, but of course because wrappedValue is an autoclosure it doesn't get updates to the data value that may occur from the primary view. Passing the entire primary `StateObject` to the detail view can expose more data to the detail view than necessary. And creating and managing an `ObservableObject` owned by the primary `StateObject` can be boilerplatey and messy to manage. Any approaches I've overlooked, or tips on how to approach those tradeoffs?


My intuition is that for a primary-detail setup, you would want the detail using `@ObservedObject` (or even `@Binding`) instead of `@StateObject`.

`@State` and `@StateObject` are defining a source of truth and lifetime for the state/model.

You want the lifetime of the state/model to live on beyond changing the selection in the primary.

`@ObservedObject` will listen to changed in the model object and update the view without establishing a new source of truth.

&gt; I agree with <@U03HELTEP9T> and would like to add that I read somewhere that using (wrappedValue:) of State/StateObject in this way is discouraged. I will try to find the source. 
&gt; For your use case, I would use @StateObject in root, then @ObservedObject in detail, or @Binding in detail if you only want to expose something specific


Is the recommendation to inject the entire root StateObject into the detail as an ObservableObject, or for the root StateObject to create and maintain an ObservableObject which has the subset of relevant data, and inject that into the detail view?

the latter

Content view &lt;- State Object, holds the truth
Detail view &lt;- ObservedObject/Binding, refers to the truth

Thanks. That was my instinct too... I just don't want to manage it. :stuck_out_tongue: But it's probably a good choice.

If you wanna take the pro route :sunglasses: you will rely on protocols, and inject instances as needed using a custom property wrapper. The instances will be stored using a custom class (or save yourself trouble and use something like Resolver)

--- 
> ####  With NavigationPath, I've already felt the need to pass it down to child views as a @Binding or @EnvironmentObject so that they can influence the stack programatically. Is that a reasonable approach or am I overlooking something?


Passing the binding or passing a navigation model as an environment object are both reasonable approaches with the API we have available today.

I hope we can make this more ergonomic. I’d love a Feedback with your use case!

I personally like the navigation model approach, since I can easily do other work when the navigation state changes without putting that code in my Views.

But either approach works fine.

So, a ViewModel (probably observableobject) that dictates navigation?

Yeah. That works for the way I think about navigation.

--- 
> ####  Could a WindowGroup value that has no stored dependencies be recreated along the lifecycle of an app?


Hi - would you be able to provide some more detail here? I'd like to make sure I understand your question fully.

If some value is stored not in a @State in the WindowGroup, for example, let uuid = UUID(). Will it stay the same in this specific case for the lifetime of the app. This is of course a bad practice, but I've seen it quite some time on the internet, and I would like to know if in this specific case, the value could be recreated or not as the app runs. This is more a theoretical question to try to get a better grasp around this specific value lifecycle.

In other words, are WindowGroup susceptible of being recreated even if they have no stored dependencies, no @State, etc.

I see. I think for this, I would likely recommend storing this in an app-level model, and providing that value to the `WindowGroup`

But are there (private) system events that can recreate the WindowGroup?

Mostly a theoretical question. I would always store something safely elsewhere, but I don't know if in this specific case, this is overzealous.

I don't think it's being overzealous, if that is what you are concerned about.

Thanks!

--- 
> ####  Is it possible to use `@State`, et. al from within a custom `Layout`? Or is there a different way we should parameterize our layouts? I noticed that the protocol doesn't inherit from `View`, so I wasn't sure if using the property wrappers would work.


You can add input parameters to your layout, and you can attach values to particular views using the `LayoutValueKey` protocol. To store data between calls into your layout, you can use the cache, but that’s only to avoid repeated calculations, and you should be prepared for the cache to go away at any time.

Okay, so anything stateful should live in the parent view (and be passed as init args) or in a child view (and be read through a `LayoutValueKey`) ?

Yes

Makes sense, thanks!

--- 
> ####  Is there a newer way to debug a view while it's in preview?


Best way to debug a preview now would be to use Xcode's menu item Debug &gt; Attach to Process (or the Process by Pid or Name) and select/use the name of your app. Then update a string literal in that view and it should cause the View's body to get called and hit any breakpoints you've got in that code.

Hope that helps!

OMG! That is amazing.

Awesome thanks!

--- 
> ####  I would like to migrate my (very complex) iMessage app extension to SwiftUI. How do I deal with the MSMessagesAppViewController? Do I need to use some mix of UIHostingController and UIViewRepresentable?


You should use the UIHostingController as a child of the MSMessagesAppViewController

--- 
> ####  When implementing `path(in: CGRect)` of a Shape, are dynamic Property Wrappers  assumed offer the correct values, or is this only valid for `bodies`?


Shapes don’t have the same data flow primitives as views do, so things like state, environment, etc. won’t work, but don’t despair! You can still get the results that I think you might want. Since you’ll eventually be showing your shapes somewhere in a SwiftUI `View`, you can hoist your data flow up to the SwiftUI `View` level, then pass down that information about state, environment, etc. down to the shapes.

--- 
> ####  What is the best way to make a TextField wrap? I noticed some new API regarding lineLimits and axes, and wondering if those provide some functionality in this area.


TextFields can be initialized with a new `axis` parameter. If you provide a .vertical axis, then platforms like iOS and macOS will wrap the text of the text field in a scrollable container instead of letting the text expand horizontally.

See one of its inits here: <https://developer.apple.com/documentation/swiftui/textfield/init(_:text:axis:)-7n1bm>

Awesome, thanks!

These text fields will also respect the line limit modifier. So specifying a `lineLimit(3)` will let the text field grow vertically up to 3 lines and then it will stop growing and scroll instead.

--- 
> ####  As we get more and more familiar with SwiftUI we use `GeometryReader` less and less, but what are some tells that there's no way around it?


If you want a visual effect like corner radius, opacity, or color to depend on your geometry, GeometryReader is the way to bridge between these two worlds

I particularly use `GeometryReader`  a ton to contextualize Gestures (e.g. to see whether the user has dragged all the way to the left or right of a control). Is there a different way?

Layout gives you a superior tool for encapsulating layout logic for re-use. And while using `GeometryReader` you can position children, the `GeometryReader` can't reflect back any custom sizing behavior.

This is one of the reasons it can become unwieldy when used in complex layouts—because the `GeometryReader` becomes fully flexible.

Ben, would the new `SpatialTapGesture` help? <https://developer.apple.com/documentation/swiftui/spatialtapgesture>

What is the difference between `SpatialTapGesture` and `TapGesture`? :thinking_face:

<@U03HELSV45B> Is it possible to understand the extent of the view from `SpatialTapGesture`? My main use case is determining where the touch is within a view (ie knowing that a touch is 10% left and 30% from the top)

…I'm also squinting at `SpatialTapGesture` and seeing whether I could hack "true" pinch to zoom (with location) using this new API :thinking_face:

&gt; What is the difference between `SpatialTapGesture` and `TapGesture`?
For `SpatialTapGesture` the event in `onEnded` now provides the tap location.

Ah, `SpatialTapGesture` only seems to have `onEnded`... `FB9489089` and `FB9488452` remain!

--- 
> ####  Would you recommend to use @State/@ObservedObject for any cases where where we don't expect the object to mutate?


If the values you’re represented are never going to change, there’s no need to use `@State` or `@ObservedObject`. I highly recommend just making and using a standard `struct`.

<@U03HKVDCL7N> what about reference types in views? Would `let` suffice?

Should I ever be concerned that as the view gets thrown away and recreated my `UISelectionFeedbackGenerator`  instance (for example) will be continuously re-created as well?

Let *would not* suffice for reference types! A `let` binding for a reference type just says: “This will always point to the same instance of the object”. It *doesn’t* guarantee that that instance is immutable. If you can guarantee that your reference type is completely immutable, then you should be fine, but that can be a hard thing to ensure, so be cautious (and I would highly recommend using structs where you can)

Petar, I wouldn’t ever be concerned that your view gets thrown away and recreated. That’s by design. SwiftUI views aren’t linked to their actual UI representation, but rather are lightweight descriptions of views that can be recomputed quickly and easily. You should expect your views to be thrown away and recreated very frequently.

Thank you <@U03HKVDCL7N>, and just to hammer to point:
Don’t worry not just that the views are getting recreated, but also what instances get recreated with them.

--- 
> ####  Is there a way to enable interaction with the new device variants in previews?


No, unfortunately not. The preview is only interactive when viewing it in the `Live` mode, and all the other modes are static previews

Is there a way to make the `Live` mode preview landscape?

yes, use the `Device Settings` button to change the orientation to be landscape

--- 
> ####  with the new `any` keyword, will we still need `AnyView` to type erase views, or can we declare a collection with `any View` now? will this also have the same performance implications of using type erased views?


Ideally you should not use  `AnyView` and over the year `ViewBuilder` has improved enough that you should be able to eliminate most, if not all, its usage.

That said, yes you will still need to use `AnyView` because you need to actually instantiate that type, and not just use `View` as a type. `any View` is just defining an (existential container) box.

is it possible to use view builders as function params or property types without Generics?

we are using AnyView to present content. there are different types of content each represented by an enum with associated value. This forced us to use AnyView to have concrete types. What would be your suggestion to move away from AnyView in this use case?
Thank you :relaxed:

If you have finite number of views you are displaying described by an enum could you switch over that enum in `body` of a view? `ViewBuilder` does support `switch` statements

I have similar use case. Sometimes I would like to not couple the view which other views it present, but instead use other _Flow/Factory_ logic that shows whats needed depending on the business logic. It forces me to use `AnyView` . E.g.
```
struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    var channelsViewFactory: (Int?) -&gt; AnyView

    var body: some View {
        Text("ABC")
        channelsViewFactory(viewModel.selectedId)
    }
}
...
extension AppDependencies: MainViewFactory {
    func makeMainView() -&gt; MainView {
        return MainView(
            channelsViewFactory: { id in
              if loggedIn {
                self.makeChannelsView(for: id)
              } else {
                self.makeSignInView()
              }
         }
     }
}
```

It really depends on your use case. But most of the time, if you're in the situation where you think you need `[AnyView]` or `[any View]`, what you should likely do is invert the view dependency flow and have `[AnyDataModel` or `[any DataModel]`  instead, then create your views based on the type of data provided at runtime.

In Łukasz case, you could introduce generics into  `MainView` (e.g., `MainView&lt;ChannelsView: View&gt;: View`) and then create a container view above `MainView` to encapsulate the generic constraint(s).

--- 
> ####  We can now use preview to instantly see different dynamic type sizes and schemes all at once when using SwiftUI in XCode. Can we also see different devices at the same time? e.g. all iPhones that support iOS16


We do not currently have variations on devices/device types available. We are actively monitoring for what set of variations the community would find the most useful, so please do file enhancement feedback reports with examples of where and how you think a new set of variations would be useful.

Thank you <@U03H32HKZ0F>! Previewing the app live on all iPhones (or Apple Watches, or whatever) at once would be absolutely smashing! :zap:

--- 
> ####  String input on WatchOS is quite limiting, because it happens in a non-customizable modal. Are there any tips or guides on how to achieve autofill of a textField on watchOS?


<@U03JMMN8659>  can you specify the text content type on your text fields?

If you specify .username, .email, or .password, on the appropriate textfields, the system will provide the little keychain icons for autofill appropriately.

please let me know if this works.

In my case it is custom strings. In my app, the user can see a List of mushroom species and search for a specific species using TextField. On iOS, I implemented another List that overlays the screen and shows results satisfying the user-typed value. The user can tap one of the results to complete the string. Not sure how to proceed in watchOS though

that sounds like a great use case. could you file a feedback with this info so we can pass it along?

yes, that^

And until then .. .

Can you create a modal, which has a list, and at the top of the list, you include a TextField, and below the textfield you include list items that are your autocompletions, and if they tap one of those, they get the short cut values, and if they tap the textfield they can enter the raw text?

<@U03HW7PE3SM> will do! <@U03HHHXDL03> not quite, since each mushroom species is unique, so the selection depends on the first several characters of a string. For example, typing "ama" will bring up mushrooms from the "Amanita" genus. Also, on watchOS, once the user taps on the textfield, the entire screen is covered by the modal, so there is no space for dynamic suggestions to come up while the user is typing.

Demo of how this works on iOS

I wonder if the new quicktype bar in the keyboard in watchOS 9 would be able to autocomplete some of these?

oh! you could totally implement this with search

have you tried .searchable on watchOS ?

I mean, it might not be exactly the same experience, but it would be very close.

one minute, lemme look up documentation for it, it was an API we did last year, and I'm trying to page it back in

I’d start here: <https://developer.apple.com/documentation/swiftui/adding-search-to-your-app>

lol, you found it before me... distractions are difficult to avoid :slightly_smiling_face:

ya give that a shot, using suggestions based on the text, and using results, etc.

It would not help in this case, but getting a number keyboard for watchOS could help in other input fields!

thank you both <@U03HHHXDL03> and <@U03HELSV45B>! I will definitely take a look. But I'm not sure if searchable is the right solution, because I need to pass the user-typed value anyway, even if no results are found. For example, imagine the user just found a mushroom species that's not in my List! In this case, I allow the user to create a finding using whatever he/she typed (e.g. "Unknown mushroom", or "Some goop"). If the string is "", I also allow the finding to be saved as an "Unknown species". Is this something achievable using .searchable?

ya, you could have one of the search results always be the literal string that the user provided

So the first result would be the literal, and the rest of the results would be actual search results.

you might want to talk with the design lab folks about differentiating the literal from the actual results, but you should be able to achieve something like that

aha, interesting. And the matching results will somehow pop onto the screen as the user is typing?

the user will have to type the first few characters and click the done button in the top right, so not exactly.

if searchable is helpful, great, but if you still feel like there's room for something to be better, please file a feedback request.

ok, thank you. I will definitely take a look and explore. <@U03HHHXDL03> thank you for your patience and kind support! :heart: may you find only choice mushrooms on your hikes :mushroom:

ha! no problem at all.

maybe I'll find a new species!

--- 
> ####  My app’s design uses kerning on most of its buttons, but I can’t put that inside of my ButtonStyle because kerning is only available on Text, not ButtonStyleConfiguration.Label. I have a feedback open suggesting passing kerning through the environment (FB10020695).  In the meantime, do you have any suggestions on how to do this without using .kerning() separately on *every* button label nor making a custom button View?


The only other thing I can think of is to create a Button wrapper view that requires a Text be passed in as a parameter. Then attach `kerning` to the Text yourself and pass it to the underlying Button

Haha, was hoping to avoid that so we didn’t need to handle other permutations like buttons with text and an icon, etc :slightly_smiling_face:

One other avenue I’ve been exploring is a custom Text view that accepts kerning through an Environment value applied by the ButtonStyle, though that has led to needing to reimplement multiple `init`s from Text. Doesn’t feel too great, either :sweat:

Thanks!

<@U03JELC631P> the approach I normally take here Is to create a reusable view specifically for the button label rather than an entire button view. This results in code that composes nicely. I still use button styles for styling buttons more generally. 

Thanks <@U03HT7Z5NAK>, that’s sort of the direction I was headed with the “custom Text view” idea—think like:
```
Button(action: {}) {
  MyAppText("Hello World")
}
```
and then the ButtonStyle would set kerning in the environment for `MyAppText` to look at.

Still means our team needs to remember to use `MyAppText` instead of `Text`, but maybe that’ll be easier to remember than peppering `.kerning` everywhere :smile:

--- 
> ####  How would one go about creating a Bubble Chart with Swift Charts?


You can use the `symbolSize(by:)` modifier (<https://developer.apple.com/documentation/charts/chartcontent/symbolsize(by:)>) to size the points by data.

To make the points look like bubbles, you can use `.symbol(Circle().strokeBorder(lineWidth: 1))` so the symbols are drawn as stroked circles.

Here is an example:
```
Chart(data) {
    PointMark(
        x: .value("Wing Length", $0.wingLength),
        y: .value("Wing Width", $0.wingWidth)
    )
    .symbolSize(by: .value("Weight", $0.weight))
    .symbol(Circle().strokeBorder(lineWidth: 1))
}
```

great, thanks

--- 
> ####  SwiftUI macOS: How can I control how the focus moves around the controls of my view when I press "tab"? Currently it jumps from top left to right, then down. But I have two columns in my window and would prefer it go down first on the left side and then again up to the right.  Is there some functionality to pre-define the order of the controls?


You can use `View.focusSection()` for this, which is newly available on macOS 13.0. Marking a view as a focus section causes the Tab loop to cycle through all of the section's focusable content as a group before moving on to the next thing in layout order. So, something like this should get you the sort of column-wise navigation you're after:

```
struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                FocusableView()
                FocusableView()
            }
            .focusSection()

            VStack {
                FocusableView()
                FocusableView()
            }
            .focusSection()
        }
    }
}
```


Thanks, that's nice!

Also, a plug for my colleague Tanu's WWDC21 talk: Direct and reflect focus in SwiftUI

<https://developer.apple.com/videos/play/wwdc2021/10023/>

It goes over some tvOS use cases for `View.focusSection()`, and also describes how to work with focus programmatically using focus state bindings.

--- 
> ####  With the new MenuBarExtra API on the Mac, if I want the menu item to be persistent after my app quits, do I need to do any extra work (e.g. adding a login item) or does the system automagically make sure it appears after reboot/logout?


Hi - this is a great question. You can certainly use `MenuBarExtra` to create a standalone menu bar app, though you may want to look into the `Info.plist` changes noted in the documentation:
&gt; For apps that only show in the menu bar, a common behavior is for the app to not display its icon in either the Dock or the application switcher. To enable this behavior, set the `LSUIElement` flag in your app’s `Info.plist` file to `true`.
If the menu bar app is used in conjunction with a main app, then you'll need to package it together (ie, the "helper app" model). Adding a login item sounds like the way to go if you want it to show at login regardless of the user's preference for restoring state.

We'd also certainly welcome any feedbacks for enhancement requests in this area as well.

Got it, that combined with the new login item APIs this year should make this sort of thing a lot easier. Thanks!

<@U03HHJH9C66> Please make MenuBarExtra available in Catalyst so we can use it with HomeKit which is Catalyst only on Mac at present.

--- 
> ####  Is there any specific style guide for SwiftUI ?  There are some cases in SwiftUI that I'm not sure what's the best. f.e. var body: some View {      myAmazingView }  (More readable)  or   var body: some View { my AmazingView }  (A one-liner!)


We don’t have any specific style guide! Use whatever you and your team think feels best. Personally, I’m never opposed to writing one liners on one line in Swift though :slightly_smiling_face: The language is so beautifully concise, so I like to embrace that.

--- 
> ####  If your app is always behind an authentication session what is a good approach for blocking the app's content when authentication is required? In UIKit apps it was common to display a separate UIWindow atop your app's main window. Is this still a good way of handling it in a SwiftUI app?


Interesting question!

Without knowing the details of your app, my inclination would be to try the RedactionReasons API.

You can use the `.redacted` modifier to set a redaction reason. SwiftUI controls will automatically react to that, hiding sensitive data. You can also read the reason from the environment to redact in custom controls.

Not the most elegant, but I’ve done something like this
```
if let _ = auth.sessionToken {
  ContentView()
} else {
  AuthView()
}
```

You could also use an overlay modifier at the root of your hierarchy to present a view over the whole app, then adjust that view’s opacity based on the log in state.

Yeah, it's not a cookie cutter kind of problem but curious about other ideas

Personally, I’d prefer swapping `rootViewController` of the app’s window in a UIKit environment. I think the closest approach in SwiftUI would be as Andrew shared above. Not sure if this would cover the need in question though.

This is my approach currently, but it’s got some drawbacks...  I’m interested to know how others are doing.
```
WindowGroup {
    switch userSessionManager.isLoggedIn {
    case true:
        TabViewScreen()
            // .viewModifiers
            //(environmentObjects, etc.)
    case false:
        LoginScreen()
    }
}
```

Yeah, the main drawback of conditionally showing different content is you kind of destroy the user's current context as you show the `LoginScreen()` which is why I like the window approach

I tried using .fullScreenCover instead to fix that. But that does not guarantee that your sensitive data will always be covered up when the user is logged out mid-session.
e.g. when another sheet or fullScreenCover from a subview is already shown, and even when it is dismissed later.
.objectWillChange isn’t called again and the login screen does not pop back up.

This is actually still a problem with the above approach. So sadly I tend to avoid using sheets and fullScreenCovers for that reason.

--- 
> ####  is it recommended to use switch-case views for e.g. showing different view types in a list or grid instead of using specific types via generics etc.?. are there any better ways? like: `List(items) { item      switch item.type {      case ...:             SomeView(item)      case : ...      } }`


When you use a `switch` within a `@ViewBuilder` closure, you are in fact using the power of generics :wink:, but in most common cases you hopefully don’t have to think about that overtly.

In general, using `switch` in view builders is a great tool! The best approach really case-by-case though, just as when deciding to use a `switch` versus other control flow in regular imperative code.

Are there any specific alternatives to a `switch` you were considering?

--- 
> ####  Is there a preferred method to allow user interaction with data points in a chart imbedded in a scrollview?


Can you provide a little more detail here? How are you trying to interact with the data points in the `Chart`? And the scroll view scroll gesture is interfering maybe?

My app uses data visualization to allow the user to edit errors.  So I would like the user to tap on the portion of the chart they are interested in and link to a  List below where that data row is then selected for editing

There can be hundreds of data points in the list so finding the correct one to edit can be cumbersome without the touch feature

I currently don’t use a scroll view but would like to as this would allow more space for tapping on the data element.

This talk <https://developer.apple.com/wwdc22/10137> has some examples of adding interaction

I think that would be orthogonal to the question of embedding the chart in a scroll view, but it may complicate hit detection depending on how big the chart is

It is an iPhone app so I don’t have lots of space.

--- 
> ####  Does branching in a views body (via `if-else` or `switch`) cause the creation of each branch's views?


It only creates the views for the branch of the `if`/`switch` that’s actually taken.

This is why conditional / inert modifiers are so important, too. Highly recommend “Demystify SwiftUI” from WWDC 2021 for more info.

That was an awesome session, I definitely need a refresher :sweat_smile:

I’ve watched it … way too many times. :sweat_smile:

This topic actually deserves a small section of a sample app. We should be shown how to use ViewState enums, rather than if-else statements within View! :zap:

--- 
> ####  What is the best way to pass down data managers, specifically a media player to subviews?


You can pass them just as argument to your subview initializer. If you have multiple subviews or the subview that needs to use that data manager is further down the hierarchy you could use the `Environment` to pass is down

Great. Is there an example of this somewhere?

The documentation for `EnvironmentKey` has code example for it <https://developer.apple.com/documentation/swiftui/environmentkey>

Wonderful, thank you!

--- 
> ####  Is it a known problem that using a custom Layout with multiple subviews doesn't compile? For example, this minor change to the CustomLayoutSample project, adding a second subview to the use of MyEqualWidthHStack, won't compile:  struct ButtonStack: View {     var body: some View {         ViewThatFits { // Choose the first view that fits.             MyEqualWidthHStack { // Arrange horizontally if it fits...                 Buttons()                 Text("hello")             }             MyEqualWidthVStack { // ...or vertically, otherwise.                 Buttons()             }         }     } }  Or am I just doing it wrong?  FB10113527


That’s a known issue. See the iOS and iPadOS release notes here: <https://developer.apple.com/documentation/ios-ipados-release-notes/ios-ipados-16-release-notes>

You can search for “custom Layout”

--- 
> ####  How can I change the (text) color of the scales at the sides in a Swift Charts?


You can change the color of the axis labels with the `.chart{X/Y}Axis` modifier, where you can configure the `foregroundStyle` of `AxisValueLabel` . Here is an example changing the label color for the Y axis:
```
.chartYAxis {
    AxisMarks { _ in 
        AxisGridLine()
        AxisTick()
        AxisValueLabel().foregroundStyle(Color.red)
    }
}
```
You can change the color of the grid line and tick in a similar way too.

Could it be that this currently doesn't work in the developer beta?
Because I just tried the following code and it applied the colors on the grid line and tick, but not on the label next to the tick.
```
.chartYAxis {
                AxisMarks { _ in
                    AxisGridLine()
                    .foregroundStyle(.yellow)
                    
                    AxisTick()
                    .foregroundStyle(.blue)
                    
                    AxisValueLabel()
                    .foregroundStyle(.red)
                }
            }
```

Yes, looks like this is a bug in the beta. Feel free to file a bug via Feedback Assistant.

--- 
> ####  As we are incrementally adopting SwiftUI in a UIKit app, are there guidelines for replacing the patterns that we are used to in a UIKit app, like delegate pattern, notifications, target-actions etc? Some of these are obvious but I kind of feel I'm doing something wrong whenever I pass a closure into a view to get a feedback to replicate delegate pattern for example. :sweat_smile:


Delegates do a lot of different things in UIKit, and so the way that they should be translated into SwiftUI can vary heavily depending on what they’re being used for in UIKit. In some situations they’ll become closures that you pass around, in others, a `Binding` or `State`, sometimes a `onChange(of:)`, etc. UIKit and SwiftUI have two very different programming models, so often times, concepts don’t map over in a one-to-one way.

I’d highly recommend you book a lab appointment so we can chat more about what specific case you’re trying to translate, and where your pain-points are there :slightly_smiling_face:

Awesome, will definitely do that. Can you please touch on using Combine for such feedback mechanisms? I also explored passing a subject into a view to observe a feedback but that also felt a bit wrong.

--- 
> ####  I'm working with CoreImage filters, and currently using the CIContext to create a CGImage, which is turned into a UIImage, which initializes a SwiftUI Image. Is there a better or more efficient way?


You should be able to avoid the intermediate UIImage and initialize a SwiftUI Image directly with a CGImage

omg, how did I not see this? Thank you!!

--- 
> ####  How can I add use an SVG in my SwiftUI app?


You can add an SVG in the asset catalog and it can be rendered via a named `Image`.

Checking “preserve vector content” (or similar) in the asset item preferences will render it from vectors instead of raster.

Drag SVG to Assets. In Inspector, check "Preserve vector data", and set scale to "single scale"

Is there any way to load SVG image from file system?

Also, an important tip that should be more known: SVG foreground color can be changed dynamically! So you don't need different color versions of your SVG image if you want to change color while your app is running

--- 
> ####  I noticed that when a subview uses a binding to published variable from an ObservableObject, the subview's body will re-execute any time *any* of the other published variables in the ObservableObject are modified. Even if this modified variable isn't used by the subview at all. Is this a bug or a performance concern?


The subview updates based on the `objectWillChange` publisher, which is a composite of all the published properties. This is by design, but can require fine tuning of models.

Different apps can handle this different ways, so this might be an excellent question for a lab.

Or even a Developer Technical Support ticket!

Thank you!

And views are incredibly cheap in SwiftUI! Don’t hesitate to break them up into smaller pieces.

And generally avoid side effects in your view’s initializer. Generally, IMO, I wouldn’t expect performance concerns from the body being repeatedly invoked.

Yeh pass properties of the object into subviews and then only the views that were given different values should have their body called. However if a view has a FetchRequest its body is called every time because of a long term bug!

--- 
> ####  I currently have a large data set (over 10k datapoints) that I'm working with. Are there any tips on how to improve the graph performance when working with creating line graphs from data sets of that size or larger?  Context is cycling related data in a macOS app that is presenting 6 or more in a LazyVGrid.


We recommend simplifying the data before rendering it. For your example, you could simplify the line or summarize the data points in small intervals (let’s say you have data for a year, you summarize the data for a day). The added advantage is that you can summarize using mean, min and max and show the full range within the small interval.

Sorry if non-Apple people aren't supposed to comment on this, but an Apple resource I found helpful with this kind of thing is using antialiasing filters to resample the data. <https://developer.apple.com/documentation/accelerate/resampling_a_signal_with_decimation>

Thank you for the pointer <@U03JKLW88TZ>.

Another useful resource are the number and date bins we released this year: <https://developer.apple.com/documentation/charts/datebins> and <https://developer.apple.com/documentation/charts/numberbins>.

--- 
> ####  Is there a way to get `AreaMark` to work with `.chartYScale(domain: .automatic(includesZero: false))`? As soon as I add an AreaMark it seems to always include 0 in the scale.


You could try setting `yStart` and `yEnd` for the area, here is an example:
```
Chart(data) {
    AreaMark(
        x: .value("Date", $0.date),
        yStart: .value("Start Price", 100),
        yEnd: .value("Price", $0.price)
    )
}
.chartYScale(domain: .automatic(includesZero: false))
```
The automatic option will use nicely rounded numbers. If that's not working for you, you can also set the domain directly like `domain: 100 ... 1000`

:thinking_face: the first suggestion doesn’t quit work because there is some padding added to the y range. I’ll give a specific range a try next.

Just setting a range doesn’t quit work either… I guess I would need to do both?

Umm, could you try turning off `roundLowerBound` in axis marks? Full code would be like this:
```
Chart(data) {
    AreaMark(
        x: .value("Date", $0.date),
        yStart: .value("Start Price", 100),
        yEnd: .value("Price", $0.price)
    )
}
.chartYScale(domain: .automatic(includesZero: false))
.chartXAxis {
    AxisMarks(values: .automatic(roundLowerBound: false))
}
```

`roundLowerBound` tries to add a round number below the data range, that might be why we are seeing a 40,000 value below the area like in your first screenshot.

That works

--- 
> ####  Can Swift Charts be adapted for non-discrete data, like curves, etc today?


You can render curves by sampling data points along the function and then rendering that. You can add interpolation to make the line look smooth. Swift Charts cannot directly render functions.

Thanks Dominik M for clarifying the point of functions and Swift Charts.

<@U03HW7NSMFT> I was wondering if there were some kind of closure-based API to encapsulate the function, with parameters like range and increment

Examples

There is not but you could sample a few points and then render the line.

--- 
> ####  Is there any sample code or documentation on how to display vector fields with Swift Charts?:upside_down_face:


Like this?

Yep

This screenshot is from the Hello Swift Charts talk. Let me find the code for it.

You can use a custom symbol (`Arrow` ).
```
        Chart(data, id: \.x) {
            PointMark(x: .value("x", $0.x), y: .value("y", $0.y))
                .symbol(Arrow(angle: CGFloat(angle))
                .foregroundStyle(by: .value("angle", angle))
                .opacity(0.7)
        }

...

    struct Arrow: ChartSymbolShape {
        let angle: CGFloat
        let size: CGFloat

        func path(in rect: CGRect) -&gt; Path {
            let w = rect.width * size * 0.05 + 0.6
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 1))
            path.addLine(to: CGPoint(x: -0.2, y: -0.5))
            path.addLine(to: CGPoint(x: 0.2, y: -0.5))
            path.closeSubpath()
            return path.applying(.init(rotationAngle: angle))
                .applying(.init(scaleX: w, y: w))
                .applying(.init(translationX: rect.midX, y: rect.midY))
        }

        var perceptualUnitRect: CGRect {
            return CGRect(x: 0, y: 0, width: 1, height: 1)
        }
    }
```

This is not the complete code but should give you enough to make the example.

Nice! That’s the thing I was looking for, thank you!

Alright, I’m getting closer :smile: What’s left is to figure out what the format was used for `data` in the sample and where angle came from :thinking_face:

Very cool.

And here we go

It is quite delightful to use this framework and the performance is great. Many thanks to the team :pray:

Though, documentation seems to be out of sync with reality a bit. For example, this snippet from `PointMark` does not compile. I’m assuming that the functionality with KeyPaths is not in the first beta yet since I recall similar syntax from the sessions

--- 
> ####  How are large datasets handled, is there automatic sampling or some kind of recommended limit?


There is no automatic sampling in Swift Charts. I would expect the "preferred" sampling method to vary on a case-by-case basis. I think the best approach is to see what works for you and then sample in a manner that is honest to your data as you run into performance issues. We're always looking to improve the performance of the framework! File feedback if you run into issues.

As a general design principle, I would recommend simplifying / aggregating data  as it becomes large. It's rarely useful to look at large amounts of raw data on the screen, as you run into the limits of 2d rendering wrt to occlusion, fidelity, and noise resolution.

Does that help <@U03HZ4PT2ER>?

<@U03H3193G3H> A little, so are you recommending at most one mark per screen point?

and would we use GeometryReader to get that info?

One point per screen point is probably excessive too (from a legibility perspective, if not a performance one)... it would help to get an idea of what you are trying to achieve &amp; what your data looks like

We draw a lot of scientific data, some is discrete, other is calculated/continuous

Can you give a rough estimate to what number of marks the Charts will scale? Like a 1000? I’d also like to plot data that comes in every other second in a scroll view, and would probably have to cut off at some point?

Our data is available at once, and can have 5000 points. It will be static with no points just the lines

cc <@U03HHJH7RJN>!

It depends on the machine performance and complexity of the chart. It's usually a good idea to test with your actual data and chart to figure out how many points can be drawn with acceptable user experience.

No rough scale? Like 100, 1000, 10k, 100k no problem? On say an iPhone 12 Mini?

Based on my experience it's about 1000 to 2000 for smooth animations.

Thanks!

You may be interested in the date and number bin apis we added this year: <https://developer.apple.com/documentation/charts/numberbins> <https://developer.apple.com/documentation/charts/datebins>. You ca use them to group your data and then summarizing the data in each group/bin.

<@U03HW7NSMFT> Interesting, we already have histograms, which we handle differently from this, but I will take a look

For large data sets scrolling is inevitable. I guess we have to embed some Chart views into something's like a lazyhgrid - assuming that we can get rid of any padding/scaling numbers to get a seamless/infinite chart. Is that doable?

<@U03JRNE4KJL> you might be able to do that with the chartOverlay and manual drawing with the axis objects, then handle gestures for scrolling

--- 
> ####  How easy is it to support interactions like pan-to-move and pinch-to-zoom?


For pan-to-move, you can use a SwiftUI gesture in conjunction with `ChartProxy`. From the gesture, you get the the pan distance, and then you can use `ChartProxy` to figure out the pan distance in the data domain. Then, you can set the domain for the X scale with `.chartXScale(domain: start + offset...end + offset)` , where you can adjust the offset to pan the chart.

Can a similar strategy be used for pinch-to-zoom?

Yes, you can use a pinch to zoom gesture (or any other gesture) and hook up the events in a similar way.

Without location information (like the new `SpatialTapGesture`) it would be a bit unnatural as we wouldn't know where to center the zoom, right? `MagnificationGesture` doesn't provide location information, unless I've missed something

Feel free to file a feedback to SwiftUI for providing location information to gestures.

For now I think you can try implement a `UIView` with `UIPinchGestureRecognizer` and then wrap the view with `UIViewRepresentable` so it can be used in SwiftUI.

--- 
> ####  Can we highlight specific data points and dim the rest; similar to what <http://Health.app|Health.app> does when selecting “min/max”, “latest”, etc in Heart Rate and other charts?


absolutely! An easy way to do this is to store the desired highlighted data's ids in a `@State` and check against that in your `ForEach` of `Marks`. Something along the lines of

```
ForEach(data) { value in
  BarMark(x: ..., y: ...)
    .foregroundStyle(value.id == state.highlighted ? Color.red : Color.gray)
}
```

--- 
> ####  Is it possible to use a Chart to display a large amount of data? For example, display a waveform.


Yes! <https://wwdc22.slack.com/archives/C03HX19UNCQ/p1654798399767779?thread_ts=1654798325.944549&amp;cid=C03HX19UNCQ>

We generally recommend aggregating very large datasets since there are only so many marks that can be rendered and reasonably read by a user. Swift Charts can process and render a reasonable number of data points.

Thank you!

--- 
> ####  Is there multiple axis support? Logarithmic axis support?


A Swift Charts chart can only have one axis per x and y. Swift Charts supports logarithmic scales.

For example, you can specify a log scale on x with

`.chartXScale(type: .log)`

Thanks

You can however, have multiple sets of labels / ticks / grid lines by adding multiple `AxisMarks`

they will share the same scale, but might be useful for things like displaying both `C` and `F` on the same chart

Yeah, we often have requirements to show multiple data sets with varying scales for comparisons

Can you put those different sets of marks on opposite sides of the chart?

In <https://wwdc22.slack.com/archives/C03HX19UNCQ/p1654799167892029> I talked about ways to show multiple metrics as separate charts.

--- 
> ####  Swift Charts is really fun! Thanks for adding this, I'm having a blast! :)  I have one question about the axis labels on charts. When I use the `chartXAxis` modifier to show custom `AxisMarks` with an array of values (dates in my case), the chart doesn't show the last value on that axis (the last date). Is it possible to turn that on?  ``` //  Simple Chart .chartXAxis {   // data contains two data points with a date. The entire chart only has these two data points   AxisMarks(preset: .extended, values: data.map(\.date)) } ```


Love to hear it <@U03J21TPWPM>! I think I can guess what is going on here. If a label is placed beyond the edge of the axis, (as can be the case with the last value of a list of dates, as it would define the end of your date range) it won't be rendered, as it would run off the edge of the chart.

Off the top of my head, solutions may include: adding a bit of "padding" in your date range or switching the axis style.

does that help?

Yes, thanks :slightly_smiling_face:

--- 
> ####  Is there a way to have multiple scales per chart? Let's say I'm doing weather and I want one line with cloud cover (a 0-100% scale) and rainfall per hour (in, say, mm). The x axis on both of those would be time, but the y axes are different.


An axis always has one scale. So x and y have one scale. You can have multiple axes to display e.g. temperature in C and F. If you want to show multiple measures, I would recommend multiple charts with aligned x-axes. You can even hide the axis of the upper chart to create a more compact view.

--- 
> ####  Hey Richard, I'm in love with the Swift Charts framework. I like how we can customise the charts to fit our needs. I noticed some layout issues with the Legend, when there are a lot of items to display, or when the names are long. Do you plan to make the legend Layout automatically wrap/use multiple rows when there is not enough space? I noticed the iCloud design on iOS switches from a HStack to a VStack when the device accessibility is set to true. My feedback with more infos: FB10125848


Thank you for your feedback!

--- 
> ####  Adding data to charts and the modifiers always requires this `.value(_:)` function that requires a label key. What exactly is the purpose of that label key? Is it some kind of identifier? Does the label key in a `foregroundStyle` have to match one in a `LineMark`, for example (if referencing the same data)?  Thanks! :)


The label key is used for generating a good default description for the chart for VoiceOver users and the audio graph. For example, if you have `x: .value("time", ...), y: .value("sales", ...)` , VoiceOver users will hear something like "x axis shows time, y axis shows sales".
The label key in `foregroundStyle` doesn't necessarily need to match `LineMark`, but it's a good practice to use the same label if the data is the same.

Awesome, thanks for the explanation! :slightly_smiling_face:

--- 
> ####  Are there any limitations to the result builder syntax used to add marks?


<@U03J21ZK802> can you clarify what you're looking for here?

How many entries can we put in there? View builders are typically limited to 10. Would grouping help if there is an arbitrary limit based on the builder?

Got it! Right now it's 10. Grouping into ForEach's etc would help! If you have a use case that requires more, please file feedback~

--- 
> ####  Swift Charts looks very cool and well designed. What were the inspirations for its API design? It feels very similar in many aspects to ggplot2 which itself is apparently based on "The Grammar of Graphics" book. Was that an inspiration?


Thank you. Its’ great to hear that you enjoy the API.

Swift Charts is a grammar based visualization language, which means charts are composed of building blocks (marks and mark properties) instead of picked from a list of chart types (vertical bar chart, bubble chart, waterfall chart etc). The Grammar of Graphics was hugely influential for many visualization APIs like ggplot, D3, Vega and also Swift Charts.

--- 
> ####  Hi, How can we remove or configure the space between the bars (BarMark) ? Is it possible to define the bar width ? Thanks.


`BarMark` has a `width` parameter that takes a `MarkDimension`! It can be a fixed value or a ratio (of the space the bar is allocated).

Thanks. When trying, even with ratio = 1 or inset = 0 it seems to always have some space between the bars.

<@U03JSSE35GQ> mind sharing the code? and a screenshot (if you're comfortable)

No problem.

`*import* SwiftUI`
`*import* Charts`

`*struct* Point {`
 `*let* month: Date`
 `*let* sales: Int`
 `*let* color: Color`
 `*let* eat: Bool`

 `*init*(month: Date, sales: Int, color: Color, eat: Bool = *false*) {`
  `*self*.month = month`
  `*self*.sales = sales`
  `*self*.color = color`
  `*self*.eat = eat`
 }
}

`*func* date(year: Int, month: Int, day: Int = 1) -&gt; Date {`
 Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

`*struct* ContentView: View {`
 `*var* body: *some* View {`
  Chart(data, id: \.month) { p *`in`*
   `BarMark(`
    `x: .value("Month", p.month, unit: .month),`
    `y: .value("Sales", p.sales),`
    `width: MarkDimension.ratio(1)`
   `)`
   `.foregroundStyle(p.color)`
   `.annotation(position: .top) {`
    `*if* p.eat {`
     Image(systemName: "seal")
    }
   }
   .annotation(position: .bottom) {
    `*if* p.eat {`
     VStack {
      Text("")
      Text("23")
     }
    }
   }
  }
//  .chartXAxis {
//   AxisMarks(values: .stride(by: .month)) { value in
//    if <http://value.as|value.as>(Date.self)!.isFirstMonthOfQuarter {
//     AxisGridLine().foregroundStyle(.black)
//     AxisTick().foregroundStyle(.black)
//     AxisValueLabel(
//      format: .dateTime.month(.narrow)
//     )
//    } else {
//     AxisGridLine()
//    }
//   }
//  }
 }

 `*let* data: [Point] = [`
  Point(month: date(year: 2021, month: 6), sales: 300, color: Color.yellow),
  Point(month: date(year: 2021, month: 7), sales: 350, color: Color.yellow),
  Point(month: date(year: 2021, month: 8), sales: 400, color: Color.orange),
  Point(month: date(year: 2021, month: 9), sales: 450, color: Color.red),
  Point(month: date(year: 2021, month: 10), sales: 420, color: Color.green),
  Point(month: date(year: 2021, month: 11), sales: 410, color: Color.green),
  Point(month: date(year: 2021, month: 12), sales: 390, color: Color.green),
  Point(month: date(year: 2022, month: 1), sales: 430, color: Color.green),
  Point(month: date(year: 2022, month: 2), sales: 450, color: Color.green),
  Point(month: date(year: 2022, month: 3), sales: 500, color: Color.green),
  Point(month: date(year: 2022, month: 4), sales: 550, color: Color.green),
  Point(month: date(year: 2022, month: 5), sales: 700, color: Color.green),
  Point(month: date(year: 2022, month: 6), sales: 800, color: Color.green),
  Point(month: date(year: 2022, month: 7), sales: 900, color: Color.yellow),
  Point(month: date(year: 2022, month: 8), sales: 1000, color: Color.orange),
  Point(month: date(year: 2022, month: 9), sales: 1200, color: Color.red),
  Point(month: date(year: 2022, month: 10), sales: 1300, color: Color.green),
  Point(month: date(year: 2022, month: 11), sales: 1310, color: Color.green),
  Point(month: date(year: 2022, month: 12), sales: 1200, color: Color.green),
  Point(month: date(year: 2023, month: 1), sales: 1400, color: Color.green),
  Point(month: date(year: 2023, month: 2), sales: 1600, color: Color.green),
  Point(month: date(year: 2023, month: 3), sales: 1800, color: Color.green),
  Point(month: date(year: 2023, month: 4), sales: 2000, color: Color.green),
  Point(month: date(year: 2023, month: 5), sales: 2200, color: Color.green),
  Point(month: date(year: 2023, month: 6), sales: 2400, color: Color.green),
  Point(month: date(year: 2023, month: 7), sales: 2500, color: Color.yellow, eat: `*true*),`
  Point(month: date(year: 2023, month: 8), sales: 2450, color: Color.orange),
  Point(month: date(year: 2023, month: 9), sales: 2430, color: Color.red),
  Point(month: date(year: 2023, month: 10), sales: 2100, color: Color.green),
  Point(month: date(year: 2023, month: 11), sales: 2000, color: Color.green),
  Point(month: date(year: 2023, month: 12), sales: 1800, color: Color.green),
  Point(month: date(year: 2024, month: 1), sales: 1500, color: Color.green),
  Point(month: date(year: 2024, month: 2), sales: 1300, color: Color.green),
  Point(month: date(year: 2024, month: 3), sales: 1400, color: Color.green),
  Point(month: date(year: 2024, month: 4), sales: 1410, color: Color.green),
  Point(month: date(year: 2024, month: 5), sales: 1450, color: Color.green),
  Point(month: date(year: 2024, month: 6), sales: 1500, color: Color.green),
  Point(month: date(year: 2024, month: 7), sales: 1700, color: Color.yellow),
  Point(month: date(year: 2024, month: 8), sales: 1800, color: Color.orange),
  Point(month: date(year: 2024, month: 9), sales: 1830, color: Color.red),
  Point(month: date(year: 2024, month: 10), sales: 1900, color: Color.green),
  Point(month: date(year: 2024, month: 11), sales: 1950, color: Color.green),
  Point(month: date(year: 2024, month: 12), sales: 2000, color: Color.green),
  Point(month: date(year: 2025, month: 1), sales: 2050, color: Color.green),
  Point(month: date(year: 2025, month: 2), sales: 2100, color: Color.green),
  Point(month: date(year: 2025, month: 3), sales: 2150, color: Color.green),
  Point(month: date(year: 2025, month: 4), sales: 1900, color: Color.green),
  Point(month: date(year: 2025, month: 5), sales: 1850, color: Color.green),
  Point(month: date(year: 2025, month: 6), sales: 1800, color: Color.yellow),
  Point(month: date(year: 2025, month: 7), sales: 1700, color: Color.yellow),
  Point(month: date(year: 2025, month: 8), sales: 1600, color: Color.orange),
  Point(month: date(year: 2025, month: 9), sales: 1500, color: Color.red),
  Point(month: date(year: 2025, month: 10), sales: 1400, color: Color.green),
  Point(month: date(year: 2025, month: 11), sales: 1200, color: Color.green),
  Point(month: date(year: 2025, month: 12), sales: 1000, color: Color.green),
  Point(month: date(year: 2026, month: 1), sales: 800, color: Color.green),
  Point(month: date(year: 2026, month: 2), sales: 700, color: Color.green),
  Point(month: date(year: 2026, month: 3), sales: 650, color: Color.green),
  Point(month: date(year: 2026, month: 4), sales: 600, color: Color.green),
  Point(month: date(year: 2026, month: 5), sales: 500, color: Color.green),
  Point(month: date(year: 2026, month: 6), sales: 300, color: Color.green),
  Point(month: date(year: 2026, month: 7), sales: 250, color: Color.yellow),
  Point(month: date(year: 2026, month: 8), sales: 200, color: Color.orange),
  Point(month: date(year: 2026, month: 9), sales: 210, color: Color.red),
  Point(month: date(year: 2026, month: 10), sales: 200, color: Color.green),
  Point(month: date(year: 2026, month: 11), sales: 220, color: Color.green),
  Point(month: date(year: 2026, month: 12), sales: 250, color: Color.green),
  Point(month: date(year: 2027, month: 1), sales: 300, color: Color.green),
  Point(month: date(year: 2027, month: 2), sales: 400, color: Color.green),
  Point(month: date(year: 2027, month: 3), sales: 500, color: Color.green),
  Point(month: date(year: 2027, month: 4), sales: 600, color: Color.green),
  Point(month: date(year: 2027, month: 5), sales: 800, color: Color.green),
  Point(month: date(year: 2027, month: 6), sales: 1000, color: Color.green),
  Point(month: date(year: 2027, month: 7), sales: 1200, color: Color.yellow),
  Point(month: date(year: 2027, month: 8), sales: 1400, color: Color.orange),
  Point(month: date(year: 2027, month: 9), sales: 1600, color: Color.red),
  Point(month: date(year: 2027, month: 10), sales: 1800, color: Color.green),
  Point(month: date(year: 2027, month: 11), sales: 2000, color: Color.green),
  Point(month: date(year: 2027, month: 12), sales: 2200, color: Color.green),
  Point(month: date(year: 2028, month: 1), sales: 2400, color: Color.green),
  Point(month: date(year: 2028, month: 2), sales: 2450, color: Color.green),
  Point(month: date(year: 2028, month: 3), sales: 2300, color: Color.green),
  Point(month: date(year: 2028, month: 4), sales: 2310, color: Color.green),
  Point(month: date(year: 2028, month: 5), sales: 2320, color: Color.green),
  Point(month: date(year: 2028, month: 6), sales: 2400, color: Color.green),
  Point(month: date(year: 2028, month: 7), sales: 2500, color: Color.yellow),
  Point(month: date(year: 2028, month: 8), sales: 2600, color: Color.orange),
  Point(month: date(year: 2028, month: 9), sales: 2670, color: Color.red),
  Point(month: date(year: 2028, month: 10), sales: 2500, color: Color.green),
  Point(month: date(year: 2028, month: 11), sales: 2300, color: Color.green),
  Point(month: date(year: 2028, month: 12), sales: 2000, color: Color.green),
  Point(month: date(year: 2029, month: 1), sales: 1500, color: Color.green),
  Point(month: date(year: 2029, month: 2), sales: 1000, color: Color.green),
  Point(month: date(year: 2029, month: 3), sales: 750, color: Color.green),
  Point(month: date(year: 2029, month: 4), sales: 500, color: Color.green),
  Point(month: date(year: 2029, month: 5), sales: 2, color: Color.green),
 ]

 `*let* averageValue = 137`
}

`*extension* Date {`
 `*var* isFirstMonthOfQuarter: Bool {`
  Calendar.current.component(.month, from: `*self*) % 3 == 1`
 }
}



`*struct* ContentView_Previews: PreviewProvider {`
  *`static`* `*var* previews: *some* View {`

   ContentView().frame(width: 400, height: 100.0)


  }
}

The screenshot is from the SwiftUI preview.

cc <@U03HHJH7RJN>!

this is a pixel boundary rendering artifact. One solution is to make the width just a tadddd over 1 so they overlap just a bit

It's a rendering artifact that happens when the bars doesn't align with pixel boundaries. There are a couple of ways to address it:
• As Halden mentioned, you can make the bars slightly wider (with something like `.inset(-1)` or `.ratio(1.01)`)
• You can also tweak the width of the plot area (with `.chartPlotStyle { $0.frame(width: plotAreaWidth) }`) based on the number of bars, so that the bars are aligned exactly with pixel boundaries. This is more complex to do, but will give the best result.

Thanks ! :+1:

--- 
> ####  Do you have any suggestions for displaying "goal progress" data? Saw in earlier Q&amp;A that radial/rings charts are not supported, but other types could be used.  Looking for visualization similar to Health activity rings.  Thinking about 3 bars normalized to % of progress toward goal.


You could make a chart with three bars one for each category. If you set the scale to have a domain from e.g. 0 to 100, then the length of a bar indicates the progress towards a goal. A horizontal bar chart could work well.

Thanks <@U03HW7NSMFT> that's exactly what I was thinking, too.  But unsure on upper bound of chart when goal is exceeded.  For rings, if my steps goal is 5000 and I actually take 12000, then it would show 240% for that bar.

That’s an interesting consideration. You could have a chart that extends beyond 5000 but adds a vertical `RuleMark`  to annotate the goal.

Since you may show different metrics (e.g. steps and distance), you may want to normalize them to % of goal so they have the same scale/axis.

Thanks again, I'll give this a whirl!

--- 
> ####  Hi everyone! Is there a suggested "update rate" that you'd recommend for real-time charts? When trying this out on a simulated iPhone, I quickly approach 90%+ CPU usage if I try to update a line graph more than 40 times/second (For example, when trying to visualize a simulated accelerometer).


Humans have a hard time with anything more than 10Hz anyway...

We recommend benchmarking your app to find the right balance between the update rate and the amount of data on your line chart.  We'd also appreciate feedback through Feedback Assistant for your use case!

If I may follow up: if we're to alter the drawing rate so it adds new data points in batches, does Charts have built-in functionality for that, or would we need to set up the Combine publishers manually? I didn't see anything in the documentation, but I understand the docs could also be in beta

Honestly at 40Hz I think you're looking at game semantics, i.e. Metal or at least SceneKit

Yeah when I previously worked on the project that would use my own pre-"Swift Charts" charts. I experimented with rendering the charts using Metal, and that was not a very productive week :sweat_smile:

You would need to write a small framework, but SceneKit (or even SpriteKit?) could do a lot of the work

But I think you need to isolate your fast-updating surfaces and not drag all of UIKit/SwiftUI into it otherwise the performance will crash

--- 
> ####  We have data that doesn't necessarily progress linearly from one point to the next, for example the x and y values could either increase or decrease from one point to the next. Would those points be linked as if they were points on a path or would it upset the system?


I’m not sure I fully got the question but you can either draw points as separate with `PointMark`  or linked with a `LineMark` . Adding linked points is well supported by Swift Charts.

Sounds like "can I do XY scatter with joined lines"

Ahh. The answer is yes. Use a `LineMark` .

Thanks

--- 
> ####  I am wondering why Pie Charts are visible in promotional material or in the sessions but don't seem to be supported with Swift Charts. I know that Pie Charts can be misleading, but they are still ideal for some cases.


We'd appreciate feedback through Feedback Assistant!

Will do!

FB10138361

FB10138491

thanks <@U03HUM5PDHV>!

--- 
> ####  I have a horizontal bar chart with two Text overlay annotations on each bar, one aligned leading and one aligned trailing. When the bars are short the annotations overlap and eventually truncate. Is there an easy way to hide overlayed annotations when the bars are too short to accommodate their intrinsic widths or should I explore other layout configurations (e.g. one annotation with an HStack containing two Text views spanning the context target region width)?


There isn't a way to hide overlayed annotations right now, but feel free to file a feedback :slightly_smiling_face:

In this situation, you can explore other layout options as you mentioned. For example, a single annotation with `HStack { Text(...); Spacer(); Text(...) }`

Thanks.

--- 
> ####  Is there a way for external developers to extend Swift Charts and add new chart types that aren't supported out of the box, for example pie charts, or charts with 3D styling?


You can create custom marks but they need to be cartesian. So you can make e.g. a candlestick or boxplot. Swift Charts does not support pie charts or 3D charts. See <https://wwdc22.slack.com/archives/C03HX19UNCQ/p1654618060787259> for a discussion of alternatives.

Thank you. So I would assume a 2D bar graph with a fake 3D effect for the bar marks should be easily doable. But no circular graphs (for now).

Yes, I would agree with that.

--- 
> ####  Is there a method to modify or specify the label style of a chart? For instance, my chart includes price averages for home heating oil. I want to clearly display on the label that the Double is in dollar format on the Y axis.   At this time, when I attempted a brief demo app it simply made the Y axis label as an Int.


<@U03JF5S79RQ> sorry for the late reply! Yes, there are a few options here. You can use `AxisMarks(format: FormatStyle)` or `AxisValueLabel(format: FormatStyle)` or `AxisValueLabel { Text(\(..., format: ...)) }`

:heart: Perfect, thanks!

If your units are more verbose, a design alternative is to clarify them in the title or headline of your chart, to save horizontal space on the y axis.

At this time I'm tracking price averages per month over the last 12 months, the user will have the ability to toggle between the last 12 and 6 months. The X axis is the Month, the Y axis is the Average Price.

the former is likely enough then, makes sense!

--- 
> ####  Can charts be used in the new Preview option to see a live chart in the preview without needing to go to that screen? Such as current screen allows new data entry and the preview shows the updated chart? Also, can previews be used from widgets to preview the chart without loading the app?


Can you clarify what you mean by the preview option? Charts can be in any SwiftUI View.

contextMenu(menuItems:preview:)
Using the contextMenu in a touch and hold scenario for a button that would lead to the view with a graph - can the live graph be shown? or is it only for fixed assets like an image?

You can use Swift Charts to draw live data.

But does it update for the preview, or when you've  loaded the view with the chart?

Swift Charts behaves like other Views and updates the same way.

So is the contextMenu preview a View in its own right?

I’m not familiar with the contextMenu preview but it looks like it might work. Give it a try and if it doesn’t work file a feedback.

Okay, thanks Dominik

--- 
> ####  Does Charts support polar coordinates?


It does not, but feedback is appreciated!!

Will do. This is a great start!

--- 
> ####  Hi, Sorry if this was already asked, but how can I add a text or SF Symbol at the top of a vertical BarMark ?  (I did not found the information at <https://developer.apple.com/documentation/charts/|https://developer.apple.com/documentation/charts/> ) ? Thanks.


You can use the `annotation` modifier to add an annotation on top of the bar, where the content of the annotation is a SF Symbol image. Here's an example:
```
BarMark(...)
.annotation(position: .top) {
    Image(systemName: "sfsymbol_name")
}
```
Note that you can also use `Text` or other views as the content of the annotation.

Parfect ! This is amazing how configurable the Charts are. It will save me a lot of time in my application! Thanks.

--- 
> ####  The charts are amazing! I saw the example for the Interval Bar Chart in the docs and it got me thinking I could represent a simple weekly view of a student's course schedule if I flipped the axis. I made a proof of concept and it worked really well! I calculate the duration of a meeting in minutes to create the size of the BarMark using yStart and yEnd. Is this a good way to do this or can it be achieved with just the start date time and end date time? I also had to reverse the chartYScale to get the AM meetings to apear first, not sure if that is expected or not.  struct Series: Identifiable {     let courseName: String     let meetings: [Meeting]     var id: String { courseName } } struct Meeting {     let startDate: Date     let endDate: Date     let startMinute: Double //Minutes since 7am     let endMinute: Double }   Chart(data) { series in 	ForEach(series.meetings, id: \.startDate) { element in 		BarMark( 			x: .value("Course", element.startDate, unit: .day), 			yStart: .value("Start Time", element.startMinute), 			yEnd: .value("End Time", element.endMinute) 		).annotation(position: .overlay, alignment: .top) { 			VStack { 				Text(series.courseName).font(.caption) 				Text(element.startDate.stringValue(dateFormat: .time)).font(.caption) 			} 		} 	} 	.cornerRadius(8.0) 	.foregroundStyle(by: .value("Course", series.courseName)) } .chartYAxis { 	AxisMarks(position: .leading, values: .stride(by: 60)) { axis in 		AxisTick() 		AxisGridLine() 		AxisValueLabel(centered: false) { 			if axis.index+7 &lt; 13 { 				Text("\(axis.index+7) AM") 			} else { 				Text("\((axis.index+7)-12) PM") 			} 		} 	} }.chartXAxis { 	AxisMarks(position: .top, values: daysOfTheWeek) { _ in 		AxisGridLine() 		AxisTick() 		AxisValueLabel(centered: true) 	} }.chartYScale(domain: .automatic(reversed: true))


<@U03JDV4PQR0> beautiful!! You can use `Date` here instead of converting to integer minutes and it should go top to bottom by default.

cc <@U03HHJH7RJN>

Looks great! Maybe try setting the width of the BarMarks to 100%?

amazing

Use Date as the unit of x?

sorry, I was trying to answer your question about the y axis

`Int` and `Double` will go bottom up (low to high) while dates will go top down (early to late)

lmk if that helps / if you have follow-up Qs

I tried:
 `yStart: .value("Start Time", element.startDate),`
          `yEnd: .value("End Time", element.endDate)`

But it did not go well :rolling_on_the_floor_laughing:

Ok I understand now. I think you're approach is good! (turning it into a number and then applying a reverse and customizing the axis labels). This is a clever solution, I dig it.

The problem with the startDate and endDate approach is that its interpreting the dates _including_ the date, so your Y axis became a mirror the X axis.

Very cool alternative use of Charts

&gt; <@U03H3193G3H> There are times when a student would not have class on Monday or Friday but I want the X axis to include all the weekdays. I passed an array of the dates to `AxisMarks(position: .top, values: daysOfTheWeek)`
but I noticed Friday did not appear.

I'm just noticing this too, would you mind filing feedback for this issue? this looks like a bug

cc: <@U03J21TPWPM> in case this is the same issue you're running in to and my response to you is incorrect

Is it possible to get a reference to the colors automatically assigned to the series by the foregroundStyle?  I may want to create my own legend in a vertical format. Unless legends can be formatted vertically?

You can try positioning the legend on the trailing edge of the chart using the `chartLegend` modifier

The default color scale is currently as follows: all `system` colors

`.systemBlue`, `.green`, `.orange`, `.purple`, `.red`, `.teal`, `.yellow`

<@U03H3193G3H> Thanks for letting me know :slightly_smiling_face:

This looks very similar, yes. In my use case, I could fix it by adding additional data points, since it was a very simple graph and I don't mind the extra points.

Just in case it is a bug, I'm gonna send a report with the project, maybe it helps :slightly_smiling_face:

thanks <@U03J21TPWPM>!

(btw <@U03J21TPWPM> if you don't want to add extra points, you can adjust the `chartXScale(domain:)` or `range` manually and achieve the same result.)

Ah, that sounds even better :smile:. Thanks!

Filed as FB10139046. Thank you <@U03H3193G3H>! Congrats to you and the team on Swift Charts.

Thank you <@U03JDV4PQR0>! Awesome chart, hope to see more!

Filed mine as FB10139144 <@U03H3193G3H> :slightly_smiling_face: Thanks for everything, this framework is awesome!

btw <@U03JDV4PQR0> I have to agree, this is a really cool use of the new charts! I really like it :smile:

--- 
> ####  Can we transform a mark when the user presses and releases it, like we could do with a `ButtonStyle`. If not, we can probably use an overlay, but can we change the size of marks without changing their values (for example with a scale effect)?


Currently we don't have a `scaleEffect` modifier. You can use something like `width: .fixed(hovering ? 100 : 80)` in `BarMark` constructor. This will make the bar wider when `hovering` is true.

Thanks, I think I can make it work then!

--- 
> ####  Hi, I'm curious on how Charts handles time based data e.g. temperature over a day when data can be received at any point of the day, not a set interval apart? Some chart libraries that have previously existed did not handle this and just spaced out data incorrectly.


Hi <@U03HMESB695>! Charts handles `Date` as a continuous variable, so this should be fine. If you _do_ want to treat the data as spaced out evenly (e.g., exactly one measurement per day) you can tell the framework to do so by using the `unit` parameter in a `value`

Thanks! I definitely don’t want it spaced evenly. Great to hear it just handles it approriately.

--- 
> ####  Hi,  I've got a set of data I wish to chart that is discrete states over time, for example on/off states of a light, or an enumeration a door lock's state. (example: <https://twitter.com/aaron_pearce/status/1527452719027728384?s=21&amp;t=ux-SjhyOSmO89k0u4Lf_jA).|https://twitter.com/aaron_pearce/status/1527452719027728384?s=21&amp;t=ux-SjhyOSmO89k0u4Lf_jA).>  How would you recommend tackling this chart? RectangleMarks?


Yes. A Rectangle or Bar Mark.

Thanks, I’d need to precalculate the xStart and xEnd for this correct?

I suppose you have some kind of start/end time already, no? You can pass those to xStart and xEnd.

Yeah, I can work those out so its doable! Thanks

--- 
> ####  What's the best way to use ChartRenderer to draw to a CGContext with slightly different styles (e.g. draw shapes as hollow, or dashed lines, etc)?


Currently there's no API to draw marks with styles other than what's supported in `ShapeStyle`. Feel free to file a feature request via Feedback Assistant.

<@U03HHJH7RJN> Basically we'd like to replicate our current draw-to-PDF behaviors which favor line art, simple coloring, and optional line dashes for monochrome

As distinct from the on-screen styling

That sounds very cool! I'll file an internal feature request for this.

<@U03HHJH7RJN> So does that mean we can't pass in a ChartView and apply styles just for the rendering?

No, currently there isn't a way to configure styling of the renderer itself. You could try an approach like exporting the rendered content as PDF or SVG and apply the styling by transforming the resulting vector graphics.

ok, thank you

--- 
> ####  Is it possible to assign a gradient between specific LineMarks? E.g. to show a change in value in temperature from cold to hot?


You can draw an AreaMark with `.foregroundStyle(gradient)` below the two lines.

Thanks!

Would this change the line or apply an area under them?

It will add an area under them, the lines will be intact.

Is it possible to apply a gradient direct to the line?

More as a function of the temp over time (left to right) on the line itself than just decorative

You can use `.foregroundStyle(gradient)` on the `LineMark` as well.

with a `LinearGradient` that goes from left to right.

That’s perfect!

thanks

--- 
> ####  Hi again, Are Charts planned to be available also on iOS 15 ? Thanks.


Swift Charts is iOS 16 only since Swift Charts relies on features that are not available in earlier versions.

--- 
> ####  What's the best way to that we can use Swift Charts in a predominately UIKit app?


<@U03K1BXG8RG>, Sara has a session on this where she adds a Swift Chart to a UIKit app :slightly_smiling_face:

<https://developer.apple.com/videos/play/wwdc2022/10072/>

oh hi <@U03HL05BUJG>

Yes the new `UIHostingConfiguration` lets you use SwiftUI in cells and `UIHostingController` has some new ways to track size changes that make it easier to use it in stack views or in embedded view controller! Definitely check out the talk, anywhere I talk about using a SwiftUI view you can use a Chart as well!

<@U03HL05BUJG> <@U03H3193G3H> thank you all super excited about this :100:

--- 
> ####  Except the WWDC22 Videos and <https://developer.apple.com/documentation/charts|https://developer.apple.com/documentation/charts> , which documentation do you recommend ?


In the documentation you will also find a sample app that could be quite useful

<https://developer.apple.com/documentation/charts/visualizing_your_app_s_data>

Thanks.

--- 
> ####  Is it possible to share one of the axis between 2 charts or have 2 subcharts on the same axis, eg share x-axis have have 2 different y-axies on either side with their own independent domain range.   Or have a plot when another plot to its right that shares the y-axis but has its own x-axis (commonly used when drawing a heatmap to show a histogram attached on the side)


<@U03HMDSQ9JB> Hope I'm understanding your question correctly. You can set specify two charts to have the same `chartScale` and `chartAxis` using the appropriate modifiers, but we don't support dual scales on the same chart

--- 
> ####  When using Swift Package Manager modules, Xcode Previews will crash when you try to Preview  resources that are contained within another module. e.g. `FeatureModule` is trying to preview a SwiftUI `LogoView()` contained in a `DesignSystem` module that loads an image from that module. (It works fine when the app is built and run). Is this a known issue that will be fixed?


Thank you for the feedback! This is a known issue, and we are actively working on resolving it.

Excellent! I’m so happy to hear that.

I filed FB10070029 if you want an extra dupe number

Are you the same Jeremy that wrote this? <https://dev.jeremygale.com/swiftui-how-to-use-custom-fonts-and-images-in-a-swift-package-cl0k9bv52013h6bnvhw76alid> :slightly_smiling_face:

That’s me :slightly_smiling_face: I was just going to post that, thanks <@U03J4D7EZNY>

Very interesting post, I read it this morning :slightly_smiling_face:

For anyone else running into this limitation, my blog post above has a workaround for how to keep your previews working until it gets properly fixed in Xcode :slightly_smiling_face:

--- 
> ####  With SwiftUI previews, I get this error specifically for my macOS target (the same view works fine for iOS):  LaunchExternalToolError: Failed to build ImportCSVContactsPreviewPage.swift Failed to launch swiftc. ================================== |  HumanReadableNSError: NSInvalidArgumentException |  |  com.apple.dt.PreviewsFoundation.ExceptionError (0): |  ==NSLocalizedFailureReason: too many arguments (4170) -- limit is 4096   What does this mean? BTW, I filed FB10004742 already.


Thanks for filing the feedback! This is a known issue we're investigating.

Thanks!

--- 
> ####  Is there a way to export/save a screenshot directly from Previews?  I use screenshots (CMD+SHIFT+4) now and share them with product owners/designers but it'd be super handy to have a button that saves the preview with the bezel.


There's no way to do this now, unfortunately -- but that's a good idea! Filing a feedback request would help us keep track of interest in that feature.

I've also been doing this a ton lately for sending to coworkers.. and taking screen recording videos

Done! FB10134111

Thanks!

I created a separate project that I can copy-paste the preview implementation to run on the simulator just to be able to take a screenshot :sweat_smile:

Not directly related to previews, but you might be able to automate some of your snapshots using the new `ImageRenderer` view announced this year: <https://developer.apple.com/documentation/swiftui/imagerenderer>

(Doesn't include the device chrome, of course.)

That's neat, I missed that one

<@U03H32HJQEB> would it include status bar though? :thinking_face:

no, it would just be the contents of the View

Is there a way to show the status bar in previews?

Actually, you know what might be cool? What if we had a System Share button on the preview that shared an image? Then we could tap it and share the view all in a couple clicks!

We could even utilize a such feature for App Store screenshots with the help of multiple variations now.

These sounds great. Please file feedback!

I just added the System Share to my Feedback that I filed.

--- 
> ####  Is there a way to add a "Custom variants" to Xcode Previews?  f.e. I think it'd be a good idea to add RTL/LTR variants


There is not currently a way to add custom variants, but that's a great idea! Opening a Feedback request will help us track interest in that feature.

Please also file individual feedbacks for any variants group (like our existing color scheme, type size and orientation) you think should be included by the system. Same applies for the widget variant groups too!

Done! :rocket: FB10139550

--- 
> ####  My Previews take generally a long time to render, often failing (timeout) and sometimes it's quicker to just launch a run on the simulator. Also, it takes some huge place on disk (40GB+). Any hint to optimise all this and make the Previews quick, light and reactive?


If you're experiencing long times to render there might be something specific about your setup. Filing a feedback with a sysdiagnose taken while the preview is taking the long time to render would be very helpful for us to diagnose this.

As far as general tips to keep things fast, it helps to break up you views into smaller components where possible. And if your app project itself takes a long time to build, then it could be very helpful to split your Swift UI views out into a separate framework target so they could be built without the burden of the rest of the project.

<@U03H32HJQEB> Could you elaborate on separating out the SwiftUI views? I am currently working on an objc app and adding new SwiftUI screens, but the builds can sometimes take a while because the rest of the app is somewhat large. Anything I can do to speed that up without having to copy paste the SwiftUI code to a blank SwiftUI project would be awesome

<@U03H32HJQEB>  Yes I was just thinking about this last advice — although perhaps with a Package rather than a framework.

(I don't even know objc really so I try to stay out of it)

<@U03JEMNCV18> I think the general theme is trying to focus on building as little as possible. If you can build out those new SwiftUI views in a framework / package, you can opt to build just that package rather than all of the app.

I've considered doing that, but have never dove into creating a framework or package. But i'm tempted now..

Yup, packages would be fine, too. It's even easier to use them in Xcode now. The larger point is to break out the parts that need Swift UI into their own targets that can be built independently. It might even help to have a separate "previewing" app target that you link your Swift UI views into instead of your main app. It all depends on your setup, of course. The tl;dr is that Previews needs to build _some_ target to get its work done. If your whole app target is large and slow to build then it will be the bottleneck for previews that you can investigate.

Of course you might find other bugs on our end that slow things down. Please file feedback reports with sysdiagnosen! :)

--- 
> ####  As of Xcode 13, there are some gotchas with SwiftUI Previews and custom build configurations not named Debug or Release.  • SwiftUI Previews are not compiled-out unless the active build configuration is exactly named Release. • Source files under the Preview Content directory are compiled-out for non-debug builds (whether this is looking for the active build configuration to not-be-named “Debug” or whether it’s based on code optimization levels, I do not know)  So, what this means is…  • If you have a custom build configuration, say a “Staging” or “Beta” or whatever, which is essentially a variant of “Release”…. • And if you have SwiftUI Previews in your app… • And if those previews are not wrapped in #if DEBUG directives… • And if you have source code to support SwiftUI Previews stashed under the “Preview Content” directory…  Then your project will likely fail to build, as the previews will not be compiled out, but they will depend upon development asset code in “Preview Content” that is compiled out.  Do you know if this is resolved in Xcode 14?


Thanks for the feedback! Right now the recommendation is to limit the Preview Content folder (which is really just a convenience for the `DEVELOPMENT_ASSET_PATHS` build setting) to assets like asset catalogs, preview data, etc.

For code, we recommend you continue to keep it in your normal source paths, but to wrap with `#if` . Note: the compiler will normally remove any preview providers from the final binary without needing the `#if`, but the `#if` is a guarantee it won’t be included.

It’s specifically preview data that we are using in the previews. The problem is our Staging target, and the mismatch between what is being compiled out for Previews vs Preview Content.

It seems like those two should agree on what is being compiled out.

I’ve also had this problem, I made this SO post for it. <https://stackoverflow.com/questions/63078880/why-does-archive-fail-if-there-is-code-for-swiftui-previews-in-the-preview-conte>

I filed FB8969539 for this issue.

Yep, that’s exactly it Jeremy.

So annoying because we sometime forget to wrap our new views in the DEBUG check. I need to invest in some script / linter to check this, but I was hoping this problem would go away in Xcode 14.

If you don’t put any *code* in Preview Content, then the compiler will usually be able to correctly remove any branches of code used only for previews.

But it is code, and that seems very useful. Do you have other recommendations?

I think you’re recommending to move that code out of Preview Content and :crossed_fingers: that it is removed from release builds?

I’ll give that a shot. Thanks!

How would it get removed from the release builds? I don’t know of any other mechanism other than #if DEBUG

I think that’s what is being recommended – move the code out of Preview Content and manually wrap the entire code in an if DEBUG check.

But it seems less than ideal since Preview Content is built for _exactly_ this use case. What is compiled out should match between PreviewProvider and Preview Content.

Fully agreed.

The compiler optimizes by removing non-public symbols that aren’t referenced from any top level code. This will remove most preview code that is not referenced by other public or used types.

Just to clarify my understanding, you are saying that it’s not supported use case to have code inside the Preview Contents folder that will be stripped out in Release builds?

Note that this contradicts what was implied in WWDC 2020's session “Structure your app for SwiftUI previews”.

&gt; “What’s great about Development Assets is they apply not only to files like Asset catalogs, but also to code. Let’s look at what’s inside that preview content folder that we just added.”
&gt; 
&gt; By using the navigator, we can look inside and see two Swift files. These Swift files contain code that I only need for development and debugging and testing my app, and I don’t want to include these when my app is actually deployed.
<https://developer.apple.com/videos/play/wwdc2020/10149/?time=637>

• SwiftUI previews - compiled out of exactly “Release”
• Preview Content – NOT compiled out of “Debug”
Ultimately it seems odd to me that these two things have different strategies. Everything discussed in this thread is _fine_ but we have to acknowledge that everything we’re currently doing (#if DEBUG) or recommended in this thread is a *workaround* for the disconnect between the above bullet points.

Great thoughts and responses everyone!

&gt; Just to clarify my understanding, you are saying that it’s not supported use case to have code inside the Preview Contents folder that will be stripped out in Release builds?
It’s not _*unsupported*_ ( :slightly_smiling_face: ) to put code in Preview Content, but we’ve found it to work *best* when Preview Content is limited to assets.

&gt; Note that this contradicts what was implied in WWDC 2020's session “Structure your app for SwiftUI previews”
:upside_down_face:

Thanks for the reply <@U03HW8Y0RFB>

--- 
> ####  Are there any new SwiftUI Preview tools for previewing views on devices of varying os versions? For example viewing how a view would look on an iOS 16 device vs iOS 15 that uses the compiler checks


Thanks for the question! There’s not currently a variant mode in the canvas for different iOS versions. However, there is a neat solution! If you have a physical iPhone that is running iOS 15, you can use on-device previews to see your simulator preview in the canvas (running iOS 16) and the preview running on device (running iOS 15). And any changes you make will automatically be updated in both places at the same time!

If you have other use cases for seeing multiple OS versions, please file a Feedback Request so we can take a look, thanks!

Should feedback be under SwiftUI, Xcode, simulator, or something else?

Sent - FB10139747

Any of those is fine, it will make it to us, but Xcode is the fast track :slightly_smiling_face:

Cool, I picked the right one

--- 
> ####  What's the best practice for working with Core Data and SwiftUI previews, such that we don't end up interacting with the actual store data?


Core Data supports pointing to in-memory storage which won't need the file system and would work great in any situation where you don't want to persist the changes permanently, even in Previews.

<https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/PersistentStoreFeatures.html>

--- 
> ####  As preview utilizes some generated code (for dynamically updating values etc), I have faced naming clashes a few times in a rather crowded file. And it wasn't obvious at first, I had to dig through logs to figure out some helper types I had were clashing. What would be suggestions to avoid such cases? Is there a guideline that we can refer to?


That's interesting. In order to be able to help we'd have to take a look at a concrete example. If you're able to repro the issue in a sample project, could you file a feedback request for us?

<@U03HL18CEEQ> thanks for answering, I don’t have any such project at the moment but I’ll sure keep in mind to file a feedback next time.

--- 
> ####  Sometimes the Xcode previews stop working for no apparent reason. The last example of this was it said "connection interrupted" or something like that. So, I question is what are some tips for fixing broken previews? BTW: The new previews are great! Love not having to create multiple previews for landscape and portrait.


Thanks for the question. We know there are cases where previews don’t work and we’re actively working on addressing them. The best way to help us is to file a Feedback Request and attach the previews diagnostics. Look for an upcoming message about great tips for filing previews bugs to make it easy for us to investigate! Thanks!

<@U03HW8Y0RFB> One unrelated issue I encountered today was that the compiler took too much time to compile the code because it was trying to guess the type of a rather simple expression for an human but not for a computer. Perhaps you could handle this specific case by displaying a dedicated message so that the developer precisely knows what the preview is waiting for.

Thanks for the feedback <@U03JSSE35GQ>, that’s a great idea. We’ve been tracking a number of issues related to type checking, so we’re on it! :slightly_smiling_face:

--- 
> ####  Views within an extension aren't always exposed to Previews. This will create a compile issue:  ``` enum MyNameSpace { } extension MyNameSpace {     struct MyContainerView: View {         var body: some View { MyChildView() }     }     struct MyChildView: View {         var body: some View {Text("MyView") }     } }   struct ContentView_Previews: PreviewProvider {     static var previews: some View {         MyNameSpace.MyContainerView()     } } ```  Is this a known issue? I'm hoping it's not expected. :upside_down_face:


Thanks for the question! Ha, yes, definitely not expected :slightly_smiling_face:

This is a known issue that we are actively looking at. In the meantime, a workaround is to add a `typealias` inside of the `struct` that references the other view. For example in your example I added `typealias MyChildView = MyNameSpace.MyChildView` inside of `MyContainerView` and the preview renders.

--- 
> ####  Question re the layout inspector inspecting swiftui - curious if there are public/sanctioned ways to introspect a swiftui view for details, similar to what is presented in the details panel (on the right when selecting a view).


Hey Tyler, great question! The current recommendation is to attach to the process and use the view debugger.

The runtime view debugger does not provide the same level of detail that you get when using the inspector in Previews – are there specific details that you are looking for in the view debugger?

<@U03HHK591AP> Can you suggest how to use background(color.red.ignoreSafeArea()) together with .cornerRadius? It just dont work :(

Sorry, I realized that this question wasn’t actually preview-specific until after I posted.  Previews are great for eyeballing layout and validating behavior, but I use the inspector to validate specific fonts, frames, etc.  Historically we’ve used internal tooling for inspection against UIViews, etc. from tests and interactive inspectors.  We’re rethinking this approach as we migrate to SwiftUI, but still curious if there’s a public way to ask an arbitrary view for this info.  The Xcode inspector seems to be able to focus on an arbitrary view and dump useful info.

Re previews and eyeballing - I take this back.  There’s a lot I can check in non-interactive mode.

However, there are still other cases in which I’d like to have access to this type of general info outside of the context of previews.

In particular, what level of detail are you looking for with the font? i.e. Is it a custom font that you’re trying to validate or are you trying to make sure something is actually using a system font like `.heading`

We use custom fonts, yes.  Consider the scenario - we have a large app; currently, I (or say, a designer) can nav to an arbitrary screen, open up our in-process inspector; focus on a view and inspect its attributes.  All without connecting via Xcode and attaching.

My assumption here is that we’re entering a new world with new tools and introspection like this isn’t straight forward.  But was still curious if there was something I’m missing.

Gotcha. To answer your question, I don’t believe that level of introspection is available but we’re interested in hearing more about what you’re looking for. Could you please open a feedback request to help us track interest in a feature like that?

Absolutely!  Thanks.

--- 
> ####  Adding border to views when developing helps debugging/developing your code. Adding borders to every view in the screen can be tiring.  Is there a way currently to automatically add borders to all the views in the screen with the press of a button/setting?


If you'd like to see the borders of each view in the preview you can use the non-interactive mode then in the menu bar go to Editor &gt; Canvas &gt; Show View Bounds. Additionally, you can toggle "Show Clipped Views" in the same menu to show or hide views that extend beyond the edges of the preview.

Thank you! :heart:

--- 
> ####  Currently Xcode Previews fail to find the `.module` bundle (and associated resources) for views in SPM modules. This has a workaround (manually locating the bundle), but adds additional boilerplate code.  I'd like to know it's a known issue. I've seen that Previews got a substantial update in Xcode 14 and I was surprised to see this was not addressed.


Thank you for the feedback. Yes, we know this is a common issue and are still finding the best path forward to solve it. Thanks for the patience!

as far as i rememeber, `.module` is only generated when a Swift package target has resources. so it might be a better workaround to add an empty file to a package :slightly_smiling_face: <https://developer.apple.com/documentation/packagedescription/target/resources>

:crossed_fingers::skin-tone-3:Thank you for the answer!

--- 
> ####  Is there a way to have the preview window size to be automatically  the same as the device used for the preview ? It usually opens wider than necessary on my small screen ;-)


There is not currently a way to have the preview canvas match the size of the device being previewed, though it is a known request. Feel free to file a Feedback request to help us track interest in that feature, thanks!

OK, Thanks.

--- 
> ####  Not a Question: Thank you for the feature to provide multiple variations, it'll simplify my code dramatically, as I was constantly boiler-plate extending views for light/dark + multiple accessibility sizes to see how it worked out. Huge benefit, mucho gracias!!!


Thank you, Joseph. Glad to hear you are enjoying the new variations support. Please file feedbacks with any additional variations you think would be useful!

Sorry if this was already asked / answered, but is it possible to view different devices on the same tab in XCode 14? (e.g. iPhone 13, iPhone 13 mini, iPhone 13 Pro Max)

Haven't had a chance to test it out yet

Just in general, I wanted to say that Xcode Previews are life-changing. I honestly feel that I’m about 10x more productive with the combination of SwiftUI + Xcode Previews. Being able to rapidly iterate on a view to get it just how I want completely changes my approach to things. Now I just dive in, and start coding, and continually refine until it’s perfect. With .xibs, I would give up far before the point of perfection.

--- 
> ####  Is it possible to print to the console while in SwiftUI previews?


This is a known issue we're actively investigating. :slightly_smiling_face:

<@U03HW8XNUGH> Thank you! I've loved using Preview, and it's the only thing that's preventing me from using it for everything :smile:

(Also not necessarily the best solution, but sometimes I end up just adding a debug label attached to state and use that as a print…) :upside_down_face:

FWIW, `os_log` and `Logger` do work fine in previews and then you can look for those with the Console app like any other syslog output.

--- 
> ####  First, I love that the interactive mode is default — I think it makes the entire preview much more useful. It seems that the selectable mode no longer works the way I would expect. Is there an explanation somewhere of what I can do in that mode?


We have not made any changes to the behavior of the selectable mode. Can you clarify what is behaving differently?

Here's a screencast. It's possible that it's due to something in the project. It's behaving differently that I would expect.

Ah. Hmm, that does look like a bug. It should be selecting the text / button. If you file a Feedback Request we’d be happy to take a look to see if there’s something specific to your configuration. You can use the Editor &gt; Canvas &gt; Diagnostics option that will give us all the info we need to double check. Thank you!

phew! good to know — will file a radar. Thank you!
