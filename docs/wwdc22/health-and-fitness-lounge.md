# health-and-fitness-lounge QAs
### Lounge Contributors
#### [pol-piella](https://github.com/pol-piella)
#### [emin@github](https://github.com/roblack) / [emin@twitter](https://twitter.com/emin_ui)
#### [shirblc](https://github.com/shirblc)
#### [tikimcfee](https://github.com/tikimcfee)
---

--- 
> ####  Why is it not possible to attach a singular workout location or read the one provided by the Workouts app? Something like a Tennis workout. Of course you can add a Workout Route with a singular location, but that's not the same. Thanks


|U03H90WC03Z|:
Yes, the only way to do this is to save a workout route with one location. And that's what we'd recommend.
Could you file a feedback request to expose the location data that the Workout app is saving?

|U03KJSLF04Q|:
FB9724128 filed 26 Oct 2021

|U03KJSLF04Q|:
A simple API (or WorkoutBuilder) doing this would be awesome. Implementing this ourselves in Apps is a pain.

|U03H90WC03Z|:
So you're requesting something simpler than WorkoutRoute?

|U03KJSLF04Q|:
Yes. Single location. Try comparing a Run workout recorded with Workout vs a Tennis activity for example.

|U03KJSLF04Q|:
StackOverflow with Screenshot: <https://stackoverflow.com/questions/69775617>

--- 
> ####  Is it possible to use the new multi sport workout modes with other combinations than the ones in the Fitness app? For example if I'm building a Tennis app, I might want to add a Stretching segment for warmup, before actually starting the Tennis part. Thanks


|U03HKJ5GQKY|:
That’s unfortunately not possible at this time, only a combination of swim/bike/run activities is supported, or activities of the same workout type. We encourage you to file a feedback assistant feature request explaining your use case for supporting other activities.

|U03HJ7X68HZ|:
<@U03KJSLF04Q> <@U03JAKEV1R8> <@U03JRQHF7T2>  Please drop your Feedback numbers here so we can make a note of them. :pray:

|U03KJSLF04Q|:
Here's mine FB10113451 just filed.

|U03JRQHF7T2|:
FB10113501 :slightly_smiling_face:

--- 
> ####  Will there be an API to attach Weather to a workout? Some like the Fitness app does? Or is it something that we'd have to do ourselves using the new WeatherKit APIs? What are the metadata keys used?


|U03H90WC03Z|:
We have the ability to attach weather metadata to workouts. Look at the "Weather Keys" section on <https://developer.apple.com/documentation/healthkit/samples/metadata_keys>

|U03H90WC03Z|:
You can use WeatherKit to get the information and populate the appropriate keys on `HKWorkout` metadata

|U03KJSLF04Q|:
So no plans for an in-built API in WorkoutBuilder? This question is primarily from times where there was no WeatherKit and getting weather data on the watch would be super painful.

|U03HJ7X68HZ|:
Please file a request for this - you never know!

|U03KJSLF04Q|:
FB9724125 filed 26 Oct 2021

--- 
> ####  Is there a recommended way to add app-specific data inside a HKWorkoutConfiguration? I have an iOS app that’s passing a workout configuration to a watch app to start a HKWorkoutSession, but I would like to add some metadata to it that’s specific to my app’s domain (a workout title, a picture url, etc..)


|U03HKJ5GQKY|:
That’s not possible. To pass data from your iOS to your watchOS app you can use the Watch Connectivity framework: <https://developer.apple.com/documentation/watchconnectivity>

--- 
> ####  Will the Medication adherence data in iOS 16 be available to developers via HealthKit?


|U03HJ8YPPC2|:
That is not currently possible. You can currently read Health Record Medication data. We’d love a Feedback for this!

|U03HJ8YPPC2|:
```
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later
```


|U03KJQYL37A|:
Thanks!

|U03KJQYL37A|:
Ideally we would like to import the adherence log into a provider-facing SMART-on-FHIR dashboard within Epic, so it can be used clinically and to inform clinical decision support algorithms. Will file a Feedback request!

|U03JETJ7UU9|:
<@U03KJQYL37A> thanks for asking this! We had the exact same question. Is it worthwhile to file another feedback? Does that help communicate demand/interest for this API?

|U03KJQYL37A|:
<@U03JETJ7UU9> do you have a similar use case?

|U03HMBQ0KJB|:
To be clear is Health Record Medication data the medicationRecord data coming from FHIR records? In other words,

HealthKit wouldn't allow us to even read the list of medications (rather than the adherence data specifically)

|U03KJQYL37A|:
@Jeffrey we are able to read the medication list from HealthKit

|U03HLLFBYUD|:
&gt; is Health Record Medication data the medicationRecord data coming from FHIR records?
That is correct.

|U03KJQYL37A|:
One thing I'm curious about is whether Medications will read that list? Or it will only contain medications that patients manually input?

|U03KJQYL37A|:
The medication list imported from a FHIR API is often incorrect if a proper reconciliation is not done, so it could be problematic if patients are asked to take medications they are not currently on.

|U03HLLFBYUD|:
<@U03JETJ7UU9> feel free to also file your enhancement request, always helpful to know the quantity of interest

|U03JETJ7UU9|:
Hey <@U03HLLFBYUD>! I spoke with you on Monday at Apple Park. Thanks again!

|U03JETJ7UU9|:
<@U03KJQYL37A> not the exact same use case. Our company helps users afford prescription medication at the pharmacy. Understanding adherence is hugely helpful in assisting a user in that aspect of their health care journey

|U03HLLFBYUD|:
<@U03KJQYL37A> here are the details about the Health Records API: <https://developer.apple.com/videos/play/wwdc2018/706/>
This API does not include medications the user is adding manually in iOS 16

|U03KJQYL37A|:
Thanks <@U03HLLFBYUD>! Was curious if the medications from the Health Records API can be synchronized with the Medications part of the Health app in iOS 16? Or are they completely separate?

|U03KJQYL37A|:
In other words, if we update the medication list in the electronic health record, and the patient imports that list, will they then be able to track adherence? Or will they need to manually input those new medications?

|U03HMBQ0KJB|:
I just submitted FB10112326 on this topic :slightly_smiling_face:

|U03HLLFBYUD|:
<@U03KJQYL37A> best if you try it out on the developer beta, you can even use Simulator and the sample Health Records accounts that have some FHIR medication data. Always happy to receive feedback, please file it and we’ll aggregate.

|U03KJQYL37A|:
Thanks, I submitted FB10112456

|U03JRQHF7T2|:
I can definitely see why you’d want to keep them separate. One is a (hopefully) correct &amp; reconciled medication list from the provider, one is what the patient/user entered.
Would be good to have a way to take it over into the user-maintained list though &amp; then report adherence for that.

I think I’ll file a report for that tooo :thinking_face:

|U03KJQYL37A|:
<@U03JRQHF7T2> that's what I was hoping to have as well!

|U03JETJ7UU9|:
Submitted a feedback here: FB10112795

|U03HLLFBYUD|:
Awesome, thank you all!

|U03JRQHF7T2|:
FB10113501 is submitted :slightly_smiling_face:

--- 
> ####  Is there a way to find out how many workouts in total are stored in HealthKit without loading all HKWorkouts?


|U03J27DKK97|:
Unfortunately there’s currently no way to do this. :disappointed:  You can use the `limit:` argument on queries to avoid loading too many workouts at once, but that isn’t the same as providing a count.  Please file an <https://feedbackassistant.apple.com/|enhancement request>, and we’d love to know what your use-case is to help motivate the API addition.  Thanks!

|U03HJ8YPPDY|:
Hey <@U03J7M8F7CJ>, I’d love to hear what use case do you have in mind?

|U03KJSLF04Q|:
I have one. I show the amount of workouts as a badge for a tab layout. Once I switch my app to pagination this feature would break.

|U03J7M8F7CJ|:
Hey <@U03HJ8YPPDY> &amp; <@U03J27DKK97>
I'm having an app that let's browse through all your workouts. To avoid loading too many workouts I'm showing a "Load more..." Button.
If all workouts have been loaded I just want to hide to button :slightly_smiling_face:

|U03KJSLF04Q|:
Probably lots of other use cases in showing statistics to users.

|U03J7M8F7CJ|:
<@U03KJSLF04Q> I also had that in mind

|U03HJ8YPPDY|:
<@U03J7M8F7CJ> &amp; <@U03KJSLF04Q> — a Feature Enhancement Request from both of you would be great! Please include your individual use cases in the ERs.

|U03J7M8F7CJ|:
Will do that! Thanks <@U03HJ8YPPDY>

|U03KJSLF04Q|:
Here's mine: FB10112328 filed just now

--- 
> ####  will apple ever share its algorithms for calorie counting on various workouts? that would be really cool for app developers so it could be standardized


|U03HJ8YPPC2|:
That is not currently possible, but this is an interesting question. If you had this info how would that help you? What would you do?

|U03J7JKA23F|:
i'm wondering if users would be more into using certain apps if they're consistent with the apple workout app's calorie algorithms. most people who use strava don't like using the strava watch app, they usually use the apple workout app.
and i know each calculation is different right depending on who runs it?
what if you wanted to make an app that enhanced the display of your workouts and knew that apple users all prefer the applewatch workout app and weren't so concerned with making artisinal calories calculation workout apps? just curious

|U03HJ8YPPC2|:
Interesting! Thanks for sharing, I hadn’t considered that.  We’d love a FB for that

|U03HJ8YPPC2|:
<http://feedbackassistant.apple.com>

|U03HJ8YPPDY|:
If an app adopts Workout Builder API on watchOS, it will be able to take advantage of Apple’s calorie counting algorithm, and it will be consistent with the Workout app.

--- 
> ####  Is there a way to add Power (Watts) metadata to a workout? I can see it for workouts recorded with GymKit but I can’t find a corresponding HKObjectType


|U03HUHRGN4U|:
There is no way to add power as metadata in the same way that GymKit does. However, you can save samples of the new type HKQuantityTypeIdentifierRunningPower and add them to your workout. The final workout will be saved with statistics for that type.

|U03JLV0E8RJ|:
Thanks <@U03HUHRGN4U> , that’s very interesting!
Is there anything related for other cardio activities (such as cycling or rowing)?

|U03HUHRGN4U|:
We added a few new data types for running workouts. We do not have anything new for cycling or rowing. If you have some specific metrics in mind for these type of workouts, please file a feedback assistant detailing them.

--- 
> ####  Are the new running stats (like .runningPower) collected and available in real-time to third-party apps that start an HKWorkoutSession with activityType = .running?


|U03HUHRGN4U|:
Yes, the new running metrics are also available for 3rd party applications. If you are using an `HKLiveWorkoutDataSource` attached to a `HKWorkoutBuilder` in your application, the new metrics would be collected by default.

--- 
> ####  Please could you add an api to detect the type of mindfulness session, either breath or reflect?


|U03HJ7X68HZ|:
Great idea! Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>).  And, drop the number here so we can find it. :mag_right:

|U03HMDLD01M|:
Mark, the FB is FB10112689. Thanks 

|U03HJ7X68HZ|:
Thanks!

--- 
> ####  Sometimes by HKAnchoredObjectQuery execute later than the ones of other apps, sometimes both execute hours later than the workout. Is there something wrong with my implementation or can I do something to get my background delivery to be as fast as the other apps? How are they prioritised?


|U03HS66Q399|:
Great question; there are a lot of factors that can delay query results.  Do you mind elaborating on your question a little bit?

Some details that might matter -
• Is there a difference in delay in the `HKAnchoredObjectQuery` results seen on the same device? Have both these apps been launched during this delay, or were they launched before the workout was recorded?
• Is the workout being recorded on the same device as is running the query? Or e.g. is one a phone and the other a watch?
• What is the frequency with with these apps are launched? Are you seeing a delay in the `resultsHandler` or the `updateHandler` ?
• When you say that the both execute hours after the workout, which device are you seeing this delay on and where was the workout saved?


|U03KJSLF04Q|:
&gt; • Is there a difference in delay in the `HKAnchoredObjectQuery` results seen on the same device? Have both these apps been launched during this delay, or were they launched before the workout was recorded?
I'd say my app has been launched more frequently / later than the app whose anchor fires first. I don't know if it matters, my app queries only workouts from my app for a specific workout type, the other queries all apps and all workout types.

|U03KJSLF04Q|:
&gt; • Is the workout being recorded on the same device as is running the query? Or e.g. is one a phone and the other a watch?
Different devices. The use case is showing a notification when the workout is done to reengage on the phone.

|U03KJSLF04Q|:
&gt; • What is the frequency with with these apps are launched? Are you seeing a delay in the `resultsHandler` or the `updateHandler` ?
My app is launched frequently, the other is not.

The code looks as follows:

```
let anchoredQuery = HKAnchoredObjectQuery(
            type: sampleType,
            predicate: compound,
            anchor: anchor,
            limit: HKObjectQueryNoLimit
        ) { [weak self] query, newSamples, deletedSamples, newAnchor, error in
            // show notification here based on arguments
            completionHandler()
        }
healthKitStore.execute(anchoredQuery)
```

|U03KJSLF04Q|:
&gt; • When you say that the both execute hours after the workout, which device are you seeing this delay on and where was the workout saved?
Saved on watch, query on iPhone

|U03HS66Q399|:
There could be different factors that could be resulting in the delay you see here.
1. If either of the devices are locked, that would delay the sync and availability of the health data between a paired watch and phone.
2. The other app may not be using HealthKit queries to receive their notification - any chance they are using the Watch Connectivity framework?
3. The HKAnchoredObjectQuery could be fired for other apps, but the results might still not include the workouts that your app is querying.

|U03KJSLF04Q|:
Thanks for your answer. How the other app is built, I don't know.

I am using both `workoutPredicate` and `sourcePredicate`  so I should only be receiving my workouts from my app. I believe both use HKAnchoredObjectQuery since sometimes the notifications appear at the same time.

--- 
> ####  I'm curious what difference it makes (if any) when specifying that a workout session was indoor or outdoor, say for a tennis workout?


|U03HKJ5GQKY|:
You should make sure to pass in the appropriate location type for each workout, because it can make a difference in how Apple Watch calculates calories and other metrics for the workout.

--- 
> ####  Is there a way to record/get the altitude the workout in HealthKit?


|U03HKJ5GQKY|:
You can use the `CMAltimeter` API to get altitude data from the altimeter sensor, or alternatively use the Core Location framework to get the user’s location and read the `altitude` property of a `CLLocation` object. After getting the altitude using one of these methods, you can save it to a workout as metadata.

|U03KJSLF04Q|:
Is there a standard metadata key to ensure interoperability between apps?

|U03HKJ5GQKY|:
There isn’t, but I think it’s a great idea, and I’d encourage you to file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03KJSLF04Q|:
This is more of a general request. HealthKit is all about interoperability, but it breaks when developers choose their own keys as Strings. This is what I call Stringly Typed.

|U03HJ7X68HZ|:
<@U03KJSLF04Q> <@U03J22YQMK4> bug reports for a convention/rule/dictionary for “standard metadata key” naming in general would be welcome.

|U03KJSLF04Q|:
Here's mine FB10113528 just filed.

--- 
> ####  Could you provide an api to access the high elevation environment property of blood oxygen samples ?


|U03J27DJHA5|:
Great feedback! Could you please provide an enhancement request via Feedback Assistant?

However, you can get the barometric pressure in the sample’s metadata with the key `HKMetadataKeyBarometricPressure`

|U03HMDLD01M|:
Thanks Chris. I did already enter a FB the 15 of February 2022. The FB number is FB9907018

--- 
> ####  When an app is using the sync identifier to update an HKWorkout object and an other app is using HKAnchoredObjectQuery to listen for changes, is HKAnchoredQuery supposed to deliver a delete and an insert of the workout in the same update handler invocation ?


|U03H90WC03Z|:
It could happen in the same or different update handler. But you should be able to see the deletion and insertion. Please test on iOS 16 Beta 1 and In case you're not seeing it, could you file a Feedback?

|U03HMDLD01M|:
I am referring to the existing iOS version. I noticed that the deletion and insertion don't happen in the same update handler, worse they can happen in any order. If you want to mirror Apple Health, I don't understand how you can do it. The update of a workout using the sync identifier is supposed to be atomic, would it be possible that you guarantee that the delete and update happen in the same update handler ? Or provide guidance how to mirror the list of workouts in Apple Health?

|U03H36Z0L79|:
When you observe the deletion, are you using the `UUID` of the delete sample to identify the `HKWorkout` that was deleted? The `UUID` identifies the specific copy of the workout that was deleted, so that should help you keep the data in sync correctly regardless of the order that the events are delivered in

|U03HMDLD01M|:
How do you make the difference between a normal delete of a workout with a sync identifier and a delete because of an update ?

|U03H36Z0L79|:
There is not a way to tell the difference when observing `HKAnchoredObjectQuery` results aside from seeing both events in the same update. Is the problem you're trying to solve that when the new and deleted sample are delivered separately that it causes a momentary disappearance of the workout from the list?

|U03HMDLD01M|:
How do you manage the case where the insert is delivered before the delete? 

|U03H36Z0L79|:
In the case where the insert is delivered before the delete, you would inspect the metadata of the inserted sample and see that the sync identifier of the inserted sample matches the sync identifier of a sample you're already tracking and replace the one you're tracking

|U03H36Z0L79|:
So, to put it all together I would recommend the following when processing the adds and deletes:
• When you see a deletion, check if the sync identifier *and* the UUID match a sample you're already tracking. If they do, stop tracking the copy you have.
• When you see an insertion, check if the sync identifier matches a sample you're already tracking. If it does, replace the copy you're tracking with the new copy.
If you do both of these, you should be able to reliably track changes regardless of the order they are delivered in

|U03HMDLD01M|:
Thanks Allan

--- 
> ####  Is there a way to get a list of HKSources sorted in the user's priority order?  There doesn't seem to be a way to provide a sort descriptor to HKSourceQuery or HKSourceQueryDescriptor, and the natural order of the results doesn't match the data source order shown in the Health app. Is there perhaps a less obvious way to get these sorted by priority?


|U03H36Z0L79|:
There is not currently an API to retrieve sources in priority order for a given data type, but it's a great request. We'd appreciate it if you filed a feedback request describing your use case!

In the meantime, maybe we can provide some alternative ideas. What would you do with the order?

|U03JJ2ZPFTK|:
Thanks! I'll file a feedback and update shortly. I’m interested in being able to respect the same priority order that HealthKit does when working with overlapping samples.

|U03H36Z0L79|:
That makes sense. Is your goal to compute something that can't be computed by `HKStatisticsQuery`? We'd definitely like to know more about that since aggregations implemented in the framework will be more efficient than working with collections of full samples

|U03JJ2ZPFTK|:
I think so. I just submitted FB10113910, will try to update with some notes on use cases.

--- 
> ####  The fitness app always shows a location for a workout even for indoor workouts. Could you provide an api to access this location ?


|U03J27DKK97|:
Great idea!  Could you file an <https://feedbackassistant.apple.com/|enhancement request>?  Adding your technical requirements and/or a description of your use case will help us better understand how to meet your needs; thanks!

|U03HJ7X68HZ|:
…and please drop the feedback number here so we can track it!

|U03KJSLF04Q|:
FB9724128 filed 26 Oct 2021

|U03HMDLD01M|:
Thanks Becky W.  The FB number is FB10113190

--- 
> ####  Let’s say I have an app with two separate Health features for which two separate set of reading/sharing permissions must be requested to the user via HKHealthStore.requestAuthorization. The first request asks for permission to only read runningWalkingDistance. The second request asks for permission to additionally write runningWalkingDistance. I experienced frequent cases in which HK gets “confused” by the second request and doesn’t include runningWalkingDistance amongst the requested HKObjectTypes.  Is this a supported scenario?


|U03H90WC03Z|:
This should be a supported use case but it looks like you may be running into a bug. Could you file a Feedback?
In the meantime, if you request both read/share authorization runningWalkingDistance in the second call, does that help resolve the issues?

|U03JLV0E8RJ|:
I tried but I run into different results with different devices (all with the same OS version). The most frequent outcome is that the RWD is not included in the request list.
Another (less frequent) outcome is that only that object type gets continuously requested for read/write in loop depending by the feature that calls requestAuthorization

|U03JLV0E8RJ|:
I should probably add that one feature is specific to my iOS app, the second feature is provided by its companion watch app (and thus requests to HKStore can be isssued on different devices)

|U03JLV0E8RJ|:
I had a nice Health lab yesterday with <@U03HUHRGN4U> who suggested me to file a report about this issue and forward it to him. Here it is: `FB10158579`
<@U03HUHRGN4U> thanks again for your assistance

--- 
> ####  Is there a way to have an HKWorkout + HKWorkoutRoute recorded via a third-party app show a "Splits" table within the Fitness app?


|U03HUHRGN4U|:
If you are referring to splits for running workouts, unfortunately there is currently no way for a 3rd party application to show those splits in the Fitness app. Please file a feedback assistant requesting this enhancement.

|U03HUHRGN4U|:
Otherwise, please let us know if you are referring to a different scenario.

|U03JCQQ5CRJ|:
That's it. Running, walking, and hiking workouts recorded by the Workouts app will all show a splits table breaking down mile/kilometer intervals

|U03HUHRGN4U|:
Yes, that is also what I was referring to. There is currently no mechanism for 3rd party apps to show that split table.

|U03HJ8YPPC2|:
A feedback would be helpful for this Eric

--- 
> ####  For pool swimming workouts please could you provide an API to access the unit used to enter the pool length? The local of the device is not meaning full, there are pools of 25 yards or 25 meters in the US and there is no way to know which unit was used when starting the workout. Thanks !


|U03H90WC03Z|:
It’s true you can’t tell the original unit from an HKQuantity, you can just get the value for the specified unit. Best option I can suggest is to get the value in both yards and meters and heuristically use the one that is an integral number.

I presume you’re fine displaying pool length in different units based on the workout and not using the same unit consistently for all workouts

|U03HMDLD01M|:
Yes this is exactly what I do! You forgot to mention the special case of a pool length of 33m1/3 as we have in Europe. So this is just a nasty hack. Would it be possible to fix this issue ? In addition third party apps can enter any number….

|U03H90WC03Z|:
33 1/3. Nice! I think a Feedback is in order since we don’t have any such API right now

|U03KJSLF04Q|:
Not only 33 1/3, I know some older pools here in Germany have less than 25m

|U03HMDLD01M|:
I enter a FB on the 20th of November 2017 ! The number is FB5664314. I just updated it now

--- 
> ####  The keynote mentioned that medications could be added to Health via label scanning. Is that built into the Health app? I'm not seeing it in the 'Add Medication' path in Health.  I'm curious if this is available to third party devs in some way.


|U03HJ8YPPC2|:
It is built into the Health app, but is only available in the US currently, and the iPhone must be XS / XR and later. Medication data that is entered through this flow is not available in HealthKit. Although you can currently read Health Record Medication data.

|U03J9H0P9MK|:
Users outside of the US can add medications by typing the medication name, and can also choose to add information like strength and form.

--- 
> ####  Is there a `predicateForWorkouts` for the new multi-sports workouts to select a multi-sport workout?


|U03HUHRGN4U|:
If you want to query for swim/bike/run workouts you can use `predicateForWorkoutsWithWorkoutActivityType:` passing the new activity type `HKWorkoutActivityTypeSwimBikeRun`

|U03KJSLF04Q|:
Ah, I was under the impression that these were modelled as their individual sport types rather than a new composite.

|U03HUHRGN4U|:
Multisport workout are actually represented by a single workout sample that contains `HKWorkoutActivity` objects inside it. For more information on this I suggest you take a look at our presentation: <https://developer.apple.com/wwdc22/10005>

--- 
> ####  Would it be possible to add a metadata for workouts to indicate that a route is attached to it? Since the sync of the route between the Apple Watch and the iPhone happens after the sync of the workout it would allow to know if we can expect a route for the workout ?


|U03HKJ5GQKY|:
It’s certainly possible to add metadata with a custom key for your workouts to indicate they have a route, however HealthKit doesn’t provide any solution for this. I think this is a great idea that can benefit all apps, and would encourage you to file an enhancement request and detail your use case: <https://feedbackassistant.apple.com/>

|U03HMDLD01M|:
Sorry I didn't see the answer 

|U03HMDLD01M|:
I posted again this question 

--- 
> ####  Would it be possible to enable 3rd party apps to trigger an HRV reading?  My app currently instructs users to use the Mindfulness App to take a morning HRV , but it's not great from a support standpoint having to explain to users that they have to use another app to be able to use mine.  I can file a Feedback as well.


|U03HJ8YPPC2|:
That is not currently possible, but yes, we’d love a Feedback.

--- 
> ####  Are there plans for HealthKit to be available on iPadOS?


|U03HJ8YPPDY|:
We’d love to hear what kind of HealthKit apps you would build on an iPad. Please file a Feedback Assistant ticket and post the number here too.

|U03HMDLD01M|:
People would love to visualize their data in a bigger form factor…

|U03JA19544B|:
I filed one yesterday :slightly_smiling_face:. FB10138786: Some use cases include treadmill workouts or being able to review past workout history in the iPad app even though the workout was done on the watch or phone.

|U03JLV0E8RJ|:
Cardio workouts on external equipment would indeed be a very strategic use case for my organization

|U03J1TRADJ7|:
Just filed FB10159346.

|U03HJ8YPPDY|:
All interesting ideas! Thank you so much for sharing.

<@U03HVD0TVD4> <@U03HMDLD01M> <@U03JLV0E8RJ> please make sure to file your <http://feedbackassistant.apple.com|Feedback Assistant> tickets too with more insights into your specific use cases. These are really helpful for our product and engineering teams.

|U03JCC3UM6G|:
I also filed a feedback: FB10160510

--- 
> ####  Hello. Is there a way we can import lab results or vaccinations results for organizations and labs that aren’t yet supported out of the box? i.e. those which are out of the US. Are there any standards which HealthKit is expecting?


|U03HLLFBYUD|:
For COVID lab results and vaccinations we support both the SMART Health Cards and the European Digital COVID Certificate (EU DCC) standards. The import of these is available for all users around the world and users can import these by scanning the respective QR codes. There is no API to write these to HealthKit directly.

|U03HLLFBYUD|:
Please feel free to send us feedback or an enhancement request via our feedback portal at <http://feedbackassistant.apple.com> if you have use-cases that are not covered by what we currently offer.

|U03JPJ277SQ|:
What about other types of stuff? Let’s say a user walks into a lab and comes back with a printed copy of many items. Is there any API related to lab results?

|U03HLLFBYUD|:
For a select set of labs &amp; vitals users can manually add that data to HealthKit, but there is no blanket “add any lab value” option today.

|U03HLLFBYUD|:
In the US, Canada and the UK these labs would flow down to the phone via the Clinical Health Records feature: <https://www.apple.com/healthcare/health-records/>

|U03JPJ277SQ|:
Yeah I’m aware. I was trying to replicate a similar feature for another country.

--- 
> ####  What is a good way when you want to create an app that only adds a small but useful feature to the existing workout app? Extensions for this would be very useful. But what APIs could be used so that the user has the most similar as possible experience as when using the built in workout app


|U03HJ8YPPDY|:
That’s an interesting idea. We would love to get a Feedback ticket with a bit more details on what you’re trying to build.

--- 
> ####  Is it possible to store custom activities in health kit ? (e.g. sports / activities that are not currently listed )   Thank you for keeping the Ask A Question open, it makes a real difference to Devs in different timezones.


|U03HUHRGN4U|:
If you are referring to storing workouts of custom activity types, unfortunately that is not possible, However, we are frequently adding support for new activity types in HealthKit. Please file a feedback assistant detailing the activities you would like to see added.
<http://feedbackassistant.apple.com>

|U03JG3QTSGL|:
Thanks, yes that's what I meant. I will file feedback. On a side note, with the example in the video yesterday swim-bike-run could those activities be any of the currently available ones. e.g. run - swim - fence ?

|U03HUHRGN4U|:
SwimBikeRun workouts can only contain activities of types Swimming, Cycling, Running and Transition. If you have a slightly different scenario in mind we would like to hear about it. It would be a great if you can file another feedback assistant requesting an enhancement and detailing your use case.

|U03JG3QTSGL|:
Thanks again will file a feedback for that too.  Keep up the great work with the changes to health+fitness :)

--- 
> ####  When the watchOS version does not match the iOS version, the workout data generated on the watch cannot be synced to iOS. Can this problem be improved？  Almost every time iOS and watchOS upgrade, I get a lot of user feedback.


|U03HS66Q399|:
Thanks for bringing this to our attention! We would like to understand more about the builds on the devices in this case. What OS versions are the iPhones and Apple Watches on when your users experience this?

We don’t know of a situation where mismatched versions would cause sync failure, so we would definitely welcome a feedback assistant with logs from both devices, both with the Health Logging profile installed.

--- 
> ####  What are the requirements to handle health related data on the server? For example, if I want users to be able to upload their metrics like heart rate, blood pressure, etc. on the cloud so that data can be synced across devices, and to be able to send this information to other users (like physicians)?


|U03HLLFBYUD|:
See our App Store guidelines about Health &amp; Research data, section 5.1.3: <https://developer.apple.com/app-store/review/guidelines/#health-and-health-research>

Section 5.1.1 Data Collection and Storage on that page could also be an interesting read in this scenario.

|U03HLLFBYUD|:
To follow up, we also have a talk on how HealthKit handles synchronization that might be of interest to you: <https://developer.apple.com/videos/play/wwdc2020/10184/>

|U03K50VR0HG|:
thank you for the reply. I wasn't talking specifically about HealthKit data but more so general health related data. As in, 5.1.3 (ii) -&gt; may not store personal health information in iCloud, thats because iCloud servers are not HIPAA compliant?

|U03K50VR0HG|:
What if i were to use AWS for example? Just a normal AWS Datastore

|U03HLLFBYUD|:
I’m afraid that is not something we can give advice on beyond what’s in the App Store guidelines.

--- 
> ####  Are there going to be updates for ResearchKit, especially getting it from Objective-C to Swift etc? We haven't seen a lot of updates, it has been challenging to customize!


|U03HFFXGW15|:
ResearchKit is continuously under development and modernizing the framework for the benefit of our developers is always on our mind. Stay tuned for updates!

Also, we definitely encourage you to file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>).

--- 
> ####  Critical drug-drug interactions: Do you think it would make sense to implement a solution that does list pharmacokinetic interactions and how would you advise me to proceed to implement this e.g. with Health Records in HealthKit?  I understand from your WWDC22 keynote presentation that you already plan to implement critical drug-drug interactions (based on Elsevier data?). There is another highly trustworthy drug-drug interactions data source with an open API here in Zurich/Switzerland originating from the university hospital USZ and my idea would be to use this data in a native app on the iPhone/iPad for MDs (to check the risk of adverse drug events): <https://epha.health/docs/summary/en/|https://epha.health/docs/summary/en/>


|U03J27DL99P|:
The new medications features (including medication interactions) are not currently available by API, and are only available in US. We’d love a <http://feedbackassistant.apple.com|Feedback> for this!
You can currently read Health Record Medication data using the <https://developer.apple.com/documentation/healthkit/samples/accessing_health_records|HealthKit Health Records API>.

|U03H90WP2UF|:
In addition to API availability, I'd like to mention one thing based on your idea: the health records data in HealthKit is for individual patients, hence they may not be well suited to support an app designed for care providers.

|U03JEAD3SQ7|:
:pray: Great to know, thank you. My idea would then eventually better be tested/implemented in the context of CareKit. Questions: What would be my engineering point of view options/guidelines if I would start working on this with the crazy idea that part of my effort might eventually help making the above mentioned “USZ database” ending up in a Swiss based version for medication features (medication interactions) which is currently only available in the US? Or simply put: what can a local independent contributor (Indie) best do to help make an US only feature also available in Switzerland? Is there a formal process that non-employees can contribute to making US only features available outside the US, e.g. in Switzerland? (the US and the Swiss Health system have a lot in common, behind the US, Swiss is 2nd country in terms of health expenditures/capita and also, there are some large local hospitals which are in the process of implementing Epic).

--- 
> ####  How I can get into the Health app featured feed?


|U03HJ8YPPC2|:
Follow our best practices in this link. There is also a “Contact Us” button that you can use on that page.

|U03HJ8YPPC2|:
<https://developer.apple.com/app-store/getting-featured/>

|U03HJ8YPPC2|:
Please call our in your message to the team which Health datatypes you read or write to HealthKit.

--- 
> ####  The new Health feature to enter medications is very nice, but if a person has imported Medications from Health Records, does he/she have an option to also include those as Health medications with timing, alerts, etc?


|U03HLLFBYUD|:
Good question, and you can try this out today with seed 1! If you have medications in Health Records those will be surfaced when you start creating your medication list.

|U03HZ49EE1K|:
Hey <@U03HLLFBYUD>, cool thank you!  (Dave C).  We have been discussing exactly this kind of capability as part of an NIH project.

|U03HLLFBYUD|:
Oh hi!! And great; please do file feedback if you think we could do something differently!

|U03HZ49EE1K|:
My provider uses Epic but has not on-boarded for Health Records, so this is difficult for me to test.  Would this work in the simulator using the 3 sample organizations for Health Records?

|U03HLLFBYUD|:
Yes, the sample organizations in the Simulator have medication data, you can test with these.

--- 
> ####  Related to the location for indoor workouts from earlier today, I also filed a feedback (it was also mentioned I should in the session I had today).  Here is the number: FB10141594 I also found my old feedback with the same topic: FB9810882


|U03HJ8YPPC2|:
Thank you!!

--- 
> ####  Is there a recommended way to fill simulators with test workout data?


|U03J27DKK97|:
Great question!  We struggle with this too; here are the solutions we know of.
• If you haven’t seen the Features &gt; Location submenu, take a look!  it simulates the user doing a variety of workouts. 
• If you start a workout in the Workout app in the simulator, that will actually start a simulated workout.
• Having a dedicated app or pre-fab script that you can trigger to just load in a ton of data custom to your use case is definitely worth the time investment.
• If you have a test account with pre-made data, if you attach the credentials to the simulator, the data will sync down from iCloud
Hope that helps!

|U03JCC3UM6G|:
I wrote a small app to transfer real workouts I recorded with my device to the simulator.
It uses a custom file format. Maybe it helps you: <https://github.com/andre0707/WorkoutTransferer>

--- 
> ####  Is it possible to open Health from my app using a deep link to a specific item, e.g. Steps?  If my app uses Steps (and other) as a health measure, I don't want to have to duplicate Health trends and graphics, but link into Health for detail.


|U03J27DJHA5|:
It’s not currently possible, but please file an enhancement request in <https://feedbackassistant.apple.com|Feedback Assistant>!

--- 
> ####  Do you have recommendations for how to best communicate with the user about cases where they may have denied the app read permission to HealthKit? I'm concerned that my users might be confused if they deny read permission in error and no data is shown, but since apps can't determine if a user has granted or denied read access, I can't really detect that to help them out.


|U03HJ8YPPC2|:
Because health data can be sensitive, users have granular control over what information is shared, and users must explicitly grant each app permission to read and write data to HealthKit.

Your app would not know the status of the permissions granted, but you can consider pointing your users to these locations to toggle their permissions.

|U03HJ8YPPC2|:
To Settings or the Health App.

|U03J1TRADJ7|:
I guess the question I have is about figuring out when to do that. For instance, if I make a request for data and the result set is empty, I don’t know whether to just show an empty set, or to prompt the user to take a look at their settings (because the data set is empty because I don’t have permission). Do you have any advice on best practices for how/when to suggest to the user that they take a look?

|U03HJ8YPPC2|:
Yeah, it’s a good question.  I think if there is an opportunity to show the user that you are not seeing any data, and that it is either because they are not collecting data or it’s a Settings issue

|U03J1TRADJ7|:
Related to that, is there a way to deep-link into the health privacy section of the Settings app? For other settings I’d use ``UIApplication.openSettingsURLString`` but since health permissions aren’t shown there I’ve been looking for another way.

--- 
> ####  I didn’t see where and how you can customize the heart rate zones? Is there an api to access the settings of the heart rate zones?


|U03J9H0P9MK|:
You can customize heart rates zones for the Workout app on your Apple Watch through Settings &gt; Workout &gt; Heart Rate Zones and then selecting Manual.

|U03JLV0E8RJ|:
Is there any API involved with Heart Rate zones?

|U03H90WC03Z|:
Unfortunately this is not possible to access via API.

|U03HMDLD01M|:
Oh no!

|U03H90WC03Z|:
The feature is specific to Workout app

|U03H90WC03Z|:
What would you be thinking of using the data for in your app? Were you looking to create heart rate zones or view zones for saved workouts?

|U03HMDLD01M|:
IMHO the hr zones are not specific to Workout app. Athletes expect to have a single place where their hr zones are defined? Otherwise they will have to define their hr zones in all apps… this is a basic feature for all workout apps?

|U03JLV0E8RJ|:
It would be nice being able to query the current user’s HR zones. The resulting data can be used both while tracking cardio activities and in results reviews &amp; statistics

|U03HMDLD01M|:
 Please provide an api to query the hr zones used for a given workout ? Could we expect it for the iOS 16 release 

|U03JLV0E8RJ|:
I wouldn’t count on it, <@U03HMDLD01M>

|U03HMDLD01M|:
Well if we don't ask…

|U03H90WC03Z|:
:smile: Yes, please file a <https://feedback.apple.com|Feedback> if you haven’t already

|U03HMDLD01M|:
FB10160673

|U03HMDLD01M|:
<@U03H90WC03Z> we trust you for providing this feature request ?

--- 
> ####  Hello the sync of a workout between the Apple Watch and the iPhone is not atomic. Would it be possible to have a metadata in the workout which indicates if a route is or will be attached to it?


|U03HS66Q399|:
Thanks for bringing this to our attention! Would you be able to file a feedback assistant for this enhancement request? We are interested in how you would use this information, so please do highlight that in the feedback assistant as well.

--- 
> ####  My fitness app supports most of the Apple Health workout types.  It appears that the HKLiveDataSource will automatically generate the samples that make sense for the workout type (e.g. distance samples for running workouts). Is that always the case or should I always specifically enable collection of samples I'm want for the workout type?


|U03HUHRGN4U|:
When initializing an HKLiveDataSource, it will always automatically be configured with the default data types the watch will generate during that workout session. You can then customize the data source by adding or removing types, but that is not necessary if you just want the default behavior.

--- 
> ####  Using the new HKWorkoutActivity, is it possible to have a walk/run workout where some HKWorkoutActivity have an activity type of running and others have an activity type of walking?


|U03H90WC03Z|:
That is not possible with the current API. However, we’d love to get a Feedback on how you might use such an API and the kind of app that you currently have or are planning to build. That will help influence us in future API discussions. Thanks!

|U03JA19544B|:
Feedback: FB10138636

|U03H90WC03Z|:
Great! Thank you!

--- 
> ####  Is it possible to deep link to the Apple Health permissions for my app? Right now I need to direct users to it with a somewhat complicated set of instructions.


|U03J27DKK97|:
I’m afraid that isn’t currently possible, but please <http://feedbackassistant.apple.com/|file a feedback> with your use case.  In the meantime, you can always call `-[HKHealthStore requestAuthorization…:]` without fear of over-prompting; HealthKit will only prompt the user if they have not already accepted/denied the request.

|U03JA19544B|:
FB10160130. A common support request resolution requires a user to navigate to the Apple Health permissions for my app to grant a permission that was previously denied.

|U03J27DKK97|:
Makes sense.  Thanks so much for the feedback!

--- 
> ####  Currently, 3rd party sleep trackers can write "In Bed" and "Asleep" data but can't write data for sleep stages (REM, Deep, Light). "Will 3rd party apps be able to write sleep stage data in iOS 16?


|U03HS66Q399|:
Yes, more granular sleep stages will be available to read and write in iOS 16! Please take a look at our HealthKit session “What’s new in HealthKit” to learn more:

<https://developer.apple.com/videos/play/wwdc2022/10005/>

--- 
> ####  I tried several time to query for vo2Max samples in my watch application but all my queries yield no result. The same query on iPhone returns the expected samples. Is this an intended behaviour?


|U03H90WC03Z|:
Could you give more details. Are the VO2Max samples that are being queried beyond the earliest sample date for watch? That is one reason why you may not see data. The watch only has a limited subset of Health data

|U03JLV0E8RJ|:
This is something i was experimenting a while ago but i have a FB for that: FB8959672
If i recall correctly, the vo2Max samples were from a few days (couple of week max) ago.
I didn’t know that the watch has only a time-limited set of Health data though. Thanks for that info!
Is there any way to know how much this subset spans, programmatically?

|U03H90WC03Z|:
You want the earliestSampleDate API on HKHealthStore
<https://developer.apple.com/documentation/healthkit/hkhealthstore/1614166-earliestpermittedsampledate>

--- 
> ####  Is there a way to read any current respiratory data during workout?


|U03J9H0P9MK|:
That isn't currently possible. Apple Watch can measure respiratory rate during sleep. With Track Sleep with Apple Watch turned on, when a user wears their Apple Watch to bed, it will automatically measure and record the number of breaths per minute.

|U03JH7SG139|:
<@U03J9H0P9MK> thank you)

--- 
> ####  Hi! I'm trying to implement HealthKit background delivery on my app and I'm getting an error where the HKObserverQuery updateHandler is getting fired twice in a row: <https://developer.apple.com/forums/thread/707869|https://developer.apple.com/forums/thread/707869>


|U03J27DKK97|:
Good question. HKObserverQuery is intended to be over-eager if needed for best performance. That is - it will over-fire if it would take significant processing power to remove the extra signals. Because of that, our best practice recommendation is that the HKObserverQuery be paired with a separate query that will compute the actual final results, rather than trying to use the information from the observer query in isolation. When your updateHandler fires, you can apply your own heuristics to try to deduplicate, but after that, you should rerun the other query to make sure you get accurate results.

|U03KL9T4MNU|:
I’m also facing this. I am getting duplicates. Can you give me some hint to deduplicate.

|U03JPC7UH9D|:
I do a second query with an Anchored Object but the Observer Query fires so quickly that the anchor doesn’t have time to update :upside_down_face:

|U03J27DKK97|:
Unfortunately there’s no easy or obvious way - if there were, we would deduplicate for you! I meant that if your app has some special knowledge about the samples (like if they are coming from a known app), you might be able to craft a better heuristic than we could.  Without specialized information, I think you will need to redo the base query (preferably narrowed by date as much as possible, to avoid pulling more data than needed) to get an accurate picture of what has changed.

We would love to make the experience better for you; please do file feedbacks with context for your use case.

|U03JPC7UH9D|:
Thanks! I’ll file a feedback :hugging_face:

--- 
> ####  Is there going to be a mapping or property of HKWorkout to the new fitness SFSymbols?


|U03HJ8YPPC2|:
Great idea! Could you file a <http://feedbackassistant.apple.com|Feedback> for such an API?

--- 
> ####  When using HKLiveWorkoutBuilder, does the heartRateRecoveryOneMinute sample get attached to the workout when automatically generated? If so, how can I later retrieve it?


|U03H90WC03Z|:
They are not associated with the workout since it’s generated post workout. The best way to get it is to query for heart rate recovery samples later and match based on timestamps.

--- 
> ####  Hi! I have a question about heart rate variability and respiratory rate. Is it possible to collect current or live values of this types of measurements on Apple Watch, maybe during Workout? Or is there a way to initiate this data collection sessions by a specific schedule and get this data later from HealthKit?


|U03HJ8YPPC2|:
This is not currently possible. HRV is measured opportunistically throughout the day. Respiratory Rate will be collected when the user runs a sleep session.  We would love a feedback on this!!

|U03JH7SG139|:
Thanks for your reply, I'll submit feedback) 

|U03HVD9QKHU|:
So Respiratory Rate can be collected via Background refresh during the night?

|U03HJ8YPPC2|:
your app can read Respiratory Rate that was written to HealthKit after a sleep session

|U03HVD9QKHU|:
Thanks! There are more and more devices doing something during sleep to improve it.Would be perfect to get data when you actually can impact sleep and not the next morning. I know, FB.....

--- 
> ####  Hello again! I had asked earlier about the dark backgrounds used in the workout maps, and the possibility to choose a light background (easier to read!). The change happened after Dark Mode was introduced, and users don’t have options to go light/dark; just dark/satellite view. I asked the same question in the Maps lounge area, and Maryna S (Apple) thought it would be best suited for this discussion area. Still hoping someone in this area will be able to suggest a path forward! Have a good day/weekend.


|U03KCE3N7EV|:
Since the entire app is effectively dark mode all the time, Maps inherits that behavior. We always welcome feedback, so please file a request to have a light mode for the Map.

--- 
> ####  Hello! A few years back, the maps shown with outdoor workouts were placed in a light background. Once Dark Mode was available, the background went dark, and the only other option is to see a satellite view. Is there a way to give the user the option of using a light background? Thanks for your time!


|U03HJ8YPPC2|:
Fitness is designed around a dark background, but you can view your routes on the light map in Health -&gt; Browse -&gt; Activity -&gt; Workouts -&gt; Show All Workout Routes.

|U03J21EKNSE|:
THANK YOU! I was not aware of this area! It’s great to be able to actually see the map info again. 

|U03J21EKNSE|:
I hope you won’t mind, but I think I will send a feedback mentioning it would be good to add a “light background” to the “dark background/satellite” options. It would be good to have it as an option, and not have to hunt for a separate display.

--- 
> ####  What are the requirements to display the distance in the Fitness app for a recorded workout? Are there only specific workout types showing the distance?


|U03JW9X1AAE|:
The recommended approach is to use an `HKLiveWorkoutDataSource` attached to an `HKLiveWorkoutBuilder`, which will automatically associate samples (such as distance) to the `HKWorkout`. While it’s possible to manually associate samples with `[HKHealthStore addSamples:toWorkout:completion:]`, this approach is not encouraged

Even if the `HKWorkout` has associated distance samples, only certain workout types display distance (e.g. walking, running, hiking, etc.) in the Fitness app

<https://developer.apple.com/documentation/healthkit/hkworkoutbuilder>

--- 
> ####  What types of live data can you get during workout besides .heartRate?


|U03HUHRGN4U|:
Data for several different data types will be generated during workout sessions. These could include `.activeEnergyBurned`, `.walkingRunningDistance`, `.heartRate` , etc. The list of types generated will be different depending on the workout activity and its location. If you are using an `HKLiveWorkoutDataSource` to save a live workout the `typesToCollect` property is automatically prepopulated with the set of types generated by default by the workout session.

|U03JH7SG139|:
Thank you 

|U03J21EKNSE|:
Can this be used to gather information in apps that are not directly related to Workouts? Thanks for your time.

--- 
> ####  Hi, is it possible to retrieve (evaluate) the CMDeviceMotion as a non-health app while the Watch display is off or the Watch app is in the background? If not, are there any plans to make this possible?


|U03HJ8YPPC2|:
Can you explain more about your use case?

|U03JEMUM2DP|:
We are looking into implementing utility Apps that users may open/run on their watch and then utilize Hand-Gestures to trigger simple events like Playing a sound from the Watch or maybe even on the iPhone, recording an event with a timestamp or sending a message to a server.
It would be great if we could therefore register a low profile “background service” that would be able to recognize such gestures using the gyro and motion sensors for a set time period since the Watch App was activated. I guess it would be fine if the user could cancel this mode by looking at the watch and switching back to the clock-view.

We don’t plan to use any heart rate measurements or other sensor data that would normally accumulate during a workout at our actual state of development.

|U03HJ8YPPC2|:
Yeah, that makes sense. I can’t think of a way to do that currently.  This would be a good Feedback <http://feedbackassistant.apple.com>

|U03JEMUM2DP|:
Thanks :heart: I’ll file a feedback

--- 
> ####  Any chance HKLiveWorkoutBuilder would make it to iPhone? It would be great for distance tracking, active calories, etc.


|U03HJ8YPPC2|:
We’d love to hear more about your use case, and file a <http://feedbackassistant.apple.com>

--- 
> ####  Is there any trick to getting `HKWorkoutEventType.segment` events generated by our app to show up in the Fitness app? It appears only Apple-generated events appear there.


|U03JW9X1AAE|:
Currently, Fitness will only display segments recorded via the Workout app. However, this is a good idea; please <http://feedbackassistant.apple.com/|file a feedback>

--- 
> ####  If I open the Health app, go to the "Browse" tab and select activity and for example Workouts, it lists a couple of third party apps there. How are these listed apps picked?


|U03HJ8YPPC2|:
Follow our best practices in this link. There is also a “Contact Us” button that you can use on that page.

<https://developer.apple.com/app-store/getting-featured/>

Please call out, in your message to the team, which Health datatypes you read or write to HealthKit.

--- 
> ####  In the Health App, Cycle tracking, Factors section, is it possible to add additional factors to the list ?


|U03J9H0P9MK|:
Cycle Factors currently supports pregnancy, lactation, and contraceptives. While there are many factors that can influence the timing and length of cycles, these have a more predictable impact.

Is there a particular factor that you have in mind that you would like to see supported? Please file some feedback!

|U03JG3QTSGL|:
Hi Cait, thanks for the reply, its specifically for Menopause and Perimenopause.

|U03HJ8YPPC2|:
This is good feedback…thanks Steven.

|U03HJ8YPPC2|:
If you can put this in a FB that would be helpful <http://feedbackassistant.apple.com>

|U03JG3QTSGL|:
Will do Chris, thank you.

--- 
> ####  Will a third party Apple Watch running app generate a v02 max sample automatically if the user does a long enough run? Does the app need to configure anything?


|U03J9H0P9MK|:
Apple Watch can record an estimate of VO2 max during a brisk outdoor run, walk, or hike (and this can be outside of starting a workout). This also applies if your app uses HealthKit APIs to start a workout.

It can take at least 24 hours wearing Apple Watch, followed by several workouts and passive measurements with Apple Watch before receiving an estimate.

Health uses the following information to estimate cardio fitness, which users can enter through Health Details in the Health app: Sex, Date of Birth, Height, Weight, and medications that might affect heart rate.

--- 
> ####  I noticed that some apps are able to plot elevation over distance charts from HealthKit location data. I've tried to do this but when I access a workout route I get access to the underlying locations which contain a date. This makes it possible to do elevation over time but not revelation over distance.  Do you have any tips on how this can be achieved?


|U03JW9X1AAE|:
This should be possible by querying both location and distance samples for the `HKWorkout`, and then combining the samples based on their date. Are you running into any issues querying both location and distance samples?

|U03JRP69BC0|:
Do you know how Elevation Gain is calculated please?

|U03JRP69BC0|:
If I purely add up any positive differences in elevation it ends up about 100x what the apple workout app says it is!

|U03JRP69BC0|:
Ahh I’ve seen they’re wrapping up questions atm so mine might still get answered! :crossed_fingers:

|U03JW9X1AAE|:
<@U03JRP69BC0> the elevation gain question was answered here <https://wwdc22.slack.com/archives/C03H4A4BM4M/p1654882657603589>

--- 
> ####  If I want the complete distance of the swimBikeRun workout, what's the best way to get it?  Something like this?  ``` var distance: Double = 0                 for workoutActivity in workout.workoutActivities {                     distance += workoutActivity.allStatistics[HKQuantityType.quantityType(forIdentifier: .distanceSwimming)!]?.sumQuantity()?.doubleValue(for: .meter()) ?? 0                     distance += workoutActivity.allStatistics[HKQuantityType.quantityType(forIdentifier: .distanceCycling)!]?.sumQuantity()?.doubleValue(for: .meter()) ?? 0                     distance += workoutActivity.allStatistics[HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!]?.sumQuantity()?.doubleValue(for: .meter()) ?? 0                 } ```


|U03HUHRGN4U|:
Your code would do the correct thing, but there is a simpler way. You do not need to iterate through all the activities since the workout sample will have these totals as well.
```
var distance: Double = 0
distance += workout.statistics(for: .distanceSwimming)?.sumQuantity()?.doubleValue(for: .meter()) ?? 0
distance += workout.statistics(for: .distanceCycling)?.sumQuantity()?.doubleValue(for: .meter()) ?? 0
distance += workout.statistics(for: .distanceWalkingRunning)?.sumQuantity()?.doubleValue(for: .meter()) ?? 0
```


--- 
> ####  How is live running pace calculated? Is there any way to calculate it and display as accurately as on the workout app? Mine seems to jump around a huge amount!


|U03H90WC03Z|:
If it’s jumping around, you could try experimenting with the time interval over which you calculate. So look at the trailing 10s/20s/30s of distance samples to calculate speed and see if you get more stable numbers.

Also in iOS 16/watchOS 9, we now have a running speed data type. So that may be even better!

|U03HJ8YPPC2|:
<@U03JA19544B> we saw you had a similar question where this answer may help.

--- 
> ####  How is elevation gain calculated in the Apple Watch please? When I try and compute this myself (taking any positive differences in elevation) the number is ~100x higher than Apple's workout app. It would be nice if this was a metric that was provided


|U03KCE3N7EV|:
It is calculated using altitude from location entries and is incremented when the current altitude is higher than the previous one. These values are in meters. Are you possibly using the wrong unit?
