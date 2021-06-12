## SwiftUI Lounge QAs

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

But the gist is: they both have their purposes and are extremely efficient from a performance perspective. So, you should focus on what your intention is and which reads better or offers the functionality you’re trying to utilize as you construct your hierarchies :slightly_smiling_face:

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
A goal for us is that the Color and other API we provide works great on all platforms. So there are often other APIs to help get those effects: for instance GroupBox on iOS will produce the stacking (secondary and so on) system background colors, and on macOS gives you a similar effect but using the more platform appropriate group box (9-part) artwork instead of colors at all. The new .primary, .secondary, .tertiary, .quaternary shape styles are similar in that they also work across platforms and now can correctly give the correct vibrant rendering effect on top of materials :smile:
So while we might not add a Color for everything that UIKit has, we do want to make sure we have coverage for those design concepts. (so specific feedbacks on things that are missing are always appreciated!)

Things like label , secondaryLabel, etc are all achievable using those shape styles above and are even smarter in those material contexts :slightly_smiling_face: , i.e. .foregroundStyle(.secondary)

---

### Q:
If I pass around a single @StateObject through injection from View A to Subview B to Subview C, when the data updates, will all 3 views get invalidated and redrawn? What if only View A and C need to use the data, and view B is only a middleman?

### A:
Only views that read properties of the object should update, but do note that if a view reads any property it will be invalidated on objectWillChange, even if the particular property begin read did not change.

---

### Q:
I'm trying to update a Text view based on some state (eg. from a text field). The text is inside a scroll view, and I am using `ScrollViewReader` to scroll to the end whenever the text changes. For some reason, `scrollTo` doesn't work until I manually start scrolling — after that it works fine :thinking_face:
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
Howdy! Please file feedback with this sample code, this looks like an issue the team should take a look at. Additionally, you should take a look at the new TimelineView and replace your use of Timer here. It’s not recommended to declare new objects in your view’s initializer without a @StateObject or @ObservedObject property wrapper, if you must use a Timer, store it inside an ObservableObject that you can refer to as a StateObject, or another similar technique. (edited)

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

I don’t think trying to switch between observed object and state object buys you much here, since changing the owner of the object with availability checks would be awkward. (edited) 

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
That is OK! Your coordinator will have been created before any views are — so in makeUIView you can give the coordinator a reference to that view (edited) 

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
I :heart:  that proposal! I can’t comment on implementation details, but generally AnyView erases more information than an existential, so the existential would still have the edge.

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
I’m afraid not currently. :pensive:  That would be a great enhancement request Feedback!

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
:warning: Beware: You must ensure you will not cause a continuous layout loop here, if your layout responds to height changing in a way that causes the GeometryReader to lay out again and cause height to get updated, you can get into a loop!

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

### A:

---

