# localization-and-internationalization-lounge QAs
#### by [FeeTiki](https://twitter.com/FeeTiki)
---

--- 
> ####  Sometimes there is a difference in font size(width/height) between LTR and RTL , how can we make this better?

There are a couple of things you could be seeing and I’d like to understand which it might be.

The System Font for some languages like Arabic (which is RTL) uses a *taller line height* than other languages, which you will notice if you’re using Text Styles and have multiline labels or even in the default cell heights in Table Views. In fact, we recommend using Text Styles to ensure that you do get this language-specific tailoring.

Different System Fonts also may have *different relative font weights and sizing* and it’s possible that what you’re seeing is as a result of that. 
Do either of these sound like what you may be observing? 
yep, the first one. 
In that case, this is correct and expected behaviour, because different languages require different line heights to ensure that text doesn’t overlap across lines and has room to breathe.

Are you encountering any problems with this? 
Sometimes when let's say my use case when u have a cell with both English and Hebrew together, it looks abit weird, thought mby equaling their actual height of one of them is the best practice but i'm not sure. 
a 10.0 font size in some Hebrew font can be smaller than a 10,0 font size of SF English f.e 
That’s true. For example, if we compare “Welcome” and “ברוכים“, Hebrew will not be as tall as the capital letters in English and the Hebrew letters are slightly taller than the small letters in English. This is something that varies by script and we cannot expect that the heights will be equal.

Generally speaking, the way the System Fonts on iOS, macOS, etc. are designed, if you are using a Text Style, you should get a reasonable size for the text across various scripts. 
Thank you! 
To be clear, Hebrew does _not_ use a different line height compared to English. It does, however, use a different UI font, which is why you're seeing this difference, as it is difficult to perfectly match up metrics between two independent fonts. 

--- 
> ####  Our app includes multiple tutorials. Each tutorial is in its own directory with tutorial data, images and Localizable.strings files for localized text for just this tutorial. This makes it easy for us to add new localized tutorials without having to modify the app's main Localizable.strings file.  Is there a way to include these Localizable.strings files for the many tutorials in the output when we use Export for Localization in Xcode?  Or are we going about this wrong?

Hi! Can you elaborate a little on how you are setting up these files in your projects? 
For example, are they part of a target, or do you save them as a pre-created bundle? 
They are currently in reference folders in Xcode. 
In the main project and target.  
Our recommendation would be to convert these to bona fide bundle targets in your project. That would allow them to be properly extracted automatically. 
As long as the localizable assets are part of a “Copy Resources” phase in your target, they should be extracted when doing Product &gt; Export for Localization. 
As <@U03HW7PE3SM> mentioned, you can have a “Bundle” target for each of your tutorials and then include the localizable resources in each bundle. Then you can include these bundles in your main application target. 
I'm not familiar with the process of creating bundle targets. But we have over 1000 tutorials and that may be a lot of overhead.  
The root Tutorials reference folder is included in the Copy Bundle Resources build phase. But I don't see the Localized.strings files, which are in sub folders, in the results from Export for Localization.   
Yeah, unfortunately Xcode does not look through folder references for strings files — they are meant to add a folder to your product as-is, without any postprocessing. 
As <@U03HWDD6RED> mentioned, Xcode does not export the “blue” folder references. One thing you might be able to try is moving all of your tutorials into a Swift package. Xcode 14 adds support for exporting Swift packages for localization and Swift packages are represented by a folder on-disk. 
Any other suggestions for organizing tutorial or lesson files to be localized? We would like to use Xcode's great localization tools as much as possible.  
<@U03HJA9JVGA>’s suggestion will let you do just that, for when you can adopt Xcode 14, and is probably your best bet going forward. 
You can include the “Tutorials” Swift package inside of your app’s Xcode project and then when you export for localization—it should include all of the localizable assets and strings in the .xcloc 
Ok. Thanks! 
Give it a try and if you run into issues, please feel free to file a report with Feedback Assistant! 

--- 
> ####  Hi all! When editing an .xloc file in XCode, I'm missing one key feature: filtering or sorting the list of keys by whether or not they were translated into the second language. I seem to only be able to sort alphabetically. Am I missing something?

Hi Jan!
As you pointed out, Xcloc Editor supports sorting alphabetically and filtering by search terms, but does not support filtering by “translated” or “untranslated” strings.

This is great feedback though! If you would benefit from this feature, please file a feedback report and paste the ID in this thread. 
Thank you <@U03H3NEH4CX>, submitted at FB10114561 
Perfect, thank you! 

--- 
> ####  Hi! Is there a built-in workflow in Xcode to localize settings bundles? In a way that Xcode would export all the relevant strings to .string files and the Export Localizations menu command would include those automatically into the exported .xliff files?

Hi Daniel!
Xcode supports localization export for Settings bundles that are named “Settings.bundle” and contain .strings files.

If this isn’t working for you, can you explain the setup you’re using and the behavior you’re experiencing? 
Hi Matt, ok, I understand what my problem was. As you mentioned, the strings from the Settings.bundle plist are actually exported correctly. I'm in addition using the third party <https://github.com/futuretap/InAppSettingsKit|InAppSettings framework>, which builds on the Settings.bundle format but supports additional key/values and can be embedded into the app. It was its InAppSettings.bundle where the strings weren't automatically exported from the plist. Thanks for the answer! 
Ahh, glad you were able to find the problem! 
Yes, thanks again! 

--- 
> ####  How would you handle the case where you want to provide variations in a language? For example I want to provide localization for the word colour. UK people would see colour, but US people would see color. Is there a way so all other text is shared but I could localize that one word?

Hi! Unfortunately, once we find a strings table for a specific lproj, we use the contents of that table as they are without doing any more fallbacks. 
For example, you can localize a table for en_GB, but it has to contain all strings, even those that are the same as other English localizations. 
Seems like their should be a hierarchy in the string handling where you can have an overlay (e.g for GB) that only needs to contain the differences to another version (e.g US) 
Ah ok, that's too bad. Are there any plans to be able to do so? Is it worth it to file feedback about it? 
On the plus side, you _can_ in fact localize for English variants, like English (UK), English (Ireland), and so on. 
Yeah, it would be wonderful to have a feedback! 
Thanks! Created FB10115590 :blush: 

--- 
> ####  How do we format and sort time values in a localized way? for example, if i'm showing a list of hours of operation for the week, the time strings will be different (24 hr vs 12 hr), and the order of the week days will be different (starting on monday vs sunday).

Hi! For sorting, it would be best to sort based on the original binary data, then use .formatted() to produce a localized time and/or date. 
could you clarify what “original binary data” means? 
How are you storing the days/hours prior to localization? 
For example, is it a `Date`, or are you receiving the data in some other form? 
it would be a JSON from an API response in english,

```json
{
day: 0,
start: "0700",
end: "2300"
}
```

and 0 means sunday as specified in the API 
Got it. You should be able to sort directly on those strings. For the first day of the week issue, you can check `Calendar.firstWeekday`. 
(on the current user default calendar) 
To produce formatted times, you'll need to convert the strings to a `Date` object, then use `.formatted()` with the appropriate options to produce the string you want. 
thank you!! 
You should be able to put a weekday/hour/minute in `DateComponents` and then use `Calendar`  to make a `Date` from that. 
You can then make a `DateInterval` from two Dates for the range (e.g. "9 AM - 5 PM") and then use `.formatted()` on that. 
One more note: when using `Calendar` to convert `DateComponents` to `Date`, set the time zone to GMT to avoid Daylight Time issues. Same with `.formatted()` 

--- 
> ####  We have an app that has English only features. Let's imagine that's as an advanced assistant for editing English texts and our assistant doesn't support other languages.  If we localize our app, would it improve user experience for people who use English as a second language, or would it only confuse them on why their main language is not supported, since we only expect English texts for now?

Hi Roman, I think it’ll depend on exactly what your app does.

For example, hypothetically, if you have an app that points out grammar notes about English, it might still be useful for people to see that information in a language they find easier to understand than English.

So, if you can share details, I might be able to help give you a more specific, helpful answer :slightly_smiling_face: 
Basically, it is an editor app, which has users' documents. When user creates the doc and fills it with a text, he receives grammar suggestions, as well as clarity, fluency, readability and other suggestions.

Each suggestion is a card that has:
• previous word/sentence and the resulting sentence
• detailed explanation of why the user should apply this suggestion in that particular context - like because it sounds unconfident, or because it has a grammatical error, and so on 
Right… I think some users—especially those who have less familiarity with English to begin with—could certainly benefit from localization.

However, you may want to be cautious about (a) which languages you choose, and (b) how you separate out the “content language” (English) from the “UI language” so that there’s no confusion or aesthetically displeasing mixture of languages. 
I've been thinking about some extra flow to suggest users who are not from EFL countries to have some pieces of the content being translated to their native language, just like that hint on why they should apply that alert. 

However, I dunno if users would be ok with English interface since they already write some English texts and the interface is primitive enough to be understandable. But at the same time having some interface parts in the native language, like we as an app just forgot to translate everything :sweat_smile::sweat_smile: 
You’re thinking about all the right things! And it’s true that with English being the _lingua franca_ in today’s world, many people might be familiar enough with the English user interface such that they won’t need localization. However, it’s always handy to have choices, and your users can also go into Settings to switch your app to English if that’s what they prefer.

In terms of making sure that the localization doesn’t look partial or incomplete, I would definitely suggest making sure that any “chrome” (i.e. UI elements) is translated consistently in each of the languages you target.

For example, if the tables are turned and your app is actually for helping people with French, as a French learner, I would appreciate it if I could use it in English and see suggestions like this:

&gt; _The verb_ *bouffer* _could be too formal. Consider using_ *déjeuner* _or_ *manger*_._
I’m limited by what I can do in Slack here stylistically, but you can see that I have marked the text in the content language in a different style than the UI language, which gives me clarity as the user as to what’s going on and where the language boundaries are. 
That's exactly what I've been thinking about. 

Last one - if  you will have those suggestions in English, having French texts, would you as a new user prefer having whole app interface in English? 

Wouldn't you start typing in English instead of French, since the app is fully localized?))  
Yes, I suppose I might! It’s hard to answer that in the abstract though without knowing exactly what the app looks and feels like. It all depends on which direction your app’s design steers the user in. 
Yeah, well... I'm talking about Grammarly app for iOS. Would be great to learn your thoughts on that. 
Oh, interesting! I was guessing that this _sounded_ like Grammarly! 
I would suggest looking at your app’s usage and tackling one market as an initial foray, e.g. China or Japan, and see what feedback you get from your customers :slightly_smiling_face: 
Personally, I don't know that the app being localized in a given language would necessarily imply that I can input text in that language (though obviously it's ideal!). Taking for example our own products, we localize all features of the OS into all languages completely, including things like Apple Pay Later that might only be available in some regions. 

--- 
> ####  There's probably no right way to do this, but when working with localized strings in code, do you recommend using the new string initializer (which looks great btw!) directly throughout the app, or creating, for example, a file with enums that return those localized strings?

We strongly recommend that you use `String(localized:…)`, `AttributedString(localized:…)` or in Objective-C `NSLocalizedString` and `NSAttributedLocalizedString`! 
If you do that, Xcode can extract strings for you to provide to your localizers — it knows how to recognize these macros and initializers and how to produce a `xcloc` bundle that contains them all, and then reintegrate it into your project. 
String constants used with other mechanism will not be recognized by this mechanism, and you will have to manually handle extraction into .strings files and any changes going forward. 
Note that SwiftUI also uses the `LocalizedStringKey` type, and Xcode also knows about it. So, when you write `Text("Hello, world!")`, since `Text(…)` takes a `LocalizedStringKey`, Xcode will also know to extract it. 
In Swift, you can even use String interpolation to include variables directly in the initializer `String(localized: "Welcome to \(newCity)", comment:"Large headline label welcoming the user to their new location, the variable refers to the city name.")`
Please make sure to explain what the variable refers to, so that translators have that knowledge, too :slightly_smiling_face: 
Yup! This works in `String(localized:…)`, `AttributedString(localized:…)` and in SwiftUI. 
As long as you’re using this setup, in general, you’re golden — if you’re using enums to represent your strings, just make sure that they’re calling into these functions. 
In general, using enums may complicate your patches a little and interact weirdly with SwiftUI if you try to pass `String`s to SwiftUI initializers that expect localized keys. 

--- 
> ####  Hello. Can the Localizable.strings updates itself? The first time export and import is okay. However, when the project contains a  Localizable.strings file then the next export will not contain new strings added.

Hi ChakMing!

The expected flow is as follows:
1. Have some strings in your project (either .strings files or strings in code)
2. Export Localizations, which includes all strings in an xcloc
3. Translate the xcloc
4. Import Localizations with the translated xcloc (This step updates/adds .strings files in/to the project.)
5. Exporting again should include all strings in the project (including those previously imported) in the xcloc
If this is not working as expected, please file a feedback so that we can take a look. 
<@U03H3NEH4CX> Hello again. Here’s what I found.
At initial, the export will include all strings.
If I imported the xcloc, it will generate Localizable Files.
Then I add more words on SwiftUI, and export. The xcloc is still using the old localizable file.

I thought it had been happening for a long time… Do you think it is a bug, or is this correct? 
So my expectation here is that the second export would include *both* the strings in your SwiftUI code *and* the strings in the .strings files that the import created. Xcode won’t remove stale translations automatically, because those translated strings can be a valuable resource if you ever need to translate them again. 
However, please feel free to file a feedback request if you think we should change the flow here! 
I just re-export and seems it works this time! Thanks, <@U03H3NEH4CX> <@U03HBMCRX0E> 

--- 
> ####  Hello. How can we make sure the system and VoiceOver identify a certain text’s language correctly. Is there a tag we can set somewhere? I’m asking for both web and apps. It happens from time to time where the system falsely identifies Urdu for Arabic, or recently on iOS 16, Persian for Arabic. How can we improve this?

If you know the language of your text, you can annotate it with that language.

For web content, you can use the <https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/lang|lang> attribute, which can be applied to any HTML element, including `&lt;p&gt;`, `&lt;span&gt;`, and `&lt;body&gt;`.

For app content, you can create an attributed string and set the `NSLanguageIdentifierAttributeName` to the language code of the corresponding text. 
If you have reproducible strings that are incorrectly identified, we would love to have feedback with those examples as well! 
Here’s the feedback ID: FB10152753 
It fails on everything. Here are some example texts: 
من سعید هستم 
امروز بریم رستوران؟ 
چه خبر؟ 
<@U03HW7PE3SM>  
Thanks! We’ll be sure to pass this along. 

--- 
> ####  What’s the best way to use two custom fonts (non SF Pro for marketing reasons) for Arabic and Latin scripts? The most challenging part is that the text could be bilingual and it may come from the server. For instance, “به WWDC خوش آمدید”. I want two fonts to be used for this snippet.

It looks you forgot to answer this. 
You can do it by setting <https://developer.apple.com/documentation/coretext/kctfontcascadelistattribute|kCTFontCascadeListAttribute>, either have the primary font be the Latin font, then have the cascade list contain your Arabic font (the way we do it for our system), or the other way around. 
Another option is to use `(NS)AttributedString` and set the fonts on the individual segments of the string. 
The thing is I mostly don’t have access to the text beforehand. Let’s say it’s coming from a server. 
Then the font fallback list (as above) is best. Note that in addition to the CoreText version above, there's also <https://developer.apple.com/documentation/uikit/uifontdescriptorcascadelistattribute/|UIFontDescriptorCascadeListAttribute> and <https://developer.apple.com/documentation/appkit/nsfontcascadelistattribute/|NSFontCascadeListAttribute>, if you're using higher-level text APIs. 

--- 
> ####  Is there a non-hacky way to force a single language for an app? Let’s say the app only supports “ar-SA” and the user’s device language is set to “en-US”. I used to set a value for a certain in key in UserDefaults at launch to make it work.

You should not need to set any user defaults. Simply make sure that the `developmentRegion` in your project.pbxproj is set to the correct language and that all your localizable files are in the correct lproj. If your app does not have an lproj folder, you will need to be on iOS 16, macOS 13, tvOS 16, and watchOS 9 to get correct behavior. 

--- 
> ####  Is there a way to force the numeral system for an app? For instance, the user may have chosen ‘۱۲۳’ as their numbering system of choice where it only make sense in our app to show numbers as ‘123’. One thing that’s still missing and I’d already filed a report as I remember, is choosing the numeral system when changing the language for a specific app. Now you can only change the numeral system when you change the device language as a whole.

Simply don’t localize the numbers (e.g. don’t use a formatter) and the numbers should be preserved as the literals you are using in your code. Do you have a code sample to share to elaborate more on the issues you are seeing? 
I think I phrased my question wrong. For instance, install Whatsapp on a device whose locale is set to English - United States. Then, go to Whatsapp settings page inside system Settings and change its language to Persian. Now Open Whatsapp. You’ll see the system keyboard has number row in Latin. 
Whereas in iMessage on the same device it’s in `۱۲۳‍` form. 
<@U03JPJ277SQ> IMHO, this may be a bug. Do you mind reporting this bug and sharing the FB # here? 
<@U03J83G0WQG> Here it is: FB9647599. I believe we already discussed this on Twitter as well. 

--- 
> ####  When I release my apps I can usually find some people to help me translate the initial release. But over time it makes it difficult for me to create updates which require new translation strings. Any best practices you would have there for indie developers that don't have a lot of resources to pay 20+ translators for each release?

It is understood that adding languages to your application can become quite the commitment — not just a commitment in the moment, but also going forward. 
It does pay off to make a plan in which you can sit down and think whether you can do so sustainably for every single feature you do, including adding languages to your application. 
Sometimes, it is a valid choice to know that the time may just not be there every release, and to choose perhaps to support fewer languages. 
At other times, community-supported projects may be able to elicit contributions from the community that can help where a single developer may not, depending on what your relationship is with that community. But it is very much a commitment — often an economic one — you may want to think about as an ongoing task that requires care and maintenance. 
Just to clarify — you are not having issues with filtering out new strings from old ones, correct? 
in other words, using the Xcode import/export workflow, you _should_ be able to only have to deal with new/changed strings on every release, rather than re-translating the entire app. 
There are third-party services that offer (human) translation as a service for your localizable strings. But you'll have to document your strings well, or they may get the context wrong and mistranslate. 

--- 
> ####  We saw that this year you're adding punctuation to Hebrew (Thank you for that! תודה רבה) Besides the obvious addition to the Hebrew Keyboard is there anything else we should know about that?

Hi <@U03J1TN6WBD>, we have indeed added _niqqud_ support to the iPhone &amp; iPad keyboard layouts this year.

There’s nothing else new for Hebrew this year per se, but it’s worth mentioning that Yiddish is also now supported as a separate keyboard language. 
Thank you! a dank 

--- 
> ####  Maybe a slightly tangential question, but are there learnings or strategies used during RTL localization that could be beneficial for adapting a UI with significant lateral elements for left handed use? Does “handedness” come into play when considering the design of RTL UIs?

We treat _Handedness_ and _Layout Directionality_ as distinct elements and handle each of those in different ways.

For example, for the One-Handed Keyboard, we offer both Left-Handed and Right-Handed modes.

UI elements or gestures that indicate a progression that go left-to-right in an LTR language do mirror to go right-to-left in an RTL language. So, handedness does not come into play here.

This is all fairly abstract, of course. If you have a concrete example that you want to ask about, do feel free to share it :) 
I guess, as a lefty, I never really understood how an adaptive layout could really change how someone uses a device until I started looking at how RTL languages are handled in the HIG. The chevrons in lists are meant to point towards the thumb you use to tap them :exploding_head:. I would imagine that the inverse could be true in RTL situations… has that changed your design strategy? 
For example, an iPad in portrait orientation puts the capture button on the right hand side. This seems like a place where handedness would take priority. But there are other situations where the inverse would be true? 
I didn't see specifics about gestures in the HIG article, so I was wondering if I just missed something or if there was some type of helpful underlying principle to keep in mind. 
Those are thought-provoking questions, <@U03JCRFMPHV>, and I likely won’t have any satisfying answers to your larger question in this forum.

It does seem like Handedness and how it applies to User Interface Design is a topic that I’m not the best person to answer, though I’ll see if there are any other colleagues of mine who may have an answer for you. 
The overall rule is that the design layout in RTL matches the flow that the user would expect elements to flow in the UI - including the text strings, animation, navigation (E.g. If the heat map of people that uses an LTR layout - e.g. website - is on the top left corner, it would be top right corner in RTL).

The only thing that we should take care of is:
*Reachability:* if the design intention is to have an element closer to the right hand - then it should not be changing because of the RTL layout (E.g. the keyboard layout does not change when you switch LTR or RTL / emojis entry point would be at the same exact place).

Other elements that could impact our decisions while changing to RTL layout:
1. *Memorization:* If the UI component would be very connected to how user would remember things, it should not change (E.g. the order of the lock screen numbers remain the same in both RTL &amp; LTR)
2. *Images,* videos, backgrounds should not also be impacted (E.g. the weather App background).
<@U03JCRFMPHV> Let me know what do you think. 
This is very interesting, thank you for sharing some of the methodology in your design thinking. I was surprised to see elements like system level scroll bars flip to the left side. It's never been under my thumb before. Seems disadvantageous for RTL righties?

<@U03J83F2TDE>  
That’s a really great question <@U03JCRFMPHV>

*Two angles for this:* (which are up for discussion too) :slightly_smiling_face:

• In the layout, having scroll bars usually is on the other side where your attention should be.
• And for reachability, I usually think about it device by device. On macOS - which I think is where scroll bars are used the most - there is no reachability issue as it is not touch based. Touch based devices are less likely to rely on it and it is used as an indicator more than an interactive piece of the UI as we use swipe instead. And even on iPad for example if we decide to use it, we mostly hold it with two hands and the left hand solves it too.  
Definitely. I can honestly say that having the scroll bar under my thumb for the first time… and to not have my scrolling thumb blocking the icons in lists for example, was a brand new experience. 

Especially on the larger phone, it makes reaching the compose button much easier :joy:. 

Interesting to see places where steps were taken to counteract reachability issues. Like floating the iPad portrait camera capture button to the right. Thank you for your thoughtful response! <@U03J83F2TDE>  
You’re always welcome <@U03JCRFMPHV>
Nice questions :D 

--- 
> ####  Hi there! Didn't have time to check out the new resources yet (but will do in the future for sure!). Could you tell me what are the main key points that we should take into account when designing apps targeting an international audience?

Hi <@U03JRP87THN>, there’s no succinct answer for this; so, I would highly recommend checking out <https://developer.apple.com/videos/play/wwdc2018/201/?time=1665|Creating Apps for a Global Audience>, <https://developer.apple.com/videos/play/wwdc2022/10110/|Localization by example>, and <https://developer.apple.com/videos/play/wwdc2022/10107/|Get it Right (to Left)> to build up an understanding of what you should take into account when designing apps for an international audience. 
<@U03JRP87THN> I would say, generally speaking look out for two things:
1. *Language:* design layouts may be impacted by RTL languages Orientation or the less dense text strings in CJK languages. Another example is that certain scripts require different bounding boxes or spacing whether less or more than latin (E.g. Thai needs more vertical spacing in the UI to avoid clipping).
2. *Culture:* What are the cultural behaviors and nuances that can impact the features you support, the hierarchy or the elements in the UI, or simply the visual language (E.g. colours that could be perceived differently in different cultures).
 
Thank you! 
Will look into the resources. 

--- 
> ####  Should RTL (specifically Arabic) text work out of the box using SwiftUI on watchOS 8? Are there any configurations or SwiftUI properties that might break it? I have a Watch app and RTL seem to work fine (I can’t read them but they look okay) but I’ve gotten feedback that they fail for some users — Arabic text is “backwards” and the characters aren’t joined like they should be. I’m just using Text so I can’t see why this would happen. I can provide screenshots in the thread if possible.

Hi Christopher! I think I may have an idea of what issue you’re encountering, but to be sure, a screenshot would definitely help. Please feel free to share. 
Sure, here's the same text on watchOS and iOS.  
I've been unable to reproduce the this with my own strings but I don't have a copy of this exact text. 
I see; there are two different issues going on here. 
The Watch screenshot demonstrates broken and completely illegible Arabic text, and it’s also not using the System Font. It’s difficult to be sure about what’s going on here without a sample app to reproduce this issue in. 
I am setting the Text’s font using UIFont and a FontDescriptor so I'd guess that's the culprit 
One thing I will note is that in the Watch screenshot, the title `التحريم` is rendering correctly, but the body text below that is what’s completely broken. 
Not sure why it fails for some RTL strings and not others 
It’s possible that the specific font you’re using supports Arabic glyphs, but not the appropriate shaping. 
I should note that the _alignment_ in both the iOS and watchOS screenshot is unnatural for Arabic, i.e. the text is left-aligned instead of right-aligned. Does this app localize into Arabic, i.e. have `ar.lproj` or is it localized into another language and this content is being loaded at runtime? 
The app is localized in Russian, which is what this user is set to. And then he's entered Arabic text. 
I'm using the system font but applying a design:  
Here's another example where (I think?) all the text is working fine:  
indeed that does look correct 
I see. Nothing jumps out to me immediately as being wrong here. I would really appreciate it if you could file a Feedback Report with a sample app which demonstrates this issue. I would love to look into this problem further. 
Yes, the second screenshot here looks correct; I also see that it’s using the System Font. 
have you ever been able to reproduce this locally, or are your only reports of this from user(s)? 
I have not been able to reproduce (second screenshot is mine). I've asked the user to send me the text itself so I can try it. Unfortunately I haven't been able to copy that Arabic text out of the iPhone screenshot. 
To start, I think it would be good to file a feedback with as much of your watch app as you can reasonably include (with build instructions if needed beyond build and run) and these screenshots. 
Out of curiosity, was the iPhone screenshot above also from the same user? I happened to notice that one of the UI elements was rendering text using the Urdu font, and it’s possible that that is the clue to when this issue reproduces, i.e. when Urdu is added to the preferred languages list (higher than Arabic, if Arabic is also present). 
Yes, that iPhone screenshot was from the same user.  
Okay, I'll put together a Feedback with whatever I can get. Thanks! 
Good spot! I was also wondering why the Arabic text was shaped like this on the navigation bar, but it’s actually Urdu! 
Please do post the feedback number once you have that filed back in this thread. Thanks again! 

--- 
> ####  How can I right align Arabic text in push notifications efficiently when only the app language is Arabic not the entire device.

Thanks for raising this use case.  Can you please describe your use case in a bit more detail in a Feedback report, sharing the number here?  We’ll follow up there. 
I am working on an application which has two languages English and Arabic, now users can change the app language whenever they want. So ideally if the app language is English the text displayed in push notifications is left aligned as it should be, but when the app language is Arabic the text should be right aligned but it's not. Even when the app is in Arabic the text in push notifications is left aligned. While the rest of the app is completely right aligned. 
Thanks <@U03J6B7G2QN>, that is a great description.  If you don’t mind reporting that via the Feedback tool, it makes it easier for us to track a solution internally, and follow up with you beyond the Digital Lounge. 
Here FB10161536 

--- 
> ####  Hi. Is the generated xcloc file will fetch all strings update in every export?

Yes, running Export Localizations will re-process your source code to extract any newly added, removed, or changed strings and include them in the exported localization catalog. It will also include the existing translations when exporting for languages other than English. 
That’s Weird. Becoz I found it only works at the 1st time. Then all xcloc will follow the version of the 1st import…

<https://wwdc22.slack.com/archives/C03H786M2V8/p1654879512571169?thread_ts=1654804988.358809&amp;cid=C03H786M2V8> 
I can follow up in your other thread 
ok thx 

--- 
> ####  So if I have a SwiftUI or UIKit notes app that’s not localized in any RTL languages but a user enters RTL text, am I correct that the expected behavior is that the text itself will appear RTL but will be left-aligned? Is there an easy way to get this to appear right-aligned, or would I have to analyze the language myself? Or is this undesirable behavior in an otherwise left-aligned app?

On iOS, when a user enters text into a text field or text view, the alignment follows the default alignment of the keyboard, and you should not need to do anything extra on top of this. 
If that text is _then_ displayed in a UILabel, for example, the alignment would be based on the UI language, rather than the content of the label itself. If you have a use case for something more automatic, please do file a feedback describing it in more detail. 
Okay thanks  

--- 
> ####  Hello Devs,  We have localization Strings being delivered by Middle ware and get updated and stored in Application Directory on each app launch. Where we used to load them using ‘Localizable. nocache’ as mentioned on Apple Docs. However this slow down the Ul performance way too much. As it seems it would load whole strings map for each call to NSLocalizationString. Can you suggest a work around?  Thanks Fahied

Hi Muhammad!

`.nocache` should only need to be used if:
• the strings table has already been loaded during your app processes lifetime,
• the table is known to have been updated based on some other signal
Use of `.nocache` is expected to have some performance overhead so some techniques to reduce are :
• Use it as sparingly as necessary (ie is it really user critical to get non-cached strings)
• Consider re-organizing the strings tables into smaller tables that map to user activities so that unnecessary strings aren’t being loaded into memory
 
Hi Muhammad, can you also file a feedback report about your specific use case so we can look into enhancement in this area too? 
Sounds great, I ll do that.

The problem is really If I load Strings without .nocache, It will not load the updated strings even though the same source files .strings is overriden or even you force load main bundle again. 
That's right. The strings files are cached by bundle when bundle is created. Since there's no way to really "unload" a bundle, the cached resources remained cached 
Depending on the scope of your project, you can consider having a separate XPC service to load the strings, and kill and relaunch the service when you get a notification when the strings are updated, if such feedback is available via your middle ware 
Would there be any possibility for iOS in term of XPC service? 
Ah.. sorry I didn't ask about your environment first. Unfortunately I don't think so 
I thought may be you guys holding on to something :smile: 

--- 
> ####  Not sure it's a bug bug if my development lanugage is english but if I don't add English in my Localization it going to display other language. The work around I did now is add empty english localization file for each file?

Can you clarify your project setup? In general, your development localization _should_ be one of your app localizations. Prior to iOS 16/macOS Ventura, it was required that your app bundle also contain a corresponding lproj folder for the development language, but you should not need any empty files. 
