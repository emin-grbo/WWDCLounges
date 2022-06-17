# cloudkit-lounge QAs
### Lounge Contributors
#### [shirblc](https://github.com/shirblc)
#### [tikimcfee](https://github.com/tikicmcfee)
#### [roblack](https://github.com/roblack)
---

--- 
> ####  Is it possible to have hierarchical sharing for NSPersistentCloudKitContainer in iOS 16? iOS 15 only support zone sharing.


|U03HMJ2P5MJ|:
No. Hierarchical sharing is too limited for the purposes of NSPersistentCloudKitContainer.

|U03HMJ2P5MJ|:
Why would you want hierarchical shares as opposed to simply storing a graph of managed objects that represent your hierarchy in a zone?

|U03JNR9A2GZ|:
I have an app that has a similar structure as Notes. You can have Groups and Lists within the Groups. From what I understand, I can't share a single List without sharing the entire Group and other lists within the Group.

|U03JNR9A2GZ|:
Users may want to share a single List with others without having to put it into a specific shared Group.

I hope that is making sense :slightly_smiling_face:

|U03JNR9A2GZ|:
Hierarchical sharing would allow users to share a single List regardless of it's parent

|U03HMJ2P5MJ|:
That’s not entirely true. You could allow the user to nominate the list and group to share, and then break them apart such that they exist in separate logical hierarchies

|U03HMJ2P5MJ|:
With sharing we often have to break our notion of normalization due to different collections of actors (users) operating on some portion of a graph like this.

|U03HMJ2P5MJ|:
You end up with:

Private:
• GroupA
    ◦ List1
    ◦ List2
    ◦ List3
Shared:
• GroupA
    ◦ List4
    ◦ List5

|U03HMJ2P5MJ|:
Your UI can present all of the lists under a single group, GroupA, but some list items are operated on by the user, some by the user + share participants, etc.

|U03JNR9A2GZ|:
Oh interesting, I wasn't thinking I could separate the UI in that way.

This is very encouraging! I was starting to think I would have to move away from `NSPersistentCloudKitContainer` and write my own sync logic. I'd prefer not to :upside_down_face:

Thanks for the guidance!

|U03JE8T2Z2R|:
do we have to use CloudKit to take advantage of PassKeys?

|U03HMJ2P5MJ|:
&gt;  Oh interesting, I wasn’t thinking I could separate the UI in that way.
I think an NSFetchedResultsController would work with a sectionNameKeyPath of “group” if your list entity identifies its group as a string property, as opposed to a to-one-relationship to a group object.

That way List objects from both stores will show up in the same section of the FRC.

|U03HWU7EYBB|:
<@U03JE8T2Z2R> I just pinged the passkeys folks — there’s no dependency on CloudKit to implement passkeys in your app! You may be thinking of the _user requirement_ to use iCloud Keychain in order for them to use passkeys?

|U03JE8T2Z2R|:
thank you, that's awesome

--- 
> ####  A question about database level CloudKit subscriptions any suggestions on determining which CKZone or CKRecords or record types were modified... we currently have to parse the CKNotification internal json sent from CloudKit to APNS but were hoping for more formal support... much thanks


|U03HJ9HCBFV|:
There's currently no way to see the zones, records, or record types for a `CKDatabaseNotification`. We might be able to provide some of this information in an official API, but due to size limitations we may not be able to guarantee that it's always present. Could you file a bug through Feedback Assistant requesting this?

|U03J1USNBDZ|:
I shall... and thanks for making the best app-centric, field-level encrypted database

|U03HWU7EYBB|:
Don’t forget to provide a Feedback ID here if you’re comfortable doing so! Thanks for taking the time to provide awesome feedback!

|U03J1USNBDZ|:
in which category should FB be?

|U03J1USNBDZ|:
"web services and sdks"?

|U03HJ9HCBFV|:
Choose iOS or macOS, then on the next page it'll have a dropdown for what area you're seeing an issue in. Choose "CloudKit" from there

|U03J1USNBDZ|:
ok

|U03HLLZK136|:
You’ll need to scroll down the list to see it under --SDKS &amp; Frameworks--

|U03J1USNBDZ|:
got it

|U03J1USNBDZ|:
CloukKit API enhancment   FB10081536

|U03HJ9HCBFV|:
Awesome, thanks!

--- 
> ####  Using CoreData with CloudKit. Is it now possible to use constraints with NSPersistentCloudKitContainer? If not, what is the recommended way when importing a large amount of records?


|U03HMJ2P5MJ|:
You should use history tracking to traverse the changes and move them between stores as efficiently as your use case desires.

|U03JCC3UM6G|:
so one local store with constraints and one store set up with CloudKit?

|U03HMJ2P5MJ|:
Yeah, one store that contains your “desired” schema / constraints, and a Cloud store that syncs objects.

|U03JCC3UM6G|:
How do I merge the changes from one store to the other?
I have one entity set up with the needed attributes and a constraints for importing data. All added to the local configuration.
Do I now need to add a copy of this entity without the constraints in another configuration which works with CloudKit?

|U03HMJ2P5MJ|:
Maybe?

|U03HMJ2P5MJ|:
Everyone kind of chooses their own adventure. Sometimes the schemas are different enough that they are different entities. Sometimes they are identical, but one has stricter validation requirements.

|U03JCC3UM6G|:
oh wait. So when importing to the store with constraints, the history tracking will tell me only the items which actually changed? And this is the list I need to loop over to then forward these changes to the CloudKit connected store?

--- 
> ####  I am using an NSPersistentCloudKitContainer to sync private stores. I added a large amount of records on device A and then successfully synced on device B. At some point, I uninstalled the app on B and reinstalled it only to find that most of my data was removed from the store.  Can a new installation inadvertently delete my data? Almost as if the new install told CloudKit "I have nothing" and CloudKit tried to delete things to make it match?


|U03HMJ2P5MJ|:
Uninstalling the app deletes the local store files. Your data will need to download again and this process can take some time.

|U03HMJ2P5MJ|:
NSPersistentCloudKitContainer does not delete data unless you tell it to.

|U03JEL0155X|:
That is my understanding as well. On device A, I parsed a CSV to create NSManagedObjects and CloudKit showed all ~50k records. Then at some point they were deleted and only ~9k remain. No where in my code did I explicitly delete a record. I've only un/reinstalled. :disappointed:

|U03HMJ2P5MJ|:
I mean… did they ever finish uploading from DeviceA?

|U03JEL0155X|:
I believe so. A few times between uploading and reinstalling I had queried CloudKit directly to get the count and it was correct.

|U03HMJ2P5MJ|:
It’s worth a feedback report if you have an uninstall / reinstall scenario that leads to data loss.

|U03HMJ2P5MJ|:
But we aren’t aware of any today.

|U03HMJ2P5MJ|:
We would want logs from the devices through the process I suspect.

|U03HMJ2P5MJ|:
and store files if you can provide them.

|U03HMJ2P5MJ|:
Checking the CloudKit server for the number of records is right, if the count is changing something is telling us to perform operations.

|U03JEL0155X|:
Okay, I'll put that together and make a feedback report. Thanks.

|U03HJA0EJ1G|:
Uninstalled before finishing upload, or stuck before finishing download are both plausible.

|U03JEL0155X|:
What could cause it to get in a stuck state?

|U03HMJ2P5MJ|:
It’s not possible to say without logs. We could offer baseless conjecture but that’s not productive.

--- 
> ####  Question about CoreData+CloudKit. When user is no authenticated then the mirroring from CloudKit Public database to Core Data does not seem to work. Error: Failed to setup CloudKit integration for store. Is that an intended behavior? Can I mirror Public database when user not authenticated? Thanks!


|U03HMJ2P5MJ|:
You should file a feedback report with a sysdiagnose.

|U03HMJ2P5MJ|:
We’ll need to inspect the logs to see if an unexpected error is coming back from the server.

|U03JM8PFK2P|:
Will do, Thanks for the feedback.

|U03JM8PFK2P|:
Feedback Submitted FB10110489

--- 
> ####  Is there a quota for syncing data with an NSPersistentCloudKitContainer? I have found that my app seems to stop fetching data even though I can see there is more in the dashboard.


|U03HJA44L0J|:
User quota is applied when saving records and should not apply when fetching. We'd like to take a closer look, please provide a <https://feedbackassistant.apple.com|Feedback Assistant> report with a sysdiagnose from the device in question.

|U03HWU7EYBB|:
Also a bunch of great labs you could request an appointment to if you’d like to get some one-on-one time to debug an issue in your app:
• CloudKit lab, Wednesday, 10am: <https://developer.apple.com/wwdc22/110673>
• Core Data lab, Wednesday, 1pm: <https://developer.apple.com/wwdc22/110675>
• CloudKit lab, Thursday, 10am: <https://developer.apple.com/wwdc22/110674>
• Core Data lab, Thursday, 1pm: <https://developer.apple.com/wwdc22/110676>

--- 
> ####  Are there best practices for naming entities/columns if you change them?  Ex, include a version number in the column names? (primaryFamilyMemberNameV1, primaryFamilyMemberNameV2)


|U03HJ9HCBFV|:
The best practice often depends on your data model, the types of changes you're making, and what sort of backward compatibility you need to maintain

|U03HJ9HCBFV|:
The names themselves are more for your benefit and remembering which is which

|U03J4BFE17W|:
Thanks

|U03HJ9HCBFV|:
Something like a "v1"/"v2" could work if it's strictly a version bump of some sort, or some sort of semantic name might also make sense, e.g. "name" and "encryptedName"

|U03HJ9HCBFV|:
What sort of changes are you making to the data model?

|U03J4BFE17W|:
Because the names are permanent, over time as we modify/update our model, we might have old unused columns that we have to coach new developers on the history and reason for each column. I was wondering if just appending a version on the column name would be appropriate or wondering if I was missing something obvious.  I appreciate your advice.

|U03J4BFE17W|:
Example, v1 of the app, we store GPS coords in a single string, later in v2 we split them into different columns

|U03HJA44L0J|:
You can't rename existing field once they've deployed into production, so you are free to name the new fields in whatever scheme is most maintainable for your developers. Using `location` and `location_v2` is definitely plausible as is `location-latitude` and `location-longitude`. Just be sure you continue populating the original field if you are maintaining compatibility with older versions of your application.

|U03HJ9HCBFV|:
Ah interesting. Do you need to ensure that the new version of your app syncs properly with the old version? For example if someone has the new version on one device, but the old version on another?

|U03J4BFE17W|:
I do not, I typically block versions of the app that we no longer support. (On launch download a min version string and display a fullscreen upgrade guide)

|U03HJ9HCBFV|:
Nice, smart :brain:

|U03J4BFE17W|:
.. whenever we make breaking serverside changes etc.

|U03HJ9HCBFV|:
That's usually the main worry with things like this, backward/forward compatibility

|U03J4BFE17W|:
Agreed

--- 
> ####  What is the best way to download a default table, edit locally and sync between devices? After download the default, the user only keeps sync for himself. Not needing to upload to Public. I’ve been using Public to create a default DB and when downloaded, using CD to keep sync between devices. Is this right?


|U03HMJ2P5MJ|:
This is typical of a process we call “seeding.”

Clients of NSPersistentCloudKitContainer will download data from the public database to a local sqlite file, and then

1. copy relevant portions of that for user-specific customization
2. Reference it via a foreign key relationship from user-specific stores
Techniques vary, opting for 2 is the most efficient, but 1 offers better sync freshness because the private database is able to sync at a higher rate (via push notifications) than the public database.

|U03HVDF8N6A|:
Thanks Nick. Will try looking for this.

--- 
> ####  Can we import/export data through the dashboard via something like a CSV file?


|U03HLLZK136|:
We don’t support this. But I encourage you to file a suggestion in the Feedback Assistant.

|U03HLLZK136|:
<https://feedbackassistant.apple.com/new-form-response>
Developer Tools &gt; “CloudKit Console” as the area.

|U03JEL0155X|:
Done. :slightly_smiling_face:

|U03HZ1C3YKE|:
Thanks :raised_hands:

|U03HLLZK136|:
Thank you!

--- 
> ####  Is there a better way to view the telemetry usage graphs on the dashboard? Once I mouseover a section (ex Users), if I mouseover any other section I continue to see Users data.


|U03J99655SM|:
The Telemetry application is the only way to view usage graphs. It should be possible to view other sections though when mousing-over. Please can you raise an issue in Feedback Assistant so we can better understand what you’re experiencing.

|U03J99655SM|:
<https://feedbackassistant.apple.com/new-form-response>
Developer Tools &gt; “CloudKit Console” as the area.

|U03J4BFE17W|:
Thanks!

--- 
> ####  Is there an @AppStorage equivalent for NSUbiquitousKeyValueStore?


|U03HJ9HCBFV|:
Not at the moment, but that's definitely a good enhancement request. Could you file a bug through Feedback Assistant to request this?

--- 
> ####  I’ve tried to use UICloudSharingController with SwiftUI, but the init(preparationHandler:) method doesn’t seem to work — it never displays the dialog. As a work-around I’ve had to create an empty share ahead of time and use init(share:container:). While this works, I don’t like creating the share if the user is just going to cancel. Any ideas about how to get this work?


|U03HMJ2P5MJ|:
How are you presenting the sharing controller? It sounds like you mean that it doesn’t present when you use the other initializer?

|U03HMJ2P5MJ|:
Alternatively, is the view controller presenting but encountering an error during the create-share phase? i.e. when your preparation handler is called?

|U03J2019QTV|:
I present it as a .sheet in SwiftUI. It does actually present a sheet, but the sheet is empty and stays that way. The preparationHandler is never called.

|U03HMJ2P5MJ|:
I see. For UICloudSharingController we typically present it like this in swift UI samples:

```
UIApplication.shared.rootController()?.present(sharingController, animated: true).
```

|U03J2019QTV|:
Thank you! I will give that a try. 

|U03HMJ2P5MJ|:
I think if that doesn’t work a feedback report with a sysdiagnose would be the next step

|U03HMJ2P5MJ|:
we can route that to the appropriate team.

|U03J2019QTV|:
I thought that I filed a feedback, but upon checking just now can’t find it. I will definitely file one. Thanks for your help.

--- 
> ####  I see there is a new CKSystemSharingUIObserver in the documentation. How will this be used? Does this somehow replace UICloudSharingControllerDelegate?


|U03HJA44L0J|:
<https://developer.apple.com/documentation/cloudkit/cksystemsharinguiobserver|CKSystemSharingUIObserver> allows your application to receive updates about content shared from your application by the system. You should interface with it much the same way as <https://developer.apple.com/documentation/uikit/uicloudsharingcontrollerdelegate|UICloudSharingControllerDelegate>

|U03HJ9HCBFV|:
You can find more information about the system sharing UI observer in this session:

<https://developer.apple.com/videos/play/wwdc2022/10095/>

--- 
> ####  If I use CloudKit + CoreData, can I still change my data model and add new fields to CoreData once I have gone into production?  Or is that a non-starter?


|U03HMJ2P5MJ|:
Certain types of mutations are supported, generally adding entities / properties.

|U03HMJ2P5MJ|:
<https://developer.apple.com/documentation/coredata/mirroring_a_core_data_store_with_cloudkit/creating_a_core_data_model_for_cloudkit?language=objc>

|U03HMJ2P5MJ|:
There are a number of follow-on documents from there that describe these in more detail.

|U03J22BCM0A|:
Thank you Nick, this is great!

--- 
> ####  What are some of the best sessions, links or resources for Cloudkit?


|U03HWU7EYBB|:
Great question! We’ve got a bunch of WWDC22 sessions about CloudKit this year:
• Optimize your use of Core Data and CloudKit: <https://developer.apple.com/wwdc22/10119>
• What’s new in CloudKit Console: <https://developer.apple.com/wwdc22/10115>
• Meet CKTool JS: <https://developer.apple.com/wwdc22/10116>

|U03HJA44L0J|:
And our top-level documentation is a great place to start: <https://developer.apple.com/documentation/cloudkit>

|U03HWU7EYBB|:
Our documentation and upcoming labs this week are the best resources to figure out anything you need to learn about CloudKit!

|U03J4BFE17W|:
Thanks!!

|U03HLLZK136|:
We have samples on GitHub:
<https://github.com/search?q=org%3Aapple+sample-cloudkit>

|U03HWU7EYBB|:
Great point! Those sample projects are super helpful, and get updated all the time!

|U03HLLZK136|:
This is also a good starting point:
<https://developer.apple.com/icloud/cloudkit/>

--- 
> ####  We're using NSPersistentCloudKitContainer to sync data to CloudKit. It seems to only sync intermittently. Is there any way to force a sync?


|U03HJ9HCBFV|:
There's no way to force a sync with NSPersistentCloudKitContainer, but we'd love to see some logs where the sync is only happening intermittently

|U03HJ9HCBFV|:
Would you be able to install the CloudKit logging profile, reproduce the intermittent sync problem, and file a bug through Feedback Assistant?

|U03HJ9HCBFV|:
Also, we fixed some problems with syncs not happening fast enough in iOS 15.5 (and 16). Are you still seeing issue there?

|U03HJ9HCBFV|:
The logging profile can be found here: <https://developer.apple.com/bug-reporting/profiles-and-logs/?platform=ios>

|U03JRPFE82C|:
Yeah, pretty sure we could still see it in iOS 15.5. I’ll report a problem Feedback Assistant next week.

It seems to only sync when the app is sent to the foreground/background for example. We have a feature where the user modifies data on one device, and we want it to instantly (if possible ofc) reflect on all the devices. Preferably also on Widgets/Complications. :sweat_smile:

|U03JM8PFK2P|:
Thank for the info. I was hoping sync with a public CloudKit database would happen shortly after an app is launched by a user. In practice it might take quite some time to sync. Where sync the other way, from ;a local core data to CloudKit happens very quickly. That's my experience.

|U03HJ9HCBFV|:
<@U03JM8PFK2P> would you be able to file a bug through Feedback Assistant too?

|U03HJ9HCBFV|:
Ideally we could get logs from both the saving device and fetching device along with approximate timestamps of when the data was saved

|U03HJ9HCBFV|:
Syncing in the background is a bit trickier to due competing system resources, but we do attempt to do so if possible

|U03JM8PFK2P|:
Sure, will try to replicate the stated behavior and report. Thanks!

|U03HJ9HCBFV|:
Thanks!

|U03HJ9HCBFV|:
Widgets and complications are an interesting situation too since there has to be a balance of performance and power efficiency with data freshness

|U03HJ9HCBFV|:
That said, there might be something we could do better that we're not doing right now

|U03HJA0EJ1G|:
Widgets are a challenge, because the system doesn't give them much time to do any kind of background network operations

|U03JRPFE82C|:
<@U03HJA0EJ1G> Yeah exactly, we got our core data model in an App Group shared with the main-app. So anything synced by the main-app will be available in the widget. I think. :smile:

|U03HJA0EJ1G|:
Yes, the foibles occur primarily when the app is NOT running.  But if it is, you should see changes from NSPersistentCloudKitContainerEvent and NSPersistentStoreRemoteChangeNotification if you set that up

|U03JRPFE82C|:
So in theory we just need a callback in the main-app. And once it has been synced the main-app could request a Widget re-render. But as said, we need a notification.

|U03JRPFE82C|:
<@U03HJA0EJ1G> Ok, cool! So these notifications don’t init my app if it’s not running?

|U03HJA0EJ1G|:
correct.  The WidgeKit team might have some thoughts but AFAIK you can't get the widget to force the app to launch

--- 
> ####  Can we manually force/request a sync operation of local Core Data from CloudKit when using NSPersistentCloudKitContainer?


|U03HMJ2P5MJ|:
No.

|U03HMJ2P5MJ|:
work is scheduled based on a number of criteria, but there is no manual sync option. If you have feedback regarding sync quality or freshness you can file a feedback report with a sysdiagnose so we can investigate.

|U03JM8PFK2P|:
Thanks. I was commenting in the previous question workflow. Will report back on sync quality. Specifically, how long it takes to sync public database changes when an app is lunched by a user. I understand that a sync of public database does not happen very often. However, an amount of time from a launch to sync is quite important for an overall user experience. Thanks!

|U03HMJ2P5MJ|:
The public database has a much lower expectation of sync freshness. An initial import will be performed immediately for empty store files. However subsequent imports will occur approximately once a day .

--- 
> ####  Is there a way to receive a callback when NSPersistentCloudKitContainer receives updates? We need to update Widgets &amp; Complications on all our devices when the data changes. Not sure how to do or if it's even possible.  We're on watchOS, iOS, iPad OS and macOS. So we need it to work on all these platforms :sweat_smile:


|U03HMJ2P5MJ|:
Clients use one of `NSPersistentCloudKitContainerEvent` or remote store notifications for this purpose.

|U03HMJ2P5MJ|:
You should file a feedback report with your app and detailed instructions for how we can reproduce your desired flow with your widget so we can investigate further.

--- 
> ####  I have many users that report NSPersistentCloudKitContainer returns a 134400 error (as I expose errors in a debugging panel), which I believe corresponds to CKError code 9 (not logged in). I know that MDM or iCloud settings may cause this, but I don't believe this to be the case. Is this likely to be a system bug, or are there are strategies for dealing with errors such as this?


|U03HMJ2P5MJ|:
It’s impossible to say without a sysdiagnose from the affected devices.

|U03HMJ2P5MJ|:
In fact devices on different iCloud accounts maybe experiencing different root causes.

|U03JH1D27C1|:
I’ve filed FB10080487 related to this.

|U03JH1D27C1|:
Can you give any examples of potential root causes, so i can report back to the users if I’m unable to gather their sysdiagnose?

|U03HJ9HCBFV|:
One possibility is that they have the iCloud Drive switch disabled, and that switch also disables sync for apps using CloudKit

|U03HJ9HCBFV|:
There's also a switch underneath iCloud Drive for your app, which might be disabled as well

|U03HJA44L0J|:
<@U03JH1D27C1> regarding FB10080487, we'll need a logging profile installed and a sysdiagnose to triage further

|U03HJ9HCBFV|:
If either of those switches are disabled, you'll get `CKErrorNotAuthenticated` (9)

|U03JH1D27C1|:
Thanks. In these instances the user’s settings all appear fine and other apps sync just fine. This also seems to affect quite a few users, although not super widespread.

As is quite often the case it’s almost impossible to get a sysdiagnose from a user, let alone have them install a debugging profile.

|U03HZ479SGM|:
This combination of switches has been a pain to manage from the usability stand-point.  what *is* iCloud Drive, and why would users want/need to disable it?

|U03JH1D27C1|:
(and it’s not an issue I can replicate)

|U03JH1D27C1|:
Yes, and also, on Mac, the hierarchy is different, where many users don’t have to explicitly turn on iCloud Drive before, which is required before enabling your app.

|U03HJA0EJ1G|:
Settings don't follow the same switches

|U03HJA44L0J|:
Feel free to submit <https://feedbackassistant.apple.com|feedback>, we love to hear your ideas

--- 
> ####  Not a question, purely praise.  I have been incredibly happy with CloudKit/CoreData - it is pure magic, and works wonders.   Kudos to the team.


|U03HWU7EYBB|:
I think everyone on the team loves to hear this! So great that you enjoy CloudKit and Core Data together, and that it makes your app a little easier to build!

|U03JRPFE82C|:
I agree. It removes so much complexity from my codebase. :heart_eyes:

|U03HJ9HCBFV|:
Agree, NSPersistentCloudKitContainer changes sync from a feature that requires months to implement (and years to get right) into a feature you can just enable with a checkbox. Huge props to the Core Data team for the great work

|U03J2019QTV|:
Agree. I was able to remove thousands of lines of code from my app. Thank you!

|U03JFQ1BQMA|:
I've got to agree! It's the first time I'm doing any kind of sync and I've got it to work in about 3 days for a non-standard setup. Changes across devices happen near-instantly. Incredible!

--- 
> ####  Hi Patrick, I watched the What's new in CloudKit console and I have a question regarding Act as iCloud... I tried logging in as "Act as iCloud" but I'm not sure how (or if) I can access a user private database if I need to investigate a bug with his or her data, would that be possible?


|U03HLLZK136|:
That feature is only for looking at other accounts you own yourself and you shouldn’t ask any users for their credentials. It does let you interact with an account’s data, but not encrypted data.

|U03HWU7EYBB|:
~Great question! I think the team has an equally great answer for you!~ Kent beat me to it :stuck_out_tongue:

|U03HZ1C3YKE|:
You might find it helpful to ask for the steps to reproduce the issue from the user. Then using your own account follow those steps and investigate the data using your own account with Act as iCloud.

|U03JK9ZRJJJ|:
Hi guys, thanks for the answer and most of all, all the great work you are doing to put together a great WWDC!!! :raised_hands:

|U03J1V9TNLT|:
I'd prefer if I could just sign in to dashboard with my personal account instead of my developer account.

|U03HWU7EYBB|:
<@U03J1V9TNLT> that’s an interesting idea!

|U03HWU7EYBB|:
What sort of use case would that support that Act as iCloud doesn’t today?

|U03HLLZK136|:
Malcolm, I’d encourage you to file a suggestion with our Feedback Assistant.

|U03J1V9TNLT|:
Sorry for delay, was just trying out Act as iCloud. The problem I've faced for a long time is I'm signed into other <http://apple.com|apple.com> services like forums etc as my personal account. So when I sign into icloud dashboard as my developer account I can no longer use any other <http://apple.com|apple.com> e.g. i can't post on the forums.

|U03J1V9TNLT|:
One way to solve that would be if I could just give my personal account full permissions to access my icloud dashboard developer account. Another way if icloud dashboard sign in could simply be decoupled from all Apple services.

|U03J1V9TNLT|:
But I appreciate now being able to view records created by my personal iphone on CloudKit Dash which was always a bit of a mystery.

|U03HWU7EYBB|:
Definitely agree with Kent, filing feedback with <http://feedbackassistant.apple.com|Feedback Assistant> would be awesome for this enhancement request!

|U03JK9ZRJJJ|:
Perhaps what got me confused and I asked the question is the fact that my personal and developer accounts are the same. Now I understand that if you have different accounts, this feature will definitely be quite helpful!

--- 
> ####  I would like to show the thumbnail for a CKShare with that share.  A) I noticed <http://Notes.app|Notes.app> sends a text with it's CKShare invitation, how can I do that (an can I send an image instead of a text) B) If it's a private API I could use UIActivityViewController, but I would need to show the options (e.g. public or just to specific people) somehow. <http://Photos.app|Photos.app> is kind of doing what I would like to do, but I have not found any API to add even a single button (other than an activity) to UIActivityViewController?


|U03HJ9HCBFV|:
You should be able to add text to the share via `CKShareTitleKey`/`CKShare.SystemFieldKey.title`
<https://developer.apple.com/documentation/cloudkit/cksharetitlekey>

|U03HJ9HCBFV|:
And an image via `CKShareThumbnailImageDataKey`/`CKShare.SystemFieldKey.thumbnailImageData`
<https://developer.apple.com/documentation/cloudkit/cksharethumbnailimagedatakey>

|U03HJ9HCBFV|:
You'd set those values on the `CKShare` itself when saving it

|U03HJ9HCBFV|:
E.g.
```
let share = CKShare()
share[CKShare.SystemFieldKey.title] = "The best share in the world"
```

|U03HJ9HCBFV|:
That text should show up in the message being sent

|U03HJ9HCBFV|:
Although if you're seeing problems with that approach, then let us know

|U03JRP33VR6|:
Of course, but those are part of the tiny CKShare link.
In the image below you can see what the Cloud Kit links look like on my app, and what they looked like before I switched to CKShare.
I would like to show the thumbnail image (that is given but not used by the CKShare link) and post it along side with the Share link)

|U03HJ9HCBFV|:
Ahhh interesting

|U03HJ9HCBFV|:
Could you file a bug through Feedback Assistant to request this type of feature?

|U03JRP33VR6|:
This is what Notes does (sorry german). It sends a text before the link

|U03JRP33VR6|:
I already created a bug, that is why I am looking for an alternative today.

|U03HJ9HCBFV|:
Ah thanks, do you have the feedback number handy?

|U03JRP33VR6|:
FB10037244

|U03HJ9HCBFV|:
And yeah, unfortunately it looks like this is special-cased behavior for notes. It would be nice if this was available for you as well

|U03JRP33VR6|:
I could use UIActivityViewController with two items [image, shareURLItemProvider]. This should do the trick (partly)

|U03HJ9HCBFV|:
Hmm, that does seem like it might work. Does that cause both the image and the share to be sent in Messages?

|U03HJA44L0J|:
There are also some <https://developer.apple.com/videos/play/wwdc2022/10095/|exciting changes> coming in this area

|U03JRP33VR6|:
I noticed that in State of the union, however does that effect what is sent with the invitation link?

|U03JRP33VR6|:
<@U03HJ9HCBFV> I think it sends both (but have not used that in a long time).

|U03JRP33VR6|:
However for adding people (so it not being a public share) I would love to have some options in the UIActivityViewController like Photos does, but I have not found anything about that - seems I again hit a private API wall.

|U03HJ9HCBFV|:
Yeah it would be nice if you could add the photo as well. I'm able to see the feedback (FB10037244), and I'll make sure it gets routed to the right place

|U03HJA44L0J|:
Just to clarify, are you looking to send a predefined message from your app or user provided text?

|U03JRP33VR6|:
I would like to send the preview-thumbnail with the CKShare as it is not utilized by the share link. So that the post is more noticable.

|U03JRP33VR6|:
My current alternative is to create public CKRecord, that has the thumbnail and CKShareLink, and create my own link that nicely represents that share and forwards it to the ckshare link if the user clicks it.

|U03HJA44L0J|:
Got it, the SharedWithYou support currently (Beta, subject to change) allows the sender to provide some text along with the document similar to the Notes example above

|U03JRP33VR6|:
Would that create something like the Notes app does (poste above)?

|U03JRP33VR6|:
Btw. huge disadvantage of that approach is, that probably safari opened first every time one clicks that link - unless I can detect on .htaccess level wether the link is scanned for visual representation or actually being opened (e.g. by user agent :)

|U03HJA44L0J|:
I'd caution that approach, while link sharing is designed to be public saving the `shareURL` in the publicDB means it is globally accessible and may cause unexpected users to join the share

|U03JRP33VR6|:
Absolutely I would simply be an interim approach until the share link can look cool :slightly_smiling_face:

|U03HJA44L0J|:
Understood, we definitely are always looking for ways to improve the experience here. While you are free to customize the behavior as you see fit our generally recommendation would be to use the standard link sharing flow so you can take advantage of any system improvements that are made over time

|U03JRP33VR6|:
I could fully avoid creating the public record, if it was possible to somehow read the thumbnail from the CKShare from CloudKit JS by giving it the ShareURL. Is that possible?

|U03HJA44L0J|:
The thumbnail will be available on the `CKShare` on the `CKShareMetadata` fetched from the `shareURL` via `CKFetchShareMetadataOperation` . As far as I can tell this should also be possible via CloudKitJS

|U03JRP33VR6|:
The question is: Since this is about generating a link the server has no AppleID attached the moment it is trying to get the metadata. Can that even work? For any CKShare or at least for public ones?

|U03HJA44L0J|:
To clarify, do you mean via CloudKit.framework or CloudKitJS?

|U03JRP33VR6|:
CloudKit JS (the Idea would be to create a pretty link by offering my own website (detecting the user agent and thus distinguishing wether a a user clicked on the link (and I thus Foward to the original link) or if it’s an agent trying to generate a pretty web link thus giving back the info for title and preview image.

|U03JRP33VR6|:
I am currently doing that for public CKRecords, but I want to do that for CKShare URLs to make those look prettier.

|U03JRP33VR6|:
Sadly one downside already seems that it has to be a public share I guess - but maybe I can live with that.

|U03HJA44L0J|:
Correct, you can interact with records but not `shareURL` or `CKShareMetadata` and hence you don't have a clear path to access the `CKShare`

|U03HJA44L0J|:
I can say this, we've heard your feedback on how to make the sharing experience via Messages better and very much appreciate it

|U03JRP33VR6|:
Yes once that is implemented I don’t have to worry any more and don’t need to do any coding.

|U03JRP33VR6|:
However I considered doing part of that work anyway, to allow users to play on the web using their AppleID. (so I don’ have to build an android version or such :grimacing:)

|U03JRP33VR6|:
I have not fully understood your “Correct, …” answer. You mean I can access CKShareMetadata IF it’s public, via CloudKit JS without any Apple ID directly from PHP?

|U03JRP33VR6|:
I have not found anything about fetching CKShareMetadata in CloudKit JS documentation. Any hint where to start?

|U03HJA44L0J|:
Sorry for the confusion, CloudKitJS does not currently support accepting shares via a `shareURL` and therefore converting a `shareURL` into share metadata so that unfortunately does not seem to be a viable workaround

|U03JRP33VR6|:
That is surprising, as I can offer a fallback URL for CKShare URLs on the CloudKit Dashboard. This fallback URL does get the CKShare ID, so I assumed it would be to offer something on the web, but if I understand you correctly ONLY if the user already joined?

|U03JRP33VR6|:
If that is true, you just saved me a LOT of work :slightly_smiling_face: (with the consequence of offering one less service to users) So instead of coding I will do a BugReport :slightly_smiling_face:

|U03HJA44L0J|:
We're working to confirm whether that is a viable path, if we are unable before the close of this session please feel free (and do) file a bug report via <https://feedbackassistant.apple.com|Feedback Assistant> so we can ensure we get you an answer here

|U03HJA44L0J|:
Or optionally you can post this question on the <https://developer.apple.com/forums/|Developer Forums>

|U03JRP33VR6|:
Thank you! I created FB10141453 with this request :slightly_smiling_face:
Maybe you can help getting it into the right peoples hands.

--- 
> ####  Is it possible to make a query like,   Kind == cat || legs == 4 || surface == fur  If so how. Compound predicates doesn’t allow this I think


|U03HJA44L0J|:
`NSCompoundPredicate` has support for both `AND` and `OR`

|U03HJA44L0J|:
Have you tried and seen it not work as you'd expect?

|U03HUQAAWEB|:
Yes, I would get an error response. I'll try and come back with a specific example 

|U03HJA44L0J|:
Please file a bug report via <https://feedbackassistant.apple.com|Feedback Assistant> with logs from the device and we'll take a look!

|U03HUQAAWEB|:
Thanks Matt 

|U03JLTMSAV7|:
Documentation states that only AND and NOT compond predicates are supported for `CKQuery` predicate. <https://developer.apple.com/documentation/cloudkit/ckquery#1666032>

|U03HJA44L0J|:
Good call out, please file a bug report/enhancement request via <https://feedbackassistant.apple.com|Feedback Assistant>

--- 
> ####  I've been working with CoreData on a multiplatform app but haven't had a chance to check yet... by default is the data shared between devices on the user's account or do I need to hook into CloudKit... or something else? I watched one of the talks but it was sharing information between users so I figured I'd triple-check through here. Thank you.


|U03HJ9HCBFV|:
The data will be synced across devices for the user's account if you're setting up your Core Data store via NSPersistentCloudKitContainer, but it won't sync if you're just setting it up with a normal NSPersistentContainer

|U03HJ9HCBFV|:
Are you already using `NSPersistentCloudKitContainer`?

|U03HJ9HCBFV|:
It sounds like you watched the talk about sharing, but the original talk about general syncing is here: <https://developer.apple.com/wwdc19/202>

|U03JRPWSDJ4|:
Thank you. Somehow I missed your reply earlier. I'll bookmark that video right now. :)

--- 
> ####  Hello! How to storage array on CloudKit (transformable)?


|U03HJA44L0J|:
Array based fields are natively supported on <https://developer.apple.com/documentation/cloudkit/ckrecord|CKRecord>, see:
&gt; `NSArray`
&gt; Stores one or more objects of any other type in this table. You can store arrays of strings, arrays of numbers, arrays of references, and so on.

|U03HJ9HCBFV|:
By your mention of transformable, it sounds like you're using Core Data for storage/sync?

--- 
> ####  1. Synchronization seems to only take place when the app runs in the foreground. Is there a way to keep the app synchronizing when it is brought to the background? I have enabled remote notifications and use registerForRemoteNotifications in my app delegate (via UIApplicationDelegateAdaptor). I haven't yet experimented with background processing. Should I do that, and can you point me to some references?


|U03HJA44L0J|:
Take a look at <https://developer.apple.com/documentation/backgroundtasks|Background Tasks> which will allow your app to periodically run in the background to keep content up to date

|U03HJ9HCBFV|:
Hey Niels! I think we talked in the lab just now. Ideally, all this would be handled for you automatically via NSPersistentCloudKitContainer, but you may be able to request more background runtime via the background task APIs Matt linked to

|U03HJ9HCBFV|:
Until we figure out why we're not doing it automatically for you, you may be able to trick the system into giving you background time with the BGTask APIs so that you can continue syncing in the background

|U03J20XDZ3L|:
Thanks. What I notice is that the core data / cloudkit log events immediately stop popping up in Xcode as soon as the app goes to the background. Hence, it feels like NSPersistentCloudKitContainer internally just stops syncing.

|U03J20XDZ3L|:
I will experiment with background tasks, but that feels like a bit of a workaround to me.

|U03HJA44L0J|:
That is generally correct, when your app transitions into a suspended state the process is in a suspended state and no forward progress will be made until something wakes the process up, like a background task

|U03HJ9HCBFV|:
Agreed that it's more of a workaround than a long-term solution, and we should be able to sync in the background without you having to explicitly take out those background tasks

--- 
> ####  Hi all! Thank you for your work on integrating Core Data and CloudKit .private database using NSPersistentCloudKitContainer, which I use in my app! :zap:I am thinking of creating a sharing feature using Core Data and CloudKit .shared and .public database (as per videos from previous WWDCs). But I heard it was difficult, if not impossible, to achieve this functionality on the Apple Watch. Are there any recommendations or guides for this?


|U03HJ9HCBFV|:
Implementing sharing is possible on Apple Watch, but there's no system UI for the user to start sharing (e.g. no UICloudSharingController) on watchOS

|U03HJ9HCBFV|:
The code for the shared and public database are the same on all platforms

|U03HJ9HCBFV|:
So it's not necessarily more difficult on watchOS

|U03HJ9HCBFV|:
You might want to watch the talk about sharing data here:

<https://developer.apple.com/videos/play/wwdc2021/10015/>

--- 
> ####  If User A shared record LogRecord(CKRecord) with User B. Any way to get remote notification for User B when Record A is modified by User A?


|U03JMJN8Q6A|:
This sounds like a good use-case for <https://developer.apple.com/documentation/cloudkit/ckdatabasesubscription|CKDatabaseSubscription>. You can subscribe to notifications on User B’s shared database, so when User A modifies that shared record, User B will receive a notification that there is a change to their shared database. You’d then need to handle that notification and fetch the latest from the shared database. There are additional useful docs on the `CKSubscription` class <https://developer.apple.com/documentation/cloudkit/cksubscription|here>.

|U03JLTMSAV7|:
I would like to have `CKQuerySubscription` also available for shared databases. In this case, User A can set up a query subscription for their private database. If user B modifies the record, A gets notified about the specific changed record. However, for user B, only `CKDatabaseSubscription` is available, they get notified "something changed" which isn’t really appropriate for e.g directly displaying to user as push notification.

|U03HJA44L0J|:
As you are aware, `CKQuerySubscriptions` are not available for the shared database. Please feel free to file an enhancement request with your reasoning for needing this support via <https://feedbackassistant.apple.com|Feedback Assistant>

--- 
> ####  How to get real time update from public database?


|U03HJA44L0J|:
Are you looking for updates in the default or a custom zone?

|U03JLTMSAV7|:
There is only the default zone in public database, no? No custom zones AFAIK.

|U03HJA44L0J|:
Correct. There isn't support for `CKDatabaseNotification` in the public database but you can use `CKQuerySubscription`.

Do note, due to the natural of the public database the rate of changes can be quite high. Do consider this as your create your subscription.

--- 
> ####  2. Is there a way to check whether the local-stored data matches what's available on the server? E.g. checking whether a (local-stored) NSPersistentHistoryToken matches the latest NSPersistentHistoryToken on the server. Internally NSPersistentCloudKitContainer knows, as I can see log events popping up saying that there's no new data to mirror. I would like to know this to inform the user that synchronization still takes place. Right now, users are complaining about missing data, while it's just not available yet.


|U03HJA44L0J|:
You can monitor sync progress via <https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainer/event|NSPersistentCloudKitContainer.Event> on both the export and import side which can be used to provide feedback to your users on the state of the sync. Do note, there will always be a propagation delay between the time Device A saves some changes and Device B is aware changes were made, this is the nature of network distributed systems.

|U03J20XDZ3L|:
Thanks. I'll experiment with that.

--- 
> ####  How do you recommend to handle low storage in instances where the CloudKit data is larger than the device's available space?


|U03HJ9HCBFV|:
There are a few different approaches you can take, but the most common is to avoid downloading large CKAssets unless the user needs them

|U03HJ9HCBFV|:
This is relatively straightforward if you're using CloudKit directly, but not if you're using NSPersistentCloudKitContainer

|U03HJ9HCBFV|:
<@U03JFQ1BQMA> Are you using NSPersistentCloudKitContainer?

|U03JFQ1BQMA|:
I am yes

|U03HJ9HCBFV|:
That might be a bit more nuanced. Tagging <@U03HMJ2P5MJ> who is in the Core Data labs right now, but hopefully when he's free he can help

|U03HJ9HCBFV|:
For anyone reading this who might be using CloudKit directly (<@U03J1V9TNLT> I see your :eyes:, although maybe you're using NSPersistentCloudKitContainer too), you can specify `desiredKeys` when fetching your records. You'd exclude any keys that contain `CKAssets`. Then, when the user performs some action that requires the asset, you'd fetch the record with that asset key in the `desiredKeys` to finally fetch the asset file

|U03HJA44L0J|:
Do also note that the device does attempt to free up space in these situations and they can be (and hopefully are) transient in nature, therefore if you can reduce farther impact to the user's disk space, great, but don't permanently stop syncing in response to low disk space

|U03JFQ1BQMA|:
Fair enough. I'm wondering if things could potentially go quite wrong and potentially result in data loss :thinking_face:

|U03HMJ2P5MJ|:
I don’t think we can say. If the device runs out of disk space and we can’t import any data, that data is still on the server.

|U03JFQ1BQMA|:
So there would not be anything specific my app would need to do?

|U03HMJ2P5MJ|:
Yeah there’s nothing to do really

|U03HMJ2P5MJ|:
The user needs to free up disk space and then syncing will resume.

|U03HMJ2P5MJ|:
You should ensure your application responds to this gracefully, i.e. by not executing a batch delete request to attempt to free up disk space for them.

|U03JFQ1BQMA|:
Fair enough. Are there ways I can test this scenario (short of filling up my device with data) to ensure my app wouldn't crash for some reason?

|U03HMJ2P5MJ|:
Yes, we usually create a disk image with limited space on a mac and point the tests at that.

|U03HMJ2P5MJ|:
Fill it up and watch what the app does.

|U03HMJ2P5MJ|:
IIRC this also works in the simulator.

|U03JFQ1BQMA|:
Good to know! I'll look into that. Thanks all :thumbsup:

--- 
> ####  What are some of the best tutorials/docs for beginners looking to integrate CloudKit with their SwiftUI app?


|U03HJA44L0J|:
General documentation can be found here: <https://developer.apple.com/icloud/cloudkit/>

We also have some great <https://github.com/apple?q=cloudkit-sample&amp;type=repository”|sample code> available to get you started!

--- 
> ####  I'm seeing various errors when running queries in my CloudKit Console. "Field 'recordName' is not marked queryable" "Queried type is not marked indexable" "Can't query system types" Where can I start to figure out the cause of the errors? (FB10135562)


|U03HZ1C3YKE|:
Hi Brady :wave:

The error you’re seeing can happen when you haven’t set up indexes for your recordType in the Console.

Could you please try the following:
1. Navigate to *Indexes* under the *Schema* heading in the sidebar
2. Select the recordType that you want to make queries against
3. Click “Add Basic Index”
4. In the “Field” dropdown select “recordName”
5. In the “Index Type” select “queryable”
6. Press “Save Changes”

|U03HZ1C3YKE|:
After that you should be able to query the recordType. If not we can work through any issues here.

|U03K7L2F51P|:
Thanks Chris! After setting up indexes for recordType, the query no longer produces an error and instead shows results :tada:

|U03K7L2F51P|:
Would I also need to set up indexes to resolve the other two errors?
&gt; "Queried type is not marked indexable"
&gt; "Can't query system types"


|U03HZ1C3YKE|:
That’s correct, you’ll need to continue adding indexes to fields if you want them to be `Searchable` , `Sortable` or `Queryable`

--- 
> ####  Can I use CloudKit in a WatchOS?  If so, will records created on a non-cellular watch get synced up to the Cloud when the watch gets close to it’s paired phone?


|U03HJA44L0J|:
Yes, CloudKit (and now <https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore|NSUbiquitousKeyValueStore> ) is available on the Watch and will sync when the Watch has internet connectivity either directly or through the paired phone

|U03HJ9HCBFV|:
:hearts: NSUbiquitousKeyValueStore :hearts:

|U03J201SFAP|:
I’m guessing that NSUbiquitousKeyValueStore is a lighter-weight option than trying to use Core Data &amp; CloudKit on WatchOS - would that be correct?  I see that it has a 1MB limit - but that’s a lot of info for the watch - so I don’t perceive that being an issue for my intended use case.  Can you please point me to an appropriate Session?

|U03HJA44L0J|:
We have a great doc <https://developer.apple.com/documentation/cloudkit/determining_if_cloudkit_is_right_for_your_app|here> describing the differences between CloudKit and `NSUbiquitousKeyValueStore`

|U03J201SFAP|:
Thanks, Matt - that’s what I was looking for!

|U03HJ9HCBFV|:
Yeah NSUbiquitousKeyValueStore is great for simpler data models. If it works for your app, then it's probably the easiest thing to use

|U03HJA44L0J|:
We often like to recommend `NSUbiquitousKeyValueStore` for small, atomic things that don't change often, think user settings

--- 
> ####  Currently my whiteboard drawing app does not persist or sync data. I want to choose a persistence/sync solution that: 1) supports offline editing, undo/redo 2) automatically figure out how to merge conflicts (maybe CRDT?), 3) have near real-time performance when collaborating (through SharePlay or the new Messages sharing thing). Could you point me towards the right direction? How should I architect my app? Should I use Core Data/NSPCKContainer for this?


|U03HJ9HCBFV|:
This is a fun one. You'd basically want to use some sort of conflict-free data structure (a CRDT would work, as you mentioned)

|U03HJ9HCBFV|:
If you figure that out, then offline editing will work just fine because every device will become eventually consistent

|U03HJ9HCBFV|:
CloudKit doesn't have any special support for automatically handling merge conflicts, so you'll still have to handle conflicts on the device (`CKErrorServerRecordChanged`), but handling those conflicts will be easy because your data is inherently mergeable

|U03HJ9HCBFV|:
You can get real-time performance via SharePlay just like you mentioned as well

|U03HJ9HCBFV|:
I'm not aware of any mergeable data/CRDT libraries off the top of my head, but I'm sure there's something out there. That's the main way you'll be able to support these concurrent edits

|U03HJ9HCBFV|:
As for using NSPersistentCloudKitContainer, that would probably be ideal and save you a lot of work, although I'm not super familiar with how merge conflicts are handled there. <@U03HMJ2P5MJ> is it possible to define an NSMergePolicy where you can perform a CRDT merge on a conflict?

|U03HMJ2P5MJ|:
If you use a CRDT with contributions modeled as rows it would work just fine

|U03HMJ2P5MJ|:
you just traverse the contributions

|U03HMJ2P5MJ|:
and NSPersistentCloudKitContainer can do the shuffling (or you could shuffle them via SharePlay).

|U03J20E1BPD|:
<@U03HMJ2P5MJ> Sorry I’m not very familiar with the terminologies. Did you mean I should record all the history entries in a giant table? What did you mean by “shuffling”?

|U03J20E1BPD|:
Also, I read somewhere that you’re not supposed to use device timestamps in CRDT implementations. Something called Lamport timestamp? Is this important?

|U03HMJ2P5MJ|:
NSPersistentHistoryTransaction / NSPersistentHistoryChange are just records of changes. They do not contain any useful information to send to other devices.

|U03HMJ2P5MJ|:
&gt;  Something called Lamport timestamp? Is this important?
Yes. That is one of the fundamental mathematical concepts for CRDTs.

|U03HMJ2P5MJ|:
&gt;  is it possible to define an NSMergePolicy where you can perform a CRDT merge on a conflict?
No but we would take a feedback report for that

|U03J20E1BPD|:
“NSPersistentHistoryTransaction / NSPersistentHistoryChange are just records of changes. They do not contain any useful information to send to other devices.” Sorry… not good at Core Data… I don’t quite understand this.

|U03J1V9TNLT|:
Those are built in change tracking tables that are created when turning on persistent history tracking. He says you cannot use those for collaboration because they don't contain the data  that changed. You need to store data changes in your own entities, sync those via CloudKit, and use those changes to build up the current state.

|U03J20E1BPD|:
Thank you for the explanation <@U03J1V9TNLT>!

--- 
> ####  I'm using iCloud Drive by copying a file to the directory obtained by `FileManager.default.url(forUbiquityContainerIdentifier: nil)`. In the case that we put a file whose file size is about 1MB, the value of `NSMetadataUbiquitousItemIsUploadedKey` for the saved item usually becomes true within a second under a good network condition. However, when I put the 1MB file immediately after deleting all items in the iCloud directory, the value of `NSMetadataUbiquitousItemIsUploadedKey` for the newly added item remains false for more than 20 seconds. Is it a limitation of CloudKit?


|U03KECFPY73|:
If there are a large number of deletes for iCloud Drive to process, this can delay the speed at which it processes the new file creation which can result in a longer upload time.

|U03KECFPY73|:
We'd like to look at this a little more closely though to make sure nothing is going wrong here. Can you install the iCloud Drive debug profile and then file a feedback?

|U03KECFPY73|:
You'll find the iCloud Drive debug profile here:
<https://developer.apple.com/bug-reporting/profiles-and-logs/?platform=ios>

--- 
> ####  Does CloudKit still require iCloud Drive to be enabled? Is there API to detect iCloud Drive not enabled, vs user not being signed in to iCloud? I have users who have managed computers where iCloud Drive is disabled, but thirdparty CloudKit apps would be fine. Currently such users cannot use CloudKit-based apps.


|U03HJ9HCBFV|:
CloudKit usage still requires iCloud Drive to be enabled, but your concern about users who disable that switch are valid

|U03HJ9HCBFV|:
Would you mind filing a bug through Feedback Assistant about this?

|U03JLTMSAV7|:
FB8994677

|U03HJ9HCBFV|:
Ah, awesome, thank you

|U03HJ9HCBFV|:
Sadly the situation hasn't changed since last year when you filed it

|U03HJ9HCBFV|:
But don't lose hope, I personally fixed an external request from 2015 this year

|U03JLTMSAV7|:
Thank you for the comments :smile:

|U03HJ9HCBFV|:
And thank you for providing the feedback!

--- 
> ####  Hey Patrick. I'm using NSPersistentCloudKitContainer with Core Data in my app. I've adopted the deduplication workflow detailed in the Synchronizing a local store to the cloud sample code. I noticed that when the items are fetched and inserted, the relationships are not yet updated (the relationship is nil). Later, I receive other transactions from the history where the items where updated: at this time, the relations are good. Is that the intended behaviour? I need to deduplicate my items based on a relationship, so having it nil when the transaction is of change insert does not help me.


|U03HMJ2P5MJ|:
Yes this is expected. You will need to wait for NSPersistentCloudKitContainer to saturate the related objects before you can dedupe them.

--- 
> ####  I recently had a user accidentally delete my app (data) from his iCloud account. Is there a way he could have restored his data? Either via a UI or via Apple Support?


|U03HJ9HCBFV|:
Did they delete the data via the Manage Storage API in Settings? Or via your app?

|U03HJ9HCBFV|:
In general, if you delete data from CloudKit, it will be gone forever

|U03HJ9HCBFV|:
This is both a good thing (we don't keep data that the user thinks is deleted) and a bad thing (the user might lose data like this)

|U03HJ9HCBFV|:
One thing that some apps do is to introduce the concept of "Recently Deleted" data that can be recovered

|U03HJ9HCBFV|:
That would just be normal data in the database, but shown in a different place in the UI (for example the Recently Deleted folder in Notes)

|U03HJ9HCBFV|:
You could even keep user-deleted data around in your database temporarily, but with a flag that hides it from the UI. Then at some point you clean it up (e.g. after 30 days or something)

|U03HJ9HCBFV|:
But sadly for this particular user, if the data is deleted from CloudKit, it's unrecoverable

--- 
> ####  Hello! When releasing an update with updates to the CloudKit Cloud Schema, should you publish changes to production before App Review or after it releases on the App Store? Thanks :grin:


|U03JR9WQELV|:
The best practice here is to promote schema changes before submitting an app for review. The App Review team would be looking for a full app experience which I assume includes using the latest schema for your app.

|U03HVE4TV8E|:
Great, thank you so much! :grin::ok_hand:

|U03JLTMSAV7|:
I’d also add Testflight. Before submitting, it’s a good idea to test with Testflight testers. TF builds work against the public schema.

--- 
> ####  Are there plans to support CloudKit in Swift Playgrounds on iPad? Or does it already work and I simply missed it.


|U03JMJN8Q6A|:
You’re right that Playgrounds doesn’t currently CloudKit, but please file a Feedback via <https://feedbackassistant.apple.com> if that’s something you’d like to see!

|U03J4EJ0CVA|:
I filed a feedback request for this earlier this week. Here it is: FB10079951

--- 
> ####  With NSPersistentStoreRemoteChange is there a way to filter out local changes from remote? There are times I only want to react to remote changes.


|U03HJA44L0J|:
When you say 'remote', do you mean another device or another process on the same device?

|U03JDV4PQR0|:
I want to ignore everything on the current device and only react to changes from other devices.

|U03HJA44L0J|:
Great, take a look at <https://developer.apple.com/documentation/coredata/nspersistentstoreremotechangenotification|NSPersistentStoreRemoteChangeNotification> and let us know if you have any questions

|U03HMJ2P5MJ|:
That’s not what NSPersistentStoreRemoteChangeNotification does. NSPersistentStoreRemoteChangeNotification only informs you that the store file has changed, not that changes were imported from CloudKit. NSPersistentCloudKitContainerEvent fills that role.

|U03JDV4PQR0|:
Thank you!

--- 
> ####  Hey there. I have two questions about CloudKit sharing.  1. If User A shares e.g. a Record with User B who has the app not installed, is iOS giving them a prompt to download the app or does the user has to do that by hand? 2. If I have a main app and in addition to that a second app (e.g. a companion app), is there a possibility to share a record from the main app to the companion app? And if so, can I somehow specify the app I want to share the record with?   Thanks a lot for the info in advance!


|U03HJ9HCBFV|:
If a user taps on a CloudKit sharing link, but they don't have the app installed, the system will prompt them to open the App Store and install the app

|U03HJ9HCBFV|:
As for the companion app, CloudKit sharing is tied to the CloudKit container, not the app itself. So as long as the second app also has access to the CloudKit container, it can share data with the main app

|U03HJ9HCBFV|:
You wouldn't be able to specify which app to share the record with, but if the user has both apps installed, they'll be able to choose which app to open the share link

|U03HJ9HCBFV|:
If they only have one of the two apps installed, then it'll open in the installed app

|U03JHD6Q60H|:
Thanks. If no app of the both is installed, probably the prompt asks to install the app from wich the sharing was initiated?

|U03HJ9HCBFV|:
If neither app is installed, we'll prompt to install one or the other, but no guarantees on which one

|U03HJ9HCBFV|:
I don't believe we store the app that actually initiated the share, so we can't necessarily choose which one, although that's worth a feature request via Feedback Assistant

--- 
> ####  Not updated myself recently but is there a chance to bulk-upload/-download data to/from a public database? I wanted to prefill data for my users...


|U03JR9WQELV|:
My first question is: why the pre-filled data not hard-coded into the app? (trying to save you from a slow first user experience)

|U03JR9WQELV|:
If the data is changing, I may suggest having a single  versioned asset file (instead of many records) uploaded to PublicDB. For upload and management, you could potentially use the CloudKit Console.

|U03JRNE4KJL|:
1. to reduce app size
2. being in the public db there is no need to bundle it with each app as its “global”
3. being able to update regualrly without app review

|U03JRNE4KJL|:
The CloudKit Console and Dashboard improved over the years, that’s great!

|U03JRNE4KJL|:
And I’ll be honest, I haven’t touched it in recent months. But for a former client, we wanted to prepolulate the public DB and ebing flexible on date and bulk up-/download was essential.

|U03JRNE4KJL|:
All I could figure out was to develop a companion app and up/download iteratively but it was super weak and slowwww….

|U03JR9WQELV|:
Uploads depend on number of records and assets and their size + network conditions. Also, that might impact first UX. That's why I suggested using a single file with the "compressed" records and assets.

|U03JRNE4KJL|:
Indeed for 1st launch experience, we have the most recent “copy” inside of the app (and for supporting offline-1st-approach).

|U03JRNE4KJL|:
Still the question holds: can we bulk up/download to CloudKit somehow relaibly and fast?

--- 
> ####  Hey, I'm trying to use Core Data and CloudKit together. I want to push some data from the user's device to the CloudKit Public Database but every time I try, it uploads to the private database.


|U03HJA44L0J|:
Have you verified that your `NSPersistentCloudKitContainer` is configured for the public database, see <https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontaineroptions/3580372-databasescope>?

|U03HYTN0AH4|:
```
Currently my code looks like this:      class DataController: ObservableObject {
    let container = NSPersistentCloudKitContainer(name: "LoggingData")

    init() {
        
        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("Error")
        }
        
        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        description.cloudKitContainerOptions?.databaseScope = .public
        
        container.loadPersistentStores {descript, error in
            if let error = error {
                debugPrint("Core Data failed to load \(error.localizedDescription)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
```

|U03HJA44L0J|:
Please confirm this is non-nil before you set it: `description.cloudKitContainerOptions?.databaseScope = .public`

|U03HYTN0AH4|:
it produces this *`Optional(__C.CKDatabaseScope)`*
before that line of code

|U03HJA44L0J|:
You can double check by switching to a force unwrap: `description.cloudKitContainerOptions!.databaseScope = .public`

|U03HYTN0AH4|:
Sidenote: I keep getting an error when building and running my apps `warning: libobjc.A.dylib is being read from process memory. This indicates that LLDB could not find the on-disk shared cache for this device. This will likely reduce debugging performance.`

|U03HYTN0AH4|:
And it isn't nil

|U03HJA44L0J|:
Unfortunately it's likely best to file a bug report via <https://feedbackassistant.apple.com|Feedback Assistant> optionally including your sample code and we'll follow up

|U03HYTN0AH4|:
Sure thing, will do!

|U03HYTN0AH4|:
Thanks

--- 
> ####  Are there known issues with Xcode 14 first beta and iOS 16 Simulator for CloudKit? All my CloudKit apps crash on launch with this configuration. FB10094049


|U03HJ9HCBFV|:
Sadly this is a known issue, but it should be fixed in seed 2

|U03JLTMSAV7|:
So I figured, thank you.

--- 
> ####  Does "Act As iCloud Account" in CloudKit Dashboard allows us to see our test user's data? When I log in to CloudKit Dashboard using a test iCloud account (not an Apple Developer member), I see "No Containers" message and an "Enabling CloutKit in Your App" button, but can I just click this button and expect to be able to see its private data, for example?


|U03JR9WQELV|:
That is correct. If you log into the Developer Portal using your test user's account, I assume that the account is not part of your developer team and hence you are not able to load the container. If you use the "Act as iCloud Account" functionality, you will be able to see that user's data in your container.

|U03HZ1C3YKE|:
Please check out this talk for full details of how to use the “Act as iCloud” feature <https://developer.apple.com/videos/play/wwdc2022/10115/>

|U03JRPEC4AU|:
Great, thank you!

|U03J1V9TNLT|:
Shame the Act As state is lost when reloading the web page.

|U03JRPEC4AU|:
I just tried this and it worked! Exactly what I wanted! Thank you!

|U03HZ1C3YKE|:
That’s great <@U03JRPEC4AU>!

<@U03J1V9TNLT> Could you please file that as feedback in Feedback Assistant please
<https://feedbackassistant.apple.com/new-form-response>
Developer Tools &gt; “CloudKit Console” as the area.

|U03J1V9TNLT|:
<@U03HZ1C3YKE> done FB10141541 Dashboard "Act As" state is lost when reloading the web page

--- 
> ####  In WWDC21, NSPersistentCloudKitContainer added support for sharing between different users. What is the expected sync delay? Is it possible to add SharePlay on top of that to reduce the delay?


|U03JR9WQELV|:
In most cases the sync will take a delay in seconds order of magnitude. The delay depends on a number of conditions, such as number of records, file size, network conditions, etc.  Share Play does not take a role in how NSPersistentCloudKitContainer shares data between users.

--- 
> ####  My production app using CloudKit and CoreData only seem to sync between devices (eg: Mac and iPhone) when I quit and relaunch the app. Or perhaps I'm not waiting long enough... Can you point me in the right direction for how I can better keep data in sync between devices while the app is running?


|U03HJ9HCBFV|:
This sounds like the app might not be receiving push notifications

|U03HJ9HCBFV|:
Do you have the APS environment in your entitlements, and the remote-notifications background mode in your capabilities?

|U03K7L2F51P|:
I'm not sure. But I'll look into that

|U03K7L2F51P|:
Yes to remote-notifications background mode. Trying to find the APS environment setting

|U03HJ9HCBFV|:
It should be in the entitlements, something like `aps-environment`

|U03K7L2F51P|:
~-~

|U03K7L2F51P|:
Ah, found it

|U03HJ9HCBFV|:
Ah, can you try switching the APS environment to `production`?

|U03K7L2F51P|:
I was just reading about doing that - came across a few posts that say when archiving a project for submitting to the App Store, Xcode will automatically change that value to "production"

|U03K7L2F51P|:
So do I need to manually change it now? Or does Xcode manage that setting for me after the entitlement is added?

|U03HJ9HCBFV|:
Hmm, it might, but you should generally use the production APS environment

|U03HJ9HCBFV|:
So you should manually change it now

|U03HJ9HCBFV|:
This is separate from the CloudKit environment (kind of confusing, unfortunately)

|U03K7L2F51P|:
Ok, I manually changed it. I assume I won't know if that fixes the sync issue on my production app on device until I submit an app update that includes that manual change, correct?

|U03K7L2F51P|:
At any rate, I'll be submitting an app update today so I'll find out soon :slightly_smiling_face:. Thanks <@U03HJ9HCBFV> for your help with this and for sticking around a bit longer. Really helped me out with this issue I've been having for months and months

|U03HJ9HCBFV|:
Could you try testing it locally?

|U03HJ9HCBFV|:
Install the app on two devices and sync between them?

|U03K7L2F51P|:
Sure, I'll do that now

|U03K7L2F51P|:
Trying that on two simulators now. Installed the app on two separate devices on Simulator. Signed into my iCloud account on each. Added new entry on device A, waiting for it to appear on device B

|U03K7L2F51P|:
Have waited 2 minutes so far, new entry has not yet appeared on device B

|U03HJ9HCBFV|:
Hmm, what about two real devices? I forget what the state of push notifications are on the simulator, not sure if they work

|U03K7L2F51P|:
I'll try that now

|U03K7L2F51P|:
Ran equivalent test on two real devices. Not syncing after 2 minutes

|U03K7L2F51P|:
Quit app on device B after 4 minutes of no sync. Relaunched. New entry now appears on device B

|U03K7L2F51P|:
Hmm, so seems like problem persists

|U03HJ9HCBFV|:
Hmm, thanks for trying

|U03HJ9HCBFV|:
Could you install the CloudKit logging profile on both devices, reproduce this again, then take a sysdiagnose from both devices and file a bug through Feedback Assistant?

|U03HJ9HCBFV|:
The CloudKit logging profile can be found here: <https://developer.apple.com/bug-reporting/profiles-and-logs/>

|U03K7L2F51P|:
Yes, I'll do that

--- 
> ####  Hey everyone! What would be best practice to start and end sync with NSPersistentCloudKitContainer at runtime? So a user could toggle sync. I'm thinking of removing all stores and re-loading them setting the cloudKitContainerOptions appropriately.  Anything else I need to do? Like resetting the context?


|U03HMJ2P5MJ|:
We do not recommend attempting to manually control sync state in this way. Users control the ability of your application to sync using the application’s switch in Settings.

|U03HMJ2P5MJ|:
Removing the cloudKitContainerOptions from a store, and then reusing that store file creates a number of privacy and identity issues that NSPersistentCloudKitContainer cannot recover from if the user changes the iCloud account on their device.

|U03JBGPGQCF|:
Understood. So is it ok to just start sync without asking the user since they are signed into iCloud? I'm dealing with sensitive data and want to give users a choice to start sync.

|U03HMJ2P5MJ|:
We would advise that you use a separate store file for that.

|U03HMJ2P5MJ|:
i.e. one store file that’s always local, never synced.

|U03HMJ2P5MJ|:
If they opt-in you can move that data to a synced store file

|U03HMJ2P5MJ|:
This gives the user an explicit-cannot-be-confused-by-application-logic / store files way to opt in to syncing their sensitive data.

|U03JBGPGQCF|:
Thank you, that sounds like a perfect solution.

--- 
> ####  I have several thousands records in a public CloudKit database. The records are added daily and there is only a handful of new records every day. The new records are added by one central process outside of the actual iOS app. All app users need read only access to all the records. The iOS app is using NSPersistentCloudKitContainer to sync the Core Data store with the public CloudKit database. After watching the WWDC20 'Sync a Core Data store with the CloudKit public database' video I thought this sync methodology would work perfectly in the above scenario. Here is a quote from the presentation. "So we're only going to poll for changes on application launch or after about every 30 minutes of application use. And this is to ensure that we align the load of these requests with the actual usage of your applications. Of course, this does mean that the quality of freshness that you can expect from the public database will be noticeably different from the private database." In practice I encountered two issues: 1. The initial import of the records happens in batches. This is understandable since it balances the load on the CloudKit servers. However, the way the records are imported is not ideal. I had records created everyday from September to May. When the import process started users saw records from March appear in the app first. The other records were imported later. This was not ideal. I would like to have control on which records are imported first. In my scenario I would like the newest records to appear first in the application. This way users would not be confused why there are only old records visible in the app. It is much easier to explain to users that it takes time to import and that the older records are imported later, when the newest records are visible first.  2. From the above quote "poll for changes on application launch" - the poll for changes should ideally happen when application comes back to the foreground. Of course if the poll can be done only every 30 minutes, then it should be throttled accordingly. My point is that the moment when a user opens the app and looks at the data, the moment when the application comes back to the foreground, is critical from the user experience point of view and you want the data to be up to date as much as possible at this particular moment. Perhaps the app should be able to signal and ask for poll to be performed and the system would perform the poll for changes if other time related criteria are met?


|U03HJA44L0J|:
For (1) please file an enhancement request via <https://feedbackassistant.apple.com|Feedback Assistant> for support to import the data in reverse

|U03HJA44L0J|:
For (2), again please file an enhancement request via <https://feedbackassistant.apple.com|Feedback Assistant> regarding your expectations for your application for when syncs should occur with the public database

|U03HJA0EJ1G|:
the primary approach to work around that today (not ideal, just saying how some folks have managed) is to download the data into a cloud store and separately move it over into a separate local store

|U03HJA0EJ1G|:
the record copying (importing and exporting, really) between your cloud and local stores can do anything.  prioritize, de-dupe, use features in the local store unavailable to cloudkit, etc.

|U03HJA0EJ1G|:
it should be polling on foreground, hmm, but we might have only done that for private databases.  It's worth a feedback report.

|U03JM8PFK2P|:
Great. Thank you for your comments. Really appreciated. I will file enhancement/feedback requests.
