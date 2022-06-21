# app-clips-lounge QAs
### Lounge Contributors
#### [pol-piella](https://github.com/pol-piella)
#### [roblacl@github](https://github.com/roblack) / [roblacl@twitter](https://twitter.com/emin_ui)
#### [shirblc](https://github.com/shirblc)
#### [tikimcfee](https://github.com/tikimcfee)
---

--- 
> ####  Due to its size I believe an App Clip should have a limited/basic functionality. How many screens/use-cases/actions should an App Clip provide?


|U03HELJ7A5T|:
Generally App Clips should be focused towards a single purpose, but can have as many screens as needed to accomplish that purpose. An App Clip binary can also provide many App Clip experiences each focused on the specific task it was launched for.

--- 
> ####  Will a link in an IAB (In App Browser) open an App Clip?


|U03HKV56AMS|:
No, you’ll need to open the page in Safari to get the App Clip banner/card UI.

|U03HKV56AMS|:
If you’re using `SFSafariViewController` that will also work, but a custom in-app browser won’t be able to launch them.

|U03JUB3CN03|:
Apps such as Facebook don’t use SFSafariViewController — what is the recommended way for me to get a user to open my app if they are learning about my app from within FB?

|U03HKV56AMS|:
The user would need to first open the webpage in Safari via the app’s share menu or similar.

|U03HKV5GJLC|:
`SFSafariViewController` also shows the App Clip banner/card UI in an app.

|U03JUB3CN03|:
Not an App Clip question, but related to IAB =&gt; will opening a deep link open my app (if it is installed) if opened in an IAB?

|U03JUB3CN03|:
If so, then if my App Clip has been previously used on the user’s phone, will the deep link then open the App Clip in an IAB?

|U03JUB3CN03|:
<@U03HKV56AMS> or <@U03HKV5GJLC>

|U03HKV56AMS|:
When an app implements its own browser, they get to decide these behaviors. So it’s not possible to say for certain.

|U03HKV56AMS|:
It is possible for apps to try to open URLs first as a Universal Link (which would launch your full app, if installed), and only load the URL as web content if that fails, but it’s at their discretion whether to do so.

|U03HKV56AMS|:
There is no way for an app to invoke an app clip URL directly though. That can only be triggered by predefined user flows.

|U03JUB3CN03|:
So if my web page is loaded, then I should always ask the user to open the page in Safari if I only want them to interact with my app (App Clip or full app)

|U03HKV56AMS|:
These include: Safari and `SFSafariViewController` via the banner/inline app clip card, Messages via rich link previews, NFC/QR Code scanner, Maps, and Siri Suggestions Widget (for location based app clips).

|U03HKV56AMS|:
Yeah, unfortunately you’d need the user to load the webpage in Safari or `SFVC` to get the App Clip invocation UI.

|U03JUB3CN03|:
Is there a standard way to determine if my web page has been loaded in an IAB?

|U03HKV56AMS|:
I’m not actually sure. This might be a good question for WebKit engineer.

|U03JUB3CN03|:
Thanks James — one last clarifying question. If my app is installed, and I have the same deep link for the app as for the app clip, the app will be loaded without a user interaction? IE — I’m assuming they do not get prompted to open an App Clip if the app is installed.

|U03HELJ7A5T|:
Followed links will not prompt in many cases for installed apps, but there are some cases where iOS will still show the App Clip card, such as if your device is locked and you scan a physical code that has an App Clip experience.

--- 
> ####  Can an app have multiple App Clips? (max 15MB each)


|U03HELJ7A5T|:
No, but you can have multiple App Clip experiences in your single App Clip binary that corresponds to your app.

|U03H310CVQX|:
Each App Clip experience should be focused on a single user purpose, but the experiences in your App Clip don't need to overlap or all focus on the same purpose.

--- 
> ####  Is there a recommended way to create an App Clip that can request data from private/protected api (i.e. with an auth token) or should app clips only access public apis and display public information?


|U03HKV56AMS|:
This comes down to your use case. We recommend that App Clips not require a user to sign in or sign up because it gets in the way of providing a fast and possibly transient user experience. You can totally provide sign in as an option, but it’s better to offer as an optional feature.

|U03HKV56AMS|:
For example, if this was a shopping app clip, you should try to provide a “guest” checkout flow that doesn’t require the user to sign up first. But you can still offer a sign in option for the user if you also have a rewards program.

|U03HKV56AMS|:
You’ll also want to ensure that you’re using something like `ASWebAuthenticationSession` for any OAuth style sign in flows, because an app clip cannot register for URL schemes itself.

|U03JXD1AQRE|:
That makes sense, Thank you for your response.

--- 
> ####  Here is a different scenario.  Say I want an app clip that a user can only use once, once they've used it they can't use it again for 24 hours or so. Is it possible to get some kind of identifier from the user's device to check against inside of an App Clip?


|U03HKV56AMS|:
There isn’t a way to guarantee this in all cases. Because of our promise to users that app clips are ephemeral, they can’t leave lasting data on the device.

You could certainly have code in your app to save a “last used data” to a file/user defaults, and assuming the user does not go out of their way to delete the app clip from the device that data will stick around for at least 30 days. However, users could certainly game this by deleting and re-invoking the app clip.

|U03HKV56AMS|:
If you wanted to enforce this you’d need to require the user to sign in so that you could tie this timeout to an account and store it on a server instead. There’s no way to tie it to a device though.

|U03JXD1AQRE|:
I see.  So persisting it to defaults would work but isn't fool proof.

|U03HKV56AMS|:
Yeah. The crux of the issue is simply that when an app clip gets deleted we promise to erase all traces of it from the device. I doubt most people proactively delete them, but depending on your requirements it’s just not a guarantee.

--- 
> ####  Is the new size limit limited only to iOS 16 or also available for AppClips supporting older OS versions?


|U03HELJ7A5T|:
The new size limit is only available for devices running iOS 16 and later. For more details, we have a brief discussion about this in <https://developer.apple.com/videos/play/wwdc2022/10097/|our session>.

--- 
> ####  Do App Clips support URL invocations? For example, following a link in Safari or clicking a button on a website to bring up the App Clip card.


|U03HKV5GJLC|:
Clicking link or button on a website doesn’t directly bring up the the app clip card. When the new page loads after the link is clicked, the App Clip card will show up if the page has `apple-itunes-app` meta-tag configure.

|U03J1US1SR1|:
Thank you! Is this the correct page that describes this behavior? <https://developer.apple.com/documentation/app_clips/supporting_invocations_from_your_website_and_the_messages_app>

|U03HKV5GJLC|:
yes, that is the correct page!

|U03J1US1SR1|:
Thanks!

--- 
> ####  We want to showcase features in the App clip that are available after the subscription.  But these features are generated on our backend service, which is why we don't want to hardcode that access in the app to avoid reverse engineering of that capability.  Does Apple have experience of having App Clips, that contain content that is available only after subscription? And did you ever consider letting users activate a Free Trial right in the App Clip?


|U03HKV5GJLC|:
You can offer free content in your App Clip and use `SKOverlay` to offer users to get the full app for in-app purchase or subscription.

|U03HKV5GJLC|:
App Clips don’t support IAP or Free Trial period. User need to install the full app to use these features.

|U03JER2C7MX|:
<@U03HKV5GJLC> thanks for the response.

Has the App Clips team ever considered combining the Free Trial period in the App Clip? So like if there’s a 7-day trial period, users of the App Clip can get 1 day in the app without being charged and 6 days more if they download the full version of the app?

|U03HKV5GJLC|:
<@U03JER2C7MX>, please file a feedback. We would love to know the details of your use case.

--- 
> ####  Are App Clips supported when using the new "Unlisted App Distribution" method in App Sore Connect?


|U03HELJ7A5T|:
Yes!

|U03JEM7CE2D|:
That's great to hear. Now I just need my request approved :grin:

|U03K6K2J79P|:
Great question <@U03JEM7CE2D>! Love this answer <@U03HELJ7A5T>! :slightly_smiling_face:

--- 
> ####  What are your thoughts on using App Clips as a way to demo functionality for prospective users on the web? Is this a good use case for App Clips?  If so, has there been any thought re. supporting demos on the App Store via App Clips? (FB9875858)


|U03HELJ7A5T|:
App Clips are a great way to demo functionality for prospective users on the web! As for the demos on the App Store, thank you for your feedback report! We hear you, and I’m sorry we can’t comment further on future plans.

|U03J1UX2CQK|:
No worries — I wouldn't expect comments on future plans! Glad to hear that demos seem like a good use-case.

|U03J1UX2CQK|:
Thanks!

--- 
> ####  Not really a question, more a conclusion from yesterday's 1on1 lab I had. My App Clip opened with the wrong URL in messages.  E.g. <https://www.stock-analyzer.app/stock/?symbol=NET|https://www.stock-analyzer.app/stock/?symbol=NET> opened as  <https://www.stock-analyzer.app|https://www.stock-analyzer.app>  I just want to let you know that Messages opens the og:url from the domain which in my case was set to fixed: <https://www.stock-analyzer.app|https://www.stock-analyzer.app>  Removing the og:url solved the issue! :tada:


|U03HELJ7A5T|:
That’s great to hear! We saw that after your lab concluded but happy that you were able to fix it!

--- 
> ####  I’d love to hear about marketing strategies for using App Clips  - have any teams have success driving paid campaigns to app clips?  - any recommendations to best utilize App Clips in marketing?  - any concerns with tracking performance or A/B testing?


|U03HELJ7A5T|:
This topic may be best discussed with your WWDR representative.

|U03J4D45DEY|:
Would love any insights on this as well. App Clips fundamentally changes the customer journey path and is transformative to the various funnel conversions amidst it.

Would be great to have more resources in this overall regarding App Clips.

|U03HELJ7A5T|:
There are Developer analytics tools to understand how users interact with your App Clip. If you have a specific request where something is missing, a Feedback Report would be great!

|U03JER2C7MX|:
Hah, all right :smile:

Thanks anyway )

--- 
> ####  How do updates work for app clips specifically do all new versions immediately replace any cached versions?   Also what happens if we dropped iOS 14, would they receive an older version of the app clip or would it revert to web ?


|U03HKV5GJLC|:
If there is new version in App Store, next time when user invokes the App Clip from Code Scan, App Library, Maps, Spotlight, or Safari, it will replace the existing version.

|U03HKV5GJLC|:
If you drop iOS 14, it will not revert to an older version of the App Clip in iOS 14 devices.

--- 
> ####  Hi there, is there a JS SDK to trigger the App Clip launch card on the web programmatically?  This is crucial for supporting lead pages that educate people on a use case / service, and using a CTA button on the page to prompt the launch of the App Clip.  Otherwise the showing of an App Clip interstitial implicitly on page launch can feel like an ad interstitial that users immediately want to discard, rather than facilitating an action they explicitly want to perform.


|U03HELJ7A5T|:
There is no JS SDK today to trigger the App Clip card programmatically.

|U03H310CVQX|:
If you want to add some info before showing the app clip card, you can put the app clip card on a dedicated page just for that. Then have your main page link to that page with the app clip card after you show the explanation.

|U03J4D45DEY|:
Thank you <@U03H310CVQX>, this is the workaround we’ve been using so far, but it’s a definitely an unnecessary break in experience and an ‘extra step’ for no other reason outside of technical limitation.

It would be really useful to have this functionality to de-jar the user experience, perhaps something similar to the <https://developers.facebook.com/docs/messenger-platform/webview/extensions#started|Messenger Extensions SDK>, which after initializing on page load could have a single function to `launchAppClip(…)` into a particular App Clip experience supported by your App Clip binary, along with the various params/invocations that your App Clips support.

|U03HELJ7A5T|:
<@U03J4D45DEY> i think we understand your use case. it would be great to capture that in a FB if you haven’t already for us to consider

|U03J4D45DEY|:
Thanks <@U03HELJ7A5T>, I haven’t yet but will do so!

We love App Clips and want them to proliferate and become a natural part of web flows, akin to sharing a link via launching the system share sheet today.

|U03J4D45DEY|:
Where exactly do I submit the “FB” from? Is this within the Developer app, and is there a specific section to submit for App Clips?

|U03HELJ0CAH|:
There is a Feedback Assistant app where you can submit feedback to us with logs and specific details about your issue(s).

--- 
> ####  How can we launch App Clips from non-Safari browsers or from embedded browsers within other apps (ie: social media apps, messaging apps etc.)?  The industry best practice / status quo for viewing any web pages from an existing app (ie: social media apps) is to show an embedded browser, not switch apps into Safari


|U03H310CVQX|:
App Clips can open from within the <https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller|Safari View Controller>, which is what we recommend apps use for an in-app browser.

For example Twitter uses Safari View Controller and can show the App Clip card right from the app.

|U03HKV5GJLC|:
For this topic, please also check out our 2021 WWDC session <https://developer.apple.com/videos/play/wwdc2021/10012/|What’s new in App Clips>.

|U03J4D45DEY|:
OK thank you. That handles the second part of question, happy that that’s a supported scenarios.

What about for the first part, non-Safari web browsers? This could possibly be related to my other question about having a web SDK that can manually invoke the launch of an App Clip, akin to how the <https://developer.mozilla.org/en-US/docs/Web/API/Web_Share_API|Web Share API> launches the System Share sheet.

We want to have App Clips adopted everywhere users are browsing/reading the web – so these two aspects may go hand in hand together to proliferate the awareness and adoption of App Clips (which currently seems to be quite low – pretty none of the non-technical users I talk to has seen or knows what an App Clip is)

|U03HELJ7A5T|:
We’re thrilled and share your excitement for App Clips! This enhancement would be good to file as a FB as well <@U03J4D45DEY>!

--- 
> ####  Since App Clips can be installed by a URL and the clip receives the URL on launch, we're thinking about using them for sharing invite/referral codes between users. We're thinking the app clip would them show detail about the invite or referral and either a simplified sign up flow or a prompt to install the app. Would this be an acceptable use case for an App Clip? Or is there another way data could be passed through an app install?


|U03H310CVQX|:
Sharing a unique link can work great, but every App Clip needs to have a purpose in itself. An App Clip shouldn't just point to an app or be just for sign up.

Do you have an experience that you could put in the App Clip, so people can use the App Clip to try out some features and see if they _want_ to sign up? Trying out your app could be a great use for an App Clip.

|U03KH907MME|:
That’s something we’ll have to think about. We’ve got a financial services app that requires the user to sign up before they can do most things in the app, but we’re thinking about ways to a create a preview experience for an app clip.

|U03HELJ0CAH|:
I would recommend checking out this article about <https://developer.apple.com/documentation/app_clips/sharing_data_between_your_app_clip_and_your_full_app|sharing data between your app clip and app>. You could give them a rich experience that would transition into the full app.

--- 
> ####  Following up on my question about using App Clips for demos from earlier: is it possible to open App Clips directly from a link, or do we always need to link to a page that shows the interstitial? Use-case would  be a "click here to try out this cool content in our app" advertisement.


|U03HKV5GJLC|:
Yes, you will need to link to a page that shows the App Clips card. Here is the <https://developer.apple.com/documentation/app_clips/supporting_invocations_from_your_website_and_the_messages_app|documentation> showing how to enable that in your web page.

|U03J1UX2CQK|:
Thanks! I was kind of hoping I had missed an announcement. I can definitely make some sort of something with the app clip cards though, which I don't think I knew about when I filed my feedback about this (FB9875847).

--- 
> ####  We are a mobile ordering app that has support for both credit cards and Apple Pay, our payment provider recently increased their framework size which pushed us beyond the 10mb limit but provided a separate Apple Pay framework.  Would you suggest in this case to direct card users to our app or website ?   Is there any reasoning behind the 15mb limit not coming to iOS 14 and iOS 15? We still have a large portion of users on iOS 14 alone who haven't upgraded.


|U03HELJ7A5T|:
You could direct card users to your app or website, however this could be a non-ideal user experience.

We understand that some users have not upgraded, however there are changes in iOS 16 needed to support 15 MB App Clips.

--- 
> ####  Hello. Can App Clip connect bluetooth device such as POS printer?


|U03HKV5GJLC|:
App Clips can connect to bluetooth devices. However, they are not able to maintain connection to bluetooth devices when they are not running in foreground.

|U03HKV5GJLC|:
For App Clip capabilities, please refer to this <https://developer.apple.com/documentation/app_clips/choosing_the_right_functionality_for_your_app_clip|documentation>.

|U03HVCK66P8|:
Wow! Thanks :slightly_smiling_face:

--- 
> ####  To reduce file size is there any way within Xcode to see a compiled file size of other frameworks in the App Clip ?  The thinning report doesn’t directly break down what is taking up the size.  Is there anything else that could be done to reduce size for example: Does turning off bitcode help, do you need the app icon to be included or is it inferred from the parent app? We have no assets, purely using all SF Symbols outside of the App Icon.


|U03HKV5GJLC|:
Turning off bitcode will not affect the thinned size. The app icon is included in the size report. For techniques to reduce binary size, please check out WWDC 2021 session <https://developer.apple.com/videos/play/wwdc2021/10013/|Build Light and Fast App Clips>.
