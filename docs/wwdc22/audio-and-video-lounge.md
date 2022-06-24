# audio-and-video-lounge QAs
### Lounge Contributors
#### [pol-piella](https://github.com/pol-piella)
#### [emin@github](https://github.com/roblack) / [emin@twitter](https://twitter.com/emin_ui)
#### [shirblc](https://github.com/shirblc)
#### [tikimcfee](https://github.com/tikimcfee)



---
> ####  When would we be able to see an option for playback speed/pitch in Apple Music? This is something I'd love to see.


|U03H96G1FB7|:
Hello <@U03JNAGPDS6>!

You can already change the playback speed with MusicKit by setting the <https://developer.apple.com/documentation/musickit/musicplayer/state-swift.class/playbackrate|playbackRate> property on the <https://developer.apple.com/documentation/musickit/musicplayer|MusicPlayer>’s <https://developer.apple.com/documentation/musickit/musicplayer/state-swift.class|state>.

As for changing pitch, we don’t currently support this, but feel free to file an enhancement request in <https://feedbackassistant.apple.com|Feedback Assistant>.

---
> ####  How is the Music API related to the Podcast API?


|U03HEF0N7RA|:
Hey <@U03K8HA5U2U>!

The Apple Music API is a separate product from any other metadata APIs. We currently don’t have a dedicated Podcasts API, but if you need podcast metadata you can leverage the pre-existing iTunes Search API -
<https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html>

---
> ####  Hello! Thanks for your amazing work, to begin with. I wanted to ask about songs lyrics, there's a `hasLyrics` boolean variable inside the `Song` object, but I see no way to access those lyrics, am I missing something? I'd need to have timed lyrics for an app idea I have. Thank you!


|U03J1SQJYRW|:
Hi Cristina, unfortunately there's no current way to access the lyrics of a `Song` object in either MusicKit or Apple Music API. Please consider filing an enhancement request in <https://feedbackassistant.apple.com|Feedback Assistant> for a request for this feature!

---
> ####  Thank you for all the new structures in MusicKit this year!! All my wishlist items ticked. :white_check_mark:  I wonder how to work with the MusicCatalogTopLevelResourceRequesting protocol and the new init() of MusicCatalogResourceRequest?


|U03H96G1FB7|:
Hello <@U03HMDM1J23>!

I’m afraid we made a small mistake in seed 1, and forgot to include that <https://developer.apple.com/documentation/musickit/genre|Genre> conforms to <https://developer.apple.com/documentation/musickit/musiccatalogtoplevelresourcerequesting|MusicCatalogTopLevelResourceRequesting>.

This will be addressed in an upcoming seed.

|U03HMDM1J23|:
Sure, no worries!

|U03HMDM1J23|:
I assume that it will help me fetch all the top genres from this <https://api.music.apple.com/v1/catalog/us/genres|Apple Music API>?

|U03H96G1FB7|:
That’s exactly right. We think we need this to tie into the new <https://developer.apple.com/documentation/musickit/musiccatalogchartsrequest|MusicCatalogChartsRequest>, which can be <https://developer.apple.com/documentation/musickit/musiccatalogchartsrequest/init(genre:kinds:types:)|initialized for a specific Genre> (optionally).

---
> ####  What are some great tips on creating immersive audio experiences in our apps?  I really like Spatial Audio and Spatialise Stereo.


|U03J1SQJYRW|:
Hi Cristian-Mihai,
Currently <https://developer.apple.com/documentation/musickit/audiovariant|MusicKit> and <https://developer.apple.com/documentation/applemusicapi/albums/attributes|Apple Music API> expose which audio variants are available for a given music item like a `Song` or `Album`. You can also see the currently playing audio variant when using the MusicKit player. As for creating your own immersive audio experience, I suggest signing up for the CoreAudio lab or PHASE Audio engine lab.

|U03JRP87THN|:
Thank you very much!

---
> ####  Is it possible to determine the location (country, etc.) of origin of an album, track, or artist?


|U03K8THM8F2|:
Hey Mark - we don’t expose this metadata via the Apple Music API at this time.
But feel free to file an enhancement request in <https://feedbackassistant.apple.com/|Feedback Assistant>.

---
> ####  I didn't see anything about Apple Classical / Primephonic so far. Will MusicKit and Apple Music API support it?


|U03GXGA6B63|:
Hi <@U03JEKFMT4Z>, thank you for your patience. We are working on an amazing new classical music experience from Apple.

|U03JEKFMT4Z|:
Thank you Betim. So I guess there was no official news I missed for WWDC

|U03GXGA6B63|:
That’s correct, we currently don’t have any updates on this yet

---
> ####  Like the new recently played structure in MusicKit, is there a way to access the recently added items in the user's library?


|U03J1SQJYRW|:
Hi Rudrank,
Unfortunately, there currently isn't a way to access the recently added items in the user's library like the recently played structure. However, you could get this information from <https://developer.apple.com/documentation/applemusicapi/get_recently_added_resources|Apple Music API>. Please consider filing an enhancement request in <https://feedbackassistant.apple.com|Feedback Assistant> for a request for this feature!

---
> ####  Like the new recently played structure in MusicKit, is there a way to access the heavy rotation content (like the one mentioned in Apple Music API) from the user's library?  If not, do you recommend using MusicDataRequest for the URL <https://api.music.apple.com/v1/me/history/heavy-rotation,|https://api.music.apple.com/v1/me/history/heavy-rotation,> and decoding it as a music item collection of RecentlyPlayedMusicItem?


|U03HEF0LUBW|:
Hi Rudrank,
Unfortunately, there currently isn't a way to access heavy rotation content from the user's library. Using `MusicDataRequest` to fetch this would work but decoding the items as `RecentlyPlayedMusicItem` is not recommended. For recommendations based on listening, we encourage exploring <https://developer.apple.com/documentation/musickit/musicpersonalrecommendationsrequest|MusicPersonalRecommendationsRequest>.

---
> ####  Does Spatial Audio only work with MusicKit? Or does it also work with MediaPlayer as well?


|U03J1SQJYRW|:
Hi Tyson,
Spatial Audio playback will be handled automatically, however, there is no metadata from MediaPlayer that would let you know which <https://developer.apple.com/documentation/musickit/audiovariant|Audio Variant> is either available or currently playing.

|U03JBMMB10A|:
Thank you!

---
> ####  Is the ISRC given by the Music API reliable to identify a song outside of the Music API? In the past, I've found that there are differences between Apple Music ISRC and other platforms ISRC. The other platforms seem to be correct, but I thought ISRC is supposed to be universal.


|U03H96G318D|:
Hey <@U03JE7H2DM4>!

Yes, the ISRC value is intended to be a way to identify songs outside of Apple Music. If you have examples of ISRC values not matching what you expected, please consider sharing them with us using the Feedback Assistant.

---
> ####  Will there be an option to be able to playback Apple Music directly via AVPlayer?


|U03H96G1FB7|:
Hello <@U03JE7H2DM4>!

Apple Music content is typically protected, and requires specialized playback logic. That’s why it’s not possible to play Apple Music content with AVPlayer. Instead, you should use one of <https://developer.apple.com/documentation/musickit|MusicKit>’s players, like:
• <https://developer.apple.com/documentation/musickit/applicationmusicplayer|ApplicationMusicPlayer>
• <https://developer.apple.com/documentation/musickit/systemmusicplayer|SystemMusicPlayer>


|U03JE7H2DM4|:
Thanks!

|U03JE7H2DM4|:
Will those players ever be able to play audio directly from a url like AVPlayer?

|U03H96G1FB7|:
Those players do not currently allow playing audio directly from a URL like `AVPlayer`.

What use-case do you have for that? And more generally, what are you trying to achieve?

|U03JE7H2DM4|:
Essentially, a single player that can play the protected Apple Music songs and freely available content (url) in the same queue. I know it's possible using a mix of AVPlayer and System/ApplicationMusicPlayer but it would be really cool if we could do it in a single player.

|U03H96G1FB7|:
Ok, I see, thanks <@U03JE7H2DM4>.

I think the best way forward would be to capture this information about your use-case in a new ticket on <https://feedbackassistant.apple.com|Feedback Assistant>. This will help us in our planning process for future enhancements to MusicKit.

|U03JE7H2DM4|:
Thank you!

---
> ####  Apple Music API - How to work with Catalog Activity? <https://developer.apple.com/documentation/applemusicapi/get_a_catalog_activity|https://developer.apple.com/documentation/applemusicapi/get_a_catalog_activity>  The given example throws "Resource with requested id was not found" error, and I am not sure where to find the activity to understand it


|U03H96G318D|:
Hi <@U03HMDM1J23>,

Activities could sometimes be found using the search feature. Many activities have been converted into <https://developer.apple.com/documentation/applemusicapi/get_a_catalog_apple_curator|Apple Curators> and can also be found in search or the related curator for a playlist.
This year's enhancements to MusicKit for Apple platforms have also made it easier to work with curators. You can watch the session on those updates &lt;https://developer.apple.com/videos/play/wwdc2022/110347/
|here&gt;.

Thank you for reporting the sample ID in the documentation is not working, that will need to be updated.

---
> ####  Is this the appropriate place to ask about the new control center on the lock screen?  They showed an audio example in the keynote which included fullscreen album art.  But what if you have video running?  Would you actually see the video on the lock screen?


|U03H96G1FB7|:
Hello <@U03J20WEYV8>!

In the new lock screen in iOS 16, when a video is playing, the lock screen media controls will only show a still image provided by the app.

To do this, the app needs to publish its <https://developer.apple.com/documentation/mediaplayer/mpnowplayinginfocenter/1615903-nowplayinginfo|nowPlayingInfo> dictionary through <https://developer.apple.com/documentation/mediaplayer/mpnowplayinginfocenter|MPNowPlayingInfoCenter> including the image with the key <https://developer.apple.com/documentation/mediaplayer/mpmediaitempropertyartwork|MPMediaItemPropertyArtwork>.

|U03H96G1FB7|:
One more thing <@U03J20WEYV8>, we’ll have more information on a new way to publish the now playing information in a new session titled <https://developer.apple.com/wwdc22/110338|Explore media metadata publishing and playback interactions>, which will be released on Friday.

---
> ####  Like MusicLibraryRequest, does MusicLibrarySearchRequest not do a network call, and searches from the local copy stored on device?


|U03HEF0LUBW|:
Hi Rudrank,
Yes, like the `MusicLibraryRequest` on iOS, `MusicLibrarySearchRequest`  doesn't make a network call for searching but instead searches your local library.

---
> ####  One wish (I will file feedback for it), the possibility of using MusicKit in the simulator?


|U03H96G1FB7|:
Hi <@U03HMDM1J23>!

Getting MusicKit to work in the simulator is very challenging on a technical level, but we feel the pain of the lack of this support just like you do.

We keep investigating ways we could enable using some aspects of MusicKit in the simulator, and we’ll make sure to communicate around it if and when we have any specific updates.

---
> ####  I'm working on migrating form MediaPlayer to MusicKit. Does MusicKit work to play back iTunes content even if the user does not have an AppleMusic subscription?


|U03J1SQJYRW|:
Hi Tyson,
Great to hear that you're migrating! If you were using MediaPlayer to play back iTunes content without a subscription, you can accomplish the same thing using MusicKit in iOS 16!

|U03JBMMB10A|:
Great, thank you!

---
> ####  Now that we have artwork for artist (YAY), do we assume that licensing issues have been sorted?   <https://developer.apple.com/forums/thread/688012|https://developer.apple.com/forums/thread/688012>


|U03K8THM8F2|:
Hi Rudrank!
Yes, we have worked hard with business to make sure it is compliant with licensing agreement for use in your app.
For more details please check out *Meet Apple Music API and MusicKit - WWDC22* <https://developer.apple.com/wwdc22/10148>.

|U03JBMMB10A|:
Yes! Been wanting that for a long time!

|U03K8THM8F2|:
Hi Rudrank, Tyson and Everyone,
Please reference <https://developer.apple.com/app-store/review/guidelines/>  section 4.5.2 for guidance of how artist images can be used in your app.
```
(ii) Using the MusicKit APIs is not a replacement for securing the licenses you might need for a deeper or more complex music integration. For example, if you want your app to play a specific song at a particular moment, or to create audio or video files that can be shared to social media, you'll need to contact rights-holders directly to get their permission (e.g. synchronization or adaptation rights) and assets. Cover art and other metadata may only be used in connection with music playback or playlists (including App Store screenshots displaying your app's functionality), and should not be used in any marketing or advertising without getting specific authorization from rights-holders. Make sure to follow the Apple Music Identity Guidelines when integrating Apple Music services in your app.
```

|U03HMDM1J23|:
Got it, thanks!

|U03JBMMB10A|:
Right, that’s great because we used to have run all our AppStore screenshots though photoshop to change all the album artwork to public domain images. So we really appreciate this! Thank you!

---
> ####  My app uses AVAudioEngine, and I am very disappointed that the "TapOnBus()" command has such a slow responsiveness.  At an audio sample rate of 44,100 fps, it can not respond any faster than giving me 4,400 samples every 0.1 seconds.  Is there any way to speed this up?


|U03J1SQJYRW|:
Hi Keith,
Thanks for the question! I think your question is best suited for a scheduled _Core Audio Lab_.

|U03JER2C7MX|:
<@U03J1SQJYRW> Could you please help me select a proper lab for my question? I just visited the Core Audio lab, but unfortunately, I feel like it wasn’t a proper lab to address technical issues with `AVAudioRecord` .

My question relates to this Apple’s Q&amp;A - *<https://developer.apple.com/library/archive/qa/qa1872/_index.html>*

---
> ####  For iOS MultiCam capture, Apple provides AVCaptureMultiCamSession to help with capturing from multiple inputs and feeding to multiple outputs.  For Mac, what is the best way to achieve the same result. Running multiple AVCaptureSessions is definitely not the way I want to go, do I have to figure out a way of adding multiple inputs and mapping them to multiple outputs as I will be using AVCaptureVideoDataOutputDelegate and is that okay to do


|U03HEF0LUBW|:
Hello!
Thank you for the question. This would be best suited for tomorrow’s Q&amp;A: AVFoundation (between 1pm and 3pm PT).

---
> ####  Does SharePlay work inside Messages, specifically inside an iMessage App Extension?


|U03HEF3T0GL|:
We do not support SharePlay in extensions (IE: iMessage App Extensions), but we love hearing the feedback so please do file the feedback!

---
> ####  Is there existing API to share a URL of a document in iCloud Drive and for the invitees to be automatically given shared access to it for the duration of the SharePlay session, with iCloud dealing with keeping everyone up to date? If not, how do apps like Pages do this?


|U03J4E99F9S|:
Ugh sorry wrong lounge :man-facepalming:

|U03HEF3RZKN|:
No worries! I can still answer this a little bit, we do not currently have any API for this in SharePlay, but one idea you could do is add the share URL to your `GroupActivity`! You can then use the share URL to gain access on the other devices by accepting the share. Alternatively, we definitely encourage you to check out the new collaboration features in Messages offered this year! This way, people on a FaceTime call can easily get the option to share the `CKShare` with the group they’re FaceTime’ing with from the share sheet!

|U03J4E99F9S|:
Thanks. Not sure how that integrates with iCloud documents (wasn't so much the wrong place given SharePlay, just feels odd in the AV lounge!)

|U03J4E99F9S|:
It seems there is no recommended solution for doing such collab with iCloud documents which is puzzling 

|U03HEF3RZKN|:
This is the relevant API for the latter (people on FaceTime getting the option to collaborate with the group) - <https://developer.apple.com/documentation/foundation/nsitemprovider/3951995-registerckshare>. You’ll want to register the CKShare on the item provider you pass to the Share Sheet.

|U03HEF3RZKN|:
You’re in the right place for all things SharePlay :slightly_smiling_face: not just limited to audio/video!

|U03J4E99F9S|:
Thanks

---
> ####  SharePlay: Has the SharePlay message size been extended? or publicly documented?


|U03HEF3T0GL|:
The message payload for the `GroupSessionMessenger` has been increased to 256KB! Feel free to checkout our "What's new in SharePlay" talk where we talk about that!


<https://developer.apple.com/videos/play/wwdc2022/10140/>

|U03J1USNBDZ|:
:+1:

---
> ####  SharePlay related:  FB9991061  GroupActivitySharingController is unavailable in Mac Catalyst despite the documentation: <https://developer.apple.com/documentation/groupactivities/groupactivitysharingcontroller|https://developer.apple.com/documentation/groupactivities/groupactivitysharingcontroller>


|U03HEF3Q79S|:
Thank you for bringing this to our attention. We will look into this.

---
> ####  Hello all, hope everyone is doing well, i would like anyone's input on streaming audio through MQTT messages. I have created a working class that uses AudioQueue to grab packets of a certain size and listen to these bytes after applying an algorithm to it. I've done this for talking and listening using AudioQueue only. However, sometimes there could be some instability when listening and talking. Does anyone have any improvements or things i can look out for when handling live streamed audio data with AudioQueue? Or is this the right service for streaming audio? Just for context, I've tried AVAudioEngine but a few issues arose when doing so. Thanks!


|U03HC3KUDGB|:
Hi <@U03J9T1R5M4> ,
Thanks for your question, we don’t have someone from the CoreAudio team here today, but would love to go in to more detail with you in our Core Audio Lab. Please sign-up using the Developer App or at <http://developer.apple.com|developer.apple.com>

|U03J9T1R5M4|:
Hey Gavin, thank you would love to discuss more.

---
> ####  SharePlay related:  Are there any updates to user management such as linking SharePlay and FaceTime participants?


|U03HC48QP4J|:
Apps can associate GroupSession participants with accounts in your app, but the framework does not provide access to the FaceTime participant information directly.

|U03J1USNBDZ|:
Thank you

---
> ####  I have a SharePlay game on the App Store. In the game you answer questions out loud. Starting with iOS 16 my game is no longer able to access the microphone during a FaceTime call. Is this an expected change?


|U03HEF3RZKN|:
Hi <@U03J7G8UX50>! Thanks for bringing this to our attention! If you file a feedback assistant we’ll be happy to dig into this and figure out what’s going on.

|U03J7G8UX50|:
Great, thanks

---
> ####  I've have Adam on 2X to see the SharePlay updates: so appologies:  With the new Messages and SharePlay integration, does FaceTime remain as the transport layer for the stable connection and Messages therefore is a new way/UI to initiate a SharePlay/FaceTime session?


|U03HEF3T0GL|:
2X speed Adam is always fun!

SharePlay in Messages provides the same guarantees you're used to as a developer! You'll still be leveraging the Apple infrastructure for messaging through the GroupSessionMessenger with end-to-end encryption, *regardless of whether SharePlay was initiated from FaceTime or Messages!*

|U03J1USNBDZ|:
&gt; just to clarify... our app is a presentation manager enabling file sharing and group editing (aka Multiuser Quick Look) and also supporting a realtime SharePlay canvas for drawing... so we support deep FaceTime programmatic access beyond the 15.4 GroupActivitySharingController... so we currently associate file editing with who is FaceTime/SharePlay/iCloud user... so just to be clear... is FaceTime the transport for SharePlay or do we need to also manager Messages identity?


|U03J1USNBDZ|:
... because Messages and FaceTime can be different email/phone numbers

|U03HC3KUDGB|:
Hi Zaid,
Your implementation of SharePlay is really interesting, we would love to dive in to the details with you in a 1-1 lab. Could you please sign up to a SharePlay 1-1 lab using the Developer App, or at <http://developer.apple.com|developer.apple.com>

|U03J1USNBDZ|:
I shall and much thanks

|U03J1USNBDZ|:
it seems that I already submitted a request for: June 8, 2022,  between 8:00 p.m. and 10:00 p.m. EDT (UTC-04:00)

---
> ####  When an arbitrary UIView is overlaid on top of an AVPlayer containing HDR content (think subtitles, mute toggle, etc.), the overlay appears much dimmer and can be hard to read. Is there a way to disable this behavior and render the overlay with the same brightness?


|U03HY2CNFAN|:
&gt; Hi Chris,
&gt; Subtitles and closed caption playback using AVPlayerLayer adapt to the corresponding HDR video. If you are seeing cases where this is a concern, please file use Feedback Assistant to describe the situation you are seeing. A sample app and especially a pointer to the asset will be most helpful. Please include the platform(s) you are using.
&gt; If you would like to discuss in more detail we have an AVFoundation playback lab tomorrow.


|U03JN1D5XNJ|:
Thanks! Please see FB9875960 -- this is on iOS

---
> ####  What's the best way of determining audio output latency, esp with wireless devices like Airpods?  My app synchronizes on-screen graphics (not video) with sound, and getting accurate latency info with Airpods has been challenging.


|U03HQNTMT6V|:
Hi John. Thanks for your question. This is an interesting problem.
1. It is difficult to get correct latency values for AirPods right now. Would you please file an enhancement request for this (<https://developer.apple.com/bug-reporting/>)?
2. Can you elaborate how you are playing audio in your app? Is it by any chance using AVPlayer?


|U03J1RX038W|:
Hi Moritz, thanks! I filed FB8961041 about 6 months ago. There's more detail and a sample project there if you want to check it out.

So far I've been looking at outputLatency and ioBufferDuration from AVAudioSession but they only add up to around 20ms whereas the actual latency is somewhere around 110ms. I have read (I think from Jeff Moore) that some or all of the remainder comes from "safety offsets" but I don't see that those are exposed anywhere.

Basically this has been holding up a couple of music-related apps that I'm working. I simplified the problem space somewhat for the sake of brevity, but input latency plays into it too.

|U03J1RX038W|:
I will note that standard videos on iOS sync to Airpods sound quite reliably so I know this is doable :slightly_smiling_face:

|U03HQNTMT6V|:
Thank you very much for the FB number.

|U03HQNTMT6V|:
Note that AVFoundation playback objects like AVPlayer or AVSampleBufferAudioRenderer handle latency for you.
So, if you can use one of those for rendering your audio, you can rely on the AVPlayerItem timebase or AVSampleBufferRenderSynchronizer currentTime to synchronize your graphics.

---
> ####  Hi! I have a fairly technical question that might have been a better fit for a lab, but I missed the deadline on Monday to apply for it. :pensive:  I am using a custom Core Image compositing pipeline (via the AVVideoCompositing protocol) that is using CIFilters for adjusting a foreground and background video and combine them via alpha blending/masking.  The custom compositor has some parameters stored in an instance conforming to the AVVideoCompositionInstructionProtocol.  The goal is for the user to interactively adjust these parameters, and have the composited video (played back continuously) reflect these changes with as little latency as possible.  In my current implementation there is a significant lag between slider adjustments and the video image responding. Presumably this is because the video player has already processed and buffered frames using the previous parameter values.  I am hoping to find an approach that would allow smooth and responsive adjustments of the CIFilter parameter(s) while the video is playing. Maybe there is some instruction that would flush the player's cache (without interrupting playback)?  Amongst other things I tried setting the AVPlayerItem’s preferredForwardBufferDuration to a very low value (such as 0.01), but this seemed to have no effect on the responsiveness of adjustments.   Here is a simplified example project that only has a single slider for controlling foreground exposure : <https://www.dropbox.com/s/bk3srki6ys455sr/VideoCompositing.zip?dl=1|https://www.dropbox.com/s/bk3srki6ys455sr/VideoCompositing.zip?dl=1>


|U03HRD4PZLN|:
G'day, Hendrik.
Thanks for your question.  It's cool to hear about your advanced use of AVVideoCompositing.
I want to point out that it isn't too late yet to request a timeslot in the Thursday AVFoundation Playback lab.
Regarding your request to reduce the latency for rendering during user interaction: would you please file an enhancement request via the feedback assistant, and include the sample app that you have already built?

|U03JRPTG8BS|:
Thank you. I didn’t consider the Playback lab, but actually my question fits into that pretty well, so I will apply for a lab appointment tomorrow.

---
> ####  I have a custom document format that embeds video files. Is there a way to get an AVPlayer to play that data without first writing the video data out to a tmp file so that I have a file URL to pass to AVPlayer?


|U03HRD4PZLN|:
G'day, Daniel.
Check out AVAssetResourceLoader.  Through it, you can provide a delegate that will be called to interpret a custom URL scheme and deliver data that you will read from your custom document format.
There is a new API property in iOS 16 and macOS 13 Ventura called entireLengthAvailableOnDemand which optimizes the case where the data is already available locally, as in your app.

---
> ####  Can I disable the control center option to spatialize audio if the user is using AirPods? Setting AVPlayerItem.allowedAudioSpatializationFormats to .none doesn't seem to do the trick. 


|U03HC3P9VS7|:
Hi Martin, can you describe your use case a little more?  Why would you like to disable the Control Center option?

|U03HC3P9VS7|:
If this capability is important to your app, we'd love to hear more.  Could you also file a request (<https://developer.apple.com/bug-reporting/>) and describe your use case?

---
> ####  Is there a way to get presentation and decoding data from AVPlayer such as the PTS (presentation time stamp), DTS (display time stamp), or PCR (program clock reference)?


|U03HHD75JEB|:
Hi Neil. In AVPlayerItemOutput.h, there is some sample code above the declaration of `AVPlayerItemVideoOutput0`. Using `AVPlayerItemVideoOutput`'s `copyPixelBufferForItemTime:itemTimeForDisplay:`, you you should be able to grab what I believe comes out as the PTS.

|U03HHD75JEB|:
If you want to work more on this with us, you could come back and ask us this question to either the AVFoundation Playback lab on Thursday or the HTTP Live Streaming lab on Friday :slightly_smiling_face:

|U03J213RF18|:
Thanks. I'm still trying to find the code you're talking about (had to create an obj-c project to view the h file).

|U03J213RF18|:
I think I found it. Thanks

|U03J213RF18|:
Would these calls have any impact on the performance of the video playback?

|U03J213RF18|:
Our interest is in sussing out the source of an audio/video desynchronisation issue we're having.

|U03HHD75JEB|:
The only way to know for sure is to try it out and profile, but I would not think that using `AVPlayerItemVideoOutput` would have a major impact on playback performance.

|U03HHD75JEB|:
If you can determine that your content is not at fault, could you Feedback Assistant report?

|U03J213RF18|:
At this point we're not really sure. We have a feedback ticket open, but we have not come up with a cause yet. There is a desire from some of the people on our team to know the PTS etc.
In our case, we have AAC-LC that throws decoding errors and drifting out of sync only when DRM (fairplay) is enabled. If the stream is clear, everything is fine. If we switch to HE-AAC, we're not seeing these issues and it's not clear to me why this would be or why DRM would make it happen/worse

|U03HHD75JEB|:
Could you share the FB ID of your feedback ticket?

|U03HHD75JEB|:
I should note that AVPlayerItemVideoOutput will not work with FairPlay.

|U03J213RF18|:
FB9995441

|U03J213RF18|:
Ah ok, good to know

|U03HHD75JEB|:
In case we run out of time here, I highly encourage you to come to the HTTP Live Streaming Lab on Friday to discuss this further.

|U03J213RF18|:
I have submitted a request for that lab.

|U03J213RF18|:
...and the AVFoundation playback lab

|U03HHD75JEB|:
Excellent.

|U03J213RF18|:
We have multiple pipelines...one for live content, and one for vod content....we only experience this on live content, but the pipelines are different vendors etc...so I would think it's some kind of configuration issue...but the whole DRM vs Clear throws that into doubt

|U03HHD75JEB|:
Did you make any progress on debugging the audio decode errors?

|U03J213RF18|:
I have not, no. It was suggested that it was an encoding issue, but I don't see why it would be ok when playing clear streams.

|U03J213RF18|:
Also, my understanding is that HE-AAC is just a more feature rich version of AAC-LC, so I don't know why that change would make a difference

|U03HHD75JEB|:
Perhaps there is an issue with the audio encoder that is only hit with the configuration of AAC-LC+FairPlay? We are definitively seeing bad data fed into our audio decoder, but I cannot tell you why.

|U03J213RF18|:
And so is the audio data the same whether or not DRM is applied, or are they structurally different?

|U03J213RF18|:
My assumption was just that DRM would need to be decrypted first and then it's the same data as clear

|U03HHD75JEB|:
Do you have two audio streams of what you consider to be byte-for-byte identical, one clear-text and one encrypted?

|U03HHD75JEB|:
Identical aside from their encryption, that is.

|U03J213RF18|:
In our lab we have 2 channels side by side...one clear and one Fairplay. I believe i noted the exact URLs in the FB

|U03J213RF18|:
but they should be identical in every way except drm

|U03HHD75JEB|:
I'm taking a look at the media segments. But I suspect we'll run out of time.

|U03J213RF18|:
Thanks...I appreciate any info we discover in the time allotted...

|U03HHD75JEB|:
The HTTP Live Streaming lab would be the best venue to continue this conversation :slightly_smiling_face:

|U03J213RF18|:
The initial question I have on my request for that one is different than what we're discussing today. Will that matter?

|U03J213RF18|:
This particular issue I have requested for the playback lab

|U03HHD75JEB|:
If possible, ask this question again in a new question, so we can appropriately prepare.

|U03J213RF18|:
ok, sounds good...I'll create a new request

|U03J213RF18|:
thanks

|U03HHD75JEB|:
Thanks! Have a nice rest of your day.

|U03J213RF18|:
It doesn't seem to let me request more than one appointment? do i cancel and create new?

|U03HHD75JEB|:
Yeah, that will work.

|U03J213RF18|:
ok, thanks

---
> ####  How can we use multiple AVPlayerLayer's with one AVPlayer? This leads to frozen video in simulators. See: <https://developer.apple.com/forums/thread/688766|https://developer.apple.com/forums/thread/688766>


|U03HC3P9VS7|:
Hello Kai, it looks like you've submitted FB9566529.  Thanks for the report.  We are investigating this, but rest assured that multiple AVPlayerLayers connected to a single AVPlayer is a supported use case.

|U03JEKFMT4Z|:
It works on devices in production, but it's limiting our simulator productivity for debugging so any fixes or workarounds would be very helpful

---
> ####  My iPad app has a camera view (streaming / recording).  Is it possible to use the camera while in multitasking mode / stage manager? I'd like to adopt all the new apis, but currently I'm stuck requiring my app to stay in full screen.


|U03J08PTTB6|:
Yes. iOS 16 adds new Camera multitasking APIs that allow developers to use the camera while multitasking. Please refer to the session:
<https://developer.apple.com/videos/play/wwdc2022/110429/>
And the Developer Publications Article:
<https://developer.apple.com/documentation/avkit/accessing_the_camera_while_multitasking?language=objc>
If you have additional questions, please sign up for the Camera Capture Lab on Friday 9am to noon PDT.

|U03J4BFE17W|:
WOW Thank you!

|U03J08PTTB6|:
You're very welcome. Have a great rest of WWDC!

---
> ####  Are there any plans for native integration of CMCD in AVFoundation....


|U03HHD1EC3Z|:
Good Afternoon! We would love to hear more information about your app and use case of CMCD, if you haven’t already could you please file an enhancement request at <https://developer.apple.com/bug-reporting/>

---
> ####  This is about AVCaptureDevice.  If the device is a telephoto camera, I suggest a direct way to query it (or query its active format) as to its lens power.  That is, does it have 2.0x optical power, or 2.5x or 3.0x?  This would be useful for any camera app where the user manually selects the lens to use (no virtual device).  Thanks!


|U03HC493YP4|:
Hi Eric,
Thanks for your question, unfortunately we don’t have someone from the AVCaptureDevice team with us today. But we have a Q&amp;A: Camera Capture digital lounge tomorrow or a Camera Capture
lab on Friday.

---
> ####  How do you turn an array of `Float`s (representing audio) into an `AVAudioPCMBuffer` (to pass to `AVAudioFile`'s `write(to:)` method)?  This seems to mangle the output: ``` var floats: [Float] = ... // this comes from somewhere else try withUnsafeMutablePointer(to: &amp;floats) { bytes in     let audioBuffer = AudioBuffer(mNumberChannels: 1, mDataByteSize: UInt32(bytes.pointee.count * MemoryLayout&lt;Float.size), mData: bytes)     var bufferList = AudioBufferList(mNumberBuffers: 1, mBuffers: audioBuffer)     let outputAudioBuffer = AVAudioPCMBuffer(pcmFormat: buffer.format, bufferListNoCopy: &amp;bufferList)!     try self.renderedAudioFile?.write(from: outputAudioBuffer) } ```  ... and the version without the `withUnsafeMutablePointer {` gives me a warning (`Cannot use inout expression here; argument 'mData' must be a pointer that outlives the call to 'init(mNumberChannels:mDataByteSize:mData:)'`) when you try and dereference the float array directly like: ``` var floats: [Float] = ... // this comes from somewhere else let audioBuffer = AudioBuffer(mNumberChannels: 1, mDataByteSize: UInt32(floats.count * MemoryLayout&lt;Float.size), mData: &amp;floats) // ... ```


|U03HC3P9VS7|:
Hi Robert,
We would love to chat to you in more detail 1-1 on this.  Please book an appointment in the Core Audio lab on Thursday 10am Pacific or Friday 2pm Pacific

|U03KGFBCP24|:
I’d love to, but I’m in CET+1 and the Thursday ones seem to be booked out and the Friday ones are 2am for me.

|U03KGFBCP24|:
I’ve replicated the question in the dev forums: <https://developer.apple.com/forums/thread/707690>

---
> ####  I am trying to compress video files before uploading to a server. I am using an AVAssetExportSession to do this, however, i have not been able to get it to work. After running, the session's status is always "failed" and I get a very generic error with the ID 17508. Any insight as to what might be going wrong?   This is the error:  Asset Writer Error: Error Domain=AVFoundationErrorDomain Code=-11800 "The operation could not be completed" UserInfo={NSLocalizedFailureReason=An unknown error occurred (-17508), NSLocalizedDescription=The operation could not be completed, NSUnderlyingError=0x280314d80 {Error Domain=NSOSStatusErrorDomain Code=-17508 "(null)


|U03HRD4PZLN|:
G'day, Mitchell.
I am curious about the destination URL that you're providing to AVAssetExportSession.  It looks to me like this error indicates that our frameworks were unable to access that URL.  Can you check that it's a URL that your app has access to -- for example, if you need a temporary filename, are you using NSTemporaryDirectory() to generate it?

|U03JRSDS7JQ|:
Yes! So I spent about three hours yesterday messing with this as with research thought this was the error too. I have tried every combination of different URLs and all had the same problem. I will paste what i’ve tried below.

However, to test if this was the problem, I tried copying the data I already had to one of these url’s and reading it back and it worked. So I thought that the problem was not the output URL that I was writing too.

|U03JRSDS7JQ|:
Here is everything I tried:

//  let compressedURL = NSURL.fileURL(withPath: NSTemporaryDirectory() + NSUUID().uuidString + “.mov”)
//  let compressedURL = URL(string: NSTemporaryDirectory())?.appendingPathComponent(“Library/Caches/compressedVideo101.mov”)

//  let exportPath = NSTemporaryDirectory().appendingFormat(“video.mov”)
//  let compressedURL = URL(fileURLWithPath: exportPath)

//  let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
//  let compressedURL = documentDirectoryURL.appendingPathComponent(“compressionVideos/compressedvideo2.mov”)! as URL

//  let docPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
//  let compressedURL: URL = URL(fileURLWithPath: docPath).appendingPathComponent(“video_output.mov”);

//  let temporaryDirectoryUrl: URL = FileManager.default.temporaryDirectory
//  let temporaryFilename = ProcessInfo().globallyUniqueString
//  let compressedURL = temporaryDirectoryUrl.appendingPathComponent(“\(temporaryFilename).mov”)

  `*let* documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first`
  `*let* compressedURL = documentsPath!.appendingPathComponent("compressedvideo4", isDirectory: *false*).appendingPathExtension("mov")`

|U03JRSDS7JQ|:
The last one, the uncommented one, is the one I am currently using because i was able to successfully copy the data to it and read it back properly which makes me think assume it works.

|U03HRD4PZLN|:
Can you give an example of the URLs that these are generating for you?

|U03JRSDS7JQ|:
Could there possibly be a permissions problem with my app that is preventing the export session from writing to it?

And yes! I’ll provide a URL. Is the app ID generated in the URL sensitive information that I shouldn’t provide to the somewhat public setting of the WWDC lounge? Need to keep certain aspects of the app confidential.

|U03HRD4PZLN|:
Feel free to XXXX out whole words of the URL that might leak anything.

|U03JRSDS7JQ|:
Great! Here are two different URLs, one for the temporary directory and one for the documents directory.

This is for the tmp directory and was created using this code: `let compressedURL = NSURL.fileURL(withPath: NSTemporaryDirectory() + NSUUID().uuidString + ".mov")`

|U03JRSDS7JQ|:
sorry one moment send pressed too early

|U03JRSDS7JQ|:
For the tmp directory created using the code above:

`file:///private/var/mobile/Containers/Data/Application/XXXXXXXX/tmp/XXXXXXX.mov`

|U03JRSDS7JQ|:
This is for the docs directory created using this code:

`*let* documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first`
  `*let* compressedURL = documentsPath!.appendingPathComponent("compressedvideo4", isDirectory: *false*).appendingPathExtension("mov")`

URL:
`file:///var/mobile/Containers/Data/Application/XXXXXXXXXXXX/Documents/compressedvideo4.mov`

|U03JRSDS7JQ|:
Is that the information you wanted to see?

|U03JRSDS7JQ|:
Still producing this error

|U03HRD4PZLN|:
If I understand correctly, you have a bunch of attempts to generate a temporary URL which aren't working, but one last one that does work, but seems like not the right place to put the temporary file?

|U03HRD4PZLN|:
Sorry, it looks like I misread you.  The last one doesn't work but you were able to confirm that your app can write there

|U03JRSDS7JQ|:
<@U03HRD4PZLN> I know I can write to the last one because of the copy test, but all of them produce the error. Whether a temporary URL or not, all of them produce the error message I pasted above

|U03JRSDS7JQ|:
Yes exactly!

|U03HRD4PZLN|:
OK.  A puzzle!

|U03JRSDS7JQ|:
I have not yet done a test with the temporary URLs but I can if that helps, I assume most of them would work also

|U03HRD4PZLN|:
Maybe the destination isn't the problematic variable, then.  What can you tell about the source asset?

|U03JRSDS7JQ|:
The asset is a video, taken from the user’s photo library using PHPickerViewController which writes it to a URL on the system which I know I am able to read from because I am able to get raw data from it.

|U03JRSDS7JQ|:
The video is about 11 seconds long and about 20MB

|U03JRSDS7JQ|:
URL of the source:

file:///private/var/mobile/Containers/Data/Application/XXXXXXX/tmp/.com.apple.Foundation.NSItemProvider.lobgL0/IMG_0061.mov

|U03HRD4PZLN|:
We seem to be stumped too -- and we are running out of time in this lounge.  Can I ask for you to file a feedback assistant report including a sysdiagnose, and if possible, a sample project that reproduces this?

|U03JRSDS7JQ|:
Yes I can get those things together, thank you <@U03HRD4PZLN>!

|U03HRD4PZLN|:
Thanks for your patience and persistence, <@U03JRSDS7JQ>!

|U03HRD4PZLN|:
Beyond that, you could sign up for a slot in the AVFoundation Playback lab on Thursday.

|U03HRD4PZLN|:
The developer forums are also a resource for getting help with issues like this.

|U03JRSDS7JQ|:
<@U03HRD4PZLN> Is this question appropriate in the playback lab?

|U03HQNTMT6V|:
Yes. absolutely. Please mention that this is follow-up for a digital lounge question.

|U03JRSDS7JQ|:
Sounds good, thank you so much!

---
> ####  I have an app for iOS and macOS for which I am using AVFoundation to capture video.  I have a specific question when it comes to capturing data simultaneously from multiple AVCaptureDevice objects. On iOS we have AVCaptureMultiCamSession.  But I am more interested in macOS. Since that API is not available for macOS, what is the best way to achieve the same result i.e. mapping multiple simultaneous input devices to multiple outputs. Would I have to run a single AVCaptureSession and do my own management of adding multiple inputs and mapping each input to its own distinct output device ? Hoping to discuss the best method to do this. Thanks


|U03HC493YP4|:
Thank you for the question, unfortunately we don’t have someone from the AVCaptureDevice team with us today. But we have a Q&amp;A: Camera Capture digital lounge tomorrow and a Camera Capture lab on Friday.

---
> ####  we have some devices which provide audio and video samples which are synced with one another but not with the host clock. So the audio sample rate is not e.g. 48kHz, but something close to it. Microphones usually provide a feedback pipe so that the host can tell the device to djust its output sample rate to match the host clock rate; these devices cannot do that. Can we just measure the incoming sample rate and tell CoreAudio that it is (e.g.) 48012 Hz for some seconds and 48006 Hz for some seconds, etc, or can it not to do rate matching?


|U03HRD4PZLN|:
G'day, Stuart.
Our traditional strategy underlying A/V sync is to synchronize video to audio, wherever possible, because adjusting video timing is generally simpler and lower-impact than adjusting audio.  In this approach, we allow the sequence of audio samples to define the timeline of the recorded movie, and the timestamps of video frames are recorded relative to that.
It's not clear to me from your question whether you're asking about a scenario of capture, or playback, or something real-time?

|U03HVCWP48N|:
I think he might be asking what strategy AVFoundation or CoreAudio uses to re-sync the samples.  Does it drop a slice and interpolate the waveform?  Does it play the sample at a lower rate, or perform a full retime / resample?  In a formal, professional production environment, this simply doesn't happen because pro gear is synced together with clocks to eliminate _*jitter*_ and ensure accurate sampling rates.  Consumer gear doesn't have such a stringent requirement.

|U03HVCWP48N|:
If you're saying the audio is inviolate and sacred, then video is expected to drop frames.  But he has a point; if some piece of audio equipment records at the wrong sample rate, what's the solution?

|U03HRD4PZLN|:
Speaking generically: yes, in those cases I'd expect that someone would need to resample it.

|U03JDS776JH|:
it is real time playback and capture of incoming video and audio from AV capture hardware. Realtime playback never seems to be a problem, but we have problems with A/V desync, particularly if we are synchronizing another audio source

|U03HVCWP48N|:
<@U03JDS776JH>: if this is realtime in a studio environment, you might want to invest in something like a "master clock" or "time code generator."

|U03JDS776JH|:
because that second audio source is often a microphone, and a microphone usually delivers exactly the host’s idea of the requested sample rate. So I guess what I’m asking is can I expect Core Audio to smoothly and seamlessly rate match if I mix two samples with slightly different sample rates (e.g. 48 and 48.003 kHz), where the not-quite-48kHz sample rate may vary from minute to minute as we measure?

|U03HVCWP48N|:
Is it a *directly-attached* USB microphone like a Blue Yeti, or something attached with an XLR cable to a preamp, and if so, is that preamp USB or Thunderbolt?

|U03HVCWP48N|:
(the underlying issue is probably the hardware introducing clock drift, which should not happen)

|U03JDS776JH|:
second audio channel is usually an external USB microphone. Primary audio channel is synced to the primary video.

|U03HVCWP48N|:
The recording sampling rate will be determined by the project definitions (Logic Pro, Avid, etc) and it's reasonable to assume that you are recording all devices simultaneously within the tracking session.  Therefore, _*all hardware is expected to sample at the same rate*_.  If this drift is only happening with one external device, then it's the device, not you.

|U03JDS776JH|:
even if the capture source’s audio did not drift, we can never guarantee that its output rate matches the computer’s. Even if the capture source’s audio rate were drift-free, the host clock can drift. With USB microphones, a feedback pipe requests a few more or a few less samples from the hardware to match the host’s expectations, and the USB microphone adjusts its PLL accordingly. This isn’t possible if the audio sample rate is dictated by another piece of hardware.

|U03HRD4PZLN|:
I think I'm going to recommend that you sign up for a slot in the Core Audio lab on Thursday, <@U03JDS776JH>.  Though I was not entirely clear which interface you're integrating at: e.g., an audio device, a CoreMediaIO DAL plugin, an app calling AVCapture, an app calling CoreAudio?

|U03HVCWP48N|:
Sounds like you have two pieces of hardware fighting for the role of master clock in this situation.  In the Audio MIDI Setup app, it shows the 'default' clock source for each device.  Your recording app should be able to determine which one plays the role of master clock.

|U03HVCWP48N|:
Unfortunately that's not possible from the AMS app.

|U03HVCWP48N|:
All you can really do is set the preferred sample rate.

|U03JDS776JH|:
An app using CoreAudio. The question is can Core Audio resample without glitches if we continually update the sample rate. The audio channel from our device - our app generates audio and video samples from it, the audio channels don’t appear in AMS. So we can describe the samples as having a rate of 48003 per second if we want to. The question is whether core audio can deal with on-the-fly changes of the order of 0 to 30ppm happening on a minute-by-minute basis, or does it cause discontinuities in the output?

|U03HVCWP48N|:
That's *definitely* a question for the labs.  :lab_coat: :test_tube: :loud_sound:

|U03JDS776JH|:
super I will try to book one

|U03HVCWP48N|:
I'm a Mac sysadmin who happens to have a degree in audio engineering and has supported post production environments &amp; entertainment companies.

|U03HVCWP48N|:
But I don't know the code level stuff.

---
> ####  I wonder if it's possible to have an `AVAudioEngine` running and connect the `inputNode` later and only request permission for the microphone when actual recording is going on. Most apps I've see have the recording indicator in the status bar immediately up even if recording will only happen later. Users might be spooked by the rec. indicator if it's always on, it gives the impression the app is always listening, even it's just generating audio. Is there a way to optimize this experience?


|U03HC493YP4|:
Hi Daniel,
Thank you for the question, unfortunately we don’t have someone from the audio team with us today. But we have Core Audio lab tomorrow, and you could sign up by 6pm today.

|U03JPBUSHLZ|:
Did you get an answer to this? Curious about if this is possible too

---
> ####  I'm trying to customize the tvOS native AV Player UI.  Is there a way to toggle the LIVE badge on and off?  Working on live DVR, and I would like to be able to use that Live badge to indicate if the user is at the live edge or in the archive.


|U03HQNTQK33|:
Hey Joseph, there is currently no way to toggle the live badge on and off when you’re at the live edge. We’re interested in understanding more about your particular need here. Please file an enhancement request through Feedback Assistant and we will take a look.

|U03KB8G0ENL|:
Thanks.  I will do!

---
> ####  When defining an HLS manifest with multiple audio groups and and audio tracks that use the same NAME parameter such as this example:  #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-ac3",LANGUAGE="en",NAME="English",AUTOSELECT=YES,CHANNELS="6",URI="playlist-ac3.m3u8"  #EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="audio-aac",LANGUAGE="en",NAME="English",AUTOSELECT=YES,CHANNELS="2",URI="playlist-aac.m3u8"  AVFoundation seems to filter out all but one of the audio tracks. Is there documentation somewhere on how the filters are applied (such as on device X with os Y you get the multichannel rendition vs the 2 channel rendition)?  Or should we always be using separate NAME values across groups to keep the audio tracks available when asking AVPlayer for the tracks?


|U03HEF43AFN|:
Thanks for your question regarding the HLS manifest entries.

1,  You should definitely keep using NAME="English".

2.  HLS is dynamic and will automatically choose the most appropriate alternate selection based on hardware capabilities, user preferences, system settings, network conditions, and other factors.

3.  Could you please file a feedback assistant report to provide more information about your use case for getting the tracks?  What are you trying to do with the tracks?  Please state that the report is for the AVFoundation for HLS streaming and we'll take a look at it.

|U03J213RF18|:
So all video bitrates are associated with both the AAC group and the AC-3 group. When getting the audio tracks from AVPlayer, it only returns a single track for English (so whichever the system chose). Now if we wanted to present the user with the option of selecting the Stereo or Surround renditions from a menu, we'd need both to be returned when asking for those tracks. If I change the name of the surround one to English Surround, then I get both tracks. Am I using it correctly, or should the various audio tracks all be in the same group with different NAMEs?

|U03J213RF18|:
And if they do have separate names, do we lose on the system auto selecting the best audio track for playback?

|U03HRD4PZLN|:
Sorry that we're out of time.  I recommend that you sign up for the HTTP Live Streaming lab on Friday to get more help.

|U03HEF43AFN|:
In general, I don't recommend changing the NAME to simply split the media selection options.  That will mess up the fallback behavior.  We should find out more information about exactly what they are trying to do, though.

|U03HEF43AFN|:
As Sam pointed out, this might be a good topic for a lab.

|U03J213RF18|:
I have 2 questions for the HTTP lab....how can i best manager that, i can't request 2 appointments

|U03HC493YP4|:
You could describe both of your questions when requesting the one appointment.

---
> ####  Is it possible to configure an AVAudioRecorder to do echo cancellation on macOS/iOS? e.g. so that recording while a FaceTime call/Zoom/whatever is going on, the recorder only records the voices of people in the same room as the computer, not the sound coming out of the computer?


|U03HC3P9VS7|:
Hi William, we would love to chat to you in more detail 1-1 on this. Please book an appointment in the Core Audio lab on Thursday 10am Pacific or Friday 2pm Pacific

---
> ####  What are the constraints on code running in an AVAudioNode.installTap (<https://developer.apple.com/documentation/avfaudio/avaudionode/1387122-installtap)|https://developer.apple.com/documentation/avfaudio/avaudionode/1387122-installtap)> block? Is that running in the audio thread or observing real-time rules, or can we make allocations/dispatch to other queues/write Swift? I've seen conflicting answers on this around the web


|U03HC3P9VS7|:
Hi again William, looks like you have a few questions that would be well-suited for a lab appointment.  We have Core Audio lab tomorrow, and you could sign up by 6pm today.

|U03J1UX2CQK|:
Thank you!

---
> ####  We're trying to run AVAudioRecord to use it for Speech Recognition in our iOS keyboard extension for an unique dictation experience, but we keep receiving an error, which is described in the following Apple's Q&amp;A that it is impossible to start record in any app extension: `com.apple.coreaudio.avfaudio error 561145187`  My question is why it was limited since iOS 8 and is it still a case in iOS 16, so that maybe we can get an access to it?  URL for a feedback: <https://developer.apple.com/library/archive/qa/qa1872/_index.html|https://developer.apple.com/library/archive/qa/qa1872/_index.html>


|U03HC3P9VS7|:
Hi Roman, thanks for the question.  Unfortunately we don’t have someone from the audio team with us today. But we have a Core Audio lab tomorrow, and you could sign up by 6pm Pacific today.

|U03JER2C7MX|:
Hey <@U03HC3P9VS7>, I’ve been at the Core Audio lab today, but unfortunately, no one knows anything about how it works in app extensions, since it’s a very rare case.

|U03HC3P9VS7|:
Hmm, I wonder whether there are app extension-specific labs.  That's probably where I would try next.

|U03JER2C7MX|:
Next… year… :smile:

But that would be a great feedback for WWDC team - having separate labs for app extensions :smile:

|U03HC3P9VS7|:
If you haven't already, I think it is worth filing a report using the feedback assistant.  And share the FB id here

|U03JER2C7MX|:
Sure, here you go. FB10060598

---
> ####  I'm building a Python app that runs on Raspberry Pi to use Apple Music. There are already bindings for the API (which will probably need updating due to the new features announced yesterday).  My question is how does playback occur when I play a song through the API?  Does it need to be handled by a native player, or is it delivered by the server through the API?


|U03HC493YP4|:
Hi Matthew,
Thank you for the question, unfortunately we don’t have the folks that could answer your question with us right now. But we have MusicKit lab on Thursday, and you could register by 6pm today.

|U03J22HLA4S|:
Ah. My mistake.

---
> ####  On the Mac, can multiple apps access the camera at the same time? I am considering developing an app that would track the user's posture (and poke them to sit up straight when necessary). It would likely just need to grab a frame once a second or so. Would it be able to do that without interfering with other apps using the camera (such as FaceTime or Zoom)?


|U03HC493YP4|:
Thank you for the question, unfortunately we don’t have someone from the AVCaptureDevice team with us today. But we have a Q&amp;A: Camera Capture digital lounge tomorrow or a Camera Capture lab on Friday.

|U03J2DMEULA|:
Short answer, yes, multiple apps can access camera at the same time.

|U03J2DMEULA|:
on Mac

---
> ####   Do you have any code snipets showing how to load a stereo audio file into MLMultiArray object?


|U03H96KAN0M|:
Hi Eddie, unfortunately we don’t have any code snippets for interacting with MLMultiArray in AVFoundation. If you are looking for info for how to use MLMultiArray, there are Machine Learning &amp; Computer Vision labs on Thursday and Friday that you might like to check out. For the audio itself, what form is it in (.mov, .mp4, AudioFile supported formats such as CAF, etc.) and are you reading it all at once or processing it over time?

---
> ####  If one user has ads and the other doesn't and `interstitialTimeRangesForPlayerItem` is implemented along with having the no ads user wait, is it possible to display a count down for that user indicating when the main content will resume?


|U03HC3P2J8K|:
Hello Peter,
You could share the ad schedules across the group when playback starts using the GroupSessionMessenger. And when a participant without ads is waiting for the others to finish, you can show a countdown timer based on the schedules shared.

|U03HZ4B2WBF|:
:thumbsup: ty <@U03HC3P2J8K>

---
> ####  What is the minimum value that users expect when they want to edit a document with someone using SharePlay? What edge cases should we handle, like connection being temporarily lost, trying to edit/delete the same selection of the text, etc.?  And if we expect that there will be only one copy of the document, stored on the hosts' side, should we close the document for participants when the session is over, or should we let them see the content, being able to copy it, save, and so on?


|U03HEF3RZKN|:
<@U03JER2C7MX>, love that you’re thinking through all the edge cases! I think it’s a great idea to consider cases where the connection can be temporarily lost, we’ve commonly come across this in scenarios like people riding on subways, going into elevators, etc. People connecting through FaceTime can be in very dynamic situations where the network can go in and out, so it is important to think of an architecture that can support these cases.

One topic that we recommend looking into is _CRDTs_, they can be a little intimidating at first, but they basic idea is to structure your data in a way that is resilient to being sent redundantly and can handle cases like trying to edit the same selection of text at the same time.

We’re always happy to chat in more technical detail about these concepts and edge cases in our labs as well! If you haven’t already, feel free to register for the SharePlay lab on Friday and we’ll make sure you get a slot!

|U03JER2C7MX|:
Awesome, will do so :innocent:

|U03JMB7160Z|:
CRDTs for the win! :sunglasses:

---
> ####  If we wait for a coordinated playback session to resume when displaying stitched interstitials, is it possible to cap the maximum amount of waiting in a time period before we might revert to a skip behaviour? Thinking in particular of a scenario where two users might have ad-breaks that aren't _quite_ simultaneous. It would be very frustrating to wait for Alice to complete her advert, both videos to resume for two seconds, then Bob to view his. Ideally we'd want to force these to play simultanously?


|U03HC3P2J8K|:
Hello Nathan,
You should be able to do this by removing the `"playingInterstitial"` suspension from `AVPlaybackCoordinator.suspensionReasonsThatTriggerWaiting` , and issuing a play command to the previously waiting participant.
But we would strongly recommend to synchronize the ad timings across participants.
You could also try issuing `AVPlayer.playImmediatelyAtRate:` at the waiting participant to force them to play.

---
> ####  Like 'func playerViewController(_ playerViewController: AVPlayerViewController, willTransitionToVisibilityOfTransportBar visible: Bool, with coordinator: AVPlayerViewControllerAnimationCoordinator)` there is no callback methods to track info-pannel visibility. Whats the best way to identify when info-pannel appears and disappears?


|U03HC3KUDGB|:
Hi <@U03JXLMAJBE>,
Thanks for your question, tell us more about the experience you would like to build based on the info panel visibility and the platform(s) you are targeting?

|U03HQNTQK33|:
<@U03JXLMAJBE> There is currently no way to track the visibility of the transport controls. That’s great feedback though. As Gavin mentioned, we’re interested in understanding your use case better. Could you give some more details about it?

|U03JXLMAJBE|:
Hi <@U03HQNTQK33> and <@U03HC3KUDGB>. I have a pretty simple use-case. On tvOS platform, I want to show a custom overlay view over the top of AVPlayer view when playback controls and info panel are hidden. When the playback controls or info-panel appear I want to hide the custom overlay view and show it again when they hide.

|U03JXLMAJBE|:
Im currently doing through didUpdateFocus by comparing the nextFocused and previousFocused views, but its not really full proof.

|U03JXLMAJBE|:
The new player updates introduced with tvOS 15, didnt work with my previously build logic which works for tvOS 13 and 14. Now I have two separate logic for different players. I wish there was a callback like ‘func playerViewController(_ playerViewController: AVPlayerViewController, willTransitionToVisibilityOfTransportBar visible: Bool, with coordinator: AVPlayerViewControllerAnimationCoordinator)’. It will just make it so simple

|U03JXLMAJBE|:
<@U03HQNTQK33> ^^

|U03JXLMAJBE|:
<@U03HC3KUDGB>

|U03HQNTQK33|:
Hey Aalim, so sorry for the late reply! Just to clarify, you’re looking for a way to know when the tvOS player in tvOS 13/14 will show/hide the info panel that pulls down from the top. Is that correct?

|U03HQNTQK33|:
With an API like `func playerViewController(_ playerViewController: AVPlayerViewController, willTransitionToVisibilityOfTransportBar visible: Bool, with coordinator: AVPlayerViewControllerAnimationCoordinator)` ?

|U03JXLMAJBE|:
Yes. thats correct and not just for tvOS 13/14 but also for tvOS 15

|U03JXLMAJBE|:
<@U03HQNTQK33>

|U03HQNTQK33|:
Ah I see. So, unfortunately, we can’t update tvOS 13 or 14 with any new features (since it’s already shipped and on peoples devices). For tvOS 15.0 and later though we’ve removed the info panel that drops down from the top in AVPlayerViewController - we now have an info tab integrated into the transport bar. You should be able to use `func playerViewController(_ playerViewController: AVPlayerViewController, willTransitionToVisibilityOfTransportBar visible: Bool, with coordinator: AVPlayerViewControllerAnimationCoordinator)`  when the transport bar is shown/hidden though

|U03JXLMAJBE|:
No I have looked at this method even on tvOS 15. It just works for playback controls not for info-panel.

|U03JXLMAJBE|:
<@U03HQNTQK33>

|U03HQNTQK33|:
So in the new player, your looking to be able to know when the new info tab is opened?

|U03JXLMAJBE|:
correct.

|U03HQNTQK33|:
If the transport bar is hidden the info tab is also hidden.

|U03HQNTQK33|:
On tvOS 15.0 and later

|U03HQNTQK33|:
The delegate method willTransitionToVisibilityOfTransportBar will be called when the transport controls visibility changes. The info tab will only ever be shown while the transport bars visibility is YES. So the other would look like this

willTransitionToVisibilityOfTransportBar: YES // transport bar is about to appear
// User clicks info tab, it appears
// User exits info tab, it disappears
willTransitionToVisibilityOfTransportBar: NO // transport bar is about to hide

You should be able to use the delegate callback willTransitionToVisibilityOfTransportBar to determine if the info panel is not. If the transport bar is hidden the info tab is also hidden.

|U03JXLMAJBE|:
In tvOS 15, There are two ways to go to info panel,
1: swipe down when playback controls are visible
2: swipe down when playback controls are not visible.

In the first case, when you swipe down from transport bar  willTransitionToVisibilityOfTransportBar gets called but the value of visible is false since, transport bar hides when info panel appears.

In the second case, the willTransitionToVisibilityOfTransportBar doesn’t even gets called.

|U03JXLMAJBE|:
<@U03HQNTQK33>

|U03HQNTQK33|:
That’s correct, with the current behavior of willTransitionToVisibilityOfTransportBar you can determine whether or not the entire transport bar is hidden or visible. Unfortunately you can’t determine if any of our provided customInfoViewControllers are hidden or shown.

However, in tvOS 15.0 and later with an app linking against tvOS 15.0 and later, if willTransitionToVisibilityOfTransportBar has recently returned false then the info tab is guaranteed to be hidden. The info tab is only ever shown when the transport bar is visible because it is part of the transport bar UI at the bottom of the screen.

If the behavior I just described above is not working in the new tvOS 16.0 beta or if you need more granular callbacks for when individual customInfoViewControllers (like the info tab) are selected then I would definitely file a request in Feedback Assistant - that’s valuable feedback!

---
> ####  I have a question regarding SharePlay experience in a documents app that doesn't provide an features like collaborative editing or sharing links to the document yet.  iOS 15 case: Let's say the user starts SharePlay session with another person, which joins to edit this document as a guest. Which means that whenever the season is over, the guest won't be able to suggest edits to the other user, so that we finish editing experience and give him an option to copy text or create his own copy of the doc.  My question is how can we improve that user experience on iOS 15, improving the flow itself? And what are we capable of in iOS 16 - what would be the desired flow for editor's users and should we use collaboration api instead/combined?


|U03HEF3RZKN|:
Thanks for the detailed question, <@U03JER2C7MX>! There’s some more relevant details on this too in response to <@U03HC3KUDGB>’s question above, but it sounds like a prime example for adopting the new Messages collaboration APIs! In this case, the user doesn’t need to have an existing account in your app (e.g. they can still be a guest), but sharing the document over a Messages group will let your app get an identity for this user based on the real Messages identity, so you can ensure they can still access the document even after a SharePlay session has ended.

---
> ####  Is it currently possible to add my view/interface like an OSD aside/on top of the video content I share with others?


|U03HC3KUDGB|:
Hi <@U03J1TN6WBD>
If you’re interested in customising interface elements with AVKit we have a lounge tomorrow with the AVKit folks. But tell us more about the experience you would like to build and we can see what parts SharePlay can help with

|U03HEF3T0GL|:
GroupActivities allows you to let your creativity go wild and create any shared experience! If you wanted to create a coordinated experience for one of your app's views then you can do so with the `GroupSessionMessenger` .

Checkout our WWDC21 talk "Build custom experiences with Group Activities" where we do that and build a DrawTogether app!

<https://developer.apple.com/videos/play/wwdc2021/10187/>

|U03J1TN6WBD|:
f.e I thought about showing live stats if i'm sharing a video of a sport game with friends IRL

|U03HC3KUDGB|:
Thanks Lior, I will see if we can get someone from the AVKit team tomorrow to help you with the view, in the meantime check out the session Adam posted above so you can see ways to coordinate interface elements using the Group Sessions Messenger API

---
> ####  Hello. Is it possible to adjust video quality in the player?


|U03HQNTQK33|:
Hey <@U03HVCK66P8>, could you give us some more detail about your use case? We’d like to understand your application better.

Some streams have multiple quality variants and based on the current state of the system and network we may choose higher or lower quality streams.

|U03HVCK66P8|:
For example, the Apple Developer App.

|U03HVCK66P8|:
Cannot do fullscreen / adjust quality

|U03HVCK66P8|:
<@U03HQNTQK33>

|U03HVCK66P8|:
Becoz the video always loads in low quality and then becomes high after a period.

|U03HVCK66P8|:
I tried both apps (iOS/macOS/web), even the new player cannot change too.

|U03HVCK66P8|:
Thus, I can only download the video, and it just takes a few seconds.

---
> ####  Is it safe to update the GroupActivity conforming object after the session begins?  I’ve used this method to update some global info about the session without using messages to make sure everyone including late-joiners receive the new data. But would this have any unintended side-effects/should I refactor to only use messages?


|U03HEF3RZKN|:
Great question, <@U03JLRZJHQR>! The GroupActivity on the session is safe, and even encouraged, to be updated after the session begins! We’ve done work under the hood to make sure after one person updates it everyone ends up in the right state. It’s important to note that you don’t want to update it too frequently, where too many people could stomp on each other’s toes — we use a form of conflict resolution known as _last writer wins._ This means that the last person to update the activity will win, and all others will see that latest activity. So if two people update it at the same time, you’ll only see one. However, everyone will be guaranteed to be in the same state so you don’t have to worry about that!

This can be a great way to infrequently update the “state” of the group, e.g. for a Music playing app you can update it to whatever song is playing so everyone transitions to the correct song.

|U03JLRZJHQR|:
Great, thanks for the detailed reply!

---
> ####  I am building a Music Visualizer (for macOS and iOS as well as any future Apple platforms that would support immersive Metal powered visualization)   I have been wondering about how to properly support Apple Music instead of merely internet streams and purchased iTunes music. There is wonderful support for integrating with Apple Music to allow the user to select tracks and playlists etc. I have not found a way to actually tap into the audio buffers to do the analysis (e.g. FFT) that I need. Common sense tells me there could be fully understandable legal reasons for this, but I still want to ask for your advice on how to best support Apple Music, now that I have this brief window of time. Perhaps there is a way to get access to "reduced information" about the audio signal somehow without my app actually accessing the raw buffers?  A workaround using the microphone incurs a lag in responsiveness and results in very poor audio with headphones. (I use AudioKit, but this seems to be a general issue even when activating the mic in System Preferences).  Thank you!


|U03H96G1FB7|:
Hello <@U03HZ462YF7>!

Indeed. This is a commonly requested feature, and one that is very hard for us to deliver for many reasons, some of which you alluded to.

Could you please file this as an enhancement request in the <https://feedbackassistant.apple.com|Feedback Assistant> tool, and describe the types of use cases you would use the audio buffer for and we will include it in our investigations.

Thank you very much in advance!

|U03HZ462YF7|:
Thank you <@U03H96G1FB7>. You have spared me days of futile investigation. If/when I know more about what I end up needing I can provide some feedback. I guess the right topic in Feedback Assistant would be “Web Services &amp; SDKs”?

|U03HZ462YF7|:
Or either “macOS” or “iOS &amp; iPadOS”?

|U03H96G1FB7|:
I think you should actually use either “macOS” or “iOS &amp; iPad OS”.

|U03HZ462YF7|:
Thank you! I think users would expect an app like this to work great with Apple Music and it would be so incredibly cool.

---
> ####  Something I've been wondering. If I'm expecting a ShazamKit experience to be used in a noisy environment, do I need to mix in some simulated noise into source audio when creating a catalog?


|U03HJ50BLD9|:
There’s no need to mix in noise at any stage in the creation of custom catalogs, clean audio is always preferred. Shazam is noise tolerant (you’ve used the app in a noisy setting and still received a match I’m sure). So have a clean audio reference signature, and try and make sure that the query signature is as clean as possible, but it can tolerate a certain amount of noise.

---
> ####  Please in Apple Music API add finally endpoint to remove a song from playlist! This is very tedious job if I want to have curated playlist that I share to other people. We wait for such simple feature :)


|U03H96G1FB7|:
Hello <@U03K04WLQGL>!

Thank you very much for your feedback! We understand the strong desire to be able to delete a song from a playlist.

While we don’t have any update on this front for Apple Music API, I’m happy to report that this functionality is now available on Apple platforms through the MusicKit framework. That being said, you cannot remove items from _any_ playlist, but only playlists users have created _in your specific app._

Please refer to <https://developer.apple.com/forums/thread/707759|this thread> in the Apple Developer Forums for more information.

If you would like to see this functionality exposed in Apple Music API so it can also benefit other platforms like the Web and Android, feel free to file an enhancement request on <https://feedbackassistant.apple.com|Feedback Assistant>, including some information about your use case.

Thanks!

---
> ####  Will MusicKitJS be updated? Currently AppleMusic API is upgraded to 1.2 however JS is still 1.0 with a bug preventing playback after 15 minutes. At the same time at <https://js-cdn.music.apple.com/musickit/v3/docs/index.html?path=/docs/introduction--page|https://js-cdn.music.apple.com/musickit/v3/docs/index.html?path=/docs/introduction--page> documentation for JS v3 exists but there is no ETA for that - is that abandoned project?


|U03H96G1FB7|:
Hello <@U03K04WLQGL>!

Let me relay some information in this regard from my colleagues working on MusicKit on the Web.

The future of MusicKit on the Web is indeed the v3 one you found, which is documented <https://developer.apple.com/musickit/web/|here>. However, it’s currently in extended beta to make sure we incorporate developer feedback completely before removing the beta label.

I hope this helps.

|U03K04WLQGL|:
Thank you.  in v3 beta there is not possible to do setQueue for playlist, should I report bug normal way by Feedback Assistant? Also, understanding v3 is the future will 1.0 be updated in the meantime with fix for stop playing after 15 mminutes?

|U03H96G1FB7|:
I wish my colleagues working on MusicKit for the Web were here to help answer your questions more directly.

|U03H96G1FB7|:
My recommendation is to report any issues via <https://feedbackassistant.apple.com|Feedback Assistant>, for sure.

|U03H96G1FB7|:
But also, feel free to keep the conversation going in the Apple Developer Forums, by starting new threads there with the tag <https://developer.apple.com/forums/tags/musickit-js|MusicKit JS>.

---
> ####  Are both devices able to gracefully end?


|U03GXGUERJB|:
Yes, either side can end gracefully by canceling the NWConnection.

|U03JWCQ8ZPY|:
Thank you :slightly_smiling_face:

---
> ####  Is this available for every Watch series?


|U03HC447BA7|:
Every watch that supports watchOS 9 is supported

|U03JWCQ8ZPY|:
Thank you :slightly_smiling_face:

---
> ####  Is there a limit in what information we want to pass from the watch to the tv, or can we send images, video or sound?


|U03HQNWPDBK|:
You can write whatever data you want into the nw_connection!
 You can use it just like you would communicating with a server over the internet.

|U03JWCQ8ZPY|:
Thank you so much Eliot :slightly_smiling_face: This session made my day! :partying_face:

|U03HQNWPDBK|:
Thank you for all the questions!  Its always awesome to see people enthusiastic about the things we build here ^_^

---
> ####  Can only one device connect to the TV at one time?


|U03HQNWPDBK|:
DeviceDiscoveryUI only supports having one device connected to the Apple TV at a time.

|U03JPBUSHLZ|:
Sorry google search didn’t reveal the docs for some reason. I’ve found them.

---
> ####  Is the app icon that shows on the TV something that I can configure as part of the connection? Will it be the same as my iPhone app's icon?


|U03J1T8T77A|:
Good question! The app icon that shows on the TV is the icon of your tvOS app that's presenting the picker.

|U03JPBUSHLZ|:
Thanks, Eric. It was a silly question -- google search didn’t reveal the docs for some reason. I’ve found them and I understand now :sweat_smile:

|U03HQNWPDBK|:
No worries!  Hopefully they've helped clear up any questions you have, and if you have any further, don't hesitate to ask ^_^

|U03J1T8T77A|:
All good! Feel free to post on the Forums too after WWDC, if there are any other questions. We're happy to help!

---
> ####  Is there a max limit of time for the connection to exists between tv and watch or how is this regulated in case the user forgets to terminate the connection?


|U03HQNWPDBK|:
The connection is allowed to exist for long as the application is running on both the tv and the selected device. Once the application has been suspended, the connection will be terminated. If your app has been granted extended runtime, say for example through the use of a workout session, then that connection will persist while the device has its screen off.

|U03JWCQ8ZPY|:
Awesome! Thank you Elliot :slightly_smiling_face:

---
> ####  There would be great opportunities with being able to connect multiple users to the Apple TV for my use case. I will submit a Feedback outlining that as a suggestion, but what is the best current best alternative to DeviceDiscoveryUI for implementing something like a multi-person quiz where the main interface is on the Apple TV, and multiple people in the room are submitting their input on their own devices?


|U03J1T8T77A|:
Hey Duncan, we hear you loud and clear! Right now, DeviceDiscoveryUI supports a connection between a TV and a single device at a time. If the other devices are running iOS and iPadOS, it is possible to use a &lt;https://developer.apple.com/documentation/network/nwbrowser/descriptor/bonjour_type_domain
|Bonjour browse descriptor&gt; as shown in the iOS/iPadOS version of the &lt;https://developer.apple.com/documentation/network/building_a_custom_peer-to-peer_protocol
|TicTacToe sample app&gt;.  It'd be great if you could submit a Feedback for us so we can take this into consideration for future releases.

|U03JWCQ8ZPY|:
That would be amazing! To have collaborative  sessions between multiple devices with a single Apple TV, it would make the Apple TV a video game console (Make sure you add an amazing GPU in the next versions too :heart:)! And will make the Apple TV more competitive agains the most used ones like Roku and Chrome Cast and Amazon Fire.

---
> ####  I watched the "Create a great video playback experience" session and tried to implement the external metadata discussed there to show a video description. The chevron shows up, but when you tap the title the description doesn't show up. Will this be addressed in a future beta?


|U03HQNTQQFK|:
Hey Erick, This is a known issue in the iOS seed 1 builds

---
> ####  I'm not sure if this is intended or just a bug in the Developer iOS app, but I was using the Developer app on iOS 16 and there's no full screen button for the videos. Is the new AVPlayerViewController not have a full screen button?


|U03HQNTQK33|:
Hey Erick, this is a known issue in the iOS and macOS seed 1 builds

|U03JSS2QCHG|:
ok, good to know. Thanks.

|U03JSS2QCHG|:
I love the AVPlayerViewController changes BTW

|U03HQNTQK33|:
So glad to hear it! Yeh we think people are really going to love it. The new gestures are :fire:

---
> ####  (Re: previous question– my use case would be displaying a grid of /many/ videos at once on-screen on iPhone. I could whip up a prototype that displays a ton of AVPlayer visuals to see how it goes, but …was wondering if there's a more concrete answer here, rather than a "throw stuff at the wall &amp; see what sticks" approach :sweat_smile:)


|U03HQNTQK33|:
Hey Michael, we’d like to understand more about your use case. Would all of the videos need to play at once, or just one at a time or a collection of a few?

|U03JEEUJPMJ|:
:wave::skin-tone-3: Multiple playing at once. What I have in mind is a full-screen grid, 3-4 columns wide, with rows of squares of videos playing.

(Only those on-screen would need to be playing simultaneously; audio doesn’t matter here – but the idea would be to have it appear, when scrolling, as though all of the videos are all playing at the same time– as in, they begin playing when they come on-screen)

|U03JEEUJPMJ|:
(3 columns * roughly 7 rows =&gt; 21 videos playing simultaneously give-or-take / 4 columns * roughly 9 rows =&gt; 36)

|U03JEEUJPMJ|:
Wondering mainly about the feasibility; in terms of smooth playback &amp; not *eating* battery– as in, does this sound within the realm of the APIs + the hardware’s capability on iPhone, or would it likely involve falling back to software decoding [or just struggling] behind the scenes

[Oh, more context: I’m envisioning H.264/HEVC videos– whichever makes most sense performance-wise]

|U03JEEUJPMJ|:
If the answer to my question isn’t at all clear cut, and is more of a “as you increase the number of simultaneous playback instances, they’ll play smoothly …until they don’t”, then no worries

|U03HQNTMT6V|:
Playing multiple videos at once can be challenging, both from a user perspective and from a performance perspective.

Try to limit the number of videos so that your users don’t get overwhelmed.

To get the best performance, we recommend that you limit how many videos you load at a time. Let’s say you load 2-4 videos at once, only start loading the next one after a previous one has become readyToPlay (AVPlayerItem status property).
Also, try to re-use AVPlayers as much as possible. So instead of creating new players when a new video scrolls into view, re-use an old player of a video that has scrolled out of view (if possible). (edited)

|U03JEEUJPMJ|:
Okay, thanks.

(Re users + overwhelming: these videos would be short, simple, looping clips of people’s headshots– if you know of the Harry Potter franchise; imagine the newspapers in their universe, and how they have ‘moving photos’ on them :relaxed:)

---
> ####  Does/Can our app get notifications for Visual Intelligence events?


|U03HQNTQK33|:
Hey Jaime, what kinds of visual intelligence events would you be looking for? We’re curious to better understand your use case.

---
> ####  Maybe this is a bit out of the scope here, but do you have intentions of supporting video playback from mkv containers? Or have you some tips how to add custom support for such container formats efficiently and with as little work as possible?


|U03HQNTQK33|:
Hey Alexander, we do not support playing videos using the mkv container format. We are interested in understanding your use case though, could you give us some more details about it? For example, what platform would you like support for this on?

|U03HQNTQK33|:
We’d also recommend putting in a request for this in Feedback Assistant

|U03KC9BKC9E|:
my use case is similar, I use `AVPlayer` to load audio files, and my users have asked for `ogg` files support, which is not available out of the box (sorry for hijacking the thread)

|U03HQNTQK33|:
Hey <@U03KC9BKC9E>, thanks for the info. I would definitely file a request in Feedback Assistant requesting support for this. Sounds like a very useful feature!
