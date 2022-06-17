# photos-camera-lounge QAs
### Lounge Contributors
#### [tikimcfee](https://github.com/tikicmcfee)
#### [roblack](https://github.com/roblack)
---

--- 
> ####  Hello,  I pretty new at video in general and I was wondering where to get started with video processing, specifically how do I rewrite multiple videos next to each other for side by side 3D?  Thank you!


|U03HXTBNYBC|:
Would you like to record a video with two video tracks? Composite two together? Blend two together? Producing a stereo effect? Give us a little more info.

|U03JBMMB10A|:
I’d like to take already recoded videos (left and right) and position them side by side not overlapping, like in a VR headset.

|U03HXTBNYBC|:
AVMutableComposition should do the trick. You can use that to composite two movies together and write a new one. It would have an extra wide video track.

|U03JBMMB10A|:
Great, thank you!

|U03J5SJL6MT|:
Just to piggyback on <@U03JBMMB10A> question, What are the examples out there of doing composition with multiple video tracks,  I know a little about layer instructions, but is there any examples of using the frames directly?

|U03HXTBNYBC|:
Have you checked out AVMulticamPiP? <https://developer.apple.com/documentation/avfoundation/capture_setup/avmulticampip_capturing_from_multiple_cameras>

|U03HXTBNYBC|:
This composites front and rear camera into a single video track.

--- 
> ####  Can there be more than one iPhone connected via Continuity Camera?


|U03HXTBNYBC|:
Only one active stream at a time, but multiple iPhones can be discovered. So you can switch between them, but only one can be streaming actively at a time.

|U03HZ5T63N1|:
I would like to add this as a feature request.

|U03HXTBNYBC|:
We have limited bandwidth over WiFi. 1080p video ain't cheap. :slightly_smiling_face:

|U03K50PT6L8|:
Will it utilize usb if plugged in?

|U03HXTBNYBC|:
Yes it will.

|U03HXTBNYBC|:
USB has bandwidth constraints too. :slightly_smiling_face:

--- 
> ####  Hi Brad, I have a dumb question. I still use UIKit for using the camera with AVFoundation. Did I miss it that you can make a camera app in SwiftUI?


|U03HHA1D44F|:
Yes, you can use SwiftUI with AVFoundation. See this sample app we just released for Continuity Camera that shows this:

<https://developer.apple.com/documentation/avfoundation/capture_setup/supporting_continuity_camera_in_your_macos_app?language=objc>

|U03J1TZUPC3|:
Thanks. So, this is new this year?

|U03HHA1D44F|:
You have been able to use SwiftUI with AVFoundation since SwiftUI's introduction. But this is our first sample released showing SwiftUI with AVFoundation

|U03HHA1D44F|:
By using `UIViewRepresentable`, you can use an `AVCaptureVideoPreviewLayer` in SwiftUI

|U03HHA1D44F|:
The sample app shows this

|U03J1TZUPC3|:
But that is not native SwiftUI, is it? That is creating a UIView in SwitftUI. I do that for MapKit as well.

|U03J1TZUPC3|:
Actually, a UIView Layer

|U03JDTS6RKP|:
Hi Paul, just chiming in cause I had a heck of a time figuring this out, but totally doable going back to first SwiftUI release (although I require iOS 14+ for my app because of an issue encountered in 13 related to this, can't remember what it was though *Edit: I think it was related to viewfinder not stretching to bounds properly*).

Have yet to look at the sample mentioned above, but solution is probably similar. At a high level you have your normal CameraViewController. You then create a UIViewControllerRepresentable, lets call it CameraVCSwiftUIView, with a CameraViewController as a member. This CameraVCSwiftUIView is now usable in SwiftUI as your CameraViewController / video preview :slightly_smiling_face:

|U03HHA1D44F|:
Correct, there is not a native SwiftUI solution for AVCaptureVideoPreviewLayer

|U03HHA1D44F|:
Check out CameraPreview.swift in the sample app, ContinuityCam

|U03J1TZUPC3|:
Hi Edward, I have this now in my app. The app was originally build in 2015 based on UIKit. Now that I am adding new functionalities and the integration with the Apple watch, I'm also starting to move some code to SwiftUI. Currently, I wrapped the CameraViewController in a UIViewControllerRepresentable. I was, however, more curious to learn, when the AVFoundation camera would natively work in SwiftUI.

|U03J1TZUPC3|:
I know how to build a camera app and how to integrate UIKit code into SwiftUI. That is not my problem.

|U03J1TZUPC3|:
Hi Nikolas, that is too bad, but also gives me time to focus on other things. Thanks.

|U03JDTS6RKP|:
My guess is it probably won't be brought to SwiftUI, just cause of the architecture -- how would one handle pipeline config, state changes, etc in a way that makes sense in a SwiftUI context? (I'm new to SwiftUI so I could be missing something)

|U03J1TZUPC3|:
I think the problem is the AVCaptureVideoPReviewLayer that is used to capture the image/video. The rest is pretty straight forward.

--- 
> ####  Many schools use iPads as cameras. Would be cool if this could also be made to use with iPad.


|U03HXTBNYBC|:
True. iPad form factor is a little unwieldy as a Continuity Camera, as it needs to be facing away from you to use the rear facing cameras. We're just supporting iPhones for now.

|U03HZ5T63N1|:
Imagine the device as an external camera. So many use cases in creative areas.

|U03HZ5T63N1|:
And all the sensors of the iPhone/iPad as external sensors to be used from the Mac.

|U03HXTBNYBC|:
Yep, Continuity Camera is very powerful.

--- 
> ####  Hello,  I've noticed the viewfinder gets stretched at the left and bottom edges when LivePhoto is enabled, and AVCaptureDevice.DeviceType is set to .builtInUltraWideCamera. Is this a known issue, and is there a workaround?  Thank you for your time!


|U03HR8XVATG|:
Hi Edward, are you only seeing this when LivePhoto is enabled? Or do you always see this when using the .buildInUltraWideCamera? If it's the latter then I suspect it's simply the distortion of this ultra wide angle camera lens that you're seeing.

|U03HR8XVATG|:
But you should be seeing that in all 4 corners of the image.

|U03JDTS6RKP|:
Thank you for your reply! Happens only when LivePhoto is enabled. See image below

|U03HR8XVATG|:
that doesn't look expected. Could you file a bug report with that screenshot and repro steps? Is this only happening with iOS 16?

|U03JDTS6RKP|:
I believe it started in iOS 15, but can't be sure. This is the bug report that was filed a while back :slightly_smiling_face:  FB9983221

|U03HR8XVATG|:
thanks, I just found the report. It's with our team. The screenshot you sent here is very informative, I've attached it to the bug report.

|U03JDTS6RKP|:
Thank you so much!!

|U03HVE4BEBY|:
I've had a couple of users report this issue too! Haven't been able to replicate it myself 

|U03JDTS6RKP|:
Its there on the 12 Pro, but not on the 13 Pro as far as I can tell. Been there through most of iOS 15, and is still there on 15.4.1

--- 
> ####  Easy question for you! Is UIImagePickerController still the best way to allow people to take photos inside your app, if you're not building a completely camera interface? (The camera mode isn't deprecated, just the photoLibrary one has been?)


|U03HXTBNYBC|:
I'd say UIImagePickerController is the easiest way to make a quick video or photo. Whether it's the best will depend on the feature set you need. It's a canned view, so you have little work to do.

|U03JMC610GH|:
Late reply, but you have it exactly right — `UIImagePickerController` with the `camera` source for capture, and `PHPicker` for selecting existing assets is the recommended combination here.

|U03HMCT187R|:
Awesome thanks!

|U03HMCT187R|:
Looking forward to a future WWDC where there’s an all new camera API to replace `UIImagePickerController` :smirk:

|U03JMC610GH|:
Please do file feedback with any particular use cases / camera features / etc. that you'd like to see in a new API and feel free to drop the FB # here!

|U03HMCT187R|:
I might just have to compose all my thoughts on that!

|U03HMCT187R|:
FB10136910: Modern camera API desired to replace UIImagePickerController

--- 
> ####  What is the best way to write a live video stream into a file (via AVAssetWriter) with custom FPS (e.g 18) but in the same time updating AVCaptureVideoPreviewLayer with 30 FPS?


|U03HXTBNYBC|:
On macOS, you can set your frame rate on individual connections, so you can have one frame rate going to preview and one going to video data output. On iOS, you can't. It's just one frame rate dictated by the AVCaptureDevice, so if you want a lower frame rate to your asset writer, you'll need to do your own frame dropping in your VDO.

--- 
> ####  In iOS 16 it now seems possible to capture high resolution photos during an ARKit session.  What camera properties can and can not be configured during an active ARKit session?  Can we:  - lock/set the exposure, white balance, and control the focus distance?  - enable/disable multi-exposure fusion and tone mapping?  - capture images with  8bit depth? - capture Pro RAW images (presumably not)?


|U03HXTBNYBC|:
You'll need to check with the ARKit team on what features they support. I don't believe you can do any of the things you've mentioned here.

|U03JRPTG8BS|:
They do provide access to the AVCaptureDevice now
<https://developer.apple.com/documentation/arkit/arconfiguration/3930045-configurablecapturedeviceforprim?changes=latest_minor>

|U03JRPTG8BS|:
But yes, I guess it is more a question for the ARKit team

|U03HXTBNYBC|:
If they're providing direct access to AVCaptureDevice, you can certainly set properties on it directly, but I don't know how that will interact with the algorithms they're running.

--- 
> ####  The Continuity Camera's desk view is really interesting and amazing! How does it work?


|U03HXTBNYBC|:
It uses the ultrawide lens of your iPhone. The field of view is wide enough to capture both your head and the desk in front of you. The desk view is warped and flipped with some pretty tricky distortion correction to make it appear rectilinear / flat, as if the camera were overhead instead of in front of it.

|U03HXTBNYBC|:
You'll want to watch the session "Bringing Continuity Camera to your app" Already available!

|U03JRP87THN|:
Thank you very much! Will definitely watch it.

--- 
> ####  I'm trying to build an app for iPadOS to provide a portable video streaming setup, and wonder if there is a way to make a USB UVC camera appear in `AVCaptureDevice.DiscoverySession`?


|U03HXTE9N4S|:
I would have to say no since we don't support UVC camera on iPadOS

|U03HZ462JCV|:
Thank you ^^

|U03HZ462JCV|:
FB10074848 for potential future enhancements :pray:

|U03HXTBNYBC|:
Thanks, Tian!

--- 
> ####  How to speed up session start time and prevent drop of first frames? For example Snapchat works very fast (almost immediately), pausing and restarting are invisible and have no glitches. Even system Camera, Instagram, Facebook, Apple's demo app spend some time to configure the session and draw the first frame.


|U03HV023K2R|:
Creating the session with just the necessary outputs, e.g. only AVCaptureVideoDataOutput helps speed up the session startup. You can also try configuring everything upfront in the app user flow so the startup time is less noticeable to users.

|U03K8L1DCSU|:
Is there a performance difference between wrapping any single output configuration into `beginConfiguration` and `commitConfiguration` and using only one `begin-commit` operation to batch outputs configurations?

|U03HV023K2R|:
Batching all your configurations into one `begin-commit` is more efficient.

|U03HHA1D44F|:
`beginConfiguration`'s documentation also states:

&gt; You can nest `beginConfiguration` and `commitConfiguration` pairs, and the system applies the changes when you call the outermost commit.
This may be helpful if you want to take care of different configuration aspects in different methods

See: <https://developer.apple.com/documentation/avfoundation/avcapturesession/1389174-beginconfiguration?language=objc>

|U03K8L1DCSU|:
Thanks

--- 
> ####  Is it possible to efficiently write the AVDepthData from the cameras (front and back) using AVAssetWriter?


|U03HXTBNYBC|:
There is no API support in AVAssetWriter for writing depth at this time, though it is supported in the QuickTime spec as an auxiliary video track. You can read up on it in the official QuickTime spec, and a good example of this spec in action is Cinematic Video captured in <http://Camera.app|Camera.app>.

|U03JG9JF529|:
Thanks, is that the system Camera app on the iPhone 13 Pros?

|U03HXTBNYBC|:
Yes, correct.

|U03JG9JF529|:
Is it publicly available in the quicktime spec? I can’t see the <https://twitter.com/jankais3r/status/1442466943697489923?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1442466943697489923%7Ctwgr%5E%7Ctwcon%5Es1_&amp;ref_url=https%3A%2F%2Fnofilmschool.com%2Fdepth-map-new-iphone-cinematic-mode|identifiers listed from the cinematic video> in the <https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/Metadata/Metadata.html#//apple_ref/doc/uid/TP40000939-CH1-SW37|spec here>

--- 
> ####  Is there a way to use Continuity Camera on iPadOS rather than macOS?  Specifically, could the iPhone camera be used as the camera in an app like FaceTime or Zoom?


|U03JMLKUF1N|:
Hi Brandon, Continuity Camera is only available on macOS currently, so iPad apps won't be able to see these new cameras.

--- 
> ####  Thanks for the Q&amp;A!  I notice there may be a session on this tomorrow, but is there a way to continue running an AVCaptureSession in slide over and split view? :grin:


|U03HHA1D44F|:
Yes! In tomorrow's session we describe new API that you can use to allow your app to use the camera while multitasking

|U03HHA1D44F|:
There are 2 new properties on AVCaptureSession: isMultitaskingCameraAccessSupported and isMultitaskingCameraAccessEnabled

|U03HHA1D44F|:
The session refers to this article which you can read in advance of the session being released:

<https://developer.apple.com/documentation/avkit/accessing_the_camera_while_multitasking?language=objc>

|U03J21HNQAE|:
This is awesome!  Thanks so much for developing this and the detailed doc :grin:

--- 
> ####  Do the updates for iPads with M1 to support custom USB drivers with DriverKit mean that I can use external cameras and other capture devices (like an Elgato UBS capture card, for example) with my application through AVFoundation?


|U03HHA1DV9D|:
Currently only internal cameras on the iPad are supported in AVFoundation.

|U03JM9TRBB3|:
Okay, I’ve got FB9948623 filed as an enhancement request for this for tracking purposes.

--- 
> ####  Did I understand this correctly? You will be able to capture high res stills while still seeing the live video feed?


|U03HXTBNYBC|:
speaking of Continuity Camera, yes? That's correct. Stills can be taken while doing live video.

|U03HZ5T63N1|:
Awesome!

--- 
> ####  Can you please also add the depth info to the stream? And iPhone telemetry? (Orientation, position, velocity)


|U03HXTBNYBC|:
Tell us more about this. You can already add your own telemetry as metadata in timed metadata tracks in QuickTime movies using AVCaptureMetadataInput.

|U03HXTBNYBC|:
We do support streaming depth as AVDepthData objects in AVCaptureDepthDataOutput.

|U03HXTBNYBC|:
We do not currently support writing depth to movies via asset writer or AVCaptureMovieFileOutput though.

--- 
> ####  For a few releases now, I've been "warming up" my AVAssetWriter as soon as my app launches, then cancelling the writing session before actually starting to write.  If I don't do this, I end up with black frames at the beginning of the AVAssetWriter.  Is this the suggested step to take or is this a different issue I'm facing?


|U03HHA1DV9D|:
Hrm... it would seem like this would happen if the movie also has audio that starts at an earlier time.

|U03HHA1DV9D|:
Have you looked at the movie for edits.

|U03J20E7UBV|:
Thanks, <@U03HHA1DV9D>.  In my scenario, that is not the case, as I am not recording audio.  I'm usually recording very short clips (1-3 seconds), but can almost consistently replicate the issue, if I don't "warm up" the AVAssetWriter in advance.  I can file a bug report on it if it's not a common/known topic!

|U03HHA1DV9D|:
I haven't heard of this before.  What exactly are you doing to warm up the assetwriter?

|U03HHA1DV9D|:
(Before I forget, if you do file a bug report please include one of the clips.)

|U03J20E7UBV|:
I am instantiating an AVAssetWriter as soon as the app launches, starting a session at `.zero`, then adding a delay of 0.5 seconds, and then calling `.cancelWriting()` on the session.  If I do that once, typically as soon as the app launches, I can negate the issue altogether.

I got the suggestion from <https://stackoverflow.com/questions/44135223/record-video-with-avassetwriter-first-frames-are-black|this> post, though it feels like a workaround, for sure.

|U03HHA1DV9D|:
The advice in that link sounds good.

|U03HHA1DV9D|:
I think the confusion is around starting at zero but not actually writing with the first frame.

|U03HHA1DV9D|:
Did you ever measure how long the period of black frames was?

|U03J20E7UBV|:
It's typically brief, though that's a great troubleshooting step to take.  I can definitely measure the time; maybe it's consistent and I can use that to troubleshoot.  Maybe I'm misunderstanding, but should I not be starting at `.zero`?  I had thought that was writing the timecode to start at 00:00:00, but perhaps I'm misunderstanding here.

|U03HHA1DV9D|:
If you end up looking at the presentation times given by media samples read back from a movie file, you'll find that the timeline of every movie file starts at zero.

|U03HHA1DV9D|:
The presentation times of the incoming samples are shifted.  I'm not super-expert with AVAssetWriter, but I have the feeling that when you set the session to start at zero you are nullifying this normal adjustment.

--- 
> ####  We are using the camera to take photos for photogrammetric reconstruction. What are some tips and best practices for getting the best results (in terms of configuring the camera and capture settings)? In this use case we want to use the camera as a light measuring instruments. So we do not want any tone mapping, and a predictable mapping from linear intensities (photon counts) to recorded pixel values, so that we can invert it and get back to linear intensities.  Pro RAW seems potentially ideal(?), but is only supported on a small percentage of devices, and would be too large a format for us to send to servers for reconstruction.


|U03HR90DADU|:
Hi!  This is a deep question.  Capturing Pro RAW (or Bayer RAW) is your best option to get access to non-tone mapped data, but as you mention the formats supporting these are large, and Pro RAW is not supported on all devices.

|U03HR90DADU|:
I encourage you to try -[AVCaptureDevice globalToneMappingEnabled] to at least avoid local tone mapping.

|U03JRPTG8BS|:
Thank you! But is that not just for global (non-local) tone mapping, judging by the name?

|U03JRPTG8BS|:
I looked at the documentation and I think I understand. Turning this on disables local tonemapping.

|U03HR90DADU|:
Yes, it will give you data that is globally tone mapped.  Currently it’s not possible capture linear data, or something that can be converted into linear data.

|U03JRPTG8BS|:
But if I use an sRGB color space, could I not then use the known sRGB formula to get back to linear intensities?

|U03HR90DADU|:
Are you interesting in streaming data?

|U03JRPTG8BS|:
Or are there other unknown global tone mapping operators happening?

|U03JRPTG8BS|:
No, I am interested in discrete images taken during an ARKit session.

|U03HR90DADU|:
Yes, there’s a scene dependent global tone mapping applied

|U03JRPTG8BS|:
And no way to get that mapping I assume?

|U03HR90DADU|:
Correct.

|U03JRPTG8BS|:
:pensive:

|U03HR90DADU|:
It would be good if you could file a feedback request with your use case.

|U03JRPTG8BS|:
Will do. Thank you for the insights.

|U03JRPTG8BS|:
Where available Pro RAW should be exactly what I want, right? (Except for file size)

|U03HR90DADU|:
This is a common request.  Please drop my name in the feedback request.

|U03HR90DADU|:
Yes.  Pro RAW should give you want you want.

|U03JRPTG8BS|:
I think we actually had a nice lab conversation last year. Nice to meet you again!

|U03HR90DADU|:
You too!  Quite a different topic last year IIRC

|U03JRPTG8BS|:
<@U03HR90DADU> Yes, last year we talked about minimizing camera shake blur and latency (after the shutter press) while taking photos for a computer vision application.

--- 
> ####  How can I get the Mac webcam in a Catalyst application? Using the iOS code, the camera looks cropped.


|U03HXTBNYBC|:
This is probably because your app is declaring that it supports the portait mode, so we have to crop in on the camera frames to make them fill your app's preview. If you support landscape orientation, we should give you an uncropped view.

|U03HVDF8N6A|:
Will look in to that. Thanks (: great work!!

--- 
> ####  I'm using `.photo` sessionPreset to capture fullRes photos. But at the same time I want to record video via AVAssetWriter in 1920x1080 (without any session's reconfiguration). How can I configure AVCaptureVideoDataOutput to get from the delegate sampleBuffers with correct sizes (1920x1080)? I know about `automaticallyConfiguresOutputBufferDimensions` and `deliversPreviewSizedOutputBuffers` properties. But their combinations produces 1284x1712 or 3024x4032 outputs.


|U03HHA1D44F|:
In tomorrow's session "Discover advancements in iOS camera capture" we go over how to do this in iOS 16.

You can set the width and height in the `videoSettings` property on an AVCaptureVideoDataOutput to receive custom dimensions.

See: <https://developer.apple.com/videos/play/wwdc2022/110429>

|U03HHA1D44F|:
You can specify the width and height width `kCVPixelBufferWidthKey` and `kCVPixelBufferHeightKey`, respectively

|U03K8L1DCSU|:
<@U03HHA1D44F> Am I correct that `kCVPixelBufferWidthKey` and `kCVPixelBufferHeightKey` don't work on iOS &lt; 16?

|U03HHA1D44F|:
correct

|U03K8L1DCSU|:
Thanks

|U03HHA1D44F|:
However, it's important to note that you cannot receive 1920x1080 when using the photo session preset as that resolution is 4:3, often 4032x3024.

When specifying the width and height in the AVCaptureVideoDataOutput's videoSettings. The aspect ratio must match the aspect ratio of the source camera's format

|U03HHA1D44F|:
So you could request 1920x1440, which is 4:3, when using the photo session preset

--- 
> ####  Tô use my camera app on Sideview on iPad, I need special entitlements? Anyone can get it or is a bit restrict?


|U03HXTBNYBC|:
Before iOS 16, yes, there's an entitlement granting process that requires filling out a form. In iOS 16 and later, there's API to opt in for multitasking support (sideview/slideover).

|U03HVDF8N6A|:
Nice. Thanks!!

|U03HXTBNYBC|:
There's a session dropping tomorrow that you'll want to watch called "Discover advancements in iOS camera capture: Depth, focus, and multitasking"

|U03HVDF8N6A|:
Going to check it. 

--- 
> ####  I found that I have to access `inputNode` of `AVAudioEngine` before starting the engine to be able to use it. This means the permission dialog will be presented before the engine is running and also the recording indication in the status bar is present. Is there any way to start using the input node later, when the engine is already running. I found I get mostly sample rate mismatch errors if I don't access the input node beforehand. I was not able to find a combination, any tips on how to solve this?


|U03HXTBNYBC|:
This is a great question to ask over in the <#C03H9J5AW4U|>. We don't have any AVAudioEngine experts in the room right now.

--- 
> ####  iPhone can be free from the Mac or need to be “mounted” on the top? Can I walk with the Phone for example?


|U03HV023K2R|:
The specific placement, orientation of the phone is required for automatic switching. But yes, you can use Continuity Camera when walking with your phone.

|U03HVDF8N6A|:
Thanks Karen

|U03DJTBMHFF|:
FYI: We actually show a demo of exactly that in the _What's new in Create ML_ session which dropped today.

|U03HXTBNYBC|:
If your phone is not in a stand, it will still be offered in the list of cameras, but it won't be designated at the `systemPreferredCamera` until you place it in a stand.

|U03HXTBNYBC|:
By the way, it doesn't need to be clipped to the top of a macbook. It can be in any stand of your choosing, as long as it's landscape, stationary, screen off, and close by to the mac.

|U03HVDF8N6A|:
Go it. The stand needs to have some chip? Or only checks for proximity and orientation?

|U03HVDF8N6A|:
Nice. Great to know

|U03HV023K2R|:
We check phone's proximity and orientation. No chip in stands :slightly_smiling_face:

|U03HHA1D44F|:
<@U03DJTBMHFF>, Create ML demonstrated Wombat?

|U03HHA1D44F|:
I don't see Wombat in this video

<https://developer.apple.com/videos/play/wwdc2022/110332/>

--- 
> ####  Is it possible to connect multiple iOS devices to the same mac, and use continuity camera to capture multiple video streams simultaneously?


|U03HV023K2R|:
It doesn't support streaming multiple continuity cameras at the same time right now. But you can have multiple iOS devices around and switch between devices.

|U03HZ4B0S1K|:
would love the ability to stream multiple devices at once, we're doing this at <https://detail.co%F0%9F%99%82|https://detail.co>:slightly_smiling_face:

|U03HXTBNYBC|:
Neat!

|U03JKQJ4SA0|:
Will Managed AppleIDs work with this feature? Despite Continuity in full NOT  being a feature supported with MAIDs?

--- 
> ####  Seems there is a slight lip sync issue when Karen is using Continuity Camera, so which mic is used from iPhone or from the Mac? Is it configurable through API?


|U03HV023K2R|:
The audio in the session is from filming. You can use either built-in mic or Continuity Camera mic with the Continuity Camera. The Continuity mic can be found with both AVAudioSession and AVCapture APIs.

|U03HXTBNYBC|:
And the A/V sync is good! :slightly_smiling_face: Whether you use a built in mic or the iPhone's microphone, we take care of it for you.

|U03J7MQP71R|:
I see, thanks :slightly_smiling_face:

--- 
> ####  Continuity features (so far at least) have not been supported for Managed AppleIDs - does the Camera Continuity adhere to the same restriction?


|U03HV023K2R|:
Yes, it has the same restrictions as other continuity features.

|U03JKQJ4SA0|:
:disappointed: Thank you

--- 
> ####  Do continuity camera sample buffer timestamps account for network delay? If you use a continuity camera and a macOS connected USB microphone, will the timing between them match up?


|U03HV023K2R|:
Yes, it's all covered! The buffer timestamps from continuity camera will reflect capture time on the phone converted to mac's timeline.

|U03HZ4B0S1K|:
Great, thanks Karen!

--- 
> ####  Is there any lossy compression/encoding applied to the iOS camera stream that would result in lower quality recordings compared to recording on-iOS device?


|U03HV023K2R|:
Technically there's a lossy compression applied during transport. But it's sufficiently high bit rate that we think you won't notice quality loss.

--- 
> ####  Does Continuity Camera allow access to the LiDaR scanner as well? Can it be used to support ARKit effects on Mac?  Thanks!


|U03HXTBNYBC|:
Currently we only support the wide angle RGB camera (the one with the best quality!). We do internally switch to the Ultrawide camera when Center Stage is enabled. And DeskView also uses the Ultrawide camera. There is currently no access to the telephoto lens (if present) or LiDAR camera (if present).

|U03JMNR97J7|:
Ah, alrighty, understood! Thanks for the quick response Brad. I’m so excited for this feature, it was something that I didn’t even realize how much I needed. If you ever do get telephoto/LiDAR access going that would be huge in my opinion. :wink:

Thanks so much to yourself and team!

--- 
> ####  Can we leverage the increase-memory-limit entitlement within an image &amp; video processing app? Can we give Core Image access to more memory for processing and caching?


|U03HB0AV6S3|:
We are actively working on this.  Feel free to also file an enhancement request if you need a specific need addressed.

--- 
> ####  Is it possible to write a CoreImage filter for compute, rather than render? I'd like to perform compute operations on the CVPixelBuffer of a depth map, which I can represent as a CIImage.


|U03HRLP9NSX|:
Hi, CoreImage does use Metal compute pipeline states to perform the chained CIKernel operations you apply to the image. When you encode renders with CI, it dispatches compute commands instead of render commands.

|U03JG9JF529|:
When I have tried this my values get mutated between what is returned in my metal code and what is rendered. Are there settings we need to change in the CIContext to prevent things like premultiplied alpha, and any other settings that might change / clamp / remap the outputs?

|U03HRMK2074|:
These might be helpful

|U03HRMK2074|:
<https://developer.apple.com/documentation/coreimage/cirenderdestination/2875443-alphamode?language=objc>

|U03HRMK2074|:
<https://developer.apple.com/documentation/coreimage/cirenderdestination/2875451-clamped?language=objc>

|U03HB0AV6S3|:
Also if you want, you can tell CI to disable color management using the the context option `kCIContextWorkingColorSpace : [NSNull null]` but use that with caution.

|U03HRLP9NSX|:
In addition to what Baljit mentioned, mutated pixel values could be due to color management. CVPixelBuffers often are tagged with color space metadata and CI by default would color manage the input data to the CIContext's 'working space' and then convert to the output destination's color space when the image is rendered. This is on by default since it is usually desirable. But you do have the option to disable color management  if you choose to. In the case of the depth map I think you'd want the data to remain linear. So either you can turn off color management as David suggested above, or set the render destination's color space to match the input.

|U03JG9JF529|:
Thank you all :slightly_smiling_face: I will investigate these options

|U03JG9JF529|:
Is there much performance overhead in rendering this (e.g. to bytes) from a CIContext to inspect the values, vs creating a metal buffer and inspecting them there? And does this change if I am using other `CIFilter`s such as masks

|U03HRLP9NSX|:
I don't think we offer an API to render to a MTLBuffer. If you're comparing rendering to bytes vs rendering to texture, I think the difference should be fairly minimal on devices with unified memory architecture. Synchronization between the GPU memory and system memory is required in both cases so I think it should be fairly close.

|U03JG9JF529|:
Thanks

|U03JG9JF529|:
There is a render to metal texture <https://developer.apple.com/documentation/coreimage/cicontext/1438026-render|function>. I wondered if it would be quicker than to bytes

--- 
> ####  We have `CIFilter.personSegmentation()`. Is there a way to generate the other segmentation mattes (skin, hair) from AVPhotoCapture on demand using CIImages?


|U03HB0AV6S3|:
Please file an enhancement request for that.  That said some Jpeg/Heic/ProRaw images already contain "aux images" for other segmentations.  You can get at these either though ImageIO or CoreImage APIs

|U03JG9JF529|:
Thanks, I will do. I was hoping to be able to apply this to video so can’t access those file types

|U03J20RJQ2X|:
Does the person segmentation filter return the same results as a VNGeneratePersonSegmentationRequest? I just learned they added a filter as well

|U03JG9JF529|:
It seems to do from my experiments

|U03JG9JF529|:
The quality parameters give the same sized buffers as results

|U03J20RJQ2X|:
<@U03JG9JF529> Interesting, I’ll have to give that a try!

--- 
> ####  Is there any chance of seeing a CIFilter for film grain, that’s more natural looking than the CIRandonGenerator?


|U03HB0AV6S3|:
Please file an enhancement request.  That would be great to add.

|U03HVE4BEBY|:
Will do!

|U03HB0AV6S3|:
You may also want to try the `CIDither` filter.

|U03HVE4BEBY|:
I’ll have a look at combining that with the random noise maybe, though I'm hoping to filter a live camera feed, hopefully it'll be performant enough. (Also CIDither doesn't seem to be listed on the Core Image Filter Reference page)

--- 
> ####  I'm trying to blur the background of a photo, similar to what Portrait Mode does, using a matte of the person. What's a good approach to filling the area inside the subject so that there's no halo around the person when blurring the image?


|U03HB0AV6S3|:
The simplest approach is to:

|U03HB0AV6S3|:
• make a CIImage from the image where the foreground pixels are made transparent

|U03HB0AV6S3|:
• blur that image

|U03HB0AV6S3|:
• device that image by its alpha channel 

|U03HB0AV6S3|:
• use SourceOverCompositing to put the foreground image over the above result.

|U03J20RJQ2X|:
<@U03HB0AV6S3> thanks for the reply! By “device that image by its alpha channel”, do you mean making the transparent pixels opaque? That sounds like a good approach, I’ll give that a try

|U03HB0AV6S3|:
I meant to type "devide that image by its alpha channel"

|U03J20RJQ2X|:
Oh of course! Thanks!

|U03HB0AV6S3|:
WIth a custom CIKernel like this:

|U03HB0AV6S3|:
```
    float4 alpha_denorm (sample_t i)
    {
        if (i.a &gt; 0.001)
            return float4(i.rgb / i.a, 1.0);
        return i;
    }
```

--- 
> ####  Since CIFilters aren't thread safe, what would be the recommended way to structure a render pipeline if I want to use Swift concurrency? Especially when one wants to initialize the filter once and reuse it for multiple renders.


|U03HRMK2074|:
It is safe to render CIImage output of CIFilter on mulitple threads (and will be concurrent if you use different instances of CIContext)

|U03JRQ486FJ|:
Thanks! Yes but initializing a filter from a raw file takes quite a while, so I would like to reuse the first instance when adjusting. I assume the filter will always have to be on the same thread?

|U03HB0AV6S3|:
If I recall correctly, the CIRawFilter implements the `copy` method.  That should be faster.

|U03JRQ486FJ|:
Yes I tried the copy method but renders became unfortunately corrupt when using the copied version.

|U03HRMK2074|:
We would appreciate a feedback/bug report for that

|U03JRQ486FJ|:
I will file a report. Good to know that the copy method should work. Would love to further discuss different options during a lab session.

--- 
> ####  Which CI filters would you recommend running in linear space?


|U03HB0AV6S3|:
Most CIFilters are designed to work in linear space.  The notable exceptions are the the Blend filters and Compositing filters.  These can work in linear space by may artists are more familiar using them in a perceptual colorspace.

|U03HB0AV6S3|:
(eg. CIScreenBlendMode and others)

|U03JRQ486FJ|:
Thanks! Would the recommendation be to run most filters in the linearSpaceFilter with a RAW file? And change the context working space to linear when working with non-raws?

|U03HB0AV6S3|:
I would (with some exceptions) use linear for raw and non raw image.  Feel free to schedule a Lab to discuss further.

|U03JRQ486FJ|:
I wasn't aware that I could use the linearSpaceFilter for non raw's. Will try that! A lab has already been requested :slightly_smiling_face:

--- 
> ####  Can I use CIAreaAverage to get the average color except transparent areas?


|U03HB0AV6S3|:
Yes the `CIAreaAverage` filter is essentially an alpha-weighted average.

|U03JHAD6E3T|:
Oh, alpha-weighted average! Thanks!

--- 
> ####  Is there a good approach to color matching two photos with core image? Such as when superimposing a person on a different background, so the photo's hue, saturation, maybe contrast and brightness, somewhat match the new background


|U03HB0AV6S3|:
You might consider using the Reduction filters such as CIAreaAverage or CIAreaHistogram to collect some stats on the two images. You can then use this stats to make one better match the other.

--- 
> ####  Is the LiDAR-based depth data capable of being embedded in a HEIC, similar to how disparity-based depth data is?


|U03JMLKUF1N|:
Hi Brandon, yes. Depth generated with the `AVCaptureDeviceTypeBuiltInLiDARDepthCamera` can be embedded in HEIC just like depth generated from other cameras.

--- 
> ####  Is it possible to get the raw point cloud representation from the LiDAR camera through AVFoundation, rather than an ARKit/Metal-based session?


|U03HXTBNYBC|:
Unfortunately no. The closest thing to it would be to turn off depthDataFiltering on the AVCaptureDepthDataOutput and then get depth data objects which will contain the full field of view of the wide camera / LiDAR camera, but will have holes (NaN pixels) where LiDAR spots were unavailable.

|U03J20E7UBV|:
Thanks, <@U03HXTBNYBC>!  There's something very fun and magical about capturing point clouds lol, and am always curious of the technologies that allow for this.  Appreciate your help and hard work on this new technology!

|U03JMB7160Z|:
It's point clouds all the way down. :nerd_face:

|U03HXTBNYBC|:
To <@U03J20E7UBV>’s last comment, it really does help to understand that AVFoundation's LiDARCam is really a marriage between time of flight technology and machine learning "hallucinated" depth — guided by the LiDAR spots. It just wouldn't be that useful with the LiDAR hardware alone. Together, they really advance the state of the art for depth data acquisition on iOS products. They give you great video quality, high resolution depth, and real-world scale, all in one package. They're also faced away from you, unlike the TrueDepth camera, so now you've got real-world scale options in both directions.

|U03J20E7UBV|:
Thanks, <@U03HXTBNYBC>!  It's always been super cool to be able to get depth data from our devices, but having that added accuracy and high-resolution depth, alongside now higher capture quality, is really huge!

--- 
> ####  The multitasking camera features seem geared towards video chat apps. Are you expecting pro camera apps to adopt this, and will the native camera app adopt this behaviour?


|U03HHA1D44F|:
Multitasking Camera Access is often used by video chat apps. But it can be used by other apps. The built in Camera app requires itself to be full screen. But you can have a Slide Over app on top of it to multitask. Like opening Notes on top

|U03HHA1D44F|:
See for example this screenshot from the video. This is Apple's built in Camera app

|U03HVE4BEBY|:
Got it! Thank you. 

--- 
> ####  Hi! I've watched the video to live text interaction and i was wondering, if the quick actions can be customized to add own functions?


|U03DJTBMHFF|:
Excellent question. The quick actions are all driven by built-in data detectors. There is no opportunity for extending that or customizing those at this time. That said, we'd love to hear what kind of customizations you were hoping to provide.

|U03HMD7BXPZ|:
Thanks for the answer. It would be great to just add functions like “Apply for the textfield” or “Generate new case/entry” and the recognized text can just be added to own textfields or used as titles.

--- 
> ####  Will we ever see a public API for using the hardware volume buttons to capture photos? The current.. workarounds are less than ideal :unamused:


|U03HXTBNYBC|:
Magic eightball says: "Outlook uncertain".

|U03HXTBNYBC|:
Thanks for the feedback, Ben. We're asked about that a lot. Have you filed a request through Feedback Assistant?

|U03HVE4BEBY|:
If I have it wasn't recently! But I brought it up in a lab yesterday, so I'll submit one now to hopefully give a little boost in priority

--- 
> ####  There’s an API to get tagged faces out of a photo (at least the region within the photo where there’s a face, not sure about the persons name..). I thought there might be a way to manually tag faces that the auto Apple tagging hadn’t picked up, but I couldn’t find a way to do this, is it possible? Something you’d consider adding to either the api or the photos app if not?


|U03HXTBNYBC|:
Using the ImageIO APIs &lt;ImageIO/CGImageProperties.h&gt; you can load up an image on disk and inspect its metadata. Detected faces are held within the `kCGImagePropertyExifAuxDictionary` 's @"Regions".

|U03HXTBNYBC|:
Is that what you had in mind by "tagging", or something else?

|U03JASKNME1|:
That's probably where I found the data, but it didn't seem possible to add to it and update it so the photos app would show those additions?

--- 
> ####  This is about AVCaptureDevice.  Will there be a public API to check on the lens power of the camera?  This would be exceedingly useful if the device is a telephoto camera (that is, is it 2.0x optical power, or 2.5x or 3.0x, or some future power?)  This would be great for any camera app where the user manually selects the lens to use (no virtual device)  as well as set manual shutter speed &amp; ISO.  Thanks!


|U03HVE4BEBY|:
Seconded! This is definitely more awkward than it should be

|U03HR8XVATG|:
Hi Eric, Ben. could you clarify what you mean with "lens power"? Are you referring to the focal length / native zoom?

|U03HVDWU0ES|:
Hi Ben.  What I mean is, say I don't know if the user has the iPhone 12 Pro that has the 2.5x telephoto, or the iPhone 13 Pro that has the 3.0x tele.  It would be wonderful to look at one get variable to see if it's a 2.5x or 3.0x, instead of doing the cumbersome task of determining that the user does have say an iPhone 12

|U03HR8XVATG|:
The `-[AVCaptureDevice virtualDeviceSwitchOverVideoZoomFactors]` property tells the relative zoom factors between the cameras. So if you're looking to build a UI around these switch-over zoom factors, then you'll want to use that.

|U03HVE4BEBY|:
In order to know if the telephoto camera is 2×, 2.5× or 3× (and display it to the user), you have to get the video field of view, then work out how that angle translates to a focal length, and how that focal length gets generalised

|U03HVDWU0ES|:
I did check that variable and it reads empty brackets if there is no virtual device.  I'm having the user manually select whether to use the wide lens or the telephoto, not rely on a virtual camera to do that.

|U03HVE4BEBY|:
This is how I handle it in my app

|U03HR8XVATG|:
You can programmatically pick the virtual camera device and then query that property. It's a static property on the device in question, so it does not change depending on whether the device is connected to a session or not.

|U03HVE4BEBY|:
(I feel like we may be trying to solve slightly different problems, apologies for hijacking!)

|U03HR8XVATG|:
Also note that the zoom factor of the widest FOV constituent device is always defined as 1x. If you want to build something similar to <http://Camera.app|Camera.app> where the wide-angle camera is defined as 1x then you'll want to divide the zoom factors by the wide-angle camera's switch-over zoom factor.

|U03HR8XVATG|:
One more note, on iPhone X, the telephoto camera's switch-over zoom factor is actually 1.8x (despite <http://Camera.app|Camera.app> showing 2x).

|U03HR8XVATG|:
We didn't want to confuse users with too much technical detail, so we use 2x in the UI.

|U03HR8XVATG|:
Eric, Ben, did this help answer your question(s)?

|U03HVE4BEBY|:
Querying the virtual camera is probably cleaner than what I'm doing, but it would still be nicer to just have it as a property on each camera device. In my case I'm using the individual cameras to enable raw, manual WB, etc 

|U03HVDWU0ES|:
Hi Jozef, thanks for the answers.  But in my app users not only have a zoom control, they also have push buttons to manually select what lens to use.  So for the iPhone 11 Pro I present three buttons:  0.5x, 1x, and 2.0x.  For the iPhone 13 Pro I present these:  0.5x, 1x, and 3.0x.  Right now I do a roundabout way to know whether to call the button that connects to the telephoto camera a 2.0x or 3.0x.

|U03HR8XVATG|:
I believe the API I mentioned solves both of these problems. Just query for it on the Triple Camera device and you have all the zoom factors you need.

|U03HR8XVATG|:
Ben, the problem is that these zoom factors are relative to each other, so they only make sense in the context of a virtual camera. Note that you get different numbers from the Triple Camera than from the Dual Camera because the baseline is different. On the Triple Camera the wide-angle camera is typically 2x while on the Dual Camera it's 1x. This is why this is a property on the virtual cameras and not on the physical ones.

|U03HVDWU0ES|:
Hi Josef, the key thing is that property is just for the virtual cameras.  I'm using only the physical cameras, and I just ask for a get variable that is valid only for the physical devices.

|U03HR8XVATG|:
I understand, but you can still use the virtual camera's property for this.

|U03HVDWU0ES|:
I propose that such a variable would read nothing if a virtual device is used to avoid confusing those who use the virtual camera.

|U03HR8XVATG|:
I'm sorry, I don't quite understand what you mean. Could you clarify?

|U03HVDWU0ES|:
I suppose I can load the virtual camera, read the property, then discard the device and load the physical device....

|U03HR8XVATG|:
Yes, that's exactly what I was proposing.

|U03HR8XVATG|:
And for what it's worth, all AVCaptureDevices get instantiated at the same time. So there's really no such thing as loading/discarding them.

|U03HVDWU0ES|:
I have my project open, I'll give it a try, thanks!

|U03HR8XVATG|:
Sure thing!

|U03HVE4BEBY|:
The issue is not knowing what the zoom factors are relative to each, but that the user understands 0.5x, 1x, 3x as shorthand to refer to the physical cameras because they're used in Apple’s marketing in this way

|U03HR8XVATG|:
If you want to use the wide-angle camera as the 1x, then you can just query this property on the Dual Camera. Either that, or you can query it on the Triple Camera and divide all of them by the wide-angle camera's switch-over zoom factor. Both options should yield the same result.

|U03HR8XVATG|:
The switch-over zoom factors are always relative to the widest FOV camera in the virtual device. So for the Triple Camera the ultra-wide camera is the base (1x), while for the Dual Camera the wide-angle one is the base (1x).

|U03HXTBNYBC|:
Sounds like, <@U03HVE4BEBY>, you should file a feedbackassistant request for us to provide an API that maps the actual zoom factors to "marketing friendly" zoom factors that match Apple's built in camera app.

|U03HVE4BEBY|:
I think using the virtual cam zoom factors is definitely cleaner than my approach of using the field of view, so I'll switch to that as you've suggested <@U03HR8XVATG> but also yes I'll file a feedback to be able to check for a quick and basic "label" <@U03HXTBNYBC> Thank you both!

|U03HVDWU0ES|:
Hi Brad,  it sounds like the solution I had in mind in starting this thread.  You expressed it perfectly, I'll file a feedback myself too, thanks!  And Ben, thanks for your input!

|U03J22YQMK4|:
I appreciate all of you talking this through and answering my questions w/o me having to ask :smile:

|U03HVDWU0ES|:
My thanks to the Camera team for a couple of great digital lounges this week! I just wanted to provide the team with the number of a new Feedback Assistant request, FB10137353,  that addresses what was discussed in this long thread. It’s the proposed API to map a ‘marketing friendly’ zoom factor for a physical AVCaptureDevice.  It has the solution that was well voiced by Brad Ford in the wrap up to this discussion.

Again, many thanks!

--- 
> ####  How would you recommend to detect a blurry image? The image can be of any resolution allowed by a camera, or may be imported into Photos. Live photos and videos are excluded.


|U03DJTBMHFF|:
Hi, Kiril. I think that Core ML may be your friend here. There are many models floating around in research circles like this one: <https://arxiv.org/abs/2010.07936>

|U03JV9KH3G9|:
Thanks!

|U03DJTBMHFF|:
Using coremltools, you could convert the model to Core ML format and then use it inside the Vision framework to get your predictions of image quality.

|U03DJTBMHFF|:
If you want to dive into this a bit further with Core ML Engineering, there are lab appointments available tomorrow.

|U03JV9KH3G9|:
Got it Thank you very much

|U03HY66772A|:
If you need get least blurry image from a video / sequence of images, you can compute laplacian (MPSImageLaplacian), and than compute maximum using MPSImageStatisticsMinAndMax. Then, image with the smallest resulting value should be least blurry.

You can try to get a treshold, below which you can consider image blurry, but it may fail in some cases, e.g. when you take a picture of a wall with no obvious edges.

|U03HB0AV6S3|:
You could also do this in Core Image by taking a `CIAreaHistogram` of a `CIGaborGradients`.

|U03HB0AV6S3|:
Or perhaps `CIAreaAverage` of `CIGaborGradients` which would be faster.

|U03HB0AV6S3|:
I would recommend using Gabor over Laplacian because even a blurry image will contain noise.  Gabor (a 5x5 convolution) is less affected by noise than Laplacian (a 3x3 convolution).  In fact you my want to consider a 7x7 Gabor.

--- 
> ####  in the Creating Camera Extensions session, you said that CMIO Extensions can be video sinks, but these sinks don't have an AVCapture interface, we have to use the C APIs. Which APIs are these? I cannot find any examples of *using* a DAL plug-in this way. We have *implemented* DAL plug-ins as virtual cameras, but we *use* them through their AVCapture interfaces. From my app, I can find the CMIObject corresponding to my Camera Extension, (it is of class 'aplg', isExtension is true, and it has the correct bundle ID). But how do I go from that to making an API call to feed frames from my app to the extension?


|U03HXTBNYBC|:
Hi Stuart. The C APIs to which I referred are the CoreMediaIO interfaces called by apps (rather than extension / plug in developers).
CMIOHardware.h, CMIOHardwareDevice.h, CMIOHardwareStream.h

|U03HXTBNYBC|:
CMIOHardwareSystem introduces the concept of a "System" object (`kCMIOObjectSystemObject`) that can be queried for its devices (`kCMIOHardwarePropertyDevices`).

|U03HXTBNYBC|:
Once you've got the list of devices, you can query them for various properties, such as unique ID, or streams. You can, for instance, see if it has streams on its output scope (output streams instead of input streams).

|U03HXTBNYBC|:
You push sample buffers to output streams, and these are outputted to a video deck or some other external piece of hardware that accepts a stream of video.

|U03HXTBNYBC|:
It may help your mental model, <@U03JDS776JH>, to know that the AVCapture* APIs on macOS are clients of the CMIOHardware* APIs. They wrap the functionality in a more modern, friendly, swift/obj-c compatible way, and they hide some of the complexity one takes on when dealing with the CoreMediaIO APIs directly.

|U03HXTBNYBC|:
To be clear, you don't need to search for your DAL plugin (the plugin object), unless there's a property that you want to set on the plug-in itself. For instance, if you had some property that's global to your entire extension, and all devices it vends. Typically, you'd just ask the system object for the list of CMIODeviceIDs, and then iterate through them, searching for the characteristics that fit your criteria.

|U03JDS776JH|:
ok. So I query the system object for its kCMIOHardwarePropertyDevices, query those objects for their kCMIODevicePropertyStreams, querty those objects for their kCMIOStreamPropertyDirection etc. But I’m unclear what the API is to push buffers to the stream. Also, “input” and “output” are from the point of view of the extension itself, right?

|U03HXTBNYBC|:
AVCaptureDevice APIs hide CMIODeviceIDs that only contain output streams.

|U03HXTBNYBC|:
You don't need to query them for their direction.

|U03HXTBNYBC|:
That property is there for legacy stuff like DV cameras, which can be input or output streams, depending on what mode you've set the camera to be in (playback mode or recording mode).

|U03HXTBNYBC|:
Just search for streams on the *output* scope rather than the *input* scope.

|U03HXTBNYBC|:
That will give you the exclusively *sink* streams.

|U03JDS776JH|:
that’s good to know (output==sink)! But still, what’s the API to push a frame to CMIOObject?

|U03HXTBNYBC|:
You push frames to a CMIOStream.

|U03JDS776JH|:
with CMIOStreamCopyBufferQueue to get the queue, then I push somethings onto that queue? And why would I want queueAlteredProc?

|U03HXTBNYBC|:
Call `CMIOStreamCopyBufferQueue` to get its simple queue. You can add frames to that queue when you're ready. (If it's an input stream, you'd listen for when the queue was altered and dequeue the new frame or frames).

|U03HHA1DV9D|:
There are also some other handy stream properties:

|U03HHA1DV9D|:
kCMIOStreamPropertyOutputBufferUnderrunCount, kCMIOStreamPropertyOutputBufferRepeatCount, kCMIOStreamPropertyOutputBufferQueueSize, kCMIOStreamPropertyOutputBuffersRequiredForStartup, kCMIOStreamPropertyOutputBuffersNeededForThrottledPlayback, and kCMIOStreamPropertyFirstOutputPresentationTimeStamp.

|U03HHA1DV9D|:
Also:

|U03HHA1DV9D|:
kCMIOStreamPropertyScheduledOutputNotificationProc

|U03JDS776JH|:
thank you this all extremely helpful. I have to run to a lab now but I posted another question on a slightly different topic. I hope to see you at a lab tomorrow

|U03HZ4B0S1K|:
If we want to do something like OBS where we have an application that renders video frames and passes them to a DAL plugin for people to select as a virtual webcam, is the recommended approach to create both a source and sink stream, and route frames in the extension from the sink to the source.  Then in the app send frames to the sink?

|U03HXTBNYBC|:
That's one approach. In the CMIOExtensions video (available now! and....watch party in 10 minutes), I describe a different technique where you can run physical streams from other cameras right within your CMIOExtension. We call this case "creative camera".

--- 
> ####  There are currently 3 frameworks for image processing: Accelerate, CoreImage filters, and Metal. For example, if we take a "black &amp; white conversion" of the image: we can use Accelerate to accomplish it, a `CIFilter` (e.g. `CIColorMonochrome`), or create a Metal shader.  What are your recommendations for using each framework? E.g. in which cases each framework is preferable to others, or should be avoided? And is it OK mixing them, or should that (as a general rule) be avoided?


|U03HB0AV6S3|:
As you say, there are several ways to achieve the same "monochrome" result.  The best will likely depend on what else you want to do and other factors.  For example if you want to combine monochrome with other effects you want to pick a strategy that that avoids switching back and forth.  Switching say between CPU and GPU will introduce stalls and increase memory.  Another thing to consider is if you need to deal with imaged that are large sizes or with HDR color spaces.  In that case a higher lave framework will have that built in.

|U03JV9KH3G9|:
I guess the main reason for me to look for CI alternatives was that conversion from CIImage (with several filters) to CGImage or to JPEG representation of the image took a very long time (5-10 sec) and a lot of memory (for larger images especially). Is that generally a point where you'd say: yes, in those cases switch to Accelerate or Metal, or could it be related to a particular (possibly incorrect) use of CIFilters?

|U03HB0AV6S3|:
You might want to try going directly from `CIImage` to JPEG using API like `JPEGRepresentationOfImage:colorSpace:options:`.  A time of 5 to 10 seconds seems very slow.  How big is the image?

|U03JV9KH3G9|:
raw image taken on iphone 10 for example

|U03HB0AV6S3|:
For a RAW image using CoreImage is the fastest/easiest way to produce a demosaiced and denoised result.  This is non trivial but 5 to 10 seconds seems slow to me.  Here are some suggestions:
• use the `CIRAWFilter` API to have more control (for example you can set `.scaleFactor` if you just want a half sized image.

|U03HB0AV6S3|:
• create the `CIContext` with the option `kCIContextCacheIntermediates` set to `@NO` to minimize memory usage.

|U03JV9KH3G9|:
Great suggestions, thanks. I wasn't using either - hence probably the timing and memory.

|U03HB0AV6S3|:
FYI: there's another question/discussion about `CIRAWFilter` in this channel today.

--- 
> ####  Is there a way to get a transform from original frame to a stabilized one? We have custom AR content overlaying video, and wanted to preview non-stabilized video for less latency, and write cinematic stabilization to a disk. However, as we need to render AR stuff over video, and we don't want to run pipeline twice, and with transforms we could just transform what we rendered once to a stabilized frame.


|U03HV023K2R|:
This is an interesting one! There's currently no API to perform video stabilization but only expose stabilization transform without applying it onto frames. Could you file a feature request for this?

|U03HY66772A|:
So there is a way to expose stabilization transform? (Without applying stabilization)

|U03HY66772A|:
Sorry for asking, but could you direct me where should I file this request?

|U03HV023K2R|:
Hi Viacheslav, exposing stabilization transform is currently not supported. You can file feature request here <http://feedbackassistant.apple.com|feedbackassistant.apple.com>.

|U03HXTBNYBC|:
<@U03HY66772A> are you familiar with the new feature in iOS 16 which allows you to run *multiple* video data outputs? You can run one with no stabilization for preview, and run a separate one *with* stabilization for writing to disk. This would require running the pipeline twice, but you could potentially run a lower quality algorithm for the realtime feed, and a higher quality version of it for the one being written to disk.

|U03HY66772A|:
Sadly, we are running on the edge of performance targets, and rendering twise would mean waiting for video to process after the fact for some time for our users

|U03HY66772A|:
But you definetly could run two connections with different stabilization options before? At least for preview and for writing on disk. (I think that’s how Apple Camera app works)

--- 
> ####  Question about CIRAWFilter - does `scaleFactor` do the same thing as in `CIFilter` with RAW options?   ``` let ciImage = CIImage(data: self.imageData)! let ciFilter = CIFilter(imageData: self.imageData, options: [ .scaleFactor: 0.25 ])! let ciRawFilter = CIRAWFilter(imageData: self.imageData, identifierHint: "com.adobe.raw-image")! ciRawFilter.scaleFactor = 0.25 print("CIImage", ciImage.extent) print("CIFilter", ciFilter.outputImage?.extent) print("CIRAWFilter", ciRawFilter.outputImage?.extent) ``` Prints ``` CIImage (0.0, 0.0, 5952.0, 3968.0) CIFilter Optional((0.0, 0.0, 1488.0, 992.0)) CIRAWFilter Optional((0.0, 0.0, 5952.0, 3968.0)) ```  See that the `CIFilter` version scaled the extent but the `CIRAWFilter` did not.   More importantly, is scaling here an effective way to improve performance of RAW editing? Any other options or things to keep in mind for performance specifically?


|U03HB0AV6S3|:
Big yes.  Using the `.scaleFactor` on the `CIRAWFilter` class will give a big benefit in performance.  It reduces the amount of memory needed as well and reduces the amount of noise reduction that is needed.

|U03HB0AV6S3|:
Asking the filter for `.nativeSize` will always give the full size of the asset.

|U03HB0AV6S3|:
Asking the filter for `.outputImage.extent` should give the scaled size (assuming that you set `.scaleFactor` before)

|U03HB0AV6S3|:
Please file a bug report on the `ciRawFilter.scaleFactor` / `ciRawFilter.outputImage?.extent` issue.  That should give you the smaller extent.

|U03JBH50UAE|:
Thanks <@U03HB0AV6S3>! Will do.

|U03HB0AV6S3|:
You might try toggling one of the other properties to see if that helps.

|U03JBH50UAE|:
Is there any workaround to scale using CIRAWFilter? Or have to fall back to CIFilter for now?

|U03HB0AV6S3|:
Try setting `.orientation` to a different value and then back again?

|U03HB0AV6S3|:
That property also alters `ciRawFilter.outputImage?.extent`

|U03JBH50UAE|:
No luck. Setting `ciRawFilter.orientation = .left` swapped the dimensions but still at full size. I tried both orders of orientation, scaleFactor

|U03HB0AV6S3|:
If we find a workaround we will note it in your bug report.

|U03JBH50UAE|:
much appreciated! I’ll file that asap

--- 
> ####  I was told the resolution of LiDAR depth data from ARKit had been for accuracy down to around the size of a table leg, or accuracy within a few inches. With AVFoundation having greater depth resolution, is there a kind of rule-of-thumb in terms of accuracy down to set distance, or down an object size, like a tooth?


|U03JMLKUF1N|:
Hi Rob, unfortunately we don’t have a hard and fast rule for how small the objects can be at a given distance, but in general the AVFoundation LiDAR Depth Camera can detect finer details — for example the edge of table will be straighter/sharper than ARKit due to the increase in pixel resolution.

|U03JMLKUF1N|:
A tooth at 5m from the camera is probably too small.

|U03JRR26EU8|:
That makes sense, thank you. Just so I’m understanding, that’s 5 meters or 5 millimeters?

|U03JMLKUF1N|:
That's in meters.

|U03JMLKUF1N|:
You're welcome!

--- 
> ####  Hello! I understand this one is a bit tricky, but what does the magic 8-ball say about .builtInTripleCamera one day supporting ExposureMode.custom and manual focus? :innocent:


|U03HXTBNYBC|:
Hah! The problem with supporting custom exposure modes is that each constituent camera in the virtual camera has a different min and max iso and shutter speed. Apps written for the past ~10 years are not prepared for min and max ranges to suddenly jump or shift. We would certainly crash a lot of apps if we did this. Also, zoom level is not the only factor that might cause the virtual camera to switch from one constituent camera to another. For instance, on the iPhone 13 Pro, the ultrawide lens is preferred up close because it has such a small minimum focus distance.

|U03HXTBNYBC|:
So, we'd need to figure out a way to have a lot of properties jump — and jump atomically — when the constituent camera shifts. That's the reason custom exposure isn't supported on the triple camera.

|U03JDTS6RKP|:
Appreciate the detailed answer! Totally get it, logistically its messy. My immediate thought is to expose only common ranges supported across all lenses. As the developer of ProShot I'd gladly take that range hit, and then find my own creative way to visualize it to users in the UI :slightly_smiling_face:

|U03JDTS6RKP|:
At any rate, I really appreciate all the amazing work that's been going into these APIs, so much good stuff to work with! Thank you all

--- 
> ####  I've noticed that new version of my Camera Extension on macOS 12.3 aren't actually used until I restart, although 'systemextensionsctl list' tells me it is loaded and the old version is unloaded. Is this intended behavior?


|U03HXTBNYBC|:
<@U03JDS776JH>, in the sample project I built in the CMIO Extensions video (viewing party in half an hour!), the extension is loaded and usable immediately. No need to reboot.

|U03HXTBNYBC|:
Currently, uninstalling it does not take effect right away — you have to reboot before the extension is unloaded for all apps, and `systemextensionsctl` tells you that.

|U03HXTBNYBC|:
I verified the above behaviors on macOS 12.3, so I'm not sure why you'd be seeing a difference. Perhaps file a bug at feedbackassistant.

|U03HZ4B0S1K|:
do changes to the CMIOExtension take effect before rebooting? I tried a few weeks ago and found that uninstalling, reinstalling, and rebooting sometimes wasn't enough to update the extension

|U03HXTBNYBC|:
That should do it every time, Finn. (uninstall, reboot, reinstall). If you want to be completely neurotic, you could bump the version number of your extension. You need to make sure that your installer code is actually telling the system to update or replace the previous one (if you're installing over an old one).

|U03JDS776JH|:
it might be a caching issue. I bump the build number and change the name of the virtual device every time I make a change. Photo Booth will display the name of the build 84 after I’ve succesfully activated build 85, I only see build 85 after a restart. This is with SIP turned off and the hosting app _not_ in /Applications.

|U03HZ5T63N1|:
Can we download the sample project?

--- 
> ####  Is it possible to use camera directly in app extensions, especially in the keyboard extension? Or at least a Live text, but through our own UI?


|U03HHA1D44F|:
An iOS NSExtension? The only iOS NSExtension that supports camera access are iMessage Extensions

|U03JELM0ZNV|:
Can confirm iMessage extensions work with camera with one important bug with the plist permission entries (I think was fixed last year).

|U03HHA1D44F|:
Which bug is that? Involving the `NSCameraUsageDescription` entry in the Info.plist?

|U03JER2C7MX|:
<@U03HHA1D44F>
But should it be possible to use Live Text then, without directly getting access to the Camera?

P.S. for now, I constantly receive the following error:
```
Assertion failure in -[UIKeyboardCameraSession _keyboardCameraPreparationDidComplete]

Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Keyboard Camera is being used without remote keyboards enabled
```

|U03HHA1D44F|:
What API do you call to get Live Text in the keyboard?

I am not sure how the Keyboard Camera is implemented but if it tries to use the camera within your process, that makes sense why you are seeing that error

|U03JER2C7MX|:
<@U03HHA1D44F>

Live Text API has only two requirements to be called:
1. Have a UIResponder object
2. Have a UIKeyInput object
And I was trying to make my UIInputViewController as both of them while returning UITextDocumentProxy properties to satisfy the UIKeyInput protocol. It looked pretty valid from the design view.

And the code I’ve been trying to run is close to the similar:

```
class KeyboardViewController: UIInputViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        liveTextStraightButton.addAction(
            UIAction.captureTextFromCamera(
                responder: self,
                identifier: .paste
            ), for: .primaryActionTriggered
        )
    }
}

extension KeyboardViewController: UIKeyInput {
    var hasText: Bool {
        textDocumentProxy.hasText
    }

    func insertText(_ text: String) {
        textDocumentProxy.insertText(text)
    }

    func deleteBackward() {
        textDocumentProxy.deleteBackward()
    }
}
```

|U03JER2C7MX|:
<@U03HHA1D44F> hey again,

Couldn’t get to the lab today regarding this question. Would be grateful for some attention to the feedback ticket regarding that issue. It has a test project attached, which helps reproduce the issue:
&gt; FB10022377 Live Text: UIAction.captureTextFromCamera not working in keyboard extension

|U03HHA1D44F|:
Hi <@U03JER2C7MX>, I've brought FB10022377 to the attention of a colleague who is more familiar with this API to take a look. Thank you for including the test project in the radar!

|U03JER2C7MX|:
Wow, those are fantastic news, thank you! :scream::green_heart:

--- 
> ####  We've shipped a "modern" Core Media IO system extension in our app. However, we never could figure out how to connect to an XPC service defined in the extension's `CMIOExtensionMachServiceName` — and a DTS ticket didn't get us far either! Is it intended that we can communicate with our extension via the XPC using the mach service? If not, what are your recommended methods of communicating with the extension when we're delivering frames over that connection?


|U03HXTBNYBC|:
CMIOExtensions work a little differently from Endpoint or Network extensions. CMIOExtensions are run a a role user in a background process. That's why you're not able to find them with the named mach service.

|U03HXTBNYBC|:
Keep watching. I describe a method to talk to your extension through custom properties.

|U03HMDRQQ6B|:
<@U03HXTBNYBC> Thanks for the reply. Would custom properties be appropriate for delivering frame buffers in terms of latency/etc? Ideally we’d use the old technique of delivering IOSurface buffers via IPC.

|U03HXTBNYBC|:
No, custom properties would be for smaller state, such as strings or NSData. For frames, you should use IOSurface backed buffers.

|U03HMDRQQ6B|:
Is it possible to deliver such buffers to our CMIO system extension from our parent app?

|U03HHA1DV9D|:
Is the idea here that your app is capturing or generating real-time video and you want to get that to other camera-sourcing apps?

|U03HXTBNYBC|:
Yes. One way to do this is to present 2 devices in your extension. One that presents an *output* or *sink* stream, and one that presents an *input* or *source* stream. You push frames to the sink stream device, and then in the extension, re-publish it through the camera.

|U03HMDRQQ6B|:
<@U03HHA1DV9D> Yup! Our app connects to DSLR/mirrorless cameras over network or USB and lets them be used as webcams even if they’re not UVC devices (which most aren’t). For various reasons, it makes sense for that connection and processing to be going on in the parent app.

|U03HMDRQQ6B|:
<@U03HXTBNYBC> Ok great, thanks for the idea. We have a Feedback open (FB10026784) assuming the XPC thing is a bug — perhaps that should be changed to a documentation request clarifying what the mach service key is for.

|U03HXTBNYBC|:
As of right now, the mach service name is required so that CMIO's registerassistantservice recognizes the extension as a CMIO extension. But it's not currently used as a named /known XPC service that an app connects to. Thanks for the FB.

--- 
> ####  Are audio CMIOExtensions nearly identical to the sample video one, where I would just send audio CMSampleBuffers to the CMIOExtensionStream?


|U03HXTBNYBC|:
We do not recommend shipping audio drivers as CMIOExtensions. Most apps won't work with them. Stick to writing an Audio driver using HAL apis if you're delivering a pure audio driver.

|U03HXTBNYBC|:
Audio samples are sometimes interesting to deliver from a CMIOExtension if, for instance, your camera delivers a muxed stream. Like the built in iOS Screen Capture DAL plugin, you can present your stream as a muxxed media type, and then deliver video or audio samples once you're running.

|U03HVC012J2|:
I expect that shipping a HAL driver with my app would make App Store distribution difficult. It’d be nice to have something like a Camera Extension that works for audio.

|U03HZ4B0S1K|:
Hmm okay.  We have a HAL that we use to act as a virtual microphone that we can send any audio to (similar to BlackHole), and from this tweet: <https://twitter.com/KhaosT/status/1497711090183987204?s=20&amp;t=QwkmE9VvspUaWLmXO3-tyA> I assumed it would be possible to convert to a CMIOExtension for distribution on the app store.

|U03HXTBNYBC|:
You can certainly present it as a CMIOExtension. But most audio apps won't find it. They talk to the HAL, not the DAL.

|U03HZ5T63N1|:
How about FaceTime? Would that see the CMIOExtension as a "microphone"?

|U03HXTBNYBC|:
Unfortunately no.

|U03HZ5T63N1|:
In this case we need a replacement for the HALs as well!

--- 
> ####  one of the use cases is "providing pre-rendered content". But that content is likely to be large and on-disk as a file. But I thought Camera Extensions don't have access to the file system?


|U03HXTBNYBC|:
You're free to use pre-rendered content that resides in your extension's own sandbox. CMIOExtensions don't have general file system access though. They have a more locked down sandbox that regular apps.

|U03JDS776JH|:
yes, I just re-watched that bit of your video. So I could send a huge parameter set  (perhaps slowly) as a property, and the extension could cache that in its own container as a file. Can I pre-populate an extension’s container at build time?

|U03HVC012J2|:
This is a problem for our use case, too. One suggestion we got from DTS was to set up two devices from the extension - one as the virtual camera, and one as an output device. Then, the app should be able to stream media from the App’s sandbox (and user files) to the output device, which then would route them to the extension. I haven’t tried that out yet, to see how well it works.

|U03JDS776JH|:
yes, Brad mentioned that idea in a lab yesterday. In principle you can wrap *any* data up in a video buffer and send it, so you could even use a video queue if the property interface is too slow. If extensions were easier to develop and debug I’d be happy to put more intelligence in the extension, but at present I have to restart every time I rev my extension. So for me, for now, the extension if just a conduit for frames created elsewhere.

|U03HXTBNYBC|:
<@U03JDS776JH> What do you mean by "build time"? _Can I pre-populate an extension’s container at build time?_

|U03HXTBNYBC|:
I'm definitely hearing that rebooting to uninstall is a pain point.

--- 
> ####  Camera Extensions can communicate over Firewire (!), USB, Bluetooth... but PCIe (Thunderbolt) is not mentioned. Will that be enabled?


|U03HXTBNYBC|:
PCIe access would currently mean you need to resort to the legacy IOVideoFamily kernel interface. Kernel access is deprecated. But unfortunately we don't have a replacement for IOVideoFamily yet (sort of a peer to DEXT but with access to PCI hardware).

|U03HXTBNYBC|:
I didn't mention PCI hardware because of the kext necessity. It's technically possible to use a CMIOExtension in conjunction with IOVideoFamily — so it will work. Just know that if at all possible to keep your code out of the kernel, you should. I'm sure the CoreOS team would love to hear your feedback about what you can and can't do with DEXTs. :slightly_smiling_face:

--- 
> ####  if my Camera Extension already vends to any application, and it has some custom controls accessible over USB (either in a UVC Extension Unit or via HID), why would I use a DEXT to communicate with it, when I can use the HID Manager or user-space USB methods to communicate with the device?


|U03HXTBNYBC|:
You don't have to use a DEXT. You're free to use other services. HID should be fine.

|U03JDS776JH|:
we’ve always had to jump through a small hoop to associate an AVCaptureDevice (which is actually a UVC device) with the HID device on the same USB device which provides us with additional control and status. We have to parse the uniqueID, which contains the USB location ID. That’s messy.

|U03HXTBNYBC|:
Right. We recognized that some 3rd parties are probably encoding bits of the vendor id / product id into their plugin's unique identifier. That's why we didn't force all unique IDs to be GUID style strings in the new extension world. You can implement a legacyID if you need to maintain backward compatibility.

|U03JDS776JH|:
I’m talking about Apple’s UVC driver - it creates a unique ID for a USB AVCCaptureDevice which is concatenation of vid, pid and location ID. Even when we wholeheartedly adopt Camera Extensions, we’ll still have to correlate HID devices with UVC devices, and there’s no public API to do so. (FB6146541)

|U03HXTBNYBC|:
Right. Apple's UVC Extension is a client that uses the legacyID feature, so apps such as yours (I suspect!) won't break.

--- 
> ####  The Camera Extension is awesome! Can we have multiple instances of it, say, to send different content from separate documents to the host application?


|U03HXTBNYBC|:
Thank you! We're excited about them. The team has worked really hard to produce a modern replacement. We want everyone to adopt them at lightning speed. :zap:

|U03HXTBNYBC|:
You can only have one instance of your CMIOExtension loaded at a time. But it can vend more than one device. Or, your installer app could install more than one CMIOExtension.

|U03HZ5T63N1|:
Sample code that covers everything would be helpful. :slightly_smiling_face:

|U03HXTBNYBC|:
Hopefully the Xcode walk through in the video was helpful. The CMIOExtension template is really a great starting point. It builds a fully functional camera device / stream, so just studying the code produced by the template is a great start.

|U03HZ5T63N1|:
Thanks for the walkthrough. Unfortunately, the video is actually too small to read the code you put in there. It would still be great to have the project as Sample Code.

--- 
> ####  Just because it comes to mind: We currently have a DAL for Video and a corresponding HAL for Audio. Both currently have to be installed by the user separately from the app. The Camera Extension being a part of the app is a great relief. Do you know what corresponding API/Extension we can use for sound so that we do not have to install the HAL component?


|U03HXTBNYBC|:
That is a great question. I don't know if it's possible to install a HAL driver through an app from the app store. Would you mind asking that question over at the <#C03H9J5AW4U|> slack channel?

|U03HXTBNYBC|:
As I mentioned in a previous thread, you can certainly deliver audio through your CMIOExtension — it just won't get picked up by general purpose audio recording apps, who only query the HAL APIs to find HAL devices. An app like QuickTimePlayerX would be able to record from it though (assuming you've got a "muxx" device).

|U03HZ5T63N1|:
Not sure if that works in apps like Zoom where you have a separate selector for audio devices.

|U03HZ5T63N1|:
I asked in the audio-and-video-lounge but they seem to be off duty now.

|U03HZ5T63N1|:
I hope they still see the question

|U03HHA1DV9D|:
Typically when an application publishes a list of audio sources they are HAL devices.  If your CMIO Extension delivers audio with its video, it is considered a "muxed" CMIO stream.  The original CMIO muxed streams were from DV and HDV cameras.  Taking audio from muxed stream is not usually handled by applications.

|U03HHA1DV9D|:
Unless the application is also capturing video from the device.

|U03HHA1DV9D|:
Audio in this case does not come from CoreAudio, but instead stays in the realm of AVCapture APIs.  An app could use an AVCaptureAudioDataOutput to get access to the audio from a muxed stream, or use an AVCaptureMovieFileOutput to record it.

--- 
> ####  Thanks for the session! I was wondering what would be the best way to transmit an app's view to its Camera Extension? So far I've tried hooking up an XPC Service to pass IOSurface data, but unsure how/where to connect in the extension


|U03HXTBNYBC|:
Sure seems like a lot of you are trying to hook up an XPC service to pass frames to your extension. That's currently not working due to the fact that CMIOExtensions are run as a background process under a role user account, so they have no connection to the front user / aqua session.

|U03JDS776JH|:
I have been nagging Brad with questions about exactly this!

|U03JDS776JH|:
I’ve even got it to work, but the user experience isn’t ideal.

|U03HXTBNYBC|:
One means of doing it is to do the fake output device -&gt; fake camera device dance in your extension. Find the fake output device in your app and push frames to it. Then in your extension, republish those frames as a camera stream.

|U03HMDRQQ6B|:
I think we’re all trying to do it because it worked in the old DAL plugin system :stuck_out_tongue:

|U03JCS2C03Z|:
Yup lot of speculation and attempts before the official docs came out :smile:

|U03JCS2C03Z|:
As I now understand it: initialize a fake output device within the app to consume frames.
Then find that device within the extension and republish, probably from within `CMIOExtensionDeviceSource`?

|U03HXTBNYBC|:
Right. Or the ProviderSource, depending on how you want to separate your code.

--- 
> ####  Not a question, but thank you for building this. I'm really happy to have a modern/secure approach for building this kind of plugin, and even happier to be able to distribute it on the App Store!


|U03HXTBNYBC|:
From the whole team, THANK YOU!

|U03JDS776JH|:
I will second that. I’ve wanted this for a very long time!:100:

|U03HXTBNYBC|:
We're excited about it too. That's why we've developed such an aggressive deprecation plan for DAL plugins. The whole system will be more safe and secure once DAL plugins are a thing of the past.

|U03JDS776JH|:
does that mean that the fake output device/virtual camera output “dance” approach you mentioned will become impossible? Because the extension is still built on top of DAL…

|U03HZ5T63N1|:
I applaud this as the DALs really sucked. But I hope you will provide all features necessary to replace them before you remove them.

|U03HXTBNYBC|:
CMIOExtensions are part of the CoreMediaIO framework, but we consider them distinct from the DAL Plugin interfaces (which are deprecated). We are not planning on removing the ability to use CMIOExtensions as output devices.

--- 
> ####  Hi Brad! Core Media IO seems very cool. I'm curious, is there or might there every be the capability to capture high quality stills via these plugins? Or do they only provide video streams? Thinking about the use case of a tethered mirrorless camera


|U03HXTBNYBC|:
Yes! We'd like to support high res stills very soon. The Continuity Camera that Craig talked about in the WWDC keynote is capable of producing high res (12 MP) stills and delivering them to an AVCapturePhotoOutput. Definitely want 3rd party extensions to be able to do likewise.

|U03HZ5T63N1|:
Awesome!

--- 
> ####  The new iCloud shared photo library looks awesome! Will the content of the shared library be accessible from the PhotoKit API? (e.g. fetching PHAssets)


|U03J5R8VAPP|:
Yes! All Shared assets would be accessible via the existing PHAsset fetches

|U03HMDFMVNK|:
Great! Is there some way to tell apart shared assets from non-shared? I didn’t see any API changes in the new SDK but thought those might not be in since the shared library isn’t in seed 1.

|U03J5R8VAPP|:
There is no API to differentiate shared vs. non-shared. From an API perspective, they would appear to all be part of the same local library

|U03J5R8VAPP|:
As always, we would welcome use cases for specific API additions via Feedback requests (The more detail the better). Missed you during the lab slot yesterday <@U03HMDFMVNK> :wink:

|U03HMDFMVNK|:
Haha, sorry I got caught up watching videos. :sweat_smile: Not exactly sure yet what I might want to do with shared vs. non-shared, but once I have a chance to play around with a seed with the shared library UI, that will give me more ideas and will file feedback accordingly.

--- 
> ####  Can I get access to the smart filters present in Photos app via `PHAsset.fetchAssets(with:)`?


|U03J8LCLQN7|:
You can fetch the various Media smart albums and favorites (for example) by using the API `fetchAssetCollectionsWithType:subtype:options:` with the appropriate smart album subtype

|U03J8LCLQN7|:
And then use the returned asset collection as the input to `fetchAssets(in:options:)`

|U03J8LCLQN7|:
For example: `PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumFavorites, options: options)`

|U03HY66772A|:
Yeah, I knew that option:) My question was more in the direction of filtering photos by keyword.

For a bit more of a context: we create a clothing try-on app, and we would greatly benefit from showing our users photos that contain people. There are no smart albums for that, as far as i know:(

|U03J8LCLQN7|:
I see, yes, that's correct- there is no API currently to fetch based on people. If you haven't already submitted an enhancement feedback request please do and provide the specifics of your desired use case.

|U03J8LCLQN7|:
Though it doesn't address your request specifically, you might be able to make use of the PHPicker to give the user a way to select specific assets based on search and filter for keywords

|U03JYF8GT7A|:
To elaborate, PHPickerViewController now supports <https://developer.apple.com/documentation/photokit/phpickerfilter|additional filter APIs> (e.g. screenshots filter). Users can also search for terms like “People” in the picker search bar.

|U03HY66772A|:
Could you achieve same result by getting faces smart albums? I don’t know whether it returns anything if user hadn’t marked anyone in his library.

|U03JYF8GT7A|:
Search supports unnamed person

--- 
> ####  Is there a way to query the "People" library/collection within the user's Photo library?


|U03HBH4EAR4|:
People information (e.g. the names associated and groupings) are not provided via PhotoKit

|U03HBH4EAR4|:
I encourage you to file a Feedback with your specific use case in mind. Or if you’ve already filed one, please paste it here!

|U03HMBQ0KJB|:
FB9163331 :slightly_smiling_face:

--- 
> ####  UIImagePickerViewController has the ability to crop and resize a selected image, but PHPickerViewController does not (unless it was added in iOS 16 and I missed it?). Since picking photos using UIImagePickerViewController is being deprecated, what is the correct way to now do this? Would we need a custom overlay?


|U03JMC610GH|:
`allowsEditing` to enable crop is indeed only available on `UIImagePickerController`. If you want to support any kind of editing, including crop, you'd need to combine `PHPicker` + your own UI.

|U03K7KBHSV6|:
Ah I see, is there a reason why it wasn't included in PHPickerViewController?

|U03JMC610GH|:
I think part of it is the on-demand nature of the file provider; also each app can have its own requirements on crop parameters (aspect ratios, minimum sizes, etc.)

|U03K7KBHSV6|:
That makes sense, it does appear to only allow a square crop. Thank you for your answer!

|U03JYF8GT7A|:
Yes as Greg mentioned, PHPickerViewController allows you to fetch asset data after the picker is dismissed. You can implement your own edit/crop UI separately based on your own use case.

|U03K7KBHSV6|:
Thank you!

|U03J221UN9G|:
Really wish there was a default `allowsEditing` capability in PHPicker!

|U03JYF8GT7A|:
Please file a feedback request!

|U03J221UN9G|:
<@U03JYF8GT7A> Will do. The default square crop is perfect for things like quickly adjusting profile pics in profile setup flows.

|U03JMC610GH|:
Bonus tip for any feedback is to also include some use cases / reasons / user impact as well. It really helps to include the context of your app in particular!

|U03J221UN9G|:
Thanks Greg! Any difference if I submit it in my “Personal” account vs my LLC which is a member of the Apple Developer Program?

|U03JMC610GH|:
I don't think it matters, but maybe the developer program one would be more appropriate if it's dev/SDK kind of feedback.

--- 
> ####  Is it possible yet to read (and write) the "caption" metadata property of a user's photo from their library?


|U03HBH4EAR4|:
That is not possible today. I encourage you to file a Feedback with your specific use case in mind. Or if you’ve already filed one, please paste it here!

|U03K0BHRMNC|:
I havent filed a feedback for this, but I will do. Thanks for the suggestion :slightly_smiling_face:

|U03HMCT187R|:
I did! :raised_hand: Def have a use case for this too. FB8244665

|U03HU4PCSET|:
For what it's worth: If you are using the picker API and get an exported image, and that image had a caption, it should be in the IPTC metadata within the file

|U03HMCT187R|:
Ooo it’s in the metadata alongside EXIF etc. I haven’t noticed IPTC before I’ll have to investigate. That would solve my use case fr! Thank you

--- 
> ####  I am working on an app to edit the metadata of photos in the iCloud Library, using Image I/O. After editing a RAW photo, it is no longer possible to edit that photo as a RAW image on any RAW photo editor (Darkroom, for example). My guess is that when we have to save the image as JPEG for the PHAssetChangeRequest, editors only see the PHAsset as JPEG instead of raw. Is there a way to edit a RAW photo’s metadata but not remove the ability to edit it as RAW afterwards?


|U03HU4PD371|:
If your goal is primarily to be able to edit the metadata - then your assessment is correct, any adjustment must be submitted in the form of a JPEG, which would produce a different file.

The only way I could think of to change attributes of the original asset - would be to create a new asset with the updated original data, and delete the old one.

Additionally, feel free to submit a feedback request with some more context and what your requirements are.

|U03HU4PCSET|:
It'd be useful to know which specific metadata (if any) you're thinking about writing, too!

|U03J4CQQR9A|:
Yep, that is the only workaround I could think. I will try it, see how it goes but if I have any limitations I will file a feedback.

|U03J4CQQR9A|:
<@U03HU4PCSET> I allow users to edit a subset of all metadata tags, but this specific scenario affects especially pro photographers who want to mainly edit IPTC tags. If their workflow is edit metadata first and then edit their RAW photo, then is when we get into trouble because they can’t edit the photo as RAW no more.

|U03J4CQQR9A|:
I wish we weren’t limited to only writing JPEG images to PHContentEditingOutput’s renderedContentURL

|U03HU4PCSET|:
Those are great reasons, thank you <@U03J4CQQR9A>! Adding that context when submitting a feedback request would be really great. The Photos app treats assets as "digital negatives" and doesn't modify them in place (an edited image is an additional resource, for example). So I think right now, <@U03HU4PD371>'s suggestion of adding a new asset (and deleting the old one) would be the way to do this (though it's likely not a great user experience).

You may want to talk in the Core Graphics lab tomorrow to the ImageIO team, to see if writing specific RAW file formats are supported

|U03J4CQQR9A|:
Sadly I can’t make it to tomorrow’s lab. If I have trouble in the future writing RAW files would a Technical Support Incident (TSI) be an appropriate channel to get help?

--- 
> ####  Does the new ability to "lock" the Hidden and Recently Deleted albums have any effect on being able to change the hidden state of a photo or delete a photo using PhotoKit?


|U03HBH4EAR4|:
Your app will still be able to hide photos however it won’t be able to fetch the hidden photos back (if the user has chosen to keep the setting on which requires authentication for the hidden and recently deleted albums). Your app will still be able to attempt to delete photos and the user will be prompted to accept the deletion like in previous releases.

|U03HBH4EAR4|:
Elaborating a bit, this means your app won’t be able to _unhide_ photos as it doesn’t have access to hidden photos.

|U03HMDFMVNK|:
I see, so if the hidden album is locked, then those hidden assets just won’t be included in any fetch requests that would normally return them?

|U03HBH4EAR4|:
correct

--- 
> ####  Im building an app that tries to recognise and identify people in a photo. I believe the current Image framework is able to identify faces with great success, but has there been any progress in the framework that can help us "recognize" faces? (obvious use case here is to find and associate people to an identified face in a photo)


|U03HBH4EAR4|:
If by “the framework” you’re referring to PhotoKit, there isn’t any mechanism to try and associate images with the People that are tagged / named within the Photos app / Photo Library. I’m not familiar enough with the Vision framework to know if there are clustering APIs which aid in you doing the face recognition all within your app though. Is that more what you were getting at?

|U03K0BHRMNC|:
yeah I think possibly what Im needing to do is extract identified faces then build some ML model to further recognise familiar faces. Probably then the wrong channel for this. :slightly_smiling_face: thanks!

|U03DJTBMHFF|:
<@U03K0BHRMNC> Are you in the machine-learning-lounge as well? There is an active Q&amp;A going on with the Vision team right now. We probably have the right experts there that can give you suggestions of what to pursue.

|U03K0BHRMNC|:
i will hop over there... thanks!

--- 
> ####  Hey! So Im currently needing to get the file extension of a PHAsset from the user's photo library. At the moment the way Ive been directed to follow is to request `requestContentEditingInput` of the asset, and then get the extension from the `fullSizeImageURL` value. But im currently occasionally getting a `[ImageManager] Media resource request failed to return valid data or url with error: Error` with this request and I cant understand why.   so maybe 2 questions...  1) is this the ideal/suggested way to understand if an asset is a PNG/JPEG/HEIC, and  2) what would possibly be the reason why I would get this error sometimes? And how do I "recover" from it so I can get the extension of the file reliably? Thanks!


|U03K0BHRMNC|:
to be a little clearer, the error code i got with this was `code=3164`. Ive seen some suggestions that its possibly because the asset is in iCloud, but Im fetching the asset first and then calling this request. So it seems hard to think that its iCloud related.. but maybe it is?

|U03HU4PD371|:
The best way to determine the kind of file for an original image would be to use PHAssetResourceManager -- ie, get the list of resources for an asset, then isolate the one with PHAssetResourceTypePhoto, and call: -[PHAssetResource uniformTypeIdentifier]

|U03HU4PD371|:
and the above method doesn't require use of the network

|U03K0BHRMNC|:
ah ok, that seems helpful and surprised I missed it earlier.. Thanks! :blush:

--- 
> ####  Is there a way to determine if your app has edited a given PHAsset? For example if I edit a photo in my app and then edit it in a different app, is there a way to know that my app has edited it? I'm wondering because I'd like to build a filter to only show photos my app has edited (as opposed to all edited photos).


|U03HU4PD371|:
Given a PHAsset, if you wanted to know if your app owns the top level adjustment, then you might inspect the data in the `PHAssetResourceTypeAdjustmentData` resource.

If another app has placed an adjustment on top of yours, you could tell by also inspecting data from `PHAssetResourceTypeAdjustmentBasePhoto` .

|U03HU4PD371|:
You might inspect the value from `-[PHAdjustmentData formatIdentifier]` and see if it matches your app's bundle

|U03K5JE9HG8|:
Another approach would be to keep track of edited assets' `PHCloudIdentifier` on the app side.

|U03HMCT187R|:
So `PHAsset.adjustmentFormatIdentifier` does tell you the id of the last applied edit, though you can edit it in another app and then at that point you can’t detect your app has edited it. Unless `PHAssetResourceTypeAdjustmentBasePhoto` does this but I don’t understand how :thinking_face: as that provides an unaltered version of its photo asset for use in for use in reconstructing recent edits.

|U03K5JE9HG8|:
if you're looking for "ever edited with my app"

|U03HMCT187R|:
That’s indeed what I want - filter out all photos except those that my app has edited even if they’ve edited it afterwards in another app :slightly_smiling_face: I understand `PHCloudIdentifier` is kind of a heavy operation to convert to local identifiers, likely much too inefficient to loop over the entire photo library (or even as they’re scrolling to show an “edited” indicator on the thumbnail).

|U03HU4PD371|:
If a resource is present with the type `PHAssetResourceTypeAdjustmentBasePhoto` , it is an indication that an adjustment is applied to an asset, on top of another adjustment which didn't originate from the Photos app.  Using requestDataForAssetResource... passing in the resource should give you back enough info to determine if the earlier adjustment is yours.

|U03HU4PD371|:
'Ever' edited with your app might require additional state -- as once as user reverts all adjustments, you would no longer be able to depend on adjustment data to answer that question.

|U03HMCT187R|:
Ah yah, sorry “ever edited” is not quite desired, just that there is an adjustment to that asset that my app performed. If they wipe out all edits, I don’t want to indicate my app has edited it.

|U03HMCT187R|:
Gotcha, yah that would do the trick if I needed to know that per photo asynchronously. For this use case it’d need to be synchronous and efficient.

|U03HU4PD371|:
I believe this data should be on disk already -- (in most cases does not require a download from network), it still might work for your use case, depending on how many assets you need to run this check against.

|U03HU4PD371|:
(It probably is not efficient enough to run in a loop against a large collection of assets - but perhaps efficient enough to run once for all assets, then run incrementally based on changes to the library)

|U03HMCT187R|:
Gotcha thanks! My gut is that wouldn’t quite accomplish what I need. I previously filed FB5415719 about this but doesn’t include a lot of details for what I intend to use this for which I imagine would be helpful. Would yall prefer a new bug report or I can send a reply on this one to provide additional deets? :slightly_smiling_face:

|U03K5JE9HG8|:
<@U03HMCT187R> to make it efficient for scrolling, you can convert the PHCloudIdentifiers of edited photos to local identifiers, and fetch them all with `+[PHAsset fetchAssetsWithLocalIdentifiers:options:]` and keep that `fetchResult` around

then in the cell, you can check if that asset has been edited via `[fetchResult containsObject:assetInCell]` , behind the scenes `containsObject` is very efficient and fast

|U03HU4PD371|:
You can reply here with comments and I can add them to the FB.  I think providing more context on how many assets you'd like to run the check on, the use case in the app, etc. would be helpful.

|U03HMCT187R|:
Oh okay that approach makes sense! Though I can think of some drawbacks that doesn’t really work for my use case. When the user edits a photo I’d need to persist the cloud identifier for that asset, and sync that list of identifiers to all their devices, otherwise it wouldn’t know about the edited photos from different devices. I also support editing photos from inside the Photos app, so need to use App Groups to try to update that in a shared location (which I actually don’t think is possible because you don’t get a PHAsset). If they go revert a photo in the Photos app, now my app thinks that photo is edited by my app but it no longer is.

|U03HMCT187R|:
I’ll compose a message detailing my use case. Thank you so much!! :hugging_face:

|U03HMCT187R|:
I have an app (DateStamper) that loads up the user’s photo library and allows them to scroll through a collection view of thumbnails, very similar to the Photos app. My app can edit photos as well (in the app and in a Photos editing extension). I would like to show a little “edited” indicator on each photo thumbnail if my app has edited that photo, more precisely, if that asset currently has adjustments that were performed by my app. To be super clear, if the user reverts edits to the photo, I do not want the “edited” indicator to show up anymore. I’d also potentially like to provide a way for them to filter the photos to only show photos that my app edited in the collection view. I believe this may not quite be possible to achieve for this use case.

You can determine if a PHAsset has been edited via `PHAssetResource.assetResources(for: asset).contains(where: { $0.type == .adjustmentData })` (and there’s new API in iOS 16 for `PHAsset.hasAdjustments`) but this means any app could have edited it. I want to know if my app edited it.

You can determine if your app edited a PHAsset by checking if `PHAsset.adjustmentFormatIdentifier` is one of your app’s identifiers but this only gives you the id of the last edit performed. For example if you edit a photo in my app, then edit it in the Photos app or another third party app, you can no longer detect that your app has edited the photo.

You could keep track of all the assets your app has edited via PHCloudIdentifier but this has some problems. The Photos editing extension doesn’t have access to that, photos can be edited on other devices, and photos can be reverted outside of your app. Trying to track this manually would not accurately represent photos that are currently edited by your app.

 You could use PHAssetResourceManager to fetch the adjustment data and examine it to see if there’s any created by your app, but this wouldn’t really work for this use case, it would only really work in async contexts likely limited to a single photo at a time as opposed to a filter applied to all photos in the library.

|U03HMCT187R|:
Thanks <@U03HU4PD371>! When you add this to the feedback will that show up as additional info to me? I’d like to have that recorded for my future viewing too. I can go into follow-up with that as additional information if needed.

|U03HU4PD371|:
I've added the discussion thread today to the radar, <@U03DJTBMHFF> would Jordan be able to see any additional info on his end?

--- 
> ####  Is there a way to use PHFetchOptions to find only JPEG+RAW pairs and then split them or discard one half of the pair?  


|U03J8LCLQN7|:
There isn't any API for fetch options to choose assets based on JPEG+RAW original resources.
And there's no way to remove an original resource from an asset, you'd have to create a new asset from one or more of the resources.

|U03J8LCLQN7|:
Please do file a feedback to request support for searching based on R+J resource if that would still be useful for you

|U03HBH4EAR4|:
In general, R+J Assets use the `PHAssetResourceTypeAlternatePhoto` resource to store one of the pairs. This tied with looking at the `uniformTypeIdentifier` would allow you to identify them. Unfortunately this will be slower than a fetchOption supported way.

|U03J4DD447N|:
Ok thanks! My use case is basically trying to clean up a library and discard unnecessary RAWs so I'll look into the uniformTypeIdentifier option. 

--- 
> ####  In my testing, the modificationDate property of PHAsset gets updated every time a photo is viewed in the photos app (and other apps), even if no edits were made - it seems to behave more like a last viewed date. Is this intended behavior?


|U03J8LCLQN7|:
Yes this is expected, not specifically to reflect that the asset was viewed, but the `modificationDate` will reflect changes due to internal bookkeeping and processing. If you expected or would better be able to use a modification date property that reflects only changes to properties exposed on PHAsset I'd encourage you to submit a feedback request with your specific use case

|U03J20RJQ2X|:
Thanks for the clarification!

--- 
> ####  With iCloud shared photo library, it sounds like PhotoKit basically shows just one system library like normal, which might happen to have shared assets if the user has the shared library enabled. So would that mean for example, if they then disabled the shared library on their system, that things like change observers and the new change history API would get notified of a whole bunch of deletions, since the shared assets would no longer be appearing in the library?


|U03J5R8VAPP|:
Basically yes you’re right. When a user disables Shared Library on their system, they get a choice of either keeping *all* shared assets or just the assets they’ve contributed into the Shared Library. Based on the choice they make here, there could be a bunch of deletions appearing in the local system library

--- 
> ####  Are CloudIdentifiers globally unique? Would two users ever have the same CloudIdentifier?


|U03J8LCLQN7|:
The short answer is YES - they are unique. The more complete answer reflects what you get back from the lookup APIs when looking up a local identifier based on a `PHCloudIdentifier` :
1. In a set up where the user has enabled iCloud Photo Library the cloud identifier will be able to uniquely distinguish the asset and it's local identifier even when there are assets with the same image/video data
2. In the case where the photo library is not associated with an iCloud account (in iCloud Photo Library), it is possible for a cloud identifier to resolve to more than one local asset when looking up the local identifier via `localIdentifierMappings(for:)` - in that case the local identifier mapping result will indicate the error code: `PHPhotosErrorMultipleIdentifiersFound`

|U03J4BFE17W|:
Thanks!

|U03J8LCLQN7|:
... and you can get the set of potential matches for that cloud identifier via the error user info via the key: `PHLocalIdentifiersErrorKey`

--- 
> ####  Is there a precalculated hash for a PHAsset to help check for duplicates? I've been using a Perceptual Hash of the image's thumbnail and having success, but was wondering if there was a better way.


|U03HBH4EAR4|:
There is not any sort of API around a pre-calculated hash for a given PHAsset. A perceptual hash of the thumbnail is a reasonable approach. Combining that with metadata information and asset resource information would be a good way of checking for duplicates across the library.

|U03HMDFMVNK|:
Also check out VNGenerateImageFeaturePrintRequest in the Vision framework. It does something similar in concept to a perceptual hash.

|U03J4BFE17W|:
Thanks!!

--- 
> ####  I've found that if I request an image thumbnail using PHImageManager passing the .original option for the imageVersion, then if that asset hasn't had its original image downloaded from iCloud yet, it returns an error. The only workaround I've found is to manually request the original photo resource via PHAssetResourceManager and create the thumbnail myself. Is there any way to force PHImageManager to download the asset so it can create the thumbnail in this case, or is the current behavior how it's intended to work?


|U03HU4PD371|:
Do you have `networkAccessAllowed`  set in the request options?

|U03HMDFMVNK|:
Yes

|U03HU4PD371|:
also - in your case do you specifically need the original file?  if your goal is to get a thumbnail, usually 'current' is better and more efficient

|U03HU4PD371|:
I would not expect an error to be returned in the case you describe -- if you have a case that repro's, pls file a feedback and we can look further.

|U03HMDFMVNK|:
Yes, in my case I’m displaying a preview of what something will look like when I copy a photo elsewhere, and I have an option in my UI to copy the unmodified original instead of the current one, so I’d want to show a thumbnail reflecting the version that’s going to be copied.

|U03HMDFMVNK|:
To be honest I encountered this one a while back and haven’t checked on more recent versions of macOS, so I’ll check the behavior again to see if it’s changed. Just seemed like odd behavior and wanted to check to make sure I wasn’t missing anything.

|U03HU4PD371|:
I see - yes in the case of an adjusted asset that makes sense.  If the asset is not adjusted you'll get better performance using 'current'.

|U03HU4PD371|:
Odd indeed - pls include all the options you're using to set up the request, and all the logs/error details you're getting, as well as a sample asset that produces the issue.

--- 
> ####  Is there a way manually create depth data for existing images? I'm looking to build something where I can basically "paint in" the depth information into images that are maybe not shot on iPhone.


|U03HBH4EAR4|:
Not sure if we have the appropriate people here right now, but I will reach out. From the photokit perspective the data would need to be in the original image, so a new PHAsset would have to be created with the appropriate depth information in the original image. I’ll leave it up to the camera folks to chime in on the depth creation part.

|U03J1U4Q77D|:
Check out Vision’s segmentation API: <https://betterprogramming.pub/new-in-ios-15-vision-person-segmentation-5c031a2f3822>

|U03J20RJQ2X|:
This sounds similar to what the Focos app does

|U03J4CVE1U4|:
Cool, I'll check out all your suggestions. Thanks everyone! :raised_hands:

|U03DJTBMHFF|:
There are some other machine-learning models out there that estimate depth based solely on an image. One of them, *FCRN-DepthPrediction*, is available as a Core ML model in our model gallery. <https://developer.apple.com/machine-learning/models/>

Using a model like this along with the Vision framework you may be able to achieve exactly what you're looking for.

|U03JLRZJHQR|:
Monocular depth estimation is super cool, the best results I've gotten are with the model “MiDaS”. I was able to convert it to coreml using CoreML tools and use it in my Swift Student Challenge submission (with some quantizing to reduce the size). They also have a newer transformer model, which I haven't been able to convert to CoreML using the builtin tools, but I'd like to try again in the future.

--- 
> ####  In the new iCloud Shared Album (w your family), will photos shared to you be located on the your Camera Roll (`smartAlbum/smartAlbumUserLibrary`)? Follow up: will all of those photos be locally available in all devices of the family or will they be “iCloud dehydrated” and the user or an app needs to do an explicit download?


|U03J5R8VAPP|:
Yes! From a PhotoKit API POV, all Shared assets that are inserted via the iCloud Shared Photo Library feature would appear as normal assets and would be shown in all the usual places (Photos tab, For You tab, Albums tab) and be available through all the usual fetches

|U03J5R8VAPP|:
Bonus followup question: The same per-device policy applies here based on what they have setup in Settings &gt; Photos &gt; [Optimize Storage OR Download and Keep Originals] on that device.

--- 
> ####  Are there any APIs for editing videos shot in Cinematic mode?


|U03JYFCQY5N|:
There are not any at this point for editing the cinematic-ness of the video, but the video can be edited in the same way that any other video can be edited.

|U03JEEU1MF1|:
Thanks for the reply! I know you can't comment on future plans but I hope to see this feature in the future.

|U03JYFCQY5N|:
Thanks for the feedback and interest!
