# arkit-realitykit-usdz-lounge QAs
#### by [FeeTiki](https://twitter.com/FeeTiki)
---

> ####  Hello! I am pretty new to Reality Composer. I would like to know how (if it is possible) to add textures to custom USD objects.

Reality Converter makes it easy to convert, view, and customize USDZ 3D objects on Mac. For more information, visit <http://developer.apple.com/augmented-reality/tools/|developer.apple.com/augmented-reality/tools/> 
Thanks! 
I am looking forward to creating AR experiences using it. 

Thank you very much and keep up the good work! I really appreciate the opportunity to connect with Apple engineers. 
Thanks, Cristian-Mihai. We love connecting with developers from around the world :relaxed:

Also, congratulations on winning the Swift Student Challenge this year :tada: 
Is Reality Composer Available for the Mac? 
RComposer on macOS is part of XCode install 
Yes, check out the link above. 
<@U03JRP87THN> Any hints what’s the best way to use STL objects? I am trying to use Blender, but that is … another steep learning curve 
I use #b3d and avoid exporting to .usd because the upAxis of Blender and Apple are incompatible. Export to .fbx or .glb instead and use RealiytConverter (link above) to convert these to proper Apple compatible .usdz 

--- 
> ####  The recent update of XCode made scenes in RealityComposer look much darker. Is this caused by a change in RealityKit?

Hi! We are aware of a bug in macOS Ventura/iOS 16 that is causing the lighting to appear darker. Please feel free to file a bug report on Feedback Assistant about this. 
If you are already aware of this - will it get a higher prio if non-Apple developers also complain? 
Same problem with &lt;model&gt; on iPadOS16beta 
I don’t think the priority would change if we get more reports since it is already a high priority issue that’s been assigned to an engineer to investigate. 

--- 
> ####  Trying to understand how this works via Slack..., should we be able to see what everyone else is posting, what the questions are from others? Or, do you select certain questions, craft a response, then post both? Thanks.

We select certain questions, craft a response, then post both :slightly_smiling_face: 
Thanks very much! 

--- 
> ####  Am trying to use LiDAR scanner to create a 3d model from capturing an object. But couldn't get enough resources for that. Any references/resources please?

For creating 3D models from images captured on device, this should be a helpful resource to get more inspiration and help: <https://developer.apple.com/videos/play/wwdc2022/10128/> 
For Object Capture specific questions, there will be a Q&amp;A tomorrow from 3:00 - 5:00 pm that you can join! 
Apologies, I meant later today at 3pm! 

--- 
> ####  Is there a way of exporting a Reality Composer scene to a .usdz, rather than a .reality or .rcproject?  If not, what are your suggested ways of leveraging Reality Composer for building animations but sharing to other devices/platforms so they can see those animations baked into the 3D model?

Yes, on macOS, you can open Reality Composer, Settings, Enable USDZ export 
Oh, cool!  I did not know that.  Thank you! 
Same with the iPad Version 
this export feature has been broken for years on RC for scenes of even moderate complexity. 
Have you filed a bug report on Feedback Assistant about this? 
yes, over a year ago. still broken 
can you share the Feedback ID? I can check on the status 
My experience is: don’t use 8k textures and make sure all imported and placed USDZs use exclusive texture file names (folder numbering). This can be achieved by preparing ALL of them in a single export session of RealityConverter (or do lots of manual .usda editing) 
FA id: FB9622407 
none of my FA requests have been resolved for RK/RC, btw, that I am aware of. 
Same trouble on my reports 
<@U03J2DUEV0X> I don’t see any updates on this one unfortunately :disappointed: 
I reported, what I consider a critical RK bug over 4 months ago, no resolution. Forum ref title: iOS 15 RealityKit AnchorEntity possible bug 
and I have several more...unfortunately all stuck with no resolution. 
FB9679173 should be resolved in iOS 16 beta 1 
can you not filter out my lounge request about why RC has not advanced in almost 2 years? stuck at version 1.5 as of xcode 14 Beta. I'm building a product with your framework, so this is a healthy conversation. 
let me see, but we don’t really have much to share regarding RC. We’re aware that it hasn’t been updated in a while could benefit from more features, but don’t have anything to announce right now. but we can start another thread about it 
thank you 

--- 
> ####  Are there any plans (or is there any way?) to bring post-process effects and lights into Reality Composer?  I'm making a short animated musical film in AR. I love how RC does so much automatically (spatial audio, object occlusion...). I just wish it was possible to amp up the cinematic-ness a little with effects.

Post processing effects are not supported in RC right now, only in a RealityKit app. However, feel free to file a feature request on Feedback Assistant about this. 
Ok, thank you! 

--- 
> ####  The LookToCamera Action works different on ARQL than while testing in RealityComposer. Will this be fixed with XCode14?

Please file a <https://developer.apple.com/bug-reporting/|bug report for this>. Any additional information you can provide, such as a video reproducing the issue would be hugely helpful. 
Ignored for over a year 
Could you provide the Feedback ID? 
Cannot find it in <http://Feedback.app|Feedback.app>, must have used user support channel instead - my bad.
If RC update does not fix this, I’ll add a feedback - finally. 

--- 
> ####  Are there guidelines or best practices for exporting a RealityKit scene to a USDZ? Is this possible? I’ve seen just a little about the ModelIO framework. Is this the tool we should be using?

I don’t think we have any guidelines about this, since exporting/saving a scene is not supported by the current APIs. ModelIO seems like a reasonable solution to me, but you might also want to file a feature request for this on Feedback Assistant. 

--- 
> ####  Hello there, I am someone who is still fairly novice with Reality / AR Kit. And I want to ask what is the best way to implement Multiuser AR experiences. I’ve been thinking on creating an AR app that would use this feature to allow multiple users to view a single AR view (e.g., multiple users seeing the same rendered model from their own perspectives).

Not the expert here, I believe that a “Location Anchor” is what you are interested in. I don’t know how you would set one up without getting into coding though. I believe one of the videos from WWDC last year addressed this? 
Multiuser AR experiences can be created using the `SynchronizationComponent`, found here: <https://developer.apple.com/documentation/realitykit/synchronizationcomponent>
This is a good tutorial (along with sample code) on building collaborative AR sessions between devices: <https://developer.apple.com/documentation/arkit/creating_a_collaborative_session> 
Also not an expert here, but I'm looking into that also. If you're comfortable with Unity, Niantic (Pokemon Go)  just released a platform and some demo projects to do multi user AR. It's called Lightship. 
<@U03JRQ5LY2C>, here’s the session from last year that I mentioned. It might help to get you started… <https://developer.apple.com/videos/play/wwdc2020/10611/> 
Are there any examples using SwiftUI? All of the code seems to be using Storyboards, though I assume they can easily be transferred over into a SwiftUI view using either a UIViewControllerRepresentable; or generally converting the general lifecycle of a multiuser AR app to fit SwiftUI standards. 
The view that contains the `ARView` will still need to be a UIKit view but that can easily be bridged to other SwiftUI views using a `UIViewRepresentable`: <https://developer.apple.com/documentation/swiftui/uiviewrepresentable>
Most of the AR collaboration code in the sample here is just Swift code that can easily be abstracted out and used in your app: <https://developer.apple.com/documentation/arkit/creating_a_collaborative_session> 

--- 
> ####  In the keynote, there's a mention about Background API in Metal. Please share documentation/resources link

Are you referring to
<https://developer.apple.com/documentation/metal/resource_loading> 
Yes, Thanks 

--- 
> ####  iOS 15.4 includes the builtInLiDARDepthCamera type in AVFoundation.  Is there any advantage in implementing this camera type when doing Object Capture for better depth calculation, or does that not change the outcome of the rendered 3D model?

Capturing images with LiDAR devices will give you automatic scale estimation and gravity vector information on your final usdz output 
Thank you, <@U03HHPAHQ3C>.  Was this also the case prior to iOS 15.4?  I recall the Capture Sample project from WWDC 2021 already leveraged depth data, but not sure if that depth data was already using LiDAR? 
Hi Brandon, yes we already supported depth in last years version of object capture. It does not have to come from LiDAR. There are different ways to capture depth on Apple devices. Please take a look at our sample code for the recommended way how to capture high quality RGB images with depth <https://developer.apple.com/documentation/realitykit/taking_pictures_for_3d_object_capture> 

--- 
> ####  Is there a method to implement scans from RoomPlan with Reality Composer? Thank you!

Hi, can you clarify what integration you are looking for? 

--- 
> ####  What are some ideal non-product examples of good USDZs

There are great USDZ examples on <https://developer.apple.com/augmented-reality/quick-look/>
For example you have the Lunar Rover from _For All Mankind_ 
Scientific stuff! 
We've also added new documentation to help you generate better USD assets here: <https://developer.apple.com/documentation/realitykit/creating-usd-files-for-apple-devices> 

--- 
> ####  Is there a way to access system instances for a scene or must system updates (e.g., change the culling distance of a system) always route through a component?

Hey there, thanks for your question.

Generally Systems are designed to operate on Entities (within Scenes) and their Components. Each System can be updated against multiple Scenes (and the Scene’s entities).

If you have state that you want to be represented with a System, one method to do that is to have a root entity that holds a “System component”.

There’s more information on System’s in last years WWDC session and on the developer documentation website:

<https://developer.apple.com/videos/play/wwdc2021/10074/>
<https://developer.apple.com/documentation/realitykit/system/update(context:)-69f86> 
Ok, that' what I thought, but wanted to make sure I didn't miss anything. Thanks! 

--- 
> ####  When do you think we will see new versions of Reality Composer and Reality Converter apps? I'm a college professor - Graduate Industrial Design, and use these as an intro to AR tools. Better, more capable versions might be nice? Thanks.

Unfortunately, we don’t discuss our future plans. However, we are aware that our tools haven’t been updated in a few years and could use some new features. Could you share what features you are looking for us to add? 
FA id: FB9570859 
It would be awesome to see features that are announced in Reality Kit be compatible with Reality Composer. Like videos, video textures, post processing effects. 
Love RC and can't wait to see it updated. 
Cannot apply properties to group object
Cannot multi-select behaviors to delete
Cannot copy multi-selected behaviors
Need an object navigator to select scene objects to modify
Need Opacity/Texture/Materials for objects/groups 
I would love to see Meshes or Objects that have Emissive lighting.  Or in other words objects that would glow and be emissive similar to what we see in Unity and Unreal. 
I could keep going with features, but need to be mindful that RC is not in the league of Maya, for example. 
also Animation timeline, minimal 
Oh yeah, object navigator and animation timeline would be incredible. 
I would also love to see a visual or graphical shader editor similar to Shader Graph from Unity.   It does not have to be really complex, even a basic visual editor for RealityKit / Reality Composer shaders would be awesome! 
<@U03JELU9E5P> use emissive texture with black as diffuseColor to achive this. It would glow (no overwhites) but can change the look a lot 
I’d really, really like to see material importing and placement options, so that we can at least apply a simple texture to a simple object in Reality Composer, rather than having to dive into a more complex 3D app. Right now, we can only change the color and the material type. (Unless I’ve missed something? 

--- 
> ####  We are seeing some memory leaks when adding ModelEntities to an anchor, pausing the ARSession and starting it again and adding ModelEntities again....We see memory growing in the re::SyncObject section.  Does anyone have experience troubleshooting memory leaks that have happened in a similar way?

Hey thanks for the question. I’d recommend this year’s WWDC Xcode session for what’s new in debugging - (<https://developer.apple.com/wwdc22/110427>). And there have been many other excellent sessions over the years on debugging.

That said if you believe it may be RealityKit or another system framework responsible for leaking the entities we’d ask you to file a Feedback Item on <http://feedbackassistant.apple.com> if you haven’t done so already. 

--- 
> ####  Any plans for instant AR tracking on devices without LiDAR? This could be helpful for translation apps and other apps that overlay 2D  text/images on 3D landmarks.

You might want to ask this to the ARKit team, but I’m not aware of any plans. 
A feedback item would be good though! 

--- 
> ####  Is there a way to localize against a scanned room from the Room Plan API (via ARKit) so that it could be used for example to setup a game in your room and share that with other people?

No there is no re-localization in RoomPlan. But we expose the ARSession so you could fallback to ARKit for re-localization 
Gotcha, thanks! I think this would be a nice addition though. 

--- 
> ####  Is there a suggested manner of writing ARKit/RealityKit experiences to a video file?  I'm current using RealityKit 2's post-processing to convert the source `MTLTexture` to a `CVPixelBuffer`, and writing that to an `AVAssetWriter`, but this occasionally ends up leading to dropped frames or random flickers in the video.

Thank you for your question!

We don’t currently have a recommend method for doing this and as such would love to see a feedback item explaining what you need and a use case explaining it. That would be wonderful.

That said your method should in theory work and we’d also love to see feedback item describing the issues you’re seeing.

<https://developer.apple.com/bug-reporting/> 

--- 
> ####  Is there a way to use video textures in Reality Composer?

Video textures are currently not supported through Reality Composer UI. However, if your .rcproj is part of an Xcode project, you can use the RealityKit VideoMaterial api to change the material of your object in the scene at runtime.

<https://developer.apple.com/documentation/realitykit/videomaterial> 
For short flipbooks, I prepare several instances of the same mesh with separate textures (one per frame) and either animate their .opacity in USD or show/hide them in RComposer 

--- 
> ####  Is there currently a built-in way or example of a way transform a RoomCapture from RoomPlan into a ModelEntity or other type of RealityKit entity? Instead of only the exported USDZ file?

I don’t believe there is a built in way, but loading a USDZ into a RealityKit scene as a ModelEntity is very simple 
Gotcha. What I would love to do is mark edges with measurements and such. So I think I would need to build up a ModelEntity piece by piece with the RoomCaptureData to do that 

--- 
> ####  Hi there! I noticed the new beta class "ImageRenderer" for SwiftUI, allowing SwiftUI views to be rendered into a static image and be used as a texture in ARKit.  Will there be an interactive version of displaying SwiftUI views in ARKit?   I am currently achieving the same effect using UIHostingViewController, but it feels hacky and creates a GLES2/Metal Rendering Issue in Simulator currently.  Thanks!

Hey! Thanks for your question. We don’t discuss future plans, but gathering developer feedback is important to us so we’d ask you to post your request to <https://developer.apple.com/bug-reporting/> 
Okay thanks! I’ll take that to mean that no such functionality currently exists at least? 
Definitely file a Feedback item with us - we’d love to hear your use cases for any new features. 

--- 
> ####  In the State of the Union, there is reference to `ScanKit` alongside the mention of `RoomPlan`.  Is `ScanKit` a SDK, or if that the same thing as `RoomPlan`?

RoomPlan is the name of the SDK. You’ll want to refer to those APIs as RoomPlan instead of ScanKit. 

--- 
> ####  At last years WWDC 2021 RealityKit 2.0 got new changes to make programming with Entity Component System (ECS) easier and simpler!  The current RealityKit ECS code seems too cumbersome and hard to program.   Will ease of programming with ECS be a focus in the future?

Hey! Thank you. While we don’t discuss specific future plans, we always want to make RealityKit as easy to use for everyone as we can.

We’d ask you to post your issues and/or suggestions to <https://developer.apple.com/bug-reporting/>

I’d love to find out more about what you find too cumbersome. Thanks! 

--- 
> ####  Collaboration frameworks for AR are important. Is Apple considering features related to remote participation in AR experiences? Unity has this capability to some extent.

While we don't discuss future plans, we always hope to gather this sort of feedback during WWDC. Thanks for taking the time to share :pray: 
We do support Collaborative sessions over the same network, more details and sample code can be found here: <https://developer.apple.com/documentation/arkit/creating_a_collaborative_session>
Is this what you were looking for ? 

--- 
> ####  Hi, I am trying to make a Battle Royal in Augmented Reality, how can I make a storm/game bounds that is visible from far away and is occluded by buildings

There are challenges using ARKit outdoors, you should sign up for an ARKit lab to get some feedback from them 
ok, thank you 

--- 
> ####  This question may be better suited for tomorrow's #object-and-room-capture-lounge, but is the output `CapturedRoom` type able to be modified prior to export to USDZ?  For example, could I remove all `[.objects]` types, and leave just walls/doors, or change the texture of a surface?

Yes, please ask this during the object capture lounge tomorrow. But you should be able to modify after export and re-render 
I had this same sort of question. From my look at the docs, you could possibly create a RealityKit Entity using the RoomCaptureData.

For removing elements, it looks like you should be able to remove array elements within RoomCaptureData and then write that to usdz 
Yes, all those things should technically be possible. You would need to use the `RoomCaptureSession` API and subscribe to a delegate to get those updates which contain the Surfaces and Objects. You can then process that data and render it as per your liking 
Thanks very much!  Appreciate the replies!  :slightly_smiling_face: 

--- 
> ####  I've noticed that when occlusion is enabled on Lidar devices, far away objects are automatically being clipped after a certain distance like 10m or so (even if there is no physically occluding them). I've tried to adjust the far parameters of the PerspectiveCameraComponent – <https://developer.apple.com/documentation/realitykit/perspectivecameracomponent/far|https://developer.apple.com/documentation/realitykit/perspectivecameracomponent/far> But unfortunately that didn't help. Only disabling occlusion removes the clipping. Is there a workaround for this behavior?

This should be fixed in iOS 16 
~I believe this is a known issue though~ 
Will check again, but good to know it's on the radar. No available workaround for now then I suppose? 
Ahh just updated 
okay nice will check! 
yeah i found the bug report :slightly_smiling_face: 
Could you also have a look into this: <https://developer.apple.com/forums/thread/682215>
FB9517992 
I just checked and it's still happening on iOS 16 Beta 1 
yeah, that one hasn’t been fixed yet 
Alright, thanks! 

--- 
> ####  I need SwiftUI Views in my RK experience...please and ASAP.

Hi! Can you explain a little bit more what you’re trying to do?

If you have a use-case in mind for a new feature you’re definitely also welcome to file a Feedback item with us via <https://developer.apple.com/bug-reporting/> 
will reality kit work with swift ui views ? <@U03H3628BL7> 
You can host RealityKit content inside SwiftUI views with UIViewRepresentable (<https://developer.apple.com/documentation/swiftui/uiviewrepresentable>) 
If you’re asking if you can use SwiftUI content within RealityKit - there is no direct support for that at present and we’d ask you to file a feedback item explaining your use-case for that feature. 
I want to inject SwiftUI charts, for example into my RK scene with live updates via Observables. this will be very useful when there is a need for being surrounded in AR space with analytics about equipment telemetry, etc. 
thanks 
Oh that’s a great idea. Please do file a feedback item. 
we filed a FA for this feature quite some time ago. no reply, will look it up. 

--- 
> ####  I’d love to have SF Symbols renderable in AR! it actually works with RK on macOS by copy and pasting the symbols, but not available in the system font on iOS.

Thanks for the suggestion! You may want to check with the SF Symbols team to confirm this is not possible yet, and also file a feature request on feedback assistant. 
<@U03J7GC4DEC>  had a fb open for almost a year now :grin:
SF Symbols in MeshResource.generateText() - FB7959655 
A bit of a hack solution but you may be able to get this work via drawing the Symbol to a CGImage and passing that image in as a texture. 
that would work for a 2d solution, but ideally it would be a prism 
Ah yeah. Alright thanks for the FB item in that case. 
it sounds like the reason it doesn't automatically work does come down to the sf symbols team… is there a way i could get this ticket to that team? no lounge etc 
it looks like the bug is actually in RealityKit, so it’s on the proper team right now. We’ll discuss this bug internally with the team. 

--- 
> ####  Hi. I’m Pururaj. I have been really interested in RealityKit and ARKit for the past couple of years. Where can I learn more about it? I’m currently into Designing, Writing, Editing, and Management and would love to work on futuristic tech. 

check out this page!
<https://developer.apple.com/augmented-reality/> 
Hi Pururaj and welcome! You're already on the right track—meeting with engineers and developers from around the world :grinning:

To learn more about RealityKit and ARKit, I would recommend starting with our documentation and videos.

Here are a few links to help you get started:

• <https://developer.apple.com/augmented-reality/realitykit/|RealityKit>
• <https://developer.apple.com/augmented-reality/arkit/|More to explore with ARKit 6>
• <https://developer.apple.com/augmented-reality/tools/|AR Creation Tools>
• <https://developer.apple.com/videos/augmented-reality|Videos > Augmented Reality&gt;
You can also always ask questions on <https://developer.apple.com/forums/|Developer Forums> :speech_balloon: 
<https://www.youtube.com/c/realityschool> 

--- 
> ####  Our app uses RealityKit and starts multiple ARSessions throughout a user session. We’re seeing an issue where the memory after the first ARSession never gets freed (which is a pretty large chunk around 200MB). We set everything to nil when the session terminates, but we can see in the memory graph that an ARSession object is still being retained. Subsequent ARSessions leak a few megabytes of memory but at the end of each session there is always only one ARSession being retained in the memory graph. Are you aware of any memory cleanup bugs either in RealityKit or ARKit that could be causing this? Or is there a way to completely free all memory from an ARSession? Here’s a Feedback Assistant number for reference to a sample app 9950277

Hey Wade… looking at the issue right now and I don’t have an immediate answer for you. But it looks like the issue you provided has all the data we need in it. 
Awesome thanks! Let me know if you need anything additional info 
Thank you. 

--- 
> ####  Hello everyone! Many of you know .glb file format (android's scene-viewer) support compression like draco. Any planning update for compress .usdz files?

I would suggest filing an enhancement request on feedback assistant for this 

--- 
> ####  Is there a lab to ask questions about SceneKit this year?

You’ll probably want to ask SceneKit questions on the developer forums if no lab or lounge is available 

--- 
> ####  What is the recommended way to add live stream or capture capabilities with RealityKit? Do we need to build frame capture and video writers with AVFoundation? A higher level API would be a better fit for RealityKit.

I would recommend using ReplayKit or ScreenCaptureKit to record your app screen to stream / share

<https://developer.apple.com/documentation/replaykit>
<https://developer.apple.com/documentation/screencapturekit> 

--- 
> ####  I'd just like to say that RealityKit and ARKit are amazing.  It feels early in the world of AR, but it's amazing how easy it is to bring 3D objects into AR, and I'm excited and grateful, as a developer, to be on this journey.  Thank you for these tools and your hard work!

Thank you for the kind words, Brandon :pray:

We appreciate you taking the time to join our digital lounges and engage with our engineers and designers! 

--- 
> ####  QuickLook is currently very dark (much darker than would be expected). Clients are complaining about washed-out colors, and we need to overcorrect via emission (not ideal, breaks dark rooms). (Easy to test: make a pure white material and display it in QuickLook in a bright room, it will never get white.) Are there plans to fix this?

Great question - and we have good news for you :slightly_smiling_face: 
We are releasing new lighting to ARQL which is brighter with enhanced contrast and improved shape definition to make your assets look even better. Please check tomorrow's session - <https://developer.apple.com/videos/play/wwdc2022/10141> with examples and how to implement it! Thank you! 
Thanks! Especially curious about the "how to implement it" part - as a QuickLook user I'd think there's nothing to implement :slightly_smiling_face: 

--- 
> ####  I'm super excited about the &lt;model HTML tag taking shape. The examples currently list camera and animation control; that seems to be lacking examples for general interactivity / scripted access to the model similar to what three.js scenes allow for. Is this intentional, or are the examples just missing?

Thanks for you interest! This is a great feature question. Are there other features you would like to see? 
Could you share more links to documentation about this? 
<@U03HMDX5C95> <https://github.com/WebKit/explainers/blob/main/model/README.md> 
Thanks <@U03JA5TGENQ>! Are you on Twitter at all? Always good to connect with other AR creators. 
<@U03HL4ZB05S> Definitely!
1. Seeing that USDZ and glTF are both planned to be supported, I'm of course curious about scene graph access. This kind of clashes with the notion that "rendered model data ... is not exposed by the page"
2. Given that our typical usecase is AR, I really wonder how the &lt;model&gt; tag would interact with AR in general and QuickLook in particular. This goes into areas of immersive sessions, dom-overlays, etc. - e.g. when I have styled audio control buttons in HTML, I definitely would want to have those in AR as well. 
<@U03HMDX5C95> sure, I'm @hybridherbst 

--- 
> ####  I have a model that is a .reality file, that opens in ARQL. When the user taps the model, it shrinks to show the same light in a different size. However, it's not very clear to the user that this is a possibility. If they don't tap for a while, ARQL encourages them to "Tap the object to activate" is there a way I can customise this message?

Hi <@U03HMDX5C95> thanks for the question. That is a standard message and unfortunately there’s currently no way to customize the text. Alternatively, you can create your own banner within your asset.
For example, you can check out the first asset on the [gallery page](<https://developer.apple.com/augmented-reality/quick-look/>) 
That's unfortunate. Should I file feedback or is this working as intended? 
Yes, please file a feedback report :pray: 

--- 
> ####  It seems a bit weird that there's currently three different implementations of USD at use across iOS / Mac. Are there plans to consolidate those into one to make testing and verification of assets across platforms easier?  The shared feature subset is pretty small, resulting in less-than-ideal products for clients.

There are different USD renderers across our platforms but each serve a different purpose.  Here is a developer document that explains these different USD renderers and what their feature sets are <https://developer.apple.com/documentation/realitykit/creating-usd-files-for-apple-devices> 
Does Storm work on iOS? 
I'm (painfully!) aware of these differences, that's why I'm asking :slightly_smiling_face: Currently, testing a single USDZ model to actually work in AR across different iOS versions is really hard. Having a somewhat more unified USD renderer (or at least a way to use the same one from Mac or a browser than what's used on QuickLook) would definitely accelerate client adoption of USDZ. 
Gotcha, that's good feedback we can relay to the team on a more unified USD renderer :slightly_smiling_face: 

--- 
> ####  Is it possible to support more than one image anchor in a scene with ARQL? Feedback: FB7818339

This is not supported at this point. The team is still investigating and we'll update the report when there's additional information. 
Thanks. This would be really useful to have. 

--- 
> ####  I'm creating pendant lights for viewing in in ARQL, is it possible to anchor these to the ceiling of a room?

Hi <@U03HMDX5C95>, yes this is something that is supported in AR Quick Look. You can place objects on the ceiling by dragging them there. This can be done using a regular horizontal (or vertical) anchor.
However, there are potential challenges to be aware, the biggest is that ceilings usually lack a lot of feature points, which makes it difficult to detect a proper plane. Using a device with lidar can improve the results that you get. 
Thanks for your reply. I was more wondering about placing this file on the ceiling to begin with, rather than making the user drag the model there themselves. Is this possible? 
Can you describe in more detail how you would want this to work? Eg. after the asset gets loaded, what would the user need to do to see the asset on the ceiling? 
For example ARQL could guide them to point their device to the ceiling to view the model? It's just that for pendant lights, they come from the ceiling, so having them attached to the wall isn't super useful to people and doesn't provide a great experience currently. 
One way to let users know that they can move objects to the ceiling is to include a 3D banner with additional instructions. 
Sure, but that experience is less than ideal I think. It would be great having these land directly on the ceiling. Is it worth me filing feedback? 

--- 
> ####  Using ARQL, how might I add a colour picker to change between colours of a model? For example, the iMac ARQL on <http://apple.com|apple.com> requires users to jump in and out of ARQL to try different colours. Is there a way to have colour pickers in ARQL to try different materials or change different scenes in a .reality file?

You could use Reality Composer's interactions to make an interactive USD where you can tap on different colors to change the model 
Thanks for your reply. Do you have any examples? It's my understanding that I wouldn't be able to do this as a 2D UI/Card above the ARQL experience, but rather would have to have it as part of the 3D AR experience? If that makes sense? 
Yes this needs to be done in 3D. There’s a previous [session](<https://developer.apple.com/videos/play/wwdc2019/609/>) that has some examples 
Thanks for clarifying. It would be really useful if we could provide a 2D/Card UI over the ARQL experience to do this (and it would be great for Apple to be able to show different colours of devices without jumping in and out of ARQL, too). We can already embed html in ARQL, if this could link to different scenes in a .reality file it would be amazing and make the experience so much better for users. I would file feedback for this but feel as if my other feedback requests have gone unnoticed – is there a better way to get ideas noticed? Does a prototype of what we are looking for help? 

--- 
> ####  Hi y’all! Any thoughts about making USD/USDZ files with particle effects? Things on fire/sparking etc?

Hello Matthew!
This is not currently possible to do in a USD, but you should submit the idea to <https://feedbackassistant.apple.com>.
You can however do some particle effects in an app by using RealityKit's CustomShaders. 
Depending on how complex your effect is, you can also bake your particle effects to regular mesh + bones animation :sparkles: 
In many cases you can also create a pretty convincing effect just by scaling/rotating a few planes. <https://prefrontalcortex.de/labs/model-viewer/upload/kravity/|Example link> (no USDZ behind that right now, but you get the idea - this is just two simple meshes for the particles) 
Thanks <@U03JA5TGENQ> nice idea! 

--- 
> ####  Is there a simple way to create a 3D object with a custom image as a texture? Reality Composer only allows a material and a color, and without that, I'll have to dip into a far more complex 3D app. I'd really, really like to use USDZ more in Motion, for pre-viz and prototyping, but without texture editing it's quite limited. Have I missed something? :)

Thanks Iain. Can you explain what kind of 3D object you want to create with a textures? A complex object or a simple plane? 
A relatively simple object. For a recent project I needed to create playing pieces similar to dominos, but each one with a different, complex image on it. I was able to use Motion’s 3D text support to extrude a rounded rectangle, but I’d prefer to do this with USDZ as it’s far more widely supported. 
Motion’s 3D text support is exactly the kind of texture placement and scaling support I’m looking for, by the way. 
There are various third-party DCCs with great USD support that let you create complex 3D object with textures and export as USD. You can then use RealityConverter to convert those to USDZ to import into Motion. 
Understood — though they’re a huge jump up in complexity and it would be great to see this built into RC. Do you have any specific recommendations for a third-party app that’s easy to use for simple objects? 
Another approach: three.js (web render engine) can actually create USDZs on the fly from 3D scenes. A colleague used that recently for USDZ AR files with changeable textures on <https://webweb.jetzt/ar-gallery/ar-gallery.html> 
(users have to leave AR to change the textures but then can even load custom images into it) 
OK, will look into three.js as a potential solution. Please consider adding texture support into RC though — it would be a great way to create simple objects and make simple edits to existing objects. 
Thank you! 
Ah, I think I understood the question a bit differently - I think you're referring to "drag in a generic model and then change the texture in RC" - three.js is most certainly overkill for that :slightly_smiling_face: 
Yes, that’s pretty much it. For example, it would be great to be able to create a simple rectangular plane, then put a custom image on the front face. Simple stuff, and most 3D apps are far, far more complex. Blender in particular is a UI nightmare. 
Also take a look at the <https://developer.apple.com/videos/play/wwdc2022/10141|Explore USD tools and rendering> session tomorrow. You can now change materials properties in RealityConverter! 
Great! That’s going to be a huge help — good to know. 
Another thing that might help for making quick adjustments: the browser-based three.js editor at <https://threejs.org/editor>.
Here's how to make a plane with a custom image and export that as USDZ: 
Just checking — can I import USDZ into Reality Converter, just to change the texture, or should I use some intermediate format? 

--- 
> ####  Reality Composer is great, but our team of 3D asset modelers has found it easier to sculpt characters in Zbrush.   Do ARKit and RealityKit accept models created in Zbrush, or are there intermediate steps best for preparing a model for Apple platforms? (KeyShot, etc.)

Yes, if you can export your assets to FBX, glTF or OBJ, you can convert them to USDZ using Reality Converter, which is compatible with ARKit and RealityKit 
We’ve run into problems with materials and textures when exporting them in various formats to USDZ. It seems that the pipeline from some 3d modeling applications (our use is primarily for product and transportation design) - Maya, Rhino 3d, Solidworks, isn’t really smooth. Exporting files to Keyshot to assign textures seems to help in some cases. In many though the materials and textures don’t really work to our satisfaction. Perhaps newer versions of Reality Converter will be more successful? 

--- 
> ####  Are there tools that can be used to Rig skeletons for USD characters?   I have not found anything that works?

Yes, there are various third-party DCCs that let you create skeletons and _RealityConverter_ lets you convert other file formats with skeletons to USD. 
Autodesk Maya <https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2022/ENU/Maya-USD/files/GUID-9E9D45F2-4DA9-497B-8D69-1573ED6B2BA8-html.html|https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2022/[…]files/GUID-9E9D45F2-4DA9-497B-8D69-1573ED6B2BA8-html.html>

and Blender
<https://docs.blender.org/manual/en/latest/files/import_export/usd.html>

Are some example Digital Content Creation tools that can help you create rigged skeletons for characters exported to USD. 

--- 
> ####  Is Reality Composer appropriate for end-users on macOS? We'd like to export "raw"/unfinished USD from our app then have users use Reality Composer to put something together with multimedia.

Hi Steven, what do you mean by "raw/unfinished" USD and multimedia?

You can assemble different USDZ assets together to build out a larger scene in Reality Composer and add triggers and actions to individual assets within the project 

--- 
> ####  Getting late here, checking out for today - thanks for patiently answering so many hard questions! All the best :)

Thanks for all the great questions, feedback and ideas from everyone and we have 15 more minutes time in this session today! 

--- 
> ####  Is there a way to modify ModelEntities loaded from an .usdz file on a node basis? E.g. show/hide specific nodes?

Yes, if you load the USDZ with "Entity.load(...)" or "Entity.loadAsync(...)" you can traverse the hierarchy and modify the individual entities. 
You’d want to use `Entity.isEnabled`  in this instance to hide/show a node. 
Note that .`loadModel` will flatten the hierarchy whereas `.load` will show all entities 
Ah, so each child-node is then an entity? 
A prim and entity are not 1 to 1 necessarily 
Ok <@U03HHPAHQ3C>, I will look into your suggestion. Thank you! 

--- 
> ####  will there be an async await (concurrency) api to detect when entities are added to an arview? right now i'm working off combine anchors .... it's not super documented

Hey there, we don’t discuss future releases of Apple products. But we’d love to hear your feedback and suggestions. Please file your feedback here to get it into our system. <https://developer.apple.com/bug-reporting/> 

--- 
> ####  What’s the easiest way to add user interactions (pinch to scale, rotation, transform) to an Entity loaded from a local USDZ file in RealityKit?  I’ve added an Entity as a child to an AnchorEntity, added the AnchorEntity to the scene, but how do I easily add gestures?

You can use the `installGestures` function on `ARView.` Keep in mind that the entity will need to conform to `HasCollision`.

<https://developer.apple.com/documentation/realitykit/arview/installgestures(_:for:)> 
Thank you, <@U03HHPAHQ3C>!  Can I follow-up and ask if there is any documentation on how to make an `Entity` loaded from `Entity.loadAsync(...)` conform to `HasCollision` so I can use `installGestures(_:for:)`, as this is where I seem to be struggling to understand. 
You could create your own CollisionComponent with custom mesh and add it to your entity or you could simply call `generateCollisionShapes(recursive: Bool)` on your entity.
 <https://developer.apple.com/documentation/realitykit/entity/generatecollisionshapes(recursive:)> 
Thank you, <@U03HHPAHQ3C>!  Just for posterity, I can call `generateCollisionShapes(recursive: Bool)` on my Entity before adding it as a child to the anchor, and call `installGestures` on `ARView` before adding the entity as a child to the anchor, and that should give me interactivity on the Entity itself? 
You can use `.loadModel/.loadModelAsync`, which will flatten the USDZ into a single entity. Then call `generateCollisionShapes` and pass that entity to the `installGestures` function. This will make your USDZ one single entity that you can interact with. 
Got it!  Thank you so much for the follow-up, <@U03HHPAHQ3C>.  This has been super helpful! 

--- 
> ####  Why are ARGeoAnchors not available in other regions? It should be usable with just gps without the localization imagery.

Hey there, this session is focused on RealityKit and Reality Composer. There’s an ARKit Q&amp;A on Thursday @ 3:00PM and another on Friday @ 9:00AM. I’m sure an ARKit engineer will be able to assist you. 

--- 
> ####  Is there any updated to Reality Composer this year?

No. 
I know you don't discuss future releases. But is Reality Composer something we can rely on to be updated with new features? And will any features we request or file feedback on have to wait until next year, or can reality composer be updated independently, similar to reality converter? 
We don't discuss details about unreleased updates, but one of the things that’s most helpful to us as we continue to build out our suite of augmented reality developer tools is feedback.

Please continue to submit ideas or suggestions in <https://feedbackassistant.apple.com|Feedback Assistant>  :slightly_smiling_face: 

--- 
> ####  What AR features/updates are you most excited for/proud of this year?

Personally, I'm super excited about <https://developer.apple.com/augmented-reality/roomplan/|RoomPlan>. I have friends and family that work in real estate and interior design. This is going to make their lives a lot easier :slightly_smiling_face: 

--- 
> ####  Is there a way to have light sources in AR Quick Look files hosted on the web? For example, a client would like to have lamps in AR Quick Look. It would be awesome if we could use RC to turn off/on light sources. Is there any way to do this?

I don't think that it's possible. But you should submit the idea for supporting virtual lights on <https://feedbackassistant.apple.com>. 

--- 
> ####  Can I render a snapshot of only the virtual content in RealityKit? Something similar like the snapshot functionality in SceneKit?

Yes, you can use `ARView.snapshot(...)`:
<https://developer.apple.com/documentation/realitykit/arview/snapshot(savetohdr:completion:)-66jzu> 
Thanks <@U03J7GN26C8>. But this would include the background (ARFrame), too, or? 
You can change the background of the ARView there: <https://developer.apple.com/documentation/realitykit/arview/environment-swift.struct/background-swift.struct> 
Perfect. Thank you <@U03J7GN26C8>! 

--- 
> ####  I am interested in implementing something similar to what you see in the "Measure" App where a 3D object tap "transforms" it with animation to a 2D view, any directions/hints regarding that?

Hey there, not 100% sure what you’re trying to do here - so maybe a Lab might be a better forum to discuss this…

But based on what you’re describing you can snapshot your RealityKit scene with `ARView.snapshot`  and render it as a texture on another Entity perhaps? 
(we have our last labs tomorrow so you’d have to sign up today) 
totally agree, i'll sign up for the labs. Ty! 

--- 
> ####  Is it possible to instance meshes in RealityKit (similar to SceneKit's clone method)?

If you call <https://developer.apple.com/documentation/realitykit/entity/clone(recursive:)|".clone(...)"> on an Entity, the clone will re-use the same meshes. 
Good to know. I saw the draw call increase when cloning so assumed the mesh wasn't instanced. I guess "instance" in this case means sharing the same geometry memory 

--- 
> ####  Many aspects of USD are open source. Could Reality Composer also be Open-Sourced so that members of the community could work on features?

Hey there, we’d definitely be interested in hearing more about your idea. I’d suggest submitting the suggestion at <https://developer.apple.com/bug-reporting/>. 

--- 
> ####  In SceneKit there were shader modifiers? Is there something similar in RealityKit? We need PBR shaders but have to discard certain fragments.

You can apply <https://developer.apple.com/documentation/realitykit/custommaterial|CustomMaterials> &amp; <https://developer.apple.com/documentation/realitykit/custommaterial/surfaceshader|CustomMaterial.SurfaceShader> to achieve certain cool effects for entities! 
From the metal side you can call `discard_fragment();` 
Thank you <@U03HHPAHQ3C>! 

--- 
> ####  Hi! Reality composer objects on top of each other, such as a vase on a table cast shadow only to the ground plane and not to one another. If baked AO textures aren't an option since the vase may be moved by the user what would you suggest in order to achieve an equally good result to the default grounding shadow given that the quality of shadows is critical for an AR experience? 

We don’t have any materials you can apply to objects to make them participate in the same shadows as ground planes, however, you can enable shadow casting from directional and spot lights via `DirectionalLightComponent.Shadows` and `SpotLightComponent.Shadows`. This may alter the overall lighting of your scene though.

Alternatively, we do have `CustomMaterial`, which allows you to &lt;https://developer.apple.com/documentation/realitykit/modifying-realitykit-rendering-using-custom-materials
|create custom materials via Metal&gt;, but for this use-case may not be able to get you the desired effect.

We’re always looking to improve RealityKit, so would appreciate if you submitted a request for this via <https://feedbackassistant.apple.com/> 
I’ve been implementing the 1st approach and agree on your comment. I’ll definitely submit a request. Thanks! 

--- 
> ####  Is it possible to take a snapshot of only the virtual content and a snapshot of only the real content like in SceneKit?

That’s a good question.

I think you can get some of the way there via the ARKit apis to get the current frame.

You can also toggle the mode of an ARView to switch it to .nonAR view - then use ARView.snapshot() to grab a snapshot of the virtual content. And then switch it back.

However I don’t _believe_ that would give you exactly what you want - I think the ARView snapshot would not necessarily have a transparent background (if that’s what you need).

And even then the performance of this may not be great.

I’d suggest filing a feature request for this with <https://developer.apple.com/bug-reporting/> 
I think a feedback item and an explanation of your use cases would be very welcome. 
instead of changing the mode to nonAR, you could replace the camera feed with a solid colour (green), then take the snapshot 
But I don‘t think the user will be happy with this green background in the time of the snapshot 
You certainly could try setting the Environment background color to something with 100% alpha 
And if it doesn’t work a bug report with just that would certainly be useful. 

--- 
> ####  What is the best way with USDZ content to link to external website or take them to a product landing page?

Hey there - if you have your USDZ content on the web you can check out the AR Quick Look functionality for such things at <https://developer.apple.com/documentation/arkit/adding_an_apple_pay_button_or_a_custom_action_in_ar_quick_look> 
Thx, appreciate the answer.  So it must be wrapped in a web experience.  So this can’t actually exist say within the USDZ if that is sent via imessage?  You would rather have to send them a link to the webpage? 
As far as I know there isn’t currently a way to do such a thing directly from a USDZ sent from iMessage, but I can pass that request along 

--- 
> ####  Is there a way to capture a snapshot of only the virtual content rendered on-screen, but not the background (having the background be transparent) while continuing the on-screen experience for the user where they still see the virtual content and camera feed?  The use case here is that mixing Vision's person segmentation and ARFaceTrackingConfiguration (trying to overlay 3D content on a tracked face while putting fun backgrounds behind the person in the frame) results in the 3D content typically being cut off due to the segmentation mask.  It'd be great to be able to render the 3D content back on top of the composited segmented image.

Hey we just answered a very similar question: <https://wwdc22.slack.com/archives/C03H49QK07P/p1654727671856229>

If you take a look at that question/answer - maybe it help. I don’t think we can necessarily do exactly what you need but it might give you a start. 
Just saw that!  Thanks, <@U03H3628BL7>!!! 

--- 
> ####  Can Reality Composer be made available as a macOS app in the App Store?

While Reality Composer is available only for iOS and iPadOS on the App Store, we'll pass this feedback along. Thanks :pray:

Reality Composer is available on macOS as part of Xcode as a Developer Tool. 
..given it's already in Xcode 
yes it would be relaly cool especially when working with executives who aren't engineers. 
Yes please!! Sucks to have to download 10gb of Xcode just for RC 

--- 
> ####  is there a capture video for ARView the way there is a take snapshot() ? i see there is 4k video being hyped - will this include the ability to let users take video recordings? I'm fuzzy on this.

Hi, there’s no API in RealityKit to capture video. That said there are system level apis to capture screen recordings and I wonder if that would be useful for you: <https://developer.apple.com/documentation/screencapturekit/>

I’d suggest filing a feature request with your use-case. Thanks! (<https://developer.apple.com/bug-reporting/>) 
oh wow thanks! 
ya i've seen screen capturekit but i will file feedback and explore it too 
Thank you! 

--- 
> ####  Hello, for artist/designer only experienced with Reality Composer with no code, is there any suggestion and resources on getting started with RealityKit to make more advanced AR experiences?

Hi! We have a number of WWDC sessions covering RealityKit and Reality Composer which is a great place to start.
• &lt;https://developer.apple.com/videos/play/wwdc19/609/
|Building AR Experiences with Reality Composer&gt;
    ◦ <https://developer.apple.com/documentation/realitykit/creating_a_game_with_reality_composer|Sample Project>
• &lt;https://developer.apple.com/videos/play/wwdc2019/605/
|Building Apps with RealityKit&gt;
• &lt;https://developer.apple.com/videos/play/wwdc2020/10612/
|What’s new in RealityKit&gt;
• &lt;https://developer.apple.com/videos/play/wwdc2021/10074/
|Dive into RealityKit 2&gt;
    ◦ <https://developer.apple.com/documentation/realitykit/building_an_immersive_experience_with_realitykit|Immersive App Sample>
    ◦ <https://developer.apple.com/documentation/realitykit/creating_an_app_for_face-painting_in_ar|Face-Painting Sample>
• &lt;https://developer.apple.com/videos/play/wwdc2021/10075/
|Explore advanced rendering with RealityKit 2&gt;

There’s also a great guide on building a ‘SwiftStrike’ game: &lt;https://developer.apple.com/documentation/realitykit/swiftstrike_creating_a_game_with_realitykit
|SwiftStrike: Creating a Game with RealityKit&gt; 

--- 
> ####  Are world map archives something that can reasonably be  used as an app asset and loaded for all users of the app? In this case, I'm thinking of scanning a room and creating an AR experience that is anchored to the specific areas of room geometry - parts of the architecture and fixtures.

Hey Cameron, I think that’s a question best tacked by the ARKit team directly. They have ARKit lounges tomorrow at 3PM and Friday at 9AM.

I think you’d probably want to talk directly to an ARKit engineer… 
Thank you! 

--- 
> ####  Is there a way to get access to more advanced materials rendering on RealityKit models? I want to "skin" a plane with a UIView, currently I need to fall back to ARKit and SceneKit in order to do this

RealityKit has a `CustomMaterial` API which allows you to create custom Metal-based materials. I’d recommend our <https://developer.apple.com/videos/play/wwdc2021/10075/|Explore advanced rendering with RealityKit 2> WWDC talk to learn more. 
Saw you answer a similar question with that API, am having a look. Thanks so much! 
There is also a great resource on <https://developer.apple.com/metal/Metal-RealityKit-APIs.pdf|Custom Shader API> that gives more details on the APIs available in Metal. 

--- 
> ####  Is there a means of exporting a USDZ file (either from Reality Composer, Cinema 4D, etc., or programmatically), with a video texture already applied?

There’s no support for that in Reality Composer currently. As always a feature request filed on <https://developer.apple.com/bug-reporting/> would be most appreciated.

There’s also no method to export USDZ from RealityKit and again feature requests appreciated. Thank you! 
Thanks, <@U03H3628BL7>!  Much appreciated! 

--- 
> ####  Is it possible to show or hide only a single child node from a model entity dynamically?

Hey we kind of discuss this in another thread…. one second… 
<https://wwdc22.slack.com/archives/C03H49QK07P/p1654725695867159> 
You can certainly load a model and preserve your hierarchy, then use the entity name or another attribute to find an entity… 
then hide/show it with `Entity.isEnabled` 
hope that helps. 
(look at <https://developer.apple.com/documentation/realitykit/entityquery> for finding entities efficiently) 
Thanks, I‘ll try this ;) 

--- 
> ####  Can I place a model in a target, such as a cover of a book or a QR, so that it doesn't move from that position by just using usdz? and how could I achieve this?

You can use Reality Composer to create a scene attached to an image anchor. You can then export the scene to a USDZ or a Reality File. 
<https://developer.apple.com/documentation/realitykit/selecting-an-anchor-for-a-reality-composer-scene> 
Thanks a lot! 

--- 
> ####  Is taking the output MTLTexture from RealityKit 2's `postProcessing` pipeline suitable for writing to an AVAssetWriter, streaming via RTMP, etc?

“Maybe” :slightly_smiling_face:

So you can certainly take MTLTextures and convert them (if they’re configured correctly) into CVPixelBuffers for AVFoundation to consume.

That said it’s really not the intended use case of RealityKits post processing functionality and I wouldn’t be surprised if either it doesn’t work as you’d expect or if we break you in the future.

Sounds like a great feature request though - <https://developer.apple.com/bug-reporting/> 
Thank you, <@U03H3628BL7>!  I have done this and it does work pretty well (albeit, not tried with ARKit 6's 4K resolution yet), but good to know that that's not intended.  Thank you! 
i’d still recommend filing a feedback item. Thank you! 

--- 
> ####  What's the best way to connect with Apple designers to talk about AR? The Design Labs?

Definitely the design labs! 
There’s also a session on designing for AR this year. 
<https://developer.apple.com/wwdc22/10131> 
Thanks, it was a great session! Wish we could select an AR specific design lab 
There are definitely AR designers at the labs so maybe they can redirect you. Sorry I couldn’t help more. 
Hey <@U03HMDX5C95>! When you request a design lab, be specific about your interests — we’ve got designers here at Apple who work on AR technologies and we’ll try to match you up accordingly! 
Awesome will do. Thanks <@U03H3628BL7> <@U03EBH4MA8Y> 

--- 
> ####  From an AR design perspective, what is best for knocking down objects? Say in a game where you knock down blocks, is it better to have the user run the device through the blocks, tap the blocks, or press a button to trigger something to hit the blocks?

One of our designers answered your question:
&gt; It depends which approach is best — each have a set of pros and cons based on what you want out of the experience. It can be compelling to run through AR blocks if you want to emphasize lots of user motion in an experience and the scale of the experience is quite large — good for apps that can take advantage of wide open spaces. Tapping them is more immediate and indirect so if you wanted to destroy a tower quickly or something like that then that would be the way to go — and I could see that being very satisfying to trigger many physics objects to react at once. I think the same would apply to a button press, it’s an indirect way to trigger it if the experience requires rapidly knocking them down.
&gt; 
&gt; Overall I think it’s up to what you want the experience to be, and maintaining internal consistency with other interactions within the app.
 
Swiftstrike and Swiftshot are great example apps that use similar techniques:
<https://developer.apple.com/documentation/arkit/swiftshot_creating_a_game_for_augmented_reality>
<https://developer.apple.com/documentation/realitykit/swiftstrike_creating_a_game_with_realitykit> 

--- 
> ####  Is it possible to control audio media in USDZ (i.e. pause, skip, load new audio file) with a scene / behavior (using Reality Composer or other tool)?  I know it’s possible to trigger the start of audio.

Currently Reality Composer does not support this. This sounds like a great feature request and we would appreciate if you can file feedback through Feedback Assistant.

If you are willing to jump into code…
You can use the <https://developer.apple.com/documentation/realitykit/audioplaybackcontroller|AudioPlaybackController> returned from the <https://developer.apple.com/documentation/realitykit/entity/playaudio(_:)|playAudio> API to play, pause, etc. You can also use <https://developer.apple.com/documentation/realitykit/audiofileresource|AudioFileResource> to to add / replace audio on entities. 

--- 
> ####  How am I able to access attributes (wall dimensions, numbers of objects such as chairs for example) of the USDZ that RoomPlan creates from within Swift? Do I need SceneKit or something else to access and modify that data?

Hey Adam, that’s really a question better suited for the RoomPlan and ARKit Engineers themselves.

There’s a RoomPlan that just started 15 minutes ago (check the Developer app).

And there are ARKit lounges tomorrow at 3pm and Friday at 9am 
Also the documentation is up on the developer website for the RoomPlan framework itself - I’d also suggest starting there: <https://developer.apple.com/documentation/roomplan/> 

--- 
> ####  Regarding optimisations: is there support for level of detail and instancing in RealityKit?

Hey there,

So instancing is mostly abstracted away behind the Entity.clone() method there’s another thread talking about that right now: <https://wwdc22.slack.com/archives/C03H49QK07P/p1654727237961649> 
Level of detail is not currently exposed as API and we’d recommend filing a feature suggestion on that <https://developer.apple.com/bug-reporting/>

That said you _can_ implement Level of Detail yourself (probably using custom Systems and Components) although we understand that may not be ideal. Please file feature suggestions regardless! 
Thank you <@U03H3628BL7>! 

--- 
> ####  Is there a plan to have custom render passes like in SceneKit with SCNTechnique in RealityKit?

While we do not currently support custom render passes, we have support for <https://developer.apple.com/documentation/realitykit/arview/rendercallbacks-swift.struct/postprocess|post process effects>. Please file a feature request through <https://developer.apple.com/bug-reporting/|Feedback Assistant> if your use case requires more customization:pray: 
Thank you <@U03HHPAHQ3C> 

--- 
> ####  Does RealityKit support light sources in objects – for example, if you wanted a light bulb. If so, is there documentation for this?

Hey Emory,

There’s various sorts of lighting in RealityKit - you might want to start here perhaps? <https://developer.apple.com/documentation/realitykit/pointlight> 
(see the Cameras and Lighting section in the docs) 
Oh, that's awesome. But there's currently no way to export these lights as .usdz or .reality files? 
Let me bring in experts on that… I’m not personally sure what we support in file. 
Sounds like we don’t support lighting in Reality Composer unfortunately so I’d suggest filing a feature suggestion <https://developer.apple.com/bug-reporting/> 
I think it is a usdz thing, not Reality Composer. 

--- 
> ####  Not a question, but the RealityKit and Reality Composer teams deserve such huge kudos for giving us non-designers the ability to create 3D and AR experiences that are incredibly powerful.  These are great apps and tools and make me feel very prepared for the future in learning them.

I pasted your comment where the rest of the team can see it. Thank you for the kind words. 

--- 
> ####  In Reality Composer, a force was applied to an object.  Then I wanted to animate it into another scene, starting from the post force location.  Is there a way to apply a new scene using its last known position?  I hacked the position by guessing the ending location and starting the next scene close to that position but it results in a slight motion jitter.

Is this an rcproj that is embedded in an Xcode project? Sounds like you might be able to grab the position of the entity with the force applied to it and then set the new scene’s position as that position? 
Started with a USDZ, and then added behaviors to it in Reality Composer.  No Xcode involved. 
Perhaps there’s a way to get the post force position in Reality Composer?  I have to play the animation to finality, but then there is no way to observe the objects new XYZ coordinates, unless I stop the animation (but thus returning the object to its origin).  I suppose a strong feature would be a way to view the object’s live parameters during animation mode. 
This may be achievable if embedded in Xcode with some code. I recommend signing up for a Reality Composer lab if you would like to explore that further.
But yes, being able to observe live parameters sounds like a great feature in Reality Composer. Please file a feature request using <https://developer.apple.com/bug-reporting/|Feedback Assistant> with your use case :slightly_smiling_face: 

--- 
> ####  is there a way to add gestures to an entire reality composer scene? i can add it to an individual entity it would be cool to let users place the entire scene (otherwise i lose all the reality composer behaviors when i just target the entity)

A way to get the entity gestures working on an entire scene is to use `visualBounds(…)` and create a `CollisionComponent` on the root entity. You can then use &lt;https://developer.apple.com/documentation/realitykit/controlling_entity_collisions_in_realitykit
|CollisionGroup&gt; to make sure it doesn’t interfere with any physics.

If you’re using `ARView.installGestures(…)` you’ll need the entity to conform to `HasCollision` , which may require you to create a new entity type for the root. Quick example:

```// New Entity type which conforms for `HasCollision`
class CollisionAnchorEntity: Entity, HasAnchoring, HasCollision { }

// Transfer scene contents
let collisionAnchor = CollisionAnchorEntity()
collisionAnchor.children.append(contentsOf: originalAnchor.children)
collisionAnchor.anchoring = originalAnchor.anchoring

// Create CollisionComponent for bounds of scene
let sceneBounds = collisionAnchor.visualBounds(recursive: true, relativeTo: collisionAnchor)
let collisionShape = ShapeResource.generateBox(size: sceneBounds.extents)
    .offsetBy(translation: sceneBounds.center)
collisionAnchor.collision = CollisionComponent(shapes: [collisionShape])

// Install gesture on new anchor
arView.installGestures(for: collisionAnchor)``
`
This is also a great question for our RealityKit and Reality Composer lab, which is happening tomorrow @9:00 - 11:00AM. 

--- 
> ####  How does RoomPlan handle multiple floors? Can you extend a scan? What if room edges are not parallel, e.g. a lightly sloped roof?

Hey Alex, that’s probably a question a RoomPlan engineer would be better suited to answer.

There’s a RoomPlan Lounge that started almost an hour ago. Check the Developer app to find it. 

--- 
> ####  Is VisionKit / Data Scanner available in AR?

Using data scanner via VisionKit is possible using ARKit. ARKit provides the captured image on the `ARFrame`. One can inject the ARFrame's captured image into data scanner and obtain information about text.

However, the result will be two-dimensional. If the use-case is to bring the detected text into the AR world in three dimensions one needs to estimate a transform for the 2D text. ARKit does not support this natively but does support custom anchoring. 
When you say custom anchoring, do you mean taking the screen coordinate, doing a hit test, and placing anchor? 

--- 
> ####  Can we get the lidar camera position while doing a mesh in ARKit?

`ARMeshAnchor` transforms are already aligned with the wide camera, which is also what the camera transform is relative to. 
Thanks :slightly_smiling_face: 

--- 
> ####  Is the mesh from an ARSession available through the delegate methods?

Hi Stephen,

Yes, once you turn on scene reconstruction by setting the `sceneReconstruction` property on `ARWorldTrackingConfiguration`. The meshes ares available as `ARMeshAnchor` through the ARKit's anchor delegate methods

Reference APIs:
ARSessionDelegate: <https://developer.apple.com/documentation/arkit/arsessiondelegate>

ARSceneReconstruction:
<https://developer.apple.com/documentation/arkit/arscenereconstruction>

sceneReconstruction:
<https://developer.apple.com/documentation/arkit/arworldtrackingconfiguration/3521376-scenereconstruction> 
Thanks :slightly_smiling_face: 

--- 
> ####  I tried to set 4k capture based on these instructions:  if let hiResCaptureVideoFormat = ARWorldTrackingConfiguration.recommendedVideoFormatForHighResolutionFrameCapturing {     // Assign the video format that supports hi-res capturing. config.videoFormat = hiResCaptureVideoFormat } // Run the session. session.run(config)  But it still seems to be at HD:  device: &lt;AVCaptureFigVideoDevice: 0x15283be00 [Back LiDAR Depth Camera][com.apple.avfoundation.avcapturedevice.built-in_video:9] hiResCaptureVideoFormat: &lt;ARVideoFormat: 0x2823b00a0 imageResolution=(1920, 1440) pixelFormat=(420f) framesPerSecond=(60) captureDeviceType=AVCaptureDeviceTypeBuiltInWideAngleCamera captureDevicePosition=(1) videoFormat.imageResolution: (1920.0, 1440.0)  I am using 11-in iPad Pro at iOS16, and xcode 14 beta

Hi, is this iPad Pro 11-inch 5th generation? Note that this feature is only supported on iPad with M1. 
Model is MHQR3LL/A, with M1 
Thanks, can you please report this to <https://developer.apple.com/bug-reporting/>, we need to take a deeper look. 
Will do, thanks 
I figured it out. The video itself shows ARWorldTrackingConfiguration.recommendedVideoFormatFor4KResolution, but the "code" shows ARWorldTrackingConfiguration.recommendedVideoFormatForHighResolutionFrameCapturing 
Right, `recommendedVideoFormatForHighResolutionFrameCapturing` is used for capturing high resolution still images while the session is running.
For 4K video, you should use `recommendedVideoFormatFor4KResolution` 

--- 
> ####  We are making a game called Follow the White Rabbit. About a magician whose magic suddenly works. What are some tips/best practices to prevent AR objects from shifting? We're finding a bit of drift that's most noticeable with larger virtual objects. :sparkles: :rabbit: :tophat: :sparkles:

Hi Nicole,

We recommend adding an `ARAnchor` in the position where you want to place and object and then associate your node/entity with that anchor.

This should help prevent drifting. 
<@U03HERF817F> Thank you! 

--- 
> ####  Hi, I’ve had some experience with Reality Composer, but for coding, I only know SwiftUI. Is it possible to create an AR App with AR Kit only with SwiftUI？if so, could you share some suggestions or links on getting started?

Hi Haolun,

You can use ARKit inside a SwiftUI app. You can also use RealityKit to build ARKit apps in a declarative way.

Here are the links to resources and sample code to help you get started:

ARKit - <https://developer.apple.com/documentation/arkit>

RealityKit -
<https://developer.apple.com/documentation/realitykit> 
Thanks! 

--- 
> ####  Does adding anchors everywhere force ARKit to keep a good understanding and reduce drift everywhere? If yes, will this affect the tracking quality?

ARKit offers functionality to add custom anchors which is the preferred and recommended way to place content.

<https://developer.apple.com/documentation/arkit/arsession/2865612-addanchor>

Custom anchors are used internally for drift correction. We cannot guarantee absolutely no drift. However, using your own anchors will use the system's best knowledge to correct for any drift. 

--- 
> ####  I am working on an app that uses ARKit to guide the user around an object while semi-automatically capturing images for later (server side) 3D reconstruction. I very much appreciate the ability to control the capture session and the ability to capture high resolution images that you added in iOS 16.  I believe currently we do not have much control over the high resolution image capture? It would be great if we could configure the AVCapturePhotoSettings used for the capture.  For photogrammetric reconstruction purposes it would be amazing if we could for example capture a Pro RAW image during the ARKit session.

Hey Hendrik! We really appreciate the feedback and are glad that you are already starting to put these API changes to good use! At the moment, we do not expose the ability to pass in `AVCapturePhotoSettings` through our API, but this would be a great feature request to submit via <http://developer.apple.com/bug-reporting/> 

--- 
> ####  We want to play with the depth map. Is it possible to get the lidar camera position with the depth map?  We've tried using the wide camera position and it doesn't work, because the wide camera position is not the same as the depth map's camera position.

Hi Stephen,
The depth map surfaced through the Scene Depth API does align with the wide angle camera and should correspond to the camera transform available through the ARFrame.

Here is a sample code that generates a colored point cloud by combining the wide angle camera image and depth map

<https://developer.apple.com/documentation/arkit/environmental_analysis/displaying_a_point_cloud_using_scene_depth>

If you still see some issues, I recommend filing a bug through the feedback assistant at <http://developer.apple.com/bug-reporting/> (edited) 
Thank you :slightly_smiling_face: 

--- 
> ####  Does ARKit track which version of USDZ Is in use?  I’m interested in using tools from multiple providers in my pipeline and I want to verify the format is consistent through workflow.

ARKit itself has no notion of rendered content. Content (USDZ) is commonly handled by the rendering engine on top of ARKit like RealityKit, SceneKit, Metal, etc.

In order to learn more about USDZ and how to efficiently use it we recommend this talk.

<https://developer.apple.com/videos/play/wwdc2022/10129/> 
I'll be sure to check out the session.  Thank you.

Pixar provides USDZ Python and looking at the spec here I see no recent updates.
<https://graphics.pixar.com/usd/release/spec_usdz.html|https://graphics.pixar.com/usd/release/spec_usdz.html>

But I would very much like to learn how to use it efficiently both client and server side 

--- 
> ####  When I read the exif data that ARKit now provide I get:  "SubjectArea": : ( 2013, 1511, 2116, 1270 ) "LensSpecification": ( 4.2, 4.2, 1.6, 1.6 )  What is SubjectArea? Why does LensSpecification has twice  the 4.2 (the focal I think) and twice 1.6 (the aperture I think)?

The subject area is defined as rectangle with center coordinate and its dimensions. In this case, the center is at `2013, 1511`with rectangle dimensions `2116 x 1270`.

For more details, you may refer to Exif standard tags. 

--- 
> ####  Do modifications made to configurableCaptureDeviceForPrimaryCamera while an ARSession is running change the output of captureHighResolutionFrame? What about modifications before running a new ARConfiguration?

No, any modifications to `ARConfiguration`object does not affect a running session. You need to call `run` after modifying configuration for it to be used. 
Awesome. Any reason why it's not an instance property on the `ARConfiguration` itself? Seems like that would more clearly communicate this behavior. Happy to file a feedback if that helps. 
<@U03HWCBGUBT> I went ahead and filed a suggestion feedback: <https://feedbackassistant.apple.com/feedback/10142346|FB10142346> 
Thanks for the feedback. You can change capture device settings such as exposure, white balance etc, that will be reflected in the output of ARSession. However, you cannot change the input/output configurations on capture session. 
<@U03HWCBGUBT> is changing input/output possible before starting the session? 
No, its not possible to change it, ARSession always adds the required inputs and outputs. 
Thanks Arsalan! 

--- 
> ####  Are there resources on how to generate a texture for the mesh generated by ARKit ?

We do not have any resources for this.
You should be able to use the wide angle camera and camera transform to generate texture maps for the meshes but unfortunately we do not have any resources or sample code showing that.

We do have this sample code showing how to generate colored point clouds using the scene depth  API, hope it is of some help.
<https://developer.apple.com/documentation/arkit/environmental_analysis/displaying_a_point_cloud_using_scene_depth> 

--- 
> ####  Any tips for getting started in AR development with 0 coding knowledge? A mentor would also be appreciated!

Hey Ramiro! Regardless of your educational background, anyone can learn how to code if you put in the effort and are passionate about it. There are tons of resources online, many of which have been produced by Apple in the form of documentation, example projects, and WWDC videos, that can help you to learn a programming language, such as Swift. I would suggest doing some tutorials, watching videos, maybe find a highly rated book on iOS programming, etc to learn how to begin building iOS apps. Once you are comfortable with that, then you can start to dive into AR specifically. Finding a good book on linear algebra would be useful if you are going to get into AR and graphics programming, but start with the basics first!

For `ARKit`, we have all sorts of documentation and examples that you can take a look at:

<https://developer.apple.com/documentation/arkit/> 
Apple’s documentation is great.

I also found the site RayWenderlich to be super helpful. They even have a book specifically for AR: <https://www.raywenderlich.com/books/apple-augmented-reality-by-tutorials>
As well as a lot of great entry level tutorials and books. 

--- 
> ####  Do any of the AR frameworks have hand tracking, and the ability to register a pinch between the thumb and pointer finger?

ARKit does not have any hand tracking feature. The Vision framework offers functionality for hand gesture detection.

<https://developer.apple.com/videos/play/wwdc2020/10653/>

You may find the camera's captured images on the `ARFrame` and can inject this into Vision. So by combining multiple frameworks you could achieve something close to the requested feature. 
Awesome Thank you, 

--- 
> ####  In an ARKit game, I’m detecting collisions between the real user and walls that I build out of SCNBoxes. I have a cylinder that follows the device’s pointOfView to accomplish that. I use both physicsWorld didBegin and didEnd contact delegate methods because I need to know both when collisions start and when they end. Most of the time this works fine, however, sometimes the didBegin method runs last, even though I clearly moved away and there are no more collisions so my app still thinks that we’re in a collision state. Any idea why this could happen?  Thanks!

Hi <@U03JXRWDTDG>. In this lounge we are focused on questions to ARKit, it looks like your request is specific to SceneKit. Please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 
Thanks. Indeed, it’s SceneKit inside ARKit.
What I ask can only happen in AR where the actual user moves in the world and interacts with nodes that I build.
I will definitely ask the question in the Developer Forums.
Thanks! 

--- 
> ####  Does triangles vs quads matter for ARKit 

Hey Adrien, I’m not sure of the context of this question, would you mind reformulating it / adding more context and post it again? 

--- 
> ####  Does ARKit give any confidence score for each camera position it estimates during camera tracking? If any camera position is not estimated correctly do you suggest any option to improve it?

Yes, ARKit returns tracking state for every frame update. You can read more about it here:
<https://developer.apple.com/documentation/arkit/managing_session_life_cycle_and_tracking_quality>

It is highly recommended to integrate standard coaching view in your app to guide users when tracking is limited. More details at:
<https://developer.apple.com/documentation/arkit/arcoachingoverlayview> 
Can you explain a little more about the confidence score and what the physical meaning is? How do you define the confidence score? 
You can find details at <https://developer.apple.com/documentation/arkit/managing_session_life_cycle_and_tracking_quality>
Basically, ARKit provides discrete tracking states only. 

--- 
> ####  Is it possible to do body tracking while being in an ARWorldTrackingConfiguration? I believe it isn’t possible but to make sure.

Correct, 3D body tracking is only supported using the `ARBodyTrackingConfiguration`. However, we support the detection of 2D bodies on multiple configurations; the `ARWorldTrackingConfiguration` is one of them.

In order to check which configuration supports this you may use the `supportsFrameSemantics:` function.

<https://developer.apple.com/documentation/arkit/arconfiguration/3089122-supportsframesemantics?language=objc> 
Thanks! I didn’t know that 2D tracking was supported on ARWorldTrackingConfiguration 

--- 
> ####  Is there a way to select wish rear camera to use for ARView? (Wide, ultrawide, panoramic)

Hi Hassan,
ARKit only supports wide camera as the primary camera.
It is not possible use other cameras for rendering. 
Thank you . 
It have be nice to have ultrawide too it gets more content of real world that users can film  
Thanks for the suggestion.
Please file a feature request through the feedback assistant at <http://developer.apple.com/bug-reporting/> 
Is it possible to use the front facing camera with ARKit? 
The face tracking configuration does use the front facing camera
<https://developer.apple.com/documentation/arkit/arfacetrackingconfiguration> 

--- 
> ####  Can I use the MapKit 3d model of a city, and anchor it as a child of an anchor using lidar geotracking? For long distance occlusion and collision purposes?

There is no integration of MapKit into the ARView. If you know the building footprint (i.e. the polygon in lat/lon coordinates) or even exact geometry anchored to a lat/lon coordinate you can transform these coordinates by placing a GeoAnchor at a that location and work with the local coordinates for the purposes of occlusion and collision. 
I wanted to occlude something big like buildings in front of a dinosaur terrorizing downtown 
I think this might work, when the players keep their vision down. 
So what I meant is if you know the four corners of that building you can create four Location Anchors at those lat/lon coordinates. If they are tracked in ARKit you get the local coordinates and can build an occlusion/collision mesh. 
Wow, thank you for the help. I didn't think about pushing it that far with geoanchors  

--- 
> ####  I've been trying to build the Hydra sample, will it always require CMake?

Hi Steven. In this lounge we are focused on questions to ARKit, it looks like your request is specific to USD. As the USD lounges are closed for WWDC, please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  What’s the maximum dimensions RoomPlan support ?

The recommended maximum size of the room is 30 x 30 feet. 
Thank you  

--- 
> ####  One we have a RoomPlan scan, can we use it next time as a anchor so we can always Paint Model in same place ?

RoomPlan is not an ARAnchor in current design. Thanks for suggestion. We will take into consideration. 
Thank you  
<@U03J1MVSDBP> I created a demo where custom ARAnchors are created for RoomPlan objects. The same could be done for surfaces and then saved to a world map: <https://github.com/jmousseau/RoomObjectReplicatorDemo> 
Thank you  

--- 
> ####  Does setting ARKit to use 4K resolution affect the battery longevity ? Does it increase the risk to get the device too hot, even if the fps is limited at 30 fps instead of 60 fps ? Is there a way to get 60 fps at 4K resolution ?

Hey Gaetan! Yes, using 4k resolution may result in more power being consumed. It may also result in thermal mitigation engaging to keep the device from getting too hot, which may impact performance. At the moment, we are only supporting 4k @ 30hz. 

--- 
> ####  Hi, ARSession has the getGeoLocation(forPoint: … method. Is there also a way to obtain the heading relative to north given a directional vector within the scene or for the device (point of view)?

We are not exposing the heading directly. You can create any GeoAnchor in your vicinity and then compare its transform with your camera’s transform. Since GeoAnchors are always aligned to East-Up-South, you can derive any global camera orientation by comparing the camera’s transform to the GeoAnchor transform. 
Gotcha, thank you <@U03J7GC2A2C>!
Do you think this would be worth a feature requests to avoid the additional anchor or is it rather unlikely that this will get exposed? 
Anything you need is important to us :heart:, please file it. 

--- 
> ####  Might there be more example projects showcasing pure Metal with ARKit? SceneKit is cool, but admittedly, I'd love to see more low-level examples.  :) Alternatively, is anyone working on some open source projects showcasing something like this? I think it would be a big win for Apple-platform development to build-up a lot more examples.

Hi Karl,

Thanks for the suggestion.

Here are some existing  sample code that uses Metal with ARKit:
<https://developer.apple.com/documentation/arkit/environmental_analysis/displaying_a_point_cloud_using_scene_depth>

<https://developer.apple.com/documentation/arkit/environmental_analysis/creating_a_fog_effect_using_scene_depth>

<https://developer.apple.com/documentation/arkit/displaying_an_ar_experience_with_metal?language=objc> 
Hello, and thanks! 

--- 
> ####  Is the "new lighting" capability only in AR Quick Look or is it also available in RealityKit and SceneKit renderers?

Hi George. In this lounge we are focused on questions to ARKit, it looks like your request is specific to RealityKit / SceneKit. As those lounges are closed for WWDC, please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  Do any of the AR frameworks accept location or hand position from Apple Watch?

No, ARKit runs standalone on iPhone and iPad devices only and does not take any external inputs. 
<@U03HWCBGUBT> thanks for doing the legwork.  I see the other response regarding Vision and World tracking.  I'll work with that. 

--- 
> ####  I have a strange ARKit+SceneKit rendering bug and wanted to see if any of the engineers ARKit engineers participating here might have an idea as to what might be causing this and how to fix it? I am rendering a semi-transparent object using SceneKit. The material uses the constant lighting model, a texture controls transparency.  If the scene is fairly bright, then the transparent material will initially show less transparent than it should. If the camera gets pointed at something less bright (or the bright part is blocked as in the example video linked below) then the rendering suddenly switches to be more transparent. This switch is permanent, it does not switch back again.  See example video here:  <https://www.dropbox.com/s/8wpo83loxg51o43/ARKit_rendering_bug.mov?dl=0|https://www.dropbox.com/s/8wpo83loxg51o43/ARKit_rendering_bug.mov?dl=0> Any idea what might be causing this?

Hi Hendrik. In this lounge we are focused on questions to ARKit, it looks like your request is specific to SceneKit. Please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 
I think this is actually more of an ARKit issue though. Because the rendering changes based on the camera feed brightness. SceneKit does not know about ARKit’s camera feed.
Also: Are there still SceneKit engineers at Apple? I would be surprised if there were. 
Somehow a switch seems to be flipped that changes SceneKit’s rendering dramatically. But based on my understanding I would think it has to be ARKit that is flipping that switch (intentionally or accidentally) based on the scene brightness. 
Where by ‘scene’ I am referring to the real world surrounding.. 
You can try setting `automaticallyUpdatesLighting`to `false` in `ARSCNView` to disable the behavior. 

--- 
> ####  We can capture session events (namely anchors add/remove) by implementing ARSessionDelegate (not RealityKit), is it possible get similar or part of this events with RealityKit? (To avoid converting a from ARAnchor to AnchorEntity)

RealityKit exposes the `ARSession` through this API

<https://developer.apple.com/documentation/realitykit/arview/session>

You can set the delegate on it to listen to ARKit delegate events 
Thank you  

--- 
> ####  I have an ARKit app that uses SceneKit and PBR. Is there a simple process to migrate ~70K lines of Swift to use RealityKit? I need to resolve the rendering differences between my ARKit app that uses the SceneKit renderer and the renders that come from AR Quick Look's use of the RealityKit renderer.

Hi George. In this lounge we are focused on questions to ARKit, it looks like your request is specific to SceneKit / RealityKit and Swift. I’m not aware of any tool for porting large chunks of swift code. Please use the developer forums or the feedback system to get connected to an engineer from other team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  Is there a talk that goes into any detail about using the new Spatial framework - <https://developer.apple.com/documentation/spatial|https://developer.apple.com/documentation/spatial> - and how it works with ARKit, SceneKit, and/or RealityKit?

There is no dedicated talk about Spatial framework. It provides core functions that can be used with any 2D/3D primitive data. 
Thank you 

--- 
> ####  When using the new 4K resolution in ARKit for a post-production (film/television) workflow, what is the suggested way to take the AR experience and output to a video file?

Hi Brandon,

To capture and replay an ARKit session, see an example here:
<https://developer.apple.com/documentation/arkit/arsession/recording_and_replaying_ar_session_data>

If you want to capture video in your app in order to do post processing later, you could use and configure an AVAssetWriter to capture a video.
<https://developer.apple.com/documentation/avfoundation/avassetwriter> 
Thanks, <@U03K4D9U7GU>!  Just to follow-up on that comment; do you have a suggest way of getting the output of the ARSession into a format that can be written to an AVAssetWriter (I'm imagining this would require a custom Metal processing pipeline to convert the MTLTextures to CVPixelBuffers, as I don't think there's a way of getting CVPixelBuffers out of ARKit directly)? 
We do provide a camera frame with every ARFrame, see: <https://developer.apple.com/documentation/arkit/arframe/2867984-capturedimage> 
Thanks, <@U03K4D9U7GU>!  Just for posterity; the ARFrame's CVPixelBuffer (rather, `capturedImage` property) doesn't include the overlaid AR content, as the user might see through the phone, though, correct?  This is the background video feed only? 
Yes, ARFrame’s `capturedImage` is just the ‘clean slate’, it doesn’t contain any virtual content rendered on top of it. 
Yeah, the output from `ARKit` is just the camera frame without virtual content. If you are doing your own rendering and your metal textures are backed by `IOSurface` s. then you can easily create `CVPixelBuffer` s using the `IOSurface` s and then pass those to `AVFoundation` for recording. 
Got it, thanks, <@U03J7GC2A2C> <@U03H35XE3N3>.  I thought that was the case!  I appreciate your replies! 

--- 
> ####  If I create a USDZ with SCNScene.write(...usdzURL...) will it use the "new lighting" and contrast adjustment in AR Quick Look?

Hi George. In this lounge we are focused on questions to ARKit, it looks like your request is specific to Quick Look and USD. Those lounges are closed for WWDC, so please use the developer forums or the feedback system to get connected to an engineer from other team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  Is there a way to get notified when ARKit relocate itself when it finds out that it has drifted ? From my experience, the tracking status does not change when this happens. Also is there a way to ask ARKit to not try to relocate itself after a drift ?

Hi Gaetan,

We recommend adding ARAnchors and associating your virtual content with ARAnchors. In case there is a drift, the anchor delegate `didUpdateAnchor` would update the anchor such that the virtual content stays in the same location in the real world. 

--- 
> ####  In recent years I read and partially experimented with the latest "graphics" frameworks - but somehow I got lost over a cohesive developer experience when to use which framework (and how to integrate them into a good product). The are amazing "vertical" solutions in these frameworks but I see only few strong stories/app/solutions around them. Does Apple has a "big picture" guide when to use which framework, how to interact between them?

Many of them work together...are there particular corner cases you had? 
Hi Oliver,

We understand that the number of frameworks can be daunting sometimes. However as you alluded to, we try and offer "high level" frameworks to try and meet developers' needs out of the box, for example, being able to use RealityKit for rendering instead of the lower level Metal.

That said, Apple provides several tutorials and code samples to introduce developers into the various frameworks, e.g. <https://developer.apple.com/documentation/realitykit/building_an_immersive_experience_with_realitykit>.

Another great resource are WWDC videos, which go back several years in order to build a solid understanding of a particular framework or technology.
<https://developer.apple.com/videos/all-videos/>

For ARKit specific, see Ryan's great answer here:
<https://wwdc22.slack.com/archives/C03H49QK07P/p1654815037708349?thread_ts=1654815015.825259&amp;cid=C03H49QK07P> 
<@U03K4D9U7GU> thank you, these are fine vertical guides but I’m looking for a more horizontal approach. 
(super specific example, probably needing, camera, vision, realitykit, arkit…):
can we let the user take a picture of a tree and map it as a texture easily onto a pair of glasses frame for AR preview when he is looking into the mirror? 
the solution would probably need a USDZ frame model to be rendered in RealityKit, but can we map a UIImage onto an element in USDZ programatically? 
I'm pretty sure RealityKit has `TextureResource` which can take a `CGImage` (the base decoding class) and goes "up" to a `MetalTexture` 
Knowing the basic data flow helps here because taking a photo means a photo file which has to be decoded first into some kind of pixel buffer 
Then that has to go to the GPU, usually as a texture 

--- 
> ####  Any guidance on how to build a bridge between ARKit and Spatial Audio?  Say you're viewing an object and the audio evolves as you change the object's perspective

We do not have a sample code that uses ARKit together with spatial audio (PHASE). However, this is a great question, can you please send us a request through <https://developer.apple.com/bug-reporting/> 
<@U03HWCBGUBT> yes, will do! thank you 

--- 
> ####  I'm continuing to have issues with the performance of adding interactivity to an entity added via RealityKit (`Entity.loadAsync(named: "MyEntity")`).  - I create a ModelEntity. - I added my async loaded Entity as a child to the ModelEntity. - I add the ModelEntity as a child to the AnchorEntity. - I add the AnchorEntity to the ARView's scenes. - I get the bounds of the entity using `entity.visualBounds(relativeTo: parentEntity)` - I add Collision to the ParentEntity with `parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds.extents).offsetBy(translation: entityBounds.center)])` - I install gestures `.all` on the ARView.  This results in an Entity I can pinch and scale, but no manner to rotate or transform its position.  Am I doing something wrong?

Hi Brandon. In this lounge we are focused on questions to ARKit, it looks like your request is specific to RealityKit. Those lounges are closed for WWDC, so please use the developer forums or the feedback system to get connected to an engineer from that team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  With body motion tracking, can a dev specify the sample rate of the sample(every few ms) and write out that sample in a continues manner. eg a basic motion recorder. Please ignore the question if this is the wrong place to ask

Body tracking runs at 60 Hz at the same cadence of the camera. We cannot compute this faster than this. However, by changing the `ARVideoFormat` you may change this to `30 Hz` or other supported frame rates.

We do not offer a functionality to write the motion capture data to file. However, our data is very well compatible with a format called BVH. By following the topology of the skeleton given by the `ARSkeletonDefinition` and the data coming from an `ARBodyAnchor`one could generate such a file output.

<https://en.wikipedia.org/wiki/Biovision_Hierarchy> 
GOLD! solid gold! thanks for the help 

--- 
> ####  Have there been any changes to the light estimation APIs? For example, is directional light available with a world tracking config?

No, there haven’t been changes to light estimation in ARKit this year. 
Thank you! 

--- 
> ####  Is there any way to protect usdz files so that they cannot be downloaded from the web, but still be seen in ar quick look?

Hi Jose Mariano. In this lounge we are focused on questions to ARKit, it looks like your request is specific to QuickLook/USDz. As those lounges are closed for WWDC, please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  In "Discover ARKit 6" there's a cool demo of setting a point in AR where a picture was taken, and guiding the user there. Is sample code for this available somewhere?

Thanks for your excitement about that app idea. We do not have the sample code, but I recommend going to our ARKit 4 session where we explain how to pick a coordinate in Maps and create a GeoAnchor based on it. For alignment with the real world we have the example with the Ferry Building in SF. We followed that exact workflow with the focus square example. 

--- 
> ####  Hi ! Does adding custom anchors for drift correction is pertinent on a lidar enable device ?

In general we recommend to use/add anchors independent from the device you are using. 

--- 
> ####  Hello USD team, Thanks for the great demo USD and Hydra/Storm demo!  Is it possible to build an app with USD Hydra/Storm - SwiftUI interactions?  Ex: a car configurator that has: - A car as a USD file - USD PhysicsRigidBody joint applied on the door of the car USD file. - SwiftUI button to trigger opening the doors  - Everything rendered in Hydra/Storm. as the demo app

Hi Alexandre,
During this lounge we are focused on questions on ARKit. The USD lounges are already closed for this WWDC. So for those question I encourage you to use the developer forums or the feedback system to get connected to an engineer from those team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 
ok, thanks 

--- 
> ####  I noticed that the built-in Camera app can detect very small QR codes compared to 4K AR. Why is that? Is there a workaround?

Hi Ivan, we don’t have QR code detection in ARKit. However, you can use the Vision APIs to do QR code detection on the captured image. This VisionKit talk and sample code might be of interest to you:
<https://developer.apple.com/videos/play/wwdc2022/10025/>
<https://developer.apple.com/documentation/visionkit/scanning_data_with_the_camera> 

--- 
> ####  I am really struggling to build user interactions in RealityKit that are as “smooth” as AR QuickLook (in terms of a user placing, moving, rotating, or scaling a model).  I’m using “installGestures” on the ARView but it’s nowhere near as smooth as the AR QuickLook experience.  Is there any suggestions of how to get AR QuickLook style integrations?

Hi Brandon. In this lounge we are focused on questions to ARKit, it looks like your request is specific to QuickLook/RealityKit. As those lounges are closed for WWDC, please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  Regarding the new ARKit 6 api that takes a 4k photo of the AR scene, is there a limit to how many times it can be called? Can I take say 30 photos within a second?

You can take the next photo right after the completion handler of your previous `captureHighResolutionFrame` call - or even from within the completion handler. If you try taking a new photo before the previous call completed, you will receive an `highResolutionFrameCaptureInProgress` error in the completion handler. 
Thank you <@U03HWCCTAKT>! Thats good to know. I ask that to see if I can use the same workflow to capture short videos as well if possible. 

--- 
> ####  We'd like to use an object both as a source for a USDZ based on the PhotogrammetrySession and as an ARReferenceObject, so that we can overlay information at the same position on both the real object and the created model.  Is there any guidance on how to align these coordinate systems, e.g. by aligning the point clouds from the photogrammetry session and reference object? Or can we make assumptions on the origin of the resulting USDZ from the PhotogrammetrySession?

Creating a model for ObjectDetection and creating a textured mesh with ObjectCapture are two different use cases with separate workflows, we do not offer a tool to convert from one to another. That sounds like a great use case though, I encourage you to file a feature request.
Feedback Assistant: <https://feedbackassistant.apple.com> 
FB10160265 
:100: 

--- 
> ####  Is there a maximum number of 2D bodies that can be tracked in an ARWorldTrackingConfiguration?

Hi Brandon! ARKit detects one body at a time. If multiple people are in the scene, the most prominent one is returned. 
Thank you, <@U03HWCCTAKT>! 

--- 
> ####  Is it now possible to do AR with the ultra wide angle 0.5  camera?

Unfortunately not. ARKit consumes the UW camera internally for certain processing tasks in a specific configuration.
Though I encourage you to file a feature request.
Feedback Assistant: <https://feedbackassistant.apple.com> 

--- 
> ####  We're planning to integrate an AR distance measuring view into our app. Does ARKit now provide the necessary technology to achieve this, or is RealityKit a better match? Are there any useful docs to look at?

Hi Yurii, ARKit offers several ways to measure distances. You can either evaluate distances from the device to its environment or between ARAnchors.
Please see this documentation to get an overview:
<https://developer.apple.com/documentation/arkit/environmental_analysis>

It looks like your question is also tied to RealityKit, but in this lounge we are focused on questions to ARKit. As RealityKit lounge is closed for WWDC, please use the developer forums or the feedback system to get connected to an engineer from this team:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 
Thank you <@U03HB4VGW30> 

--- 
> ####  Are there any good resources on getting started with estimated object dimensions?  Similar to the measurable app but to do height and width.

Hi Eduardo,
I recommend checking out our documentation of our SceneGeometry API that we presented in ARKit 3.5. A good overview is given in this tech talk: <https://developer.apple.com/videos/play/tech-talks/609>
After getting a geometry that is good enough you still have to solve the task of isolating your object of choice and computing its volume. There would be several ways of doing it. For example cutting everything off above the ground level, or letting the user create a cube objects and then intersect it with the scene geometry, we do not have any code sample for these tasks, though. 
Thanks <@U03J7GC2A2C> Would it be possible to get the dimension of small objects?  Ex. Ball, pillow, cup, etc. 

--- 
> ####  Video feed is always overexposed using ARKit. Trying to enable HDR for ARSession doesn't seem to work. Setting videoHDRAllowed to true on ARWorldTrackingConfiguration does not change video rendering. Also when accessing the AVCaptureDevice with ARWorldTrackingConfiguration.configurableCaptureDeviceForPrimaryCamera, activeFormat.isVideoHDRSupported returns false (on iPhone 12 Pro Max) so I cannot set captureDevice.isVideoHDREnabled to true. Also when using setExposureModeCustom and setting iso to activeFormat.minISO, the image rendered by ARKit has always a way greater exposure than when running an AVCaptureSession. The use case is for using ARKit in a Basketball stadium: the pitch always appears totally white with ARKit so we cannot see any player while with AVCaptureSession (or just the iOS camera app) the pitch and players appear clearly thanks to HDR.

Hi Brian! Setting `videoHDRAllowed` means that HDR will be enabled on the formats supporting it; however this is not the case for all video formats.
In iOS 16, `ARVideoFormat` has a new property `isVideoHDRSupported`. You can filter the list of the configuration’s `supportedVideoFormats` to find one where `videoHDRSupported` is `true`, and set this format as the configuration’s `videoFormat` before running the session. 
Thank you! I'll try it out! 
I just tried it, and it worked! Thanks :smile: This is a great addition to ARKit!
A big thank you to the ARKit team for giving us access to those video options! 

--- 
> ####  Does ARkit or RealityKit support rigid body physics defined in a USD file?

Hi Alexandre, ARKit doesn’t support physics but rather detects the surrounding scene to allow RealityKit to handle virtual objects. RealityKit does support rigid body physics and a good place to start looking is at the physics APIs here: <https://developer.apple.com/documentation/arkit/usdz_schemas_for_ar/simulated_physical_interaction/preliminary_physicsrigidbodyapi> 
**Not supported** yet by RKit, but FYI: <https://graphics.pixar.com/usd/release/api/usd_physics_page_front.html> and <https://graphics.pixar.com/usd/release/wp_rigid_body_physics.html> 
This request is specific to the interaction between USD files and RealityKit, today we are focusing on ARKit question in our lounge. I encourage you to file a feature request through the feedback assistant.
Feedback Assistant: <https://feedbackassistant.apple.com> 

--- 
> ####  Hi, and thanks for your work! I’d like to ask what might be the possible causes for the ARSessionDelegate is retaining ARFrames console warning. I use the session:didUpdateframe: delegate method to just check whether the AnchorEntity(plane:) I’m looking for is in a sufficient distance from the camera. Thanks.

Hi Ioannis, we have a limited pool of resources for our ARFrames and in order to keep some available for ARKit to process, we recommend processing the frames as quickly as possible. If you need to perform longer computations, you can copy an ARFrame and release the ARFrame from the delegate method. 
Makes sense. Thank you! 

--- 
> ####  Hello, I would like to know if it's possible to use shareplay with a ARKit app? When i try there is no video on the facetime call if the back camera is started. Is it possible to have both camera at the same time (front for facetime and back for my AR app)? Thanks

Hi Gil! ARKit configures the cameras according to the selected configuration. Capturing from another camera while an ARKit session is running is not supported. 

--- 
> ####  What can you share about this report FB9184883 ? Is it marked as a highest priority issue ? For those wondering, a post on the forum explains it : <https://developer.apple.com/forums/thread/705860|https://developer.apple.com/forums/thread/705860>

Hi Gaetan,
I did check with the request you filed and pinged the engineer assigned to it. I also encourage you to attach an ARKit recording (one in portrait, one in landscape) so we can rerun and reproduce your exact results. If you’re not familiar with the process, here’s the link to the documentation:
<https://developer.apple.com/documentation/arkit/arsession/recording_and_replaying_ar_session_data?language=objc> 
Alright, thanks <@U03J7GC2A2C> ! 

--- 
> ####  Is there a native 3D processing tool coming the iOS/macOS any time soon? We needed to implement USDZ cropping on iOS, and the 3rd party tools don't deliver the quality we want.

Hi Yurii,
In this lounge we are focused on questions to ARKit, it looks like your request is specific to USDZ and/or other tools. As the related lounge is closed for WWDC, please use the developer forums or the feedback system:
Feedback Assistant: <https://feedbackassistant.apple.com>
Developer Forums: <https://developer.apple.com/forums/> 

--- 
> ####  Is it possible to do perspective correction in ArKit using the captured depth map? like on the continuity camera "desk view" for ex

Glad you’re also a fan of the new desk view feature. There are potentially two solutions to this: You might just try to to a single perspective projections for the whole image The second solution is to use a per-pixel correction like you suggested. Both come with their own benefits and drawbacks. Please check out our documentation for implementing the second approach:
<https://developer.apple.com/documentation/arkit/environmental_analysis/displaying_a_point_cloud_using_scene_depth> 

--- 
> ####  Is there any plan to allow built-in hands and finger detection within ARKit to let the user interact with an object directly with his hands and not only though touch events on the device screen?

Hi Brian! ARKit has no built-in hand or finger detection, but you can use Vision to track hands or detect hand poses. Here is a developer sample illustrating this: <https://developer.apple.com/documentation/vision/detecting_hand_poses_with_vision>.
For ARKit feature requests, we encourage you to send us a report in Feedback Assistant: <https://feedbackassistant.apple.com> 
Hi Andreas! Thank you for your reply and for these informations. 

--- 
> ####  "So what I meant is if you know the four corners of that building you can create four Location Anchors at those lat/lon coordinates. If they are tracked in ARKit you get the local coordinates and can build an occlusion/collision mesh."  Hi Christian, did you mean I should build an occlusion mesh for every building I want occlusion/collision. I am kind of new to ARKit but I saw that I can create a metal renderer to work with ARKit. can I get depth information using a convolutional neural network from metal. sorry if this is off topic.

Hey Abraham, throwing machine learning at it sounds like a super fun project, I would recommend to start a bit simpler. So as a small experiment you can take the four corners of a building from the Maps app and then create four Location Anchors based on these coordinates. As soon as those are tracked you can look at the local coordinates (in x,y,z) and then build a polygon based on it, you can extrude it towards the sky (y up) to get a nice collision/occlusion mesh. 
I will try Christian. I will have the code publicly hosted on GitHub<https://github.com/Ansel7/Mobius>) and probably create some kind of tutorial on this journey. 
I have a lab scheduled for later today, I will present this solution, and ask for help on the implementation, Thank you ARKit team 

--- 
> ####  Using additional cameras in ARKit - are there any resources to show how this iss setup?

Hi Dan! ARKit allows streaming video from only one camera at a time. Which camera is used is determined by your configuration (e.g. `ARFaceTrackingConfiguration` will use the front facing camera, `ARWorldTrackingConfiguration` will use the back wide camera).

You can, however, enable face anchors detected by the front camera in an `ARWorldTrackingConfiguration` . Vice versa, you can enable `isWorldTrackingEnabled` in an `ARFaceTrackingConfiguration` to benefit from 6DOF world tracking.

You can learn more about these APIs here:
<https://developer.apple.com/documentation/arkit/arworldtrackingconfiguration/3223422-userfacetrackingenabled>
<https://developer.apple.com/documentation/arkit/arfacetrackingconfiguration/3175413-isworldtrackingenabled>.
Or check out this developer sample: <https://developer.apple.com/documentation/arkit/content_anchors/combining_user_face-tracking_and_world_tracking> 
Am I able to capture frames off additional feeds at the same time (not necessarily exactly synchronous).  
Eg main at session happening on rear facing camera, additional video frames captured occasionally from front facing.  
Maybe I've been fooled, see an ARKit 6 breakdown that says “Simultaneous front and back cameras with AR” - is this real? 
We introduced new API to capture frames in higher resolution than your configuration’s video format: <https://developer.apple.com/documentation/arkit/arsession/3975720-capturehighresolutionframe>. Those frames are captured from the same camera. Setting up additional cameras is not supported. We encourage you to file a feature request in Feedback Assistant: <http://feedbackassistant.apple.com/> 
The sentence you quoted refers to the API I mentioned above. Not all of the features listed in the lower part on <https://developer.apple.com/augmented-reality/arkit/> are new additions in ARKit 6; this is meant more as highlighting ARKit’s capabilities in general. 
Ok… that's ancient news.  
Thanks for finding the source of my misconception! Great work guys! 

--- 
> ####  Hi! We're working on an AR experience that allows user to put AR objects in their surroundings and replay it later. We're saving the data on an ARWorldMap and archive it on the filesystem to be retrieved later. Everything works great on smaller areas with small ARWorldMap file sizes. However as user adds more stuff, the ARWorldMap file gets bigger and at some point, it takes so long or even impossible to relocalize using the big ARWorldMap files. I'm seeing slower relocalization on ARWorldMap files with 10 mb size.   Question: Is there like a known cap of how big ARWorldMap files can be to retain effectivenes of relocalization and the AR experience?  What can impact performance for AR relocalization other than lighting condition and the object textures that we're rendering (maybe area size? camera motion? features in the area?) since we're seeing frame drops on bigger ARWorldMap files.  Thanks!

ARWorldMaps are optimized for room sized scenarios. If you exceed that limit then relocalization will stop working in certain areas as the map is not big enough any more to cover the whole area.

The frame drops sound related to the amount of content being displayed though. For that, feel free to provide more details through Feedback Assistant: <https://feedbackassistant.apple.com> 

--- 
> ####  What’s the current upper limit on SKNode objects? Say you wanted to create several rows of image sprites/emoji for eg a virtual interactive bookshelf layout.  Also if you wanted to animate these sprites would that be feasible? 

Hi <@U03J97X79CL>, In this lounge we are focused on questions to ARKit, it seems like your request is specific to SpriteKit. You might be able to find some answers in the SpriteKit performance documentation: <https://developer.apple.com/documentation/spritekit/nodes_for_scene_building/maximizing_node_drawing_performance>
Otherwise, please use the developer forums or the feedback system to get connected to an engineer from SpriteKit. 

--- 
> ####  Is there a way to force ARWorldMap to relocalize on our position instead of inferring from the features around us? For example, since ARWorldMap has its own root anchor, can we do something like "load this ARWorldMap using my current position/transform in the real world as the root anchor"?  From my understanding we can do this with a single/multiple ARObjects but haven't found any resources about collections of ARAnchors in an ARWorldMap

This is not supported out of the box. What you could do is compute the offset between your current location (before relocalization) and after relocalization and apply that accordingly. 
