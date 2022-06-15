# safari-lounge QAs
#### by [shirblc](https://github.com/shirblc)
---

> ####  Will the MediaRecorder API be promoted out of the Experimental features in Safari 16?


 We shipped MediaRecorder API in Safari 14.1, in March 2020. <https://caniuse.com/mediarecorder>

 yes, but it is still an experimental feature that has to be enabled?

 It is still listed in the Experimental Features menu, but it enabled by default

 So there is no need to enable it

 It will be removed from the menu at some point, but it is there still so it is possible to disable it for testing

 :pray:

---
> ####  A lot of folks are asking for more information about Web Push and how it will work in Safari.


 Web Push in Safari works... just like Web Push in any browser!

We've implemented all the cross-browser web standards needed to support Web Push. If your site already supports Web Push in other browsers and you don't exclude Safari through browser detection, Safari 16 on macOS Ventura will work with your site.

No Apple Developer Program membership is required. We use standard VAPID to manage push subscriptions.

In addition to excluding Safari through browser detection, some websites tightly manage push endpoint URLs server side. If you do that, allow all subdomains of <http://push.apple.com|push.apple.com>

You can learn more details:
• At the WebKit blog - <https://webkit.org/blog/12945/meet-web-push/>
• In the WWDC session video - <https://developer.apple.com/videos/play/wwdc2022/10098/>
• At <http://developer.apple.com|developer.apple.com> - <https://developer.apple.com/documentation/usernotifications/sending_web_push_notifications_in_safari_and_other_browsers>


---
> ####  Can you give some advice/talk about best practices on using WKWebView with SwiftUI, given that there is no native support for it and views have to be wrapped in UIViewRepresentable?


 UIViewRepresentable is the way to go; if you want ideas about how to integrate it smoothly, the WebKit open source project has a SwiftUI MiniBrowser test app you can look at here: <https://github.com/WebKit/WebKit/tree/main/Tools/MiniBrowserSwiftUI>

---
> ####  SSO Extensions are currently active in Private Browsing mode. Is that expected behavior or something that may be fixed in the future?


 Thanks for your question. This is something that would be great to have as a bug report that we can follow-up on. Can you file feedback with Feedback Assistant? <http://feedbackassistant.apple.com>

 Yes, I can file this.

---
> ####  Are RegExp look behind assertions coming soon? A WebKit issue has been open and assigned since 2017 (<https://bugs.webkit.org/show_bug.cgi?id=174931),|https://bugs.webkit.org/show_bug.cgi?id=174931),> but no update has been issued. This is implemented in all other browsers and is starting to cause some compatibility issues for us.


 RegExp lookbehind assertions is not supported. Thanks for letting us know this is important to you. Having a detailed use-case can help our team prioritize this work. You can add a comment to the existing bug report (<https://bugs.webkit.org/show_bug.cgi?id=174931>) to share your use-case, or if you prefer, you can file feedback with Feedback Assistant and share details on your use-case confidentially. (<http://feedbackassistant.apple.com>)

---
> ####  will web push work in WKWebview instances?


 On macOS Ventura, Web Push is only supported in Safari 16.

 what about iOS/iPadOS?

 What's the best way to ask for Web Push support in WKWebView? Feedback assistant? It would be great if it could at least work in app-bound domains.

 You can learn a bit more with our WebKit blog post - <https://webkit.org/blog/12945/meet-web-push/>
Which also links to the WWDC session! <https://developer.apple.com/videos/play/wwdc2022/10098/>

 Look for iOS/iPadOS support in 2023

 <@U03JMRY8ERZ> We'd love your uses cases wrapped up in a Feedback Assistant report!

 Can you clarify whether Web Push will work in an SFSafariViewController on macOS Ventura? Or does it _only_ work in Safari 16?

 Only in Safari 16 :+1:

 I'd also be curious to understand what the use case for web push would be in WKWebView or SFSafariViewController. If you use that you have an app that supports native push?

 My web app receives a lot of traffic from Facebook's in-app browser, which is a WKWebView. When users navigate to my site from a Facebook link, they won't be able to sign up for push notifications.

 For some sites, a very high percentage of their traffic comes from in-app browsers, some of which are WKWebViews, and some of which are SFSafariViewControllers. (I think it's fair to argue that Facebook ought to use SFSVC instead of WKWebView, but that's neither here nor there.) It especially seems like an oversight not to allow web push in an SFSafariViewController.

 Does Facebook have a native app on macOS with an in-app browser? I don't see one on the Mac App Store, but maybe they provide it as a direct download?

 Perhaps their iPad app runs on an Apple Silicon Mac? I might find time to look into that more later. :crossed_fingers:

---
> ####  Safari is the only modern browser to not support RegEx lookbehind (<https://caniuse.com/js-regexp-lookbehind)|https://caniuse.com/js-regexp-lookbehind)> which is a useful feature for matching strings based on the text behind it. Any plans to support it?


 Hi Ryan, thanks for your question and letting us know your interest in this feature. This was answered in a <https://wwdc22.slack.com/archives/C03GSL4EAMD/p1654620439615579|previous question>.

We’d also appreciate details about your specific use-case for this feature to help us prioritize this work. Can you add a comment to the <https://bugs.webkit.org/show_bug.cgi?id=174931|bug report> or share your use case with <https://feedbackassistant.apple.com|Feedback Assistant>?

---
> ####  Hey! Two questions about Web Push: is the `userVisibleOnly` flag supported, and is the API available in WebExtensions?


 The `userVisibleOnly` flag is in fact required; You are not allowed to subscribe for push if you set the flag to `false`

This is covered in the session here - <https://developer.apple.com/videos/play/wwdc2022/10098/>

On macOS Ventura, the API is only available to websites visited in a browser tab in Safari 16.
We'd love to read use cases for support in extensions - Please file a Feedback Assistant issue!

 Thanks! I'll definitely open a feedback but to share some more context in the meantime, we've been discussing this at the Web Extensions Community Group as an alternative to the (no longer reliable) WebSockets in MV3: <https://github.com/w3c/webextensions/issues/208>. Being able to set `userVisibleOnly` to `false` in extensions specifically would allow us to use it as a background notification mechanism and feels like less of a risk given that extensions are already running in the background.

 Apple makes a comment around around this in the "Meet Web Push" video available today, at 13:38.
&gt; You must promise that pushes will be user visible. Handling a push event is not an invitation for your JavaScript to get silent background run time. Doing so would violate both the user's trust, and the user's battery life.
&gt;
&gt; When handling a push a event, you are in fact required to post a notification to notification center. Other browsers all have counter measures against violating the promise to make notifications user visible, and so does Safari.
&gt;
&gt; In the beta build of macOS Ventura, after three push events where you fail to push a notification in a timely manner, your site's push subscription will be revoked. You will need to go through the permission workflow again.

 Thanks <@U03JMRY8ERZ>! That matches up with the other browsers, so no surprises there. If notifications do ever come to extensions, though, I'd still love to see a relaxing of this requirement. It feels like a slightly different threat model and one where background run time may be appropriate.

 (I know you're not from Apple, but just sharing what my response would be)

---
> ####  Safari 16 release notes mentions “Web Extensions API improvements”. Can we have more information on what those improvements are?


 “<https://developer.apple.com/videos/play/wwdc2022/10099/|What’s new in Safari Web Extensions>” goes into detail about the improvements to Web Extensions for Safari 16. Check it out on Wednesday and let us know if you have any questions?

 Sure. Thanks :blush:

 there's also "<https://developer.apple.com/videos/play/wwdc2022/10100/|Create Safari Web Inspector Extensions>" if you're focus is more about developer tooling :slightly_smiling_face:

---
> ####  Hello! My company website is already supported Notification on Chrome and other browsers. When I tested it on latest Safari 16, the subscribe button/alert did not pop-up. :thinking_face:


 Thanks for trying it out with your site! We need a little more info to better understand your question.
Do you mean your website didn't show the button to subscribe, like it does in other browsers?
Or do you mean that the button appears, but clicking it does nothing?

 Hi Brady,

 I cannot see this alert pop-up

 Is there any demo website I can test with this push API? Not sure why… I upgraded to the macOS 13.0, and all the web notifications that worked before disappeared too:smiling_face_with_tear:.

 Okay!

When we were developing the feature, many sites "just worked," but others unwittingly excluded Safari. There was a few common reasons for this.

One common one was a site not setting the `userVisibleOnly` flag in subscription requests, or setting it to false. WebKit requires pushes to be user visible, so that flag must be set to true.

If that were the case, you would see an error in Web Inspector. There's a few other less common errors that might show up in Web Inspector, so please check it out.

If nothing shows up there, it's also possible that even though your website's "subscribe" button shows up, it's not fully functional in Safari because some part of your stack is doing browser detection instead of feature detection.

Check to make sure your site to see if anything is doing a User Agent check or some other type of isSafari check, causing the button to not be fully functional.

 I'm sorry to hear that previously working Safari Push Notification subscriptions stopped working when you upgraded to Ventura. *Ugh*

As far as I know we haven't seen that happen. Could you file a feedback assistant on that, with a full sysdiagnose, etc?

 No problem. Let me pass your words to my team. Thank you, <@U03J8RWC3A5>

 You're very welcome!

---
> ####  I still get a lot of value out of <https://labs.jensimmons.com|https://labs.jensimmons.com> and am wondering if there is any plan to do something similar for Container Queries, Subgrid, etc. Are the WebKit Clothing Swap examples live anywhere or on GitHub? I appreciate the links to articles in Animation Improvements (<https://webkit.org/blog/12824/news-from-wwdc-webkit-features-in-safari-16-beta/#animation-improvements).|https://webkit.org/blog/12824/news-from-wwdc-webkit-features-in-safari-16-beta/#animation-improvements).>


 Oh, thank you. I always appreciate hearing from people who watch Layout Land! It was really fun making those videos.

The WebKit Clothing Swap examples are not live anywhere. Keep an eye on <http://webkit.org|webkit.org> for more info, demos, and help with Container Queries and Subgrid in the future. And follow me on twitter @jensimmons for info about upcoming conference presentations, videos and demos.

---
> ####  In which category should I file Safari issues that apply to all platforms? When filing a Feedback Assistant report, it asks, "Where would you like to start your feedback?" It gives ten options: tvOS, macOS, HomePod, watchOS, AirPods Beta Firmware, iOS &amp; iPadOS, Web Services &amp; SDKs, Enterprise &amp; Education, MFi Technologies, and Developer Tools." I'd expect to file the issue on "Safari," which is a multi-platform app, and not on any one platform.


 I can see this is non-obvious. Go ahead and pick any platform with Safari where you tested the issue, and specifically mention in your feedback that it applies to the other Safari platforms as well.

In the meantime, we'll ping the folks in charge of Feedback Assistant to see what we can do to make this better in the future.

 Thanks!

---
> ####  Are the new Safari Extensions for Dev Tools exclusive to the Mac? Can they work when inspecting a WebView on iOS from the Mac?  Is there a way to enable the user's Safari extensions with SafariViewController within apps?


 Yes, Safari Web Inspector extensions are only supported when inspecting within Safari on macOS.  No, they will not work when inspecting web content on iOS.

For more info about Safari Web Inspector extensions, definitely check out <https://developer.apple.com/videos/play/wwdc2022/10100/|"Create Safari Web Inspector Extensions"> :slightly_smiling_face:

 Thank you! That makes sense.

---
> ####  With Safari 16 bring extension syncing across platforms, does that mean Mac is getting iOS's per website permissions too?


 Safari Web Extensions on macOS have the same per website permission model as Safari Web Extensions on iOS. In Safari 16, extension state syncing will be supported for Safari Web Extensions and Content Blockers. However, syncing of extension website permissions isn’t available in Safari 16. For more information, check out “<https://developer.apple.com/videos/play/wwdc2022/10099/|What’s new in Safari Web Extensions>” on Wednesday.

---
> ####  Any specific best practices or resources for using CSS animations or APIs like requestAnimationFrame() on ProMotion displays, or best to just trust WebKit to render those and not think about framerate?


 You should prefer CSS animations wherever you can, especially for things like transforms and opacity; if you need to implement animations yourself, using requestAnimationFrame and letting WebKit deal with the frame rate is the way to go.

 You might also be interested in <https://github.com/WebKit/explainers/tree/main/animation-frame-rate|WebKit's proposal> to support custom animations at variable frame rates, but currently it's just that: a proposal, not an actual plan, and requires standardization work.

 I sure am! Will take a look, thanks Tim (Apple)!

---
> ####  Hello! I hope my question is not off topic. I'm used to use Google Analytics to monitor visits and click rates on a website of mine, I'm not an Analytics expert, I'm just an app developer, I have no AD campaigns, I just want to see how many people visit my site daily and how many of the visitors click to download my app, I don't care about any of their personal data. Of course now Safari blocks it and I wanted to know if there's any privacy savvy equivalent you could recommend to me to use instead of it. Thank you!


 Hi Cristina, Safari doesn’t block Google Analytics. There is a helpful blog post “<https://www.simoahava.com/analytics/no-safari-does-not-block-google-analytics/|No - Safari 14 Does Not Block Google Analytics>” that discusses how Intelligent Tracking Prevention works to prevent cross-site tracking without blocking Google Analytics.

 That said, I'm in love with <http://usefathom.com|u><http://usefathom.com|sefathom.com>! I do have a referral code if you want it but just use them.

---
> ####  Can the Safari Web Extension open the web "Options" page on iOS (just like on the Mac)? Because else it is inconsistent with the other platform.


 You can open an extension’s options page from the Settings app on iOS. From Settings, choose Safari &gt; Extensions &gt; Your Extension, and tap `Extension Settings`

---
> ####  I frequently get a bug in the Inspector modifying especially deep CSS. Each keystroke will weirdly become a new property, or sometimes changes completely fall out of sync from the browser. Is this a known bug, and anything I can do to help y’all diagnose it?


 Thanks for letting us know. A video and/or the steps you take to experience this issue would be very helpful! This is something that would be great to have as a bug report that we can follow-up on. Can you file feedback with Feedback Assistant? <http://feedbackassistant.apple.com>

---
> ####  Can a user logged in on safari be automatically login on the app?


 We encourage developers to allow users to keep their state separate between Safari and in apps, but if really necessary then `ASWebAuthenticationSession` is the best answer.

---
> ####  Question about the availability on the API `WKPreferences.isSiteSpecificQuirksModeEnabled`.  This API was added last year and was labeled as available on iOS 15.0. However, in practice, we found it wasn't actually present until 15.4. Now in the iOS 16 SDK, it's labeled as available on iOS 16! What's going on, and can you please fix it?  FB10109075


 Thank you for reporting this! The API availability on `WKPreferences.isSiteSpecificQuirksModeEnabled` is indeed mislabeled — we will be tracking a fix for this in <https://bugs.webkit.org/show_bug.cgi?id=241482>.

 Hi Wenson!  Thanks, I was not expecting to see a PR so fast.
While I’m here, any tips on getting our site out of the quirks mode list? We got added a couple years ago, it’s been causing a lot of trouble, and we believe we’ve mitigated the need for it by now.  Somebody pinged our Apple dev evangelist about it a while back, but nothing’s happened.  Should I just become a contributor on <http://webkit.org|webkit.org> and submit a patch?

 (Unfortunately I don’t have a FB or WebKit bug ID for that. I can certainly file one though.)

 That’s a good question! It looks like <http://figma.com|figma.com> was added to the quirks list to opt into “dispatch simulated mouse events” behaviors — I’ll see if I can figure out which bug that was intended to fix (if I recall correctly, that change was made during the push for desktop-class browsing on iPad)

 Oh! I see, it’s related to <https://bugs.webkit.org/show_bug.cgi?id=196830> …perhaps we can follow up in that bug?

 Right, it was around that time. In the meantime the site has adopted newer web pointer event APIs, so we shouldn’t need the simulated mouse events anymore.  (In fact they cause a lot of problems that are difficult to work around.)

 Works for me, thanks for the attention!

 That’s great to hear! Yes, in that case, it sounds like we can probably remove figma from the quirks list, then — *especially* if the quirked behavior is causing other issues, as well.
For what it’s worth, it’s also possible (as third party developers) to disable quirks in WebKit using Web Inspector, and test behaviors on websites without quirks. Let’s definitely follow up in the Bugzilla bug!

---
> ####  I would like to contribute as a community member, by writing content about WebKit.  For example, by writing tutorials on how to use the Web Inspector or improving the website.  Is this possible? What's the best place to start?


 There are already a number of fantastic pages documenting many aspects of Web Inspector at &lt;<https://webkit.org/web-inspector/>&gt;, but we're always looking for feedback and suggestions, so in those cases we'd love it if you'd file <https://feedbackassistant.apple.com|Feedback Assistant> bugs with details about what you'd change.  You're also welcome to &lt;https://webkit.org/getting-started/#staying-in-touch
|join the WebKit slack&gt; (and/or mailing lists) to chat with us if you'd prefer something a bit more conversational. :slightly_smiling_face:

---
> ####  As I've been migrating my WebView based Mac HTML editor to WKWebView, I've come across indications in the WebKit source base that a mechanism for "injected bundles" in the WebProcess exist. Is this something that any 3rd party can possibly take advantage of, or is it limited to internal Apple WebKit clients?


 Injected bundles are private WebKit API and we are in the process of deprecating them; if there is anything you can't achieve with API in the application process (or via script -- either in the page or invoked from the app via `evaluateJavaScript` or `callAsyncJavaScript` APIs), please file feedback with information about your use cases.

 Thank you!

---
> ####  Hi, Are we expected to actively migrate existing APNs safari web push users to the standard?   If so, in that migration scenario, are users required to perform a user gesture and accept notifications again, or can we detect that on page load (using something like `Notification.permission === granted` after feature detection) and silently move them from APNs to the w3c push?


 Safari Push notifications will continue to work in Safari on macOS Ventura and beyond. We'll announce ahead of time if that changes.

 Thanks!

---
> ####  Hey, love the new "Share Across Devices" feature for syncing extensions! :blue_heart: Does this setting also work for content blocker extensions or only web extensions?


 This will work for Web Extensions and Content Blockers. Check out <https://developer.apple.com/documentation/safariservices/safari_web_extensions/syncing_safari_web_extensions_across_devices_and_platforms?language=objc|our documentation> for more details.

---
> ####  Hi Safari Team. A little question. Why outline+border-radius are not working as expected on Safari? I tried Chrome which works fine.  For example: I wanna make a rounded avatar. Chrome shows me a circle but Safari show me a square.  Any idea?


 We are aware of this limitation and are tracking this in the WebKit bug tracker as <https://bugs.webkit.org/show_bug.cgi?id=20807>; you can follow along there. We do support hugging outlines for `outline: auto`, but that results in also getting a focus ring, which might be undesirable.

---
> ####  Hi. How does Safari extension sync work if I have separately paid extensions in the iOS and Mac App Store? Also, does it work with Safari app extensions?


 Safari Extension sync works for Web Extensions and Content Blockers, not Safari App Extensions. If you have separately paid extensions for iOS and Mac, you can link them together as documented on <http://developer.apple.com|developer.apple.com> and in this year’s “<https://developer.apple.com/videos/play/wwdc2022/10099|What's new in Safari Web Extensions>” talk.

 Thanks. What will be seen here if they haven't paid?

 The download button will become a buy button letting the user purchase the app directly from there.

 Cool, thanks!

---
> ####  Hello, will Safari eventually support chrome_settings_overrides (<https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/chrome_settings_overrides)|https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/chrome_settings_overrides)> like Chrome, Edge and Firefox? Thanks!


 Safari does not currently support that manifest option. Please file feedback using <https://feedbackassistant.apple.com/|Feedback Assistant> and let us know which keys in particular you are interested in!

---
> ####  Will there be a fix to Safari's "this webpage is using significant memory" notification?


 That notification means the webpage *is* using significant memory, and we have an interest in notifying users that is the case.

If you have found a scenario where Safari claims a page is using significant memory but the page isn't, we'd love a Feedback Assistant report filed with details.

---
> ####  Do you have plans to add support for scroll anchoring and `overflow-anchor` anytime in the near future? It would be a huge help in implementing infinite scroll in Safari and `WKWebView`s. <https://bugs.webkit.org/show_bug.cgi?id=171099|https://bugs.webkit.org/show_bug.cgi?id=171099>


 We are aware of and understand the desire for scroll anchoring; one helpful thing you can do is file feedback requesting it, with your usecases, in order to help with prioritization.

---
> ####  Will Apple bring the ability to have Safari extension icons in the Safari toolbar no matter what they do? My extension doesn’t request any permissions and it’s frustrating for users having to tap the ‘Aa’ button on iOS and iPadOS and then tap my extension in the menu. It would be so much nicer to have it in the toolbar all the time. :)


 Safari does not currently support dedicated toolbar icons on iOS or iPadOS. Please file feedback using <https://feedbackassistant.apple.com/|Feedback Assistant> and let us know what you are looking for and your use cases.

---
> ####  Our app relies on NSURLProtocol to proxy our app's webview's traffic, since our use case requires traffic in the web view to come from a specific IP address.  There was talk in 2020 of no app updates being accepted if the app uses UIWebView.  Will we be able to continue to use UIWebView to do this in iOS 16? If not, does WKWebView have anything that will allow us to proxy traffic to a proxy server? Thank you!


 No new applications will be accepted that allow UIWebView, but existing UIWebView apps can continue to receive updates for now.

That policy might change at anytime - see <https://developer.apple.com/news/?id=edwud51q>

There is currently no way to proxy http(s) traffic in WKWebViews

 Thanks for the update! I really hope that app updates with apps using UIWebView can continue to happen until WKWebView can proxy data :slightly_smiling_face:

 Let me ask this followup: Since you have a *rather unique* requirement of web content requiring the request to come from only 1 specific IP address... Is this web content entirely under your control?
If so, could you change it to use a custom URL scheme?

---
> ####  Will you be posting demos or example code for working with Apple Pay Order Tracking on the Web? The docs don't seem to be fully realized yet.


 There's a brief code snippet for providing order details with Apple Pay on the web in &lt;<https://developer.apple.com/videos/play/wwdc2022/10041/>&gt; (specifically at 20:12), but generally speaking the same rules/guidelines that Wallet/PassKit has for this feature also apply to the web.

We are also currently working on additional documentation and demos for this feature.

---
> ####  Will Safari have a complete implementation of ECMAScript2018? For example: regex lookbehind assertions? <https://bugs.webkit.org/show_bug.cgi?id=174931|https://bugs.webkit.org/show_bug.cgi?id=174931>


 Thanks for your question and letting us know this is important to you. If you can provide details about how you plan to use this feature it can help our team prioritize this work. There is an existing <https://bugs.webkit.org/show_bug.cgi?id=174931|bug report> where you can share your use-case, or if you prefer, you can file feedback with <http://feedbackassistant.apple.com|Feedback Assistant> and share details on your use-case confidentially.

 Maybe it's the rapid iteration of ECMAScript that's making it seem like it's lagging but back in July of 2016 it was announced that <https://webkit.org/blog/6756/es6-feature-complete/|Webkit was ES6 feature complete> only a year after it was ratified and then a year later in 2017 <https://webkit.org/blog/7536/jsc-loves-es6/|JSC :two_hearts: ES6> showed great gains in optimization. But in all the years since there hasn't been a "Feature Complete" post... so just wondering what is Webkit's commitment to trying to maintain some parity with current ECMASCript specs?

---
> ####  Is there a way to save and reload WKBackForwardList into a WkWebView? We are building a browser and we need a way to keep the back and forward history across sessions of the app. Should we bypass WKBackForwardList and create our own solution?


 That is what WKWebView.interactionState is for

 Here is a link to the documentation for <https://developer.apple.com/documentation/webkit/wkwebview/3752236-interactionstate|WKWebView.interactionState>.

 thanks, but just to be sure, as this property stores an Any, how can I interact with it, save it to disk / reload it?

 The API is intended to be used as described in “Restoring Your App’s State” (<https://developer.apple.com/documentation/uikit/uiscenedelegate/restoring_your_app_s_state>) and related docs, and not serialized / deserialized directly by the client.

Though you can also retrieve the property from one WKWebView, and set on another WKWebView to restore state.

---
> ####  We have deployed a Progressive Webapp with .net and have some problems with it. HTML select/input is not showing in Webapp on iOS 15 and later, if app from safari is put on home screen. There are also some questions in the forum about that: <https://developer.apple.com/forums/thread/705685|https://developer.apple.com/forums/thread/705685> - this is my own question <https://developer.apple.com/forums/thread/689901|https://developer.apple.com/forums/thread/689901> <https://developer.apple.com/forums/thread/699055|https://developer.apple.com/forums/thread/699055> And i also submitted it in the feedback assistant: FB10022937


 We are aware of this issue and are tracking this in the WebKit bug tracker as <https://bugs.webkit.org/show_bug.cgi?id=238318>, you can follow along there.

---
> ####  Will WKWebViews support pass keys automatically? Will they ever support filling in passwords automatically using your Keychain (ie passwords saved from Safari)?


 Passkeys will work in WKWebViews in apps with the `com.apple.developer.web-browser` entitlement, but not in the current developer seed

 Thanks! What about on macOS? (that entitlement seems to be iOS/iPadOS only)
And is there / will there be a way to autofill passwords from your Keychain?

 The Passkey folks say that autofill from keychain should work (in an app with the entitlement).

As for macOS, there is currently not a way to make them work in WKWebView.

 is there a way to ask for the com.apple.developer.web-browser entitlement for a mac application?

 That entitlement is currently for iOS and iPadOS apps only.

 ok thanks!

---
> ####  We believe there's an issue with recent versions of Safari where Safari will not obey a 'Set-Cookie' directive if it's issued as part of a '401 Unauthorized' response from the server. (This runs counter to  RFC6265 which states that user agents *MUST* process Set-Cookie headers in 400-level responses.)  The problem for us is that this breaks our Single Sign-On with our identity provider. For basic web browsing we just tell our users to use "any browser other than Safari", but the problem is unavoidable when it comes to authentication requests from Microsoft Office 365, which uses an embedded instance of Safari. So our Mac users lose out on the smooth sign-in experience that our Windows users enjoy.  We've had an Enterprise AppleCare case open for a year for this, but it has gotten no traction.  I would love any advice or information I could add to our ticket that might help get it closer to resolution. In particular, would this fall under Safari, or WebKit, or maybe even somewhere else in macOS? Thanks so much!


 Cookies are handled by `CFNetwork.framework`, so the issue exists at a different layer.

In addition to the Enterprise AppleCare case, it would be useful for software engineering to have a Feedback Assistant report open for the same issue, which includes the Enterprise AppleCare case ID, and (if possible) detailed steps to reproduce, or (even better) a stand-alone test case.  Please include an explanation of why this is needed (as you noted above) in the bug report.

You can create a Feedback ID now, then add details later if they aren’t handy to copy/paste at this time.  Post the Feedback ID here if possible.  If you don’t get the Feedback ID posted here in time, ask AppleCare to pass it along to CFNetwork.

 Potentially related: Microsoft SSO requires 3P cookies which Safari blocks. There is a proposed FedCM standard for a browser API to address federation when 3P cookies are deprecated by all browsers.

 Thanks, I’m working on the feedback now. The IdP is F5 BIG-IP. They document the problem in their knowledge base here:
<https://support.f5.com/csp/article/K34550543|Mac and iOS users fail to connect to APM with Safari, Windows users are successful>

 Ok, I’ve created feedback `FB10142576`. Thanks so much for your help!

 Thanks!  I’ll get the radar created for that over to the CFNetwork team now.

 Don’t worry if the Feedback ID comes back in duped status—that just means the CFNetwork team found another radar tracking the issue.

When talking to Enterprise AppleCare, you can reference the FB ID and ask them to follow up on that (as well) by following the duplicate to the original radar.

---
> ####  Is there an extra step needed to get WKDownloads to work out of the box? The downloads seem to not have the right permissions, preventing downloaded apps from opening. <https://bugs.webkit.org/show_bug.cgi?id=234249|https://bugs.webkit.org/show_bug.cgi?id=234249>


 It looks like you're right, there is something wrong with WKDownloads and gatekeeper.  Thanks for reporting the bug!

 Thanks for looking into it!

---
> ####  Does ASWebAuthenticationSession support Passkeys?


 Yes, it does.

---
> ####  We recently implemented Smart App Banner and had issues with the banner appearing consistently for all users. Do you have any tips for troubleshooting why the banner does not appear?


 There are a number of possible reasons for the Smart App Banner not appearing; I don't know if any of these apply to you, but it's worth checking:

1. If the user ever pressed the (X) on the banner for your app, Safari won't show it again.
2. If the user is in private browsing, Safari won't show the banner.
3. If the &lt;meta&gt; tag with the Smart App info is inserted programmatically, Safari won't show the banner.


 If you have a specific site where you're having trouble, and can reproduce it (even only sometimes), and it's not any of the cases above, I would definitely recommend filing feedback with the URL.

 If you did press (X) is there a way to reset that? I read somewhere the device would need reset to factory settings to get it to work again.

 For #3, our web team built the site in React. Can you clarify what you mean by programmatically?

 (I'm checking on your first follow-up, but in the meantime:) Is the &lt;meta&gt; tag that contains the `apple-itunes-app` information inserted after the page is loaded, with JavaScript? Or is it in the main resource as served by the server? I'm not sure of the _precise_ timing requirements, but that's definitely something to look into, if it is inserted after the fact.

 As for your first question, it sounds like Clear Website Data (in Safari preferences) should reset the banner

 Thank you! I will check with our web team, that might be the cause.

---
> ####  Not sure whether this is considered off-topic here, but can you detail on which platforms the JavaScriptCore framework uses JIT compilation and on which it is interpretation-only?


 WKWebView, ASWebAuthenticationSession, and SFSafariViewController all JIT.
WebView and UIWebView do not.

Using the JavaScriptCore API directly on iOS, iPadOS, and tvOS does not JIT.
Using the JavaScriptCore API directly on macOS *might* JIT

 Thanks, appreciate your response

 Very interesting! Can you elaborate on the cases where it *might* *not* JIT on macOS?

 I cannot, for two reasons:
1 - The reasons are an ever moving target, with no guarantee one way or another
2 - I am not the domain expert here and don't want to give you any incorrect information :slightly_smiling_face:

 More follow up from domain experts: The JavaScriptCore API on macOS uses the JIT, unless your app is compiled for the hardened runtime - <https://developer.apple.com/documentation/security/hardened_runtime>

 great, thanks!

---
> ####  Has there been any change to the policy that requires a Mac app to be distributed via the App Store in order to provide a Safari Web Extension? Are there any plans to support Safari Web Extensions for Developer ID/Hardened Runtime apps?


 Safari still requires apps with Safari Web Extensions to be distributed through the App Store. Please file feedback using <https://feedbackassistant.apple.com/|Feedback Assistant> and tell us about your use case.

 Thanks. It feels a little weird to file a Feedbacjk about "wanting to ship features to customers outside of the app store" but that is the use case :wink:

---
> ####  Is there a way to give a WKWebView a reference to another WKWebView's Window object? Similar to how if a web view opens another, then its Window object is available in the child through `window.opener`. Would be great for complex interactions between two pages!


 The JavaScript window.opener relationship has semantics specific to tying a popup window to the window that opened it.

It is a web technology concept.

WKWebViews are an app developer technology. The concerns are not the same.

To better understand the question, can you tell me more about the complex interactions you think this would enable?

 Let's say I have two WKWebViews with two different pages loaded in the same domain. Page A has a script loaded with access to a myriad of API functions. Page B does not. I'd like (in Javascript) to be able to access Page A's window object (and hence the API functions available in `window.api`) in Page B.

The way this is possible at the moment is if Page A calls `window.open` to create Page B, and then Page B can access the API through `window.opener.api`.

I was asking about the WKWebView level to see if I could "inject" the references at that point!

Hope that's clear!

 I see. So you want to explicitly and manually *create* an opener-like relationship in native code, for hosted JavaScript to take advantage of.

I can see why that sounds appealing, but unfortunately it runs counter to the direction the web security model and web browser engines are headed.

E.g. there's a concerted effort by engine authors and also standards bodies to further limit what can be done with the window.opener relationship, and to make sure that whatever remains can be implemented with process isolation.

 Now, the good news is that WKWebView *does* provide the tools you need to have JavaScript in one window object in one WKWebView talk to JavaScript in another window object in another WKWebView.

But your application process has to be a mediator through native code.

A combination of WKScriptMessageHandlers and/or WKUserScripts along with [WKWebView callAsyncJavaScript:] will let you set up a messaging path between two different WKWebViews.

 The messaging will necessarily be asynchronous - no synchronous property access/function calls/etc.

 Depending on the nature of the web content (e.g. whether you control it, or whether you trust it) you can also isolate your application's javascript from the web content via javascript worlds.

 If you would like to pursue this further, <https://developer.apple.com/videos/play/wwdc2020/10188/> would be a great place to start.

 Thanks for the info and the resource. Have got UserScripts and ScriptMessageHandlers working, but was really looking for a synchronous solution! (especially to iterate through the API object)

 The answer to "Can I do this complicated thing between WKWebViews synchronously?" will always be no. :+1:

---
> ####  Hey there! :wave:  Any plans to officially support picture-in-picture interactions in WKWebView? What about Apple Pay?


 Both the &lt;https://developer.apple.com/documentation/apple_pay_on_the_web/apple_pay_js_api
|Apple Pay JS&gt; and &lt;https://www.w3.org/TR/payment-request/
|W3C Payment Request&gt; APIs are supported in `WKWebView`.

In prior releases, it was the case that the &lt;https://developer.apple.com/videos/play/wwdc2019/518/
|Apple Pay could not be used at the same time as JavaScript injection&gt; (specifically at 9:34), but this restriction has been removed in iOS 16 and macOS 13.

 Can you expand on your Picture-in-Picture question, what are you hoping to do?

 *Apple Pay*
Hmm I might be doing something wrong here, but couldn't get Apple Pay to work in WKWebView on macOS 11/12, even with zero JS injections. Great to read that the JS injections requirement has now been lifted on macOS 13! I use this link for testing: <https://applepaydemo.apple.com/|https://applepaydemo.apple.com/>

*Picture-in-Picture*
Would just love to be able to start Picture in Picture mode when watching a video in WKWebView. This link is a good test case: <https://googlechrome.github.io/samples/picture-in-picture/|https://googlechrome.github.io/samples/picture-in-picture/>

 *Extra information on Picture in Picture*

When I enable it at the moment via `preferences._allowsPictureInPictureMediaPlayback = true`, although it works when running the app through Xcode, it fails when reopening the same app outside of Xcode (maybe something to do with having a debugger attached? but not sure why that would/could matter)

 Are there any errors or anything like that in Web Inspector when you try to use Apple Pay?

 <@U03HFKHPLUX> - yes, there is an error. I can check (don’t remember the exact error) but it had something to do with the app being sandboxed

 The default value for `_allowsPictureInPictureMediaPlayback` is true in WKWebView, so you should not need to change it

 And the leading underscore lets you know it is a private preference, which you shouldn't use if only because it could be removed or changed in the future without warning

 <@U03HFKHPLUX>
`session.onCancel` is the error.

I followed the code in the WebKit codebase to deduce it might be related to sandboxing

 <@U03HFKHPLUX> this is the error within WebKit (found by adding logs to my local copy and running the app with that build): `Error Domain=PKPassKitErrorDomain Code=4 "(null)"`

 Hmmm very odd.  Can you please file a bug via <https://feedbackassistant.apple.com|Feedback Assistant> including steps to reproduce and system diagnostics?

 <@U03HW6FMWHH> the value seems to be false by default on macOS, from what I can tell.
I was testing the private preference while looking for an official solution to see if it worked at all!  

 Just to double check, is your device able to use Apple Pay?  If so, are you able to make purchases on other websites (i.e. have you added a credit/debit card to Wallet and configured all the other relevant info)?

 Will do <@U03HFKHPLUX> - thank you for looking into this!

 Yes you are correct, it is `false` by default on macOS

 <@U03HFKHPLUX> - yes, Apple Pay works fine on Safari. Console logs also show the device is authorised for Apple Pay.
`Startup check: device is capable of making payments with Apple` `Pay`

 Ah ok then yes please file a bug and we'll take a look at it :slightly_smiling_face:

 On it <@U03HFKHPLUX>!

 <@U03HW6FMWHH> any recommendations on what to do for Picture-in-Picture / will it be supported in the future?

 <@U03JTMFH4J2> please file an issue

 Will do :+1: Thanks for looking into this <@U03HW6FMWHH> :relaxed:

---
> ####  Apologies for this question without too much research ahead of time, but while I've got your ears: can the `drop` event handler in a WKWebView page convey, for example, information about a dropped image file to the host app, and can the host app inherit implied sandbox entitlement to read from the URL? Likewise for file promises (e.g. from the screenshot proxy on macOS). I haven't dug into this yet but basically I wonder what I'm up against migrating from `WebView` based in-process drag/copy/paste handling. Any tips or warnings about what I can or can't do? I imagine in the worst case scenario I can pipe the bytes of the dragged file over to the host app.


 While the `drop` JavaScript event handler in the page doesn’t have direct access to the dropped file URLs, it is possible to intercept the drop by subclassing `WKWebView` and overriding `-performDragOperation:`. You can then inspect the given `id &lt;NSDraggingInfo&gt;`‘s pasteboard, which should contain the file paths.
Ultimately, the web process’ capability to read dropped files comes from a sandbox extension from the host app, so the host app already has access to these dropped files.

Alternately, if changing native code is not a viable option, consuming the data in the webpage and propagating it to the host app is also possible — you can listen for the drop event, inspect the event’s `DataTransfer` for files via `DataTransfer.files`, and finally use `postMessage` to send the dropped data over to your app.
