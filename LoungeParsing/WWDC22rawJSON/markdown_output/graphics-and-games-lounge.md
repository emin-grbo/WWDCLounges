# graphics-and-games-lounge QAs
#### by [FeeTiki](https://twitter.com/FeeTiki)
---

--- 
> ####  There any main tradeoffs between tessellation and mesh shading for vertex creation?


|U03HF6T73FF|:
Mesh Shading has a more flexible workflow and allows for dynamic scaling of your workload through the object shader stage. In terms of performance, Mesh Shading allows a more pipelined flow directly from the Mesh Shader stage to the rasterizer, so you have full mesh visibility during vertex creation. On the other hand - I would suggest using tessellation if you are doing actual tessellation of an existing geometry pipeline.

|U03HJ54DBT4|:
For users who are doing procedural work that doesn't directly map to tessellation per-se, I would definitely suggest Mesh Shaders.

|U03J7T89SQG|:
The new <https://developer.apple.com/documentation/metal/metal_sample_code_library/adjusting_the_level_of_detail_using_metal_mesh_shaders?language=objc|sample code> we published shows how mesh shaders work and you can get an idea of the difference.

|U03J7T89SQG|:
The sample code generates Bezier patches and uses mesh shaders to control the level of detail. While the patches are generated on the CPU, you will see that it would not be a huge leap to do that in the object stage or mesh stage.

--- 
> ####  Not much of a question because I'm just starting to move towards rendering but I'd like to say thanks to everyone involved with this. The documentation, tooling and APIs seems better than ever and the MetalFX Upscaling seems a game changer. I can see some foveated rendering hacks being used with this API and using different LOD with the fast resource. Cheers lads, awesome work.


|U03HJ4HULBC|:
Thanks for the feedback. We are curious about your idea "I can see some foveated rendering hacks being used with this API". Can you elaborate more on it?

|U03J76T9WG6|:
Using the same concept that VR googles are starting now but on a flat screen. Render the main point of interest in 4k and moving away from it, create lower zones (almost like a gradient) where the borders can be rendered at like 1080p with high anti alias combining with lower LOD. Again, starting so not even sure if it’s possible.

|U03HHP77WUB|:
For foveated rendering there’s also a variable rasterization rate API in Metal to help with that
<https://developer.apple.com/documentation/metal/render_passes/rendering_at_different_rasterization_rates>

|U03J76T9WG6|:
Thanks <@U03HHP77WUB>, there’s not even the need for hacks then. Cheers.

|U03HJ4HULBC|:
<@U03J76T9WG6> Just a quick note: MetalFX Upscaling is designed with fixed rasterization rate in mind. You can find more details in the MetalFX session tomorrow. Cheers.

|U03J76T9WG6|:
I’ll keep an eye on it. Cheers <@U03HW8Y0RFB>.

--- 
> ####  What are the package size considerations when shipping with offline compiled metal shaders?  Do these need to be updated over time to keep up with any driver or software updates for a particular piece of hardware?


|U03HRA8QQMQ|:
Hi <@U03J9S1L38W>,
1. Regarding package size considerations, optimizing for your particular deployment platform and particular set of supported devices is what make most sense.
2. Please refer to the video “Target and optimize GPU binaries with Metal 3”  available tomorrow for information on this.

--- 
> ####  How do I start creating anything in Metal 3? Can you please show me code for a "Hello, World!" type Metal 3; maybe a box with a shaded gradient of color inside.


|U03HJ3X1HK5|:
Yup! We have a list of examples with source code at <https://developer.apple.com/metal/sample-code/>

|U03HJ3X1HK5|:
You can also create a new project in Xcode, select the `Game` template and pick `Game Technology: Metal`, which will create a new project that renders a cube in Metal

|U03JHV01DFC|:
Excellent! The sample code link will do well. Thanks

|U03JHV01DFC|:
And just created the Metal cube project in Xcode; this is a huge boost to getting me started using Metal 3!

|U03HJ3X1HK5|:
Awesome! :tada: If you have any questions throughout the week please let us know :smile:

|U03HJ3X1HK5|:
I also recommend checking out <https://developer.apple.com/documentation/metal/debugging_tools> to help you debug any issues you encounter

--- 
> ####  Hi, are Metal 3 features exclusive to Apple Silicon or do they also work on other processors (e.g A-series on iOS, or the GPUs in Intel-based Macs)?


|U03HWP3C7G9|:
hello! thanks for the question, Alessandro
That information is in the video at approx 12m 45s

|U03HZ81AHCN|:
Thank you very much!

--- 
> ####  What's the best way to get started with Metal as a beginner in the graphics field?


|U03HR9ECYN7|:
Hello, we have a bunch of great samples for getting started with Metal going from the very basics all the way to more complicated rendering.
<https://developer.apple.com/metal/sample-code/>

The samples under "Metal Fundamentals" are a great place to get started.

|U03JRP87THN|:
Thank you very much! Will look into it.

--- 
> ####  I’m learning graphics (coming from Swift) and am really interested in Ray tracing. What should I learn first to learn how to make a hybrid renderer in Metal?


|U03HJ4DKK50|:
Hi Ethan! In addition to this year's Raytracing content, we also had a session fully dedicated to the topic of Hybrid Rendering in last year's WWDC. Hopefully you find it a good introduction to the topic - <https://developer.apple.com/videos/play/wwdc2021/10150/>. In particular, the session shows how to do your "primaries" using rasterization, and then how to use that as the basis for RT Shadows, Ambient Occlusion, and Mirror-like Reflections.

|U03HJ3X1HK5|:
This sample is also great for beginners <https://developer.apple.com/documentation/metal/metal_sample_code_library/accelerating_ray_tracing_using_metal> (it's not in Swift though :sweat_smile: sorry!)

|U03HMEDQX55|:
Thanks! Metal makes Ray tracing really exciting since you can now pair it with MetalFX. Going to be interesting!

--- 
> ####  Are there any memory and texture format considerations when using MetalFX?  I'm guessing the historical frames need to be stored in some way, though the trade off would be smaller intermediate render targets.


|U03HJ4HULBC|:
For more details on MetalFX Upscaling, please watch the session tomorrow. Thanks.

|U03J9S1L38W|:
Thanks!  Will be sure to check it out.  Also will be interesting if this could be used for some intermediate render targets like an AO pass.

|U03HJ4HULBC|:
If you have any further questions, join us in the digital lounge for the session 1PM-2PM PST. We'd be happy to answer any further questions.

--- 
> ####  Since the shaders are compiled at project build time and compilation speed is no longer as critical, is that extra headroom used to allow the compiler to try to optimize the shaders further? Or is does it produce identical machine code as when building it at runtime?


|U03HJ3XEC75|:
Independent from offline compilation, we did introduce a new optimization level -Os (size) as an option, but there is not additional optimization that occurs during runtime. The produced code will be identical.

|U03HMC1PAG7|:
Understood, thanks!

|U03HJ3XEC75|:
Also, be sure to check out “Target and optimize GPU binaries with Metal 3” available tomorrow for more information!

--- 
> ####  Hi! Great wwdc session, question: do you have a hello world example for making shaders using Apple technologies? Thank you!


|U03J7T89SQG|:
Please see the article "<https://developer.apple.com/documentation/metal/developing_and_debugging_metal_shaders?language=objc|Developing and Debugging Metal Shaders>" that will introduce you to the Xcode's excellent shader debugger. Then you can try out the Game Template if you want to get a Metal app running. And you can check out our <https://developer.apple.com/documentation/metal/metal_sample_code_library|sample code library> that have many kinds of Metal samples (and shaders) you can learn from.

--- 
> ####  Can you explain how to use triple buffering for complicated scene with 2d (overlay/ui) and 3d? What kind of data I should store in buffers? In Vulkan examples they use framebuffer, but metal dont have any similar entity.


|U03HJ54DBT4|:
Could you give a bit more context? In general all interfacing with the compositing is done through the Drawable. (usually through a MTKView in an app). Are you referring to manually triple-buffering GPU resources for CPU synchronization?

|U03JSFUKL2U|:
Yeah, indeed. I wanna fill some data on CPU side while frame rendering (inflight frames) and pass filled buffer to command queue. In apple examples I see how to use inflight frames to fill camera data to buffers, but camera data isn't complicated.

Im newbie in Metal and trying to create my own render engine. 

|U03HJ54DBT4|:
One way to do this is to have a set of data for each frame in flight. You can then use a mutex (or other thread-safe structure) to keep track of what sets are in flight by:
• marking them when you use them in a command bufferand 
• unmarking them in the completion handler of the command buffer. 
If you run out of free sets, you can simply wait on the mutex and halt rendering on CPU until GPU has caught up.

|U03JSFUKL2U|:
Ok, I will try it! Thanks a lot. 

|U03HJ54DBT4|:
check `synchronize` <https://developer.apple.com/documentation/metal/mtlblitcommandencoder/1400775-synchronize|link> and the various ways of signalling and reading data between buffers on GPU and CPU <https://developer.apple.com/documentation/metal/mtlbuffer|link>

|U03HF6TASHK|:
Also, if you wanted a example of this pattern check out the game template in XCode by creating a new project in Xcode, selecting the `Game` template and picking `Game Technology: Metal` . In that template check how `_inFlightSemaphore` is used to multi buffer the uniforms buffer.

|U03HJ54DBT4|:
From the Dynamic Terrain Sample code:
```
    // We allow up to three command buffers to be in flight on GPU before we wait
    static const NSUInteger kMaxBuffersInFlight = 3;

    _device             = device;
    _commandQueue       = [_device newCommandQueue];
    _startTime          = [NSDate date];
    _inFlightSemaphore  = dispatch_semaphore_create (kMaxBuffersInFlight);
    _frameAllocator     = new AAPLAllocator (device, 1024 * 1024 * 16, kMaxBuffersInFlight);
    _uniforms_gpu       = _frameAllocator-&gt;allocBuffer &lt;AAPLUniforms&gt; (1);
```

|U03HJ54DBT4|:
You can see we explicitly limit our in-flight sets to 3 in this example. (<https://developer.apple.com/documentation/metal/buffers/rendering_terrain_dynamically_with_argument_buffers|link to sample code> )

|U03HJ3XEC75|:
The main idea is that you shouldn’t modify data with the CPU if the GPU might be reading it, so using that semaphore with a completion handler (per the examples above) allows you to know when at least one of your 3 copies of any data are able to be modified.

If you are not using the CPU to modify textures/buffers on the fly then there isn’t a need for this semaphore. -[CAMetalLayer nextDrawable] will automatically provide up to 3 drawables and will limit an app from getting too far ahead (if you render faster than the screen refresh).

|U03JSFUKL2U|:
Thanks! I will watch linked examples asap. 

--- 
> ####  Didn't see it earlier, new to Slack:  "Not sure if this is the right place to ask, but I am still looking through the plugins. But would it be able to use Bluetooth or related tech to share say an item with another player that also has the game/app. Like if there is a Unity plugin from apple that does this. "


|U03HJ3XG351|:
Unfortunately we don't currently offer a plug-in that exposes this functionality, but this is certainly an interesting idea.

|U03HJ3XG351|:
Can you tell me more about what you're trying to do. Are you looking for something that behaves like the share sheet?

|U03JGTHPP7D|:
It's more of a thought experiment at this point, but I kind of want to create a fantasy/rpg game and want to incentivize working together in real life to defeat certain bosses or challenges. My goal is to not rely on having any servers if possible. I think having bluetooth access might be a way for people to create a party, like in a typical 4 player rpg game like final fantasy. For example, if you are a healer. You can only heal or buff other people most of the time. In this case to beat certain challenges you would need to meet up with other people to be able to progress.

--- 
> ####  What's the earliest iOS you can use this with?


|U03HBFMJ81L|:
The plug-ins are compatible as far back as iOS 13 as long as the underlying framework is also supported.

|U03HBFMJ81L|:
For example, the PHASE framework was new in iOS 15, so is not supported prior to that version.

|U03HMCT0BTR|:
Thanks. (My current game supports iPad 2 still, iOS 9… But for new projects, that’s probably fine.)

|U03HBFMJ81L|:
Keep in mind the plug-ins are open-source, so feel free to make modifications if needed to help with your specific backwards compatibility goals.

--- 
> ####  If we're making feature requests: I really like the ability to email bug reports from my game with `MFMailComposeViewController`!


|U03HJ3XG351|:
Thanks for the feedback. We're definitely tracking feature requests, so this input is super valuable.

|U03HMCT0BTR|:
Though that might be really tricky with Unity — I use it in UIKit-based games.

|U03HJ3XG351|:
Yeah, we'll have to investigate how we might surface the functionality. It's certainly interesting - but there may be a more Unity-esque approach to solving your issue as well. I believe Unity has some integrated bug report metrics that you can leverage as a Unity developer.

|U03HMCT0BTR|:
We did it in Kobold2D (Cocos2D) years ago, too. Email is nice for indies because you don’t need to worry about a back end.

--- 
> ####  A question on the Accessability plugin for Unity. Is it only available for Apple devices or can it also be used for Windows, Xbox etc. Reason for asking is that it would be great to see a cross platform plugin to increase the reach of accessability (making it easier to prioritize for stakeholders)


|U03HJ3XG351|:
Hi Denny, thanks for the perspective. Currently this plug-in is only available for Apple platforms as it ties into foundational Apple accessibility technologies.

|U03HWMPTAUX|:
Ok! I did miss to say it in the question--it's really great to see the accessibility plugin :-)

--- 
> ####  What is the recommended framework for connecting to another player stably for a multiplayer match? Not the old turn-based games, but a modern approach to having a 5-10 minute connection for PvP. (Would ARKit, RealityKit be better today than multipeer connectivity, which can be flaky with frequent disconnects?)


|U03HJ3XG351|:
Hi - GameKit currently provides real time multiplayer support and is currently used in a number of games. Coincidentally, we've just shared this functionality as part of the Unity plug-ins made available today.

|U03J7T54GGY|:
Besides that, GameKit provides a few way for our users to play with each other:
• Auto matching.
• Inviting Game Center friends via <http://Messages.app|Messages.app> or push notifications.
• Or play with nearby friends.
You will be able to see some games in Apple Arcade utilizing the multiplayer functionality provided by gamekit.

--- 
> ####  Hi! It looks like the documentation for the unity plugins has not been submitted to the GitHub repo -- all the documentation links are broken.


|U03J3UW6LSD|:
Thanks for the report! We’ll look into this.

|U03HJ3XG351|:
Hi, thanks for pointing out! Documentation links should now work again.

--- 
> ####  I've had a quick browse of the Accessibility Unity plugin and noticed that it's only supporting iOS and tvOS. Is macOS planned as well? There are also some performance concerns with the code that I'd love to see resolved, will GitHub PR's be considered?


|U03HEKAJJBF|:
We don't currently support macOS, but you can always file a bug through feedback assistant for us to consider these requests.

|U03HJ3XG351|:
Hi Alex, this is very appreciated. Unfortunately we don't currently accept external PRs - but we do really take your feedback to heart, so keep the feedback coming and we'll do our best to address in the mean time.

|U03JS3L4VU4|:
Great to hear. Just based on a cursory scan through the codebase, the most serious performance issues are allocating in the mono heap with calls like GetComponentsInChildren&lt;Renderer&gt;() (there are allocation-free versions of these available), and serializing rects and points to native code via strings.

|U03HJ3XG351|:
Fantastic. Thanks for already helping to make these plug-ins better.

|U03JS3L4VU4|:
Would love to get some more detail on how the element ordering is working too. It looks like the plugin determines an element ordering based on screen-space positioning which seems quite complex; however my project already knows the logical layout and grouping of every UI element; is there a mechanism for using this actual logical ordering?

|U03HEKAJJBF|:
That is a great feedback! Currently no, but we will add this to our feedback list to allow honoring element ordering provided by developers:thumbsup:

|U03HMCT0BTR|:
I haven’t looked at the Accessibility plugin yet but it’s the one I’m most excited about. My games are playable via VoiceOver, and I definitely override `-accessibilityElements` to do things like give a consistent navigation order when the visuals are mirrored.

--- 
> ####  I look into unity plugins and have a relative question: Why you using swift instead of objc in AppleCore module? Why Swift with all Unmanaged things better, than ObjC?   But thanks for that bridging! I grab information how to use _cdecl :)


|U03HBFMJ81L|:
Thanks for asking Vladislav! We used Swift because it is the best language for Apple platforms. Glad you learned something new too!

|U03JSFUKL2U|:
Yey! That is very great answer for me!  Thanks Brett

--- 
> ####  Is wheel support only on Mac? The API seems to be available on all platforms except Apple Watch, but I’ve only seen it mentioned with regard to Mac. Am I misreading something?


|U03J3UW6LSD|:
Yes, racing wheels are only supported on macOS at this time. If you’re interested in supporting racing wheels in your game on other platforms, please file feedback to let us know!

--- 
> ####  Could mesh shaders be used for procedural terrain generation with continuous LOD? Currently I use a tessellation compute shader (which also does some basic culling) followed by a vertex/fragment shader.


|U03HJ54DBT4|:
You can definitely use Mesh Shaders to do this! - The great thing about Mesh Shaders is that you are not limited to the fixed tessellation layout; you can kick off an Object Shader to calculate what tiles to populate (and which ones to leave out for custom tiles), and then dynamically schedule Mesh Shader grids to create the individual tile geometry. :)

|U03HJ54DBT4|:
This way, you could effectively generate and cull your entire terrain on the GPU

|U03HJ54DBT4|:
Is there any specific issues you are worried/thinking about?

|U03HVCCH5KQ|:
Fantastic! Are there any more details/docs on mesh shaders? I’m having trouble finding much about it.

|U03HVCCH5KQ|:
One of the problems I have at the moment is culling. I pass in some quads to the tessellator, then do frustum transforms to try to figure out whether the quad would be onscreen or not (using -1 for the tessellation factor if I want to cull it). Then my vertex shader displaces vertices with the procedural function and does the transforms again, and it all feels a bit clunky.

|U03HVCCH5KQ|:
I know there’s a session tomorrow on mesh shaders, but I’m having trouble understanding the basic behavior of them atm.

|U03HJ54DBT4|:
There will be a full session on Mesh Shaders tomorrow! And you can always drop back into the next Q&amp;A on friday if you have any follow-up.

My suggestion for doing these kinds of things, is to assume each "tile" has a AABB of the min/max displacement within the segment (pre-calc if needed), then use the Object Shader (which is a full featured compute shader) to generate work items for tiles of various sizes etc. Then run a Mesh Shader Grid with a TG per tile to generate. You can simply cull your AABB in the OS and you should never have any overhead aside from the AABB check :slightly_smiling_face:

|U03HJ54DBT4|:
You can effectively have the OS TG fill the payload buffer with an array of TileDesc structs (or something like that), then have each MS TG pick up a TileDesc to expand into a mesh and send it straight to the rasterizer

|U03HJ54DBT4|:
Tomorrow's Mesh Shader session will be here: <https://developer.apple.com/videos/play/wwdc2022/10162/>
Documentation will be updated in the near future, and I believe a sample project will be available along with the session.

|U03HVCCH5KQ|:
OK, this sounds good! Is there any integration with the existing tessellation pipeline, or would I need to somehow implement something like it in the OS or MS?

|U03HJ54DBT4|:
I believe you have to do a manual tessellation in your MS. If I can make a suggestion, a doubling straight forward quad tessellation scheme while you fade in height dat through manual mip levels might be a very good and quick way of getting a simple-but-smooth solution. The nice thing about OS/MS is that you can nicely debug both the tile scheduling and the mesh generation separately, as they are both basically compute kernels you can run individually.

|U03HVCCH5KQ|:
Hmm I see. It definitely sounds like something to try out. I love the built-in tessellator because it distinguishes between internal and edge tessellation which lets me avoid cracks in the terrain. I guess I would just need to do a bit more work in my MS to make that work.

|U03HVCCH5KQ|:
I wonder if the current fixed tessellator could be exposed as a function we could call from our MS…

|U03HJ54DBT4|:
I think the main issue with the classic tessellation scheme is that it tends to generate noisy silhouettes when tessellation smoothly increases. (you get this wave-effect as the vertices move across the displacement samples).
There should be a way to integrate an external "classic tessellation function" into the MS kernel to generate a list of 2D triples for a given tessellation. I wouldn't be surprised if there are examples of this online.

|U03HVCCH5KQ|:
Yes the swimming vertices are an issue. Although it’s an issue in my case anyway as I’m using a single square mesh to render an entire spherical terrain from ground to space by “wrapping” it over the sphere depending on distance and what is potentially visible. My solution is to buy better GPUs and increase the vertex count to minimise the sample aliasing.. :smile:

|U03HVCCH5KQ|:
Thanks for your help Jaap, looking forward to the session tomorrow and I’ll probably be back for more Q&amp;A following it!

|U03HJ54DBT4|:
If you wanna have more of an in-depth discussion, we still have a few Lab openings to sign up!
<https://developer.apple.com/wwdc22/labs/>
These are in-depth 1:1 discussions :)

--- 
> ####  How should we approach issues like Shader Debugger crashes and GPU faults? We don't know where to look for hints


|U03HWP3Q65P|:
The best thing to do for debugger crashes is to create a feedback assistant with steps to reproduce.

As for GPU faults, I would encourage you to try enabling shader validation for your application.

|U03HZ4PT2ER|:
We already have all validation turned on (no results), and we use FA all the time, but what do we do about these "game over" issues in the meantime?

|U03HLFDFS20|:
I would encourage you to try the new betas with your use case, we improved a lot of areas there

|U03HLFDFS20|:
If you are still having troubles, maybe you could create new FBA tickets, attach a gputrace and post the numbers here?

|U03HZ4PT2ER|:
One example of GPU Fault FB9968899

|U03HLFDFS20|:
Is the GPU fault happening at application runtime or while you are working with the gputrace?

|U03HZ4PT2ER|:
The fault is a separate issue, but I mention both because there are no diagnostics we can understand

|U03HZ4PT2ER|:
But this is a common occurrence for us, something fails catastrophically with no hints and we don't know how to proceed

|U03HBFM7FSA|:
Does this happen on the latest OSs?

|U03HZ4PT2ER|:
I haven't tried the fault on Ventura because it can lock things up if not quickly resolved, may result in a loginwindow watchdog timeout (force reboot)

|U03HLFDFS20|:
Are you using raytracing or ICBs?

|U03HZ4PT2ER|:
No raytracing, I assume ICB is indirect command buffer, also no

|U03HF6TCXC5|:
Which GPU architecture is this Steven?

|U03HZ4PT2ER|:
Same app worked fine on Intel (AMD GPU) fails badly on M1 for no apparent reason

|U03HZ4PT2ER|:
But I'm really asking about methodology, because we want to keep making forward progress without DTS all the time

|U03J3RYQ9V1|:
The crash log on M1 appears to indicate GPU firmware detected lockup, meaning that from the software perspective the GPU is hung for some time hence it is rebooted. Do you by chance implement a concurrent producer/consumer pattern via atomics on M1?

|U03HZ4PT2ER|:
It uses atomics, but I wouldn't call it producer/consumer, it's just an atomic allocator to a buffer

|U03HZ4PT2ER|:
We found entirely by chance that increasing the number of allocators from "1" fixed it

|U03HZ4PT2ER|:
But have no idea why or how, etc

|U03J3RYQ9V1|:
Are you ever in a situation where you rely on forward progress guarantees to access the allocator?

|U03HZ4PT2ER|:
Not sure what that means from a GPU standpoint

|U03J3RYQ9V1|:
E.g.:  would threads spin until memory is available or do you just assume there’s always enough memory?

|U03HZ4PT2ER|:
My mention of "forward progress" above just means development progress, not getting stuck on crashes

|U03HZ4PT2ER|:
there is no spinning, just atomics

|U03HZ4PT2ER|:
though we check the allocated value hasn't gone off the end of the array, we discard in that case

|U03HZ4PT2ER|:
there is nothing "consuming"

|U03J3RYQ9V1|:
Oh coincidentally you also used the term “forward progress”, although I meant the property of a program to make progress no matter what

|U03HZ4PT2ER|:
There is no concurrent producer/consumer

|U03J3RYQ9V1|:
I see, then it’s likely not the problem I thought, thanks for clarifying

|U03HLFDFS20|:
Have you tried running without shader validation enabled, just the API validation?

|U03HLFDFS20|:
Also, one of the ways GPU Faults happen when there’s basically unpaged memory reads/writes, basically out of bounds reads/writes or access to a memory that’s not resident - meaning the underlying memory of a resource that wasn’t made resident using `useResource` or `useHeap`

|U03HZ4PT2ER|:
I don't think that explains how increasing the allocators fixed it

|U03HZ4PT2ER|:
1 = crash, 4 = ok

|U03HZ4PT2ER|:
I realize there may be more parallelism on TBDR, but some kind of hint would help us out

|U03HZ4PT2ER|:
List of FB for reference FB10020742, FB10020198, FB10014465, FB9968922, FB9968899

|U03J3RYQ9V1|:
Had a quick look at the shader code in the Metal library contained in the app you attached to FB9968899 and I noticed a function called `transparency_populate` that loops on a linked list. Does this function get called in the workload that hangs?

|U03HZ4PT2ER|:
That's in the second "resolve" pass, which is called but shouldn't be directly affected by the number of allocators or their values

|U03HZ4PT2ER|:
`transparency_add` , `transparency_add_counter`, `transparency_write`, etc are the ones affected

|U03J3RYQ9V1|:
If you remove entirely the second “resolve” pass, do you still see a GPU fault though?

|U03HZ4PT2ER|:
I could try that, but it seems unlikely

|U03HZ4PT2ER|:
if you're looking for sample code, check the attachment to FB9968922

|U03J3RYQ9V1|:
The reason I’m asking is that that `transparency_populate` relies on the data structure to be well formed to complete, otherwise it might spin forever

|U03HZ4PT2ER|:
That's not an issue we see

|U03HZ4PT2ER|:
It's an A-Buffer implementation, a 2D buffer of head pointers (inited to -1) then a linked list

|U03J3RYQ9V1|:
Yes, I can see the A-buffer structure for sure. At first glance the code looks sane to me, so I guess we need to repro locally to understand what’s going on

|U03HZ4PT2ER|:
FYI, just triggered in Ventura, will be attaching the reports

|U03HZ4PT2ER|:
Looks like some diagnostics are missing from the messages?

|U03HZ4PT2ER|:
*`2022-06-08 13:18:09.498390-0400 CADApp[8724:128585] Execution of the command buffer was aborted due to an error during execution. Caused GPU Hang Error (00000003:kIOGPUCommandBufferCallbackErrorHang)`*
*`2022-06-08 13:18:09.498450-0400 CADApp[8724:128585] Execution of the command buffer was aborted due to an error during execution. Caused GPU Hang Error (00000003:kIOGPUCommandBufferCallbackErrorHang)`*
*`2022-06-08 13:18:09.498713-0400 CADApp[8724:128585] Execution of the command buffer was aborted due to an error during execution. Discarded (victim of GPU error/recovery) (00000005:kIOGPUCommandBufferCallbackErrorInnocentVictim)`*
*`2022-06-08 13:18:09.498734-0400 CADApp[8724:128585] Execution of the command buffer was aborted due to an error during execution. Discarded (victim of GPU error/recovery) (00000005:kIOGPUCommandBufferCallbackErrorInnocentVictim)`*
*`2022-06-08 13:18:09.498867-0400 CADApp[8724:128585] GPU Soft Fault count: 1`*
*`2022-06-08 13:18:09.559102-0400 CADApp[8724:128580] [Metal Diagnostics] __message__: MTLCommandBuffer "Main Loop" execution failed: The commands associated with an encoder caused an error __:::__ __delegate_identifier__: GPUToolsDiagnostics`*
*`2022-06-08 13:18:09.559156-0400 CADApp[8724:128580] [Metal Diagnostics] __message__: MTLCommandBuffer "Callout 3" execution failed: The commands associated with the encoder were affected by an error, which may or may not have been caused by the commands themselves, and failed to execute in full __:::__ __delegate_identifier__: GPUToolsDiagnostics`*

|U03J3RYQ9V1|:
Thanks for the update. What message do you think is missing though?

|U03HZ4PT2ER|:
Seems like *`__:::__ __delegate_identifier__:`* is missing the identifier?

|U03J3RYQ9V1|:
I see what you mean, could you please add this message to the original FB?

|U03J3RYQ9V1|:
also, I managed to reproduce the lock up locally, so it’s easy enough for somebody to bottom that out

|U03HZ4PT2ER|:
I updated FB9968899 at 1:22PM EDT

|U03HLFDFS20|:
*`GPU Soft Fault count: 1` kinda identifies that theres something either accessing out of bounds or at 0*

|U03HZ4PT2ER|:
<@U03HLFDFS20> I guess I would expect some kind of diagnostic for that rather than an unknown issue. Also wouldn't that affect AMD equally?

|U03HLFDFS20|:
There’s a possibility that amd reads out of bounds, but doesn’t page fault

|U03J3RYQ9V1|:
What I’m seeing locally is definitely a hang, not an out-of-bounds though

|U03HLFDFS20|:
I guess the current answer is going to be that we would need to investigate these feedback assistant reports

|U03HZ4PT2ER|:
That's fine, though my original question was a little different

|U03HLFDFS20|:
And to answer your initial question, the fastest way to reach us is through developer forums

|U03HZ4PT2ER|:
ok

|U03HZ4PT2ER|:
I will start using that more

|U03HLFDFS20|:
Unfortunately there might not be a single solution to progress when you are faced with these issues

|U03HLFDFS20|:
Thanks for the feedback

|U03J3RYQ9V1|:
Definitely thanks for the feedback. Somebody will be investigating the GPU hang soon hopefully

--- 
> ####  Can we somehow cancel work committed to GPU? For example we commitеed some neural net processing (example of huge work) and we received memory warning from the system, can we somehow stop execution?


|U03HF6TASHK|:
Hi Pavel, unfortunately no facility exists to cancel committed GPU work. You can use Indirect Command Buffers and NOP out the commands before execution though, could that be a work around?

(Also we'd appreciate it if you can file a feedback request with this scenario for us to evaluate.)

--- 
> ####  What is the best way to denoise the Ray traced frame in metal? Is MPSSVGFDenoiser recommended for this purpose?


|U03HJ3XCFGT|:
MPSSVGFDenoiser will work for denoising the full application frame. Typically you want a denoiser targeted at each ray traced effect, focusing on the visibility signal for shadows and ambient occlusion, and a separate denoiser for reflections aware of how to reproject reflected content.

|U03JM1PJE9G|:
thanks for the response

|U03HJ3XCFGT|:
:thumbsup:  Denoising is a rapidly moving field and there's several open source options that you could look at adding to your application!

|U03JM1PJE9G|:
Those are new topics for me, so sorry if it is a silly question, but what is the latest best way to organize global illumination passes with metal ray tracing then? In my inexperienced understanding it was like: accumulate the light from ~3 bounces and apply denoising to the whole result

|U03HJ3XCFGT|:
Not a silly question at all! Accumulating light from multiple bounces will result in an approximation to global illumination and will likely be noisy depending on how you define the rays for each bounce.  Typically for later bounces you could accept something more diffuse for your global illumination representation - there's more diffuse representations such as <https://jcgt.org/published/0008/02/01/|Dynamic Diffuse Global Illumination>

--- 
> ####  Does `MFXSpatialScalingEffect` support PQ encoded HDR color? Specifically, pixel format `MTLPixelFormatBGR10A2Unorm` and colorspace `kCGColorSpaceITUR_2100_PQ`? If so, which `colorProcessingMode` should be used?


|U03HJ4HULBC|:
HDR colorProcessingMode should be used in that case.

--- 
> ####  Are there any demos using the `MTLParallelRenderCommandEncoder`? Is there a possibility of supporting a parallel compute encoder in the future?


|U03J7T89SQG|:
Hi, thanks for your question. Currently, we do not have a MTLParallelRenderCommandEncoder sample. When you said a parallel compute encoder, can you tell us more about your use case?

|U03J7T89SQG|:
We do support a compute encoder that executes dispatches in parallel on GPU but not encoding compute dispatches in parallel on CPU.

|U03JQCQ65HS|:
I suppose I don't have a use case in mind :sweat_smile: but since Metal compute seems to becoming more popular (GPU-driven pipelines, ICBs, new machine learning stuff) I was just curious if a parallel encoder would be available. I suppose though it might not actually be necessary if compute encoding is not a bottleneck

|U03HJ4HULBC|:
Typically what we've seen of GPU compute is that encoding is quite light weight while the GPU work is heavy. Encoding is just feeding pointers to GPU shader cores of where all the data lives and then GPU go on a massive parallel data processing/computing spree. :smile:

--- 
> ####  Is there a limit to the scale factor (outputWidth / inputWidth) that MFXSpatialScalingEffect can apply?


|U03HJ4HULBC|:
We recommend using a scale factor that's between &gt; 1x &amp;&amp; &lt;= 2x.

|U03HJ4HULBC|:
Just an FYI, we have a digital lounge session dedicated to MetalFX from 1PM-2PM PST today. Cheers.

|U03JEMU3125|:
Alright, thanks. I'll try to check in later. :slightly_smiling_face:

--- 
> ####  What's the most performant way to copy a CALayer into a MTLTexture on iOS?


|U03J3UW6LSD|:
Can you elaborate on your use case? What kind of layer are you trying to copy, and does your app provide the original content of this layer?

|U03HVCCH5KQ|:
We’re trying to render Lottie animations into a Metal texture interactively in real-time.

|U03HVCCH5KQ|:
Our goal is for a user to be able to drag a Lottie animation around a canvas as it plays and have it composited with other Metal content.

|U03HVCCH5KQ|:
The Lottie library we’re using renders to a CALayer and we need to copy it into a MTLTexture.

|U03J3UW6LSD|:
Do you know what kind of layer they’re rendering into? It matters significantly whether the library is also using a CAMetalLayer or if it is using the traditional CALayer drawing APIs.

|U03HVCCH5KQ|:
I think it’s not a CAMetalLayer, which is the problem. I think it’s using CAShapeLayer, CATextLayer, etc. (which are much simpler than implementing text rendering for instance). But it seems to be tricky to then get the result from the CALayer into Metal. On macOS CARenderer seems to permit this but not in iOS 

|U03J3UW6LSD|:
Most generally, the only way to capture the composited appearance of a layer is via CARenderer. You will have difficulty syncing the framerate of this renderer with the display.

|U03J3UW6LSD|:
CARenderer is available on iOS, can you elaborate on your difficulty with it?

|U03HVCCH5KQ|:
Hmm.. I could have sworn that CARenderer::rendererWithMTLTexture was not available on iOS.. but the docs says it has been there since iOS 11.

|U03HVCCH5KQ|:
Well, I think that’s the way to do it, right?

|U03J3UW6LSD|:
One difference I can think of between macOS and iOS is that iOS makes much heavier use of implicit CATransactions. If you try to render the layer tree while the main queue’s implicit transaction is still open, you might not capture the latest drawing.

On iOS, to guarantee correct drawing, use UIGraphicsImageRenderer in conjunction with `-[UIView drawViewHierarchyInRect:afterScreenUpdates:YES]`. You can then use the resulting UIImage to populate an MTLTexture. This will not be as fast as using CARenderer directly but it is more likely to be resilient to the complexities of how iOS apps use Core Animation.

|U03J3UW6LSD|:
But do try CARenderer first. :slightly_smiling_face:

|U03HVCCH5KQ|:
Thanks, I’ll take another look!

|U03J3UW6LSD|:
Good luck! If neither approach works for you, please file Feedback so the teams involved can understand more about your use case.

--- 
> ####  The new EDR support in Metal for iOS looks really exciting, but on what current devices can we test this on?


|U03J7T89SQG|:
Devices with an XDR display currently support EDR as long as the device brightness isn't set too high (among other factors) which would clamp those EDR values. Please see <https://developer.apple.com/documentation/metal/hdr_content/determining_support_for_edr_values?language=objc> for more details. On macOS, you can read the `maximumPotentialExtendedDynamicRangeColorComponentValue` property on an `NSScreen` object for that display. And on iOS, you can use `UIScreen.potentialEDRHeadroom`.

|U03K908Q6DN|:
Is the iPhone 13 Pro included in this?

|U03J7T46WFJ|:
I haven't tested it, but I think you should get a large EDR headroom on iPhone 13 pro.

|U03H3GTMSR5|:
We also recommend to poll the value of `UIScreen.currentEDRHeadroom` (for iOS) or `NSScreen.maximumExtendedDynamicRangeColorComponentValue` (for macOS) to accommodate for possible display brightness changes that might affect available headroom. Those can be caused for ex. by the user interaction - changing the screen brightness or by the system if auto-brightness setting is enabled or as a result of thermal event when device has to throttle.

--- 
> ####  More out of curiosity, what are the potential use cases of quadgroup functions? I've only seen one video mentioning them ("Discovering advances in Metal for A15 Bionic") where they're used to reduce the number of texture reads per thread. Are there any other use "common" use cases?


|U03HJ54DBT4|:
It can be used for any workload where you want to spread orthogonal work across a group; for instance, you can have each thread in a quad cull a part of a light list, then use quadgroup functions to peek at each others' lists and sum lights.

|U03HJ4HULBC|:
The gist of quadgroup and simdgroup functions are to perform data exchange in a more efficient manner. Traditionally, threadgroup barrier and threadgroup memory is required to perform data exchanges, but its a lot more heavier than finer granularity exchanges like quadgroup or simdgroup functions.

|U03JQCQ65HS|:
When would you decide to use a quadgroup over a simdgroup function?

|U03HJ4HULBC|:
When all you need is to exchange among 4 threads in a row.

|U03HJ4HULBC|:
The finer granularity you use, the more efficient it is.

|U03HJ54DBT4|:
If you are in compute, I would probably always use simdgroup, just to get the best bang for your buck. I believe quadgroups are interesting for fragment workloads; I'm not sure what the availability and details are by heart. (rasterization, helper threads etc)

--- 
> ####  I'm interested in the accelerated ray tracing features in Metal 3, but the specific session that would contain more details is tomorrow. Are these changes specifically designed for realtime raytracing in a rasterized renderer, or are they general enough to be used on their own to ray trace entire scenes? I see that there are general purpose ray tracing features in older versions of Metal, I'm specifically curious how these intersect with the Metal 3 ray tracing features.


|U03HJ3XCFGT|:
Metal RT is intended for use in both pure ray traced renderers and hybrid renderers that ray trace from rasterized content. This year's features are applicable to both with a focus on improving performance with some quality of life and ease of use features too! We have a Q&amp;A session on Friday if you’d like to ask additional questions following the release of the video. Some of our samples, such as <https://developer.apple.com/documentation/metal/metal_sample_code_library/accelerating_ray_tracing_using_metal|Accelerating Ray Tracing Using Metal> and <https://developer.apple.com/documentation/metal/metal_sample_code_library/control_the_ray_tracing_process_using_intersection_queries|Control the Ray Tracing Process Using Intersection Queries> do pure ray tracing, and <https://developer.apple.com/documentation/metal/metal_sample_code_library/rendering_reflections_in_real_time_using_ray_tracing|Rendering reflections in real time using ray tracing> uses a more hybrid model.

|U03HJ54DBT4|:
If anyone would like to have more of an in-depth/follow-up discussion, we still have a few Lab slots available!
<https://developer.apple.com/wwdc22/labs/>

--- 
> ####  As far as I can tell iOS devices still run OpenGLES apps just fine. Is there a hard deadline when this will not be the case any more?


|U03J7T89SQG|:
We can't comment on future plans, but we recommend porting existing OpenGL-based applications to Metal to take advantage of the latest features available on our devices.

--- 
> ####  Are there any recommended formats or workflows for dealing with 3D textures in Metal?


|U03J3UW6LSD|:
Can you clarify more about “workflows”? Are you trying to integrate with an existing asset pipeline?

|U03HJ54DBT4|:
Is there a specific thing you are trying to do? I believe you can manually fill the texture one slice at a time if needed. If you are not interpolating along the 3rd axis, you might want to use a 2D Texture Array instead.

|U03JEF2NVQV|:
Just be careful with blit API, Simple APIs don’t work on 3D textures

|U03JEF2NVQV|:
you need full swing blit copy with one full slice calculated not whole texture!

|U03HJ54DBT4|:
I believe `MTLTextureLoader` supports KTX files, including 3D texture formats.

|U03J9S1L38W|:
Thanks for the pointers.  I'm just starting to explore ideas.  I had exported a PNG with vertical slices from a voxel editor.

|U03J9S1L38W|:
Thanks for the pointer on KTX!  I'll look into that

|U03HJ54DBT4|:
Importing one slice at a time works as well! If you are doing uncompressed data (voxel art etc), that would work. If you are going more "natural" 3D textures, beware that you probably want a compressed format as it makes a big difference in memory size and performance.

|U03J9S1L38W|:
Right.  Are there any gotchas using sparse textures for 3D textures?

|U03HJ54DBT4|:
I don't believe so - it should effectively work the same.

--- 
> ####  Are all of the Metal 3 features available on all GPUs?  Do Vega GPUs and UHD 630 get mesh shaders with Metal 3?


|U03HJ54DBT4|:
• Metal 3 hardware support can be found in `Discover Metal 3` <https://developer.apple.com/videos/play/wwdc2022/10066/>
• Specific features (Mesh Shaders, Metal FX) may have a different hardware support. For example, Mesh Shaders should be supported on MTLGPUFamilyApple7 and MTLGPUFamilyMac2. Please refer to their associated session for more information. ie, for Mesh Shaders : <https://developer.apple.com/videos/play/wwdc2022/10162/>

--- 
> ####  Quick question: What happened to the Metal Language Version build setting? Seemed it disappeared one year...


|U03HF6TASHK|:
Hi Steven, this looks a bug, could you please file a feedback request for us to track it? In the meanwhile you can work around this by passing `-std=ios-metalX.X` to your .metal file compilation flags

|U03HZ4PT2ER|:
Same for macOS?

|U03HF6TASHK|:
~I think for macOS it is `-std=osx-metalX.X`~

|U03HZ4PT2ER|:
Looks like it may be back in Xcode 14, would it be fixed for 13.4?

|U03HNDPPWKX|:
For macOS, it is `-std=macos-metalX.Y`  until MSL 3.0 where we have unified language and it is `-std=metal3.0`

|U03HZ4PT2ER|:
thank you

--- 
> ####  Hey there! I have been working with a highly programmatic SceneKit nodes and geometries (I know, I know, old hat), and I have been suggested by some friendly helpful developers at the WWDC Apple Park event (Hello again, Rintaro!) that a pathway to help some of my performance problems would be to 'rewrite' some of my core components with ARKit primitives, or perhaps Metal. Unfortunately, I don't really know where I would begin that conversion, or even if doing the work would net the performance benefits I'm seeking. The context of this question is my AR/VR visualization project which uses 10's of thousands of small geometries and nodes (shared as much possible) to render individual text glyphs like a sheet of paper (<http://github.com/tikimcfee/LookAtThat|github.com/tikimcfee/LookAtThat>). A good, solid first step would be: What would be a suggested migration pattern from SCNNode/SCNPlane/UIImage to similar Metal/ARKit patterns?


|U03HJ54DBT4|:
Are you using individual nodes for each letter/glyph? If so, I would recommend "baking" the glyphs into a vertex/index buffer at run-time and then inserting the entire mesh as a single node.

|U03HJ54DBT4|:
So for instance, you would read in the text, then generate the mesh for a single page, and add that page to your scene as a single mesh (that you can then modify as if it is a static mesh).

Alternatively, you can simply generate a large image with all the text on it using our Text APIs and simply apply it as a texture/Image.

|U03HJ54DBT4|:
But the latter would take up more memory as you are effectively creating a full-sized texture each time.

|U03JRPTDF6U|:
Jaap, thanks for your time! That’s exactly the case - at the moment, I render each glyph as a node, and then `flatten()` them into a single geometry.

|U03JRPTDF6U|:
I have a large texture method too, and it does work, but indeed has the memory issue you’re mentioning.

The `flatten()` has the advantage that is actually seems to create that mesh from the nodes, but I think it does it in a non-optimized-for-my-use-case-way.

If I were to generate the mesh, is there something that I could use as a sample to convert a node’s general presentation / backing geometry to a mesh? I apologize if that’s a vague question. Essentially, I’m looking to see if there’s some intermediary step I can take that would allow me to migrate from the patterns I have now, even if the translation would be slow, just to build out some observations to make better hypotheses from.

That would be something like, “a function that takes a parent node and generates a mesh” or something along that.

|U03JRPTDF6U|:
Also, at the moment I ‘hot swap’ between the glyphs and the `flattened` nodes to get that boost in FPS. I need to keep the nodes around, though, because they’re actionable individually - updating positions, backing contents, that kinda thing. It seems like I’d be able to do the same thing with a mesh by dynamically updating the mesh itself for things like positioning, and then figuring out how to map texture coordinates to those dynamically. I was even looking at ‘textureCoordinates’ as a potential option, but that exists on `geometry`, and all of my nodes with the same glyph share a geometry, again to keep total counts down.

|U03HJ54DBT4|:
Hi <@U03JRPTDF6U>, sorry for the late reply, as we closed down the Q&amp;A, but if you want to discuss this more, please drop by the Q&amp;A on Friday, or sign up for a Developer Lab, which is a 1:1 in-depth chat with one of our developers!

Just to quickly reply to your question, I do agree that you probably want to do this manually to remove a lot of the overhead. I'm not sure how familiar you are with mesh representations, but you should probably be able to do this by effectively writing your own "flatten" function. Without knowing where most of the performance is lost, I would suggest reading the nodes data manually and then composing the vertices for the mesh yourself. This would require you to manually create vertex and index data for your mesh and then upload and bind these to your Mesh.

I would suggest putting your question up in the Labs and indicate this is a SceneKit question - I think those folks will be better equipped to point out the best path :)

--- 
> ####  With MetalFX are there any concerns or issues when dealing with transparency/volumetrics when doing temporal upscaling?  Would it sometimes be better to use Spatial upscaling and MSAA in some cases with a lot of transparency?


|U03H3GQDUP9|:
Temporal AA requires full motion and depth information to produce the best result. Transparent objects usually do not provide that, so TAA will have insufficient input data to process everything correctly. Similar logic applies to reflections.

|U03H3GQDUP9|:
The choice will depend on your particular setup of the rendering pipeline. You could apply temporal upscaling to lower resolution color buffer with opaque objects only and then render transparent objects and volumetrics on top (in output resolution).

|U03J9S1L38W|:
That makes sense, thanks.  Would the upscalers also work for targets other than the final tone mapped image, ie an AO pass?

|U03H3GQDUP9|:
Yes, you can do that. Just allocate separate scaling effect instances for those.

--- 
> ####  Can ScreenCaptureKit be used by two apps at once, each capturing all or parts of the screen?


|U03H3GXFRSB|:
Hi Matt! Fantastic question! ScreenCaptureKit allows for any number of active streams from any number of clients capturing any combinations of filters!

|U03JUCK9B16|:
Great thanks.

--- 
> ####  Is system-level permission required even if an app only wants to capture /itself/ (i.e. only its own window(s)), and not anything external?


|U03H3GXFRSB|:
Hi Michael! Yes, system level permission (one time) is required for the initial time any applications wants to use ScreenCaptureKit. Even if the application is capturing itself, it'll need to get the SCShareableContent list in order to create a filter, which requires system level permission on the initial use.

|U03JEEUJPMJ|:
Gotcha, gracias!

--- 
> ####  Our video conferencing app offers screen sharing functionality, but we want the screen share video to exclude certain windows (e.g., A/V controls and floating participant videos). This is easily solvable with content filtering in ScreenCaptureKit, but what is the recommended way to get this behavior with older versions of macOS that do not support ScreenCaptureKit?


|U03HF6TL5L5|:
You can use the screen capture portion of ScreenCaptureKit as of 12.3, and send it to other users using earlier versions of macOS. In order to get the maximum screen capture performance with ScreenCaptureKit, you'll need 12.3 or later. To achieve similar behavior in previous versions of macOS, you can use the `CGWindow` API to capture video, but not audio.

|U03HVC012J2|:
Specifically, CGWindowListCreate() and CGWindowListCreateImage(). They’re *much* slower than the other APIs, but available back to earlier MacOS versions.

--- 
> ####  If you want to display the interactions with menu at the top of macOS, does that constrain you to just capturing a display (vs. application or window) in order to show that?


|U03HF6TL5L5|:
You can use `init(display:including:exceptingWindows:)`, but this will capture the surface the size of the desktop. The app will be positioned as it is in the desktop, and the menu bar will be at the top of the capture.

|U03HVD5Q8DC|:
Ah, brilliant! Thank you!

--- 
> ####  I make media /playback/ systems, but haven't really yet played with /producing/ media– could you give me an idea of what the next steps would be (in terms of macOS frameworks/API usage), to go from ScreenCaptureKit's sample buffers, to, say, a 'playback-ready' H264/HEVC+AAC HLS output?


|U03H3GXFRSB|:
Hi Michael!

ScreenCaptureKit gives samples back as CMSampleBuffers. So if you wanted to make it playback ready, I would suggest you use AVAssetWriter to create a movie. This should allow you create a movie with the output you wish

|U03H3GXFRSB|:
For HLS, you're going to use VideoToolBox to fragmented mp4 files that you can then upload to the server and update your HLS playlist

|U03HF6TL5L5|:
And if you need a CBR-based stream, Ventura added hardware-encoding-based H.264 and HEVC CBR support, so you can offload the work from the CPU.

|U03JEEUJPMJ|:
<@U03H3GXFRSB> This is incredibly helpful! You, in two paragraphs, have just demystified something for me that has, honestly, just been a bit of an “I can’t do that…” topic so far :ok_hand::skin-tone-3:

|U03JEEUJPMJ|:
<@U03HF6TL5L5> Ah, as in; pre-Ventura H.264/HEVC  hardware-encoding was VBR-only, or?

|U03HF6TL5L5|:
Correct!

|U03HF6TL5L5|:
I think it's technically ABR (instead of VBR), but I'm no encoding expert, so grain of salt.

--- 
> ####  When capturing windows only, is the window's drop shadow captured, or only the actual frame of the windows?


|U03HF6TL5L5|:
Using `init(desktopIndependentWindow:)`, you will get back an `IOSurface` that is the size of the window exactly. No drop shadow included.

|U03JUCK9B16|:
Oh well. Thanks

|U03HVC012J2|:
This is definitely a lesser-used feature in the existing CGWindowList API, but it would be great to see it in ScreenCaptureKit, as well.

|U03HF6TL5L5|:
Please submit a feedback request for this! Sounds like a good idea.

--- 
> ####  Would be great to be able to make screen captures (either screenshots or screen recordings) in HDR!


|U03HF6TL5L5|:
Thanks Chris! Please file a feedback in the feedback assistant for new features for ScreenCaptureKit. We're super excited about it, and we hope it can meet all of your needs.

|U03JN1D5XNJ|:
Will do; thanks!

--- 
> ####  One thing that wasn't totally clear to me from the videos: Obviously, audio-capture is per-application, since audio is not associated with a window. If I exclude only *some* windows of an application from capture, does that mean I don't get any audio?


|U03HF6TK2J1|:
If you’re using display capture, and exclude any window of an app, then you will get system audio minus the whole app’s audio. We also will cover this and other scenarios in our advanced talk “Take ScreenCaptureKit to the Next Level” :slightly_smiling_face:

|U03HVC012J2|:
Thanks. I think this is fine for my typical use-case, but might be problematic for some others

|U03HF6TK2J1|:
Another suggestion is to have a separate stream with the audio you want.
If you have a particular use case or scenario you think we could address better, please file a feedback request!

--- 
> ####  If I'm capturing all windows from a single application, will I also get XPC-hosted dialogs? I'm thinking of Open/Save panels, and the like, which were not easily captured with the CGWindowList API, since they are associated with a different PID than the application windows.


|U03HF6TL5L5|:
It should capture things like the Open/Save dialog. If it doesn't, make sure to file a feedback request!

|U03HVC012J2|:
I’ll check, and let y’all know.

--- 
> ####  Just to reiterate my pledge - please please push mip bias as a part of the sampler for next metal releases. I think even GL had it :)


|U03H3GQDUP9|:
Please submit your request via Feedback Assistant.

|U03JEF2NVQV|:
Sure!

--- 
> ####  Why use a constant jitter offset for a set of pixels instead of a random one that would probably make the result more smoother?


|U03HJ4DLF7D|:
Using a fixed set of low-discrepancy jitter offsets ensures that the space of potential jitters is covered relatively evenly for any given window in time.

|U03K19A2324|:
Thank you <@U03HJ4DLF7D> for your answer! Oh I see... You get a good representation of jitter space, even under this coupling between neighbouring offsets? Interesting...

--- 
> ####  Wonderful presentation @Kevin! Thank you very much! The technology works beautifully with slow moving scenes. Could you comment on the impact of using temporal information on quick moving scenes or quick changing content? Should there be some adaptive setting with respect to the amount of previous pixels used based on the richness/rate of change of the scene's content?


|U03HJ4HULBC|:
Thanks. If the scene is truly moving super quick, where there's very little temporal information that can be reused, the result will simply not be as high resolution and anti-aliased. We do expect this to work as well as the amount of information that's present and for things to be more refined as motion slows.

|U03K19A2324|:
Thank you <@U03HJ4HULBC> for your answer. Yes, I guess this is expected! Fast moving content is always a challenge with these technologies... Once again, thank you for a wonderful, easy to watch and beautifully prepared presentation. (Really nice and illustrative clips! :slightly_smiling_face: )

--- 
> ####  Machine learning has shown great results with respect to upscaling both in terms of quality as well as performance. Do you see implementing such a functionality in MetalFX over the near future?


|U03H3GQDUP9|:
We cannot comment on particular implementation details of MetalFX framework.

|U03K19A2324|:
Thank you <@U03H3GQDUP9> for your answer. :slightly_smiling_face: I wouldn't say using ML for upscaling is an implementation detail, but rather a radically different approach to classical upscaling methods. Of course, it has its own implementation details, should one opts to actually build it (that naturally can't be shared). However, my question was about the approach itself and wether it is under consideration (and, of course, not any specifics on its implementation).

|U03J07WJLRK|:
Note that the answer is yeah, machine learning is used. you can see the models at `/System/Library/Frameworks/MetalFX.framework/Versions/A/Resources/brnet_v31_quant` . Hopefully that clarifies things a bit.

|U03K19A2324|:
Hi <@U03J07WJLRK>! Thank you very much for the reference. I will check it out! :slightly_smiling_face:

--- 
> ####  I couldn't help noticing watching the No Man's Sky clip that there was quite a bit of smearing and things looked fairly low quality on the big camera move.  Are these kind of camera moves a big concern with this technique.  I understand TAA can have issues with smearing and ghosting.


|U03HJ4DJNBD|:
Depending on the network connection you have, the video quality may be worse and lower in quality. Can you point to us on which time-stamp in the video you saw the smearing effect?

|U03J9S1L38W|:
I think I had downloaded the presentation to my iPhone and watched.  The timestamp was around 23:35, though looking at it more closely it could very well be getting destroyed by video compression.

|U03HJ4DJNBD|:
Are you maybe referring to 21:35 timestamp? The session video is 22:11 in length

|U03J9S1L38W|:
Yes, so sorry

--- 
> ####  What lab is best for asking SceneKit questions this year?


|U03H3GQDUP9|:
I think Games technologies Q&amp;A would be the best fit. Please look in the schedule to see when is the next session.

|U03J1US1SR1|:
Thank you!

--- 
> ####  What is the best way to render biplanar EDR cvpixelbuffer from avfoundation in Metal? Is better to convert pixelbuffer into mtltexture via compute, or sample from 2 mtltextures created from each plane?


|U03H3GTMSR5|:
To render EDR CVPixelBuffer contents using Metal you’d need following:
• Setup CAMetalLayer to accept EDR values using `CAMetalLayer.wantsExtendedDynamicRangeContent` property set to `YES`
• Create MTLTexture instances that shares corresponding IOSurface from CVPixelBuffer
• Use them for rendering


|U03HY66772A|:
Thanks for the explanation about EDR:)

And what about performance difference between using two planes in a shader directly, and converting it to rgb beforehand?

|U03H3GTMSR5|:
I can’t predict that to be honest :slightly_smiling_face: It might completely depend on the context and use case of your particular scenario.

|U03HY66772A|:
Ok, thanks!) I’ve thought there was a well known best practice:)

--- 
> ####  What's the best way to build a full screen game experience on the Mac? Should we still be using CGDisplayCapture? Or the AppKit full screen window support? Both seem to have pros and cons. For example: AppKit allows the menu bar to pop and for easy access. But CGDisplayCapture can use the area around the notch.


|U03J3UW6LSD|:
Using the AppKit APIs will give your users the experience they expect, especially if they have customized Spaces. Use presentation options to control things like the menu bar behavior: <https://developer.apple.com/documentation/appkit/nsapplication/presentationoptions|https://developer.apple.com/documentation/appkit/nsapplication/presentationoptions>

|U03JRP6568Y|:
Thanks! I'm having a few issues with presentation options but that seems like a lab I should book for later. :smiley:

|U03J3UW6LSD|:
Yes, please do!

Regarding the display shape, look into safe area insets: <https://developer.apple.com/documentation/appkit/nsscreen/3882821-safeareainsets|https://developer.apple.com/documentation/appkit/nsscreen/3882821-safeareainsets>

|U03J3UW6LSD|:
I just confirmed with the responsible engineering team that as long as nothing else is drawing atop your full screen NSWindow, you will be on the fastest-performance drawing path through the compositor.

|U03JRP6568Y|:
Thanks. Is there a way to display in the insets using NSWindow's toggleFullScreen? We don't need to draw in the insets, but wanted to try it as a possible full screen style.

|U03J3UW6LSD|:
You can always draw within the full size of your window. The safe area insets are informative about places where your drawing might be clipped.

|U03JRP6568Y|:
Thanks. It's possible I've configured my layout to be constrained into the safe area. I'll check it out!

--- 
> ####  Hello everybody! Is there any sample or instructions how to make offscreen render using Metal? For example: I have a scene and I want to save it as png file. How can I do it? Can I control resolution of saved file?


|U03HHP77WUB|:
To offscreen render a scene and save it as a PNG file, you may first render the scene into a MTLTexture with the desired resolution. The texture will need to be a &lt;https://developer.apple.com/documentation/metal/mtltextureusage/1515701-rendertarget
|render target&gt;.

Then there are a few different ways to get a CGImage from the MTLTexture: A quick way will be to &lt;https://developer.apple.com/documentation/coreimage/ciimage/1437890-init
|initialize a CIImage&gt; with the MTLTexture and then &lt;https://developer.apple.com/documentation/coreimage/cicontext/1437784-createcgimage
|use a CIContext to create the CGImage&gt;, which you can use to write to disk.

|U03J21F2PQS|:
Oh, thank you so much for the answer!!!

--- 
> ####  Can you leverage the screen capture API to cast data that is being rendered off screen? eg two cameras in a scene, one camera view is your ipad screen, another camera view would be streamed to apple TV. each camera are viewing different location but in the same scene.


|U03HWP445CH|:
Hi Simon, Can you elaborate a bit on what you mean by cameras and scenes? Do you mean a scene inside an app/game? Do you mean physical cameras capturing multiple feeds at once and aggregating them somewhere?

|U03JH3TKE3V|:
Scene as in a level in a game or asset in a 3D engine (MTKView), Cameras would be digital viewports/view frustums

|U03JH3TKE3V|:
Think Blender scene, with digital cameras

|U03HWP445CH|:
SCK capture comes from the display pipeline, so content thats captured must have gone through that to be eligible. Does that make sense?

|U03JH3TKE3V|:
a yeah it does, so that would not work then. Will have to read up some of the docs. Thanks for the info :slightly_smiling_face:

|U03HWP445CH|:
Yeah it sounds like you were trying to ‘save’ doing some computations, but that won’t work for this scenario :smiley:

|U03JH3TKE3V|:
cut corners where you can :smile:

|U03HWP445CH|:
it makes sense if you were trying to show say, ‘behind me’ or maybe a companion VR viewer for the non immersed person, etc, so we feel ya :smiley:

Its an interesting use case, feel free to log a Feedback requesting an answer for the high level problem so we can take a look !

--- 
> ####  I'm sorry, I wasn't able to watch the video, so just wanted to confirm: with ScreenCaptureKit we're able to capture the mixed system sound, or filter in or out the applications that we want or don't want to include, right? For example capture sounds from my own application + Zoom call already mixed for us, basically replacing things like Blackhole + Multi-Output/Device etc?


|U03HF6TL5L5|:
Yes, absolutely! In this case, you might want to use `init(display:excludingApplications:exceptingWindows:)`, where you can capture all audio, excluding the applications that you don't want in the audio.

--- 
> ####  CARenderer was not previously available on iOS (only macOS). But Xcode 14 and docs on the web now show it as available since iOS 2.0!  <https://developer.apple.com/documentation/quartzcore/carenderer?changes=latest_minor|https://developer.apple.com/documentation/quartzcore/carenderer?changes=latest_minor>  Is this a mistake, or is it now available to older devices if built with the iOS 16 SDK?


|U03J3UW6LSD|:
It’s not a mistake, and the availability annotations are correct! CARenderer is available on all devices. You can back-deploy your code built with the iOS 16 SDK to devices running older OSes.

|U03HVCCH5KQ|:
That’s great news! (But no wonder I was so confused yesterday..!) Thanks

|U03JELM0ZNV|:
Does the *Overview* need a bit of editing then?
&gt; For real-time output you should use an instance of `NSView` to host the layer-tree.


|U03J3UW6LSD|:
Good catch! Please file Feedback about the documentation :slightly_smiling_face:

--- 
> ####  what is the fastest way to get something on screen with Metal? is there way to draw directly to screen instead of metal layer contents and then wait for frame composing?


|U03J3UW6LSD|:
The fastest way to get your drawing on-screen is to create a full-screen CAMetalLayer. You can also optionally set `displaySyncEnabled` to false on your layer to render faster than the display’s refresh rate at the cost of potential artifacts.

|U03HJ3XEC75|:
Be sure to take advantage of a ProMotion display if the user has it, too! You can set a minimum and maximum CADisplayLink callback rate using a CAFrameRateRange, for instance.

--- 
> ####  Might anyone be able to speak to whether it makes sense to combine indirect command buffers (<https://developer.apple.com/documentation/metal/indirect_command_encoding/encoding_indirect_command_buffers_on_the_gpu?language=objc|https://developer.apple.com/documentation/metal/indirect_command_encoding/encoding_indirect_command_buffers_on_the_gpu?language=objc> ) with bindless rendering *and* dynamic data? Specifically, I am trying to avoid a lot of draw calls. With the SOC architecture, it seems passing data is not really expensive, so I figure per-frame I could just specify some parameters and generate draw calls on the GPU, as in the example.  -broad question, I realize, but I'd appreciate some thoughts on how to reduce draw calls for rapidly-updated and/or deleted vertex data.  I also checked mesh shaders, but I think those are overkill for my use case.


|U03HJ4DKK50|:
Hi Karl! Metal 3 adds support for starting raytracing work from ICBs. ICBs give you more flexibility at rendering time, but this flexibility does come with a cost that will vary according to your specific use case. For example ICBs will give you the edge when you are CPU-bound. As with all things related to performance, we recommend you profile your game (or app) :slightly_smiling_face:

|U03JWBY2PH8|:
Hi! Thanks for the reply, and I agree I should always profile. To clarify, I’m not doing raytracing, so perhaps this is pre-optimization, but while WWDC is happening, I thought I’d ask a follow-up question:

Since you mention ICB-use cost, what would you say the common tradeoffs are with ICBs?
Also, do you imagine them working well with bindless rendering?
For example, let’s many textures and my entire scene in a buffer within an argument buffer.
Would it then make sense to use an ICB to issue draw calls on the scene stored that way?

However, I suspect that ICBs and bindless are orthogonal.

Thanks again for your time!

--- 
> ####  When will the activity feed be available?


|U03H3GTJF0F|:
The activity feed is available today in iOS/iPadOS/tvOS 16 beta and macOS Ventura beta. :video_game::star2:

--- 
> ####  Hello! :wave: Playing around with the new ScreenCaptureKit I'm experiencing problems with TCC, revoking access to Screen Recording while the app's running  (domain: com.apple.ScreenCaptureKit.SCStreamErrorDomain, code -3801 message: "The user declined TCCs for application, window, display capture"). Confusingly, when my app launched it did have the proper access.  Anyone around knowing under which special circumstances the system may suddenly revoke access to Screen Recording for an already running app?


|U03HF6TK2J1|:
There shouldn’t be any reason why an app has their Screen Recording tcc revoked - besides the user denying the app permission. Could you please file a feedback request, with full steps to reproduce the issue? :slightly_smiling_face:

|U03K0FHV4M8|:
That was my impression, too. Thanks for clarifying, <@U03HF6TK2J1>! Unfortunately, there doesn't appear to be a clear pattern to this. Usually, it just takes some time of the app sitting around to get the revocation suddenly, maybe an hour or two. Does it have anything to do with the process being a Service Management Login Item and LSUIElement=1 background process?

|U03HF6TL5L5|:
It's hard for us to say for sure. But in lieu of a reproducible case, a sysdiagnose shortly after the time of the issue should help us figure out what might have caused it!

|U03K0FHV4M8|:
I see, well then I'll file the bug report, thank you. Amazing new API by the way, I'm sure lots of developers are going to benefit greatly from it. :slightly_smiling_face:

|U03HF6TK2J1|:
Glad you like the new framework!

--- 
> ####  Hey all! Question is related to SceneKit + UIView / SwiftUI view layers. There has been some historical functionality allowing the layers of views *not* presented in a typical hierarchy to be presented as the material contents of geometries like SCNPlanes. One example is this repo here: <https://github.com/sarangborude/SwiftUIARView|https://github.com/sarangborude/SwiftUIARView> . Unfortunately, the technique here doesn't seem to work anymore a couple of years later. I'm wondering what might be possible to bring this back to usage, as I have a TON of use cases I'd love to explore with this! Thank you so much as always!


|U03H3GPSE6B|:
Hi <@U03JRPTDF6U> I'm not seeing why SceneKit + SwiftUI shouldn't be working in this situation still. If you have a moment and can submit to <https://feedbackassistant.apple.com> and reference that GitHub project, it would be great for us to get this to the right folks inside Apple. If you do this soon and can post the FB number back here, that would help me make sure it routes.

|U03JRPTDF6U|:
<@U03H3GPSE6B> Heya, and thanks for the good news, haha! I’ll file it right now and add some more information about what I’m trying to do. Also, this repo is a great resource as a sample, but I’m curious if there might be some tighter documentation about _how_ this is working? For example, there’s some fun magic happening in the hosting of the controller and when it gets added, and I think at least part of my issue is I’m not mimicking the pattern correctly.

|U03JRPTDF6U|:
Also, here’s that Feedback!
`FB10141722`

|U03H3GPSE6B|:
thank you!

|U03JRPTDF6U|:
Of course. And hey, in the mean time, might you know of any docs that might be related to this? I’m thinking of giving this another go soon, hehe. Happy to sit back and relax though to hear from the Feedback side :smiley:

--- 
> ####  For a relatively simple game (low poly graphics, simple textures, no AI), which framework would you suggest I use to develop in Swift? All logic would be custom, so no need for scripts library or similar features. SceneKit seems like an obvious choice as it has the functionality I need, but I'm not sure how actively it is still being maintained and supported?


|U03H3GPSE6B|:
Hi <@U03HMCD9UQ7> If SceneKit is a good fit for your needs, it's a great choice! It is still being maintained and supported. If in the future you outgrow its functionality, you will have learned a lot of key parts of dealing with transforms, models, and geometry which you can use if you want to drop down to Metal and ModelIO, or move up to a higher-level framework or tool.

|U03JZ2H3NNR|:
On the topic of maintained and supported, should we assume SpriteKit is also still supported and maintained?

|U03JZ2H3NNR|:
Main reason I am asking is because I have submitted quite a few SpriteKit-related issues through Feedback Assistant, and I have not received any feedback at all on any of them.

|U03JELM0ZNV|:
I *dearly* hope so as SpriteKit is core to my app. I add touches and logic and page layout on top but it's all SK, all the way down.

|U03JZ2H3NNR|:
Hoping for an answer to this, I will tag <@U03H3GPSE6B> . Nat, can you please check the previous 3 replies here, regarding SpriteKit? Thanks.

|U03JELM0ZNV|:
<https://github.com/AndyDentFree/SpriteKittenly> is where I post my SpriteKit explorations of tech, following my philosophy of having lots of little test apps, as useful regression checks.

|U03H3GPSE6B|:
Sorry for the slow reply - yes SpriteKit is still maintained and available! 

|U03JZ2H3NNR|:
Thanks Nat. This is good news. I hope for maybe a little bit more maintaining in the future, maybe some of the reported bugs in the Feedback Assistant can be looked at. Thanks again!

|U03JELM0ZNV|:
Hey <@U03JZ2H3NNR> do you also publish your bugs in somewhere open to the rest of us non-Apple employees to see? I ran into a doozy with SpriteKit that was (strictly speaking) my bug but was encouraged to lodge a Feedback when I discussed with an engineer during the Tech Talks last year, as _that is such weird behaviour we should probably try to fix it anyway_. (:blush: at realising it's been a few months &amp; still haven't lodged that).
You can read the entire saga <https://medium.com/touchgram/oops-hitting-a-5yo-apple-bug-17d2703519f4>

|U03JELM0ZNV|:
Given my massive dependency on SpriteKit I'd like to know about any and all lurking gremlins :pray:

|U03JZ2H3NNR|:
<@U03JELM0ZNV> Yes, I usually publish them on both Dev Forums and StackOverflow. You can see some of them here: <https://developer.apple.com/forums/profile/calin>

I have more but to be honest I kinda gave up reporting them because, like I said, I am not getting any feedback, so it seems like a waste of my time, as it does take some time to file a properly documented bug report.
Instead I am simply trying to work around them.

I was thinking to maybe try on Twitter too. My twitter is @upurupu if you want to keep in contact.

|U03JZ2H3NNR|:
I'll definitely read your Medium post.

|U03JZ2H3NNR|:
For example, one bug I was hoping will get fixed (maybe it was, haven't tried it yet), is that `isPaused`, when passed to a `SpriteView` , doesn't seem to affect the state. See <https://stackoverflow.com/questions/69610165/spriteview-doesnt-pause-scene-on-state-change/69610906#69610906>

|U03JELM0ZNV|:
Great, will stay in touch. I

|U03JELM0ZNV|:
am very active on Twitter as @andydentperth

|U03JELM0ZNV|:
I have yet to get into SwiftUI as my app is iOS12+ so all UIKit but am just on the cusp. Thanks to feedback this WWDC will be trying to host SpriteKit for _some_ screens. Just got a demo going with SwiftUI working inside an iMessage app extension at <https://github.com/AndyDentFree/im-plausibilities/tree/master/imUrlDataAppSUI>

--- 
> ####  Is there a way to send a raw MTLTexture or a specific view to ScreenCaptureKit, or some lower-level API related to it? For example, let's say I have a real-time graphics application written using Metal, and I want to stream content containing only audience-relevant elements in my scene, rendered to one texture.  I broadcast that texture. In another renderpass, I composite some diagnostic info only relevant to me locally that I don't want to share with others.  How might this be achieved? It's a use case I keep running into (asymmetric views and perspectives.)  Going even further, maybe I am developing a game and I want to render a completely different perspective in my scene from a different camera. I send that texture to the stream, but maybe I render from a different perspective locally.


|U03HWP445CH|:
Hi Karl,

SCK is dependent on the display pipeline so the content needs to be rendered before it can be captured.

|U03JWBY2PH8|:
Ah, I see, so it sounds like I’d need to roll my own solution for something along the lines of what I described.

|U03HWP445CH|:
We discussed this a little bit yesterday too, in <https://wwdc22.slack.com/archives/C03H77PER5G/p1654728707927069>

|U03HWP445CH|:
You should log a <https://developer.apple.com/bug-reporting/|feedback> detailing your use case so we can consider it for future improvements!

|U03JWBY2PH8|:
Will do!

|U03JH3TKE3V|:
<@U03HWP445CH> Thanks for the link, I was to late yesterday to ask where I should submit the use case

|U03JWBY2PH8|:
<@U03HWP445CH> <@U03HZ4EJJ05> I wrote this hopefully compelling argument: FB10143711 (ScreenCaptureKit Suggestion: Selective streaming of textures for Asymmetric Views)

|U03HWP445CH|:
Thanks! We've got it

--- 
> ####  Would ScreenCaptureKit be appropriate for a remote desktop/screen sharing application?


|U03HWP445CH|:
Hi <@U03HZ4HF31T>, yes it would be appropriate! Did you have some specific scenarios you were concerned it might not accommodate?

|U03HZ4HF31T|:
Just looking at something that would provide better performance than vnc (not difficult!) and add audio for remote working on a mac. Obviously keyboard/mouse input would need to be handled seperately.

|U03HWP445CH|:
Screen sharing is not quite the same use case as bi directional content flow. Handling where the mouse is, capturing input and passing it back would require a not-insignificant amount of work

|U03HWP445CH|:
To split your question, it would be appropriate for screen sharing but more challenging for VNC where you want to interface with the source from the destination

|U03K0FHV4M8|:
Since audio was mentioned too, I'm assuming it's still a quite tough challenge to be able to capture the system's audio, right? May require writing an own low-level driver for it?

|U03HWP445CH|:
No, you can get system or app audio!

|U03HZ4HF31T|:
ScreenCaptureKit can include system audio as well I believe.

|U03HZ4HF31T|:
Ahh beat me to it!

|U03K0FHV4M8|:
wait what...? :flushed: I must've missed that part of the API

|U03HWP445CH|:
You can include or exclude apps and capture all system audio.

<https://developer.apple.com/documentation/screencapturekit/scstreamconfiguration/3955572-excludescurrentprocessaudio>

|U03HWP445CH|:
The session also covers these use cases with specific examples

|U03HWP445CH|:
<https://developer.apple.com/documentation/screencapturekit/scstreamconfiguration/3955571-capturesaudio>

|U03HZ4HF31T|:
Given the amount of work required, I may provide feedback and hope/pray that the built in macos remote desktop will add audio!

|U03HWP445CH|:
<@U03K0FHV4M8> Its much requested and long awaited, we are thrilled its surprising and delighting you :smiley:

|U03K0FHV4M8|:
amazing! it doesn't allow capturing only the audio from one app though, does it?

|U03HZ4HF31T|:
It does I believe.

|U03HWP445CH|:
Yes, it allows you to specify just a single apps audio as well. <@U03HF6TL5L5> covers this use case specifically near the end of the session

|U03HWP445CH|:
If you wanted to say, exclude a games audio and include your friends chat audio from another app, SCK would support that use case

|U03HWP445CH|:
If you think about a capture session as being "audio, video, or both" you can setup a capture for a process and just drop the frames, making it an "audio only" capture.

|U03K0FHV4M8|:
I'm blown away by this. We've all been waiting soooo long for this and now it's finally here. :pray::heart:

|U03HWP445CH|:
If you don't set `capturesAudio` you have a video only capture and if you set it, you get both!

|U03K0FHV4M8|:
really cool! thanks for all the explanations :stuck_out_tongue:

|U03HZ4HF31T|:
The framework looks great. Congratulations on your hard work!

|U03HZ4HF31T|:
And thanks for your help.

|U03HWP445CH|:
Then its just how you want to combine "including" or "excluding" the calls like

<https://developer.apple.com/documentation/screencapturekit/sccontentfilter/3919807-init>

|U03HWP445CH|:
that lets you narrow in on what you want depending on your use case

|U03K0FHV4M8|:
Are the docs going to be updated soon or why am I missing these audio APIs you're talking about there somehow?

|U03HZ4HF31T|:
There is a sample project and videos that should help.

|U03HWP445CH|:
When you go to <https://developer.apple.com/documentation/screencapturekit> and at the bottom search for "Audio", do you not see those results?

|U03HWP445CH|:
The <https://developer.apple.com/documentation/screencapturekit/capturing_screen_content_in_macos|sample app> also includes Audio

|U03K0FHV4M8|:
Well, I can see the functions about whether to capture audio, exclude the current process and the audio stream output type but not how I would exclude/include certain apps

|U03K0FHV4M8|:
ah wait, those are not part of the ScreenCaptureKit API?

|U03HF6TL5L5|:
Audio capture follows similar rules to video capture, however audio capture is at an application level. So your selection will have to be application-based.

|U03HWP445CH|:
<@U03K0FHV4M8> You'd use the SCContentFilters for that

`init(display:excludingWindows:)`
or
`init(display:excludingApplications:exceptingWindows:)`

|U03K0FHV4M8|:
ahh, I think I got it now :grin::see_no_evil:

|U03HWP445CH|:
The team notes "Excluding a window will exclude all of that apps audio" as a FYI

|U03K0FHV4M8|:
that was the missing info, thanks!

|U03HF6TL5L5|:
Yeah. I think Meng talks about this a bit in the "Take ScreenCaptureKit to the next level" WWDC talk, if you want to double check your understanding.

|U03K0FHV4M8|:
Will definitely do

--- 
> ####  I have a classic "dumb question" - is ScreenCaptureKit the macOS equivalent of ReplayKit? I want people to be able to create _reaction videos_ of them playing touchgrams, which is running on SpriteKit.


|U03H3GXFRSB|:
Hi Andrew! No question is "dumb"!

|U03H3GXFRSB|:
So ReplayKit is also on macOS!

|U03H3GXFRSB|:
but there are a lot of differences between ReplayKit and ScreenCaptureKit. ReplayKit has several features that aren't in ScreenCaptureKit, including broadcast extensions, Clips, and built in movie recording for in app use case

|U03H3GXFRSB|:
Where ScreenCaptureKit differs is in its ability to capture far more content. ScreencaptureKit allows more than just in-application capture. It was designed to give you performant capture with custom filters for applications outside of your own

|U03JELM0ZNV|:
So if you wanted someone to be able to capture video of their reactions (maybe using an iPhone clipped to the top of their laptop :wink: ) as well as playing a game experience, which would you use?

|U03H3GXFRSB|:
ReplayKit has built in support for camera! so if you wanted to record just the singular application and their camera, you can do that with replaykit

|U03H3GXFRSB|:
you could also do the same with screen capture kit as well!

|U03H3GXFRSB|:
using AVCaptureDevice to get camera frames, you can get a custom filter of the content you want (more than 1 application) and then get the frames from the camera and using metal you can put them together and render that as well :smiley:

|U03HF6TL5L5|:
Though you'd need something else for the camera capture part if you were using SCKit. Right, Johnny?

|U03H3GXFRSB|:
correct <@U03HF6TL5L5>! you'd have to run an AVCaptureDevice (camera) to get frames from there

|U03JELM0ZNV|:
All the user experience would be happening inside SpriteKit with audio playing via AVAudioPlayer
(audio is in response to user actions, gestures, tapping parts of message, whatever has been specified by the original message author - it's user-generated content so utterly random)

Is that likely to that break recording?

|U03H3GXFRSB|:
not at all! ScreenCaptureKit and ReplayKit allows you to capture the applications audio, even if its played via AVAudioPlayer

|U03H3GXFRSB|:
you'll get the application audio

|U03JELM0ZNV|:
(I should just stop before the _outstanding issues_ count on the tracker of _every bright idea ever_ passes 1K)
but
is this robust with *multiple* players?
Someone can have one or more background looping sounds start on entering a page and then have more short ones in reaction to touches - feels like I'm going to be pushing boundaries.

I have a suspicion that making it easy for people to share videos of their play experience could be a huge accelerator, so this tech niggles at me :star-struck:

|U03H3GXFRSB|:
is this local multiplayer?

|U03H3GXFRSB|:
or the multiplayer instance played remotely?

|U03JELM0ZNV|:
"Multiple players" is multiple sound players, sorry for the ambiguity. *Not* _game players_

|U03H3GXFRSB|:
ahh got it, okay, and are these sound players coming from the same process?

|U03H3GXFRSB|:
and by same process, I mean the same application process to which you are attempting to capture the video ?

|U03H3GXFRSB|:
ReplayKit will only capture your applications audio, so if your application has several avplayers instances but its all in the process, ReplayKit will capture that audio for you

|U03JELM0ZNV|:
Yes - Touchgram runs on top of SpriteKit with a document model where the message sender composes the experience, which can be utterly driven by what they want to do - think of it as a game authoring toolkit - meets Keynote - inside a message.

The playback experience might be the person sending the message or, more likely, the receiver.

Currently (deep breath), playback is only within iMessage as an app extension, which may complicate the ReplayKit scenario.
However, it's relatively trivial to also have playback in the accompanying _parent app_ and I'll be adding that soon.

|U03JELM0ZNV|:
So _inside one process_ is kinda true but as an app extension may have nuances

|U03H3GXFRSB|:
ahhh okay, so if its coming from an app extension, then it will not get captured, as extensions are run as a separate process

|U03HF6TK2J1|:
App extensions should have their own process, and that won’t be captured

|U03H3GXFRSB|:
it sounds like your application is built for iOS?

|U03JELM0ZNV|:
It's an iMessage app extension but all the playback stuff plays on macOS as well. Although it's touch-driven, it's single-touches most of the time so is usable via mouse

|U03JELM0ZNV|:
I'm planning to move to SwiftUI so started considering a Mac version :innocent:

|U03H3GXFRSB|:
ahh okay! so ScreenCaptureKit is only for macOS

|U03H3GXFRSB|:
it looks like the best fit for your application is in fact ReplayKit, you'll the audio from different processes / bundleID will not be captured

|U03JELM0ZNV|:
Thanks for the clarification, and inspiration

|U03H3GXFRSB|:
you are most welcome!!

|U03K0FHV4M8|:
<@U03H3GXFRSB> Hey Johnny, it's Tobias from the one-on-one session today about AVAssetWriter producing corrupted files (the Teams related app). :wave: Thank you so much again for sharing your expertise with me and answering all of my questions.

|U03K0FHV4M8|:
<@U03H3GXFRSB> I think I've figured out what the issue was. Turns out that I was attempting to append a sample buffer with the same CMTime twice due to time rounding reasons in the asset writer. Changing the timescale from 600 to something larger so far seems to have resolved the frame dropping entirely but as you've suggested I'll keep the check about whether the time of the last frame was before or equal to the current one in there just to be sure. In case you still see this, do my explanations make any sense to you? Either way, it was awesome talking to you. :nerd_face:

|U03H3GXFRSB|:
<@U03K0FHV4M8> yay! Im sooo happy you were able to figure it out after our talk!!

--- 
> ####  I want to record the whole screen but I keep getting the microphone active orange dot in the recording. How can I make a recording of a screen using ScreenCaptureKit without the orange dot?


|U03HWP445CH|:
We are aware of feedback around the orange dot. ScreenCaptureKit adheres to the same system privacy and security requirements of other capture methods.

|U03JEMGKNDP|:
OK thank you!

--- 
> ####  Can ScreenCaptureKit capture an 'off-screen' window?– as in, if I wanted to capture some visuals that normally show in a window (1920x1080) in my app, but there's no need to show the user (because they just care about the /resulting/ captured output)  &amp; if so: does that seemingly /make sense/ as a use of SCK, or are there more 'direct' methods for 'app-internal' view capture you'd suggest instead?


|U03HWP445CH|:
Hi! If you mean offscreen (but rendered), yes SCKit can capture it.

|U03HWP445CH|:
If you mean something more like non rendered content like we discussed <https://wwdc22.slack.com/archives/C03H77PER5G/p1654817389344279|here>, then no

|U03HWP445CH|:
If you drag a window partially offscreen, SCK can get the "off screen" content in its capture.

|U03HWP445CH|:
Is that what you were after?

|U03HWP445CH|:
If you want what the other thread discussed, be sure to log a feedback requesting it!

|U03JEEUJPMJ|:
Yep, it was! Thanks

(I just remembered the one-time permission requirement, which would probably confuse the user for my use-case, as they wouldn’t expect my app to be ‘recording the screen’ as such, so I’ll do some Googling on existing ‘app-owned’ window/view capture options, if any)

|U03HWP445CH|:
Your own app should have access to its own content without TCC permissions

--- 
> ####  When I use `SCContentFilter.init(desktopIndependentWindow:)` in ScreenCaptureKit, the popup buttons, contextual menus, sheets that appear on the window are not captured. Is there any way to capture them in ScreenCaptureKit?  Previously, I implemented using `CGWindowListCopyWindowInfo([.optionIncludingWindow, .optionOnScreenAboveWindow], windowID)` and `CGImage.init?(windowListFromArrayScreenBounds:, windowArray:, imageOption:)` API, but I would like to know how it is possible in ScreenCaptureKit.


|U03HF6TL5L5|:
Additional pop-over items like these will not be shown with `init(desktopIndependentWindow:)`. If you would like to capture these, you should use an application-based capture. However, please submit a feedback request for this enhancement if you would like to see these inside of `init(desktopIndependentWindow:)`. How would you prefer the capture handle things like context menus that exceed the bounds of the window?

--- 
> ####  I'd like to use Reality Composer (in the new Xcode) to generate simple USDZ shapes, then use the new Reality Converter to re-texture these shapes (because Reality Composer cannot add custom textures). In Reality Composer, you have to enable USDZ export in Preferences, but when I export a simple box to USDZ, Reality Converter cannot open it (Conversion failed: 1 error, which is unexpected/unknown). Is there a secret way to make this work?  (Thanks for leaving questions open — I'm in Australia. I realise this not quite the right forum for this, but the right forum hasn't left questions open, and it's open around 2-3am my time.)


|U03J7T89SQG|:
Hi, I tried to reproduce the error as you described. This was the order of steps:
• Create a new project in Reality Composer using the horizontal anchor.
• Turn on "Enable USDZ export" in the settings. 
• Export the project to USDZ format
• Open a Finder window and double-click the exported USDZ file.
If this does not work, would you file a Feedback Assistant?

--- 
> ####  In HLSL Texture2d and Texture2d_array are treated almost the same i.e. texture2d can be used instead of array one. However in metal the type is much more strict. Does it mean that the only way in Metal is to create respected texture view to convert types? The texture view looks to be performance hit :(


|U03HJ3XEC75|:
Texture views allow you to use a single texture backing with more than one format (i.e. RGBA8 and RG16). When a texture is marked with the “view” option this can result in lossless compression being disabled. Can you explain in a little more detail what performance hit you are seeing?

|U03JEF2NVQV|:
I actually don’t need to change format

|U03JEF2NVQV|:
let’s say my shader always accepts only texture2d&lt;float&gt;

|U03JEF2NVQV|:
then to push their texture2darray texture I will need to ‘slice’ it in slices

|U03JEF2NVQV|:
even if I need always a zero slice

|U03JEF2NVQV|:
it works btw though validator complains

|U03JEF2NVQV|:
and by ‘slice’ I mean I need to make X slices of texture2d type

|U03JEF2NVQV|:
and then pass that slice

|U03JEF2NVQV|:
the perf hit is the necessity to slice the texture

|U03JEF2NVQV|:
and disable of tex compression

|U03HJ3XEC75|:
Ah, so you wish to use a single slice of a texture2d array – is it the requirement in MSL of putting Texture2D or Texture2DArray that you are bumping into?

|U03JEF2NVQV|:
yes

|U03JEF2NVQV|:
HLSL allows you to push texture2darray into texture2d in shader

|U03JEF2NVQV|:
<https://docs.microsoft.com/en-us/windows/win32/direct3d12/resource-binding-in-hlsl>

|U03JEF2NVQV|:
the problem is that engine we’re porting uses mixed texture2d and texture2d_array types all around

|U03JEF2NVQV|:
and in shader there is just texture2d

|U03JEF2NVQV|:
and of course validator coughs

|U03JEF2NVQV|:
may be there is some hidden trick to push tex2d_array slice as tex2d :wink:

|U03HJ3XEC75|:
Hold tight so we can get a proper answer!

|U03HJ3XEC75|:
(or ask more questions :slightly_smiling_face:)

|U03JEF2NVQV|:
sure thing

|U03JEF2NVQV|:
the alternative is to make an array of slices for each tex2d_array

|U03JEF2NVQV|:
I’d really want to avoid this but..

|U03JEF2NVQV|:
array of slices obtained by textureViewing..

|U03HJ3XEC75|:
Do you happen to have the print out of the validation layer for your use case so I can make sure I’m looking at the same path?

|U03JEF2NVQV|:
Basically it says wow wow wow you have MTTextureType2D_Array and in shader we have texture2d

|U03JEF2NVQV|:
Sorry indeed I don’t have exact line

|U03HJ3XEC75|:
Ha no that was perfect.

So I did confirm, because there is no reinterpretation of the pixels with taking a single slice of an array, `MTLTextureUsagePixelFormatView` should *not* be required!

|U03JEF2NVQV|:
oh nice!

|U03JEF2NVQV|:
hope validator won’t bark

|U03JEF2NVQV|:
so you think going ‘array of slices’ is the only way :wink:

|U03JEF2NVQV|:
the thing is - without validator it works fine!

|U03JEF2NVQV|:
i.e. shader texture2d and tex2d_array as input

|U03JEF2NVQV|:
it shows first slice

|U03HJ3XEC75|:
I was thinking about the idea of having the shader always take an array, too, and just passing in a single entry array, but I don’t know how your shaders might get duplicated or used.

|U03JEF2NVQV|:
and vice versa too!

|U03HJ3XEC75|:
So you only need to use array entry 0 ever?

|U03JEF2NVQV|:
sometimes nope

|U03JEF2NVQV|:
by 90% of time yes

|U03HJ3XEC75|:
Got it. To be clear, you still need to make a Texture View with slice N, but you don’t have to set the `MTLTextureUsagePixelFormatView` bit,

|U03JEF2NVQV|:
all righty!!

|U03JEF2NVQV|:
hope views are cheap

|U03JEF2NVQV|:
it’s interesting whether I can do some tricks with new arg buffers

|U03JEF2NVQV|:
to offset the GPU address of texture

|U03HJ3XEC75|:
Should be good performance without any interpretation. And as implied above, if there is pixel interpretation then you lose things like lossless compression (which is what the PixelFormatView option is for).

|U03J7T89SQG|:
You can always find out which textures don't have the lossless compression in your GPU capture, by right clicking on the table header and choosing Texture-&gt;Lossless Compression when you're in the Memory view.

|U03J7T89SQG|:
Normally it shows Label, Insights, Type, Allocated Size, Storage Mode, Purgeable State, CPU Access, and Time Since Last Bound

|U03J3RYQ9V1|:
&gt; to offset the GPU address of texture
If I understand correctly the intent, offsetting the GPU address of a texture won’t work in most cases and it’s generally not recommended. Creating views is the way to go

|U03JEF2NVQV|:
Yeah :slightly_smiling_face: I understand it’s just fun to have GPU address finally

|U03J3RYQ9V1|:
&gt; hope views are cheap
Yes, creating a view is extremely cheap: there’s no memory allocation / mapping, no trip to the kernel, etc.

|U03JEF2NVQV|:
Like in GNM

|U03JEF2NVQV|:
Having GPU pointer writing to arbitrary addresses, having Mac borked completely.. Fun!

|U03JEF2NVQV|:
Still waiting btw for major tech breakthrough gents on your side

|U03JEF2NVQV|:
2022 is not a year for Metal to be able to kill mac in 1 second :wink:

|U03JEF2NVQV|:
and right now I can do it easily

|U03JEF2NVQV|:
Windows manages to survive

|U03J3RYQ9V1|:
In theory we have mechanisms to recover from a GPU crash pretty quickly. Also, we have mechanisms to handle some undefined behaviors more gently so we don’t even need to crash at all

|U03J3RYQ9V1|:
I’m specifically talking about Apple-Designed SoCs though

|U03JEF2NVQV|:
yeah I understand

|U03JEF2NVQV|:
still I code Mac games all days and I use eGPU btw

|U03JEF2NVQV|:
just because it allows me to survive GPU external crashes

|U03JEF2NVQV|:
but indeed hard crashes are so much better analysed on Apple Socs

|U03JEF2NVQV|:
and yeah I think eGPU with Apple Soc is a good idea :wink:

--- 
> ####  I've just moved from my old and hot Intel iMac, to an M1 Max MacBook Pro, which I'm loving! One snag - our games still run on OpenGL ES, but the iOS Simulator on Apple Silicon seems to crash when executing OpenGL ES commands. Is it Game Over? Do I finally need to move to Metal?


|U03HLFHLASY|:
Hi David! This is not expected. Please submit a report using the Feedback Assistant app and we’ll take a look. Thank you!

--- 
> ####  First, thanks for all your hard work and cool new APIs!  I watched "Meet distributed actors in Swift", and I'm curious if there's currently a way to use distributed actors in a peer-to-peer GKMatch?


|U03J3UW6LSD|:
Hi <@U03HMD2BP55>! I believe using distributed actors with GKMatch will have to wait until Swift actors support custom executors. But I encourage you to ask the friendly folks in the Swift lounge for a more authoritative answer!

--- 
> ####  Hey there! Here's a basic one, with some context: I'm a mobile developer working for about a decade in the space, and I have very little experience with high-fidelity graphics and their libraries. I am highly interested in learning C++, especially to interact with the new metal-cpp tools. My question is, would the metal-cpp examples shared here in this lounge be a good starting point into learning enough C++ to be productive with Metal? Or, is there a better starting point that may be a more gradual or helpful introduction to the tools? I don't mind hitting the ground running so to speak, just curious to see what paths are most suggested for this! Thank you!


|U03HJ3XG351|:
Hi - let's chat a bit. I'm curious to know what languages you already have familiarity with - do you have experience with Objective-C++?

|U03JRPTDF6U|:
Cheers Jared!

I unfortunately _don’t_ have experience with Obj-C++, but I do with straight Obj-C from the pre-Swift years, heh. I also have a glancing familiarity with -C-like languages, but that’s mostly syntactic pattern recognition over function (“oh, that thing is accessing a pointer, that’s updating a field..“)

|U03HJ3XG351|:
Ok, interesting. Well, as I'm sure you've seen there's a ton of resource for learning C++. If you're used to Obj-C, I think you'll understand the basic concepts pretty quickly.

The reason I ask is because Metal is natively implemented as an Objective-C API. What's nice about Objective-C++ is that inter-op with C++ is super easy. Basically, you just rename your `.m` files to `.mm` files and you're using Objective-C++. You can now include C++ headers and start playing immediately.

Now, if you really want to use Metal-cpp I don't want to discourage you at all. It's great to see developers interested. I think it's worth noting, though, that if you want to go the 'pure' C++ route, you'll likely need to end up wrapping some of our other platform libraries which are exposed as Obj-C or Swift.

|U03JRPTDF6U|:
Ahhhh… I’m seeing the boundary lines a little more clearly now. This makes a lot of sense. It seems like the learning path would be C++ -&gt; [metal-cpp + interop wrapping], which isn’t too bad at all.

I have a really, really limited scope that I’d like to try out first. Like, really limited: just rendering a plain ol’ plane with a bunch of backed textures that act like a text font, and using the geometry bounds and coordinates to make the final mesh of an object animated.

Backing up a bit, with more context, I currently have a working prototype in straight SceneKit land where my flow is essentially render a bunch of sibling nodes, flatten the hierarchy into a single mesh, and then keep the old nodes around when I want to do things like animate highlights and movement.

My hope is that by picking up even some core metal-cpp, I’ll be able to reach into the rendering fundamentals to get that basic use case down, with the bonus being more power under the hood for more complicated use cases down the road :wink:

|U03J3UW6LSD|:
You don't necessarily need to adopt metal-cpp. You could continue interacting with Metal via its native Objective-C interface, but use C++ to integrate with other libraries from the same Objective-C++ source file.

|U03JRPTDF6U|:
Here’s a quick shot: the one of the left is in ‘flatten’ mode, with a single node that was flattened from a few hundred. The one on the right is in ‘glyph’ mode, where each node is rendered separately.

|U03JRPTDF6U|:
<@U03J3UW6LSD> That’s a really good point - I _could_ use the Obj-C interface! Since that’s the core, it almost seems like it makes _sense_ to start with that first since the cpp lib is a tight wrapper around it.

|U03HJ3XG351|:
I think that would also make learning Metal a little easier. We do have some metal-cpp examples, but there are years of ObjC Metal resources out there. Maybe start with ObjC Metal, then move to Metal-cpp if you want that 'all one language' feeling.

|U03JRPTDF6U|:
I think I’ll do just that. I really appreciate the words of wisdom here - I was all ready to start down a quite intensive path, haha!

|U03JRPTDF6U|:
If I may while I have an eye or two from ya, and just off the top of your head, no pressure: what sorts of primitives do you think I should be looking into to replicate this kind of behavior like the one above?

In terms of triangles, meshes, texture coordinates, animating mesh coordinates, that kinda thing.

|U03J3UW6LSD|:
I’m biased because I’ve spent years working with Apple’s text rendering engine, but: I recommend using an actual text engine like Core Text or TextKit 2 to render to a texture. Lots of simplifying assumptions that hold true in English don't hold true across all languages.

Another really interesting option is <http://sluglibrary.com|Slug>, which does correct Unicode rendering entirely on the GPU. But I don’t know if there’s a trial option.

|U03HJ4DKQRY|:
I would recommend you to take a look at the LearnMetalCPP samples(<https://developer.apple.com/metal/LearnMetalCPP.zip>). It’s written in metal-cpp but it provides a series of incremental graphics samples which can help you learn graphics and Metal from scratch, e.g draw a triangle, cube, texture etc.

|U03JRPTDF6U|:
&gt;  Core Text or TextKit 2 to render to a texture
<@U03J3UW6LSD> This 1_000x over! I would absolutely love to do something like this.. at the moment, I quite literally just create a `CATextLayer` with a single string character and render it out into a bitmap :sweat_smile: I’ll start taking a look at those two kits to see what I can break, haha. I’d need to render the text, and then understand the placement of those glyphs as they’re rendered to make sure I can move them individually in space.

<@U03HJ4DKQRY> You got it - this was the original reason I had the thought to try it, in that it seemed like it had that gradual build up of domain knowledge, through the lens of a different language. This might be a weekend project, haha.

--- 
> ####  Question re Core Media IO Extension. How the host app can communicate with the extension? Can host/extension exchange IOSurface for example?


|U03J3UW6LSD|:
What kind of information are you hoping to communicate? There might be a better lounge for this question.

|U03J3UW6LSD|:
If you're trying to send video frames, the supported way to do that is `CMIOExtensionStream`.

--- 
> ####  Just want to say HUUUGE thank you to all XCode GPU dev.team. You guys rock. I was testing first metal gpu capture and since that time it's miraculous improvements.  Still ;)  Pixel history - please make it happen And if this is possible can Apple team work at least a bit with RenderDoc author so we can replay DX11/12 traces on Mac? It's a very big task/very complex but it's super big pain to need a Windows with RenderDoc to check stuff. If only RenderDoc can run on Mac. Of course I'd be happy if it can replay Metal as well, but it's a different story!


|U03HJ3XG351|:
Hi - thanks for feedback. We'll definitely chat with the tools team about your ideas.

|U03JRP6568Y|:
I'm porting a game that happens to work when in a Windows virtual machine, so on my Mac Pro I keep Direct3D tooling/tracing in a VM running side by side with the Metal debugger. Really missing that workflow on Apple Silicon, but I also know there are no easy answers there. :slightly_frowning_face: Considering just Boot Camping my Mac Pro and keeping it as a remote Windows debug box when the time comes.

--- 
> ####  Is there any documentation for the new Metal Pipeline Script JSON format?   Mentioned in the "Target and optimize GPU binaries with Metal 3" session.


|U03HJ3XEC75|:
Official documentation is coming soon! In the meantime here is a quick overview of creating a pre-compiled MTLBinaryArchive:

First create a MTLBinaryArchive using the existing API. After that is done you can extract the Metal Pipeline JSON with:
`$ metal-source -flatbuffers=json theBinaryArchive.metallib -o /tmp/descriptors.mtlp-json`

Then you can use the mtlp-json file with `metal` to generate a MTLBinaryArchive offline that will work with all GPUs:
`$ metal shaders.metal -N descriptors.mtlp-json -o archive.metallib`

|U03HJ3XEC75|:
Here is a link to the talk for others who may be interested in more: <https://developer.apple.com/videos/play/wwdc2022/10102/>

|U03JW10HAPQ|:
I tried to extract the Metal Pipeline JSON from a harvested archive, but got `metal-source: error: unsupported binary format`

|U03JW10HAPQ|:
I harvested the archive using (swift)...
```
let lib = device.makeDefaultLibrary()!
let desc = MTLRenderPipelineDescriptor()
desc.vertexFunction = lib.makeFunction(name: "vert_main")
desc.fragmentFunction = lib.makeFunction(name: "frag_main")
desc.colorAttachments[0]?.pixelFormat = .bgra8Unorm

let archdesc = MTLBinaryArchiveDescriptor()

let archive = try device.makeBinaryArchive(descriptor: archdesc)
try archive.addRenderPipelineFunctions(descriptor: desc)
try archive.serialize(to: NSURL.fileURL(withPath: "/Users/pwong/Downloads/x-game.metallib"))
```

|U03JW10HAPQ|:
Not sure if this is suppose to work yet on MacOS 13 beta/XCode 14 beta...

|U03J07WJLRK|:
also, I see that the workflow doesn't work at all without having a Metal pipeline JSON (applegpu-nt: note: [AGX] Plugin interface not implemented: AIRNTEmitExecutableImage error)

--- 
> ####  Is there a way to opt out of QoS to avoid priority decay on the render thread if we are writing our application in Swift?


|U03J3UW6LSD|:
The techniques we recommend in our tech talk on <https://developer.apple.com/videos/play/tech-talks/110147/|tuning CPU job scheduling for Apple silicon games> are also applicable to games written in Swift. The pthread APIs might not be the nicest to work with from Swift, but it should be possible to use them.

--- 
> ####  Rendering the Mandelbrot set is an "embarrassingly parallel" :smile: task, so it seems perfect for the GPU. I wrote a Metal fragment shader to do this, but you can't zoom into the set too far because Metal only supports `float`, not `double`. I am a novice GPU programmer, so bear with me, but is there any way to do increased precision math on the GPU with Metal? I understand that GPUs are generally much slower with double-precision, if they even support it, but it seems like it would be useful for scientific computing at least. Thank you!


|U03J7T89SQG|:
Hi, thanks for your question. Since Metal doesn't support the `double` data type, you would have to use (or make) an arbitrary precision floating point library. Another option is to use 64-bit integers using fixed-point approaches. We would also encourage you to send a report with your use case using Feedback Assistant so the team can consider it as a future enhancement.

|U03HMD22287|:
Thanks for those suggestions, I will explore them!

|U03J7T89SQG|:
Also, I want to add to my answer that you could also experiment with the "fast-math" option that is normally turned on by default. If you disable it, you may get a little better precision in your results when calling sin, cos, sqrt, etc. It's not the same thing as a 64-bit floating point type of course, but handy if you're debugging a precision issue.

|U03HMD22287|:
Thanks <@U03J7T89SQG> , I didn't know about that option!

--- 
> ####  Is there a way to reference templated compute functions from a compute pipeline descriptor such that the templated type inherits the bound texture's pixel format?


|U03J7T89SQG|:
Hi, this sounds like an interesting question. For example sake (using non-real code), I think you are trying to ask if you can do something like
```
template &lt;typename T&gt;
void computeShader(...) { ... }```
in your shader code and then reference this function using something like
```id &lt;MTLFunction&gt; function = [defaultLibrary newFunctionWithName:@"computeShader&lt;MyType&gt;"];
```
Is that what you are asking?

|U03J7T89SQG|:
You can use the `host_name` attribute and then define your template specializations. In the <https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf|Metal Shading Language Specification>, section 5.1.10 and 5.1.11 show how you can change the name that Metal will use to reference the function name.

|U03J7T89SQG|:
For example, you could try something like:
```
template &lt;typename MyType&gt;
kernel void computeShader(device MyType* output, constant MyType &amp;argument)
{
  *output = argument;
}

template [[host_name("computeShader_int")]]
kernel void computeShader&lt;int&gt;(device int* output, constant int &amp;argument);

template [[host_name("computeShader_float")]]
kernel void computeShader&lt;float&gt;(device float* output, constant float &amp;argument);```
And then reference the functions in your app with:
```id &lt;MTLFunction&gt; function1 = [defaultLibrary newFunctionWithName:@"computeShader_int"];
id &lt;MTLFunction&gt; function2 = [defaultLibrary newFunctionWithName:@"computeShader_float"];
```


|U03JENH943V|:
<@U03J7T89SQG> Yes, your example illustrates what I was looking for. So sounds like I'd still need to create a compute pipeline state per pixel format?

|U03JENH943V|:
For context, I was hoping to build my compute pipeline state once up front and allow a consumer of an MPS-like framework provide textures with various pixel formats.

|U03J7T89SQG|:
Yes, you would need to create a pipeline state for each one.

|U03JENH943V|:
Something like:
```
template &lt;typename T&gt;
void computeShader(texture2d&lt;T&gt; myTexture [[texture(0)]]) { ... }
```
where T is inferred from `texture(0)`

|U03J7T89SQG|:
And the reason for that is so the compiler can create an optimized version for each permutation you have.

|U03JENH943V|:
Yeah, makes sense. Would be cool if a compute pipeline state could be build with a set of template parameter permutations and then it selects the correct one based on bindings

|U03J7T89SQG|:
In fact, the term "shader permutations" refers to this specialization whether you're using templates, or function constants.

|U03J7T89SQG|:
If the pipeline is built too late though, it could trigger the compiler and that can result in performance problems. So, if you had a choice to compile your shaders before your app begins, versus on-demand, it's preferable to do it before.

|U03JENH943V|:
I see, so without template specialization in the shader source, the pipeline would have to compile versions for each of the permutations set on the pipeline state

|U03JENH943V|:
For the use case I outlined above, would you recommend lazily constructing the necessary pipeline state objects or building all possible versions once up front?

|U03J7T89SQG|:
If you know that you will need to use all possible ones, then you should do it once up front. Consider a real-time graphics application with many kinds of materials. If you were to compile the pipeline state objects when they were needed, then you may get stutters while you wait for them to compile.

|U03JENH943V|:
Great, thanks for your responses, very informative!

--- 
> ####  Is generating the new JSON Pipelines Script suppose to work on MacOS 13 Beta and XCode 14 Beta? Mentioned in the "Target and optimize GPU binaries with Metal 3" session.  Trying the sample terminal commands in the session, on a harvested metallib (super simply draw a point, with a vertex/fragment shader), errored out with `metal-source: error: unsupported binary format`.


|U03HJ3XEC75|:
Thanks for the feedback! The team is looking into this issue.

--- 
> ####  Is there a possibility to render 3D objects with SceneKit on the new Map? e.g. a Car driving down the road...


|U03HJ3XEC75|:
Unfortunately this is not possible to do, but please file Feedback on this request. It seems like a great idea with lots of possibilities!

--- 
> ####  The new object/mesh shader pipelines are pure genius. When will we get a chance to see an updated Metal Shading Language Spec so we can dig into the details?


|U03HJ3XCFGT|:
The spec was updated when we announced Metal 3! You can find it in the usual place <https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf>

|U03JK18HNR2|:
Yay!!!

|U03HJ54DBT4|:
Do you have any interesting plans <@U03JK18HNR2>? We had some interesting discussions about terrain rendering earlier this week (you should be able to find it if you scroll all the way back up to the Wednesday session :stuck_out_tongue: )

|U03JK18HNR2|:
I will definitely check that out! I don't have any specific ideas just yet. Still digesting everything, but I was properly blown away by the potential. This + MetalFX is an absolute game changer. 

--- 
> ####  In the new object and mesh shader stage, it looks like culling techniques can be refined greatly. But I didn’t quite grasp the meshlet concept discussed on the presentation. Is there some external theory on this you could point us to for more on the concept? Or is this something that we will be able to do in the new pipeline stage? (Ie carve up a mesh into smaller chunks on the fly)


|U03HJ54DBT4|:
Good question! The term refers to the general idea of splitting up meshes into smaller pieces in order to do efficient culling. This only really becomes a useful practice when culling is done on GPU (otherwise the CPU overhead would be prohibitive due to increased complexity).

We don't supply an out-of-the-box solution for carving up mesh resources, and we leave that up to the developer. Personally I had pretty good (and quick) results using K-means clustering, but there are existing mesh tools out there that can help you prepare your meshlets. :)

|U03HJ54DBT4|:
`meshlet culling` is a good search term to find out more from online resources :slightly_smiling_face:

|U03JENH943V|:
<@U03JK18HNR2> `meshoptimizer` has a set of functions to build meshlets: <https://github.com/zeux/meshoptimizer#mesh-shading>

|U03JK18HNR2|:
:raised_hands: 

|U03HJ3X8V43|:
One key observation is that meshlets have fixed upper bound on number of vertices and number of primitives, so they can be efficiently mapped to threadgroups of the same size(s); so chopping up the (potentially much larger) input meshes to fit into (multiple) meshlets has to be done up front (ideally at build-time of the assets)

|U03JENH943V|:
The library author also recorded a series of live streams on the topic, including GPU meshlet and view frustum culling: <https://www.youtube.com/watch?v=KckRq7Rm3Mw>

|U03HJ54DBT4|:
Ha I was about to mention SG2015 :smile: Lots of interesting things, including using meshlets and GPU driven rendering for efficient shadows etc.

|U03JENH943V|:
One of my favorite talks! Working through implementations at the moment, which is why I'm very happy mesh shaders arrived!

|U03HJ3X8V43|:
As for the second question, whether you can carve up meshes inside the pipeline, I don't see a reason why not. Mesh shader pipeline is a good fit for techniques that can be expressed as one or more mesh shader threadgroups (meaning, each such threadgroup maps 1:1 to a fixed size output mesh you declare in the shader), and you have the object shader stage to dynamically decide how many of those output meshes you will need.

There is no particular input formats or intermediate data formats that the pipeline is tied to, so if your input is meshes in device memory, that could work.

|U03JK18HNR2|:
<@U03HJ3X8V43> <@U03JLQ9J0LB> <@U03HJ54DBT4>  great resources! Thank you :)

--- 
> ####  Why apple choose USDZ instead of GLTF?


|U03HF6TCXC5|:
While USDz and GLTF are both excellent content delivery formats, USDz has the advantage in that it is a direct implementation of the USD format. A USDz file is a zip archive which contains a USD or USDc file along with all of its referenced resources such as textures, animations and shaders.

|U03HF6TCXC5|:
This makes it very convenient for using with DCC packages that natively support USD, since there is no conversion or transcoding required.

|U03JK18HNR2|:
I think glTF is a great format, but it is not nearly as flexible as usd formats. USD is also widely supported on all sorts of Apple frameworks so you can save a lot of dev time using that as a spec for your file format. Model I/O, RealityKit etc. In my experience, the biggest pain point for USD lies in the tools the artists want to use. A lot of Blender enthusiasts for example are still lacking a fully featured USD export with skinned animation. The best you can do without a custom exporter is send the file to glTF and then use RealityConverter to get it to USD. But that isn't ideal for all use cases. 

|U03JK18HNR2|:
Also another great thing about usd is the ability to convert to usda to get something human readable. That's saved me a lot of time pinpointing weird issues with geometry. 

|U03JSFUKL2U|:
Thanks guys!

--- 
> ####  Is there sample code which uses a `MTLSharedEvent`? I'm looking to test one of my compute pipelines which uses a shared event against a sample pipeline which uses the shared event correctly as I'm running into unexpected behavior


|U03HJ4HULBC|:
We have sample code here:
<https://developer.apple.com/documentation/metal/memory_heaps/implementing_a_multistage_image_filter_using_heaps_and_events?language=objc>

We also mention shared event specifically here:
<https://developer.apple.com/documentation/metal/resource_synchronization/synchronizing_events_between_a_gpu_and_the_cpu?language=objc>
<https://developer.apple.com/documentation/metal/resource_synchronization/synchronizing_events_across_multiple_devices_or_processes?language=objc>

--- 
> ####  If I render a scene to a MTLTexture with large resolution can I split scene to a small pieces and async render them or I need to render a whole scene al once?


|U03HJ54DBT4|:
Very interesting question :slightly_smiling_face: There are a lot of interesting things you can do to do this somewhat efficiently

|U03HJ54DBT4|:
The most basic way would just be to render the scene in multiple parts, each to a different render target (or viewport within a target). This would probably require you to first properly sort geometry to different draws

|U03HJ54DBT4|:
One other way to do this, would be to use Vertex Amplification and Layered Rendering to emit vertices to multiple render targets at once (for all the vertices that are overlapping multiple viewports)

|U03HJ54DBT4|:
Unless your render target is bigger than the allowed size though, you should just render everything at once where possible :slightly_smiling_face: The more you render at once, the more you gain efficiency.

|U03HJ54DBT4|:
I'm curious, what is the reason you would need such a huge resolution? :slightly_smiling_face: (I believe our maximum texture size is 16x16k)

|U03J21F2PQS|:
The 16k is perfect to my case :grinning:. Last year I face the problem with render to a texture. I don’t remember correct resolution, but if I set the resolution to 4k the test app is crashing. Other resolution (smaller or bigger) work perfect.

|U03J21F2PQS|:
Is there any way to get current max texture resolution directly in the app in runtime?

|U03J21F2PQS|:
<@U03HJ54DBT4> I work on sort of Standalone Render app and I need to figure out limits that I should set for export resolution, that the user cannot try to render image with bigger resolution.

|U03HJ54DBT4|:
I don't believe so, but you can look at this table:
<https://developer.apple.com/metal/Metal-Feature-Set-Tables.pdf>
It appears that anything newer than Apple2 will support 16K (iPhone7+)

|U03J21F2PQS|:
<@U03HJ54DBT4> Thank you so much!

--- 
> ####  How would you break down a scene into acceleration structures? I'm working on a small raytracing side project and I'm a bit stuck determining how a scene should be broken down. I'm using Model I/O to load some assets and then I'm planning to represent the scene with an instance acceleration structure, with each `MDLMesh` mapping to a primitive acceleration structure. Does this sound like an appropriate breakdown?


|U03HLFDFS20|:
Thanks for the question. Yes, this does sound like a proper mapping. You could fill out a `MTLAccelerationStructureTriangleGeometryDescriptor` for each submesh in an `MDLMesh` and then put those into `geometryDescriptors` in a `MTLPrimitiveAccelerationStructureDescriptor`

|U03JQCQ65HS|:
Yeah that's pretty close to what I was planning actually

|U03HLFDFS20|:
then you would use the transformations for each mesh and put together a transformation buffer for `MTLInstanceAccelerationStructureDescriptor`

--- 
> ####  Hello, are there any plans of supporting page faulting in Metal for the future?   The purpose is to have an 1:1 CPU:GPU VA mapping, with even file mmap() being accessible from the GPU side, to be able to layer more high-level programming models on top.


|U03HF6TASHK|:
Hi Mohamed, we do not comment on the future of the API, but I would like to direct your attention to two features that may be sufficiently flexible for your use-case, Metal Fast Resource Loading to load data from files and Metal Sparse Textures to manage partial residency with page map and unmap support. We are also interested in learning more about your use-case, so please feel free to expand on it :slightly_smiling_face: Thanks

|U03J07WJLRK|:
The use case is porting HPC code from other platforms which rely on heterogenous memory management more extensively today, including the regular host heaps being accessible from the GPU. (eg. C++ standard parallelism on GPUs as deployed by some vendors)

|U03HF6TASHK|:
Wow that is indeed an interesting use-case, and to make it work with Metal 3 you would need some sort of shim to hide the memory management details. Please feel free to file a feedback request for us to track this.

|U03HJ3X8V43|:
There's support for file mmap being made accessible to the GPU using <https://developer.apple.com/documentation/metal/mtldevice/1433382-newbufferwithbytesnocopy?language=objc>; however it causes the VM region to be paged in entirely (which may not be what you want to achieve here, depending on the size of the file)

|U03J07WJLRK|:
&gt;  depending on the size of the file
yeah pinned memory is useful - but is not what I'm after in this scenario :slightly_smiling_face:

|U03J07WJLRK|:
FB10133608

--- 
> ####  Will GPU Shader debugging for Mesh Shaders be ready for the Xcode 14 release?  I tried debugging the sample code "Adjusting the level of detail using Metal mesh shaders" (<https://developer.apple.com/documentation/metal/metal_sample_code_library/adjusting_the_level_of_detail_using_metal_mesh_shaders)|https://developer.apple.com/documentation/metal/metal_sample_code_library/adjusting_the_level_of_detail_using_metal_mesh_shaders)> and 2 observations: 1. There didn't seem to be a way to select object or mesh shader to debug. 2. Attempting to debug the fragment shader, hung XCode.


|U03HWP3Q65P|:
Many new and exciting features are always being planned to enable a better development experience for Metal. In the meantime if you encounter any issues we would highly encourage you to use the Feedback Assistant.

|U03HWP3Q65P|:
Additionally, feel free to provide the case number here if you have filed feedback already. Thank you!

--- 
> ####  Hey - Really love all the innovative Metal 3 features! I may be a little early asking, but I was curious about what’s happening with MTLArgumentEncoders. Are they being deprecated across the board in Metal 3 such that we can take advantage of the streamlined API for most of our Metal 2 code? It also looks like some, but not all, of the methods are deprecated. For example, the versions that can set multiple buffers at once in a range. Is that correct?


|U03HF6TASHK|:
Hi Louis, thanks and glad you are enjoying Metal 3!

MTLArgumentEncoders are indeed deprecated, however if you are targeting Tier 1 devices on Metal 2 you will still have to use them and disable the deprecation warnings, alternatively you could target only Tier 2 devices by performing a Metal 3 feature check.

We'd also really appreciate it if you could file feedback for this use-case.

--- 
> ####  Are there any cases we'd need to interact with MTLGPUHandle and MTLResourceID properties? I see them added in a bunch of places, but unsure where or by whom they'd be consumed.


|U03HBFM7FSA|:
`MTLGPUHandle` is deprecated and we use `MTLResourceID` to access the underlying resource index of a resource. It's similar to the `gpuAddress` of a buffer.

We use them in the bindless workflow for argument buffers. Instead of using the argument encoder's `set[ResourceType]`  functionality, we can simply cast the contents of the argument buffer to the struct type, and map the resources directly.

Please refer to <https://developer.apple.com/wwdc22/10101> for more usage examples.

--- 
> ####  Is there a way to have the equivalent of work_group_barrier (CLK_GLOBAL_MEM_FENCE, memory_scope_device) in Metal?   (all threads on a device barriers, _not_ threadgroup local, also a part of the Vulkan memory model)


|U03HJ4HULBC|:
Hello,
To barrier all threads within a threadgroup (equivalent to workgroup) properly ordering memory operations to device memory use `threadgroup_barrier(mem_device)` . If you want to barrier against all threads spawned, the proper way to achieve it in Metal is to split your operation into 2 sequentially dependent compute dispatches.
Thanks.

|U03J07WJLRK|:
ok... that'll pose some intriguing work for me on the compiler side to make that work out :slightly_smiling_face:

|U03J07WJLRK|:
I'd use `computeCommandEncoderWithDispatchType`  with the sequential dispatch type in that scenario right?

|U03J3RYQ9V1|:
are you talking about CLK_GLOBAL_MEM_FENCE or a scenario where one implements an actual across-grid synchronization primitive?

|U03J07WJLRK|:
there's indeed a cross-grid synchronisation primitive involved, and memory_scope_device is used to guarantee that

|U03J3RYQ9V1|:
My interpretation of the Vulkan spec for `work_group_barrier` is that the actual synchronization happens at workgroup boundary — i.e.: only between threads in the same workgroup (or threadgroup in Metal parlance). The memory fence behavior is kinda orthogonal and, in the case of `CLK_GLOBAL_MEM_FENCE` you are making sure that before any thread in a workgroup/threadgroup can proceed all in-flight device memory operations are visibile to the thread itself. That does not mean that a given thread will wait until all the other threads in the grid will reach the barrier to continue though

|U03J07WJLRK|:
See the SPV_KHR_vulkan_memory_model extension - more specifically the VulkanMemoryModelDeviceScopeKHR capability

|U03J07WJLRK|:
compute is my primary target instead of Vulkan though :slightly_smiling_face:

|U03J3RYQ9V1|:
Sorry, not really a Vulkan expert. In Metal unfortunately we do not currently support a shader-controller mechanism to barrier across all threads in a grid. In order to do that you would beed to split your operation into 2 sequential compute dispatches as mentioned by Kelvin.

|U03J07WJLRK|:
is it a known/already considered issue? do you mind if I file a radar about it?

|U03J3RYQ9V1|:
I’m not aware of this particular feature request, but that does not mean it has not been discussed so far. If Vulkan offers you this functionality and you think it would be useful to have it in Metal as well, you can definitely file a radar for it, it will be screened by the GPU SW team. Thanks!

|U03J07WJLRK|:
FB10166471

|U03J3RYQ9V1|:
Thanks!

--- 
> ####  I've never used MTLRenderPipelineReflection before. What sort of use cases is it meant for? Could it be used to replace shared source/shader constants defining binding indices?


|U03HWP3Q65P|:
MTLRenderPipelineReflection enables your application to reflect on shader bindings and allows you to perform data-driven tasks. For an example, you have a game engine and can pull out binding information to determine what resource needs bound where.

|U03JENH943V|:
This is super cool. I've historical just had a bunch of macros defining the binding indices. Will explore this approach. Thanks!

|U03HJ54DBT4|:
It's also very handy if you have a lot of shaders you are constantly editing. By using reflection, your engine can intelligently bind the right data to the right slot. Less worry, less bugs!

|U03JENH943V|:
Sounds so nice!

--- 
> ####  Heya! Quick shared post from the study-hall section, thank you much!  I think I have a lot to learn with Metal now. I’ll likely start with basic triangle patterns and moving those around with a compute kernel (which sounds so darn fun), and then start ‘upgrading’ to the mesh shader feature.   Now that I’ve said that, I wonder if it’s a better idea to maybe start with mesh shaders? I.e., starting from the new-tool instead of building up to it? The context being I'm brand new to Metal, and am looking to do some fairly simple direct interactions with geometry positions, and eventually texture manipulations for things like highlighting areas.


|U03HJ54DBT4|:
Both would work! While mesh shaders would be more efficient in most cases, if you are just starting out with compute I would suggest starting with a basic Compute-&gt;Vertex-&gt;Fragment pipeline, where your compute shader simply writes out the vertex buffer (and optionally index buffer). You can read back the written vertices and inspect the data. I feel that would be a great way to slowly build up to mesh shaders :slightly_smiling_face:

|U03HJ54DBT4|:
If you have handle on it, you can further optimize your work with mesh shaders (this requires a bit more planning on the side of thread group sizes, mesh sizes etc.)

|U03JRPTDF6U|:
This is excellent, thank you so much for the info. My original concern of going down an inconvenient path is now assuaged, haha. It seems like I’ll get a lot of bang-for-my-buck by writing up my kernel, getting to know the API, and then “discovering” where the new tools fit in to how I’ve tried to build things. At that point, even if I _have_ built something that doesn’t quite fit the pattern, I have that core understanding built up to diagnose and refactor as needed.

|U03JRPTDF6U|:
It’ll be quite interesting to start transitioning everything from basic SceneKit nodes and geometries to custom Metal ones… I feel like I may finally have the right path to get to the right tools for performance.

|U03JRPTDF6U|:
If you happen to have any kinda favorite notes, pages, articles, or docs on some potential equivalences or built in support for SceneKit -&gt; Metal or vice versa, I would really appreciate that as well!

|U03HJ54DBT4|:
Apologies I somehow didn't see this pop up! I'm not super familiar with SceneKit, but we do have interop between them. I would definitely suggest just playing around with Metal to get the hang of it. We had a similar question on Wednesday, where someone wanted to optimize their SceneKit scene by manually constructing complex meshes from scratch instead of relying on huge node graphs. I'll try to find it for you

|U03JRPTDF6U|:
Haha, no worries at all - quite literally thousands of fellow Apple-heads looking to chat, I’m just happy to be a part! :smiley:

That. Is. _AWESOME!_ It sounds right on track with that I’m talking about. I think this is going to be a weekend of Metal experimentation.. the more I ask about it from my current place, the more I’m itching to see what I can do with it.

|U03HJ54DBT4|:
Be sure to drop by the forums for help/questions :slightly_smiling_face:

|U03JRPTDF6U|:
Totally. In the past, I’ve only posted there when I’m in “dire straights” so to speak, haha. No reason I can’t ask simpler questions along the way too :smile:

|U03JRPTDF6U|:
<@U03HJ54DBT4> Heya, one more question if you don’t mind :sweat_smile:

Sorry if this was asked `1_000_000` times already, but is there a significant difference in using `Swift` for interacting with Metal as opposed to `Objective-C`? I see lots of write ups that use Swift to interact with it, including shader definitions.

|U03HJ54DBT4|:
I would suggest using Swift if possible, since that interfaces much nices with stuff like SwiftUI and other technologies. :slightly_smiling_face:

|U03JRPTDF6U|:
Wooooooooo! No square brackets for ME this weekend! :confetti_ball: :man_dancing: :dancer: :dancers: :confetti_ball:

--- 
> ####  I'm trying to track down a rare Metal crash in our app. We're seeing this in two completely independent subsystems when deallocating Metal buffers, invariably vertex or index buffers.


|U03J3RYQ9V1|:
Hello David, could you please provide some further details about the crash? Is it a CPU crash pointing at the Metal library or is it a GPU crash? Thanks

|U03K1T88QP5|:
Posted in the study hall, but the common part of the stack trace is:
```
Thread 0 Crashed:
0   libobjc.A.dylib                      0x000000019c8b7470 objc_release + 16
1   IOGPU                                0x00000001cf8059d8 -[IOGPUMetalResource dealloc] + 204
2   IOGPU                                0x00000001cf80672c -[IOGPUMetalBuffer dealloc] + 288
3   AGXMetalA10                          0x00000001df28ab28 0x1df26b000 + 129832
```

|U03K1T88QP5|:
It's rare, so I don't think it's an over-release on our part.

|U03J3RYQ9V1|:
Thanks! Do you have the whole stack trace by chance?

|U03J3RYQ9V1|:
Also, did you try to turn on zombie object detection in Xcode or Instruments so far?

|U03K1T88QP5|:
These reports are coming from the production app and we haven't been able to reproduce it.

|U03K1T88QP5|:
Sanitizing stack traces, standby

|U03J3RYQ9V1|:
It might still be useful to follow the instructions in this page: <https://developer.apple.com/documentation/xcode/investigating-crashes-for-zombie-objects>, specifically the linked page <https://help.apple.com/instruments/mac/current/#/dev612e6956>

|U03J3RYQ9V1|:
and I mean, on your development environment

|U03K1T88QP5|:
Right, like I said we can't repro it, but running with zombies enabled is a good idea.

|U03J3RYQ9V1|:
Based on the signature of your stack track this is quite likely a zombie object. A full stack trace would be useful to understand where in the driver we issue that release

|U03K1T88QP5|:
Here ya go, had to anonymize it:

```
Thread 0 Crashed:
0   libobjc.A.dylib                      0x000000019c8b7470 objc_release + 16
1   IOGPU                                0x00000001cf8059d8 -[IOGPUMetalResource dealloc] + 204
2   IOGPU                                0x00000001cf80672c -[IOGPUMetalBuffer dealloc] + 288
3   AGXMetalA10                          0x00000001df28ab28 0x1df26b000 + 129832
4   MyApp                                0x00000001059f2234 myapp::profile::MetalVertexBuffer::~MetalVertexBuffer() (<http://MetalRenderer.mm:1516|MetalRenderer.mm:1516>)
5   MyApp                                0x00000001059f225c myapp::profile::MetalVertexBuffer::~MetalVertexBuffer() (<http://MetalRenderer.mm:1515|MetalRenderer.mm:1515>)
6   MyApp                                0x00000001059e8afc myapp::profile::Shape::~Shape() (Shape.cpp:36)
7   MyApp                                0x0000000105803444 std::__1::enable_if&lt;(__is_cpp17_forward_iterator&lt;std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;*&gt;::value) &amp;&amp; (is_constructible&lt;std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;, std::__1::iterator_traits&lt;std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;*&gt;::reference&gt;::value), void&gt;::type std::__1::vector&lt;std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;, std::__1::allocator&lt;std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt; &gt; &gt;::assign&lt;std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;*&gt;(std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;*, std::__1::shared_ptr&lt;myapp::mdk::RenderableTile&gt;*) (memory:2506)
8   MyApp                                0x00000001059d9f18 myapp::profile::TerrainLayer::updateNode(myapp::profile::SceneManager*) (TerrainLayer.cpp:46)
9   MyApp                                0x00000001059dd494 myapp::profile::SceneNode::updateNode(myapp::profile::SceneManager*) (SceneNode.cpp:47)
10  MyApp                                0x00000001059dc538 myapp::profile::ModelController::update(double) (ModelController.cpp:55)
11  MyApp                                0x00000001059f6a38 -[TTMProfileModelController(CPP) update:] (<http://TTMProfileModelController.mm:51|TTMProfileModelController.mm:51>)
12  MyApp                                0x0000000105a00648 -[TTMProfileView renderLoop] (<http://TTMProfileView.mm:335|TTMProfileView.mm:335>)
13  QuartzCore                           0x0000000188fe8378 CA::Display::DisplayLink::dispatch_items(unsigned long long, unsigned long long, unsigned long long) + 756
14  QuartzCore                           0x0000000188feeb44 display_timer_callback(__CFMachPort*, void*, long, void*) + 364
15  CoreFoundation                       0x00000001854c869c __CFMachPortPerform + 168
16  CoreFoundation                       0x00000001855084ec __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 52
17  CoreFoundation                       0x000000018550badc __CFRunLoopDoSource1 + 584
18  CoreFoundation                       0x00000001854c90f0 __CFRunLoopRun + 2372
19  CoreFoundation                       0x00000001854dbe1c CFRunLoopRunSpecific + 568
20  GraphicsServices                     0x00000001a576d9a0 GSEventRunModal + 156
21  UIKitCore                            0x0000000187d0fb90 -[UIApplication _run] + 1076
22  UIKitCore                            0x0000000187aa516c UIApplicationMain + 328
23  MyApp                                0x0000000106f36e1c main (main.m:127)
24  ???                                  0x0000000109580250 0x0 + 0```
And another one (different system altogether)
```Thread 0 Crashed:
0   libobjc.A.dylib                      0x00000001dc079ef8 objc_msgSend + 56
1   IOGPU                                0x00000002242b87a0 -[IOGPUMetalResource dealloc] + 208
2   IOGPU                                0x00000002242b9558 -[IOGPUMetalBuffer dealloc] + 316
3   AGXMetalA14                          0x0000000236149964 0x235f5c000 + 2021732
4   MyApp                                0x00000001055b21ac std::__1::__any_imp::_SmallHandler&lt;myapp::render::Buffer::Metal&gt;::__handle(std::__1::__any_imp::_Action, std::__1::any const*, std::__1::any*, std::type_info const*, void const*) (any:0)
5   MyApp                                0x000000010559f808 std::__1::any::reset() (any:321)
6   MyApp                                0x000000010559f66c myapp::render::Buffer::~Buffer() (Buffer.cpp:14)
7   MyApp                                0x00000001055a2768 std::__1::unique_ptr&lt;std::__1::__hash_node&lt;std::__1::__hash_value_type&lt;myapp::Name, myapp::render::VertexBuffer&gt;, void*&gt;, std::__1::__hash_node_destructor&lt;std::__1::allocator&lt;std::__1::__hash_node&lt;std::__1::__hash_value_type&lt;myapp::Name, myapp::render::VertexBuffer&gt;, void*&gt; &gt; &gt; &gt;::~unique_ptr() (Buffer.h:188)
8   MyApp                                0x00000001055a1924 myapp::render::Cache&lt;myapp::render::VertexBuffer&gt;::RemoveBuffer(myapp::Name const&amp;) (__hash_table:2498)
9   MyApp                                0x0000000105668870 TTMKTileMetadata::deleteGLBuffers() (TTMKTileMetadata.cpp:178)
10  MyApp                                0x00000001056d8248 -[TTMKMetalView doInContext:] (<http://TTMKMetalView.mm:46|TTMKMetalView.mm:46>)
11  MyApp                                0x000000010569c694 -[TTMKMapView doInBackgroundContextThread:doImmediately:] (<http://TTMKMapView.mm:2958|TTMKMapView.mm:2958>)
12  MyApp                                0x000000010568ba8c -[TTMKMapContainerDelegate doInBackgroundContextThread:doImmediately:] (<http://TTMKMapContainerDelegate.mm:20|TTMKMapContainerDelegate.mm:20>)
13  MyApp                                0x00000001056176c0 TTMKMapContainer::drainTileCache(bool) (TTMKMapContainer.cpp:3393)
14  MyApp                                0x0000000105613ca4 TTMKMapContainer::update(double, double) (TTMKMapContainer.cpp:1442)
15  MyApp                                0x000000010569b6a4 -[TTMKMapView glDrawOversample] (<http://TTMKMapView.mm:2696|TTMKMapView.mm:2696>)
16  MyApp                                0x000000010569b964 -[TTMKMapView drawWithDevice:toDrawable:pass:] (<http://TTMKMapView.mm:2747|TTMKMapView.mm:2747>)
17  MyApp                                0x00000001056d85a0 -[TTMKMetalView drawRect:] (<http://TTMKMetalView.mm:144|TTMKMetalView.mm:144>)
18  MetalKit                             0x00000002009a36d4 -[MTKView draw] + 140
19  MetalKit                             0x00000002009b1fb8 -[MTKViewDisplayLinkTarget draw] + 36
20  QuartzCore                           0x00000001c70d2324 CA::Display::DisplayLink::dispatch_items(unsigned long long, unsigned long long, unsigned long long) + 744
21  QuartzCore                           0x00000001c722d174 CA::Display::DisplayLink::dispatch_deferred_display_links() + 344
22  UIKitCore                            0x00000001c665f254 __setupUpdateSequence_block_invoke + 212
23  UIKitCore                            0x00000001c5fd9084 _UIUpdateSequenceRun + 80
24  UIKitCore                            0x00000001c665ecb0 schedulerStepScheduledMainSection + 140
25  UIKitCore                            0x00000001c665e478 runloopSourceCallback + 88
26  CoreFoundation                       0x00000001c344bf04 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 24
27  CoreFoundation                       0x00000001c345cc90 __CFRunLoopDoSource0 + 204
28  CoreFoundation                       0x00000001c3396184 __CFRunLoopDoSources0 + 264
29  CoreFoundation                       0x00000001c339bb4c __CFRunLoopRun + 824
30  CoreFoundation                       0x00000001c33af6b8 CFRunLoopRunSpecific + 596
31  GraphicsServices                     0x00000001df449374 GSEventRunModal + 160
32  UIKitCore                            0x00000001c5d14e88 -[UIApplication _run] + 1096
33  UIKitCore                            0x00000001c5a965ec UIApplicationMain + 360
34  MyApp                                0x0000000106d495fc main (main.m:127)
35  ???                                  0x0000000109679ce4 0x0 + 0
```

|U03K1T88QP5|:
Note: `deleteGLBuffers()` is part of the legacy code hierarchy. Rendering path is all Metal.

|U03J3RYQ9V1|:
Thanks, this definitely looks like a zombie object

|U03J3RYQ9V1|:
It seems like your app is holding a reference to a MTLBuffer object that has been already released

|U03K1T88QP5|:
Yeah, that's what I thought too, but the code paths here manage Metal buffers independently and it seems unlikely totally different implementations would make the same subtle mistake. Static analysis turned up nothing suspicious.

|U03J3RYQ9V1|:
Do you use command buffers with unretained references or command buffers with retained references?

|U03K1T88QP5|:
Let me look up the creation code

|U03J3RYQ9V1|:
Also, do you have a common pool of Metal resources that lives across sub-systems?

|U03K1T88QP5|:
Not vertex or index buffers, at least. Creation happens in Obj-C++ code and looks like:
```
            auto em = std::any_cast &lt;Environment::Metal&gt; ( &amp;_environment-&gt;_metal );
            id &lt;MTLDevice&gt; device = em-&gt;_device;
            
            auto mtl = std::any_cast &lt;Metal&gt; ( &amp;_metal );
            mtl-&gt;_buffer = [device newBufferWithLength: sizeInBytes options: MTLResourceCPUCacheModeDefaultCache];
```

|U03K1T88QP5|:
That should be retained, if I'm not mistatken.

|U03J3RYQ9V1|:
Sorry, what I meant is: how do you create `MTLCommandBuffer` objects?

|U03J3RYQ9V1|:
Do you by chance use `MTLCommandQueue:commandBufferWithUnretainedReferences` or `MTLCommandQueue:commandBufferWithDescriptor` setting `commandBufferWithUnretainedReferences=YES`?

|U03K1T88QP5|:
No, I don't think so. Device and queue are created here:
```
            _metal.emplace &lt;Metal&gt; ();
            auto mtl = std::any_cast &lt;Metal&gt; ( &amp;_metal );
            
            bool first = ( mtl-&gt;_device == nullptr );
            id &lt;MTLDevice&gt; mtlDevice = *std::any_cast &lt;id &lt;MTLDevice&gt;&gt; ( &amp;device );
            
            mtl-&gt;_device = mtlDevice;
            mtl-&gt;_queue = [mtlDevice newCommandQueue];
            
            if ( first )
            {
                initialize();
                initializeMetalRendering();
            }```
Then the command buffer is created here:
```        void Environment::start()
        {
            auto mtl = std::any_cast &lt;Metal&gt; ( &amp;_metal );
            
            mtl-&gt;_buffer = [mtl-&gt;_queue commandBuffer];
```

|U03J3RYQ9V1|:
OK, that’s a command buffer with retained resources then

|U03J3RYQ9V1|:
Based on the info I have I still think your best bet is to use the zombie detector

|U03K1T88QP5|:
Ok, I'll give that a shot, but we haven't been able to repro it ourselves. If we referred to a dealloc'd object we should at least see a crash locally I would think.

|U03J3RYQ9V1|:
Do you possibly have `MetalVertexBuffer` objects that do not contain an actual `MTLBuffer` object?

|U03J3RYQ9V1|:
Maybe you’re not overreleasing, maybe you just have some smashed pointer

|U03J3RYQ9V1|:
or uninitialized data structure?

|U03K1T88QP5|:
Not sure, all good things to check

|U03K1T88QP5|:
When we moved from GL to Metal, all the Metal code was put in a single file. I can send that if you'd like to look it over.

|U03J3RYQ9V1|:
Not sure we have means for you to safely upload your source code here

|U03J3RYQ9V1|:
let me ask

|U03J3RYQ9V1|:
You could use feedback assistant

|U03K1T88QP5|:
Not sure where that is

|U03J3RYQ9V1|:
<https://developer.apple.com/bug-reporting/>

--- 
> ####  Have there been any changes to resource limits with Metal 3? Specifically the maximum number of buffers inside an argument buffer. Thank you!


|U03HJ54DBT4|:
There is no limit on the number of buffer references stored in an argument buffer. We also made it easier to populate an argument buffer on the CPU by using the buffers' `gpuAddress` property; so argument encoders are no longer needed.

Please note though, that you still need to actually allocate an argument buffer large enough to hold all the references, and resource creation (of the argument buffer, or all the other buffers) can fail when you run out of memory; your total resident memory set is still limited, but the argument buffer contents are not.

The same applies to texture references stored in an argument buffer (use the `MTLResourceID` property instead when populating the buffer on the CPU).

--- 
> ####  Is there any list where I can find which devices support Metal 3?


|U03HWP3Q65P|:
• Metal 3 hardware support can be found in `Discover Metal 3`<https://developer.apple.com/videos/play/wwdc2022/10066/>
• Specific features (Mesh Shaders, Metal FX) may have a different hardware support. For example, Mesh Shaders should be supported on MTLGPUFamilyApple7 and MTLGPUFamilyMac2. Please refer to their associated session for more information. ie, for Mesh Shaders : <https://developer.apple.com/videos/play/wwdc2022/10162/>


|U03J21F2PQS|:
<@U03HWP3Q65P> Thanks!

|U03HWP3Q65P|:
No problem! Looking forward to seeing what y'all make with Metal 3 :raised_hands:

--- 
> ####  I've noticed that in compute shader access to a 2d texture is faster, than access to a buffer. (Due to a lot more of a cache missed). How does caching strategy work for textures vs buffers in compute? Can we specify one (as i've pretty good idea what parts of the buffer will be accessed from which thread)


|U03HJ54DBT4|:
Textures are optimized for localized sampling (so sampling things that are more "together" in 2D space). It definitely makes sense to store "2D data" in a texture. :slightly_smiling_face: Alternatively, you can manually encode 2D data in a "1D buffer" using a more optimized order of data using Morton Ordering (Z-ordering). This will make data that is close in 2D also end up close in "1D".

You are totally free to sample textures in compute, and it will have the same performance characteristics as in a fragment function.

<https://en.wikipedia.org/wiki/Z-order_curve>

|U03HY66772A|:
Does textures use the same hardware as buffers? If requesting from a buffer is different than requesting from a texture, there may be a point in “parallelizing” data access

|U03HJ54DBT4|:
Since textures and buffers tend to reside in the same memory, that would just end up being a more divergent access pattern. :slightly_smiling_face:

|U03HJ54DBT4|:
If you have 2D localized access pattern, I would suggest using textures, unless your data is not compatible with existing texture formats.

|U03HJ3XCFGT|:
We also discussed matching the layout of your threadgroups with your buffers in <https://developer.apple.com/videos/play/wwdc2022/10159|Scale compute workloads across Apple GPUs>

|U03HY66772A|:
I have a 1.5d data. I have really wide, but not very tall texture. ATM i’m using 10-15k by 20 (just twenty, without thousand)

And i’m dispatching 10-15k by 1 threads. ATM i’m limited by max texture width on iOS devices, and would like to explore ideas on how to efficiently scale my kernel)

|U03HJ54DBT4|:
Ah I see! In that case, it might be interesting to use a buffer, but store your data interleaved (so in "strips" of 20).

|U03HJ54DBT4|:
That would still give you pretty good localized access. And as always it is a good idea to take a critical look at the data size per entry. (use half if possible etc)

|U03HY66772A|:
that was my original implementation, and it was 10-20% slower than textures:(

Data size is one possibility I haven’t explored yet, as my algorithms performs poorly on halfs, but I haven’t tried computing in f32, and storing in f16

|U03HJ54DBT4|:
Hmmm interesting! Are you sure your texture is the same effective data size? Are you using linear interpolation etc? If you are doing a "linear" access across your compute grid, I would expect a simple interleaved scheme to work pretty well

|U03HY66772A|:
Hmm, since it was a year ago, I may used not a linear pattern (as my data can be from 1 to 20 tall, I may have packed it tightly)

|U03HY66772A|:
I can check, and if there is major difference in performance, I can file a feedback

|U03HJ54DBT4|:
Sounds good! Good luck :slightly_smiling_face:

|U03HJ54DBT4|:
Just wanted to add: a colleague of mine reminded me that textures often use a separate cache, so you could definitely see some performance difference between the two. Hope it helps :)

--- 
> ####  Does ScreenCaptureKit support pulling audio from different processes than the video? There are some use cases where audio comes from one process but the window and graphics come from another process, this is common in situations like CrossOver and Wine. This feature if not supported would be very useful.


|U03HF6TK2J1|:
ScreenCaptureKit will get audio associated with application, so if the application’s parent process spawns another process to render audio, SCK should also capture that audio. If this doesn’t work in your case, please file a feedback request :slightly_smiling_face:.

|U03J1UG654K|:
Thank you very much!

|U03HF6TK2J1|:
No problem :slightly_smiling_face:
