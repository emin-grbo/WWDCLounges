# education-lounge QAs
### Lounge Contributors
#### [shirblc](https://github.com/shirblc)
---

--- 
> ####  We’re also wondering if there’s any information you’re able to share at this stage about the coming updates to Schoolwork and Classroom apps?


|U03HRRAJQ0K|:
Hey Lauren! Thanks for your question - we actually just released some updates for Schoolwork and Classroom in the last month that we know teachers are going to love, including using multimedia in Schoolwork and agendas in Classroom.

You can read all about the latest and greatest for both here:
<https://support.apple.com/en-us/HT206151>
<https://support.apple.com/en-us/HT208894>

--- 
> ####  Now that macOS Ventura has added Launch Agent and Daemons to the Login Items pane of System Settings. Is there an MDM payload that can protect or hide certain items in System Settings? Some things you don't want messed with. For example: Jamf local agent, MS AutoUpdaer, Google Keystone, etc...


|U03HJ7TE1GT|:
We don’t have anything to share at this time, but we understand the concern. Nevertheless, please file feedback through <https://appleseed.apple.com/it|AppleSeed for IT>, if it’s something you’re interested in managing.

--- 
> ####  Hi! Can I ask about the data about the user, that can be accessed except the Name and E-mail fields (for grown-up users)? Is there an age field? Can I get the grade number or only the name of the class?


|U03HK7VC59U|:
If you are referring to the Roster API, the users data model currently does not have an `age` field. We do expose a "grade" field. Here is the Documentation for the Users Data Model: <https://developer.apple.com/documentation/rosterapi/user>.

|U03HK7X2Q06|:
*For Sign In with Apple at Work and School,* you will receive a unique identifier, name, and email address (if available). Please refer to the Sign In with Apple documentation: <https://developer.apple.com/documentation/sign_in_with_apple>.

*For the Roster API,* Ashwath is correct :slightly_smiling_face:. Please note that “grade” is a user-defined field, and specific to student users. Schools may define their grades in different formats.

Also, the unique identifier in Sign In with Apple and Roster API will be the same. So you can associate the two.

|U03JZEDFDNU|:
Thanks!

--- 
> ####  Hey team! :wave::skin-tone-3: LJ from Procreate here. :art: We’re wondering if there are any demos available that we can watch that demonstrate iPad’s behaviour with multiple users to get a sense of how our product might behave, short of setting up our own testing environment? 


|U03JU9ZP938|:
<https://developer.apple.com/education/shared-ipad/>

|U03HNU8UPPF|:
In addition Procreate supports iCloud Drive :+1:
When users login to Shared iPad they also get access to all their files saved to iCloud Drive.

|U03HZ3PMX2R|:
It seems to be a pretty fantastic solution - users can just log onto any iPad and their Procreate Gallery is there waiting for them. Is anything saved locally at all on the device (i.e. is storage divided up between users?) or is everything pulled down from iCloud only when students log in? We have conflicting reports from schools around storage capacity on shared iPads, when they appear to have the same set up. 

|U03HNU8UPPF|:
Local storage is available and partitioned. <https://support.apple.com/guide/deployment/prepare-shared-ipad-dep6fa9dd532/1/web/1.0|This page in the Apple Deployment Guide> has the details.

|U03JU9ZP938|:
The shared iPad can be configured with storage quotas for users.
There is some more explanation available in this WWDC video:
<https://developer.apple.com/videos/play/wwdc2022/10045/>

--- 
> ####  With the new support for business and education, are there any remaining Apple ID account types that do not support Sign In With Apple?


|U03HJ8W6CGK|:
Hi <@U03JEM12TG9> — Both Apple IDs and Managed Apple IDs are now supported.

If this doesn't answer your question, can you include more information about what your use-case is and what you're asking about more specifically?

|U03JEM12TG9|:
Thanks Jesse!  I can't think of any other account types; it's great everything is covered now. 

--- 
> ####  Can you give us an overview of ClassKit? :pray::skin-tone-3:


|U03HK7Z8HC6|:
Great question!

Adopting ClassKit will help your app work with Schoolwork (our powerful iPad app for teachers and students) to help keep track of assignments and *student progress*. You can help teachers discover *assignable activities* in your app, take students directly to the right activity with a single tap, and securely and privately share progress data with teachers.

We've talked about ClassKit in previous WWDCs a great starting point is <https://developer.apple.com/videos/play/wwdc2018/215/>

|U03HK7Z8HC6|:
or check out <https://developer.apple.com/classkit/>

|U03JEM12TG9|:
For some additional (non-Apple) info on ClassKit and Schoolwork, I gave a conference talk on the subject in 2018. <https://vimeo.com/310848851|https://vimeo.com/310848851>. Quite a bit has been added to the SDK since, of course.

|U03JLA3RVPZ|:
Here is another presentation from WWDC 2020: <https://developer.apple.com/videos/play/wwdc2020/10672/>

--- 
> ####  What are the best ways to leverage Apple Education in an app? Is it supporting specific Apple technologies? (Classkit, etc) If so, what are some examples?


|U03J4BFE17W|:
What do we need to add/support to be good stewards / citizens within the Apple Education universe :)

|U03HRRAJQ0K|:
Hi Shane - I love this question!

There are so many different ways to optimize your app for education, but it really depends on what you’re building and what fits best for you.

<https://developer.apple.com/classkit/|ClassKit> allows you to create activities within your app that allows teachers to easily navigate their class to activities directly and receive progress from you (relevant to your activity) on how their students are progressing.

You can also <https://developer.apple.com/education/shared-ipad/|optimize for Shared iPad> support to ensure students are getting the best and most reliable experience with their data on their iPads.

If you don’t already, you could support Sign in with Apple which would allow any education (or business) user to sign in with their school account. And if you have a concept of ‘classes’ or teacher/student relationships in your app(s), the <https://developer.apple.com/videos/play/wwdc2022/10053/|Roster API> would be a great option to help us get you that info, saving your users time from setting it up manually!

|U03J4BFE17W|:
Thanks!

--- 
> ####  Seems that we should build a dedicated user flow created within our app for the IT Admin to grant initial OAuth 2 permission. Is that right?  Can you share any successful flows you’ve seen used, particularly in schools?  Once that first successful connection is confirmed - would we possibly ask the IT admin to choose certain classes to set up for using our apps? (For example: set up the math teachers with access to a math app)  OR: there is nothing beyond authentication needed from the IT Admin, and we could identify teachers at login (once they Sign In with Apple, we can look up their unique identifier and confirm their role as an instructor) then offer any “setup your class” options or “learn about our app in your classroom” information available to them  Any best practices you’ve seen around this initial setup would be greatly appreciated!


|U03HJ8W6CGK|:
&gt; Seems that we should build a dedicated user flow created within our app for the IT Admin to grant initial OAuth 2 permission. Is that right?
Are you asking about the screen seen in the session at the 11:07 mark in the video? If so, that screen is controlled and displayed by Apple. It is shown as the response to the `GET` request to `/auth/oauth2/v2/authorize`, as seen at 10:37 in the session video.

|U03HK7VC59U|:
Regarding,

&gt; Once that first successful connection is confirmed - would we possibly ask the IT admin to choose certain classes to set up for using our apps? (For example: set up the math teachers with access to a math app)
&gt; 
&gt; OR: there is nothing beyond authentication needed from the IT Admin, and we could identify teachers at login (once they Sign In with Apple, we can look up their unique identifier and confirm their role as an instructor) then offer any “setup your class” options or “learn about our app in your classroom” information available to them
Once the connection is confirmed, your app server should be able to fetch all user and class information into your app. Once your app queries the data, you have information on which teachers and students belong to which classes and when the student/teacher log in, you would be able to pull up their classes.

|U03K6K2J79P|:
Thanks <@U03HJ8W6CGK> for responding!  In your team's experience working with schools, is it your experience that the IT Admin will be the first person to open the app in order to authorize the connection? I was referring to the experience before and after the `GET` request, i.e. a button to "Configure this app for your school" that would trigger the `GET` request, and the messaging afterward of successful authentication

|U03HK7X2Q06|:
Great questions! Regarding using the unique user identifier to provide the best setup experience:

Sign In with Apple at Work &amp; School and Roster API will have the same unique identifier for a single user. You can leverage this identifier to identify what classes belong to a particular logged-in instructor.

For example, your app may retrieve all classes and users from the Roster API, and store this. When the instructor logs in with Sign In with Apple at Work &amp; School, you can lookup the classes for that instructor based on the their unique user identifier.

|U03HK7X2Q06|:
&gt; In your team's experience working with schools, is it your experience that the IT Admin will be the first person to open the app in order to authorize the connection?
<@U03K6K2J79P> - We expect IT admins will be the users setting up and authorizing the Roster API integration.

Only IT admins (privileged Apple IDs at the school(s)) will be able to authorize access to the Roster API. If the user is not an IT admin for their organization, they will receive an error when authorizing.

|U03K6K2J79P|:
Thanks <@U03HK7X2Q06> - so we can maintain the scores or progress for each student connected to their unique id, and then based on an instructor's list of classes and the students within those classes we can choose to show that particular instructor the scores/progress of students in their classes :sparkles:

We love supporting ClassKit so that teachers can assign activities from our apps to their class and receive progress. The Roster API potentially allows us to build a functionality where teachers could assign work and review the progress of each student directly within the app. Any thoughts on how to create the best experience for schools and teachers between these two options? I suppose this is simply the best of both worlds, and even if we build the functionality into the app, the ClassKit contexts are still there and available for any teachers that prefer to manage the assignment in Schoolwork rather than in app :slightly_smiling_face:

|U03HRRAJQ0K|:
We love you supporting ClassKit, <@U03K6K2J79P>! - And teachers do too!

This is a great question, and I ultimately think that you don’t really have to choose between the two. It really depends on what kind of experience you want to create for your users.

If you were to build some sort of functionality within your own app, that would allow any teachers using your app to review the dashboard of progress within your app while only requiring a Managed Apple ID - allowing you to give a similar experience to your user base that aren’t using Schoolwork. For those that are using Schoolwork already, the teachers use it as a central workflow tool to review data, but could ultimately continue to benefit from the great ClassKit features that you’ve already built that allow them to review progress in Schoolwork itself along with all their other assignments.

|U03K6K2J79P|:
Thank you <@U03HRRAJQ0K>!

--- 
> ####  Do you see integration with directory services like Managed Apple IDs or Classroom/Roster directories with Declarative Device Management. It would be interesting to directly support group or user properties without having to abstract this through the MDM server (i.e. a device knows who is logging into it in the case of Shared iPad or macOS).


|U03HJ7TE1GT|:
Hey Jesse, that’s great to hear that you’re interested in declarative device management!  We’d love to hear more about your use-case, so please do file feedback with enhancements you’d like to see.

Also, in case you haven’t seen yet, this year we added a new declaration to allow servers to set arbitrary properties on the device. While it would still require the server to set this initially, or make future changes, you could include use roster information that can be directly used in activation predicates. Check out the example at the end of the <https://developer.apple.com/wwdc22/10046|Adopt declarative device management> session.

|U03JPJY6CTU|:
Thanks, yeah! That's where the inspiration for this question came from — the arbitrary propery management declaration. But it got me to thinking what can DDM do for me (or rather, my MDM server) lately so I don't have to manage something like that on the MDM-side (since the device knows what it needs to know) :slightly_smiling_face:

--- 
> ####  Hi! The same question about usual user flows for student/teacher/IT manager inside the app. Is there any scheme, roughly describing their user paths?


|U03HK7VC59U|:
Can you elaborate on your question ? Are you referring to the Roster API ?

|U03JZEDFDNU|:
Yes, about the Roster API. Maybe you've got  some sample user flows you can share?

|U03HK7X2Q06|:
<@U03JZEDFDNU> - Here are some possible user flows of student, teacher, and IT admins with Sign In with Apple at Work &amp; School and the Roster API:

Your app can start by integrating Sign In with Apple. When a user logs in, you can use their unique identifier to check your database/storage to see if you have retrieved data for their organization via the Roster API.

*If you do not have any data from the Roster API yet:*
1. User logs into app with Sign In with Apple at Work &amp; School.
2. IT admin goes to a "integrations", "setup" or "settings" section specifically for IT admins to setup and configure their school data. 
3. IT admin initiates authorization flow and consents to sharing data with your app.
4. Your app server retrieves and stores user and class information.
*If you have retrieved information from the Roster API for the authenticated user already:*
1. User logs into app with Sign In with Apple at Work &amp; School.
2. You can use the unique identifier from step 1 to check your database/storage to see if the user is a student, instructor or staff. 
3. If the authenticated user is a student or teacher, you could display the classes from your your database/storage or tailor the users’ experience depending on your app’s needs.


--- 
> ####  We have an app that is capable of fixing multiple grammar errors, which supposed to be a great writing assistant for all people.  However, if I were a parent, or a teacher at school, I'd want my kids not using this app while they're having English classes, since then they may not learn anything and just automatically fix all errors by our app without even reading.   I wonder if there is some API related to education or screen time that should allow our app and app extensions apply some limitations for those kids who're using our app?  Let's say, it could be the teacher that will enable some "Exam mode" that won't allow students who're studying online using their iPad to check grammar in our app.   Another example is a parent who enables some "mode" in the Family settings that prevents user from accessing some features. You may think about limiting app usage, but we have a keyboard extension that is doing all the magic, so I wonder if we can apply similar limitations for it as well.


|U03HRS3JX5Y|:
Hi Roman. There is a framework called “Automatic Assessment Configuration” (AAC) that a test developer can use to lock the iPad to a testing app, for the duration of the exam. That can prevent access to other apps while a test is in progress . Developers who build apps with AAC also have the ability to restrict access to 3rd party keyboards . They, or the admin, can control what apps students can see.  (this is something the test developer would do, rather than something you’d need to do in your app.)  Perhaps that’s a direction for you?

|U03JER2C7MX|:
I guess that would be enough. Since I was not aware of it, I was thinking if we can or should do anything from our side.

|U03HRRAJQ0K|:
<@U03JER2C7MX> - I appreciate the commitment to honest digital citizenship behind this question!

|U03J8N6PBHV|:
<@U03JER2C7MX> As a developer of an e-assessment/testing app I can tell you that I know both use cases: in language tests such grammar/spell checking apps would be required to be blocked/disabled. But in some other tests (non-language ones) they may even be desired especially to support non-native language students. 

|U03JER2C7MX|:
I wonder if we can expand our functionality using some API or app extension to cover the second case.

|U03J8N6PBHV|:
As <@U03HRS3JX5Y>  mentioned, a test developer should be able to allow access to a third party keyboard (<@U03HRS3JX5Y> did you mean by using AEAssessmentConfiguration?), so there would be nothing to do from your side). In case of a macOS app, the test app developer could permit your app to run along the testing app by specifying your app’s bundle ID (plus some more properties to clearly identify your app).

|U03HRS3JX5Y|:
actually In this case I was thinking of  UIApplicationDelegate’s application:shouldAllowExtensionPointIdentifier: function - if you “return false” from this, all keyboard extensions will be blocked.  A test developer could implement this to prevent keyboard extensions as needed.

|U03J8N6PBHV|:
Btw. the second use case of wanting to use third party apps in tests/exams (usually on Mac) is a common feature request we get from educators. Important for such a use case would be that the companion app restrict users from free access to the file system during an exam (unless it's a so called open book exam), so they can't access files they saved on their device beforehand. So for more complex apps some kind of restricted test/exam mode would actually be helpful.

|U03HRS3JX5Y|:
BTW Here is a Mac sample project showing how on macOS, you can enter assessment mode and optionally allow certain other apps to run while in assessment mode. You can also pick and choose which apps have network access while the test is happening.   In this particular example, it uses a configuration where <http://Calculator.app|Calculator.app> and <http://Dictionary.app|Dictionary.app> are allowed to run, but Dictionary is denied network access.  (Dictionary can do Wikipedia lookups so if you deny it network access, that part won’t work.)  <https://developer.apple.com/documentation/automaticassessmentconfiguration/build_an_educational_assessment_app>

|U03J8N6PBHV|:
Thanks <@U03HRS3JX5Y>, I forgot that I implemented shouldAllowExtensionPointIdentifier, this discussion was a good input that it makes sense to make this configurable per test/exam.

--- 
> ####  No question, just that the intro skit in the video was really fun and engaging, it hooked me!


|U03HRS3JX5Y|:
Thanks Joel! We know everyone worked very hard on their sessions, so this feedback is much appreciated.

--- 
> ####  Also not a question, rather a thank you. We had great support from you and seamlessly connected students &amp; teachers to our app at schools.


|U03HRRAJQ0K|:
Hi <@U03J25N6SES>! Thank *YOU* for all you do on behalf of the teachers and students that you’ve connected - that is exactly what we love to hear!  It wouldn’t be possible without all of you here! I wish you many more of those connections and hope that we can continue to support you in your endeavors!

--- 
> ####  More of a general MDM question but, setting up new customers with our MDM is fairly complex for new users and requires us to walk them through getting several different tokens to connect to APNS, DEP, VPP, etc. Any possibility of consolidating this process or providing an API in the future?


|U03HWTYUE3T|:
Thanks for the feedback. Are there specific enhancements or API integrations that would make onboarding your customers easier? If so, please file enhancement requests through <https://feedbackassistant.apple.com|Feedback Assistant>.

|U03HZ4W305B|:
The main one is definitely getting/renewing a APNS certificate. It's always super sad when someone forgets to renew it on time and loses communication with all their devices!

I will submit the enhancement requests. Thanks!!

--- 
> ####  Most K12 systems (SIS) organize students and teachers within a school, will you be adding this in the future?


|U03HK7VC59U|:
Thank you for this feedback. With the current release, we only expose user and class information. Please file an enhancement request at <http://feedbackassistant.apple.com|feedbackassistant.apple.com> with the details about what you would like us to support.

--- 
> ####  Are Schoolwork and Classroom only available to traditional Schools, or is there a way to use them for Homeschooling / Home Educating groups.  By the way, thank you for keeping the Ask A Question open, it makes a big difference for devs in other timezones.


|U03HU7ETA12|:
Hi Steven,

Great question! Managed Apple IDs are required to use Schoolwork and helps unlock all of the benefits of Classroom as well. You can <https://support.apple.com/guide/apple-school-manager/sign-up-axm402206497/web|sign up for Apple School Manager> if your homeschool is an accredited institution. You can also get started with Classroom right away with nearby students without Managed Apple IDs on <https://support.apple.com/guide/classroom/welcome/mac|Mac> or <https://support.apple.com/guide/classroom/welcome/ipados|iPad>. If you have a specific scenario or details in mind for using these, we’d love to hear from you by filing Feedback for us at <https://feedbackassistant.apple.com>.

|U03J8N6PBHV|:
But I guess you also can't use Managed Apple IDs generated with Business Manager with Schoolwork?

|U03HU7ETA12|:
Hi Daniel, that’s correct! Managed Apple IDs for education institutions are designed to support education administrators, teachers, and students and require an organization in Apple School Manager.

|U03J8N6PBHV|:
I'll file a feedback, it would be cool to support ClassKit also for business organizations, for example for internal training and courses

|U03HU7ETA12|:
Looking forward to receiving that feedback!

|U03JG3QTSGL|:
Thanks Kandy, it's for Home Education groups in the Uk, which I believe don't follow the same accreditation as in the US. I am generally finding it quite hard to get a grip on what School Manager, and Classroom provide, are there any  resources you can direct me too ?

|U03HU7ETA12|:
Apple School Manager uses the accreditation policies for each country. You can find the countries we support <https://support.apple.com/en-us/HT207305|here>. As for the benefits of Apple School Manager, Classroom, and Schoolwork, check out this link: <https://www.apple.com/education/k12/teaching-tools/>

|U03J8N6PBHV|:
<@U03HU7ETA12> Done: FB10161823

--- 
> ####  We are a branch of a university that sometimes deliver workshops to different students or in schools using a custom iOS app and a very small fleet of devices. We aren't using managed Apple IDs and aren't registered for Apple School Manager or Business Manager.  Our fleet of devices (25 iPads) are managed manually through Apple Configurator with a couple of configuration profiles. However, using App Store Apps like Playgrounds is cumbersome, because we need to sign in with an Apple ID on each device. Are there any tools we could use during setup or during the workshops that could streamline this process?


|U03HNU8UPPF|:
If your University is signed up for Apple School Manager you can request a Content Manager account and use that to install the apps via Apple Configurator. If not, your institution can sign up. When you install apps to devices this way you won't be required to authenticate with a personal Apple ID on the device.

--- 
> ####  The Roster API seems like a great extension to ClassKit! If I understood everything right, I think particularly interesting is that an app could offer a teacher more information about classes and students in that class than they can see in Schoolwork. Is this correct?


|U03HK7X2Q06|:
Hi Daniel - Schoolwork and Roster API both retrieve user and class information from Apple School Manager. So, the students, teachers, and classes will be the same in Schoolwork and from the Roster API.

|U03J8N6PBHV|:
True, that makes sense. I guess the point actually is that in the app (which is supporting ClassKit) you can get the same class/users information as in Schoolwork?

|U03HK7X2Q06|:
Correct! We hope you can builder richer, and more seamless app experiences with the student, teacher, and class information from the Roster API :slightly_smiling_face:.

|U03J8N6PBHV|:
And if you're using Sign In with Apple in the app for a teacher to log in, because the identifiers are same, you can associate the signed in teacher with his record from the Roster API and for example his classes?

|U03HK7X2Q06|:
Correct :thumbsup:

|U03J8N6PBHV|:
Yeah now I got it, was a bit late I watched the video yesterday night :wink:. That really opens up some new workflows/use cases, great!

|U03HK7Z8HC6|:
Hi Daniel, it seems like you are interested in accessing Roster info via ClassKit Swift/ObjC API. Please file an enhancement request at <http://feedbackassistant.apple.com|feedbackassistant.apple.com> with the details about what you would like us to support.

|U03J8N6PBHV|:
<@U03HK7Z8HC6> Yes, I will!
But I guess theoretically the OAuth process could also be integrated into a native app instead of into a web app?

|U03HK7VC59U|:
Hi Daniel, just to make sure it is clear - the Roster API is designed to be a server -to-server call. Once your app  receives an access token from a successful authorization by the IT Admin, it is your server that would need to fetch user and class information by hitting the different Roster API endpoints.

|U03J8N6PBHV|:
It would mean that the school admin would need to first use the app, grant access and the app could fetch the data. But then the data would still need to be shared with the same app on other devices which are then used by teachers.

|U03HK7X2Q06|:
Correct, Daniel. This would be one of the challenges with completing the OAuth flow within the native app.

|U03J8N6PBHV|:
<@U03HK7VC59U> I understand. The use case is rather that there is an app server which fetches the data over the Roster API and then the app could fetch that data from the app server.

|U03J8N6PBHV|:
I will file an enhancement request for direct access of Roster info via ClassKit Swift/ObjC as <@U03HK7Z8HC6> suggested.

--- 
> ####  Hi! I would like to share a suggestion I did to the design lounge with you as well guys.  As you know, AR and VR has a great potential in education with respect to elucidating higher dimensional mathematical concepts. On the one hand, Apple has already a quite expansive toolbox for generating and representing AR content and I know you are about to release its own VR hardware. On the other, Wolfram's Mathematica has a rather expansive collection of functions, readily expandable to VR, with which one can visualise, transform and in general represent higher dimensional content.  I believe, given the two companies' closeness and shared history (going back to the first Mac), there is a lot of potential for jointly introducing VR in the educational community, given especially how concept-focus learning has become the central theme among leading educators and organisations (like the IB).


|U03HFB3HQ7P|:
Hey Sotiris! We don’t know what the future will bring, but AR is already great way for students to explore mathematics! Geogebra is an example of a developer that has really embraced AR for visualizing math — check out these two apps:
<https://apps.apple.com/us/app/geogebra-3d-calculator/id1445871976>
<https://apps.apple.com/us/app/geogebra-augmented-reality/id1276964610>

|U03K19A2324|:
Hi Andrea! Thank you very much! Exactly, Geogebra indeed provides a fundamental example on how AR can offer significant boost on geometry visualisation and comprehension and VR can take it to full emersion (walking on surfaces, exploring fractal regions, manipulating parameters and seeing the landscape change around you, 'travel' on machine learning gradients, create rot and div effects with your own limps, explore the 'balancing' higher operators like the laplacian check, experiencing the effects of analyticity,  etc.).
AR/VR can offer an unprecedented access to the third (and to an extend the fourth) dimension, but has been tried and failed many times in the past. However, Apple's approach of not releasing just new technologies but also offering a complete ecosystem of content to go along with it, makes it really promising that what you will introduce will come to stay (along with educating the public about its proper use and avoidance of its dangers).
This is were I believe there great opportunities for collaboration between the great work you do at Apple and WRI's approach on knowledge computation and presentation that will enable the creation of amazing content!

|U03K19A2324|:
<@U03HFB3HQ7P>
(sorry I didn't include the ref in my previous message) :slightly_smiling_face:

--- 
> ####  Hello! I am interested in writing Playgrounds to discuss physics/math content. Would this be a candidate to be offered as Classroom content? Or do I need to talk to a school system to work through them? Thanks in advance, and have a good weekend.


|U03HRRAJQ0K|:
Hi Mayra, Kudos to you for tackling such a complex topic!

You would need to work with schools directly for them to be able to distribute their content, but to make it easy for them to distribute it, you would <https://developer.apple.com/documentation/swift-playgrounds/creating-a-subscription|create a subscription for your Playgrounds content>.

Once you have the subscription set up, the school would be able to <https://support.apple.com/guide/deployment/swift-playgrounds-app-payload-example-depe0f9af10e/1/web/1.0|send your subscription as a payload> to through their MDM to make it available on the target teacher and student devices for them to use in their classes.

They would also have the option to individually  subscribe manually to the URL by pasting it at the bottom of their More Playgrounds page. If you’d like to try subscribing to a sample one yourself, you can try the workflow with this feed: <https://ubtechrobotics.github.io/MeebotPlaygroundFeed/locales.json>

|U03J21EKNSE|:
Thank you for the information!

--- 
> ####  Are Subscription enabled Apps supported in VPP for Education (not as in-app purchase) ?


|U03HWTYUE3T|:
In-app purchase and subscriptions are not supported for volume purchased apps in Apple School Manager.

One option that might work for you is to publish a separate instance of your app specifically for Education customers at full price without subscriptions or in-app purchase.

|U03J8N6PBHV|:
<@U03HWTYUE3T> so it's not possible to for example charge annually, you could only sell the app for a one-time charge?

|U03KCM8QTHP|:
The full price option becomes forever license for the school since they buy the app in VPP and keep checking out the app to students every year replacing with newer iPads with no additional revenue to the developer

|U03HFB3HQ7P|:
Many developers in the education space distributing apps to institutions actually charge institutions directly if they would like this type of business model, and that is an option for institutional apps. Schools would then login to their already established accounts after downloading the app.

|U03J8N6PBHV|:
<@U03HFB3HQ7P> you're right, Andrea. It still would be great to have some subscription model through School Manager available especially for smaller developers which want to distribute standalone apps which don't need to connect to their own server. If you don't have your own server, it seems cumbersome to use one just for reasons of payment/subscription (or having to use some third party payment/subscription service).

|U03HFB3HQ7P|:
Hi all, yes-- this feedback has been heard, and please feel free to file additional feedback at <http://feedbackassistant.apple.com|feedbackassistant.apple.com> to describe any features that would help your institutional business. Thank you! In the meantime, <@U03KCM8QTHP>, I have seen developers publish annual versions of their paid apps.

--- 
> ####  Hi, Thank you for hosting this Q&amp;A.  I have a few questions regarding interaction between an App and Schoolwork.  If our app has implemented AAC  - Is it possible for the teacher to put all the students in the Classroom to AppLock (using Schoolwork) to our app in AAC mode?   Is our App able to query/get notified that the Teacher has put the App in/out of  AppLock mode?  Is there any ability in Schoolwork to pass config data to the App when it is put in AppLock mode? For example if it's a test, then it should setup the app without any prior work.  Thank you!


|U03HFB3HQ7P|:
Hey Dinesh — a teacher could certainly send all students to your app from the Classroom app, but then the actual Automatic Assessment Configuration lock would be handled by you in your app, initiated by the student as it is currently. You would then have the same information as always around when the session begins and ends in your app. Can you explain a bit more about what you’re looking for?

|U03J8N6PBHV|:
<@U03KCM8QTHP> your app could listen to the UIAccessibilityGuidedAccessStatusDidChangeNotification to find out if the teacher has put the app in AppLock mode. I think there isn't a way though to prevent that a student activates Guided Access manually prior to the teacher using AppLock (I think it's in both cases the same UIAccessibilityGuidedAccessStatusDidChangeNotification).

|U03KCM8QTHP|:
Thanks <@U03J8N6PBHV> for the suggestion.

|U03J8N6PBHV|:
Welcome, <@U03KCM8QTHP>. You can also have a look at our open source code: <https://github.com/SafeExamBrowser/seb-mac/blob/29941596c672cf5de4b5b911f8eadfeac2adaa2a/SEB/SEBViewController.m#L339>

|U03KCM8QTHP|:
<@U03HFB3HQ7P> Thanks. The advantage to the Teacher using Classroom App is to manage/herd all the students along as a group rather than checking if each student has put the App in Self-Lock before giving a Test, the teacher forcing it to be in that mode is less time spent on managing students. Ofcourse there are other scenarios where student initiated is better.
