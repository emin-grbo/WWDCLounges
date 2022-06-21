# app-store-lounge QAs
### Lounge Contributors
#### [pol-piella](https://github.com/pol-piella)
#### [emin@github](https://github.com/roblack) / [emin@twitter](https://twitter.com/emin_ui)
#### [shirblc](https://github.com/shirblc)
#### [tikimcfee](https://github.com/tikimcfee)
---

--- 
> ####  There's a mention about source ID that "Advertisers can configure this," whether now it's the responsibility of Ad Networks or is it going to become advertisers' responsibility?


|U03JFDN0D88|:
This would be the responsibility of the ad network when they serve the ads.

--- 
> ####  There's a mention of low/mid/high privacy threshold in the session earlier today. Could you share the definition of those threshold?


|U03JFDN0D88|:
Sorry, we are unable to share these definitions.

--- 
> ####  In my game, I buy points with in-app purchase and spend the purchased points to get something. For accounting purposes, sales are generated when points are consumed, not when points are purchased, but there is no amount information on the receipt. How do people who are developing apps with similar mechanisms get paid? Do you remember the amount when you buy points? If you use the method of getting item information from the store, the amount at the time of purchase may be different.


|U03JELM0ZNV|:
I have similar concerns. In the model I am building, artists who publish assets on our store will be paid according to prices set. A given greeting-card template may include works by several people getting portions of the price. To complicate things further, we have an NFT-like model in that artists get paid *again* if someone copies and sends a messaging using their work.

I'd figured our internal accounting will be in the _digital gold_ all the way until the actual artist remittances, and have to work out an exchange rate at that point.

|U03J49LAG3B|:
When working with consumable in-app purchases, you need to track in your system the amount of points your customer purchased before finishing the transaction. The App Store doesn’t keep track of how many points each purchase entitles the user to, and transactions for consumable products do not show up in the App Receipt or StoreKit 2 transaction APIs after the transaction is finished.

|U03JELM0ZNV|:
Do we have a formal requirement from Apple to make a consumable balance restorable on a new device?
Whilst it would be nice to offer, it's something I'd defer from v1 if possible.

|U03J22N3FM0|:
I would like to know the price of the purchased item when the purchase is successful.
You can find out by product ID and purchase time, but if you sell in multiple countries, you don’t know which country the store is in.
For now, I’m trying to remember the country of the store at the time of purchase, but it’s complicated when considering reinstallation etc.

|U03J49LAG3B|:
Please submit feedback using Feedback Assistant for any enhancement requests :slightly_smiling_face:

|U03J22N3FM0|:
I understand. Thank you.

|U03HRLNQ5JN|:
<@U03JELM0ZNV> Regarding formal requirements, the App Review team may be able to help you with understanding those. You can check out an App Review Q&amp;A or Lab, which you can find using the Developer app.

|U03J22N3FM0|:
Thank you.

--- 
> ####  It was mentioned that the 1st postback wouldn't have any source ID in it. Does it mean we won't have any campaign-level data until the 2nd postback?


|U03JFDN0D88|:
The first postback can carry the source identifier, fine conversion value OR coarse conversion value and source app ID provided that the privacy thresholds are met.

|U03JSTT4C10|:
<@U03JFDN0D88>, sorry for pinging you on this one more time, but I want to follow up a bit as it’s one of the most crucial parts of SKAd Network.

&gt; The first postback *can* carry the source identifier …
To confirm my understanding, is the 2 digits of source identifier (aka Campaign ID) expected to be anyway in the first postback no matter the privacy threshold?

|U03JFDN0D88|:
The least significant 2 digits of the source identifier (which you can use for tracking anything and not just campaigns)  will be present in the first postback no matter what the privacy level is

|U03JFDN0D88|:
For a refresher, in the SKAdNetwork session from today, there is an example showing how the source identifier changes depending on the privacy level. This will show you the different situations that can occur.

|U03JSTT4C10|:
Yeah, got it!
It was super-clear on the part of the privacy levels in the video, the only confusion was about the combination of it with multiple postbacks.

Thanks a lot for the clarifications!

|U03JFDN0D88|:
Of course, happy to help! :slightly_smiling_face:

--- 
> ####  I have an app+iMessage extension that's currently iOS 12+ and am considering bumping it to much later (15+) but worried about proportion of people still on 14.  If I keep iOS12/13/14 supported, can I have StoreKit1 &amp; 2 in same app? I would like to avoid having to build receipt validation just for legacy customers, in my new store.


|U03J49L9DG9|:
hi Andrew. yes, you can use SK1 and SK2 in the same app

|U03J49L9DG9|:
i'd probably just isolate my StoreKit code and have two branches, one for iOS 15+ that uses SK2, and one for iOS &lt;15 that uses SK1. that way once you do bump the min OS to 15, you can just remove the SK1 branch

|U03J49L9DG9|:
also SK1 and SK2 use the same backing data on our servers, so if a user updates from 14 to 15, your app starts to use SK2, and all their purchases and such should be there in SK2 right away

|U03JELM0ZNV|:
Just to chase that nuance a little further - if someone gets a new device with ios15/16 does that mean they will get a better _Restore Purchases_ experience automatically (because SK2)?
Or is that all on me to write?

|U03J49L9DG9|:
it should be automatic, StoreKit 2 will attempt to get all of the transaction history when your app opens without needing to do a restore or have the user authenticate. you should be able to just use the StoreKit 2 history APIs pretty much right away

--- 
> ####  I have 4 auto-renewable subscriptions: "Basic 1 Month", "Basic 1 Year", "Advanced 1 Month" and "Advanced 1 Year". "Basic 1 Month" and "Basic 1 Year" offer the same functionalities but with different duration, and the same goes to "Advanced 1 Month" and "Advanced 1 Year".   Should "Basic 1 Month" and "Basic 1 Year" belong to the same subscription level?


|U03J49LAG3B|:
Yes, subscriptions of different durations with the same level of service should be on the same subscription group level. If you put them on the same level of service, a user can switch between the two different durations as a “Crossgrade”. Check out this link for more information on subscription levels: <https://developer.apple.com/app-store/subscriptions/#ranking>

|U03JRPEC4AU|:
Thank you!

--- 
> ####  Hi. I have a free app, which is gaining users for now. Later, at some point in time, I am planning to make it subscription based only. I never touched StoreKit or In-App Purchases APIs before. In this ocean of API options, which path I should focus on my attention to make the job done. And is this transition is allowed?Thx.


|U03J49LAG3B|:
It’s certainly allowed to add in-app purchases to an existing free app. Check out the StoreKit 2 APIs for in-app purchases to get started: <https://developer.apple.com/documentation/storekit/in-app_purchase>

When transitioning to subscriptions, you can use the new `AppTransaction` API in iOS 16 to reward existing users by checking the `originalAppVersion` which they downloaded your app.

|U03J49LAG3B|:
You can learn more about `AppTransaction` here: <https://developer.apple.com/documentation/storekit/supporting_business_model_changes_by_using_the_app_transaction?language=objc>

|U03HZ60SAH3|:
<@U03J49LAG3B> Thanks for your guidance! :raised_hands: :heart:

|U03J49LAG3B|:
no problem :slightly_smiling_face:

--- 
> ####  Are there any new localizations planned in the App Store Connect?


|U03J49L9DG9|:
We are unable to provide information about future plans, however if there is a localization you are interested in, please file a Feedback requesting it

|U03HRLNQ5JN|:
You can file feedback at:
<http://feedbackassistant.apple.com>

--- 
> ####  In our app we have single IAP subscription group with introductory offer (free trial). We see an uptick in people complaining they are charged right away. We suspect it has something to do with family sharing we have enabled just recently.   Two related questions: 1) If one member of the family receives introductory offer, can another member of the family receive one or will he be charged right away? In other words - is it tracked per family or per user basis. 2) If it's one introductory offer per family - there is code tutorial that suggest to parse all transactions in receipt to verify if user has previously used introductory offer. Will family members see transactions done by other members of the family?


|U03J49S9NL9|:
&gt; 1. "Family Sharing allows a user to share access to auto-renewable subscriptions or non-consumables with up to five family members on all of their Apple devices.  Developers can choose to turn on Family Sharing for in-app purchases and non-consumables in App Store Connect. Users can also choose whether to share their purchases with family." If one family member buys an in-app purchase and family sharing is enabled for that purchase by the purchaser, then all family members will receive access to that purchase.
&gt; 2. When users share a purchase through Family Sharing, each family member gets their own unique receipts and transactions.
<https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/supporting_family_sharing_in_your_app>

|U03JL18FUHH|:
Thank you for the answer. To clarify the #1. Imagine the scenario:
1. Member A starts a free trial (family sharing enabled)
2. Member A cancels the subscription before the trial ends
3. Member B tries to start the trial for the same product 2 months later
I know that member A would be charged right away, what about member B? Will he/she have their own trial or will they be charged right away as other family member has already used an introductory offer.

|U03J49S9XHP|:
In this scenario, the answer is no – they will not have their own trials.

|U03JL18FUHH|:
Ah thank you for the edit :slightly_smiling_face:

|U03J49S9XHP|:
My apologies, I was responding to the other version of the question,
&gt; Can two members of the same family use an introductory offer for single family-sharable subscription IAP?

|U03JL18FUHH|:
Is there a way to test if someone on the family has used introductory offer before? Basically is there a way to reliably tell if “this user is eligible for introductory offer”? From what I’m reading it seems to be impossible

|U03JL18FUHH|:
Sorry for double posting, I really thought no-one would ever come back to my thread.

|U03J49S9XHP|:
For StoreKit 2, there is the property <https://developer.apple.com/documentation/storekit/product/subscriptioninfo/3803203-iseligibleforintrooffer> that you can use to determine if a user is eligible for an introductory offer.

|U03J49S9XHP|:
and no worries!

|U03JL18FUHH|:
Thank you for the answer!

--- 
> ####  Hi there! Do you have any tips on submitting apps to the App Store?


|U03HJ8HUYQJ|:
Hi <@U03JRP87THN> :wave:

Prior to setting up your app in App Store Connect – and prior to submitting your app to App Review - we suggest using StoreKit Testing in Xcode to test in Xcode before submitting.

You can find out more about StoreKit Testing in Xcode here; <https://developer.apple.com/documentation/xcode/setting-up-storekit-testing-in-xcode>

|U03JRP87THN|:
Thank you very much!

|U03HJ8HUYQJ|:
We have a WWDC20 session Introducing StoreKit Testing in Xcode: <https://developer.apple.com/wwdc20/10659>

If you have more *specific* questions about the App Review process, there is an App Review Lab tomorrow - you could submit a question there too!

|U03JRP87THN|:
Thank you very much! Really appreciate it.

|U03HJ8HUYQJ|:
Sure :smile:

--- 
> ####  For the new web-to-app SKAN support, does  the `href` value need to go DIRECTLY to app store, or are redirects permitted?


|U03JFDN0D88|:
Hello Alexander, the href value has to go directly to the app store page for the app being advertised.

--- 
> ####  Regarding App Store Guidelines 5.4 VPN Apps: Is there more documentation or resources regarding the rule "VPN apps must not violate local laws"? As restrictions in some territories are not straight forward, it would be useful to have more detailed guidelines on the subject. Thanks!


|U03J49L9DG9|:
Hi, we recommend speaking with a lawyer for all questions about following local laws

|U03J49L9DG9|:
However, the App Review team may be able to provide more info. I'd recommend attending an App Review Q&amp;A or Lab, which you can find using the Developer app

|U03HJ8HUYQJ|:
There is an App Review Lab tomorrow:

|U03K0TC1KME|:
Understood, thanks for the info!

--- 
> ####   4.2.3: Deleted requirement to include sufficient content in the binary for the app to function at launch.  Are I no longer rejected for this reason, thinking that the regulations have been relaxed?


|U03J49L9DG9|:
Please refer to an App Review Q&amp;A or Lab for all App Store Guidelines and Review questions

|U03J49L9DG9|:
You can find them using the Developer app

|U03J22N3FM0|:
I understand. Thank you.

|U03HJ8HUYQJ|:
There is an App Review Lab tomorrow:

|U03J22N3FM0|:
Thank you.

--- 
> ####  Now that SKAdNetwork 4.0 supports three Crowd Anonymity levels, is the new 'high' level equivalent to the prior, single threshold in earlier SKAN versions (meaning the new 'mid' level is additional), or do the three levels in 4.0 not correspond directly to prior versions?


|U03JFDN0D88|:
Hello Alexander, the levels in 4.0 do not correspond directly to prior versions and are designed around supporting the new models in 4.0.

--- 
> ####  Hi all! I use offer codes in my iOS app to unlock all content, across Apple devices. Currently, I'm working on a watchOS version of the app, but it looks like offer codes remain unsupported on watchOS, so theoretically users with only the Apple Watch cannot redeem my offer codes. What is the recommended flow for this use case?


|U03JH7N0KSS|:
Hi Jan, Thank you for the feedback! Yes, currently offer code are support only on iOS app.

|U03JMMN8659|:
Thank you <@U03JH7N0KSS>. Expanding offer code support to all Apple operating systems is very important for the future growth of my app, and I'm sure I'm not the only one. Thank you for looking into this for future releases! :pray:

|U03HRLNQ5JN|:
<@U03JMMN8659> Please be sure to file feedback here, it's very useful:
<http://feedbackassistant.apple.com>

|U03JMMN8659|:
thank you <@U03HRLNQ5JN>, will do! :pray:

|U03JMMN8659|:
Submitted at FB10124699 :+1:

--- 
> ####  I have a pay up front watchOS app. I want to change it to be free with a subset of capabilities, with an IAP for all the features.   What documentation/videos  should I look at to make this conversion? For my existing users, how can I ensure they will not have to pay the IAP? I want them to keep their full app and not have to repurchase it. Thanks!


|U03HB36192B|:
Switching from a paid to freemium model is supported in StoreKit 2 with the AppTransaction API. With the app transaction, you'll want to make use of the `originalAppVersion` (<https://developer.apple.com/documentation/storekit/apptransaction/3954447-originalappversion>
) property to check whether your customer purchased your paid app version or if they've downloaded your app after you've changed to a freemium business model.

Check out this year's WWDC session to learn more and see a code example of this use case:
<https://developer.apple.com/videos/play/wwdc2022/10007/>

Additionally, we have documentation here: <https://developer.apple.com/documentation/storekit/supporting_business_model_changes_by_using_the_app_transaction>

|U03JJQ3BMB7|:
That's great! Thank you so much! :relaxed:

|U03HB36192B|:
no problem! :slightly_smiling_face:

--- 
> ####  Can a SKAD ad actually have more than one fidelity ? Apple developer documentation suggests that ad networks have to choose one option of either 1. “StoreKit-Rendered Ads - App Store product page, rendered by StoreKit” 2. “View-Through Ads - Custom, provided by ad network” Providing those rendering options works quite differently on the device, so I’m not sure they could happen simultaneously for the same ad impression. I'm referring to this document: <https://developer.apple.com/documentation/storekit/skadnetwork/signing_and_providing_ads|https://developer.apple.com/documentation/storekit/skadnetwork/signing_and_providing_ads>  This question came up when reviewing oRTB spec, which defines fidelities as an array: "SKAdNetwork API starting from version 2.2 supports multiple ad presentation options specified by the fidelity-type parameter of the SKAdNetwork signature. This holds parameters used to generate the signature that would be different for each fidelity type supported."  <https://developers.google.com/authorized-buyers/rtb/openrtb-guide?hl=en|https://developers.google.com/authorized-buyers/rtb/openrtb-guide?hl=en>


|U03JFDN0D88|:
Hello, as the developer documentation calls out, fidelity can be one of two values at the moment
1. Fidelity for "StoreKit Rendered Ads"
2. Fidelity for "View-Through Ads"
Fidelity is very much a singular value and not considered an array.

|U03JFDN0D88|:
I believe that in the link posted above to the google documentation, when they say "array" they are referring to the array of parameters that compose the signature and not the fidelity specifically

--- 
> ####  Does Apple have a supported mechanism for re-signing already archived and signed Ad Hoc IPA apps?  For example, if we archive an (ad hoc) IPA, can it be re-signed by someone else if they have an Enterprise Distribution Certificate?


|U03J49L9DG9|:
Hi, for this question I recommend going to the Signing and Distribution Lab. There is one tomorrow that you can sign up for now

|U03JT8KS7J8|:
<@U03J49L9DG9> I wasn't able sign up for it, it tells me I should've signed up for it on Monday

|U03J49L9DG9|:
sorry, there was one on Tuesday which closed signup on Monday, but you should have been able to sign up for the one today last night

|U03J49L9DG9|:
i didn't see a Digital Lounge for that team. you might try the Xcode Lounge, or just file a Feedback

--- 
> ####  Can you share some tips or guides on StoreKit testing on the simulator? Not just iPhone, but also Apple Watch and other devices. I would like to have a subscription to unlock all content across Apple devices.


|U03J49LAG3B|:
The best way to test how your multiplatform app handles syncing subscriptions across different devices is to use the Sandbox environment or TestFlight. Since StoreKit Testing in Xcode is local to your device, you won’t be able to test syncing purchases across different devices or simulators. If you’re using Xcode, you can simulate how your app behaves if a purchase is made on a different device in your unit tests using the `buyProduct(productIdentifier:)` method on `SKTestSession`: <https://developer.apple.com/documentation/storekittest/sktestsession/3579475-buyproductwithidentifier?changes=__3>

You can still test how your app handles purchases made on the device with Xcode in the simulator. If your app can handle things like interrupted purchases and ask to buy in Xcode, you should be good to go for handling off device purchases :slightly_smiling_face:

This is a great guide for how to set up StoreKit Testing in Xcode using any simulator, watchOS included: <https://developer.apple.com/documentation/xcode/setting-up-storekit-testing-in-xcode>

You just need to set up your scheme like the guide outlines, and then run the app in the simulator.

We have a session from WWDC 2020 on how to set up StoreKit Testing in Xcode in the simulator: <https://developer.apple.com/videos/play/wwdc2020/10659/>
Tomorrow, we’ll have a new session with some advanced instructions: <https://developer.apple.com/videos/play/wwdc2022/10039>

|U03JMMN8659|:
Amazing, thank you! :pray:

--- 
> ####  The App Store Review Guidelines say that for physical goods, you must use a payment method other than In-App Purchases.  I would like to include an in-app currency in my highest subscription tier for credits to redeem physical branded merchandise.  Is that allowable to group it with the other in-app purchases?


|U03J49L9DG9|:
Please refer to an App Review Lounge or Lab for all App Store Guidelines and Review questions

|U03J49L9DG9|:
it's a very reasonable question, and I'd hate to give you the wrong answer, since we are not the team that does the reviewing :slightly_smiling_face:

--- 
> ####  Will SKAd Network privacy thresholds be the same across Source ID (2-3-4 digits) and Conversion Value (null/coarse/fine)? E.g., does it mean that in postback, it always will be either 2 digits of Source ID and null CV/3 digits of Source ID and coarse CV/4 digits of Source ID and fine CV? Or are the different combinations also possible?


|U03JFDN0D88|:
Hello Petr, sorry but we are unable to provide specific information about the SKAdNetwork privacy thresholds at present.

--- 
> ####  Currently I have a paid up front app. I'm building a new version of it with a different bundle ID as a subscription app. Is it possible to give existing users who purchased the old app (with the old bundle ID) a free year subscription to the new, version of my app? I'd like to reward existing customers, but it's not their fault the app will be essentially a brand new app. But after the free year I'd like them to be charged the regular subscription rate.


|U03JH7N0KSS|:
Hi Brendan - Yes, you can leverage subscription offer feature such as offer code to give user a free year of service. See: <https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_offer_codes_in_your_app|https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in[…]bscriptions_and_offers/implementing_offer_codes_in_your_app>

In addition, if you have implemented user account creation in your app. If you give them the free access by syncing app receipts with user account and giving them free service or leverage `AppTransaction` released this year. <https://developer.apple.com/documentation/storekit/apptransaction>

|U03JENQA0TB|:
Thanks. I’ll look into offer codes. Hopefully they can be unique for each customer so they can’t be shared.  Basically thinking that if I can look at the receipt from the old bundle ID app (perhaps copied into the app group container), then I could give them the special offer when they launch the new version. “I see you have the old version of the app. Here’s a free year subscription to the new version!”

There are no user accounts in my app. All the data is stored locally on their devices and synced to their own iCloud accounts. No server to login to.

|U03JH7N0KSS|:
Yes, you can use one-time offer code, they are unique and redeemed only once. Please see these two talk for more information: <https://developer.apple.com/videos/play/tech-talks/10868/> &amp; <https://developer.apple.com/videos/play/tech-talks/110150/>

|U03JH7N0KSS|:
Here is also one more article  <@U03JENQA0TB> <https://developer.apple.com/documentation/storekit/supporting_business_model_changes_by_using_the_app_transaction>

--- 
> ####  Is there expected to be some logic for SKAd Network postback deduplication? User-story behind that is to be able to calculate the overall count of installs no matter how many conversions it was for each of them (one, two or three)


|U03JFDN0D88|:
Hello Petr, do you mean so that you can dedupe among the same user installing - deleting -  reinstalling - deleting and so on?

|U03JSTT4C10|:
<@U03JFDN0D88>, no, the thinking is to be able to count install only once for every possible of combinations in case of multiple conversions sent through the newly introduced scheme of multiple conversions.

|U03JSTT4C10|:
E.g., in a stream of events like
• Install 1, postback 1
• Install 1, postback 2
• Install 2, postback 1
• Install 3, postback 2 _(I am not sure if that’s possible)_
To be able to identify that there was exactly 3 different installations

|U03JFDN0D88|:
Understood. No, any deduplication of these would have to be done using logic on your end after you receive the postbacks.

|U03JSTT4C10|:
Yeah, I mean will there be some fields in a postback to do that?
E.g. to tie them with one install? Or to identify was it 1st, 2nd or 3rd one?

|U03JFDN0D88|:
Depending on the privacy level of the install, different levels of data will be included in the postback. Some combination of those could potentially be used to de-dupe but that would once again be up to your implementation when you receive the postbacks.

|U03JSTT4C10|:
Got it!
It looks a bit worrying to me because in that case I effectively can’t see a way for an example above we won’t be able to calculate the count of distinct installs and therefore all other crucial for advertisers metrics (CPI &amp; conversion rate).

However, thanks a lot for answering, I hope to have more clarity when more documentation will be revealed :slightly_smiling_face:

|U03JFDN0D88|:
One more thing, Install 3, postback 1 will be the first postback from Install 3
Install 3, postback 2 cannot be sent without Install 3, postback 1 being sent before.

Just so you know.

|U03JSTT4C10|:
Yeah, that helps a lot also, thank you!

|U03JFDN0D88|:
You are very welcome! :slightly_smiling_face:

|U03JSTT4C10|:
Will there be a way to understand which postback is it?

|U03JSTT4C10|:
Like 1st/2nd or 3rd?

|U03JFDN0D88|:
the postback will have a new field identifying which sequence index it is

|U03JSTT4C10|:
Got it! Sounds perfect, thanks a lot!

|U03JFDN0D88|:
Of course!

--- 
> ####  I have implemented StoreKit2 in my new app - and I based my implementation largely upon the sample code from WWDC21-10114 “Meet StoreKit2”.    My use case is simpler than the sample code - I have no nonConsumables nor consumables - just autoRenewables.  And honestly, all I want to know is “which productID is the user currently subscribed to.”    Maybe I’m just confused, but there seems to be A LOT of information retrieved in the sample code, but none of it is easily used to answer my question.  I can tell if the user EVER purchased my subscription (but that’s not terribly helpful - it’s like my wife asking me if I’m subscribed to Sports Illustrated - and I reply by saying YES - but in fact that was 20 years ago when I was in college.)  I can tell if the user is ENTITLED to my subscription (but that’s not helpful either - because it lists ALL of the subscriptions within the group and doesn’t single out the one which I’m ACTUALLY paying for in the moment.)  OK, so bottom line I’m just begging for a simple answer to a simple question:  which product ID is my user currently paying for.  Bonus points for also telling me when that subscription expires, and whether or not they’re in a billing retry or grace period.  Maybe the info is in there somewhere, but I’m all over the map with Transactions, RenewalInfo, and it’s ALLLL confused because I’m using Sandbox Testers (my app hasn’t been approved for distribution yet.)  Any help???


|U03J49LAG3B|:
Use the `Product.SubscriptionInfo.status(for:)` method to get information about a subscription. This array may have multiple items in it if your subscription supports family sharing, and multiple family members are subscribed to the subscription group. You can iterate the array and give the user access to the highest level of service they are entitled to in the family.

From there, the `Product.SubscriptionInfo.Status` value gives you access to a `Transaction` value and a `Product.SubscriptionInfo.RenewalInfo` value.

On the `Transaction` value check the `productID` property to get the product identifier of the most recent subscription the customer paid for within the subscription group. To get the group ID check the `groupID` property. You can check when the transaction expires using the `expirationDate` property, keep in mind this date may be in the past.

On the `Product.SubscriptionInfo.RenewalInfo` value you can check the `currentProductID` to get the same information as `productID` on the `Transaction` value. The renewal info value also allows you to check if the user changed their renewal preference such that the subscription will renew to a different subscription, or cancel at the end of the current period using the `autoRenewPreference` property.

Let me know if you need any additional clarifications :slightly_smiling_face:

|U03J49LAG3B|:
In the sample app you mentioned, take a look at the `SubscriptionStatusView` and `updateSubscriptionStatus` method to see how this works in practice.

Link to sample app: <https://developer.apple.com/documentation/storekit/in-app_purchase/implementing_a_store_in_your_app_using_the_storekit_api>

|U03J201SFAP|:
Thanks, Greg.  I have followed the sample app pretty faithfully - and a LOT of my confusion is related to the behavior of Sandbox testers.  I am hesitant to release a product where I can’t fully test and comprehend the results I’m getting - and the sandbox appears to be somewhat opaque.

|U03J49LAG3B|:
If you have any specific questions about testing with Sandbox this is a good place to ask them :slightly_smiling_face:
You also have the Xcode environment available to you for testing which gives you a lot more control over the server for more robust testing.

|U03J201SFAP|:
I’ve seen Apple state several times between WWDC21 and this year too - that StoreKit2 is designed to make it really easy to get the info you need.  I also understand that there are a lot of edge cases (like FamilySharing) that require consideration.  But, please hear me:  it sure feels like there’s a LOT of work involved to just answer the basic question of “do I give my user access to this autoRenewable product ID or not?”  If it’s a ‘no’, then yay - there are lots of APIs I can use to investigate further.  But what I’d really love is just a func that returns a Bool.

|U03J201SFAP|:
And - regarding the use of Xcode to test - I’m glad to hear that you consider that more robust than the sandbox.  To be honest, I didn’t spend much time there because I had assumed that this was really an Apple-server to my-app issue.  I’ll do a deep dive into that.  Thanks.  :pray: 

|U03J49LAG3B|:
As you said, there’s a lot of edge cases that require consideration, so it’s really difficult for us to create a one size fits all function that returns a `Bool`. That said, we appreciate your feedback and it would be very helpful for us if you submitted any enhancement requests or feedback via Feedback Assistant to help us track your feedback :slightly_smiling_face:

If a function like `func shouldGiveAccess(productID: String) -&gt; Bool` would be useful for your app, you could totally implement something like that using your own business rules on top of the StoreKit API. Every different app might implement that function differently, so it’s best for you to create one that fits your needs perfectly. We’re happy to help guide you through the process of building that on top of the existing APIs on the developer forums if you run into any issues, you can write to us there any time of the year, not just during WWDC :grinning:

|U03J49LAG3B|:
I’ll also add that each different testing environment is suited for different needs. Xcode is great for repeating tests over and over both manually and in unit tests, and for simulating scenarios that are only possible when you have full control of the server environment. Sandbox is great for testing server APIs, and how your app will work when you don’t have as much control over the environment. I’d also recommend checking out TestFlight so you can test how your app works with different users. For the best experience for your users we recommend you use Xcode to help when developing new features, write unit tests against your IAP integrations using Xcode, test against Sandbox when your app is getting ready for release, test your server integrations against Sandbox if applicable, put your app on TestFlight for testing with a wider audience, and finally release your app on the store.

|U03J201SFAP|:
Understood.  Thanks for that clarification.  With respect to the func -&gt; Bool - I did implement that using Product.SubscriptionInfo.status(for:), Product.SubscriptionInfo.RenewalInfo and Transactions.  There’s a lot of code in that little func that returns a Bool.  My concern is that it’s a lot of code, and the Sandbox returns such seemingly nonsensical results.  

Results like I have 2 sandbox phones with one common Sandbox tester id.  One shows subscription1 is current, the other shows subscription2 is current - but I’ve heard stated that StoreKit keeps each user’s devices in sync.  

I also got results where Product.SubscriptionInfo.Status == .inBillingRetryPeriod but the Transaction.latest(for:) .expirationDate is 36 hours old - when the AppStoreConnect Sandbox tester's Renewal Rate is 5 minutes.  

I really don’t mean to complain - I’m just saying that there’s a LOT of code to answer a simple question, and I’m at a loss for how to test this to the highest standards.  

I’d really love to see a series of Apple approved articles which offer definitive configurations &amp; testing steps for the most common use cases.

|U03J49LAG3B|:
Thank you for the feedback. If you’re running into unexpected behavior in any environment, please file bugs using Feedback Assistant and we’ll take a look at how we can get you back on track. If you find the transaction data appears out of date between two devices, try calling `AppStore.sync()` to reconcile things.

|U03HJ8HUYQJ|:
Hi <@U03J201SFAP>

I wanted to add:

If you file a bug this week via Feedback Assistant, could you please post the number here? We can take a look.

--- 
> ####  The next version of my app will be bundled to include the Mac and iOS apps for the same subscription price. Some customers have a PC and want the iOS version of my app, but not the Mac version. Can I offer a separate subscription just for the iOS version at say a cheaper price than the bundled version?


|U03HRLNQ5JN|:
You can certainly offer two tiers of subscription service at different prices, with the lower tier offering support for iOS devices, and the higher tier offering support for both iOS and macOS.  See here for more information on ranking subscriptions:
<https://developer.apple.com/app-store/subscriptions/#ranking>

|U03JENQA0TB|:
Excellent! Thanks!

|U03JENQA0TB|:
Further to then would that mean that they could then upgrade their subscription to also include the Mac version at any time by paying the higher price?

|U03JENQA0TB|:
Sorry, I see on the docs that you can upgrade, cross grade, and downgrade. Thanks!

|U03J49L9DG9|:
yes

|U03HRLNQ5JN|:
Yes, assuming you rank your subscriptions logically, that would be an Upgrade:
&gt; Upgrade. Someone purchases a subscription that offers a higher level of service than their current subscription. They’re immediately upgraded and receive a refund of the prorated amount of their original subscription. If you’d like people to immediately access more content or features, rank the subscription higher to make it an upgrade.


|U03HRLNQ5JN|:
Sure thing!

--- 
> ####  For all the SKAd Network postbacks (conversions), is the same 24-48h delay that exists in SKAd Network going to be used? E.g., does it mean that the earliest time to receive 2nd one is 72h after the installation?


|U03JFDN0D88|:
Hello Petr, sorry but we are unable to comment on this at present.

--- 
> ####  For the conversion postback, is the same 24-48h delay going to be applied as in previous SKAD version? E.g., does it mean that the earliest time to receive 2nd one is 72h after the installation?


|U03JFDN0D88|:
Hello Hechen, sorry but we are unable to comment on this at present.

--- 
> ####  Can two members of the same family use an introductory offer for single family-sharable subscription IAP?


|U03J49S9XHP|:
Hello! We answered this follow-up question here: <https://wwdc22.slack.com/archives/C03H49L2CA1/p1654722703254589?thread_ts=1654720278.663449&amp;cid=C03H49L2CA1>

--- 
> ####  I have auto-renewable subscriptions with introductory offers:  1. Basic - 1 week free 2. Advanced - 1 month free Let's say a user starts subscribing to "Basic" and gets a 1-week trial period. During the trial period, if the user decides to upgrade to "Advanced", it seems that the "Advanced" subscription is only applied when the 1-week free trial ends. I want to offer the "Advanced" features immediately, but it looks like StoreKit 2 does not recognize this. Am I missing something?


|U03J49LAG3B|:
Make sure your basic and advanced subscriptions are in the same subscription group, and then configure the subscription levels corresponding to the level of service offered for each option. In this case, you would want your Advanced subscription to be tier 1, and your Basic subscription to be tier 2. In this case, if a user is currently subscribed to Basic and then subscribes to Advanced, their subscription to Advanced will begin immediately. If they were already paying for Basic they’ll receive a partial refund for the remainder of the Basic subscription period. This only works if you set Advanced to a higher level of service than Basic, so that the change would be considered an upgrade

|U03JRPEC4AU|:
OK thank you!

--- 
> ####  I’m going through App Submission for the 1st time - and I’ve got some confusion regarding how to associate my 4 in-app autoRenewable subscriptions to my app.  The AppStoreConnect page states that my 1st subscription must be submitted with a new app version, and then once the binary &amp; 1st subscription has been submitted, only then can additional subscriptions be submitted.   I got a rejection from AppReview because only 1 of my 4 subscriptions have been submitted.  So, is it true then that I have to submit the binary first, and then all 4 of my subscription IAPs immediately thereafter?


|U03HFAWFQ13|:
Hi James!
When submitting a subscription for the first time the subscription(s) need to be submitted with a version. If there are multiple subscriptions related to that version, all of them should be submitted together with the app version. Once you have one or more subscriptions approved for your app, additional subscriptions can be submitted at a later time, with or without a version submission.

If you have additional questions about your review submission, there is also an App Store Review lab happening tomorrow and Friday that you can sign up for in the Developer app.

|U03J201SFAP|:
Hi Shannon…

Thank you so much for clearing that up for me. 

My lack of understanding on this point has gotten me into a pickle…. Now that one of my subscriptions was rejected (ie, marked as “Developer Action Needed”) - it is no longer available in the Big Blue “Select In-App Purchases or Subscriptions” button in App Store Connect.  Chicken or egg, redux.  I’m guessing that my best (or only) path forward is now to ask the App Review group to clear the subscription rejection so that I can re-submit my app binary — or is there something that the AppStoreConnect folks can do to clear it out?

|U03HFAWFQ13|:
Hey James. If you make any edit to your subscription and click save, the subscription should then show up in the list to submit again.

|U03J201SFAP|:
Hey - THAT WORKED!!!  :smiley:  I just had to add a space character to the end of the English localization description.  Thanks, Shannon!

--- 
> ####  Suggestion: please create a feedback report category for the AppStore automated app reviews.  After a recent lab I was requested to fill a feedback for one of the issues I've faced recently, but I can't find the right category. Thanks


|U03JH7N0KSS|:
Hi Roman - If the issue is related to App Store and iOS, please use the below category and selection:

<https://feedbackassistant.apple.com/>
 •	Login with your developer account,
 •	Choose “iOS &amp; iPadOS”
 •	“Incorrect &amp; Unexpected behavior”
 •	and then “App Store.”
 •	Input the issue description and title.

|U03J81TPU3A|:
Roman, does this address your suggestion? Feel free to describe your issue to share more context.

|U03JER2C7MX|:
Hey. Yeah, I guess so, there’s just no extra category for that particular case, but I’m glad that it is the right place.
Thanks!

|U03HJ8HUYQJ|:
Hi <@U03JER2C7MX> — I will add:

If you put “AppStore automated app reviews” into the text of Feedback Assistant, it will get routed accordingly.

|U03JER2C7MX|:
Thanks Chris

--- 
> ####  There was a mention in a session earlier today that SKAd Network Conversion values can both increase and decrease. It seems to be a breaking change from the current logic where it could only increase. So just wanted to confirm, is that correct or have I misunderstood it?


|U03JFDN0D88|:
Hello Petr, yes, in SKAdNetwork 4.0 conversion values can increase AND decrease. This is different from earlier versions where they could only increase.

--- 
> ####  Could you please elaborate a bit on the logic of sending multiple postbacks? E.g., if the update conversion API will be called only once in the first 2 days, is it correct to expect only 1st postback? As an extreme example, if API will be called every hour, is it correct to expect all 3 postbacks somewhere after the end of respective periods (2nd day, 7th day, 35th day)? If will be called somewhere after the install and then only after 7+ days, so missing the timeframe for the 2nd postback, but matching for the 1st and 3rd ones, what would be sent? Only the 1st, or all 3 of them?


|U03JFDN0D88|:
Hello Petr,

A postback will only be sent if at least one update call was received during it's specific time window.

So, your extreme example is correct.

If you call after the install, and then after 7+ days, the first postback and third postback will be sent. The second one won't.

|U03JSTT4C10|:
So to follow up a bit on the last case. You’ve <https://wwdc22.slack.com/archives/C03H49L2CA1/p1654722678272989?thread_ts=1654722064.393819&amp;cid=C03H49L2CA1|mentioned earlier> that the situation when 1st and 3rd postbacks are sent, but the 2nd is not should not be possible.

Could you please clarify in terms of this case?

I am mostly concerned even not about this exact case but more about the scenario when the 1st one wasn’t triggered, but only 2nd/3rd were triggered and sent.
I am worried about this case because it’s crucial to always have the 1st postback as it seems to be the only way to calculate a correct number of installations.

|U03JFDN0D88|:
Understood.

When you make the first update API call, it will update the first postback thereby guaranteeing that it will be sent.

After that, it depends on when you call update. If you miss a postback's time window, it will not be sent.

|U03JSTT4C10|:
Oh, sorry, probably I misunderstood that message that I am referring to.
So does it mean that situation of having *1st+3rd* postbacks without the *2nd* is possible, but the sitatution of having, *2nd or 3rd* postback without the *1st* is impossible?

|U03JFDN0D88|:
In other words, as long as you call register/update after install, the first postback will be sent.

|U03JFDN0D88|:
Exactly what you said.

|U03JSTT4C10|:
So is it correct that all the conversion windows (0-2 days, 3-7 days, and 8-35 days) are counted not from the moment of installation but from the moment of calling the register/update for the first time?

|U03JFDN0D88|:
That is correct.

--- 
> ####  This is sort of an App Store question, so I understand if you refer me elsewhere, but: we are discussing what’s the best way to create a trial version of a non-subscription macOS app. Are there some guidelines around this? Is this covered in the new HIG?


|U03JH7N0KSS|:
Hi Susannah - Non-subscription apps may offer a free time-based trial period before presenting a full unlock option by setting up a Non-Consumable IAP item at Price Tier 0 that follows the naming convention: “XX-day Trial.” Prior to the start of the trial, your app must clearly identify its duration, the content or services that will no longer be accessible when the trial ends, and any downstream charges the user would need to pay for full functionality. Learn more about managing content access and the duration of the trial period using <https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/choosing_a_receipt_validation_technique|Receipts> and <https://developer.apple.com/documentation/devicecheck|Device Check>.

|U03J81TPU3A|:
Susannah, you can also request an appointment with the App Store team tomorrow for more guidance on the ways to approach this. There’s some availability between 10a - 3p PST: <https://developer.apple.com/wwdc22/labs/>

|U03HVD4HFRU|:
Thanks!  Will convey this back to my team.

--- 
> ####  In WWDC 21 sample application from "Meet StoreKit2", I noticed that SubscriptionsView.swift is not checking for revocationDate in updateSubscriptionStatus() while Store.swift does in isPurchased() and other methods. Is this correct?


|U03HB36192B|:
Hello! For that view specifically in the SKDemo app, the `updateSubscriptionStatus()` method can already tell that the subscription is not revoked since it's checking the status state and it skips over the `.revoked` statuses.

You'll want to check the `revocationDate` to make sure a transaction hasn't been revoked before granting access to your premium features.

|U03JRPEC4AU|:
I see! Thank you!

|U03HB36192B|:
no problem! :smile:

--- 
> ####  Any solutions to combat SKAdNetwork fraud from ad networks where they report a lot of view-through ads that never really happened / not shown to the user?


|U03JFDN0D88|:
Hello Eran,

SKAdNetwork has some defenses against being flooded with view-through ads. One such defense is the minimum 2 second display requirement as documented at: <https://developer.apple.com/documentation/storekit/skadnetwork/3727303-endimpression>

|U03JTHGQNL9|:
Does iOS/SKAdNetwork has a way to validate there's something being displayed on the screen?

Otherwise, SDKs in various apps could simply call startImpression and endImpression with enough delay (2+ seconds) to make it seem like an impression took place.

We're asking since these are challenges customers are facing today with SKAN, and given the blackbox nature, it's up to the OS to secure these (some sort of attestation, although being hard since you can't control every ad view controller .. yet?)

|U03JFDN0D88|:
This is an area we are aware of. We cannot comment further on this at present.

|U03JTHGQNL9|:
:thumbsup::thumbsup:

--- 
> ####  In the past, SKAdNetwork's timers could technically be extended as long as you kept updating the conversion value. With SKAN v4 - is there a clear cutoff between 0-2, 3-7, etc?  (Or could you somehow make your first postback be sent after 4-5 days?)  I assume there has to be some cutoff, otherwise the logic setting the conversion logic (in our case Singular as the MMP) wouldn't be able to know which postback "we're on"


|U03JFDN0D88|:
Hello Eran, in SKAdNetwork 4.0 the postbacks do have clearly defined time windows which are fixed.

|U03JTHGQNL9|:
Thanks <@U03JFDN0D88>

And the random time sending time (0-24 hours) after a value is finalized still remains in effect I guess?

|U03JFDN0D88|:
There is a randomized sending time still in effect, yes.

|U03JTHGQNL9|:
:thumbsup:

|U03JTHGQNL9|:
Thanks <@U03JFDN0D88> -- from all of us here at Singular, and I'm sure many others in the industry - we love how you guys have been handling the SKAdNetwork communication this year :heart:

|U03JFDN0D88|:
Thank you very much Eran! and thanks for coming on this journey with us :slightly_smiling_face:

--- 
> ####  Is the App Store Connect API now available for Enterprise Developer Accounts? Ability to generate API keys for Enterprise accounts is highly desirable to be able to manage users and generate provisioning profiles.


|U03HBKR584E|:
App Store Connect API is not available for Enterprise Developer Accounts at the moment, however if you are interested, please file a Feedback request it at <https://feedbackassistant.apple.com>

|U03JELLKVED|:
Thank you- FB9098638 has been filed for this issue.

--- 
> ####  Is it possible to learn more about this upload error we're currently encountering for one of our apps?    ITMS-90427: Invalid Swift Support - The expected dylibs are missing from the app’s Framework location...  Is this something we can fix somehow, or is this something the Xcode team needs to fix?


|U03HBKRJQ2J|:
Hi <@U03KD8SLYPJ>, there was a known issue in Xcode 13.2 that resulted in this error but should have been fixed in a future version of Xcode. If you're using the latest version of Xcode from the Mac App Store and you're still experiencing this issue, you should set up a lab appointment with Xcode Open Hours this week.

|U03KD8SLYPJ|:
Thanks, our app actually uploads just fine with Xcode 13.2 and earlier, it broke in Xcode 13.3 (and remains broken in 13.4 and 13.4.1).

|U03HBKRJQ2J|:
Ok, I guess upgrading won't work then. I would highly recommend the Xcode Open Hours then where we have many Swift experts who could give ideas on how to address the issue.

|U03JER2C7MX|:
Not an expert, though it feels like dynamic libraries that you link with your project are not embedded into the app.

|U03KD8SLYPJ|:
Thanks <@U03HBKRJQ2J>, I’ve passed that along to my team!

|U03KD8SLYPJ|:
We asked about this over in <https://mattermost.omnigroup.com/omnigroup/channels/product-managers#|#devtools-and-swift-lounge>, and ended up filing FB10115173, for anyone following along!

--- 
> ####  Hi all! Good job on the revamped App Store Connect website! :grin:Just one tiny issue that keeps bugging me: Safari never seems to remember my login to App Store Connect. I need to go through the "trust this browser" routine like every week :exploding_head:


|U03HBKRJQ2J|:
Hi <@U03JMMN8659> thanks for the compliment! We would love to look into the browser issue a bit more, could you file a Feedback Assistant with your browser information and we can take a look?

<https://feedbackassistant.apple.com/new-form-response>

|U03JMMN8659|:
thank you <@U03HBKRJQ2J> , will do!

|U03J201SFAP|:
Thank you Jan - BUMP!

|U03JMMN8659|:
Sent as FB10124500 :+1:

--- 
> ####  I’ve got a couple of questions about App Clips.    My app DOES have one really, really cool function - and most of my app’s code quite frankly is just adding support for managing a history of the user’s use of this really cool function.    So, is there a limit to how large the executable can be?  We have almost NO marketing for our app yet (as it’s not yet passed App Review - but we’re close :crossed_fingers: :smiley:).  Most of the users who I believe will love our app can be found in reddit groups.  Is there a way to promote an App Clip in a reddit group?


|U03HLKHT5A8|:
Hi James. Thanks for your questions about App Clips.
App Clips have improvements to the size limit this year as well as other new features.
You can view this session here:  <https://developer.apple.com/videos/play/wwdc2022/10097/>
You may sign up for the App Clips Lab tomorrow where you can get more details about App Clips:
<https://developer.apple.com/wwdc22/110501>
Or you can join the App Clips Q&amp;A on Friday:
<https://developer.apple.com/wwdc22/110445>

|U03J201SFAP|:
Hey Jeff. Thanks for the links. They do describe the technical - and a quick review of the transcripts (OMG I LOVE THOSE!!!!) suggests that my one cool function is a great fit for an App Clip.

Is there anyone here who can comment on how to best market these?  Print ads, posters, etc make sense - but what about stuff outside of the normal?  What are some of the most successful ways you’ve seen these promoted?

|U03HLKHT5A8|:
The App Clips site is a good place to get started with getting the most of your App Clip:
<https://developer.apple.com/app-clips/>
Both the Lab and the Q&amp;A will be staffed by people with more App Clip Expertise and they may be able to also provide suggestions with how to promote your App Clip
But this afternoon’s Q&amp;A is focused on App Store Connect so we don’t have more specific guidance than this

|U03J201SFAP|:
OK, thanks Jeff.  I’ve signed up for the Lab - thanks for the pointer!

--- 
> ####  Hey there! Are there any improvements for Product Page Optimization coming up/planned? Specifically, why are we not able to A/B Test Screenshots for macOS (we have a universal app using Catalyst), and will we get the chance to A/B Test other metadata, like keywords and descriptions anytime soon?  Also, are there any improvements to the Product Page Optimization Sections in App Analytics planned (being able to filter by Devices, Source Type, etc.)?  Thx a lot in advance!


|U03HWT7MTLZ|:
Hi Sam, we don't comment on future plans, but appreciate your feedback. You're correct - Product Page Optimization is a feature for apps in the iOS and iPadOS App Store, and the types of metadata that can be tested include: app icon, screenshot, and preview video. In addition to other metadata like keywords and description, and data filters for device and source type, what would be the most meaningful improvements to the feature for your app?

|U03K8FBMZ7B|:
Hey <@U03HWT7MTLZ>, thx for your nice reply. In addition to the improvements I mentioned above, we‘d also love to see the option for even more granular analytics. Which store search keywords led to conversion improvements for specific treatments, and also being able to analyze further by region (not just by store language)? This would significantly improve optimizations for Custom Product Pages, as we could try out more alternatives at once.

First time downloads vs. redownloads, and all the other filters available in other views of App Analytics would be very useful to be able to dive deeper into understanding the impact of different treatments. Right now it's basically a „ok, conversion for this has improved“, without being able to better understand what caused those improvements (and across which user segments).

Product Page Optimization is an amazing tool, however using it currently still feels like a 1.0 version. Adding the aforementioned metrics within ASC would give us a much better understanding of our user intents

|U03HLKHT5A8|:
Thanks Sam.
These are some really thoughtful ideas and suggestions.
Can you also share these through Feedback Assistant: <https://feedbackassistant.apple.com/new-form-response>

|U03K8FBMZ7B|:
<@U03HLKHT5A8> Absolutely. Expect a Feedback Ticket from me soon :+1:

|U03K8FBMZ7B|:
<@U03HLKHT5A8> FB10133443 (Improvements to Product Page Optimization) is ready for you :)

--- 
> ####  I really struggle with performance in App Store Connect - is this an issue on the team's radar? Is there anything I can do on my end to speed load times up?


|U03H3LTMBL7|:
Thanks <@U03KD8SLYPJ> for your feedback! We’re committed to improving performance, and welcome any feedback.

Can you please file a Feedback Assistant with specific issues you’re seeing on this?

<https://feedbackassistant.apple.com>

|U03KD8SLYPJ|:
Thanks, I can certainly do that! I find I have to wait for pretty much any page in App Store Connect to load, although I think I’m most frequently annoyed while waiting for the index page of apps to populate, or dealing with the lag while working through TestFlight screenshot feedback.

|U03KD8SLYPJ|:
Filed as FB10115233

--- 
> ####  Is there a way to see watchOS versions an app has been installed on? I can see iOS versions, but not watchOS. Thank you! 


|U03HJ817Y3V|:
Thanks for the question, usage metrics such as installations are currently not available for watchOS apps in App Analytics.

|U03JJQ3BMB7|:
Oh, that's too bad. Are there plans to do so? Is it worth filing feedback to request it? Thank you!

|U03HJ817Y3V|:
We can't comment on future plans, but we'd love if you filed feedback as a request!

|U03JJQ3BMB7|:
Created FB10115390. Thank you :blush: 

--- 
> ####  Is it possible to average the ratings of all countries to make each country rating instead of dividing the app ratings by country? We would like to expand our app globally, but with the current algorithm, it is difficult to raise each rating in each country.


|U03HLKHJ8BW|:
Thanks for sharing that idea! We’d appreciate if you could share your idea and use case with us through Feedback Assistant!
<https://feedbackassistant.apple.com/new-form-response>

|U03JKEJ91S8|:
Thanks for the response! I have submitted it for feedback.

|U03HFAWFQ13|:
Thanks Akito! Feel free to share your feedback number here so we can track it.

|U03HLKHJ8BW|:
+1. Thanks so much, Akito!

|U03JKEJ91S8|:
Thank you!
That feedback number is FB10115182.

--- 
> ####  Is it possible to edit a testers name or email through App Store Connect. We did a csv import a while ago and some of the names are either missing or don't match the email.


|U03H3LTKF8F|:
Tester name are not editable. We’d appreciate if you could share your use case through Feedback Assistant: <https://feedbackassistant.apple.com/new-form-response>

|U03KH907MME|:
Will do!

Our use case is just that humans sometimes make mistakes. :smile:

--- 
> ####  We have urls a user can share with friends to invite them to use our app. They're universal links that contain a referral code so they will open the app if installed. If the app isn't installed we redirect the user to the App Store to install but the referral code is lost in redirect/install. Do you have any recommendations for how to pass a referral code to an app that was just installed from the app store? I've heard App Clips could possibly be used.


|U03HLKHJ8BW|:
Hi Craig! Thanks for the question. We don't have the right folks in this lounge at the moment to answer that question but we recommend connecting with other developers in the Developer Forums. I see other posts there about universal links with responses from developers or others at Apple. Hope that helps!
<https://developer.apple.com/forums/>

--- 
> ####  A question about marketing….  There are a lot of new software APIs and evolving ideas on how to best write software for Apple platforms - and I’m wondering if the same is true for marketing.  I think App Clips is a great fit for our new app, and I’ve heard about other stuff like AppStore events.  Can anyone here comment on what marketing techniques they find to be the most exciting, the most promising???


|U03HLKHJ8BW|:
Bonjour! Here's a list of tools to promote your app in App Store and across Apple marketing channels which includes App Clips, Custom Product Pages, In-App Events, and more: <https://developer.apple.com/app-store/promote/>

Additionally, you can connect with our business and marketing experts in our App Store business and marketing labs which are running through the rest of the week :briefcase: :chart_with_upwards_trend: <https://developer.apple.com/wwdc22/labs/>

--- 
> ####  SUPER IMPORTANT QUESTION!  I’m in the process of submitting my app for review - and one of my autoRenewable subscriptions isn’t appearing in the “Add In-App Purchases or Subscriptions” dialog box.  It’s listed as “Developer Action Needed” inside of the Subscription Group where it is defined - although there is NO indication of what action I need to take.  Help???


|U03HFAWFQ13|:
Hi James! This question is probably better suited for the App Store Review lab happening both tomorrow or Friday. They can talk to you about your specific scenario and what needs to be addressed.

If you sign up it would be great to include your app link in your appointment notes so the team can come prepared with as much information as possible.

--- 
> ####  Dumb question:  if my app uses CoreData and CloudKit - is that by itself reason enough to have to say “YES” to encryption?


|U03H3LT7YSK|:
Hi James, this is a _great_ question!

CloudKit makes secure network calls. To understand how to best answer these questions, please refer to this App Store Connect help page: <https://help.apple.com/app-store-connect/#/dev88f5c7bf9>

|U03J1UGE04B|:
Whoops - sorry didn’t see the answer to this before I submitted my similar question

|U03J1UGE04B|:
With Dictation going from on server to on device it seems like this answer would be changing with iOS 16. The call to Siri was an encrypted channel and now it wouldn’t be

--- 
> ####  A few questions about the new "SKAdNetwork postback testing" feature: 1. What "other properties" can be customized in the postback?  Any/all postback values?   2. Is the postback URL validated in any way? Can we use any URL, or does it only work for the URL of the specified registered adNetworkIdentifier, or developer endpoint via NSAdvertisingAttributionReportEndpoint? 3.  Is there a way to identify a test postback vs a real one received by the URL?


|U03HBKR584E|:
Hi Jonathan! These questions are better suited for StoreKit labs or <https://developer.apple.com/wwdc22/110759|Q&amp;A: StoreKit and In-App Purchases>. The team can talk to you about your specific use cases. If you sign up, it is always great to include your app link in notes so they come prepared with as much information as possible.

--- 
> ####  Does the new web-to-app support in SKAN 4.0 work only for clicks in Safari, or are other browsers also supported?


|U03JFDN0D88|:
Hello Alexander, at present web-to-app support is only planned for Safari. More information about this will be published as we move closer to the release.

|U03JGCP2C02|:
This is very helpful info. Thank you for confirming!

|U03JFDN0D88|:
Of course!

--- 
> ####  Is there a new parameter in the SKAN 4.0 postback to differentiate between clicks coming from web and app sources?


|U03JFDN0D88|:
Hello Alexander. Yes, there will be a parameter in the postback to assist you in telling whether it came from an app origin or a web origin.

|U03JGCP2C02|:
That's excellent! I don't think I've seen an example of the new postback format yet...is that coming in the updated documentation soon?

|U03JFDN0D88|:
Yes, this will be coming in the updated documentation.

--- 
> ####  Do parameters controlled by Crowd Anonymity (source ID, source app ID, conversion value) all share the SAME three levels (low/medium/high), or is it possible for each parameter to fall into a different level? For example, could a first postback have the fine-grained conversion value, but only two digits of the source identifier?


|U03JFDN0D88|:
Hello Alexander. We are unable to share specific details about Crowd Anonymity levels at present.

The levels and how they affect the different privacy controlled fields are set in a way as to best protect the user's privacy.

--- 
> ####  Will SKAN 4.0 be available on iOS 16 only, or will it also be coming to earlier versions of iOS?


|U03JFDN0D88|:
Hello Alexander, SKAN 4.0 will be available later this year.

At present we do not plan to bring it to earlier iOS versions.

|U03JGCP2C02|:
I'm sure it's too much technical work to back-port it, but I can promise it would save a LOT of headache if that's ever a possibility. The new 4.0 functionality is really an improvement, and there's always a chunk of users that don't upgrade.

|U03HJ8HUYQJ|:
Hi Alexander, thank you for the feedback.

If you feel compelled to file this request in Feedback Assistant, it will get routed to the appropriate team.

<https://feedbackassistant.apple.com/new-form-response>

--- 
> ####  Is it known yet whether SKAN 4.0 will be included in the initial iOS 16.0 release, or coming later in the year?


|U03JFDN0D88|:
Hello Alexander, SKAN 4.0 will be coming later in the year.

|U03HJ8HUYQJ|:
Hi Alexander, thanks for all your questions about SKAdNetwork.

Have you checked out this year’s WWDC session? Nikhil here is the presenter and he covered a lot of ground! :raised_hands:

<https://developer.apple.com/wwdc22/10038>

|U03JGCP2C02|:
<@U03HJ8HUYQJ> I've actually watched it multiple times — I think it's one of the best sessions I've seen from this year's conference, and my questions are mostly around clarifying some specifics our team wasn't certain about after that session.

I really appreciate you and <@U03JFDN0D88> taking the time to answer these. It's very helpful, and we're grateful for the work you're doing to improve SKAdNetwork :bow: .

|U03JFDN0D88|:
Thank you for the kind words Alexander and thanks for coming on this journey with us! :slightly_smiling_face:

--- 
> ####  Is the Crowd Anonymity level set once for all three SKAN postbacks, or is it possible for the level to change (go up...or even down) after the first SKAN postback and before the second or third postback?


|U03JFDN0D88|:
Hello Alexander, sorry but we are unable to comment on this at present.

--- 
> ####  Is there a breakdown available for how the source app ID parameter will be affected by the three levels of Crowd Anonymity?


|U03JFDN0D88|:
Hello Alexander, beyond the ideas of
1. not meeting Crowd Anonymity Threshold -&gt; No source app ID sent
2. meeting the threshold -&gt; Source app ID sent
we cannot provide further details about the levels and their interaction with source app ID at this time.

|U03JGCP2C02|:
Thanks for the answer. Just to clarify, I was wondering what happens now that there are _two_ different thresholds in SKAN 4.0.

Or are you saying that for source app ID, there is still just one threshold?

|U03JFDN0D88|:
There are different thresholds that can dictate the presence or absence of the source app ID. We are unable to provide more specific information concerning the thresholds themselves at this point.

--- 
> ####  You don't think we can talk about the future, but will cryptocurrencies be added to the payment method?


|U03HJ8HUYQJ|:
Hi Yukio, thank you for question. We cannot speak to future plans but you can always track the latest news and announcement here: <https://developer.apple.com/news/>

--- 
> ####  I develop a universal app (for iOS, iPadOS and macOS) with a subscription-based business model. I currently offer a single subscription level (with monthly and annual durations) that unlocks access to all features on all platforms.  Since there are some users that use my app only one platform I'm considering if it wouldn't be better to have two levels of subscriptions: 1) lower priced one unlocking all features only on a single platform (iOS+iPadOS or macOS) and 2) a more expensive subscription providing access to everything on all platforms. Is that kind of setup allowed or do you have any other recommendations?


|U03HB36192B|:
Hello! This type of setup is allowed. You can use ranked subscriptions, with your multi-platform being the level of service, and the other option for each individual platform being a lower tier.
This article has more information:
<https://developer.apple.com/app-store/subscriptions/#groups>

|U03JEKM4LFK|:
Awesome! Thanks for replying.

|U03HB36192B|:
No problem! :slightly_smiling_face:

|U03HLKHJ8BW|:
Hi <@U03JEKM4LFK>! Another tip: Make sure to create these tiers within the same subscription group in App Store Connect to ensure customers have the ability to upgrade, downgrade or cross-grade between them. Note that if you choose to offer multiple tiers, each one will need to provide ongoing value and a continually innovated experience. For more information please see App Review guideline 3.1.2(a) for more information about creating a great subscription experience - subscriptions must be available across all of a user’s devices. Thanks, and enjoy the rest of WWDC!

--- 
> ####  We're building a game and planning to offer in-game currency for our players as a means to purchase extra "lives" and retry. Is there any StoreKit APIs that support keeping track of in-game currency balance for the player? If not, what is the recommended way of implementing such feature?


|U03HU1RS59S|:
Apps must keep track of consumable transactions on their own since they are not included in the unified app receipt or using the transaction history APIs after they have been finished. The data can be stored in any number of ways, including CoreData, CloudKit, or just setting a user default. For the best user experience it's recommended the in-game currency balance is synced to a server to allow customers to use it across devices and not lose it if the app is deleted and reinstalled.

--- 
> ####  With StoreKit2, is it possible to know if a consumable purchase was ever made in the past? I have a tip jar in my app and would like to know if a user has ever made a tip.


|U03HU1RS59S|:
Apps must keep track of consumable transactions on their own since they are not included in the unified app receipt or using the transaction history APIs after they have been finished.

--- 
> ####  if our app is offered to iOS 14+ users but we choose to use StoreKitV2 which is iOS 15+, and only offer in-app payments/subscriptions to iOS 15+ users, will our app store review have any issues? Will our app be rejected because of that? Thanks!


|U03JH7N0KSS|:
Hi Edward - Yes, you can choose to offer in-app purchase using StoreKit2 for iOS15+. Ensure your app is following guideline <https://developer.apple.com/app-store/review/guidelines/#business>

--- 
> ####  How long will StoreKit 1 be supported? We are attracted to StoreKit 2, but our apps have been running for nearly 10 years and we have built a system that is not easy to switch to.


|U03HJ8HUYQJ|:
Hi Maho, thank you for question. We cannot speak to future plans but you can always track the latest news and announcement here: <https://developer.apple.com/news/>

|U03HVBUV0KY|:
Thanks for the answer!
I expect a long support ...

|U03HU1RS59S|:
StoreKit 2 is designed to work well alongside the legacy StoreKit API so your app can use features of StoreKit 2 while keeping your previously-built system in place.

|U03HVBUV0KY|:
ok, I still don't feel like it's an easy transition, but I'll try to replace it bit by bit!

|U03HJ8HUYQJ|:
Hi <@U03HVBUV0KY> when you have some time, we have a couple great sessions discussing StoreKit 2 and Original StoreKit:

&gt; <https://developer.apple.com/wwdc21/10114>
&gt; <https://developer.apple.com/wwdc22/10007>

--- 
> ####  Is there sample code on how to verify a StoreKit2 JWS server-side? Either in Swift, or in other popular server languages.  The x5c claim isn’t very widely used outside StoreKit in my experience &amp; there’s a fair amount of misinformation online about it. Specifically I’ve seen a number of people suggest only validating the first or last certificate in the chain. Which … isn’t right. Many JWT libraries don’t support it either.


|U03J49S9XHP|:
Hello! This is covered with some detail in the following session, at the timestamp linked here: <https://developer.apple.com/videos/play/wwdc2022/10040/?time=641>

|U03J1UX2CQK|:
Oh wonderful, I hadn't seen that session! Thanks!

|U03J1UX2CQK|:
<@U03J49S9XHP> This session is awesome! I haven't watched it all yet, but I'm having trouble finding the documentation referred to at this timestamp (<https://developer.apple.com/videos/play/wwdc2022/10040/?time=893>) "Please refer to the App Store developer documentation for complete instructions on verifying an x5c certificate chain using OpenSSL." Can you point me in the right direction?

|U03J1UX2CQK|:
(PS in case you're the same Gabriel T who's presenting that video: thank you for such an in-depth session!! This will help me so much in adopting StoreKit 2 &amp; improving our app's subscription performance by skipping the external HTTP call)

|U03HJ8HUYQJ|:
Hi William — it is the same Gabriel :slightly_smiling_face:

|U03HJ8HUYQJ|:
Also –– we will check on that documentation URL getting linked to Gabriel’s WWDC22 session. Please check this session’s page in the Developer app again in the future. :raised_hands:

|U03J1UX2CQK|:
Wonderful! Thank you for being so helpful!

|U03J49S9XHP|:
<@U03J1UX2CQK> I'm so happy to hear that! If you have any additional feedback on anything that might be helpful, please file a Feedback ticket and let me know

|U03J1UX2CQK|:
StoreKit2 is seriously everything I was wishing for in all my years with `/verifyReceipt`. I only wish I could go back and use StoreKit2 when I first developed for StoreKit subscriptions back in 2018.

<@U03J49S9XHP> My big piece of feedback would be that sample code with popular server-side languages and/or server-side Swift would be greatly appreciated. Here's my feedback on that from earlier this year: FB9842697. Your session (and maybe that documentation, once I find it) definitely close much of the gap, but I think actual demo implementations would be helpful.

And since I've got you here, might as well be greedy with my suggestions: server-side libraries for interacting with the App Store server APIs &amp; decoding JWS, etc. would be super cool (FB10161931).

|U03HJ8HUYQJ|:
Hi William — we appreciate your feedback and thank you for sending those 2 FB numbers! :raised_hands:

|U03J49S9XHP|:
Thank you so much for the feedback, William! I am also quite happy to hear that.

--- 
> ####  Hi all! Are the new testing features also available for Apple Watch apps?


|U03J49LAG3B|:
Most of the features in StoreKit Testing in Xcode are supported on Apple Watch on real devices and the simulator. Of course features that are normally not available on watchOS, like the refund request or offer codes APIs, are not supported for testing on watchOS.

|U03JMMN8659|:
Ok, thank you <@U03J49LAG3B>! I already submitted feedback (FB10124699) that we need offer codes to be available on all platforms. This will really unlock their power

--- 
> ####  Is there is way to test a subscription offercode with the sandbox subscription?


|U03HB36192B|:
Offer code redemption is not supported in sandbox, please submit feedback using Feedback Assistant for any enhancement requests.

Testing offer codes is available in StoreKit Testing in Xcode though, and with the new App Store Connect syncing feature, it even syncs offer codes set up in App Store Connect to a StoreKit configuration file! Check out this year's WWDC session to see it in action:
<https://developer.apple.com/videos/play/wwdc2022/10039>

--- 
> ####  We've been trying to implement offers for user who cancel their trial and we couldn't get them to work.   The flow would be: user starts a trial - cancels trial - an offer gets shown.   What would be the best way to implement this flow since our experience has been that if someone cancels a trial, they cannot claim a promo offer?


|U03HRLNQ5JN|:
Customers are eligible for a promotional offer only if they are a current or previous subscriber. Free trials, even if cancelled, should count for this requirement as a current or former subscription. If you experience issues with this, please file feedback at: <http://feedbackassistant.apple.com>
For more information about Offer Types, see here:
<https://developer.apple.com/app-store/subscriptions/#offer-types>

|U03J4DHSQ0L|:
<@U03HRLNQ5JN> Thanks Ian

|U03HRLNQ5JN|:
Sure thing!

--- 
> ####  Our company has 8 brands, each one catering to specific user groups with different needs.  We would like to have the same underlaying app development for all brands and publish them as different apps in the App Store. With pertinent UI customizations to match each brand, but keeping the same overall UX.  Due to rule "4.3 Spam" from App Store Review Guidelines we are currently forced to have a single app publised in the App Store for all of our bands. And then users needs to choose a brand after install.  This provides a diminished experience for our users because it's important that users can discover our apps by themselves in the App Store. Also, as need to include information for all brands, all users see information that is not relevant to them and can be confusing.  The addition of Custom product pages may alleviate the situaion but is not ideal as it does not really help with discoverability within the App Store.  We are aware of the need to have rule "4.3 Spam" keep the App Store a safe place and to provide the best experience to our users.  But we would also work with Apple to find a way to be able to offer our users the best possible experience by providing them separate published apps in the App Store with different Bundle IDs. And thus providing the best journey for users since even before they install our apps.  Thank you!


|U03JH7N0KSS|:
Hi Xavier - Thank you for your question. We would request you to discuss your options with App Review directly. You can reach out to them using link: <https://developer.apple.com/app-store/review/>

--- 
> ####  Our app uses a green tint color. Now when I present an SKStoreProductViewController with that tint color, the App Store page is only halfway tinted. I've reported FB9388616 in July last year but so far the bug isn't fixed. Can you get this fixed in iOS 16?


|U03HJ8HUYQJ|:
Hi <@U03J4J6MMK8> - thank you for the feedback &amp; the FB number. Currently this is not supported. We value your feedback and will provide this as an input to our teams.

--- 
> ####  Is there any restriction around what kind of company is eligible to register for SKAN and use the new web-to-app functionality? For example, could an affiliate network register as an 'ad network' and enable their links for SKAN web-to-app attribution?


|U03JFDN0D88|:
Hello Alexander, the eligibility requirements are the same as today for registering to use SKAN. The new web-to-app functionality does not add any different requirements on the registration process.

|U03JFDN0D88|:
More information about the specifics of what ad networks need to do in order to implement the web-to-app flow will be available later this year.

|U03JGCP2C02|:
Thank you!

--- 
> ####  In SKAdNetwork v4.0, can we get a full list of the possible fields (including the sequence indexes for example)? Are any of these not included in the “attribution-signature” field, such as the conversion value in previous versions?


|U03JFDN0D88|:
Hello Eran, the full set of fields and updated signature compositions will be made available along with the documentation that is set to come out later this year.

--- 
> ####  Is it possible for legacy StoreKit and StoreKit2 APIs to co-exist, and listen to transactions at the same time?


|U03HU1RS59S|:
StoreKit 2 is designed to work well alongside the original StoreKit API so your app can use features of StoreKit 2 while keeping your previously-built system in place.

|U03HZ2VBE21|:
How does that work if listening to transactions at the same time? Who gets notified of a new payment first? If I call 'finishTransaction' on legacy StoreKit, does that affect the StoreKit2 observer?

|U03HU1RS59S|:
Calling `finishTransaction` on the original StoreKit API will not affect the StoreKit 2 Transaction listener.

--- 
> ####  Is SKAdNetwork expected to be included in the iOS16 release, or will it likely be added in a later version?


|U03HJ8HUYQJ|:
Hi Eran, SKAdNetwork 4.0 will launch later this year.

Have you checked out <@U03JFDN0D88>’s WWDC22 session?

Full of great information :raised_hands:
<https://developer.apple.com/wwdc22/10038>

--- 
> ####  Is the web-to-app support in SKAdNetwork 4.0 supported by all browsers, or only by Safari? Does the WebView UI support it as well?


|U03JFDN0D88|:
Hello Eran, at present our plan is for Safari support. More information about this will be made available along with our documentation release later this year.

--- 
> ####  For the new web-to-app functionality in SKAN, does the link click need to come directly from user interaction with the URL (like a Universal Link), or can it be any request that leads from the SKAN link directly to the App Store page? For example, can the SKAN link be redirected to via javascript or a 301 redirect?  (I tried to send this earlier, but I don't think it went through — I apologize if it's a duplicate!)


|U03JFDN0D88|:
Hello Alexander, it has to be a direct user interaction with the URL.

|U03JGCP2C02|:
Thank you for clarifying. That makes sense, though I imagine it could also slow down adoption :disappointed:

|U03JFDN0D88|:
That is excellent feedback Alexander

Could we trouble you to file it as a feedback to us?

<https://feedbackassistant.apple.com/new-form-response>

|U03JGCP2C02|:
Of course! I have done so.

|U03JFDN0D88|:
Thank you!

--- 
> ####  I’ve just included an App Clip in my binary.  Since my app is SwiftUI based, I’m using the .appStoreOverlay(isPresented:) binding.    Question:  do I need to incorporate the AppClip code in my app binary, or is that something that is configured in AppStoreConnect?


|U03J49LAG3B|:
Since App Clips are separate targets when building in Xcode, you can include code in your App Clip that is not included in your app’s main binary and vice versa. Check out this article and related documentation for best practices on building App Clips:
<https://developer.apple.com/documentation/app_clips/creating_an_app_clip_with_xcode>

--- 
> ####  Is there a possibility to see app ratings &amp; reviews through the AppStore Connect API?


|U03HBKR584E|:
Thanks for asking! With our 2.0 release coming this summer, we're adding the ability to fetch and respond to your app’s customer reviews. Please check the following session for more details: <https://developer.apple.com/videos/play/wwdc2022/10043/>

|U03HZ4M12AH|:
Wow very happy to hear. Didn't found it it in the docs and haven't watched the session yet!

--- 
> ####  We've had a bunch of users report that opening the subscription management page from our app with `UIApplication.open(URL(string: "<https://apps.apple.com/account/subscriptions|https://apps.apple.com/account/subscriptions>")!)` or the brand-new, super-awesome `try await AppStore.showManageSubscriptions(in: scene)` shows a blank page across iOS versions. Is there anything we could be doing wrong to cause this? Any recommendations for working around this?  (FB9930203)


|U03JH7N0KSS|:
Hi William - Thank you for creating the feedback request. Our team was unable to reproduce your issue. Can you please attach the a system diagnostic log so that our team look into it. Here is the link for obtaining log <https://developer.apple.com/bug-reporting/profiles-and-logs/>

|U03J1UX2CQK|:
Thanks <@U03JH7N0KSS>. The frustrating thing is we can't really reproduce it either :disappointed: But we have screenshots from users showing the issue so it definitely happens! Thanks for the link — I will keep that on hand for if anyone on my team is ever able to reproduce it.

|U03JH7N0KSS|:
Thanks William - Also you can use the instruction from section “Sysdiagnose for iOS” section in the above link.

--- 
> ####  Does the new App Store Connect API 2.0 have a capability to track whether the in-app purchases/subscription offer code redeemed?


|U03JH7N0KSS|:
Hi Velu - To identify successful offer redemption for a customer you can use:

• JWSTransaction: offerType = 3 and offerIdentifier
• App Store Server Notification V2: Type: OFFER_REDEEMED
<https://developer.apple.com/documentation/appstoreserverapi/jwstransactiondecodedpayload>
<https://developer.apple.com/documentation/appstoreservernotifications/notificationtype>

--- 
> ####  How to make promoted In-App Purchase appear on product page (with image)? I added an image in the optional field "App Store Promotion" in App Store Connect, but it still doesn't appear.


|U03J81U9F5E|:
Good question, <@U03JH2L3E59> — In the <https://help.apple.com/app-store-connect/#/deve3105860f|App Store Promotions section> in App Store Connect, you can choose which in-app purchases you’d like to promote by clicking “Edit” and selecting the checkbox next to the reference name of each in the dialog that appears.

Additionally, if the promoted in-app purchase Promotional Metadata state displays as “Prepare for Submission” in the App Store Promotions section, you’ll need to submit your <https://help.apple.com/app-store-connect/#/dev1f52cd4dd|promotional image> for review, before it displays on the App Store product page.

--- 
> ####  Is there a way to get the popularity score of a keyword, ideally via an API or so? Apple Search Ads provides that data through its UI but it's cumbersome to look it up that way. ASO services like AppTweak, App Radar and Appfigures are also providing that data but just for keyword optimization those services are overkill. They all state that the popularity scores they provide are directly coming from you, so I'm curious whether they use a (public) API, scrape the web UI of Search Ads or have some kind of partnership with you to obtain that data.


|U03HLKHJ8BW|:
Thanks for the suggestion, Niels! It's a great idea to share with us through Feedback Assistant! <https://feedbackassistant.apple.com/>

--- 
> ####  I understand plurals of keywords are automatically taken into account. Does this also work for other languages, and to what extend?


|U03HLKHJ8BW|:
Hi Niels, yup we do take plurals into account! You can find other information about how we use keywords on these two pages:
<https://developer.apple.com/app-store/search/>
<https://developer.apple.com/app-store/product-page/>

|U03J4J6MMK8|:
I'd also like to know if pluralization works in non-English languages, too. E.g. in German, pluralization is not as easy as appending an "s", so pluralization rules/dictionaries are needed. The pages mention only that pluralization works, but don't talk about foreign languages at all.

--- 
> ####  When will the "Unlisted App Distribution" become available in App Store Connect?


|U03HLKHMLRJ|:
Thanks for the question, Micha. To create an unlisted app, please refer to <https://developer.apple.com/support/unlisted-app-distribution/>.  Note that while waiting for the request to be reviewed, you will want to set the distribution method to Public (see <https://help.apple.com/app-store-connect/#/dev275598f16>).

More background is in <https://developer.apple.com/videos/play/tech-talks/10892>.

--- 
> ####  Does App Store Connect API V2 have the ability to notify us of App Review reject text?　The best implementation is to be notified to Slack. Developers can act fastest by checking attachments in slack and getting real-time notifications of replies from reviewers. Perhaps we could implement this with a polling operation, but we don't want to damage apple's servers.


|U03HBKR584E|:
This is a great question, but we don’t support webhooks. Polling is the only option at the moment. We also send Push Notifications, if you have App Store Connect app installed.

--- 
> ####  Are there any plans to streamline the process for the new "Unlisted App Distribution" method? Currently, it looks like only the Account Holder can request this setting through a separate form (although that isn't documented anywhere) and only the Account Holder can see the questionnaire and receive feedback on the request.  It would be great if this could just be a setting in App Store Connect like Public / Private distribution.


|U03H3LTELDD|:
Hi Jan, thanks for the feedback! We’ve included details about this in <https://help.apple.com/app-store-connect/#/dev275598f16|App Store Connect Help> under *Make your app available only through a direct link.* We encourage you to share your suggestions with us via <https://feedbackassistant.apple.com|Feedback Assistant>.

--- 
> ####  Is App Store Connect API available for the App Reviews and Ratings?


|U03J81U9F5E|:
Great question <@U03KA56EY3B> — take a look at our response on this similar question here for more information on our updates to the App Store Connect API:
<https://wwdc22.slack.com/archives/C03H49L2CA1/p1654884449205289?thread_ts=1654884442.035649&amp;cid=C03H49L2CA1>

--- 
> ####  Hi there! Are there any plans to fix the bug with the Product Page Optimization Analytics? When you click on "View Anlaytics", a white screen appears without any data. It's not pretty comfortable and easy to find other ways to see the metrics of test screens.


|U03HFAWG5B7|:
We believe this issue should be resolved. If you’re still seeing this behavior from your side, please file a <https://feedbackassistant.apple.com/|feedback assistant> ticket with your app information so we can further investigate.

--- 
> ####  Right now it takes more than 24 hours for an app to come from "waiting to review" to "in review". Can we expedite the app review process by any chance ? (I know we can submit a form and request expedite app review ) Any other way in which the time can be reduced ?


|U03HQC3JZD0|:
In our <https://developer.apple.com/wwdc22/10043|What's New in App Store Connect session>, you'll hear from Will that the majority of apps are approved in 24 hours. We always want to make sure that apps are reviewed as quickly as possible.

Here's a video with tips on preventing common review issues: <https://developer.apple.com/videos/play/tech-talks/10885>

--- 
> ####  App Review is super fast now for production app reviews, which is great. However, app review is typically "slow" (~24 hours) for external TestFlight testers. Besides the fact that it would be nice if external TestFlight review was as fast as regular App Review, one issue is when we have a critical bug, we are able to get an update out to production users quickly (even without needing an expedited review), but it can take ~24 hours for the same update to make it to external TestFlight testers due to the longer review process. It would be really nice to have it such that if an app gets approved for production App Review, if same build is also waiting for external TestFlight review, if that external TestFlight build could get automatically get approved rather than having to wait for a second manual review.


|U03H3LTKF8F|:
Thanks for your feedback. We are constantly looking into improvements to TestFlight approvals. Please create a feedback, if you want to keep track of it: <https://feedbackassistant.apple.com/new-form-response>

|U03J2AD912N|:
Just filed as FB10163456

--- 
> ####  Hello, When I submitted my first app it was rejected because of copyright violations in the metadata. It was the English word memory that is copyrighted by Ravensburger. My game is a pairs game that is different from real memory-game clones, but, what can I do? Actual memory clones are all over the App Store, their visible metadata brimming with "memory" and they all get found after typing "memory". My game, which is different, is not allowed such metadata. Why is that so and where in the process can I get help and advice?


|U03HQC3JZD0|:
&gt; Hi Klaudia, thanks for your question. Please reach out to App Review to discuss further. Details on how to reach them are listed here: <https://developer.apple.com/app-store/review/>


|U03JELM0ZNV|:
Wow! Seems like _combinations_ may help
<https://www.lexology.com/library/detail.aspx?g=de499870-bae0-4391-9404-63316fb7be1e>

--- 
> ####  Is it possible to optimize subscription plans on the product page in AppStore Connect by using different text or image?


|U03H3LTMBL7|:
Hi Roman, the best way to highlight subscription plans on the App Store listing is to use Promoted In-App Purchases. You can have up to 20 Promoted In-App Purchases at a time, each of which would have an image.

Have a look at <https://developer.apple.com/app-store/promoting-in-app-purchases/|this page> for more information about Promoted In-App Purchases, and <https://help.apple.com/app-store-connect/#/deve3105860f|this page> for direction on setting them up in App Store Connect.

|U03JER2C7MX|:
<@U03H3LTMBL7> Yeah, I was wondering if I could make different versions of these purchases, using a different image, title, and description, and compare which one of them performs better, just like it is possible to do with the product page.

|U03H3LTMBL7|:
Hi Roman – thanks for the additional context.

In-App Purchases with <https://developer.apple.com/app-store/product-page-optimization/|Product Page Optimization> isn’t something supported today, but we encourage the feedback and would love to hear your use case.

If you can, please submit feedback using <https://feedbackassistant.apple.com/>.

--- 
> ####  Greetings! Hi the team!  I have two quick questions and wait for your response: 1, For the account deletion regulation, I found in the news that there's a newly-mentioned API: Sign in with Apple REST API. It takes some time for me to connect to this API but the deadline is so close.  So my question is: What would happen if the version I will be submitting on July 1st doesn't come with this API? (other parts about the account deletion are perfect)  2, My company would like to apply for the enterprise account - that's Apple Developer Enterprise Program. However, I heard the membership enrollment is limited per year, and very hard to successfully join in. Is there any advice and tips that can help me better join the program?  Summer


|U03H3LT7YSK|:
Hi Summer! Thank you for the questions.

Regarding #1:
Apps that support account creation are required to let users initiate deletion of their account starting June 30, 2022, as described in <https://developer.apple.com/app-store/review/guidelines/#5.1.1v|App Store Review Guideline 5.1.1(v)>.

Also, please keep <https://developer.apple.com/news/?id=12m75xbj|these requirements> in mind when submitting app updates to your app after June 30th:
• The account deletion option should be easy to find in your app.
• If your app offers Sign in with Apple, you’ll need to use the Sign in with Apple REST API to revoke user tokens when deleting an account.
• It’s insufficient to only provide the ability to temporarily disable or deactivate an account. People should be able to delete the account along with their personal data.
• Apps in highly-regulated industries may provide additional customer service flows to confirm and facilitate the account deletion process.
• Follow applicable legal requirements for storing and retaining user account information, and for handling account deletion. This includes complying with local laws in different countries or regions. As always, check with your legal counsel.
Regarding #2:
Please review this overview of the <https://developer.apple.com/programs/enterprise/|Apple Developer Enterprise Program>. Here you will find eligibly requirements for signing up for this program.

--- 
> ####  Hi, my app was rejected yesterday for not having all the metadata required which I accept however the app is a standalone watchOS app and the screenshot the review team gave us, which was literally a black image, seems to imply the iOS app (which we don’t have because it’s a standalone independent watch app) didn’t have an app icon. Is there any way to solve this? 


|U03HFAWFQ13|:
Hi Hugo. I would suggest responding to your app review rejection message in the App Review section of your app in App Store Connect to discuss any confusion with your app submission.

|U03HZ3L98TF|:
Alright I'll do that thank you 

--- 
> ####  Hi all - I’m still a bit confused about the review process for in-app purchases.  My app needs 4 subscriptions (in one subscriptions group) in order to be happy.  I currently have 1 subscription that’s listed as “Waiting for Review” and 3 which are listed as “Ready to Submit”.  Can I go ahead and submit the app binary (with the 3 subscriptions that are ready) and then add the 4th subscription after (:crossed_fingers:) the binary passes app review?


|U03H3LT7YSK|:
Hi James,

This sounds like a scenario that might be best discussed directly with App Review so that you can ensure all items get submitted and approved correctly.

Since labs and lounges are finishing up, I encourage you to contact App Review using this page: <https://developer.apple.com/contact/app-store/>
