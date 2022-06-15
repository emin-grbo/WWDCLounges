# coredata-lounge QAs
#### by [shirblc](https://github.com/shirblc)
---

> ####  Can `NSPersistentContainer.viewContext` become `nil`? Container itself is properly retained in app's delegate so it is never released.   Trying to figure out why in our app `NSManagedObjects` are turned into a fault sometimes after they are being fetched from view context which in turn results in a crash.


 &gt; Can `NSPersistentContainer.viewContext` become `nil`?
No. The viewContext property is set / initialized on read and not released until the container deallocates.

 objects can turn into faults for a number of reasons but using query generations can help ensure they they are always fulfillable

 Are they faults or have they been deleted? Do you have a section of code calling `-reset` on the view context?

 Some other possibilities would be the object was deleted, or it was released pending deallocation.

 Thanks for prompt replies. We never call `reset` on any of the contexts. Most of these errors where related to us using the object on the background thread. I think I eliminated all such cases, but we still see this issue.

 `-com.apple.CoreData.ConcurrencyDebug 1`  can help.  But objects are turned into faults naturally when they are deleted or scheduled for deallocation

 What can mark them as scheduled for deallocation?

 setting `-com.apple.CoreData.ConcurrencyDebug 1` in your apps arguments should help you zero in on any remaining thread-unsafe use (EDIT: aw admin disabled the “delete message” feature)

 Btw, I tried the flag, but it doesn’t seem to work. Or I don’t understand how it should work. Code example (projects is list of managed objects fetched from view context):

```
            if let first = projects.first {
                DispatchQueue.global().async { [weak self] in
                    let persistentFirst = first
                    self?.dispatchBackToMain(project: persistentFirst)
                }
            }
```

I would expect this code to fail assertion and break on line `let persistenFirst = first` or the line after that, but it doesn’t seem to be the case. Or does the assertion only happen when `context.perform { }` is used?

 It asserts that `context.perform {}` is _always_ used to access managed objects belonging to background contexts and that main queue contexts are never referenced off the main thread. It doesn’t do anything if you’re using the confinement concurrency type, which you shouldn’t be using anyway as it’s been deprecated for like seven years.

 we don't treat the mere capture and passing of references as an API violation, since in theory you can capture an array of results, hold on to it, and then pass it back to the same MOC for work later.

 but if you were to access a property on such an object, we would assert

 Thank you so much for your answers. Will investigate further and hopefully figure out what happens there (or figure out how to use query generations). :wave:

---
> ####  If my store description is pointing to a pre-seeded store that is in the bundle and I update that store in an update, will users still see the outdated store or will they start using the updated one?


 they will see whatever version is in the app version they have; are you seeing otherwise?

 I added a new entity to my model and populated my store with instances of that entity but when a view makes a fetch request for data, nothing shows. However, uninstalling and reinstalling the app fixes the issue.

 Everything in the bundle is signed, I’d expect a lot more to go wrong if the store wasn’t properly updated by the App Store…

 First I’d double check that there’s no obvious caching issues. If you suspect an incomplete update maybe when it detects the problem your app can shasum the store and validate that it was updated properly (and submit a bug report if it wasn’t)

 Is there some other mechanism that caches data? I'd assume that whatever file the store description is pointing to would be the source of truth.

 You can tell `NSFetchedResultsController` to create a cache when you initialize it (the `cacheName:` parameter) but it should invalidate correctly in this circumstance

---
> ####  When using an `NSPersistentCloudKitContainer`, is there a download limit/throttle based on user count?


 Not that NSPersistentCloudKitContainer imposes. The CloudKit servers will throttle / limit your applications operations as needed.

 Do you know where I may find more info on how/when CloudKit will throttle?

 Or perhaps what the quota might be for synching data per user/month?

 That’s a question for the CloudKit Q&amp;A / Labs.

---
> ####  I’m using NSPersistentCloudkitContainer along with shared record zones. Is there a simple way to get notified when something related to the CKShare changes? For example, permissions? I’d like my UI to update as soon as permissions change.


 No. You can file an enhancement request for this, but the existing way we see clients do this today is using NSPersistentCloudKitContainerEventTypeImport and fetching the share their showing.

 Ok. Thank you. I have already filed the enhancement request.  

---
> ####  For cases when app doesn’t use CloudKit but uses sqlite file for synchronisation of data between devices. And app on different devices may have different CoreData model versions. CoreData automatically cleans all new attributes and entities when app with older model version opens db created by app with newer model version. Is there any way to open db in app with older model without data lost?  Thank you!


 Forward binary compatibility is pretty tricky, since older versions of the app won't maintain those columns or know what they are for.

 You'd have to either share the matching model with the file, or disable automatic migration

 We'd usually discourage trying to share db files "back in time" with older versions of the app though.  There are a lot of assumptions about the data that an old version just won't know to handle

---
> ####  Are there circumstances in which a persistent store coordinator that has been successfully initialized could lose its persistent store? I've been getting occasional reports of crashes due to a save w/o a store, but I'm not doing anything to remove the store


 hmm.  That's usually because the store was never successfully added and the error on load was ignored

 Do you have the error message ?

 It's an NSInternalInconsistencyException with the message "This NSPersistentStoreCoordinator has no persistent stores (unknown).  It cannot perform a save operation."

 That is the error when saving, but when you were calling addPersistentStore, there was likely an error then

 Hmm, I fatalError if loadPersistentStores reports an error (bad, I know) so that shouldn't be possible

 Maybe there's a race condition between what's triggering the save and loading the store...

 that is also possible, you can check if there are persistentStores on the persistentStoreCoordinator before calling save

 If you have a sysdiagnose attached to a feedback report, we can take a look.

 or if you have some convenient excerpt of the logs, here.

 if it comes up again, I'll definitely file a feedback, but I think the race condition is the most likely explanation

---
> ####  I'm syncing a local Core Data store with NSPersistentCloudKitContainer to CloudKit to the public database. But I don't want my users to be able to make changes to the public database. I have a command that's only available when running my app in Xcode that lets me update the public database. Is it possible that a user could edit the .sqlite file directly and cause the public database to be synced with their changes? I've been playing around with roles on the CloudKit dashboard, but I'm not sure exactly what to do to prevent users from changing the public database.


 &gt; but I’m not sure exactly what to do to prevent users from changing the public database.
Generally you can prevent users from writing to the public database by simply not providing that functionality in your app. Yes, they could hand edit the sqlite file and cause updates to be pushed to the server.

 But if you’re worried about that as an attack vector the public database isn’t really what you want. It’s necessarily public.

 Oh that’s a shame. I wanted to use the Public database to provide a template library that all my users could have access to. But I don’t want them to edit the public database. They could edit the database and cause all sorts of damage, even deleting content that would then sync to all other users. Do you have a suggestion of an alternative approach?

 I guess then I don’t really understand the purpose of Core Data syncing to the public database. Even if you were syncing a leaderboard with game scores, then anyone of your users could hand edit the sqlite file and mess with the leaderboard.

 The public database doesn’t support custom access controls, but that’s not the same thing as it being an invalid construct. If your use case requires custom access controls, or validated updates, most clients generally roll their own server or host the assets as static resources.

 Can you set the read/write/create privileges for that record type on CloudKit to be a custom admin user? Then users have access to read the records but not write them unless they are an admin user.

 that’s a question for the CloudKit Q&amp;A / Labs.

 It’s not clear to me if the access controls for the public database are customizable from the console.

 They are customizable. I just was wondering if they in fact worked with Core Data syncing. I set world to read-only, authenticated/icloud to read-only, and creator to read-write. But I guess someone could still add a record to the local sqlite database and that would sync up. Not sure.

 Well… you should test that :wink:

 If you have customized the access controls local writes should be denied by the server.

 If you’ve customized the access controls to suit your desired use case, I would test writes on a non-admin account (i.e. build a version of the app that allows mutations to template data) and see what errors come back.

 If NSPersistentCloudKitContainer isn’t handling things as you would like (i.e. it continues to retry writes), you can file a feedback report for the desired enhancements.

 I’m going to have one of my beta testers test it out with their account to see what happens.

 Ah that’s a good thing to look out for. To make sure it doesn’t get stuck trying to write.

---
> ####  I see some unexpected behaviour with NSPersistentCloudKitContainer, where out of date data is displayed, or data seemingly goes missing, etc..  1. What is the recommended Merge Policy? I use `.mergeByPropertyObjectTrump` but I'm not sure if it should be `.mergeByPropertyStoreTrump`, or something else?  2. Are there any side effects if `setQueryGenerationFrom` is never called?  3. Are there any side effects if the persistent history transactions aren't cleaned up (other than disk usage)  Thanks!


 1. The recommended merge policy would be whatever fits your customer experience and business requirements. Each merge policy addresses specific requirements. We prefer mergeByPropertyObjectTrump.
2. The side effects would be that you would always be working with the “most recent live” version of the object. And potentially they could mutate from underneath UI elements like a NSFetchedResultsController
3. There are no side effects but you could potentially cause a reset sync if you destroy history and the experience may seem broken. We discourage purging history.


---
> ####  I'm at a design/ experiment stage with my app which previously used Filemaker, and migrating it to CoreData. Am I insane to be thinking that I may want to have multiple, separate persistent stores?


 No ?

 More stores has some expense, on the order of a couple file descriptors, so you don't want an unbounded number

 and indices can't index across multiple different stores, so searching across "all stores" is more expensive

 but it's pretty common to have disjoint data graphs separated into different stores

 like local vs cloud

 How would a disjoint data graph manifest itself? You mean unrelated tables? or?

 if you have a collection of entities, and that collection doesn't have a relationship to anything else

 There is plenty of that in my design!

 Or rather, they will be related by lookups

 on ios, there's a limit of ~256 file descriptors.  An sqlite db uses 3.  You'll want to leave a bunch for the system and memory mapping assets and such.  So you're looking at a small 10s of simultaneously open stores

 most folks stick to single digits

 I was thinking of 3 at the most

 But not open simultaneously

 So I need to keep track of veterinary medicine usage, by tracking treatments. I was thinking of having the purchased medicines and their information separate and copy in relevant info into the treatment. While keeping a record of medicines that were purchased and used.

 I was advised to denormalise, and this seemed like a good way to do it?

 Well, the devil is in the details.  You can denormalize entities within a single database file too

 Usually folks break things into different files if the access patterns (or outright permissions) are very different

 or if the content is servicing two very different component areas

 so "local only data" and "cloud sync'd data" are common

 as are files with different data protection classes

 or "pre canned assets shipping with app" vs "user generated content"

 I have 6 years of data in Filemaker, which I can now migrate fairly easily into CoreData. I think I’ll try looking at performance with separate stores vs with entities that don’t have a relationship.  Thanks for the insights.

---
> ####  Can a @FetchRequest in SwiftUI refresh the view if a relationship object is updated ?  If A have a to one relationship to B. If my view have a @FetchRequest of [A]. When I make an update to B, can the @FetchRequest reload the SwiftUI view to show the changes from B ?


 `@FetchRequest` is powered by `NSFetchedResultsController` and has the same limitations, one of which is that it won’t follow changes across relationship boundaries that affect sort/predicate matching. The best way to work around this is to add <https://developer.apple.com/documentation/coredata/nsderivedattributedescription|Derived Attributes> on the fetched entity

 Thanks for the suggestion ! That’s what I have been looking for !

---
> ####  Is accessing a CloudKit DB supported yet for users that don't have an iCloud account? I'd like to use CloudKit for my next iOS application but I know some of my users don't use iCloud. Thank you!


 The data stored in a public database can be read by every user, even if that user isn’t signed in to their iCloud account.

 Accessing the private database requires the user to be signed into an iCloud account.

 Is there anything planned to let users access their own data without having to sign up for iCloud?

 I think that's a question for the CloudKit team.  AFAIK private databases require account credentials.

 Great, thank you!

---
> ####  With NSPersistentCloutKitContainer  seem to focus on one particular aspect. Is there any possibility of a "source of truth" sample project, which demonstrates:  * Best practice for apps with multiple extensions, sharing data * All the nitty gritty details, such as merge policies, data deduplication * Best practices for informing users when sync events are occurring, or the progress/status of sync * Best practices for handling errors (e.g. quota exceeded) so the user can be notified accordingly  There just seems to be a lot of gotchas in the default setup and the solutions aren't obvious.


 &gt; * Best practice for apps with multiple extensions, sharing data
Clients generally use an app group. That’s not a specific NSPersistentCloudKitContainer problem, but more of a consideration about how applications share data among multiple experiences (extensions, widgets, etc).

&gt; All the nitty gritty details, such as merge policies, data deduplication
These are use case / app specific. If you have specific questions you can ask them here or in feedback reports.

&gt; Best practices for informing users when sync events are occurring, or the progress/status of sync
NSPersistentCloudKitContainerEvent and its related notification are generally used for this purpose. <https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainerevent?language=objc>

&gt; * Best practices for handling errors (e.g. quota exceeded) so the user can be notified accordingly
You can observe them via NSPersistentCloudKitContainerEvent and notify your user accordingly.

 If you're finding that you don't get enough status information out of `NSPersistentCloudKitContainerEvent` please file an enhancement request

 Thanks Nick - my ultimate problem is that I’m getting many reports of removed or missing data. It’s too big of a burden to ask users for a sysdiagnose, and the total stack for NSPersistentCloudKitContainer is so large when working across multiple app extensions, Core Data and iCloud. There’s so many potential points of failure and hard to determine whether:

1. Is it a UI issue?
2. It is a transaction merging issue?
3. Is it a CloudKit issue?
4. Is it a configuration issue?
It would be great if there was a single project that was a working implementation of sharing a Core Data database both across extensions and iCloud, and showing the implications of different merge policies (for example) with the entire setup.

 For a group of processes, you can use a group container so they can all share access to the same files.

 One challenge with extensions is that they simply don't get much processing time, so it can be difficult for them to complete a network sync operation.  We'd generally suggest using the application to drive the syncing and have the extensions reflect that data

 You can file an enhancement request for us to include more in the sample project.

 persistent history and remote change notifications can help with the UI cycle

 I think more generally these experiences are difficult to craft in a representative way because everyone’s product goals are different. We usually prefer feedback reports with a sample application in them (or your actual application) so that we can align on the specific challenges you’re facing.

 Ok thank you - just general feedback then that NSPersistentCloudKitContainer is amazing and super useful, but when something goes wrong it can be a real head-scratcher.

 Feedback on improvements is appreciated.  We are generally tackling the "when something goes wrong" issue with logging, persistent history, and NSPersistentCloudKitContainerEvent

 &gt;  but when something goes wrong it can be a real head-scratcher.
I highly recommend you watch this session tomorrow. <https://developer.apple.com/wwdc22/10119>

 <@U03HMJ2P5MJ> might also ...

 have that

 Oh just on the extension processing time: if an extension can’t complete it sync with CloudKit, could that lead to any negative effects?

 Not generally. Sync resumes when the app is launched

 The primary consequence is data staleness.

 if only the extension is  running.

 I’ve given CloudKit entitlements to my Intents extension so, for example, if you use a shortcut then other devices are notified ASAP without main app launch.

 Enabling one of the approved background modes (like network activity, etc) can help.

 Yeah the extension rarely survives long enough for us to finish an work with CloudKit.

 Figured that was the case - but if it doesn’t complete, there’s no risk of data loss or anything?

 (I’ll be watching that video, and I have a lab, but i’m getting a lot of users complain about data loss now that I’ve migrated the app to NSPersistentCloudKitContainer, which is extremely stressful and I’ve no idea how to deal with it at this point).

 Let's start with a feedback report.  The session will go into detail about the kind of data that would be valuable to gather

 &gt;  which is extremely stressful and I’ve no idea how to deal with it at this point)
The way we make that tractable is through feedback reports with logs

 Yes, but gathering a sysdiagnose from a random user for an issue that only intermittently occurs and I have no idea how to replicate, means logs are generally not possible.

 (this is what leads me back to the initial question, of making sure everything is setup “correctly” to begin with)

 I will start with a feedback report and go there - thanks!

 *from there

 Nick talks about testing in the session.

 Thanks - I’ll be watching!

(just submitted FB10080236)

---
> ####  Is there a way I can unarchive `CD_moveReceipt` object created when doing cloudkit share so I can see the contents inside it. This is for the custom implementation of the sync behaviour that uses the same schema/data that is generated on Cloudkit by CoreData.


 No

 Its contents and encoding are a private implementation detail of the framework.

 Can I ask what kind of information does it contain? and why was it added.?

I have a custom implementation that downloads and uploads those records from CloudKit that were created by `NSCloudKitPersistentContainer` .

 No, your implementation should not attempt to mutate it. If it is present on a record it must be preserved, if it is absent it must not be populated.

 Sure, thanks.

---
> ####  Does @FetchRequest in SwiftUI have all of the functionality of an NSFetchedResultsController? Or should I use NSFetchedResultsController in SwiftUI


 You can pass an `NSFetchRequest` to `@FetchRequest`’s initializer, so it’s _basically_ equivalent. What are you trying to do?

 My app’s database will grow exponentially each year and the data can’t be archived.  I’m very keen to be able to limit my fetches efficiently and was told that NSFetchedResultsController was the way. Then one online video I saw (not Apple) suggested that @FetchRequest wrapped NSFetchedResultsController. So I wondered.

 Under the hood `@FetchRequest` composes an `NSFetchedResultsController` so you’ll get the same results for the same inputs, it’s just that `@FetchRequest`’s inputs are more limited.

 Thank you. That gives me lots to go forward with.

 The story around faulting is also complicated, because SwiftUI’s list diffing will trigger batch faults (but not object faults) so at scale the current best practice is to enable `returnsObjectsAsFaults` in the fetch request

 I had wondered if SwiftUI imposed limits in the fetchrequest based on knowing how much data might be present on the screen.

 if you tell SwiftUI to track the state of a billion rows it will die trying

---
> ####  Any best practices for a Core Data sqlite store in an app group directory where an app and extensions can read and write? This setup leads to rare crashes probably related to multiple processes doing something concurrently.


 We support multiple processes writing to the same sqlite database (preferably in our default configuration, which is SQLite's WAL mode)

 what kind of crashes ?

 Do you have a crash report handy? Off the top of my head the most common reason for this is that Runningboard will kill the process when it suspends with a write lock on the database.

 The most common is the system decided that you don't get any more time when running in the background.

 If you are seeing crashes around the file being removed out from underneath the other due to file manipulations , we provide API to interact with the files that will not crash the App/Extenstion :


```
NSPersistentStoreCoordinator.h

- (BOOL)destroyPersistentStoreAtURL:(NSURL *)url withType:(NSString *)storeType options:(nullable NSDictionary *)options error:(NSError**)error API_AVAILABLE(macosx(10.11),ios(9.0));

- (BOOL)replacePersistentStoreAtURL:(NSURL *)destinationURL destinationOptions:(nullable NSDictionary *)destinationOptions withPersistentStoreFromURL:(NSURL *)sourceURL sourceOptions:(nullable NSDictionary *)sourceOptions storeType:(NSString *)storeType error:(NSError**)error API_AVAILABLE(macosx(10.11),ios(9.0));
```


 We're still experimenting on this, but it happens during stack setup. NSSQLiteErrorDomain error 11, We changed some things and then got NSSQLiteErrorDomain error 261 sometimes. We migrated from deleting with FileManager to using these destroyPersistentStoreAtURL and replacePersistentStoreAtURL APIs.

 `11` is `SQLITE_CORRUPT`, `261`<https://www.sqlite.org/rescode.html#busy_recovery| is >`SQLITE_BUSY_RECOVERY`, so that’s strictly an improvement :grimacing:

Are you able to reproduce this on demand or are you just getting reports from the field?

 From the field

 So technically for App Group shared databases the stack setup doesn't need additional locking or synchronization for multiple processes and Core Data should handle this out of the box? But it could be an issue, if setup doesn't complete and holds a lock while in the background?

 you definitely don't want to be deleting things shared by multiple processes

 the file locks managing that are on the files ... being deleted.  ends badly.

 We ship a database seed in the app bundle and sometimes have to replace the current database with a new one from the bundle.

 `replacePersistentStoreAtURL` is the right tool for that

 Yes, we use replacePersistentStoreAtURL for this

 It helps for your own sanity to ensure that only one process responsible for the ownership of the files themselves

 :point_up::skin-tone-2: indeed, just because something can be done safely doesn’t mean it will—most multiprocess clients have the best luck if only one process is responsible for emergency reconstruction work

 Okay thank you. We don't have that currently. Widgets and other extensions can also do this replacement from the bundle and then after that fetch and save additional new data from a server.

 Is it possible to make it so only the application does the replacement, and if the widget/extension notices a need for replacement, the user is messaged that the application needs to be opened

---
> ####  Can a pre-made store be used as the store description for SwiftUI previews? If I want to have different previews show different possible states, can I somehow use different test stores?


 I haven’t personally done this, but it should work just fine. The downside of this approach is that the pre-made store is going to have to be in your bundle, which means it’ll get shipped with your app unless you do whacky stuff with your build configurations

 You can't add them to the `Preview Content` folder to be ignored in the build?

 I tend to have one or more helpers that construct an in-memory store with the test data I want for the preview being rendered, not unlike the new project template for Core Data + SwiftUI apps in Xcode

 Again, I haven’t tried it but it should work!

---
> ####  I have an app that uses CoreData and NSPersistentCloudKitContainer. Currently, receiving record updates via CloudKit in the background while the app is inactive results stale data being displayed via my apps widget and local notifications. This is time sensitive information to the user and results in a poorer user experience. Is it possible to increase the processing queue priority for record updates that happen in the background? Can we manually request an update in a widget process?


 It’s probably best to start with a feedback report with your app attached and detailed set of steps for a use case you would like to see better support for.

 Understood. In iOS 16, is it still the case that forcing a sync or being notified that a sync has completed is unavailable?

 We post notifications about syncing already.  You'll want to look at NSPersisentCloudKitContainerEvent

 that's available now

 there's no mechanism to force an immediate sync on demand

 My app is a bookmarking application. I display a bookmarks the user has not yet read in a widget. If the user reads the book on their iPad, the widget on their iPhone may not update ever. The moment the user opens the app on their iPhone, the bookmark update is digested correctly.

 That is the current state of the platform. Push notifications wake your app, not your widget.

 Widgets don't get a lot of background time to perform network operations or syncs

 I have seen those events come in the background, however until I launch the full app, the updated records are not digested.

 That’s worth a feedback report with a sysdiagnose and your app

 It’s possible you’re missing the appropriate background activity entitlements, or that when your app is launched in a specific background mode you’re not loading the container.

 But even then there’s no guarantee NSPersistentCloudKitContainer will be approved to do work on your behalf.

 It’s not possible to say which without logs though. Or if monitoring remote change notifications yourself in the widget would help.

 Understood.

 I believe this is a common issue. Enough that others in the developer community have written articles and twitter threads on it. For example: <https://twitter.com/stroughtonsmith/status/1514378073231212546?s=21>

 And here from the developer of Streaks: <https://crunchybagel.com/nspersistentcloudkitcontainer/>

 Point #4.

 We are happy to continue evaluating and prioritizing their feedback reports.

 Thank you for your time. I really appreciate it. I love the simplicity of NSPersistentCloudKitContainer. I hope that any Feedback I submit on the issue allows for this to get resolved.

 One last thing: Is the intended behavior that when the app launches in the background with `NSPersistentStoreRemoteChangeNotification` that the app is able to query for the updated records in the background handler?

 I have an `NSFetchedResultsController` that monitors for new changes to the database and triggers Widget refreshes. That does not seem to be getting called in the background thread.

 I’m not sure we can tell without a reproducible example.

---
> ####  If I know I'll be sharing an entire Core Data database, should I set the `databaseScope` to `.shared` right from the get go? Or can you migrate a `.private` database to be shared after the fact? My app can have multiple database documents, each with their own .sqlite store, so I want to share the entire thing, not just individual records. Different database documents could be shared with different people too.


 That’s not how sharing works. I recommend watching this session: <https://developer.apple.com/wwdc21/10015>

 Sharing requires a database pair, one shared and one private.

 Shares are created for specific populations of users and data is moved from the private database to the shared as needed.

 disjoint collections of users operate on different pieces of data.

 For example you can’t share DocumentA with UserGroup1 and UserGroup2.

UserGroup2 would operate on DocumentB, even if their contents are semantically identical from the perspective of your application

 So by a database pair, do you mean two local sqlite stores? One for your private stuff and one that contains shared data? Even if it’s the same data as your private store’s data? I did watch that video just today but it seemed that he was dealing with just sharing individual records and not the entire database.

 I’m not really sure what you mean by entire database?

 the whole .sqlite file. I have many entities in my CoreData model. I want to share them all with different users.

 Which users do you want to access which objects?

 Like in the Notes app you can share individual Notes. I want to share the entire database of Notes. That’s just an example. My app obviously isn’t Notes.

 Sure but… with whom?

 My app is a database app called Tap Forms. You can create your own databases with many records, field, forms, etc. All those entities are stored in a single sqlite file. I want to share an entire database with any other iCloud customer. For example, my family or perhaps work colleagues, etc.

 I know I can sync the entire database with my own devices. But I want to sync a database with other people too. Not just syncing individual records.

 From our perspective that’s just a graph of objects shared to a collection of users.

 You nominate the graph by calling `NSPersistentCloudKitContainer.shareManagedObject…` and a CKShare is created to which you can add participants.

 There could be a hundred thousand objects in my database. Or more.

 The proportion of your private database that’s shared is immaterial.

 &gt; There could be a hundred thousand objects in my database
Let us know how that goes!

 Interesting. So you need a root object to share?

 I can have many root objects. Categories -&gt; Forms -&gt; Fields / Records / Layouts, etc.

 No. `shareManagedObjects` takes an array of objects. They don’t strictly speaking have to be roots.

 NSPersistentCloudKitContainer will traverse the graph and share all of the connected nodes.

 Hundreds of thousands will take some time, CloudKit operates on them in batches of up to 400.

 But that’s not beyond its capabilities.

 Ah cool. Ok thanks. Looking forward to giving this a go.

---
> ####  Is there a rule of thumb for when to use @FetchRequest versus fetching data as a @Published variable in some @ObservableObject?


 I’d say that in general you should use `@FetchRequest` whenever your needs can be defined in terms of a predicate + sort descriptor(s).

 It’s already built in, why do more work than you have to?

 We might be biased.

 How biased?  That seemed like a pretty bold statement by Scott.  Updates to CoreData seemed to be one of the highest priority wishlist items by the community

 If I have a list where each row shows some progress of X/Y, is it better to pre-fetch all of these possible rows or let each row itself make a @FetchRequest for its status?

 I am apparently an engineer, and not a comedian.

 I would definitely use `@fetchRequest` If you have a lot of rows, set a batch size.

 <@U03JEL0155X> if reasonable this actually sounds like a good Derived Attribute to me

 Thanks

 if you can define the progress in terms of `@sum` then the row’s managed object will have all the data it needs to display it

 Not quite sure I understand. Basically, my app is a flashcard app where these rows represent the number of learned items in a lesson. My `X` value would be some predicate of `lesson == 1 AND learned == true`  where the `Y` value would just be `lesson == 1`.

I can add this as some precomputed derived attribute?

 right so if `Lesson` has a 1:many relationship to `Item` then you could add an `itemsCount` to `Lesson` with the derivation expression `items.@count` to use as your progress’ denominator and `itemsFinished` with `items.learned.@count` (pretty sure?) as your numerator

 ran out of time to edit but can confirm `items.learned.@count` is what you want for counting finished items.

 Thanks, I'll take a look into derived attributes. I am not familiar with them.

 <https://developer.apple.com/documentation/coredata/nsderivedattributedescription|Here are the docs>, the short intro is you can think of them as denormalization automatically managed by Core Data.

---
> ####  What would be the best strategy to add unique constraints to entities stored through CoreData in CloudKit? It can be done "locally" but not for entities in CloudKit (unless that has changed this year?)


 Generally having a local store that imposes your unique constraint and then moving records to a cloud-backed store.

 This technique allows you to validate incoming partially formed graphs before showing them to the user.

 but requires an additional store file

 I've currently setup two Configurations for that exact purpose (and also picking a subset of the properties I want to sync). I'm not sure I'm doing this right though as I:
• Override willSave() on my local entity so that changes get reflected on my "cloud" entity.
• I go through transaction history when a change happen to my cloud entities and reflect the changes to my local ones.
Does that sound about right or would there be a more robust way of doing what you suggested?

 Normally folks use NSManagedObjectContextDidSaveChanges or persistent history to reflect the changes in the other direction too, but that sounds about right

 I opted for the solution above as changes made by CloudKit did not seem to create a `NSManagedObjectContextDidSaveChanges` notification. Instead I'm listening for a successful import within the `NSPersistentCloudKitContainer.eventChangedNotification`

 At scale you actually want history tracking for this.

 Pulling objects out of willSave / NSManagedObjectContextDidSave will eventually block your application / cause it to keep them around longer than necessary.

 Sounds like I've got the right approach then! Thanks a lot!

 History tracking allows you to traverse the changes asynchronously and look for mutations that are ready to push to the Cloud store or vice versa

 Ok, part of the right solution. I only consume history from CloudKit…

 Will work on that, Thank you!

---
> ####  Do you have guidance for how to implement NSPersistentCloudKitContainer such that you can make fetch requests in your widget and update it when data changes on different devices? Eg, move your database to a shared app groups and then how do you get informed when it sync in the background to trigger reloading the widget?


 This is worth a feedback report with your app and steps to reproduce for the affect you want.

 Widgets can’t be triggered / loaded by background activity in the app today.

 If the app is running, the widget can use remote notifications to see the updates.  Unfortunately there's a lot of throttling if the app is in the background, and widgets themselves don't get much processing time etiher.

 `NSPersistentStoreRemoteChangeNotification`

 Yeah, unfortunately that is also non-launching

 so the widget has to be up

 Yes, although presumably if the widget isn't up, it'll refetch everything it needs on launch

 mostly it's constrained in the other direction, by the app being up while the widget is running

 Right, the goal is to keep the widget they’ve already added to their Home Screen sufficiently up-to-date with changes made on other devices. So they don’t have to open the app to get CloudKit sync to occur, totally defeating the purpose of the widget :slightly_smiling_face:

 Thanks!

 &gt; If the app is running, the widget can use remote notifications to see the updates
Quick clarification - what if the app is not running, eg it’s been suspended in background or has been kicked out of memory? Sounds like CloudKit will sync in the background but is severely restricted so widget may not update?

 the `NSPersistentStoreRemoteChangeNotification` would be posted by the app, in this case, so no it won't

 I may need to set up a lab to discuss this in more detail :sunglasses: would you recommend CloudKit or Core Data lab?

 Or WidgetKit :laughing:

---
> ####  Can you give any hint why saving to CoreData in a background thread sometimes fails with these NSPersistentStoreCoordinator errors. Or which circumstances can lead to this error? Because this only happens on iOS 14.  [NSPersistentStoreCoordinator _coordinator_you_never_successfully_opened_the_database_so_saving_back_to_it_is_kinda_hard:] [NSPersistentStoreCoordinator _coordinator_you_never_successfully_opened_the_database_io_error:]


 These are telling you that you ignored previous errors on adding / loading

 the most common would be that the data protection class isn't available, or that the customer's device is totally absolutely out of disk space, not one KB more.

 it's also possible that you kick off asynchronous work on the background BEFORE the load has actually finished.

 we can't save from a background thread before loading / adding the store is done

 Thank you for your input. In the crash reporting I can see that some devices still have free disk space so I would rule that out. The asynchronous work start before the loading finishes sounds interesting, I will have a look into that!

---
> ####  When creating a new version of my model, I added a new entity and a fetched property pointing to it from an existing entity. Each live in a separate configuration which is why I need the fetched property. When doing a lightweight migration, loadPersistentStores seems to crash with error "Can't use fetch request with fetched property description (entity model mismatch)". Is that a bug I should report or expected behavior? If so, how can I successfully migrate between the two models?


 A bug report would be useful.  It shouldn't fail during migration

 that said, you can't fetch across different configurations without different persistent stores being loaded (one for each configuration)

 so it's a bit weird to put a fetched property on an entity that can't be used for itself

 basically you've created an entity that can't be used if loaded from only 1 store, and we're not happy about that.

 It would probably be easier to not use a modeled fetched property and instead create the NSFetchRequest in code.

 I do have two `NSPersistentStoreDescription` in my container but yes I guess the local store is being migrated first and it has no knowledge of the other store's existence.
I ended up doing the NSFetchRequest as you suggested but wanted to sense check my approach.

---
> ####  Do you have any idea how a lightweight migration could fail (but only occasionaly in some cases). It fails in the [NSPersistentStoreCoordinator migratePersistentStore:toURL:options:withType:error:] method and apparently because of: [__NSArrayM replaceObjectAtIndex:withObject:]: object cannot be nil.  I am confused because this is not 100 percent reproducible and the migration runs fine on some devices so the migration setup does not seem incorrect per se.


 that's worth a bug report, and if you can include a sample store file (db, -wal too!) and both the old and new xcdatamodel that would be a huge help

 in general, though, you don't need to use `migratePersistentStore:toURL:options:withType:error` for a migration.  Just set the allows inferred migration and automatic migration options in the options dictionary when you add the store

 There is also a session on lightweight migration on Thursday if you want to check that out!

 ^

 I already bookmarked it and look forward to it :+1:

---
> ####  If I have a relationship between two Entities where Entity A - Entity B and I want to create and append a new instance of Entity B to an instance of Entity A (where some property on type A == some property declared on entity type B), is there a preferred way or even, place, to do this?  My gut is telling me to create a function on some kind of CoreDataController class that will accept an argument for Entity type B that is being appended to an Entity type A record and then apply some conditional inside the function that will check to see if this can be appended. Or, would this kind of function be placed in a ViewModel for Entity B?


 Clarifying your question, it sounds like you’re wanting to conditionally add a new managed object to a to-many relationship?

 Hey, yes that's correct!

 Creating your own method seems to be a perfectly fine way to solve this problem

 Not only do I feel unclear about where this function should live, I also feel a little unsure about then querying the object that I'm conditionally checking. Let's say we're in a view designed for Entity type B objects, I've added a new Entity B and I want to then conditionally assign it to an Entity A... should I simply be going through the moc, filtering on the Entity A's within and then if I successfully return an instance of one, then assign Entity B to it ?

 Some folks have used the `NSManagedObjectContextWillSaveNotification` for this

 Thanks, I'll have a look into that! Is there a standard way to do this? I think a part of the confusion for me here is architecture patterns haha

 To create an associated EntityB every time you create an EntityA ?

 No, if we have Entity A and B with a relationship of A -&gt;&gt; B, I've created an instance of B and I want to assign to conditionally. For ease of example let's say where B.categoryName == A.name.

Does the above simply require me to create a new NSFetchRequest on type A, then filter by .name and pull out the item that matches B.categoryName before finally assigning B to A

 Sorry if I'm not being very clear, it's been a long day :rolling_on_the_floor_laughing:

 it's just getting going!

 What time is it there? 22:45 here

 14:45

 Oooh jealous, there's never enough hours in the day!

 are these really formally related ?  As in if any of the properties change you want to update the objects as well ?

 or do you just want a computation that fetches all the B's that match A's name ?

 I want them to have complete referential integrity

 so if B's categoryName changes, or if A's name changes, you also want to update this relationship ?

 Yeah, that's the one!

 categories are just an example per se but the logic still applies to my problem

 I think I'd start with `NSManagedObjectContextWillSaveNotification` to update these in the same transaction whenever possible, and also have an observer on persistent history to review the A &amp; B state whenever those properties change.

 Sorry, not quite sure I've explained myself very well haha

 The properties changing is not relevant really and is not a deciding factor for me choosing to create two Entities with a One to Many relationship. My main query I suppose is if I were to have a function, where will this function reside? In the ViewModel for Entity B (the new Object being saved) or on the DataController: ObservableObject class that manages the viewContext?

 Hmm.  It's a little odd to have a constraint but not maintain it.  For simply creating the relationship in the first place, you have a lot of flexibility.

 Core Data manages the inverse automatically, so you can do it from either side, based on what's convenient

 Said function is just going to
1. create the new Entity B
2. query all Entity A objects that are saved to the MOC
3. pull out the one that matches the query
4. append the relationship property of the newly created Entity B to the newly found Entity A
5. Save the MOC

 Anywhere you like.   The challenge is how you structure things to ensure creating entityB always uses the same flow

 Haha I think this is what I'm struggling with. I feel like as much as there are plenty of ways to do things in most languages, I am very happy to know what the de-facto standard is for some things :rolling_on_the_floor_laughing:

 Quite easy to feel like you're possibly doing things that are more expensive than required or making things worse in the long run!

 When you say you can do it from either side, what do you mean by that? I'm presuming that in order to create a the above function id also need to have a fetch request to filter on and query my conditional argument for locating the right Entity A object

 Sorry, this is longer than I thought it would be for you :see_no_evil:

 You can establish the relationship either from B to A, or from A to B, however is convenient

 Either way, is it still the right approach that I use some kind of filtered fetch request before assignment? Unless for example I knew that one part of the relationship was static and I just wanted to say something like EntityA.entityBItems = EntityB[7]

 Thanks for replying either way mate, I did catch the message in the centre stating the Q&amp;A was done for today!

 I think for a very generalized thing, a fetch request would be the way.  Fetching requires I/O, though, so it can be expensive if you do a very large numbers of very small requests

 This is what I was thinking hence asking if there was a standardised approach :thinking_face:

 It just feels wasteful

 the other approach folks sometimes use is to set a unique constraint (like on B's categoryName) and then just always creating a B and letting us upsert it

 upsert?

 that may be a little less convenient for your use case

 (insert or update)

 another approach is to assigned a batch of Bs together instead of one at a time.  that way you could do a fetch for the batch

 I think I'd be tempted to start with the simple fetch, and then just keep in mind it might need some refinement if the performance isn't what you need

 in the context of assigning an item to a category, I'm not sure how the above would work? If the user is creating one item at a time, but for referential integrity purposes it has to be assigned to a category, it feels as though the only way is to do a fetch request every time before assigning it?

 If A needs a B with a category X, it can just always create B with name X if B has a unique constraint on X

 This is more common with stuff like JSON parsing, so you don't have to keep fetching to decide "do I need to insert, or do I need to update"

 I'll have a nosey online  

 If the use was updating an item, I'd already have the context of the item and it's properties and I'd update it from there, I wouldn't need to fetch any other properties

 Fetch any other relationships*  

 I'm simply taking about creating a relationship dynamically using a query rather than stating add X item to Y[0] (because I know that the first record in the category entity array is the one I want. If the user adds their own categories and perhaps decides to delete the first category they saved, then re-adds it and it now is at, index 7 let's say, I can't then write static code that says append object X to object[7] because it's unknown to me, I have to somehow query the entities of type Y and say right, if this category object is a match for what category the user is wanting to add it to, then pull it out, add it and then save. Logically the only way it seems to do that is by creating a filtered fetch request every time the use adds a new X Entity. Would create this function on a DataController class or on a ViewModel (for either entity)

 That is my last question, I promise :weary::rolling_on_the_floor_laughing:

 i mean, it's your only question, so sure!

 at the end of the day, either of those approaches works, and there's a gradient of options.  Neither is wronger.  The primary concern would be to facilitate batching to be efficient, if you need it

 Okay, so good to play around then and see what works best with my current model etc then tinker with the fetching etc if required for performance

 I'm sorry, as I said before, I like to know the preferred methods and I can just get stuck down in the not always necessary details!

---
> ####  Do you have any tipps how to debug and get additional information out of a [NSPersistentStoreCoordinator _introspectLastErrorAndThrow] error. Or is it "to late" if this error happens and the store setup is in an inconsistent state in general?


 Generally this will be an error from opening / loading the store file.  Have you checked the logs ?

 I was not able to repoduce it so I only have the Xcode crash reporting. It happens after a ManagedObjectContext Save.

 do you have a full crash report ?

 Only the xccrashpoints

 Hmm I think those have crash reports if you open up the bundle

---
> ####  I am not sure of this is the right place for the question because it has also to do with the WidgetKit life cycle. So before performing reads/writes we always check first if a migration is necessary. So in our Widgets we start this migration in the init method of the TimelineProvider and not necessarily wait in the life cycle methods for the migration to finish. Do you think this is error-prone? Would it be better to check the migration in every life cycle method separately, because then we could wait there for the migration to finish before performing reads/writes. By writing this I think I have answered it myself. But I would be interested in your feedback as well.


 You should have the App control migration and not the Widget or Extension

 And as you mentioned, the Widget/Extension would detect a migration was needed and would either wait for that state to change before trying again or prompt the user to open the App

 But how should I handle the case then when there is a core data migration necessary and the widget code runs before the app gets opened?

 Is there any reason why a migration should not be performed from a widget extension?

 The widget may succeed in migration, but if the migration takes too long it will not be able to finish the migration and would likely loop on that type of failure

 the other approach would be to have a small subset of data used by the widget in a second store, while the application uses the main store with the full data set

 the main problem is the widget will have limited resources, and that will impact the ability to migrate larger datasets

 I do not think that this is a “size” in our use case because we are talking about one entity with a few entries

 so if the migration is on-going and your widget saves, it may experience the case of attempting to save without any stores

 As I wrote I think we can fix that by waiting for the migration in the life cycle methods to prevent this.

 so you could just let migration happen asynchronously and only attempt to save if there is more than one store on the context's persistentStoreCoordinator

 The migration happens already asynchronously on a different queue with the barrier flag. I think that waiting for it to finish could be the missing link.

---
> ####  Hi, I’m wondering if the best practice when using NSPersistentCloudKitContainer is to never purge the Core Data persistent history. The documentation for persistent history tracking talks about purging history to reduce storage usage, but that you obviously need a single gatekeeper to determine the oldest history to keep. The NSPersistentCloudKitContainer example projects process persistent history but never attempt to purge any. I see that I might be able to use NSPersistentCloudKitContainer.Event to get a date/time when a sync occurs but I’m not confident this is a wise choice.  For my app that will likely have 10-15 “rows” added each day (each with 7-10 integer/double/string “fields”) where there’s a small chance those might be updated / deleted in the future, should I just not worry about purging persistent history? What about a hypothetical app where we’re doing thousands of INSERTs/UPDATEs/DELETEs each day?


 Hi Johann, we don’t recommend purging history when using `NSPersistentCloudKitContainer`. This may cause an undesirable user experience and cause a reset sync. The class uses the persistent history as an index of how far it is through an import or export.

 Ok, in a situation where my app is doing lots of core data changes and I notice a lot of storage space being used, could I use NSPersistentCloudKitContainer.Event to get a rough idea on how much history could be purged, or should I just never touch it?

 You can.  I'd suggest a very large buffer period, though.

 Ok, thanks!

---
> ####  Just got into NSPersistentCloudKitContainer so haven't been able to try it out. Does NSPersistentCloudKitContainer also perform lightweight migrations automatically?


 Asked the question a bit to quickly, got the info in the presentation :smile:

 Awesome!

 We love to hear it!

 <@U03J2GNP82E> if you have any followup questions, feel free to ask here or with another workflow submission!

---
> ####  Hi ... thanks for the talk. I've been using Core Data for a few years, and from what I remember, if we wanted to update our data model, we had to create a new 'version' of the data model, make our changed there, and select the new version in the model  properties, before lightweight migration would work. At what point was that behavior changed so that we don't need to create a new version anymore? Are there any benefits for creating a model version?


 Yes, one of the benefits of creating a new model version is that it allows you to perform migrations that aren’t eligible for lightweight migration if that non-conforming migration is broken down into multiple steps.

 Near the end of the session, I talked about this. But otherwise, feel free to make your changes to your current model and open the store with both migration keys set!

 Thanks. But I'm still curious about this ...  from what I remember (and I may be wrong here), we needed to create new model versions even for lightweight migrations. When did that change? I might have missed the memo! :slightly_smiling_face:

 Apparently this changed in WWDC15, around iOS9!

---
> ####  How efficient is the Core Data migration process, in terms of time and memory? For e.g. if we have a million entries in our store, and we run lightweight migration to add a couple of attributes to an entity, will it load them all into memory at the time of migration to update each row?


 We will add the columns without loading any data  

 Lightweight migration is very efficient and is the recommended way to migrate!

 Good to know! Is this something that changed recently / a few years ago? This is also something I remember being a bit of a challenge in the past, especially with large data sets

 I think it’s fair to say that lightweight migration has a number of different behaviors based on the specific type of migration it’s handling. Additive ones are easy, no data needs to be loaded. But transformative migrations necessarily operate on in memory data in some cases.

 If you have a migration that’s not meeting your scalability requirements we would want a feedback report with a test in it to investigate / tune around.

 Would "transformative migrations" include things like changing a relationship from one-to-many to many-to-many?

 I believe so, IIRC we’ll need to do a table copy to drop the to-one column.

 Thanks!

 One more thing about this ... would creating a new relationship (whether one-to-many or many-to-many) between existing entities be considered 'transformative'?

 I wouldn’t expect so. Column adds are free and table adds are too.

---
> ####  Hey there, I have a question regarding the staged lightweight migrations. How can we actually interpose code between migrations, like shown at around 09:33? Is there a way to get the model version numbers of the models between the current and the newest, so that we can create a loop to apply one migration wirth additional code after another?


 So the idea is that you’ll need to build a state machine that is able to iterate over your models and apply them if needed. At launch time, collect all the models and check to see if there is any models to be applied. You could try opening the store with the first model *without* the migration keys set and see if it opens. If not, you’ll get an error back. That is an indiction a migration is needed

 Now, you’d want to go ahead and attempt to re-open the store with the migration keys set. Once the store is opened and the migration is complete, consider having a delegate that you could call.

 The purpose of this delegate is to perform model specific logic/migration.

 After completing that logic, your state machine would continue on and process each unapplied model in a serial fashion performing the same logic.

 Thanks for your reply! Is there a way to get all the available models or would we need to „hardcode“ the names?

 You should be able to get all the models with .allBundles and .allFrameworks

 Alright, thank you :blush: This approach sounds very interesting, especially because we don't need to do heavyweight migration. The official lightweight documentation does currently not mention this approach, do you know if this is planned or if it is documented elsewhere?

 [Removed by self]

---
> ####  Does adding indexes to existing attributes also force a lightweight migration to occur?


 It doesn’t. You’ll need to perform some other change that changes the version hashes of the model.

 You mean like adding a new attribute or entity?

 Yes, this would cause a hash change.

 You can also bump the models version hash with your own custom identifier to trigger the migration as well

---
> ####  It seems like lightweight migration has quietly got a lot more capable over the years… is that correct? I’ve had to do some heavier migrations in the past with my data model, e.g., when moving from a grandparent-parent-child relationship to a direct grandparent-child relationship... Wondering if that is an example of something that could be achieved by a lightweight migration (if I wasn't now also using NSPersistentCloudKitContainer).  Is there further written documentation somewhere of the kinds of migrations that lightweight migration is well set up to take on, building on the ideas in this talk?


 Hi, yes I believe this can be accomplished with lightweight migration, but it may need to be decomposed as I mentioned in the talk.

 Moving entities within the entity hierarchy is a supported lightweight operation

 As well as changing relationships, (adding, deleting, etc).

 The official documentation is here: <https://developer.apple.com/documentation/coredata/using_lightweight_migration>

---
> ####  Hello! One of my apps, which has evolved more and more over time i.e. more and more attributes getting added to the Core Data model without much thought, now has a Core Data Model of over 150 items. This causes a caution in Xcode. Is there a safe way to divide all of this up to reduce the stress on the Core Data model while keeping user data safe? Thanks :D


 Hi! You should be able to divide up the model using the lightweight operations I mentioned. If you want to preserve the data, you’ll need to perform an operation similar to what I described in the session, temporarily stashing the data and adding a new attribute in a new entity. This will require a “decomposed” migration.

 That’s fantastic! Really appreciate the response! :D

---
> ####  In the Session, Xcode “Arguments Passed On Launch” Core Data debug features are shown (at ~15:31). I never knew these existed!! Is there a list on Apple Developer of these arguments?


 Great question! We’ve got some documentation from the Documentation Archive that may help you out, but please use <https://feedbackassistant.apple.com|Feedback Assistant> to suggest some new documentation in this area specifically!

<https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/TroubleshootingCoreData.html>

 Thank you so much! :D

 If you file a Feedback, feel free to drop the Feedback ID here and I’ll pass it along!

---
> ####  If I am using an NSPersistentCloudKitContainer and manually assign persistent store descriptions with history tracking and remote change notification options, will the container still handle migrations automatically? Or do I need to additionally include the migrate and infer mapping options to my descriptions?


 Lightweight migration only materializes schema changes in the local store file. Regardless of whether a particular store is used with CloudKit, migration will only change the store on disk and does not make changes to the CloudKit schema. You still need to materialize those changes in the Development database by running the schema initializer and then  promoting those changes in Development to Production using the CloudKit Console.

 Sure, that makes sense. I've made the proper changes to my CloudKit schema, but am curious to know if my custom store descriptions that I'm assigning to my container need to include these migration options or if the container handles that for me.

 If you’re using NSPersistentStoreDescription or NSPersistent[CloudKit]Container, the options are automatically added for you.

---
> ####  Is this possible to load db created with newer model version in app with older version without light weight migration? If disable migration NSMigratePersistentStoresAutomaticallyOption = false it just fails to load store. Thank you!


 It is not possible, you will get an error that the models are mismatched  

 So there are no ways to open without migration? may be with custom migrations?

 You can provide your own mapping model  

 And drive a custom migration with your own NSMigrationManager

---
> ####  I am in the very final stages of finishing up a SwiftUI app that uses core data with cloudkit. I was wondering if there is guidance on error handling when loading the persistent store? Is there a list explicit errors that I should handle beyond the generic info that is in the comment when I created the app?


 One error code that you should definitely handle is `NSPersistentStoreIncompatibleVersionHashError`. You may wish to handle such as read or write errors. However, the best way to discover this is having telemetry on what errors your users run across and what errors testing generates. This would allow you to make informed decisions on which codes to implement and handle.

 Thank you! In beta testing, I've not run into any errors with loading the store (which I've been super pleased with). I appreciate the help!

---
> ####  Is there a built-in way to encrypt and decrypt a local Core Data store so it's encrypted at rest on macOS and iOS? I know on iOS file system security plays a role when the device is locked. But not on macOS. And if someone wanted to send someone else an encrypted version of their database, they wouldn't want anyone else to get access to it other than the person they shared the key with.


 Data protection is available on macOS as well for Apple Silicon devices so it remains the best way to do this when available. When it comes to sending databases I must urge caution (use something like <https://www.sqlite.org/backup.html|SQLite’s online backup API> so you’re participating in the locking protocol and don’t risk corrupting the database!) but once you’ve copied the database you’re outside of Core Data and can choose whatever encryption transport (and key management) you like.

 Sending a database to someone feels like an obvious application for a public key cryptography scheme

 In the current version of my app, it uses CouchbaseLite, but I’m migrating it all over to Core Data. CouchbaseLite integrates with SQLCipher to provide at rest strong AES 128 encryption. I’d like to use that with Core Data too. I know there’s a third party library that uses NSIncrementalStore to provide integration with SQLCipher, but it hasn’t been updated in over 5 years and I’m hesitant to use it. But I still want to be able to provide my customers with encryption in my new Core Data app. I was hoping there was an Apple way of providing encryption to my Core Data sqlite store.

 Unfortunately there’s no API for this. I don’t recommend mixing a custom build of SQLite into your process for Core Data to use, it will cause more problems than it will solve.

---
> ####  We're changing our core data model and will be moving some properties to separate entities. Since these properties have been deployed to CloudKit Production they can't be removed there. But is it ok to remove them in the Core Data model? Or is it recommended to keep them, even if they're no longer used?


 Do you need to support users on older versions of the app?

 Yeah, we want the app to continue to work for people who haven’t updated yet. We are quite aggressive on updating our deployment target, so it’s important to keep users on old iOS versions happy.

 You’d probably want to keep that around then

 Is it possible to keep updating that field in addition to the new one so both users can use the feature?

 Preferraby not. We’re moving an image from the entity to a new entity, improving performance and introducing a 1-many relationship (multiple images)

 In worst case the user will just stop seeing the image in older versions of the app. Maybe that’s ok? :thinking_face:

 That really depends on what you want your product experience to be.

 But there is no technical restriction on it.

 Got it. Thanks!

---
> ####  Are there any sample apps that showcase SwiftUI along with CoreData + CloudKit synchronization with .private, .shared, as welll as .public database?


 You can refer to <https://developer.apple.com/documentation/coredata/synchronizing_a_local_store_to_the_cloud|Synchronizing a local store to the cloud> to learn more about Core Data and CloudKit together, but that sample isn’t written using SwiftUI.

Please let us know using <https://feedbackassistant.apple.com|Feedback Assistant> if you’d like to see an update to the sample code using SwiftUI like this!

 Also, refer to <https://developer.apple.com/wwdc22/10119|Optimize your use of Core Data and CloudKit> to learn more about using Core Data and CloudKit!

 thank you <@U03HWU7EYBB>! I will submit feedback. Implementing .private is straightforward, but using .shared and .public is definitely non-trivial and deserves more attention, given how powerful these features are. Also, there should be guidelines about how to create these experiences. For example, how to moderate content, create and propagate rules for users, etc.

 Of course! Feel free to reply with your Feedback ID for us to look into if you get a moment to file it now

 Alright, sent at FB10138481

---
> ####  Is there a Code sample for Staged Lightweight Migration? I came up with my own solution to do that, but now I'm wondering if this talk means there's a conventional solution.


 We do not have one.

 All right then! Thanks <@U03HFC8U0J1>

---
> ####  I wrote the following code in order to merge changes from the backgroundContext into the viewContext:  --------- func mergeChangesAutomatically() {     NotificationCenter.default.addObserver(forName: .NSManagedObjectContextDidSave,                                            object: nil,                                            queue: nil, using: { notification in         guard let context = notification.object as? NSManagedObjectContext, context != viewContext else { return }          viewContext.perform {             self.viewContext.mergeChanges(fromContextDidSave: notification)         }     }) } ---------  Is this code necessary? Changes made to the backgroundContext shows up in the viewContext even without this code, so I was wondering if this is actually needed.


 if viewContext.automaticallyMergesChangesFromParent == true - correct this is unnecessary

 I'd add that `automaticallyMergesChangesFromParent` only covers changes within this process / NSPersistentStoreCoordinator.  If you want changes from a widget or extension, then you would need to merge changes from persistent history

 similarly, batch operations don't post notifications, so they would also need to be pulled from history.   However they are typically unusual enough that folks often simply ask their fetched results controller to refetch (or they view fetch again) instead of merging

---
> ####  Hi. I've read that both Voice Memos as well as Images (Pictures) should be stored outside of CoreData (FileManager) with only saving references of these in CoreData for performance reasons. A) Is that true? B) (How) Can I still lock the whole storage of the app behind a passcode/FaceID/TouchID?


 A) That is not true.

Core Data supports a number of different strategies for managing large assets:

1. Check the “Allows External Storage” box. <https://developer.apple.com/documentation/coredata/nsattributedescription/1498295-allowsexternalbinarydatastorage?language=objc>
2. Store the asset across a relationship
3. Use a foreign key reference (as you described)
We don’t generally see folks opt in to 3 until their assets reach the gigabyte range. The reason is that it becomes difficult to fit them all on a device at scale, or that they cannot fit in memory. NSManagedObject does not have streaming APIs, so clients that need to use streaming or buffering techniques will use their own files outside their Core Data store.

 B) Core Data supports file protection. <https://developer.apple.com/documentation/coredata/nspersistentstorefileprotectionkey?language=objc>

 There's a gradient of options and some things "feel" better in the database v.s. a discrete file on the file system.

 The database excels at smaller column values, and the file system excels at many MB sized items.

 both can handle a broad intermediate range

 usually a driving consideration is if the assets will be routed through another system using a URL based API.  eg audio or video played via a streaming API

 3 is popular at sizes in the MB+ range, but not a requirement.  If you store assets outside the database then you're stuck with managing your own two phase commit problem.

 Thanks for your replies! Are you talking about assets which get compiled or “things the user can store in the app”? Sorry if I wasn’t all that clear up front. Coding is a foreign language in a foreign language for me so I’m not used to use the correct terminology I’m afraid. So: I wasn’t asking about assets that get compiled. The app I’m building has 2 Entities which should store (among other Attributes) Images and 1 Entity which should store  Voice Memos. I learned via google and forum entries I found that both should in theory be of type Binary Data but that one should consider storing these in FileManager instead and just link to them.

 &gt;  Are you talking about assets which get compiled or “things the user can store in the app”?
I don’t think we’re making a distinction. Our metric is about the size of the payload, i.e. megabytes, gigabytes, etc.

We don’t particularly care how you get there (i.e. building a resource file vs. user contributed data).

 Alright, thanks for the clarification and again sorry for the confusion! With that I’ll have some new paths to dive into in the coming weeks! Many thanks!

 I store files in a separate Media entity and the blob is set to use external storage. That way it makes sync much easier. You don't need to manually manage syncing of an external set of files. Plus it eliminates file name conflicts since the file name is stored in a property of my Media entity.  

---
> ####  The NSPersistentHistory feature seems designed for syncing with CloudKit. Is it still an appropriate use of persistent history to work with a custom syncing solution not based on CloudKit?


 absolutely!

 Persistent history is for everyone

 :raised_hands: Thank you!

 You can also use it to drive view refreshing between processes with remote change notifications.  No syncing.

 Here is a bit more about Remote Change Notifications and the option to enable them for your Persistent Stores:


```
/* When NSPersistentStoreRemoteChangeNotificationPostOptionKey is set to YES, a NSPersistentStoreRemoteChangeNotification is posted for every
 write to the store, this includes writes that are done by other processes
 */
COREDATA_EXTERN NSString * const NSPersistentStoreRemoteChangeNotificationPostOptionKey API_AVAILABLE(macosx(10.15),ios(13.0),tvos(13.0),watchos(6.0));

/* NSPersistentStoreRemoteChangeNotification is posted for all cross process writes to the store
 The payload is the store UUID (NSStoreUUIDKey), store URL (NSPersistentStoreURLKey), and NSPersistentHistoryToken for the transaction (if NSPersistentHistoryTrackingKey was also set)
 */
COREDATA_EXTERN NSString * const NSPersistentStoreRemoteChangeNotification API_AVAILABLE(macosx(10.14),ios(12.0),tvos(12.0),watchos(5.0));
```


 Neat. I've been exploring those for the purposes of disconnecting my custom sync management from existing code which deals with modifying objects, but I'll definitely keep them in mind when we start to add more external processes/extensions. Thanks!

---
> ####  I'm using a constraint in the data model for deduping, so I don't have to worry about whether a record already exists at the code level before creating the managed object and saving the context. So far it's working great, but I notice I now get a lot of Objective-C exceptions fired due to the constraint. Does this mean I'm doing it wrong? Should I first fetch to see if the record already exists before creating the managed object and saving? I figured that would be a performance hit but the exception makes me think I should avoid triggering this constraint at the database level.


 Core Data uses exceptions internally for control flow.

 We don’t expect them to escape the context though, i.e. with an appropriate merge policy set, not `NSErrorMergePolicy`  , `NSManagedObjectContext`  will catch the exception and resolve the conflict for you.

 Actually, sorry, I should have specified - I’m not seeing any crashing or anything, but when I turn on an Objective-C Exception breakpoint, it starts getting hit. Everything works fine besides the breakpoint catching

 yes, those are ours for our internal flow.  You should see anything needed reported as errors out of the API entry points

 :thumbsup: sounds good, I don’t remember seeing any errors coming from the API, so it sounds like I’m good. thanks!

---
> ####  Is an NSManagedObjectID's URI guaranteed to be unique across devices (as much as one can expect from a random UUID) assuming the default NSPersistentStore implementation is used?   I see that it currently is represented by the store ID (which is a UUID by default, documented by Apple to be globally unique), the table name, and an integer. Is this uniqueness guaranteed? Are IDs reused if an object is deleted?


 They are unique but they are not consistent. i.e. a managed objectID on one device implies nothing about an object with the same notion of identity on another device.

 Additionally, customers can copy a store file from one device to another, and invalidate the “global” notion of uniqueness.

 Ah, I hadn't considered the copying of a store file from one device to another. That definitely complicates things... But I think it sounds like they'd still make good idempotency keys for my custom syncing solution's "create" operation. Once creation is sorted, the server is able to manage on its own. Thank you for your help!

 backup / restore is a challenge, as well as any file copies.

 I think most syncing solution end up using a uuid in a column to simplify expectations

 we don't reuse PK after deletions

 Yeah, the UUID thing is what I'm doing now. Was just sort of curious, since it might simplify some code. This is very helpful!

---
> ####  I'm suffered by error -134030 on saving managed object. Once this error happens, no objects are saved and it seems no way to recover other than restarting the app. It's appreciated to let me know how to recover from this state, or how to avoid this error.


 NSPersistentStoreSaveError            = 134030, // unclassified save error - something we depend on returned an error

 You should see much more detailed information in the error's userInfo dictionary and the system logs.

 I'd start with a breakpoint and introspecting the NSError object itself

 you can also file a feedback report with a sysdiagnose after reproducing the error and we can take a look at the logs

---
> ####  Hello everyone! Thank you for keeping this workflow enabled for us here in Europe.  In our project we started using Core Data Context alongside NSOperations. We want every remote data we fetch to be stored locally for offline usage. After a lot of reading and trial&amp;error we ended up having each Operation to create their own instance of Context that inserts/updates objects based on the network response and saves them at the end.  My question is, if we want to display these new data on screen to the user and given that you are not allowed to pass objects between threads, what's the best practise in this case? To load objects from local using the main context (UI thread) after the remote fetch was successful? Or, to pass the objectIDs from that Operation's context back to main and from there to do `object(with objectID: NSManagedObjectID)`? Thank you.


 NSManagedObjectContext uses its own dispatch serial queue, so you don't HAVE to use it with an NSOperation separately (that's a little redundant)

 for merging the changes back, usually folks use `automaticallyMergesChangesFromParent` or `mergeChangesFromContextDidSaveNotification`

---
> ####  What's the recommended way to store an image in Core Data? Store a URL in an entity to a file on disk? Transformable data within the entity? An entity relationship to another entity that just stores the data, like the NSPersistentCloudKitContainer sample app uses? What are some of the tradeoffs to consider for the above methods or any other methods I'm not thinking of?


 Any of those are fine. The tradeoffs are generally measured in instruments as heap growth or time spent doing I/O.

 This context will also be relevant: <https://wwdc22.slack.com/archives/C03GSLDRB4P/p1654880723768159>

 But generally speaking clients will choose an approach that meets their goals. We can’t make specific recommendations without a more detailed description of what you’re trying to achieve.

 I've had success with "Allows External Storage" using the pngData from the image. Just have to be careful of the memory.

 Thank you!

---
> ####  I have a Book entity that has attributes for the Date it was (1) checked out from the library and its (2) due date. I’d like to fetch entities and sort them by the *percent* of remaining time. I this possible to do with derived attributes?


 The current Function Expressions supported by Derived Attributes would not cover this case - but please file Feedback requesting this enhancement with a small example of the Function Expression you would use

 Thank you <@U03J90D8Q0Y> ! I see on &lt;NSDerivedAttributeDescriptionhttps://developer.apple.com/documentation/coredata/nsderivedattributedescriptionthat|NSDerivedAttributeDescription&gt;&lt;NSDerivedAttributeDescriptionhttps://developer.apple.com/documentation/coredata/nsderivedattributedescriptionthat| &gt;(<https://developer.apple.com/documentation/coredata/nsderivedattributedescription|https://developer.apple.com/documentation/coredata/nsderivedattributedescription>) that “`time` The current time.
`now()`” can be used. Is there no way to leverage this for my use case

 unfortunately at the moment you'd need to update an attribute like this yourself within a custom setter or a notification like `NSManagedObjectContextWillSaveNotification`

---
> ####  Apologies if this is a total newbie stupid question, But is there any reason why an NSBatchInsertRequest might fail due to reading in optionals? I'm doing my own version of reading in a JSON file and manage to populate it successfully, but am failing to get the data into CoreData


 I’m not sure we can say. A feedback report with some steps to reproduce (maybe including your app and sample data) would probably be the right place to start.

 did you model a mandatory property but then try to batch insert with a data set that is missing it ?

 Nothing is set as mandatory, and with my optionals, they all have a value or nil. But in any case, it is the first read (index 0) where it fails and in the array all three fields are populated with the right types.

 (thank you)!

 NSBatchInsertRequest is expecting an Array of Dictionaries = Array&lt;[String:Any]&gt; , where the keys of the Dictionary align with the Property Names of the Entity for the NSBatchInsertRequest.

The error when executing the NSBatchInsertRequest should provide more information as to what is missing or incorrect about the provided data

 So the first read looks like this inside:

 The dictionary looks like this:
*var* dictionaryValue: [String: *Any*] {
    [
      “tagNum”: tagNum,
      “eweTag”: eweTag,
      “dateOfBirth”: dateOfBirth
    ]
  }

 And re: errors, I’m probably not reporting them very well? All I know is where it fails

 what Error is thrown at the .execute site?

 Sorry, where would I look for the .execute site?

 *2022-06-10 18:44:17.696666+0100 TestBedForJson[24508:15579432] [persistence] Data Import Error*

 That is the console

 I created a logger type error

 Does that make sense?

 So I’m parroting most of the Earthquakes code for importing into Coredata:
*try* *await* taskContext.perform {
      *let* batchInsertRequest = *self*.newBatchInsertRequest(with: fmpRecordsList)
      *if* *let* fetchResult = *try*? taskContext.execute(batchInsertRequest),
        *let* batchInsertResult = fetchResult *as*? NSBatchInsertResult,
        *let* success = batchInsertResult.result *as*? Bool, success {
        *return*
      }
      *self*.logger.debug(“Data Import Error”)
        *throw* ErrorsFMPImport.dataImportError
    }
    print(“Successfully inserted JSON into CoreData”)
  }

 That is only printing out your custom error

 *try*? taskContext.execute(batchInsertRequest) ----&gt; this is throwing an Error, you want to inspect it for the issue you are encountering

 Yes, I know. But I’ve just solved it!!! It was the dictionary. So thank you so much.

 excellent!

 Clearly it’s good to talk!!!

 And I’m only leaving this because I don’t know how to delete or unsend a message in Slack!
======
Sorry, I think I’m confusing a display of the creation date, so let’s leave this as me = tired, you are all :heart:

 Time is an illusion, except coffee time, which is very real

---
> ####  Is it possible to rename an existing Entity and create a new Entity with existing Entity's old name? The two entities don't share the same attributes. Is just that we gave to that Entity a not so relevant name at the beginning. Thank you


 It would be as part of a “staged” migration:

1. Delete rename the old entity
2. Add the new one
This would mean that you’d need two separate model changes.

 I would recommend you check out the session “Evolve your Core Data schema” from WWDC ’22. It addresses this exact topic.

---
> ####  Is there any danger to marking an attribute as Optional in the CoreData model editor, but non-optional in the generated NSManagedObject subclass?  Related: is it ok to replace all NSSet relationships in the subclass with Set&lt;Type and read/write directly - instead of using the generated accessors?


 Instead of non optional I’d recommend using `!` so Swift knows it can actually be `nil`  e.g. `@NSManaged var foo: String!`

Replacing `NSSet?` with `Set&lt;Type&gt;` will not _crash_, but it will cause Swift’s eager bridging of collections to fault all the objects in the relationship, which will create spooky performance problems for relationships of any significant size.

 `Set`is a value type / struct and needs ALL the relationship values up front.  So it doesn't support faulting the way NSSet can as a reference type

 Does the `NSSet?` need to stay optional - or can we use `!` and assume an empty set by default?

Any recommendations for getting typed access to these relationships?

 IIRC the set is only `nil` if `isDeleted == true` so yeah `!` away

 <@U03HK7797D0> I encounter crashes if I implicitly unwrap an attribute e.g. `@NSManaged var foo: String!` and then delete the object from a SwiftUI List - as the deletion doesn’t seem to propagate downstream. I provided more info in a separate question.

 It would probably be best to delete the object by deleting it in the model and then letting Core Data propagate the changes to the `List`

 The `List` isn’t responsible for managing the state here, your model layer is. Deleting from the list prevents the model layer from doing its job

 <@U03HK7797D0> Have you considered generating the ! in @NSManaged var foo: String! for us when the model contains a default value for the field?

 Sorry I wasn’t very clear. The swipe-to-delete action deletes the object from the MOC. My other question hasn’t been approved yet but it has easily reproducible code.

 Malcolm: worth a feedback report!

 Collin: this seems like more of a feedback report (with a reproducing project) as well—this isn’t a common problem and probably has something to do with the specific code involved that isn’t really in scope for Slack Q&amp;A

 <@U03HK7797D0> I’m happy to file feedback, but I do believe this is a very common problem - from the numerous reports I’ve found online (with no solutions).

 all the more reason to track it officially!

---
> ####  Say NSPersistentCloudKitContainer is being used and a sync hasn't happened for a while and the sqlite is full of change records that contain column IDs. When a migration happens are all those change records containing column IDs updated too? E.g. even if a field is inserted rather than appended to the model that would make all the previous change records invalid. Is there any thing we should be careful about in this scenario?


 NSPersistentCloudKitContainer tracks mutations across migrations. Migrations don’t implicitly change the history of a store, but they do invalidate some pending work.

For example, if you changed an object, say the `name` attribute, and then performed a migration that deleted the `name` attribute, there would be no work to do.

 Adding an attribute doesn’t have that affect. All of the preceding changes are still valid and will be in the history tracking tables. In that case NSPersistentCloudKitContainer would still have work to do to export those changes.

---
> ####  I'd like to have a clear separation between my core data stack (NSManagedObjects) and my View layer, therefore I'd like to map my NSManagedObjects to structs along the way and still have faulting in place as well as the possibility to animate changes in my collection views. Diffable data sources accomplish that by only binding the ObjectIDs to the collection view so that the faults do not fire. Can you give me an advice how to accomplish that separation? The only thing I think that might work is to set a batch size for my fetch requests, but that feels a little odd since in a perfect world I feel like the fetch request should not know that it needs to have a batch size because its items have to be shown in a collection view.


 You need to be careful when doing this to model the same features in the layers you're building that you'll use from Core Data, most especially faulting

 making duplicates of your data in structs is fine at a small scale, but not practical at larger scales.  This is especially true of large assets types, which really deep in their souls want to be reference types

 Layer across faulting is a difficult challenge.  I think most folks who do this use composition of either an objectID or a MO and forward calls to it instead of eagerly copying the data

 to manage bridging across a diffable data source, I think you're best approach would likely be to layer across at a higher level, the fetched results controller, instead of each MO

 then you could be mapping the identities of the objects of notifications the FRC is making and keep the FRC and all its work isolated.

 <@U03HK7797D0> may have some other thoughts

 It’s easier to express something like this in SwiftUI (drycoded):


```
@FetchRequest(…) var modelObjs: FetchedResults&lt;Entity&gt;
var viewModel: LazyMapCollection&lt;EntityVM&gt; { modelObjs.lazy.map { EntityVM($0) } }
```

but there’s a lot of potential gotchas around accidentally defeating the laziness of `viewModel` (by using it in `ForEach` or `List` for example). If you know your list will have a limited size then the laziness isn’t necessary, but for something scaling beyond hundreds of cells you’d be able to measure problems pretty quickly.

 Forgot to say that I am also using a FRC in my view model (what probably a @FetchRequest is also using under the hood?) but wasn't sure if I can use a lazy map collection without the faults firing since the diffing of a List or a DiffableDataSource probably needs to have access to all of the objects to do it's thing?

---
> ####  In my CoreData model, I have a “name” field that’s nil by default. Users can choose to set a name or leave it blank. I’d like to offer a “sort by name” option in my List, but the nil names are all sorted to the beginning of the list and I’d like to put them last — is there any way to do this with FetchRequest? Smarter predicates, computer property, groups, anything?


 `NSSortDescriptor` supports the notion of ascending or descending: <https://developer.apple.com/documentation/foundation/nssortdescriptor/1408931-ascending?language=objc>

 But for more controlled tuning you would probably invent a custom column with a more specific notion of your sort order.

 i.e. if you wanted ascending sort but with nil last you could populate this column with `Z`for all `name == nil`

 Reversing the sort will also reverse-lex-sort the names. I thought we had something built in for “nils first” vs “nils last”? Did I imagine that <@U03HJA0EJ1G>?

 they should file a feedback request for this

 Yes, a new column would work — but it can't be transient right? Like I need a new property with data saved into it, synced across devices, etc. because sorting doesn't allow transient properties iirc

 Right, transient properties aren’t persisted.

 And can't be used to sort, right?

 They can in memory. `NSSortDescriptor` can take a block.

 Makes the query do an in-memory sort though, if the data is well constrained it may as well be modeled and then SQLite can use an appropriate index

 Isn't `NSSortDescriptor(keyPath:ascending:comparator:)` not allowed for CoreData? Or not allowed for FetchResults/NsFetchResultsController? I recall it not working.

 No we don’t support the comparator version, but you can apply it to the fetched results array in memory.

 Hence Nick’s suggestion to use a computed/transient property to translate `nil` to something that will sort last when used with a normal keypath sort descriptor :sunglasses:

 `sortedArrayUsingComparator:` works just fine on the array returned by `fetch()`.

 Ah I see. That seems like a… risky approach with a NSFetchedResultsController and table view but I could see it working fine in SwiftUI. Thanks!

---
> ####  The Synchronizing a local store to the cloud sample project created a separate entity ImageData with a data attribute which is optional binary data that allows external storage, and the Attachment entity has an imageData relationship, in order to store images. In my app I achieved this using a different approach - I simply added an attribute inside only entity (again optional binary data which allows external storage). I was wondering why the sample code did this, and what would be the differences you could expect between these different setups (specifically for using Core Data + CloudKit with NSPersistentCloudKitContainer if relevant)? Thanks!


 There are a few reasons:

1. Storing the image in the row causes it to fault in to memory alongside the rest of the object payload. This can be controlled in fetch requests using `propertiesToFetch`. But `save` will always need to fault the whole object, so large saves can be problematic above a certain scale.
2. Storing the large image across a relationship can help improve sync quality. i.e. if you change an unrelated field, the entire record has to be downloaded from CloudKit for that field. So your say `title`change on a `Post` results in a several megabyte download
3. `allowsExternalStorage` moves the image data out of the database row above a certain size (around 700kb). This dramatically improves performance for SQLite.

 As a vague and general rule, large assets work better across a to-one relationship.  This lets you load metadata about the asset (eg the rest of the object) without committing to loading the full asset payload

 large assets also tend to not change nearly as frequently as their metadata / friends

 Neat thanks! Sounds like I screwed up modeling my data :joy:

 I also found this explanation super helpful, thank you!

---
> ####  I have a Notes entity with a ‘noteDate’ attribute (of type Date) that tracks when a note was saved, using the timestamp. I want to now group all the notes by their actual ‘date’ (e.g. 06-10-2022), so that Charts can show a timeline with how many notes were saved each day. I just need a ‘count’ for each date. What’s the best way to do this?


 there are a bunch of ways to approach this.  I think I'd be tempted to store the date as a separate item from the timestamp, and then you could do something like a fetchRequest with a groupBy

 That kind of depends on your scale.

 For small dataset this can be done in memory with a fetch request by decomposing the date in to an `NSDateComponents` object. But at large scale you will want to inflate columns that you can target with a `group by`.

 <https://developer.apple.com/documentation/coredata/nsfetchrequest/1506191-propertiestogroupby?language=objc>

 If you have a sample dataset, and perhaps a unit test, we can help you tune the fetch request via a feedback report.

 Thanks. If I create a 'transient' property to decompose the date into NSDateComponents, can I use that in 'propertiesToGroupBy'?

 I don’t think so. `propertiesToGroupBy` wants to do its work in the SQL phase of the fetch.

 Hmm. The challenge is that for existing users, the date component isn't stored. And if we want to offer options to group by date, week, month or year, we'd have to store all those separately?

 I guess if it's just likely to be 100s of notes, it's going to be efficient to just fetch them and group them by date components

 Sure but why wouldn’t you just do a lightweight migration to add the new column(s) and then populate them as part of a one-time upgrade job?

 Yep, that's probably a good idea. I just have to figure out the details of one-time upgrades with my custom sync engine, so that's more work for me! :smiling_face_with_tear:

---
> ####  I've been working with coreData on my first app... but I didn't hook it up to CloudKit yet. I'm not interested in the user sharing data to others but I do want syncing between devices. Do I need CloudKit to do this? Or is there another way? And where would I go to research this?  Thanks :)


 Our basic integration with CloudKit is around their private database, eg syncing between the users own devices.  You don't have to use sharing.

 You don't have to use CK either, and can adopt your own syncing solution, probably driving it off persistent history if you like.  but CloudKit is the turn key solution we offer

 Makes sense. CloudKit sounds like the way to go (over manual). Just wanted to confirm as everyone was talking shareplay etc. :slightly_smiling_face:

 <@U03JRPWSDJ4> I found that `NSPersistentCloudKitContainer` works really well for exactly what you are asking for. Instead of diving too deep into everything that CloudKit has to offer, this solution works out of the box and doesn’t require too much setup from your end or worrying about data and sync conflicts and what not. I highly recommend you check out the article from the developer documentation here:

*<https://developer.apple.com/documentation/coredata/mirroring_a_core_data_store_with_cloudkit/setting_up_core_data_with_cloudkit|Setting Up Core Data with CloudKit>*

 Perfect. Adding that to my TODO right now :slightly_smiling_face:

---
> ####  Migration decomposition is an interesting idea. What are the performance implications of having multiple lightweight migrations vs. doing a manual migration?   (Clearly, it avoids a developer taking on the complexity of learning how to do a heavyweight migration, but apart from that...)


 That depends more on the specific migrations you’re performing than their decomposition in to phases.

 unless you have a small data set, I'd tell you to simply never do a heavyweight migration.  It requires loading the entire data set into memory, which obviously doesn't work well on embedded devices.

 Lightweight migrations are built around functions like ALTER TABLE to the maximal extent possible, and composing them is still pretty efficient

---
> ####  I've watched the WWDC videos on NSPersistentCloudKitContainer over the last few years but haven't dug in deeply myself yet. One question - my Core Data model is somewhat relationship heavy (7 entities with relationships between many of them). I don't have sync yet but am considering adding it. Does NSPersistentCloudKitContainer handle that level of relationships well? Are there considerations I should think about when considering adding syncing? The sample app only had 3 entities with relatively straightforward relationships.


 NSPersistentCloudKitContainer doesn’t mind complicated graphs.

 But you should explore how it will sync with the data generator approach I talked about this year and file bugs for things that don’t meet your expectations.

 <https://developer.apple.com/videos/play/wwdc2022/10119/>

 Thanks - I will do that!

---
> ####  What happens if 2 apps running at same time are using the same  NSPersistentCloudKitContainer with a store file in an app group and both try and sync?


 generally just one process in the associated app group should be responsible for the syncing (eg the app) and the others (eg widget) should respond to remote change notifications and persistent history to view imported changes

 For anyone else interested there is more info in this thread: <https://wwdc22.slack.com/archives/C03GSLDRB4P/p1654885880293989?thread_ts=1654885781.398129&amp;cid=C03GSLDRB4P>

---
> ####  SwiftUI &amp; Core Data: how can we pass FetchedResults&lt;T for Previews?


 Probably need to add an intermediate view that manifests a fetch request, something like:


```
struct ContentPreView: View {
    @FetchRequest(…) var foo: FetchedResults&lt;T&gt;

    var body: some View {
        ContentView(foo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPreView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
```



 All right thanks. This is what I was thinking about.

---
> ####  Hello CoreData Team, I missed the last Q&amp;A. Really want to know how to store [Color] array into Transformable? Thank you :)  Sample: [AccentColorProvider(), AccentColorProvider(), AccentColorProvider(), AccentColorProvider(), AccentColorProvider(), AccentColorProvider(), AccentColorProvider(), &lt;CGColor 0x2813e8e40 [&lt;CGColorSpace 0x2813dd920 (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)] ( 1 0.8 0 1 ), AccentColorProvider()]


 You can create your own custom NSValueTransformer and register it for use with a Transformable attribute type

 Thanks <@U03HJA0EJ1G>

 that would probably be best.  In theory you could probably bridge [Color] into NSArray&lt;Color&gt; and allow NSKeyedArchiving to do its work too

 Is it work with CloudKit too?

 For CloudKit you would want a relationship.

 The transformable won’t merge well for competing contributions from multiple devices.

 Ok I see.

 depends on the semantics ?  If they want value semantics like [Color] in Swift, then they don't want merging of individual elements

 also would depend on the scale.  A large array turns into a large blob column

 If I used `newItem.colors = colorsArray *as* NSArray` It will crash.

 Can I just use the ‘Class Definition’ to make it work?

 I don’t think the custom class box expects generics?

 Yes. So, what should I input for the Custom Class?:thinking_face:

 `NSArray` is probably fine.

 If I used [Color], it will not crash, but appear error

```
Unresolved error Error Domain=NSCocoaErrorDomain Code=134060 "A Core Data error occurred.", [:]
```


 Ok let me try NSArray


```
Still error, Unresolved error Error Domain=NSCocoaErrorDomain Code=134060 "A Core Data error occurred.", [:]
```


 <@U03HMJ2P5MJ> is the transformable ‘natively’ support NSArray?

 Indeed. The custom value class is just an annotation for the model to try to tell your generated class what the attribute’s actual type is.

 It’s not clear to me when your actual error is here, but I suspect it’s not the model but something you have done in code.

 If you like, you can file a feedback report with your app attached and we can help investigate.

 No problem. Thanks for your help :slightly_smiling_face:

 Our sample app uses a value transformer for Color, but not an array of them. <https://developer.apple.com/documentation/coredata/synchronizing_a_local_store_to_the_cloud?language=objc>

 Actually I used the sample template from Apple. (CoreData + CloudKit) SwiftUI one. And only NSArray cannot be saved. That’s why I ask here :smiling_face_with_tear:

 Other things like string, UUID, image, is storing okay

 I’m not familiar with that sample. But generally speaking for custom classes you need a custom value transformer to declare their conformance to secure coding.

 That’s the type of issue we can’t really spot without a more detailed description of the error you’re encountering.

 I see. Anyway thank you :slightly_smiling_face:

---
> ####  Is there a way to disable NSPersistentCloudKitContainer from automatically syncing? If you want a widget to only read from the database as opposed to it trying to perform sync as well.


 Your widget should load the store without an instance of NSPersistentCloudKitContainerOptions set on the store description.

---
> ####  Any plan to add FTS support to Core Data in the near future?


 You can use `NSCoreDataCoreSpotlightDelegate` to get full text indexing of your data, and use the CoreSpotlight APIs to search it.  This allows lets customers use the spotlight search bar at the home screen even when the app isn't running

 Check out the Tags sample code.

 <@U03HFC8U0J1> where can I find the sample code?

 <https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator/showcase_app_data_in_spotlight?language=objc>

 Thank you guys <@U03HFC8U0J1><@U03HJA0EJ1G>! Look like I can dump the SQLite created for this sole purpose.

 Me too! I maintain a separate SQLite database just for FTS.

I'm assuming that it would also handle properly languages such as Chinese, Japanese, Korean, and Arabic?

 I *believe* so ?  The CoreSpotlight documentation should discuss internationalization support

 the corespotlight APIs are asynchronous so your interaction with fetching results in your app will be a bit different than FTS

 I wouldn't like rm -rf everything before testing it meets your product requirements

 The way I use FTS is I fetch a bunch of record IDs (UUIDs) based on the results of the match query, then I use those record IDs in my NSFetchRequest to fetch from my main data store. I’m hoping I can do the same with Spotlight.

 <@U03HJA0EJ1G> thank you for the reminder. Async request is fine. My concern is the performance, since it's not dedicated to specific app.

 That’s a good question. And what happens if you delete the database in the Finder that has all its data indexed in Spotlight? I might have hundreds of thousands of terms and phrases to index in my app.

 Can the Spotlight index be stored along side your Core Data store? I keep mine in a package bundle as it’s a document based app.

 That’s what I do with my current FTS sqlite index file. Since it’s inside the package bundle, if they delete the bundle, then the index is deleted along with it. Nothing hanging around in the system.

 you can override these:

 `/* CoreSpotlight domain identifer; default is the store's identifier */`
`- (NSString *)domainIdentifier;`

`/* CoreSpotlight index name; default nil */`
`- (*nullable* NSString *)indexName;`

 to change the CSSearchableIndex associated with the NSPersistentStore

 I *think* you'd need to tell spotlight you want to delete them, as opposed to say finder doing it with the package bundle

 Ah. But that would be out of my control outside the app, so I just wanted to make sure that situation was handled. I’m guessing then the only way to properly delete from Spotlight would be to keep around another database that keeps track of a list of package bundles and if one is missing on the system when my app launches, then to tell Spotlight to delete the corresponding index where ever it keeps them. Does that sound right? Too bad I can’t bundle the index inside the package.

---
> ####  Hey Patrick, thanks for the Q&amp;A.  We hear a lot of bad things about parent and children entity (Core Data creates a unique table with all the attributes from all the children entities in this one table).  Could you clarify when it's ok to use parent/children entities and when it's recommended to avoid them? What tips can we use to help us choose?  For example, if I have an generic expense, and a fuel expense (with specific attributes to track the volume purchased, etc): should I create parent/children, on instead use relationship between an Expense entity and a FuelMetadataEntity (or other more specific metadata per expense category for exemple)?


 Entity Inheritance is a powerful tool.

 We do use a single table for the inheritance hierarchy

 In general, I would say that data model inheritance hierarchies are much much flatter than class inheritance hierarchies

 And you shouldn't use entity inheritance to "model" a protocol

 like "all my entities have a uuid, therefore, I'll make one uber root entity that just has a uuid"

 that is sad.  That should be expressed as an actual protocol in Swift or ObjC

 on your MO subtype

 the basic rule of thumb would be "do I ever want a single fetch to pull back both ?"

 So you might model an Animal entity with Cat and Dog, because sometimes you want all Animals in a single fetch, and sometimes you don't

 But you probably wouldn't model ExpenseReport and UserAccount as the same inheritance hierarchy because they are very different types and they don't belong together (generally)

 Thanks <@U03HJA0EJ1G> for this thread! Really helpful. I did not have the intention to model my schema on generic attributes such as id or createdAt etc. But your tip on the single fetch makes a lot of sense.

---
> ####  We're doing advanced migration using a mapping model and custom policies. Is it recommended to add support for migrating both ways, both upgrade and downgrade versions? Or is that considered unnecessary?


 I generally try to dissuade people from supporting downgrades

 this is "forward binary compatibility" when an older version of an app needs to know about the future

 but predicting the future is hard, and by definition, your older app has never been tested with features and code you haven't created yet

 it's usually a huge resource investment to handle foward binary compatibility and Just Not Worth It, even for very large teams

 some typical problems include maintaining data the older version doesn't know exists, inserting new records but missing that new data, failing to maintain implicit dependencies or derivations on updates in the old app to that newer data ...

 it's basically pandora's box

 Thanks for the extensive response <@U03HJA0EJ1G>. Really appreciate it. I'll skip downgrade support for now and see where that takes us. Thanks! :man-bowing:

---
> ####  I seem to have gotten mixed answers in regards to how to add a widget to an app that uses NSPersistentCloudKitContainer. If you move the database to app groups so app and widget can access it, there's two approaches I thought you could use to try to keep it up-to-date: reload the widget when the app updates the db and/or let the widget try to update itself for example by letting sync occur when the getTimeline function is executing. But a message here implied the widget should not allow syncing otherwise it'll conflict with the app sync. Can you provide clarifying direction on how you should approach implementing a widget that needs data from NSPersistentCloudKitContainer? Thanks!


 I don’t think those answers are really in conflict.

 You are free to allow your widget to set up an NSPersistentCloudKitContainer and attempt to sync.

 But practically speaking it never will.

 Widgets don’t live long enough, or get enough processing time for the container to finish setting up.

 So removing the options and letting the app handle sync is our recommended path.

 Great thank you for the clarification :ok_hand:

 Additionally, multi-process sync is not supported with NSPersistentCloudKitContainer. It creates a lot of competing work on the system. But again… widgets don’t live long enough for that to happen.

 Super good to know thanks!

 So the letter-of-the-law is that the app process gets the `NSPersistentCloudKitContainerOptions`, the widget does not.

---
> ####  Is there a Code Sample showcasing editing items in a child context in SwiftUI? How would you do that? I came up with a solution where I condition a sheet on an optional item containing the object to edit and the child context, past in the environment).


 I would file a feedback report, if you attach your app we can help provide more targeted advice for how you would hook this up.

 I don't think we have an example, but yes you'd pass the context you want in the environment.

 In Swift UI there’s generally an open question of whether or not your model would work with the child context, or the view.

 Here is what I currently do in my app, inspired by code samples provided by Apple with Struct / State.

 Same View to create or edit, the configuration provides the childContext and the new object/object to edit. When the State is updated, the sheet appears and the childContext passed in the environment.

 <@U03HMJ2P5MJ> not sure about your last comment:
&gt; In Swift UI there’s generally an open question of whether or not your model would work with the child context, or the view.
Any feedback on the approach I'm using? <@U03HJA0EJ1G> Thanks!

 Your `EditorConfiguration` is essentially a view model. It’s not clear to me what the point of child context is here. Why do you need a whole separate managed object context for editing a single object?

 What alternative would you use? I thought create ViewContext was cheap. I want to allow the user to save or cancel changes on the new/edited object. I don't want to edit the object in the main ViewContext

 If you want the sub view / child / detail inspector to make changes to the object without effecting the main view, and allow the user to commit / cancel those all together then yes a child NSManagedObjectContext is appropriate

 I think typically the parent view pushes the context in the environment for the child view to consume.  Either as a new context, or explicitly the parent context for the child to root a new MOC off of.

 <@U03HJA0EJ1G> thanks. Not sure I understand your last sentence “Either as a new context, or explicitly the parent context for the child to root a new MOc off of”. What would that mean in SwiftUI? I pass the main ViewContext to the SubView/editor init (instead of using the environment) and create the child from the init? I fear this would be reset if the view is redrawn, contrary to the approach I described above (Struct in a State).

 I could still use a State in the SubView for both the object and the context, but if I use FetchRequest, it won't work because the context in the environment will not be the correct one.

 <@U03HK7797D0> ^

 Why won’t it work? The child context has the same view of the store as its parent, plus whatever the child context has dirtied

---
> ####  Is it possible know the last sync time of CoreData+CloudKit? Any chance we can 'force fetch' the data from iCloud DB?


 `NSPersistentCloudKitContainerEvent` describes this. <https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainerevent?language=objc>

 No, there is no way to force `NSPersistentCloudKitContainer` to sync.

 Okay

 :pray:

---
> ####  I have a few warnings in my build logs like these:  "FileAttachments.fileProperties is using a nil or insecure value transformer. Please switch to NSSecureUnarchiveFromDataTransformerName or a custom NSValueTransformer subclass of NSSecureUnarchiveFromDataTransformer [2]"   What's the best way to update this? Just change the transformer name in model editor to 'NSSecureUnarchiveFromDataTransformer'? Does it affect existing data saved in that attribute, or force a lightweight migration?


 &gt; Just change the transformer name in model editor to ‘NSSecureUnarchiveFromDataTransformer’?
Maybe. All the data you’re transforming needs to support secure coding.

 Typically `NSSecureUnarchiveFromDataTransformer` is enough, but if you have custom value classes in your archived blobs you will need a custom value transformer that supplies the correct `allowedTopLevelClasses` and your value classes will need to conform to secure coding.

 Thanks. In one of the cases, I store 'attributedString' in a transformable attribute. The only problem is, due to an old bug, sometimes a NSValue can be saved there in the store instead. I tried creating a custom transformer that can handle this, but I would get an error ""[error] fault: exception raised during multi-threaded fetch &lt;shared NSSecureUnarchiveFromData transformer&gt; threw while decoding a value. ({NSUnderlyingError = "Error Domain=NSCocoaErrorDomain Code=4864 \"value for key 'NS.objects' was of unexpected class 'NSValue (0x7fff86bb08d0)"

 This is the transformer I was using

 `@objc(AttributedStringDictionaryTransformer)`
`final class AttributedStringDictionaryTransformer: NSSecureUnarchiveFromDataTransformer {`

  `//static let name = NSValueTransformerName(rawValue: String(describing: CustomClass.self))`

  `override static var allowedTopLevelClasses: [AnyClass] {`
    `return super.allowedTopLevelClasses + [NSValue.self, NSAttributedString.self]`
  `}`
`}`

 That’s worth a feedback report. I suspect what you’re actually seeing is that the top level object is not `NSValue`, but in fact one of the attributes on your string is an `NSValue` and you haven’t modeled that part of the decoding.

 I’m also not entirely sure that `NSAttributedString` conforms to secure coding.

 Thanks. How do I confirm this?

 A simple unit test with a representative attribute string should reproduce it.

 You can just pass it though your value transformer by calling `transformedValue` / `reverseTransformedValue` directly

 If it blows up you found the issue

---
> ####  Will NSManagedObjectID be sendable?  What is the recommended way to move object IDs from an NSAsyncronousFetchResult to surface the results into swift concurrency?


 please file a feedback report.  NSManagedObjectID should be sendable

 Perfect.  Thank you!

---
> ####  In my Core Data model I have an abstract entity and I use NSFetchedResultsController to display its children entities data in a UITableview. I want to group the table view rows in sections according to the concrete entity types. What would be the best approach to achieve that, please?


 I think the best would be to use a type column in your abstract entity

 That way you can target it with `sectionNameKeyPath` from the FRC.

 You could automatically set it to the entity name, or to a more human friendly string so that you don’t also need to map it to a display value.

 That’s a good approach Nick, and that’s actually the first solution that I had in mind. But I was wondering if I could set the sectionNameKeyPath using something like a computed property or a transient property to avoid storing repeated data in the database. Thanks a lot for your answer!

 I don’t think you can target `self.entity.name` with a derived attribute but that’s worth a feedback report.

 Yeah, I tried but I was not able to set the sectionNameKeyPath based on the entity name. That’s a good point, I’ll create a feedback report and put the details of what I’ve tried so far.

---
> ####  I want to add Core Data/CloudKit data persistence to my app. Currently my app only uses local on device @AppStorage. Looking for best approach to bring in @FetchRequest functionality for my views, and tie my model data into Core Data and CloudKit.


 In my app currently (without Core Data) my content view has an instance of my view model (separate file) accessed using an Environment Object. I use local @AppStorage persistence:



 Arguably the best way to get started is to experiment with a new Core Data + SwiftUI App in Xcode—the project template includes a basic Core Data stack and `@FetchRequest` for you to play with

 In my lab this week, i got suggestions that I can modify my app structure to incorporate Core Data + CloudKit. Would the following structure work?:



 Then you can also copy-pasta the goop in the new project’s Persistence.swift into your project

 Thanks Scott. I think I was in the lab with you yesterday and you were very helpful. I created the above graphics to show what I think I understood I could do based on our discussion. Any comments on my graphics above would be great. Thanks again!  

 Yeah! I recognize this model

 Does the second picture seem to represent what we talked about?

 Yeah, the only thing really missing here is that your default data still isn’t modeled. The ViewModel in the image’s bottom right quadrant is doing model work where `systems` should probably just be a fetch that grabs the Systems from Core Data (which in turn should be seeded in Persistence.swift when opening the store—if store contains no systems then add the base set of systems)

 Ok. Yeah I do remember us talking about seeding the data. I just didn’t update the graphic well enough. This is a good reminder thanks again:gratitude-thank-you:

---
> ####  Does the demo app provide examples for how to use an UndoManager with our persistent container?


 We don't have an example, but you can tell the viewContext on your container you want to use an undo manager, and you can set it to the same one your views &amp; controllers are using

 we don't track undo by default, but it's an option on NSManagedObjectContext

 So basically, I would create an undo manager, register some undo functionality and then assign it to the context's optional `undoManager`?

 Would I have to make changes in some child context to allow undo/redo before saving the context/merging it back to the parent?

 NSManagedObjectContext registers its own undo actions if you set the manager

 a child context would have a separate undo manager if you want that view to have a separate undo stack

 Something like `context.undoManager = UndoManager()` is sufficient because the context will register actions?

 yes

 Well that's convenient! :slightly_smiling_face:

---
> ####  I'm going to migrate my app from Realm to CoreData.  But currently I'm using the following technique: I have the separate Thread (singleton object) created for Realm Writing operations (I mean exactly Thread, to keep the same thread_id under the hood; not an OperationQueue).  So, can I keep this technique for CoreData activities too, or it might not work properly this way?


 You don't need to be so constrained with NSManagedObjectContext.  Each NSManagedObjectContext is (informally) an actor styled object with its own dispatch queue.

 the NSPersistentStoreCoordinator manages a small database connection pool to facilitate concurrent operations

 if you have some special application ordering logic that depends on serialization, I suppose CAN keep the same pattern

 but more commonly, folks just have at it, with a separate MOC for large background operations

 the `viewContext` is special and tied to the main thread.  You can perform writes here, but you obviously want to minimize those to user changes and not any kind of importing or background tasks which should all be done asynchronously with separate MOC

 <@U03HJA0EJ1G>
Thanks for your answer!

Yeah I really see CoreData is enough smart system to handle multiple threads and contexts :slightly_smiling_face:

My original question was born just for spending less time for the codebase modification, and to keep the current logic as much as possible but change only the storage engine itself

&gt; if you have some special application ordering logic that depends on serialization, I suppose CAN keep the same pattern
So if I got you right, I can try keep my current pattern at least for the nearest refactoring sprint

Thanks again!

---
> ####  Follow-up on a previous q: "the others [processes] (eg widget) should respond to remote change notifications and persistent history to view imported changes." I believe widgets don't receive remote change notifications, to clarify, should the app be the one that responds to this notification and trigger the widget to reload (and since it's accessing the same database on disk, it will already have the updates applied right to show the changed data)?


 why can’t widgets get remote change notifications?

 Their code is not executing except when the entries have been exhausted and it needs a new timeline, once new entries are retrieved it is suspended again.

 Ie your widget may not run or execute any code for a period such as a week (depends how many entities you provide)

 I’m not sure what that means, but the widget process will get remote change notifications if the store has the option set.

 How or when it can respond to those is a widget lifecycle issue and not something we can really control.

 They are non-launching though

 So if the widget is not currently active it wont’ receive them. It sounds like you’re saying you can spawn your widget from the app?

 In that case a fetch request would pick up any missed data.

 It’s not clear to me what else you’re trying to do?

 Widgets are weird :sweat_smile: iOS basically just runs the code to get an array of entries then stops executing, then when it runs out (maybe a week later) it’ll asks for more, I’m not even sure the same process persists. But yes the app can tell iOS to reload the widget at any time, at which point it will start it up to get a new timeline of entries.

---
> ####  What's the best way to store dates in Core Data so that time zones can be maintained. A dictionary? A date field with a separate time zone field? Trying to avoid the situation where someone enters dates into the database then changes time zones and all the dates are now off by X Hours.


 time is a matter of perspective.  human perspective

 We recommend storing the time as a timestamp, and focusing on the human representation of that time as a view problem, not a database problem

 time zone is effectively a derivation based on the current user's locale

 and worse, the user might want to view other time zones

 for example, I'm planning a summer vacation ... elsewhere.

 but my calendar shows me all my reservations in my current locale's time zone

 which is just weird, but ... what's a poor calendar to do ?

 if you have to store the time zone, I would definitely do it separately and treat it as "disposable" data.  When the user changes locales ,you can delete it all and recompute it from the timestamp as source of truth

 Excellent. Thanks for the suggestions. Sometimes the time zones span across days (ie when travelling) and my customers get all confused and say “I had this entry for Saturday, but it’s now showing up on Sunday”.

 yeah, the data didn't change, the user's locale and expectations did

 as a practical matter, you might need to cache persistently a denormalized copy of the time zone in the row for filtering or sorting

---
> ####  What's the best way to make a copy of your SQLite file into a single file for backup purposes, while the app is still in use?


 <https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator/3747536-replacepersistentstore|replacePersistentStore(at:destinationOptions:withPersistentStoreFrom:sourceOptions:type:)>

 despite the name (replace) the destination doesn’t need to exist. once complete if you really need a single-file database you can use `sqlite3_wal_checkpoint` to roll the wal into the db

 note that you’re out of warranty with this, the database won’t include things like external data references or SQLite user-defined functions maintained by Core Data or anything like that

 the real point here, which I can’t stress enough, is to use Core Data/SQLite API to interact with the database—FileManager and filesystem operations don’t respect the database’s locks and can leave you with widespread corruption if your timing is unlucky enough.

 Are you saying that the 'replacePersistentStore' API doesn't respect database locks etc, and can lead to corruption? Or do you mean that accessing the files directly (without this API) would lead to problems?

 I just want to do this safely, so that we have a backup of the data at any point (even if app is in use in the foreground, the background etc).

 The latter. Core Data and SQLite’s APIs are safe by design and you should use them :slightly_smiling_face:

 Thanks. One final question about this: is the 'replace' API better to make a copy, or  'migratePersistentStore'? Are they mostly the same (except I guess migrate removes the store from the coordinator as well)?

 `migratePersistentStore(…)` is designed for when you want to change the store, if you’re just looking to make a copy you’re better off with `replace…`

---
> ####  Ben T mentioned earlier that heavy migrations load the entire dataset into memory. But maybe I'm misunderstanding. The heavy migration code pattern seems to lend itself to efficiently handling one entity and even one attribute at a time. Am I understanding that correctly that a multi-gigabyte dataset would be loaded into memory for a heavy migration?  Or where are best practices to handle heavy migrations with large datasets that simply can't fit in memory?


 It's extremely difficult to migrate one entity at a time in different transactions without risking breaking relationships.

 At the end of the day, heavyweight migration can't offer the same performance and reliability as a single database transaction.  It should be self evident that looping over every row to apply a custom in memory transformation just can't scale as well as ALTER TABLE

 That makes complete sense that a heavyweight migration is less performant and that it can only be done while not be used. I’m gathering here that it is discouraged not simply for its complexity and inefficiency, but also because it is not reliable and it requires the entire dataset loaded in memory. This is still really helpful to learn--thank you!

 it's just as reliable, but it achieves that by loading everything into memory

 NOT loading everything into memory would require splitting up the transactions which would introduce reliability challenges so we don't

 okay that’s useful. I’ll shift to a multi-step lightweight migrations in the future

 Ben, you’ve been prolific in this lounge this week--we really appreciate your sharing your insights

---
> ####  If order matters for a to-many relationship (where we'd normally use Array in Swift), is it preferable to mark the arrangement as Ordered in the core data editor (thus getting NSOrderedSet), or keep using NSSet and add an `index` attribute manually?


 It Depends™? For most things you’re probably going to want to sort by a property anyway (in which case relationship ordering isn’t helping you much) but there are some cases where ordered relationships make sense, like if you want a user-defined sort order for a playlist

---
> ####  In my production app, changes don't sync between devices while both are running the app. I must quit and relaunch the app on one device for the change from the other device to appear. I've verified that the app *does* have APS environment in the entitlements, and the remote-notifications background mode in the capabilities.  Any suggestions of what else I should look at? FB10144431


 Your application is using the development APS environment.

 I would try using Production and see if that helps

 neither of your devices are getting push notifications.

 <https://developer.apple.com/documentation/bundleresources/entitlements/aps-environment?language=objc>

 I did change the APS environment value to `production` and then installed on two devices, same problem

 Do you have a set of fresh sysdiagnoses with that change?

 In the ones you uploaded to the feedback it’s still set to development.

 I thought those were the correct ones. Sorry about that. I'll see if I can generate new ones.
Aside from the APS environment value, is there anything else you'd recommend I look at?

 These are the logs that tell us what environment your app is entitled for:


```

```



```
2022-06-09 17:34:23.029452-0600 0xd08      Debug       0x0                  259    0    Vacation Planner: (CloudKit) [com.apple.cloudkit:NotificationListener] Running in an app and choosing app strategy
2022-06-09 17:34:23.029837-0600 0xd08      Debug       0x0                  259    0    Vacation Planner: (CloudKit) [com.apple.cloudkit:CK] APS environment entitlement is development
2022-06-09 17:34:23.029842-0600 0xd08      Debug       0x0                  259    0    Vacation Planner: (CloudKit) [com.apple.cloudkit:NotificationListener] Using push environment development
2022-06-09 17:34:23.030280-0600 0xd08      Info        0x0                  259    0    Vacation Planner: (CloudKit) [com.apple.cloudkit:NotificationListener] Init notification listener &lt;CKNotificationListener: 0x281d356d0; strategy=1, environment=development&gt;
```


 If you believe you set the entitlement correctly, but still see that the notification listener is working the development environment, you can attach your app for us to take a look.

 Attach the app to the Feedback? And how exactly would I attach it?

 Yeah, I usually right click on the app’s directory, i.e. the parent directory of your xcode project, and click Compress. Then attach the generated zip file to the feedback report.

 Ok, good to know. Thanks.

 I won't be able to upload those new sysdiagnoses today, so I'll just plan on continuing this all through my Feedback report. Thanks for your help <@U03HMJ2P5MJ>!

---
> ####  Suggestions for enumerating to-many children in a type safe way? e.g.: ```  @NSManaged public var children: NSOrderedSet! ForEach(item.children) { /* need typed Child here */  } ```


 NSOrderedSet takes a generic.  Is NSOrderedSet&lt;Child&gt; not working ?

 or are you asking about the type safety for an inheritance hierarchy where child might be one of many types ?

 Swift generics aren't super pleased with covariance

 I was unaware of `NSOrderedSet` generics. Can we change the generated attributes to this: `@NSManaged public var children: NSOrderedSet&lt;Child&gt;` ?

 Please file a feedback report.  You should be able to cast it

 Sorry, but casting to a `NSOrderedSet&lt;Child&gt;` is not working: `"Cannot specialize non-generic type 'NSOrderedSet'"`

 Neat.

 file a bug report.  It supports generics in ObjC but apparently not Swift

 I see lots of people use a computed var to cast `NSSet` to `Set&lt;Child&gt;` for easier typed access. Do we lose out on any `NSSet` faulting benefits by doing that? <@U03HK7797D0> mentioned earlier that `Set` eagerly loads all values.

 Yes, casting from a reference type to a value type will defeat faulting

 If the relationships are small (eg the number of elements, not the size of each element) then it may be okay

 Does an alternative exist for Swift?

 faulting occurs at several layers, so just because we have to preload the identities of all the related objects, doesn't mean we fetch the MO elements themselves

 Swift doesn't like futures, so no.

 Set and Array are specifically intended as value types

 a Future is a reference type

 To manage this with a desire for Set&lt;Child&gt; you could be more careful with using setFetchBatchSize

 we slice and dice the object graph in several ways, so if you want to preload all the related objects, you'd need to take a little more care with the batch sizes to offset that

---
> ####  My app is using NSPersistentCloudKitContainer. I want to ensure that my mental model is reasonably in sync with what actually occurs.   A) When a new device is set up, and syncs the data from the CloudKit, is it more akin to synching in the current state of the objects in CloudKit or more akin to synching in the complete history of changes to those objects?   B) If it's the complete history of each change being synced, are changes pruned that are later reversed? Or might I, for instance, see at the destination that an object is created and then deleted again later due to a historical deletion of that object being synced up?   C) Is the situation different for a sync to an existing install with most of the data?


 We um… reserve the right to choose.

 I love it.

 Generally we’ll “do as little work as possible to make sure things are consistent / correct.”

 But, device conditions, events on the server, and the structure of your data influence that.

 &gt; Or might I, for instance, see at the destination that an object is created and then deleted again later due to a historical deletion of that object being synced up?
This is definitely possible, especially with devices active at the same time. Under ideal conditions we can sync end to end in less than a second, so it is very possible for devices to see intermediate state during a live session of work.

 You can tune this to some extent with your calls to `save`, but that naturally contends with the user’s notion of “persisted”, i.e. how often they press `cmd+s`.

 &gt; Or might I, for instance, see at the destination that an object is created and then deleted again later due to a historical deletion of that object being synced up?
I was thinking more about an object created two months ago on another device, deleted a month ago, and I’m now observing what happens when a new device is set up with a very large dataset, e.g., where leaving the app running for 8+ hours or days there is still data being synched in.

 &gt; I was thinking more about an object created two months ago on another device, deleted a month ago
That’s not really the critical question. The question is when does the delete sync relative to creation.

If the creation was uploaded, but the device went offline before syncing the delete, no one heard about it. If a user powers it up and things sync, all of a sudden its gone.

 &gt;  and I’m now observing what happens when a new device is set up with a very large dataset, e.g., where leaving the app running for 8+ hours or days there is still data being synched in.
I shipped a 10GB test in the sample app this year. It takes about 20 minutes to process, but that’s because it’s mostly images and a small number of records.

 CloudKit allow us to export 400 records at a time, and generally they are batched down in batches of 200.

 Those limits are subject to change, but the math is pretty straightforward. We expect that under ideal conditions you’re paying 1-2s per operation of end to end latency. Or about 83 minutes per million records.

 Hmm. Then it sounds like I need to profile a bit more what is going on here.

 Maybe, we can help with that via feedback reports with your app (or a test app) and a representative data set.

 <https://developer.apple.com/documentation/coredata/synchronizing_a_local_store_to_the_cloud?language=objc>

 The update to the sample app this year includes an end to end unit test that uploads / downloads generated data

 I would start there for profiling NSPersistentCloudKitContainer, you can run it from instruments.

 This is my own real data from my own use of the app that I am testing with. The container is 3Gb, much of that by size being image assets but the transaction volume would be mostly changes in small entities over four+ years of use (though much of that before turning on persistent history tracking).

 Yeah that doesn’t sound scary

 If processing the transaction history becomes problematic you can prune it after a successful NSPersistentCloudKitContainerEvent of type Export.

 We generally advise folks keep around 1 year of history as a minimum bar

 Ok I will look into it. Will start with putting some local profiling so I can document just how many objects haven’t synced. Coming across one entity that doesn’t have an associated image asset, it’s hard to know what else is missing or not initially of course.

 If this is your own app, you can pull the app container off different devices and “just diff the store”

 i.e. write some code to traverse it and see what’s missing where.

 With a sysdiagnose and some store files we can usually tell why.

 Thanks for your help on this.

---
> ####  There is a almost similar question but I wasn't clear on how to apply it so sorry for the duplication. I like to have a clear separation between my form using a struct and perform validations transforms , calcs etc. before creating a NSManagedObject that could end up being accidentally saved.   For example if I am adding an Account ,I want to create a struct of type Account and then once its validated I create the actually Account NSManaged object in the managed context and save it. Is there a best practice for this? I have checked the child contexts as a option but seems overkill


 For this type of use case child contexts are vastly preferable to reinventing your model as a struct.

 For one, you can encode a number of validation rules in your model, and the context will apply them at save time.

 You can throw the child context away if needed, and additionally you get undo manager integration for “free”.

 Ok, thanks that helps, I didnt want to go down that path if there was an easier way like mylocalAccount = Account() loll
