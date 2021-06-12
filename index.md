---
[SwiftUI Lounge QAs](index.md)
> consolidated by [emin](https://twitter.com/emin_roblack)
---
<!-- [Accessibility Lounge QAs](accessibilty.md)
> consolidated by [paul](https://twitter.com/squarefrog)
---
[DevTools Lounge QAs](index.md)
> consolidated by [paul](https://twitter.com/squarefrog)
--- -->

# SwiftUI Lounge QAs

## 🗓 Tuesday

### Q:
What's your recommended approach to displaying a new macOS window? Not a new document or a confirmation dialog, just "here is some information that makes sense to show right now", such as unlocking an IAP. I've seen hacks with `handlesExternalEvents()` but it's not very pleasant.

### A:
We don’t have much API in this area. A NavigationLink when used within a commands context will open a new window, and as you noted, handlesExternalEvents can be used to, though this is primarily due to the default behavior of that modifier, which is to create a new window for the given scene, if no windows prefer to handle the event. We’d love a feedback for this functionality, and if you can share any specifics of your use case in it, that is even better. Thanks!

---

### Q:
For SwiftUI macOS document apps, is there a recommended way to save and restore window size and position?

### A:
Hi, when state restoration is not enabled on macOS, this is expected behavior at the moment. We’d welcome a feedback for this, though. If you could include any information about your use case as well, that’d be very helpful. Thanks!

---

### Q:
Suggestion to the designers amongst the SwiftUI folks present:  it would be great if there were more examples of unique user experience interactions, especially navigation, instead of assuming that everyone wants to always use NavigationView as the central UX construct.  UIKit was only slightly better with sparse examples to customize Navigation View transitions, but it too, lacked complete flexibility.  Would love to hear your feedback on this!

### A:
Unfortunately customizing navigation transitions isn’t supported today — meaning if you want to invent awesome transitions you’ll need to create your own containers and the state that manages them… but you’ll need to ensure your custom goodies properly handle accessibility, common system interactions, and more which can be tricky. Ideally, please file feedback with some use cases or examples for what you have in mind, I would love to see the team take a look at enabling awesome experiences that work well with the system!

---

### Q:
Is there ever a case in which Spacer() is superior to .frame(maxWidth: .infinity)/.frame(maxHeight: .infinity)?

### A:
Howdy! There was a similar question yesterday about Spacer ‘versus’ frame, check out the answer for how they compare:

> While Spacer is a view, it doesn't end up displaying anything of its own so it is plenty lightweight. Using .frame can have other behavior introduced to the way the view gets laid out beyond just changing its size. They both have their uses, so use them each where appropriate.


> To add a little more onto this, even in cases where you will get almost entirely the same behavior between the two, the performance difference will be so minimal that I would strongly suggest prioritizing code readability over performance / memory use to make this decision. If Spacer makes it more clear what layout you’re trying to specify, use that, and vice versa.

But the gist is: they both have their purposes and are extremely efficient from a performance perspective. So, you should focus on what your intention is and which reads better or offers the functionality you’re trying to utilize as you construct your hierarchies

---

### Q:
Hey, Is it a way to have the coordinate of the cursor inside an image in SwiftUI.
I would like to display a crosshair by drawing two lines from the cursor to the edges of the picture.
I tried with NSEvents but it gave me the cursor location relative to my screen.
thanks, Nicolas

### A:
Howdy! This sounds like excellent topic to file feedback to help the team understand your use case, as I don’t believe this is supported today.

---

### Q:
How do we set `preferredScreenEdgesDeferringSystemGestures` in a swiftUI app?

### A:
Currently you need to use a representable to access that property.

---

### Q:
Are you able to give some indication of why the semantic background colors from UIKit are missing? We only have `Color.background` as opposed to the main varying alternatives, and it's annoying to have to wrap them repeatedly. 

### A:
A goal for us is that the Color and other API we provide works great on all platforms. So there are often other APIs to help get those effects: for instance GroupBox on iOS will produce the stacking (secondary and so on) system background colors, and on macOS gives you a similar effect but using the more platform appropriate group box (9-part) artwork instead of colors at all. The new .primary, .secondary, .tertiary, .quaternary shape styles are similar in that they also work across platforms and now can correctly give the correct vibrant rendering effect on top of materials
So while we might not add a Color for everything that UIKit has, we do want to make sure we have coverage for those design concepts. (so specific feedbacks on things that are missing are always appreciated!)

Things like label , secondaryLabel, etc are all achievable using those shape styles above and are even smarter in those material contexts, i.e. .foregroundStyle(.secondary)

---

### Q:
If I pass around a single @StateObject through injection from View A to Subview B to Subview C, when the data updates, will all 3 views get invalidated and redrawn? What if only View A and C need to use the data, and view B is only a middleman?

### A:
Only views that read properties of the object should update, but do note that if a view reads any property it will be invalidated on objectWillChange, even if the particular property begin read did not change.

---

### Q:
I'm trying to update a Text view based on some state (eg. from a text field). The text is inside a scroll view, and I am using `ScrollViewReader` to scroll to the end whenever the text changes. For some reason, `scrollTo` doesn't work until I manually start scrolling — after that it works fine
```
struct Foo: View {
	@State private var text = ""
	private let letters = Array("abcdefghijklmnopqrstuvqxyz")
	private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			ScrollViewReader { scrollView in
				HStack {
					Text(self.text)
						.fixedSize(horizontal: true, vertical: false)
						.onAppear { scrollView.scrollTo(0) }
						.onChange(of: self.text) { _ in scrollView.scrollTo(0) }
					Color.clear
						.id(0)
				}
			}
		}
		.onReceive(self.timer) { _ in
			self.text.append(letters.randomElement()!)
		}
	}
}
```

### A:
Howdy! Please file feedback with this sample code, this looks like an issue the team should take a look at. Additionally, you should take a look at the new TimelineView and replace your use of Timer here. It’s not recommended to declare new objects in your view’s initializer without a @StateObject or @ObservedObject property wrapper, if you must use a Timer, store it inside an ObservableObject that you can refer to as a StateObject, or another similar technique. 

---

### Q:
Is it possible to enable “sloppy swiping” for navigation links in SwiftUI (swiping to go back from anywhere on the screen)? Also, is it possible to remove the 8pt buffer before a swipe to go back is recognized (so swipe to go back is recognized instantly rather than having the slight delay)?

### A:
Unfortunately, this isn’t currently supported, but feel free to file feedback requesting these features!

---

### Q:
Can a SwiftUI View or Canvas be rendered into a PDF like a UIView can using draw ?  Is there another method that does this?

### A:
Unfortunately, this isn’t currently supported. Please do file a feedback report if that’s a feature you’re interested in. We really do appreciate them!

---

### Q:
Is there anyway to dismiss a keyboard presented from a TextField while scrolling a List? There is a behavior provided in UIKit by keyboardDismissMode UIScrollView but it's disabled in SwiftUI List. Also, I tried to embed a UIScrollView using UIViewRepresentable and enable keyboardDismissMode but the behavior is buggy

### A:
Unfortunately, that’s not currently supported. Thank you for the feedback you already filed! We really do appreciate it. If you want to file an additional feedback report requesting API for solving the problem in a SwiftUI-esque way as well, that would be appreciated as well!

---

### Q:
Is there any way to convert from the old AppDelegate/SceneDelegate lifecycle to the new "SwiftUI 2" lifecycle? I'd rather not re-write my _entire_ application, so while it's still in the early-ish phases I wanted to know if this was possible

### A:
Yes! You can use the UIApplicationDelegateAdaptor property wrapper in your App. Something like this:
UIApplicationDelegateAdaptor var myDelegate: MyAppDelegate

SwiftUI will instantiate an instance of your UIApplicationDelegate and call it in the normal fashion.

Furthermore, if you return a custom scene delegate class from configurationForConnectingSceneSession, SwiftUI will instantiate it and call it as well.

---

### Q:
Is there a way to make two views from different hierarchies, have the same hight/width/x/y position, that is easier to understand than using Preference Keys?

### A:
Yes! Look into matchedGeometryEffect.

---

### Q:
Is it possible to display a SwiftUI view on an external display, on iPad/iPhone, using the SwiftUI App lifecycle?

### A:
Thanks for the question. I’m afraid that’s not currently supported.

---

### Q:
this is a strange request, but is it possible to "intercept" the actions of a button or gesture with a modifier? wanting to devise a way "wrap" the invocation (for example with analytics calls)

### A:
Unfortunately, that’s not currently possible today. If that’s something you’d find useful, please feel free to file a Feedback requesting it!

---

### Q:
Are there any places where you think "yep, this is the place to use `onAppear()` rather than `task()`?

### A:
onAppear() is still fine to use. There’s no need to update existing code that uses it. Going forward, I think task() provides a more general solution, even for short synchronous work, since it sets you up to evolve towards asynchronous work if necessary in the future.

---

### Q:
So… you would always use task() for new code, or are there still places where onAppear() it the right solution? I was maybe expecting to see onAppear() being gently deprecated or similar.

### A:
I’d always use task() personally, but there’s also a nice symmetry between onAppear() and onDisappear() that some folks will want to maintain.

---

### Q:
Our apps stores the position of (our custom) split view controls in its documents. It would be nice to use HSplitView, VSplitView and give them as a parameter a binding to set their position to simplify storing and restoring their state. For now it seems I'd need to use a GeometryReader to get the state and a .frame on one of the child views to set the state. Can you recommend a cleaner approach?

### A:
Howdy! Unfortunately there is no API to do this in SwiftUI today, would you mind filing feedback on this? It would be great to understand your use case here!

---

### Q:
Is there a way to measure the rendering time or memory footprint for a SwiftUI's body method being called in XCTest?  I'd like to setup some baseline testing so that I can be aware of any regressions in performance, but I haven't been able to work out how to do it.

### A:
I’m afraid not. I’d love to get an enhancement request Feedback for that use case. We have support for Instruments, but not XCTest.

---

### Q:
In general, to pass data around, would it better to have an EnvironmentObject that could be called within a view, or an ObservedObject that gets passed down (and/or injected) through child views?

### A:
Both have their uses, and it depends on the architecture you’re building. If you have one (or a few) large ObservableObjects that large parts of the view hierarchy need to see, I would generally recommend EnvironmentObject as SwiftUI can look at which of your views depend on the EnvironmentObject and only invalidate those when your ObservableObject changes (you can get this behavior with ObservedObject too, but it’s more cumbersome). Plus, views that don’t actually use the ObservableObject don’t get cluttered with code relating to it.
That said, if your model is, for example, an object graph that is largely not structured based on your view hierarchy, it may make more sense to use ObservedObject to grab pieces of that model out to use in your view.

---

### Q:
on macOS, you can prevent a window from resizing by setting a specific frame size, however this doesn't prevent fullscreen/zoom. this results in a broken animation and a tiny view in the middle of the screen.
it is possible to tell swiftui the window does not support fullscreen?

### A:
Hi - sorry you are hitting this bug. Using a fixed size frame is the correct expression here. Also, thank you for the feedback!

---

### Q:
Can you provide guidance for when the following error message is printed in the console:
`Bound preference CollectionViewSizeKey<UUID> tried to update multiple times per frame`
(`CollectionViewSizeKey<UUID>` is the name of the preference.)
The preference is updated from inside a GeometryReader. I think the error message happens if the preference modifier is inside a ScrollView.

### A:
That indicates a cyclic update. The size of your GeometryReader is changing based on the size of your GeometryReader. Try lifting your GeometryReader higher in the view hierarchy if possible, or look for other ways to avoid the cycle.

---

### Q:
I am using `@ObservedObject` now for my model, since I still need to support iOS 13. However I know that `@StateObject` provides the correct behaviors to me. Is there a suggested way to use them at the same time for back compatibility? I first thought `if #available` might work, but it does not work for a property.

### A:
For supporting iOS 13, you’ll need to use @ObservedObject and keep your object alive through some other means, like using a static property or keeping a reference in your application delegate.

I don’t think trying to switch between observed object and state object buys you much here, since changing the owner of the object with availability checks would be awkward.  

---

### Q:
I've had several intermittent crashes from environment objects being `nil` when I pass them to a sheet or NavigationLink. It's tricky to replicate due to being intermittent and I usually work around it by architecting my code differently to avoid passing environment objects.
Do you know of reasons this might happen? All I can think of is that the views that originate the environmentObject further up the view hierarchy are being taken out of memory. Thanks for any help you can provide!

### A:
NavigationLink by design doesn’t flow EnvironmentObjects through to its destination as it’s unclear where the environmentObject should be inherited from. I suspect this might what’s causing your issue. In order to get the behavior you expect, you’ll have to explicitly pass the environmentObject through at that point.

---

### Q:
Will the project in its entirety from **Build apps that share data through CloudKit and Core Data (wwdc21-10015)** be available for download?

### A:
NavigationLink by design doesn’t flow EnvironmentObjects through to its destination as it’s unclear where the environmentObject should be inherited from. I suspect this might what’s causing your issue. In order to get the behavior you expect, you’ll have to explicitly pass the environmentObject through at that point.

You can also apply the environmentObject to the NavigationView itself, which will make it available to all pushed content.

---

### Q:
Are GeometryReaders really bad in terms of performance? I'm getting the feeling that they should be avoided, but I don't know if it's because they're inefficient, because they're "breaking" the layout, or because other solutions may exist (like anchored preferences) and be better suited for the purpose?

### A:
Just like any tool, GeometryReader has a time and place where it is correct to use. There aren’t any particular performance pitfalls I’d call out with them, but they shouldn’t be used as a hammer.

---

### Q:
I noticed that while using Combine and lists (say local search combined with remote results). Lists have a really, REALLY hard time keeping up with animated updates. I found the only reliable way to force correct data representation is to use `.id(UUID())` and turn off animations. Is this somewhat expected?

### A:
We worked really hard on improving List performance in iOS 15, macOS Monterey, and aligned releases. Please try there and let us know if you’re still seeing issues.
If you aren’t doing so already, it also may be good to debounce the queries.

---

### Q:
when creating a `UIViewRepresentable`, it is dangerous for the `Coordinator` to hold an instance of the `UIView` passed in `updateUIView()` or should it be strictly treated as ephemeral?

### A:
That is OK! Your coordinator will have been created before any views are — so in makeUIView you can give the coordinator a reference to that view  

---

### Q:
Hi guys, you all did a great job again congrats. My question is related to CanvasView, that view is pretty awesome and opens lots of possibilities for creative and generative art for example. I would like to know how behaves a Canvas encapsulated in a Timeline receiving updates of Bindings Combine's streams. During the render, does it lost the current time information, does it resets to re-render the new state or there's no re-rende at all and the Timeline still running wherever the body changes?

### A:
Thank you!
As long as the identity of the timeline is the same, and the value of the schedule didn’t change based on the body update, it shouldn’t trigger a new update of the contained Canvas. If the content of the canvas itself changed, you will likely see another update from the TimelineView with the date of the current entry of the schedule.

---

### Q:
What is the best practice for bypassing the system styling for a component?
For example, in a Section header in a grouped list, SwiftUI automatically dims the content and capitalizes all text (as you would expect in a text-only section header for UIKit). Is there a built-in way to bypass this dimming and capitalization?

### A:
Many of the customizations you see are part of the default styling that lets you have the most natural feeling UI by default. However, most of these default stylings should be overridable by using the same modifiers you would to get that style.
For example, if you want to remove the default capitalization of the section header, you can use the text case modifier:
```
Section {
 // ...
} header: {
 Text("My Header")
  .textCase(nil)
}
```
The same goes for other customization points like foreground style, font, etc.

---

### Q:
Canvas seems to lose its intrinsic content size and appear as 10x10 when nested in a ScrollView, is there a as to work around this behaviour?

### A:
Thanks for the question! You might try putting a flexible frame on the Canvas, something like .frame(maxWidth: .infinity, maxHeight: .infinity). (Apologies if I got that a little wrong. \me files Feedback asking for auto-complete in Slack.)

---

### Q:
How do I profile SwiftUI code, to know how to optimize my views? Instruments is almost only showing SwiftUI library code, so it's hard to see what is expensive to render...

### A:
Using the SwiftUI instrument will help call out expensive body methods. In addition it’s important to limit the number of times each views body will get reevaluated. Highly recommend watching the Demystifying talk for some in depth looks at how this works.

Pro tip: call the new debug helper Self._printChanges() inside body to log which property caused the view to be reevaluated.

---

### Q:
Hi folks! Thank you for SwiftUI -- I can't believe how straightforward it makes so many things.
I'm wondering, is there any way to bind to the state of *expansion* in a hierarchical `List` (i.e. one created with a `children`) parameter, so that we can expand and collapse items programmatically?

### A:
Thanks for the question! I’m afraid there’s not currently a way to bind the expansion state of an entire hierarchy. You can use DisclosureGroup inside a List to bind a single level.
I’d love an enhancement request Feedback with your particular use case. Managing the expansion state of an entire hierarchy is a difficult API design problem, so more info on your use case would be super helpful!

---

### Q:
How can I pass an @EnvironmentObject to a ViewModel? I'm trying to change a tab inside the ViewModel using the UserSettings.

### A:
@EnvironmentObject and all the other SwiftUI’s property wrappers are only valid and functional when used inside a View. In general I would discourage you from using views to pass data between different model objects.

---

### Q:
what is the best way to deal with atomic changes in state when changing several state variables in sequence? I can manage this generally with `onChange` but it doesn't trigger the action when the state variable was set to the same value it had before (thus no change). I'd like to make sure that I trigger my update code even if the value didn't change (equivalent to didSet in Swift, which is triggered regardless of the old value)

### A:
Additional info pending

---

### Q:
[SE-309](https://github.com/apple/swift-evolution/blob/main/proposals/0309-unlock-existential-types-for-all-protocols.md) allows using protocols with associated types as existentials, assumedly including `View`. At that point, will there be a difference between a `View` existential and `AnyView` in terms of view identity?

### A:
I ♥️ that proposal! I can’t comment on implementation details, but generally AnyView erases more information than an existential, so the existential would still have the edge.

---

### Q:
I noticed `@FocusState` doesn't support an initial value — instead, you can set the focus in `onAppear`. Is there a reason for this?

### A:
One way to think of focus (not to be confused with the new user-facing feature we just launched) is that it is global state managed by the framework. A lot of the times, the user will be the one in control of this state, by selecting a text field, etc. The new @FocusState and focused(_:) API allows for some influence over that state as well, but ultimately, the source of this state is still internal to SwiftUI. Does that help to answer your question?

---

### Q:
I wasn't able to secure a lab spot ("applied" for all of the SwiftUI open labs, but didn't get selected for any). Does anyone know why a disabled button being re-enabled would have the text rendered under the re-enabled color?

### A:
Thanks for the question. We might need sample code to understand this one. Can you reproduce in a sample view? If so, you could add that sample to a Developer Forums post or ask Developer Technical Support.

---

### Q:
I'm curious, is ShapeRole  working at all? I made my custom shape and overwrite it with .stroke but there was no change in rendering. It always fills the shape. I know the role variable is being accessed (I put a print statement)... but maybe I'm missing something. And also, what is the purpose of the separator role? It is not very clear from the documentation how that would affect output.

### A:
The role doesn’t strictly dictate exactly how the shape will be treated — it can still be explicitly fill or stroke’d by its use site.
This more determines the expected semantics of how its intended to be used, in a way that affects its default foreground styling.
For instance, you could have a stroke role Rectangle that is fill’ed and used as a divider-like element, and so it will receive divider-like default foreground treatment.

---

### Q:
Is there a way to animate hiding/showing the Navigation Bar in SwiftUI?

### A:
If you change the state that drives navigationBarHidden from inside a withAnimation block, it should animate. If it doesn’t, that’s a bug in SwiftUI.

---

### Q:
What's the best replacement for a `tableHeaderView` for a grouped list?
I want to avoid having a cell with a different visual style containing the content to be used as the header view, but I want to avoid sticky headers that are typically found in plain table views. What is the state of the art here?

### A:
Howdy! Great question, it’s not clear to me if using a custom row instead of a section header would get what you want here, but I think it’s a totally viable reason for feedback explaining your use case to make usually-sticky headers no longer sticky!

---

### Q:
Is there a way to get the current font size and weight? I want to draw in a canvas in a way that matches SF Symbols as well as possible. Is there a way to resolve the current `Font` like i can resolve `Text` and get these attributes?

### A:
Howdy! Great question, I don’t believe there’s a way to get the resolved font size, weight, and design today. This is an excellent case where a feedback from you could help the team understand your needs!

---

### Q:
Are there any methods that allow restriction of view orientation to just landscape or just portrait on a per view basis without defaulting  to UIHostingviewcontroller

### A:
I’m afraid not currently. That would be a great enhancement request Feedback!

---

### Q:
When I put Markdown-formatted text as a String literal in a Text, it formats with nice attribution, but when I pass it in from a variable, it doesn't. Is this a bug, or have I misunderstood something about how Texts take Markdown-formatted Strings?
struct ContentView: View {
	var text: AttributedString = "**Hello**, `world`! Visit our [website](https://www.capitalone.com)."
	var body: some View {
		VStack {
			Text("**Hello**, `world`! Visit our [website](https://www.capitalone.com).")
			Text(text)
		}
	}
}
The first Text renders nicely with bold, code and a link, while the second doesn't - it just shows the Markdown annotations in the string directly.

### A:
I think that’s a bug in beta 1. You might try Text("\(text)") to trigger the use of a different initializer.

---

### Q:
Hello,
Is it possible to have a simultaneous DragGesture in an inner view of a ScrollView which doesn't make the ScrollView drag gesture fail?
The DragGesture has a minimumDistance of 0.
It seems it's impossible to scroll the scrollView if the DragGesture is recognized (it's installed as simultaneous and the GestureMask is `.all`).
Is there a workaround?
Thanks!

### A:
Howdy! Great question, this is a great case where we could use feedback from you to better understand how folks use-cases vary with gestures and ScrollView. In the meantime, a possible workaround would be to use a UIViewRepresentable where you can wrap a UIScrollView and get access to all its goodies and expose any functionality you need to your SwiftUI hierarchy.

---

### Q:
Is it intended that setting a value to a @FocusState property inside a Form does not work? The property stays nil and thus the focus isn't moved e.g. to a TextField inside the form. Using a VStack instead of the form works like a charm.

### A:
Yes, please file feedbacks (if you already haven’t) for any context where @FocusState doesn’t work the way you’d expect. Thanks!

---

### Q:
Is there any way to get GeometryReader size from another view? I want to replace "???" with the height of "Hello world!".
```
struct ContentView: View {
	var body: some View {
		VStack {
			Text("Hello world!")
				.background(
					GeometryReader { proxy in
						Color.clear /// placeholder
						let _ = print(proxy.size.height) /// 20.333333333333332
					}
				)
			Text("Height of first text is ???")
		}
	}
}
```

### A:
Howdy! Using a GeometryReader in a background of a view ensures the GeometryReader doesn’t grow to be larger than that containing view, but it makes it tricky to bubble its size out. You could do something like this:
struct ContentView: View {
  @State private var height = 100.0
  var body: some View {
	MyView().background {
	   GeometryReader { proxy in
		  Color.clear
			.onAppear { 
			  height = proxy.size.height 
			}
			.onChange(of: proxy.height) {
			   height = $0
			}
	   }
	}
  }
}
Then you can use your height State property like usual.
⚠️ Beware: You must ensure you will not cause a continuous layout loop here, if your layout responds to height changing in a way that causes the GeometryReader to lay out again and cause height to get updated, you can get into a loop!

---

### Q:
Hi, I'm trying to implement an interactive media playback timeline (i.e., slider) for my audio player app in SwiftUI. However, when I use a high frequency timer to update the playback timeline, the app and other views become unresponsive :(. How can I implement high frequency SwiftUI view updates, and still maintain a responsive and interactive app?

### A:
Thanks for the question! It’s hard to give specific advice without seeing code, so this might be a good question for the Developer Forums. A couple of other useful things to look at:
There’s an Instruments tool for diagnosing why an update is slow.
Check out the new TimelineView for creating views that update at the same frequency as the display. It doesn’t do any good to try to update faster than that, because the display can show intermediate frames anyway.

---

### Q:
By default the title of .newItem is "New Window". How I can customize it? For example "New <AppName> Window"
	
### A:
We will use the title of the WindowGroup in the menu item, if you provide one. For example:
WindowGroup("Viewer") {
	...
}
Will give you a menu item titled “New Viewer Window”.
This title will also be used for the default window title, which can be changed with navigationTitle(_:).

---
	
## 🗓 Friday
---

### Q:
Hello,
When using TCA, a new instance of `ObservableObject` (the `ViewStore`) is frequently installed as `@ObservedObject` when the view tree invalidates.
What are the consequences of vending a new instance (possibly with the same properties' values) in terms of performances?
Would it be absolutely better to reuse the same instance if possible, or is it acceptable as `@ObservedObject` installation is quite efficient?
Thanks!

### A:
I can’t speak to a third party framework, but in general if the observable object is replaced, every view that has a dependency on it must be re-rendered. Check out the talk Demystify SwiftUI for more details on dependencies.

---

### Q:
The `Canvas` looks like a great new addition.
I'm wondering about using it to render a single drawn surface that can be nested in a `ScrollView` which is then panned, zoomed into etc.
Is this a reasonable solution and in terms of performance, will there be any guidelines on how far to push it?
I intend to put a whole bunch of images as well as other shape data in there.

### A:
This sounds like a good application for Canvas.
Like anything, performance will depend on how far you push it and the hardware it’s running on. I’m afraid that’s not a very actionable answer, but every app is different.

The API documentation is here: https://developer.apple.com/documentation/swiftui/canvas/
The talk “Add rich graphics to your SwiftUI app” supports the copy code feature too, so you can grab some fun snippets to play with.
https://developer.apple.com/wwdc21/10021

---

### Q:
If we break our Views into separate some View properties to help readability, is there much cost to marking those other properties as ViewBuilders to get the nicer syntax? Is that something we need to worry about?

### A:
Nope, in fact, we encourage you to do so! Using the @ViewBuilder syntax helps nudge you towards structuring your code in a way that SwiftUI can make use of intelligently, so using it in more places is never a problem. Check out the talk, Demystify SwiftUI for more on this! 
https://developer.apple.com/videos/play/wwdc2021/10022/

---

### Q:
Is it safe to employ multiple `TimelineView` with the `animation` schedule or is it equivalent to instantiating a number of `CADisplayLink`s? I was thinking of the adage around “reusing” `CADisplayLink`s as much as possible.

### A:
Yes! You should be able to use as many TimelineView as appropriate to get your interface behaving how you want. SwiftUI will take care of scheduling things so they update like you want.

The thing to be careful of is to not have too much "different" between each update of the timeline content.

---

### Q:
Dumb question here... but I was just playing around with the code in the Advanced Graphics section of Whats new in SwiftUI. Taylor showed a symbols browser.... I copied the code and when I run the performance is really bad... he showed the smooth gesture with the fisheye and the timeline view animation... on my side it is super jerky with seconds delay to render... is that right?

### A:
Sorry about that! That’s a known issue in beta 1.
As a quick workaround to see the same smooth effect today, you can manually cache the resolved images. 

One thing you could try is moving that resolution to be outside of the inner for loop, so it only happens once. (cheating since for the code snippet it only uses the swift bird rather than every symbol like my demo had). 

---

### Q:
What's the recommended way to share SwiftUI code between multiple platform targets? Recent Xcode multiplatform templates simply make source files members of multiple targets, but a few years ago the recommendation for sharing code between e.g. an app target and an app extension was to create a shared dynamic framework (e.g. MyApp, MyAppExtension and MyAppKit). What would be the pros and cons of either approach?

### A:
It really depends on the complexity of your particular app.
The templates are the fastest way to get started and aim to minimize complexity. A shared dynamic framework is a great approach as your app grows.

- How about dynamic frameworks vs. SPM packages?
I believe an SPM package can produce a dynamic framework now, but that’s outside my expertise. It might be a good question for the DevTools Lounge or a Swift lab though!

---

### Q:
When an observedObject is passed into a view, does SwiftUI differentiate between views that actually use it (the object is used in the body) and 'intermediate' views (which just pass that object to a child? )? Or are all views just invalidated?

### A:
Yes, there is a difference. If you don’t use any of the ObservableObject property wrappers (@StateObject, @ObservedObject ) the view would not observe and update the instance. So you you just need to pass an ObservableObject through some intermediary view just make it a regular property on the view but make sure to use the property wrapper if you ever read any of the value in the view, otherwise your view will no be consistent with your data.

Also, @EnvironmetObject is a great tool when you have an ObservableObject that you want to pass down multiple levels of your view hierarchy without having to manually do it every step of the way.

---

### Q:
What is the recommended architecture when using SwiftUI?
In a lot of the demos (and this is probably my inexperience showing) it seems that the business logic leaks into the view.
Would you recommend using MVVM for example and how would you set that up?

### A:
Thanks for the question!
Josh S. gave a great answer to this in the Q&A yesterday:
For me the most important thing is that you have a software architecture in mind that works well for you, and helps you craft maintainable apps with a good separation ways to achieve that, but they’re by no means the only one. If you’ve got a well-considered architecture that works well for you, I think that’s great and helps you craft maintainable apps with a good separation ways to achieve that,”

---

### Q:
Could we use .prominent Window Scene Presentation Style in SwiftUI?

### A:
Hi, we do not have support for this, but would love a feedback with any specifics you could provide about your use case.

---

### Q:
If I have to embed a SwiftUI View into a UIViewController to do something only available for UIViewController (like customize appearance that SwiftUI not support), is there any problem about the following two way?
1. Create a UIHostingController<MySwiftUIView> A, add A's view as a subview to my own UIViewController B's view. (of course do some layout and `addChild` `didMove` stuff)
2. Inherit UIHostingController<MySwiftUIView> directly to override some VC methods

### A:
Either approach is fine! Please do file feedback though about what you're trying to achieve that requires wrapping the SwiftUI content like this.

---

### Q:
Why does a `UIViewRepresentable` update once after `makeUIView` and once before `dismantleUIView`?

### A:
The update function can be called for a number of reasons. It will be called at least once after make as the UIView becomes extant. It may be called multiple times before the UIView is eventually dismantled. You should not rely on any frequency (or lack thereof) of update calls.

---

### Q:
How do we avoid incurring in `Bound preference SizePreferenceKey tried to update multiple times per frame`?

### A:
It sounds like you have a cycle in your updates. For example, a GeometryReader that writes a preference, that causes the containing view to resize, which causes the GeometryReader to write the preference again.
It’s important to avoid creating such cycles. Often that can be done by moving the GeometryReader higher in the view hierarchy so that it’s size doesn’t change and it can communicate size to it’s subviews instead of using a preference.
I’m afraid I can’t give any more specific guidance than that without seeing your code, but hopefully that helps you track down the issue!

---

### Q:
When using View.frame(minWidth:, idealWidth, maxWidth:…) are there any combinations of parameters that are more performant that others? Any combination to avoid?

### A:
There isn't really any performance difference between any combination of parameters. You should just use the appropriate values to get the layout you're looking for.

- what's the best way to enforce a specific size? min + max? or ideal? or all?
You would want to use the other version of .frame for that which just takes a width and a height. View.frame(width:,height:)

---

### Q:
Is there any way to set/control backButtonDisplayMode from SwiftUI? By the way, thanks for all the great new features

### A:
Thanks for the question. I’m afraid there’s no SwiftUI API for this currently.
If you could file an enhancement request Feedback, that would really help me prioritize that work though!

---

### Q:
Can you explain the AttributeGraph that comes up while debugging sometimes?

### A:
I’m afraid we can’t discuss implementation details, but be sure to check out the talk “Demystify SwiftUI” for the details of the dependency graph. https://developer.apple.com/wwdc21/10022

---

### Q:
Is there a way to disable pixel rounding in SwiftUI? The hover effect from my OS X Dock yesterday is jittery because padding is being applied to many views in a row, but rounded to the nearest pixel for each view. This inaccuracy in padding adds up, making the entire view jitter by a few pixels whenever I move the mouse.

### A:
SwiftUI layout is always rounded to the nearest pixel. But using any GeometryEffect won't take on the snapping behavior. Things like .offset and .scaleEffect are existing ways to achieve this, but you can also implement your own GeometryEffect if you need something custom.

---


### Q:
In most cases, the layout behavior with `Spacer` can be replaced with `.frame(maxWidth:,alignment:)` (or height)  seamlessly. Since Spacer is an actual View that is arranged within the view hierarchy, using Spacer will consume more memory and cpu resources. And Demystify SwiftUI also says "modifier is cheap".
So should I use `.frame` instead of `Spacer` as much as possible?

### A:
While Spacer is a view, it doesn't end up displaying anything of its own so it is plenty lightweight. Using .frame can have other behavior introduced to the way the view gets laid out beyond just changing its size. They both have their uses, so use them each where appropriate.

To add a little more onto this, even in cases where you will get almost entirely the same behavior between the two, the performance difference will be so minimal that I would strongly suggest prioritizing code readability over performance / memory use to make this decision. If Spacer makes it more clear what layout you’re trying to specify, use that, and vice versa.

---

### Q:
Does SwiftUI expose enough API that would allow us to build our own `Lazy{H,V}{Stack,Grid}` with a fully custom layout, or are there still a lot of "magical bits" under the hood that prevent us from doing so?

### A:
Unfortunately, we don’t offer support for building custom layouts today.

---

### Q:
What is the handlesExternalEvents modifier? I’ve seen it used, but don’t know what it is.

### A:
This modifier allows you to specify a Scene to be used when external data is sent to the app - a URL or an NSUserActivity . For example, on macOS, when a url comes in that matches the pattern, we will either create a new window for that Scene, or use an existing one, if a view has been modified with handlesExternalEvents to prefer that incoming value.

---

### Q:
Is there a way to customize NavigationView's navbar other than `UINavigationBar.appearance`?

### A:
Unfortunately, there isn’t any SwiftUI native way to do this right now. If this is something you want, please file a feedback report requesting the feature!

---

### Q:
The `State` documentation states “It is safe to mutate state properties from any thread.” What does it refer to considering that SwiftUI complains with runtime warnings when a `PassthroughSubject` published from a non-main thread?

### A:
State is thread safe and can be mutated from any thread.
When you mention PassthroughSubject I would imagine you are using that in the context of an ObservableObject with either one of @StateObject, @ObserverdObject, or @EnvironmentObject . ObservableObject does require that you mutate all the properties observed by the view, and publish objectWillChange on the Main Thread.
I would recommend you check out Discover Concurrency in SwiftUI where my colleague Curt and Jessica talk all about Swift and concurrency https://developer.apple.com/videos/play/wwdc2021/10019/

---

### Q:
Is there a way for a view to know when the window it is hosted in is key or not on macOS?

### A:
Could you elaborate some on what you’re trying to achieve? There is the controlActiveState property on the Environment, but there is also focusedValue(:_,:_) and @FocusedValue which are used in the context of the key window on macOS.

---

### Q:
Is there a way to disable the scrolling on a List so I can use it within a ScrollView? I have a ScrollView, inside which I'm placing an Image, some Text, and then I would like to be able to place a List. However, currently, the List doesn't appear unless I give it a fixed frame size, and the List is also separately scrollable. Is there a way around this?

### A:
I’m sorry, but that’s not currently supported.
If you would be able to file an enhancement request Feedback with your use case, I’d really appreciate it! I know Feedback can seem like a black box (sorry about that), but they really do help us, even if we can’t respond directly to every request.

---

### Q:
Can items in a list accept drop items? It seems to immediately crash my app.

### A:
Could you please file a feedback for this crash? If you can also include a sample that reproduces the issue, that would be especially helpful.

---

### Q:
If we create custom property wrappers that embed existing ones (like State, ObservedObject, etc) does SwiftUI still "see" those embedded wrappers and do the right thing?
For example, can I create an `@Whatever` wrapper as a convenience for `@Environment(\.whatever)` and still expect that to work the same way?

### A:
Yes, you can make do that. As long as you add conform to the DynamicProperty to your wrapper this will work.

---

### Q:
without having to jump to ios15 for focusedSceneValue, is there a recommended way for non-document windows in a window group to surface a kind of "current object" that can be used to activate/deactive menus & send commands to, even if no editable control as focus? (in swiftui)

### A:
Good question! focusedSceneValue provides a way for the current focused / key window to surface its values to @FocusedValues in menus and other places; this is especially important on macOS since an app can have many windows, but only one of those is key.
As for other approaches, it somewhat depends on your use case: if you do need your current object to be tied to the key window specifically, there isn’t a substitute. But if you more want to aggregate information across all of your windows, you could use things like preferences and the environment to manually pass that data around

---

### Q:
I have a framework that vends a SwiftUI View to the main app via a HostingController. The view handles everything it needs internally, so all the types are internal. The only public method is the one that vends the HostingController. In order to maintain the isolation I do it this way:
`return UIHostingController(rootView: AnyView(SchedulesView(store: store)))`
Is this a correct way to use `AnyView`

### A:
Yes, that’s an OK usage, particularly because it’s at the base of the hierarchy view and not used to add dynamism.
But there are other ways to encapsulate the exact type of the hosting controller, for instance returning an upcast or custom protocol type
Returning it typed as UIViewController instead its actual `UIHostingController<..>` type
Creating a protocol with the extra API that clients might expect from the view controller, and returning it typed as that
Or by using a container UIViewController that has a child of your hosting controller

---

### Q:
When I've needed to inject data into a detail view, but still let the view have ownership of its StateObject, I've used the StateObject(wrappedValue:) initializer directly in my view initializer, for example:
```
public struct PlanDetailsView: View {
	@StateObject var model: PlanDetailsModel
	 public init(plan: Plan) {
		self._model = StateObject(wrappedValue: PlanDetailsModel(plan: plan))
	}
   ...
}
```
Is this an acceptable use of the initializer? I know StateObject is only supposed to initialize at the start of the View's lifetime, and not on subsequent instantiations of the View value, so I want to make sure I'm not forcing it to re-allocate new storage each time the View is re-instantiated.

### A:
Yes, this is an acceptable use of the initializer and your understanding is correct: that object will be create only at the beginning of the view lifetime and kept alive. The StateObject ’s wrapped value is an autoclosure that is invoke only once at the beginning of the view lifetime. That also means that SwiftUI will capture the value of plan when is firstly created; something to keep in mind is that if you view identity doesn’t change but you pass a different plan SwiftUI will not notice that.

---

### Q:
Hello! I have tried to implement with SwiftUI a common feature in iOS apps that is when tapping again a tab item of a TabView with a nested NavigationView, it pops to the root view of the navigation view. Using presentationMode.wrappedValue.dismiss() it just chains the view dismiss, any idea of how to implement this in a more clean way ? (mine feels "hacky")

### A:
Thanks for the question! I’m afraid I don’t have a great answer here, but there are a couple of options you can try.

One option is to use a representable to embed a UITabBarController, so you can hook the delegate methods.

Another option, if you can detect when the user taps the same SwiftUI tab again, is to decorate your NavigationView with .id(counter), where counter is @State private var counter = 0.

Then when the user taps the same SwiftUI tab again, you can increment counter, which changes the identity of the navigation view, causing SwiftUI to replace it.

I’d love to get an enhancement request Feedback for your particular use case so we can prioritize making this easier!

---

### Q:
How can I control the ideal size of a UIViewRepresentable View? I have a lot of trouble getting correct automatic sizing of wrapped views, especially if they wrap UIStackView. Any recommendations for getting proper automatic sizing so I don't need to use fixedSize so much?

### A:
Try implementing intrinsicContentSize on your view.

---

### Q:
Is there any way to open additional window from SwiftUI Life cycle? I mean call additional WindowGroup. For example Inspector panel.

### A:
Hi - we currently do not have any API for this, though we’d love if you could file a feedback with any specifics you have for your use case. One option for something like an inspector panel is that you could use NSApplicationDelegateAdaptor, and open your window by communicating with that. A secondary WindowGroup might not be the best match for something like an inspector panel, since WindowGroup supports multiple windows, and will should up in the File -> New menu.

Oh, I should mention that the window created via the delegate adaptor would be an NSWindow instance, with an NSHostingView as the contentView.

---

### Q:
For when using @EnvironmentObjects, it seems like I need to pass the .environmentObject modifier for every layer of subview. If I don't do that, it will give error "view environmentObject may be missing as an ancestor of this view"
But I thought the point of Environment Objects is to make data available to all view without writing a lot of code. Is that a design choice or am I doing something wrong?

### A:
Thanks for the question. .environmentObject(…) mostly flows down the view hierarchy, however there are some places where we intentionally do not forward it.
For example, the destination of a navigation link does not get the environment object, because there is a conflict as to whether the destination should get the object from the originating link or the placeholder of the destination, or even the previous view on the stack.

There was also a bug where sheets and popovers didn’t get the environment object, but that was fixed.

If you find other places where environment object does not propagate as expected, please file a Feedback. It’s important to me that we get this right!

---

### Q:
Is there a way to control the opacity/overlay effect applied to a Menu's label in iOS? Menu currently applies a high-opacity white overlay (I assume!) on its label when tapped, and I'd like to make it less opaque/override the effect entirely.

### A:
Not today, but if you haven’t already please file a feedback requesting the ability to do so.

Oh, and adding context for why you want to customize that effect is always really useful too!

---

### Q:
Can the new `AtrributedString` be used to provide accessibility notations in SwiftUI like `NSAttributedString`s can in UIKit? Should we report any attributes from `NSAttributedString` we need on `AttributedString`?

### A:
AttributedString should have the full suite of accessibility attributes and they should now be standardized across platforms!
But if you see any we missed, please do file Feedback so we can fix any oversights.

Thanks for the question. We’re super excited about the AttributedString support!

Localization, accessibility, formatting, and morphology agreement in one tidy package.

---

### Q:
I’ve had a lot of inconsistent behaviour with EnvironmentObject where it isn’t passed in, nil when referenced, etc. Am I holding it wrong, or what could some common pitfalls be with using it? I've reverted to a singleton for global access but I'd rather get EnvironmentObject right.

### A:
It’s a little hard to tell exactly what issue you’re running into just from this description, but sorry to hear it’s been causing you trouble! How have you been “holding it”, so to speak?

---

### Q:
Hi! Thanks for answering questions here! I have an app that needs to hide the home indicator, but that does not seem to be possible in SwiftUI. I know I can do it with exchanging the root ViewController but that has a lot of side effects in a pure SwiftUI app. Is there a better workaround?

### A:
Thanks for the question. I’m afraid we don’t have SwiftUI API for this currently. Using UIKit is the best option for now.
If you could submit an enhancement request Feedback, I’d really appreciate it.

---

### Q:
Is it okay to use child CoreData context as @StateObject vars in SwiftUI views, or would you recommend passing those in the environment and holding on to them outside of SwiftUI?

### A:
There is not need to use a @StateObject since the context is not an ObservableObject. Passing it down using the environment is a good solution.

---

### Q:
What’s the best practices for making a SwiftUI view accessible?

### A:
You should get a lot of Accessibility automatically. The best way to determine whether you need to make tweaks, using our Accessibility APIs, is to try your view with some of our features, like Large Text, VoiceOver, etc.

You can also take a look at the new Accessibility Inspector in SwiftUI and see what it shows for your Preview view.

In general, system standard controls tend to be accessibly by default, but when you use a lot of Shape or other manual drawing, you may need to do more work.

Hi Arie. A great place to start is our introduction video from 2019.
https://developer.apple.com/videos/play/wwdc2019/238/
This will introduce you to accessibility in SwiftUI. You could follow that up with this years presentation where we go beyond the basics.
https://developer.apple.com/videos/play/wwdc2021/10119/
We also have many WWDC videos on best practices when making a view accessible. Such as writing great accessibility labels.
https://developer.apple.com/videos/play/wwdc2019/254/

---

### Q:
When using SwiftUI with something like Core Data and UIHostingController, how can we avoid using AnyView if the environment modifier changes the type of the view. See example below.
```
`import UIKit
import SwiftUI
import CoreData
struct MyView: View {
	var body: some View {
		Text("!")
	}
}
class MyHostingController: UIHostingController<MyView> {
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		// custom stuff here
	}
}
class TestViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		let persistentContainer = NSPersistentContainer(name: "MyStore")
		let rootView = MyView().environment(\.managedObjectContext, persistentContainer.viewContext)
		let hostingController = MyHostingController(rootView: rootView) // this will not work anymore because type has changed with the environment modifier
		// more stuff
	}
}
```

### A:
Great question! Here’s a technique, though it runs the risk of angle-bracket-blindness …

In class MyHostingController: UIHostingController<MyView> MyView isn’t really the right type.

You want the type of MyView().environment(\.managedObjectContext, persistentContainer.viewContext)

On the let hostingController = …  line, you’re probably getting an error message about the types not matching. That error message will include the full type of the right-hand side of the assignment.

Something like ModifiedContent<MyView, …> with lots of stuff inside the … there.

What I like to do is (1) copy that type, then (2) add a top-level type alias: typealias MyModifiedView = ModifiedContent<MyView, …> where the right-hand side is the value I copied from the error message.

Then you can write class MyHostingController: UIHostingController<MyModifiedView>

---
	
## 🗓 Thursday
---

### Q:
When using the new SwiftUI Table View, can you Group to have more than 10 TableColumns?

### A:
Yes, you can; just like Views!

- Do I understand correctly that there are no more limitation on the number of objects in @ViewBuilder?
There is no change to @ViewBuilder this year, so it is still limited in the number of elements it can build into a block. But Group as well as nested builders are great tools to allow for as many views to be combined together as you want

---

### Q:
What happens when you have three views in a hierarchy, where the root and leaf views share dependency, but neither share dependencies with the middle view. Would the middle view get redrawn?

### A:
If the middle view isn’t dependent on the others, it isn’t redrawn.

Note that if the root view passes parameters to the middle view, then it has a dependency.

---

### Q:
Is there a good way to switch between HStacks and VStacks while allowing SwiftUI to understand that the contents of those stacks are the same?

### A:
Lots of questions similar to this, so repeating an answer from earlier:
Yes! You should check out the matchedGeometryEffect() API, which was introduced last year:
https://developer.apple.com/documentation/swiftui/view/matchedgeometryeffect(id:in:properties:anchor:issource:)

---

### Q:
Is the @ViewBuilder to remove AnyView in "Demystify SwiftUI" only available with iOS 15 ?

### A:
No, in fact it can back-deploy to any previous version!

---

### Q:
Are there performance considerations when generating UUIDs? (I.e. generating a lot of UUIDs for elements in an array to display in a list).

### A:
It depends. You'll need to measure. However, consider generating IDs lazily (make sure you store them though!)

---

### Q:
Performance wise, is it preferred to pass `ObservableObject`s down to subviews explicitly, or use `EnvironmentObject`s?

### A:
Using one or the other shouldn’t make much difference in any given view, but if you don’t need to use the object in some views then EnvironmentObject is a great way to avoid the boilerplate of pass it down through intermediary layers, and can avoid creating unintentional dependencies.

---

### Q:
Is there a good way to apply a modifier to a SwiftUI view conditionally? I'm using a custom .if modifier, and it refreshes the whole view on state change :(

### A:
Consider making an inert version of the modifier as discussed in the session. If there is a modifier that lacks an inert version that you'd like to see, please file a feedback.

---

### Q:
How can we conditionally set different modifier, for example list styles?

### A:
Styles in SwiftUI are static, and are not permitted to change at runtime. This is a case where a branch is more appropriate, but consider whether you really want to change the style— a single style is almost always the correct choice.

If there is a certain dynamism you're looking for here, please file a feedback.

---

### Q:
Is there any situation in which Hashable may be preferred to Identifiable?

### A:
If you just need to be able to identify a value, that’s what Identifiable is for, which means that only the id needs to be Hashable, not the whole type.

---

### Q:
If we apply same id in the condition, will SwiftUI sees this as a same view
```
var body: some View {
	if isTrue {
		Text("Hello")
			.id(viewID)
	} else {
		Text("World")
			.id(viewID)
	}
}
```

### A:
No, these will be two different views.

Raj (Apple)  3 days ago
This is because body is implicitly a ViewBuilder. If you don't use a ViewBuilder, such as in another property, it would be the same view.

---

### Q:
Are there any difference between
passing a State as a binding through each view in the hierarchy
vs
passing it as an environment object and only access it in the subviews that use it, say in a Text view
would the first one have worse dependency graph that needs more updates?

### A:
environment object is a slightly different tool than State since it requires an ObservableObject. Environment object is optimized to invalidate only the views that read its value.
As for State, when you pass the binding down to subviews, changing the binding will mutate the state that in turn will invalidate the view holding the state and its children.

---

### Q:
What is a good way to have a custom order of elements in a list so the user can change the order (using a stable ID)?

### A:
A List or ForEach will preserve the same order as used in the collection passed into them. The identity of each element should be independent of that order — even if a collection is reordered, each element should maintain the same ID.

If you maintain a stable identity like that, then you should be able to reorder the collection no problem in response to user actions

---

### Q:
Is there a way to animate a View moving from one place in hierarchy to another? Like when a View changes parents?

### A:
Yes! You should check out the matchedGeometryEffect() API, which was introduced last year:
https://developer.apple.com/documentation/swiftui/view/matchedgeometryeffect(id:in:properties:anchor:issource:)

---

### Q:
Fun question on conditions: We need to put them at least in Group { if whatever { ... } else { ... } }. So ... is it preferable to use ViewBuilder commands to create it, like             ViewBuilder.buildBlock(pageInfo == nil ? ViewBuilder.buildEither(first: EmptyView()) : ViewBuilder.buildEither(second: renderPage) )
Awful to read, but is it better?

### A:
Using a Group is preferred in this case.

---

### Q:
The Dependency Graph — can it have loops, or is it acyclic?

### A:
Graph cycles are not allowed and will trap at runtime.

---

### Q:
I have a class Store<State, Action>: ObservableObject that holds the whole app state. It lives as @StateObject in the root of the App lifecycle and passed via environment to all views. View send actions to the store and update as soon as store's state updated. It allows me to keep the app consistent. Could you please mention any downsides of this approach from your prospective?

### A:
That approach makes every view in your app dependent on a single Observable object. Any change to a Published property forces every view that references the environment object to be updated.

I think this might cover your question too.

-by "forces every view that references the environment object to be updated" you mean that view produces new body to diff with old body?

That view produces a new body.
SwiftUI doesn’t diff views. It regenerates views when dependencies change.

---

### Q:
is there any difference between the persistence of @State vs @StateObject vs @ObservedObject when identity changes?

### A:
Yes! ObservedObject does not have any lifetime implications— when you use that property wrapper, you are responsible for managing the lifetime yourself. The object can live anywhere— either in StateObject or possibly even in another data structure in your app.

---

### Q:
Should `@State` and `@StateObject` be usually defined as `private`?

### A:
Yes! It's often helpful to make them private to indicate that the state is for this view and its descendants.

Thank you! It was a great talk!

---

### Q:
If the only reasonable property for establishing stable identity in a model from, say, an existing JSON API, is a string that might be quite long (maybe it's more of a description than a name), is that large ID enough of a potential performance problem that we should consider modifying the model/API to add a more compact ID? Thanks much!

### A:
Great question! As with any performance problem, it's best to measure first before over-optimizing. Long strings can often be expensive, so it might make sense to optimize the identifier, but I'd recommend measuring first.

---

### Q:
I have created a ViewModifier that adds a custom modal “overlay” on top of a view, somewhat similar to a sheet. Is there a way to pass a View as parameter of this ViewModifier initializer, without resorting to AnyView? I want to be able to pass the view that will be the actual “content” of the overlay.

### A:
You can do this by making your custom ViewModifiergeneric on the content, something like: struct MyModifier<C: View>: ViewModifier { ... } , then using a property with the generic like so: var content: C

---

### Q:
From the dependency graph part of "Demystifying SwiftUI":
The video mentioned that both views, two views that are dependent on the same dependency, would need to generate a new body. Which view would need to generate a new body first if one view is the child of the other?

### A:
The parent view will generate its body first, and recursively travers all the child views.

---

### Q:
Is the computed UUID not stable because we cannot predict the position of the value, therefore where it will be placed in the view?

### A:
Yes

---

### Q:
Do situations exist when the developers really need to use AnyView and there are totally no alternatives using Swift constructs?

### A:
Lot’s of questions about when it is okay or not to use AnyView!
If you can avoid AnyView, we recommend that. For example, use @ViewBuilder or pass view values around using generics instead of using AnyView.
However, we offer AnyView as API because we understand that there are some situations where no other solution is possible, or comes with other important tradeoffs.
One rule of thumb: AnyView can be okay if used in situations where the wrapped view will rarely or never change. But using AnyView to switch back and forth between different values can cause performance issues, since SwiftUI has to do extra work to manage that.

---

### Q:
Do you have any suggestions for why `Image("AppIcon")` would fail to work, when `Image(uiImage: UIImage(named: "AppIcon")!)` works just fine? Is that intentional behavior?

### A:
Is the image located in an asset catalog?

- Yes. It’s the AppIcon in the asset catalog.
- (As in, the one used for the app icon on the home screen.)

Please file a report through feedback assistant if you haven’t already. If you have, can you post the number here?

I’d wonder whether the asset compiler is treating the app icon specially.
We should fix it, but perhaps the app icon is being copied elsewhere in the bundle so the system can reach it.

---

### Q:
Is there a way to debug AttributeGraph crashes? I’m getting `AttributeGraph precondition failure: "setting value during update": 696.`, probably due to a hosting controller somewhere, but don’t know how to track it down.

### A:
Thanks for the question!

That error usual means that some code evaluated in body or updateUIViewController  (or NS…) is mutating state.

We have a new debugging tool in the new SDK that might help narrow it down.

Inside body if you write Self._printChanges() SwiftUI will log the name of the property that changed to cause the view to be redrawn.

(Note the underscore. This isn’t API, but is for exposed for debugging.)



---

### Q:
Still hoping to get any info on if you can hide the tab bar when using TabView and pushing items onto a NavigationView like you can in UIKit.

### A:
I do not believe there is a TabViewStyle that will allow this. However, please file a request using feedback assistant describing your use case. Thanks!

---

### Q:
I've started an app where I've got 3 screens - selected by tab views. I'd like to create a setting to default to one of the screens or the other. What's an efficient way to do that? Maybe a lab type question...

### A:
You would use the selection Binding passed into the TabView initializer to decide which view will be selected by default.

```
struct ContentView: View {
	@State var selectedTab = 1
	var body: some View {
		TabView(selection: $selectedTab) {
			Text("First")
				.tag(0)
			Text("Second")
				.tag(1)
			Text("Third")
				.tag(2)
		}
	}
}
```
That will have the view start with the 2nd tab selected

---

### Q:
Any way to control when the @SceneStorage gets saved? Many are in my root app view, and they only seem to be written at app background, not before.

### A:
I’m sorry, but we don’t provide API to control scene storage. The intent is that it’s saved on backgrounding and restored on foreground/scene recreation.

---

### Q:
As a college student, working as an intern at Apple is really important to me. What is your best recommendation for individuals considering applying for an internship at Apple, whether it be related to a resume, project types, or otherwise?

### A:
It’s great to hear you’re interested in working at Apple! I joined as an intern so I can definitely relate to the craziness of applying, but it is absolutely worth doing. Interning at Apple is a really wonderful experience, and you really do some incredible work over the course of an internship! Getting hired at Apple means being very intentional about what you’re looking for, and the best way to do that is to explore the jobs site for roles you think you can do, and applying specifically for that role. We have thousands of hiring managers and I don’t know most of them, so my recommendation won’t carry much weight, so I can’t be of much help there. My best advice is to create a compelling cover letter and résumé that expresses why you are right for this specific role, rather than applying for dozens of jobs at once.  

There’s lots more information for you here as well: https://www.apple.com/careers/us/students.htm

---

### Q:
Is there an efficient way to set the values of individual pixels in a view in SwiftUI? Sorry I haven't fully examined the new Canvas API yet. For the record, I don't really know how to do this in UIKit either, other than writing a custom fragment shader for a Metal view. Thank you!

### A:
Canvas is really the best bet here. You could fill a 1px x 1px rectangle of the color you want, and that would be the most efficient expression of that within SwiftUI itself.

And to get the size of a pixel you would request the pixelLength from the environment of the GraphicsContent of the Canvas

---

### Q:
When to iterate a collection directly from List(items) { items in
Code here
vs.
List {
ForEach(items) { items in
Code here...

### A:
Fundamentally these should provide the same behavior, in almost all use cases this would be a stylistic choice over which to use. The former works great if you know you'll only ever have that single array of items in your list. The latter is where I generally start because its less things to change if I want to provide content from multiple sources into my list.

---

### Q:
Will TextEditor have any level of support for AttributedStrings?

### A:
While we can’t comment on any future plans, please do file a request through feedback assistant for any improvements to TextEditor that you would like to see!  

---

### Q:
Is it possible to specify paragraph styles AttributedStrings used by SwiftUI Text views? I don't see any mention of paragraph style in the SwiftUI AttributeScope (but it's there for the UIKit scope)

### A:
SwiftUI currently supports all of the attributes in the SwiftUI scope and some in the nested Foundation scope, the supported Foundation attributes are links and inlinePresentationIntent. So it’s not possible to specify paragraph styles

---

### Q:
Is it possible to place a CALayer inside of a SwiftUI view without using a UIViewRepresentable?

### A:
Not currently. UIViewRepresentable is the way to go if you want to expose custom layers inside of your SwiftUI content. If you have a specific use-case where this can't work, please do file a feedback request!

---

### Q:
How do I get a SwiftUI time picker to change to 5min instead of 1min? I tried to find that but so far I haven't found how to do that...

### A:
Thanks for the question. Making sure I understand…
Are you using a DatePicker and want the stepper increments to be 5 minutes instead of 1 minute?

- no actually a time picker, .datePickerStyle(WheelDatePickerStyle())

Ah, right. And that’s applied to a view hierarchy containing a DatePicker then?
Set to just show time components?

- Yes: aDatePicker(“Please enter a time”,
		  selection: $startTime,
		  displayedComponents:
		  .hourAndMinute)
		  .labelsHidden()
		  .datePickerStyle(WheelDatePickerStyle())

And after all that clarification, I’m afraid the answer is that we don’t provide customization for that currently.

---

### Q:
In the past, I have created `Button` views that will have a local state and present a sheet. For instance, I might have a `Button` whose purpose is to add a new item to my app's data. This was super convenient because I could add such a button in any context without needing the view adding the button to know about that functionality.
Running my App Store version of my app on iOS 15, those buttons no longer are working. (I haven't yet debugged the app; I'm simply noticing it across my iOS 15 devices.)
Is this a sign that this is a pattern I shouldn't be using? Or should SwiftUI continue to support such patterns?

### A:
Please file a report using feedback assistant and a sample project. Thanks!

---

### Q:
There are instances when Buttons in SwiftUI stop responding to the iPadOS pointer, but work when tapped normally. Is this an expected behavior?

### A:
Please file a report using feedback assistant and a sample project that reproduces this issue! I would not consider this expected


---
### Q:
Is it possible to change the spacing between views in a List (or stack view) as the list scrolls up and down in a springlike manner? (i.e. is there a SwiftUI equivalent to UIKitDynamics?)

### A:
Hi Andrew, we don’t have any support for this in SwiftUI. Could you please file a feedback with the use case you are interested in? Thanks!

---

### Q:
What’s the recommended practice for custom sheet presentations? SwiftUI’s .sheet only supports the standard card-style modal presentation. It doesn’t have the flexibility of e.g. UIKit’s transitioning delegates and presentation controllers to let us size and position modally presented controllers.

### A:
Thanks for the question.
For custom presentations, I’ve had good luck putting the presentation content in an overlay, then using an offset modifier to shift it off screen.
To bring it on screen, I use State to zero out the offset.
If the state is updated inside withAnimation to transition is animated.

- That content won’t be lazy then, right? It’ll be computed in advance and off-screen.

You could conditionalize the content too.
An offscreen empty view would be essentially free.
As would an offscreen view with opacity of 0.
You might need to play with the transitions to get the appearance just right.

- And it’s essentially free because the framework is smart enough to not bother rendering content that’s invisible?

Yep!

---

### Q:
This isn't a technical question, but what is your favorite part about working on the SwiftUI Team?

### A:
The people, both inside and outside of Apple, by a million miles! Everyone I’ve worked with here at Apple is kind, empathetic, thoughtful, and incredibly passionate about the work we do. It requires lots of collaboration to pull all the work we do into one cohesive framework, so working with a great team is super important. Re. people outside of Apple, you all are the best community I could imagine. It’s really wonderful getting your feedback, hearing from you at WWDC, seeing you at community events, etc. As Josh said, empowering you all to make amazing apps is really special.  

---

### Q:
Is it possible to prevent a Button inside a List item from being activated when the list row is selected? Right now, if you have multiple Buttons they will all be triggered when the row is selected, so can't really have a secondary button in a list row.

### A:
Explicitly setting the buttonStyle of the nested buttons will stop the List from capturing the event.

---

### Q:
What is the recommended way to open a View in a new window in SwiftUI for macOS?

### A:
We don’t have much API in this area at the moment - using a NavigationLink in a commands context will open a window with the destination view. Could you elaborate on your use case here? If not, that is ok, but I would definitely suggest filing a feedback with any info you can provide us.

---

### Q:
How would someone go about turning a List cell into a TextField on tap, such as to edit the name (similar to the Reminders app)?

### A:
I’d try putting a TextField in an overlay of your cell content with an opacity of 0 and disabled. Then use a tap gesture to switch the opacity and 
You could use the new FocusState or onSubmit when the user is done editing to switch back.

- What about the new selectable text modifier?? Would that work here?

The trickiest bit will be getting your TextField and the regular Text to line up.
You might need some custom padding for that. Take a look at the ScaledMetric property wrapper to make padding that adapts to dynamic text size.
That’s a great idea. It would work for selecting and copying the text, but not for editing it.

---

### Q:
There's a lot of sample code out there where people use GeometryReader inside of clear overlays and the like to not impact layout... is that "ok"? Seems not like the way it was designed to work.

### A:
In general we'd consider that a bit of a misuse of the API. If you have specific use-cases where you're needing to do this we'd love to hear about it in a feedback report!

---

### Q:
This is kind of vague, but I know HID declares that a second button below a Sign in With Apple Button can't look too similar as to distinguish them. How lenient is this? Like I tried to "replicate" the sign in with apple button for a Sign in With Email Button (like a logo next to it with an envelope instead of the apple logo, used a similar but not SF font, etc), but I'm afraid this would constitute as being "too similar to the Sign in With Apple Button". Sorry for the vague question, and let me know if this is more suited towards a lab!

### A:
We cannot provide that kind of guidance here; you are probably better off reaching out to App Store developer review labs for confirmation. I would also review the guidance provided here re: custom buttons: https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple/overview/buttons/

---

### Q:
What is the layout and sizing behavior of Canvas?

### A:
A Canvas will consume the space offered to it.
You can put it in a .frame to control the size if needed.

---

### Q:
Is there a new SwiftUI way to convert a view into an image or pdf?  Currently, this can be done, but it is one of those round about, hacks that no one likes using.

### A:
Unfortunately, there’s no native SwiftUI api for this right now. As was mentioned elsewhere in the thread though and in your question though, it can be done by wrapping in a UIHostingController. Feel free to file a feedback requesting the feature though!

---

### Q:
What is the best way to implement keyboard bindings on swiftUI, for macOS?
I'm building a video player where I would like to forward and rewind with the left and right buttons.
I've tried attaching `keyboardShortcut(.leftArrow)` on my button but it doesn't work? Is it the view I'm attaching it wrong (shall I attach it to my window root view maybe?) or is there some known bug around it? Thanks

### A:
Attaching it to the button is the correct expression here - it sounds like you may be encountering a bug with this. Could you file a feedback with this issue?

---

### Q:
With Sign in With Apple, is it a requirement to use a nonce? I've seen conflicting information, some stating that if it's done externally (through something like firebase), then a nonce is required, but if it's done using `SignInWithAppleButton` then no nonce is required. What's the verdict on this?

### A:
As this does not appear to be related to SwiftUI, I recommend scheduling an appointment at one of the Apple Pay labs

---

### Q:
Is there a modifier to control how links in AttributedString are handled?
Specifically, I'd like to be able to handle some links in-app, rather than booting the user out to Safari

### A:
Currently the links will be handled by using the default OpenURLAction from the environment, it’s not possible to override it at the moment.
You could however use a custom url scheme that will open the url in your app, for example myapp://

---

### Q:
Let’s say I have a purely SwiftUI flow. I have a ListView with a `@StateObject var listFetcher`, that makes requests for a list of items. Tapping on an item in the list navigates to a DetailView, which has an ObservableObject property `detailFetcher`, that makes requests for details on the item.
What’s the best way to structure DetailView and which property wrapper would we use for `detailFetcher` in DetailView?
1.	Have an initializer like `init(itemID: Int)`, and use `@StateObject`? This would require us to eventually update the detailFetcher property with something like `detailFetcher.itemID = itemID` in the body’s `onAppear`
2.	Pass in the `detailFetcher` into the initializer like `init(detailFetcher: ObservableObject)` and make the property @ObservableObject? If this is preferred, where would this `detailFetcher` live if not in SwiftUI?

### A:
In general, use @StateObject when the view in question owns the associated object, i.e. the object will be created when the view is created, and should be destroyed when the view is removed.
In contrast, use @ObservedObject when the view needs to reference an object that is owned by another view or something else. So the view is dependent on the object, but their lifetimes are not tied together.
For example, you could have a main screen that uses @StateObject to initialize your app’s model, and then pass that object off to detail screens using @ObservedObject.
Also check out the “Demystify SwiftUI” talk tomorrow to learn more about this!

---

### Q:
With the new Markdown support for Text, are you able to control what specific Markdown elements look like?  For example, can we specify that **bold** is supposed to display as Demi-bold rather than bold?  Or what the font, font size, or font weight of an H1 header should be?  In general, how much flexibility do we have in styling the markdown?

### A:
At the moment, it’s not possible to control the default styling in Markdown for SwiftUI. It would be great if you could file a feedback as a feature request/suggestion. Another thing to note, SwiftUI only supports inline styles, paragraph styling such as headers (H1 for example) is not supported.

---

### Q:
Does SwiftUI support device rotation animations? When I rotate from portrait to landscape, my app just changes without an animation.

### A:
Please file a report using feedback assistant and a sample project!


---

### Q:
Is there a suggested way or best practice to show a UIDocumentPickerViewController in a SwiftUI sheet without triggering an "Attempt to present <X> on <Y> which is already presenting <Z>?

### A:
You should check out the .fileImporter modifier if you haven’t already:
https://developer.apple.com/documentation/swiftui/form/fileimporter(ispresented:allowedcontenttypes:allowsmultipleselection:oncompletion:)
If you are encountering a specific issue that you think may be a bug, please file a Feedback report!  

---

### Q:
I saw in the "What's new with SwiftUI" that TextFields will now have .onSubmit for when the return key is pressed for software and hardware keyboards. Does this mean that .onCommit will be depreciated or does .onSubmit serve a different function?

### A:
The initializers with .onCommit are soft deprecated. So no warnings in Xcode, but we’re encouraging new code to use  .onSubmit.

---

### Q:
Are current changes ‘set in stone’ and the feature release plan for SwiftUI has been wrapped up for iOS15 or we could expect more functionalities along the way until the official release?

### A:
We cannot comment on future plans. However, please file feedback for any issues you find and they will be triaged appropriately!
Note that “issues” here refers to both what is traditionally considered “bugs” as well as an feature requests or enhancements both for existing API as well as API that is newly introduced this year

---

### Q:
If we're using Sign in With Apple and have some text that says "Sign in with Apple [apple logo here from SF Symbols]" on a screen that comes after sign in with apple where we ask for some additional information (specifically just the birthday of the user), is that an HID violation? It's only used to reference Sign in With Apple, so I'm not sure if that would violate the rules or not

### A:
Just to clarify, your view has static “Sign in with Apple” text after the button has been tapped/clicked on another screen?

- Well so this is how it is -
There’s a login screen - it either lets you sign in with apple, sign in with email/password, or create an account. If they pick sign in with apple, and this is the first time they go through the process, then it prompts them with the hide my email/name sheet. Then after that, again if it’s their first time, there’s a screen they go to that asks for their birthday, and it says : Sign in with Apple [apple logo] with a subtitle stating that some additional info is required (paraphrased since it’s a little bit of lengthy text), and then a date picker for their birthday. That Sign in With Apple [apple logo] is sort of replicating what’s on the Sign in with Email screen which similarly says Sign in with Email [envelope icon].

- My guess is that it would not be allowed since it is giving users the impression that the birthday is part of the Sign In With Apple process, but that is not the case. I think it’s okay to show the birthday step following the sign in process, but as for showing “Sign In with Apple ” after that, I do not think it is allowed.

My recommendation would be to remove this text entirely and instead have something like “Finish setting up your account”
As indeed this does not have anything to do with signing in with Apple

---

### Q:
Are NavigationLinks "lazy" in iOS 15?

### A:
NavigationLinks do not fully resolve their destinations until they are triggered, though the value of the destination view is created when the NavigationLink is created.
In general, we recommend avoiding as much work as possible when a view is initialized, which would avoid potential issues here. This is important for performance. Instead, have that work be triggered within the view’s body, such as using onAppear or the new task() modifier.
SwiftUI may reinitialize views for any number of reasons, and this is a normal part of the update process.  

---

### Q:
Is there a way to show a watchOS app view using sample data in an iOS app, such as for an app that showcases various custom complication styles? I understand that the alternative would be a screenshot, but I thought it would be a much simpler workflow to have the watchOS views dynamically generated since both platforms use SwiftUI.

### A:
There is not, but please file feedback for the idea! Using screenshots is your best option as a workaround.

---

### Q:
On watchOS, I'm using `.onContinueUserActivity(NSUserActivityTypeBrowsingWeb)` and `.onOpenURL`, however these only receive callbacks once the app is already open. Is it possible to use these in a way that they receive the callback from a cold launch?

### A:
Those should function appropriately on cold launch. Please file a feedback with a sample showing where it isn't working if possible.

- What’s the easiest way to setup the site association file for the example?

That is an excellent question. Just the general shape of the application and where it's wired in will go a long way, even if the entire association isn't hooked up.

---

### Q:
What is the recommended way to account for a NavigationView title that may take up multiple lines? I tried setting .lineLimit to nil, but I am not getting the results that I want. For instance, I have "XYZ Club Executive Meeting" for the navigationBarTitle text, but it only shows "XYZ Club Execut..."

### A:
Take a look at the toolbar modifier and the .principal placement.
If that doesn’t meet your needs, please file a Feedback so we can look into your use case.

---

### Q:
The "What's new in Foundation" session demos localizing content in a SwiftUI app, "Caffe". Is this demo app available as sample code? It doesn't appear to be listed on the sample code page.

### A:
It is not available. But thanks for the suggestion, we’ll consider that!

---

### Q:
Is there a way to hide a default green scroll indicator on watchOS when using digitalCrownRotation modifier?

### A:
There is not, but please file feedback! I'm also curious why you would want hide the indicator?
I believe it does hide if you use make it "continuous"

---

### Q:
what would be the recommended way to handle complex navigations in a 100% SwiftUI project, in all my past UIKit project the coordinator pattern was really powerful for that but it's quite tricky to have it ported to swiftui. thanks

### A:
It’s difficult to make a specific recommendation for a complex app. Every app is so different.

This is definitely a great question to request a lab appointment for. Then we can understand your use case and make some suggestions, and maybe even look at some code together.

---

### Q:
Is there a limit to where SFSymbols change size? I put them as items in a TabView but it doesn’t seem like they are scaling with dynamic text …

### A:
TabViews do have a standard symbol size across all apps and how far they scale

- Does that mean they don’t scale as much as other places?

Right, other elements could end up scaling more, which is expected.

- Ah thanks - As a UI element I sort of wanted it to scale more. Is there a better way to do that. I’d rather not leave SF Symbols

If you have a more custom UI element where you want that scaling, you could build that! Especially with the new .bar material, you could still get a similar material background behind that custom bottom bar

- Ooo - I’ll have to read up about that. Is there a talk with more in depth discussion of material?

Today’s rich graphics session is the one you’re looking for https://developer.apple.com/videos/play/wwdc2021/10021/

---

### Q:
Not entirely SwiftUI exclusive question, but worth a try:
Xcode 13 release notes list as "known issue": "Swift Concurrency requires a deployment target of macOS 12, iOS 15, tvOS 15, and watchOS 8 or newer. (70738378)
This suggests that concurrency might be backwards deployed? This seems too good to be true because I'd would need runtime support, but perhaps you guys can shed some light on this?

### A:
For now you should assume that Swift concurrency cannot be back-deployed, however the team understands that this is a popular request and is investigating.
The fun part is that Swift is open source, and so you can visit https://forums.swift.org to peek in on the active development process for Swift concurrency, and they will likely discuss this topic more there as well.

---

### Q:
Is there a way to change the background colour of a list? Last year this wasn’t possible

### A:
Currently it’s only possible to change background color of list rows, not the List itself.

Thanks @Natalia (Apple) , is this intended, or something that might change in the future? If so, what is the best way to change the background colour currently? I’d like to use system materials specifically

Unfortunately, it’s not possible to use system materials with List at the moment, please file a feedback and we will take a look at it. In the mean time, you could try using a ScrollView instead of a List.

---

### Q:
Refreshable doesn’t work with scroll view. Is it a bug or desired behaviour?

### A:
Currently refreshable only supports List. Please file a feedback request if you have other use-cases you’d like to see supported.

---

### Q:
How would one go about adding the .searchable modifier to a PDFView?

### A:
On iOS, the searchable modifier works with a navigation view to render its search field. On macOS, it works with a navigation view or the root view of your scene. If you combine a `PDFView` with a navigation view, things should hopefully work as you expect. If not, please do file a feedback with some more details on what you would like to achieve.

---

### Q:
Is `.searchable` for local data only, or can it be used to query services?

### A:
Searchable specifies that the view supports search. You can implement that search however works best for your app.

For example, you could kick off a query using the bound search term, then update the results when your query completes.

---

### Q:
Are you able to programmatically change focus of text fields natively in SwiftUI this year? For example, having the a button at the bottom of the keyboard say “next” and focus into the next text field?

### A:
Posting this back here in case anyone present does have a moment to answer, but if not, there’s a focus and accessibility specific office hours later this week. If we’re not able to get to this during this block, definitely check back then!

Indeed, I would take a look at the new FocusState APIs!

https://developer.apple.com/documentation/swiftui/focusstate/

---

### Q:
Is there an equivalent API similar to UISheetPresentationController for SwiftUI?

### A:
Sorry. There is not a SwiftUI equivalent at this time.

- Is that something that would be useful to file feedback for?

Certainly! Especially if you have a specific use case around when you need it or whether you need variable height. Thanks!

---

### Q:
Hi!  intro? I’m a hobbyist who is getting better an programming mostly because SwiftUI is so productive!
Can you talk about ways to have existing SwiftUI code inherit the newer features so I could support both iOS 14 and 15 with one codebase?

### A:
Most new features do not back-deploy to earlier OS versions. You can use e.g.
if #available(iOS 15, *) {
 to check for whether a feature can be used.
That said, some functionality is able to back-deploy. For example, the new ability to pass bindings to collections into List and ForEach, and get back a binding to each element, e.g.
ForEach($elements) { $element in ...
is able to back-deploy to any earlier release supported by SwiftUI.

- I thought Matt said that - So the new feature can actually work in older code?

Correct

---

### Q:
Can .importsFromDevices (i.e. continuity camera) work as a source for AsyncImage?

### A:
No, continuity camera will callback your importsItemProviders with an item provider that will give the full image data and not a URL.
But if you have a use case where there could be some better integration between the two, please file a feedback

---

### Q:
Is there a way to animate text font size changes? Currently in iOS14 a view can smoothly animate between two sizes or colored backgrounds, but fonts will just jump from the before animation size to the after size with no interpolation in between.

### A:
This would be a great feedback to file, so that we can investigate!

If you’re interested in a workaround, the Fruta sample code project has an AnimatableFontModifier that uses an explicit font size as its animatable data. This is used for the ingredient cards in the main smoothie detail view. This works for Fruta because the use-case is limited and the text using this modifier is for primarily for graphical purposes.
https://developer.apple.com/documentation/swiftui/fruta_building_a_feature-rich_app_with_swiftui

---

### Q:
Will Xcode 13 run on Big Sur 11.3

### A:
Xcode 13 requires macOS 11.3 or later. You can find the full release notes here: https://developer.apple.com/documentation/xcode-release-notes/xcode-13-beta-release-notes

---

### Q:
Does AsyncImage support caching, and will there be an API to customize that cache?

### A:
AsyncImage uses the shared URLSession , and so uses the shared URLCache. There’s currently no support for customizing the cache.

If that’s something you’d like support for though, feel free to file feedback with that request

---

### Q:
Is there a way to make refreshable work with LazyVGrid or do we have to adapt List as a Grid layout?

### A:
Refreshable is currently only supported by List.

---

### Q:
With a document-based app using a DocumentGroup scene, is there any way to present a choice of templates when opening the app without an open document?

### A:
I’m assuming you mean something similar to the theme chooser you get in Keynote or Pages? This is not something that we have an API for at the moment, but we’d love a feedback for this functionality.

---

### Q:
Any prospects for AttributedString support in TextEditor?

### A:
While we can’t comment on any future plans, please do log a request through the feedback assistant that this is a desired feature so that we can gauge developer interest!

---

### Q:
What is the proper way to dismiss a .fullscreenCover when it is being presented based off an item: setting the item to nil or dismissing using the presentationMode?

### A:
That really depends on what is doing the dismissing. They both have the same effect in setting the item binding back to nil. It is more about where you are driving the dismissal state from. If you're dismissing from within the sheet's content, then using the presentation mode will be more flexible because that will work no matter what is controlling the presentation.

There is also a new environment property introduced this year that can accomplish this as well, which is dismiss. https://developer.apple.com/documentation/swiftui/environmentvalues/dismiss/

---

### Q:
is the refreshable property the only SwiftUI property that supports async code?

### A:
The task modifier also provides support for async code out of the box! Generally, we only make user provided closures async if we can provide some additional utility to you by doing so, such as canceling a task when the attached view’s lifetime ends, or finishing the refresh animation. If you want to dispatch to async code in other places, you can use an async block!  

---
	
## 🗓 Wednesday
---

### Q:
Using `@Environment(\.isSearching)`, how would multiple navigation bar in an app work?

### A:
The isSearching environment property is tied to the searchable modifier that sets it up. If you have the following:
```
NavigationView {
 ContentView()
 DetailView()
}
.searchable(text: $text)
```
Then you could query the isSearching property inside of ContentView or DetailView. If you have the following:
```
NavigationView {
 ContentView()
 DetailView()
  .searchable(text: $text)
}
```
Then you could only query it inside of DetailView. Similarly, if you have the following:
```
NavigationView {
 ContentView()
 MiddleView()
  .searchable(text: $text)
 DetailView()
  .searchable(text: $text)
}
```
Then you could query isSearching in either MiddleView or DetailView and the property would relate to the enclosing searchable modifier.

---

### Q:
With the goal to bring deeper adoption of SwiftUI this year, should we implement more SwiftUI code instead of improve catalyst apps ?

### A:
This really depends on your particular app and use case. It would be a great question to take to the labs!

---

### Q:
Does using more SF Symbols have an impact on total app size? Or they all are stored in the OS?

### A:
These are part of the OS, so you can feel free to go wild with all the symbols you want with no impact to app size

---

### Q:
When using the WatchKit way to get text input, do we still get the text input improvements from SwiftUI? E.g. remembering the user choice of scribble vs. voice input

### A:
If don't pass any suggestions to the WatchKit API, then yes, you get all of the new behavior.

---

### Q:
does the modifier of importItemProviders work with other commands, or other stuff to import things in the app ?

### A:
It works with any macOS system service that vends data. So if you had a service or shortcut that didn’t take input, but produced output — your app’s importItemProviders could consume that data when the user invokes that service

---

### Q:
The new `detents` for sheets in UIKit, to allow them to sit at different heights, looks amazing! Unfortunately there doesn't seem to be an equivalent in SwiftUI – is there any plan to bring it across?

### A:
This is something we know folks would appreciate. Enhancement request Feedback with particularly use case would really help us.

We’re particularly interested in use cases around variable heights in SwiftUI sheets.

---

### Q:
Can the new `.refreshable` API be used with custom refresh controls / spinners?

### A:
Take a look at the EnvironmentValues.refresh property. The refreshable modifier sets this property up with closure provided to the modifier. You can query this property ( @Environment(\.refresh) private var refresh ) to hook up to your own UI

---

### Q:
Can we use the new buttons with non-SF single-color graphics?

### A:
Yep, in fact the new buttons can have a label of any view, including shapes and more!

The one thing to be careful of with custom images is that they use template rendering if you want the standard foreground styling within the button. (otherwise they’ll be the exact color of the image’s pixels)  

---

### Q:
Can we customize and put "searchable" search box anywhere? (Without going the old way, adding text views)

### A:
The searchable modifier supports a few customization points with the SearchFieldPlacement type. You can pass a placement into the modifier: .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always)).

---

### Q:
How do we assign a TextField in SwiftUI to gain focus as soon as a View opens?

### A:
You can use the new @FocusState property wrapper and focused() modifier to programmatically control focus in many different ways, including when your UI first appears. For example, you could trigger a specific view to be focused using onAppear or any other event callback.

---

### Q:
How to force SF Symbols not to be automatically filled/unfilled based on the context (as shown in tab bars)? Is there any way to force them to be non-filled?

### A:
You can use .symbolVariant(.fill) to opt in a view or view hierarchy to fill variants, and see the SymbolVariants type for other variants you can use with it.

---

### Q:
Is there a SwiftUI equivalent for preferredStatusBarStyle in iOS 15?

### A:
I’m afraid there is no new API for that at this time. That would be a great enhancement Feedback to help us gauge interest.

If you’ve already filed it, thank you! We know it’s something folks want.

---



