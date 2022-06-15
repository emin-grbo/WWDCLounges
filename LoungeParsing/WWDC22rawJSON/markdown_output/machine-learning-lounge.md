# machine-learning-lounge QAs
#### by [FeeTiki](https://twitter.com/FeeTiki)
---

--- 
> ####  When training an Object Detection Model in Create ML, is there a way to take automatic snapshots to ensure that there is a record of how the model is performing throughout iterations as opposed to having to take manual snapshots to do so?


|U03HRMWNP4J|:
In the Create ML app this is a manual process. You can also set options on the project to automatically snapshot on pause or train more. Having an automatic option is a great feature request. Please consider filing a request using <http://feedbackassistant.apple.com|feedback assistant>.

You do have the option to use the Create ML framework directly in Swift and set your own cadence of checkpointing.  <https://developer.apple.com/documentation/createml/mlobjectdetector>

|U03JA6H3Z38|:
Thanks for the info!

--- 
> ####  When training a video activity classifier model in Create ML, is it best to have only one person's poses in the frame (and crop out others)?


|U03HRNBHZEX|:
Yes

|U03HRNBHZEX|:
If you have multiple people in the screen. Try to keep other people consistently smaller than the main person. Then it will still work (automatically select the maximum bounding box person)

|U03HB4T0CA3|:
check out the video from WWDC 2020 :

<https://developer.apple.com/wwdc20/10043?time=1461>

&gt; When it comes to using the model in your applications, make sure to only select a single person. Your app may remind users to keep only one person in view when multiple people are detected, or you can implement your own selection logic to choose a person based on their size or location within the frame, and this can be achieved by using the coordinates from pose landmarks.


|U03JELQLESV|:
Thanks for the answers, and for including the relevant part of the session!

--- 
> ####  This may be a more general Machine Learning question. I am interested in the ability to extract text from images and video.  The Vision framework does a great job of extracting the text.  One thing I would like to do is determine whether each piece of text is in a particular category of typeface, largely looking to tell a source code / monospace font from a sans serif font.  Which machine learning technologies available on Apple platforms would be best suited for that? And a high level of how you might approach that?


|U03HK3N00TG|:
So the Vision framework, where you extract the text, tells you the region in the image where the text is; the first thing to do would be to crop the text out of the image.

If you have a binary image classifier (sans serif vs serif, or “looks like source code” vs “doesn’t look like source code”, it’s worth experimenting with what definition works best – and you’d need to collect samples of each for your training set!), you can then throw that crop to this classifier to work out whether it’s source code or not.

So at a high level, what I’d do is;

• train a binary classifier to distinguish source-code from not-source-code
• using Vision, crop out the region of the image with detected text in
• use your classifier to determine whether it’s source code or not
and go from there!

|U03HNRF5MB7|:
Also you can try out the Live Text API this year, it's able to extract text of out images and videos. However it does not provide font-related information of the text yet. You can file a bug tracking this issue to us if needed.

|U03JENH943V|:
James, I created a serif/sans-serif model with CreateML. You can find it here: <https://github.com/jmousseau/Mimeo>

|U03JDNSUW78|:
Thank you! This is all very helpful! And thank you <@U03JENH943V> I will take a look at that model. It may be just what I need!

--- 
> ####  In the "What's new in Create ML" talk, near the end Repetition Counting was mentioned, and a reference to the "linked article and sample code", yet the WWDC22 Sample Code list does not include this, nor does the documentation, I believe.  Can you point me to the Sample Repetition Count code and Documentation?


|U03JELQLESV|:
Probably just taking some time for it to be ready, I had a similar experience with WWDC21 and the relevant sample code was put up after I filed feedback.

|U03J7UASVEU|:
Hi! We're currently taking a look, thanks for your patience.

|U03HVD99L14|:
Can you give us an update on this?  WWDC time is short, and availability of sample code earlier rather than later improves early use and feedback.

|U03J7UASVEU|:
Hi Glen, thanks for waiting. Try this link: <https://developer.apple.com/documentation/createmlcomponents/counting_human_body_action_repetitions_in_a_live_video_feed>

|U03HVD99L14|:
Hurray!  Thanks!

|U03HVD99L14|:
(The beta version build fails,…)

|U03HRMABBDZ|:
what is the build error?

|U03HRMABBDZ|:
Xcode needs to download the new Swift Async-Algorithm swift package, can you check if the download is successful

|U03HVD99L14|:
I just got it working…

|U03HVD99L14|:
Although Xcode still shows the error

|U03HVD99L14|:
Restarting Xcode, and All is Well!

|U03HRMABBDZ|:
Great!

|U03HVD99L14|:
Thanks for your help!

--- 
> ####  When making activity classification predictions on video frames, are there ways or considerations for improving speed aside from skipping frames (cadence)? Is prediction window size a factor?


|U03HRNBHZEX|:
The window size is fixed once a model is trained. At prediction time, you may adjust something called `stride` , i.e., how often (in terms of number of frames) you create a new prediction window. The smaller the `stride` , the faster you make a next prediction. This can make the results to refresh faster

|U03HRNBHZEX|:
There was a sample code from last year, called “<https://www.google.com/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=&amp;ved=2ahUKEwiThdeDl5z4AhUpiI4IHYOUAAcQFnoECAgQAw&amp;url=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcreateml%2Fdetecting_human_actions_in_a_live_video_feed&amp;usg=AOvVaw1ufSKqW6Qz_al-8HXVsvWK|Detecting Human Actions in a Live Video Feed>”, you may check this as a reference

|U03HB4T0CA3|:
Your app - and the model - need to balance three concerns:  Accuracy, Latency, and CPU Usage.

• :window: A shorter window size (selected at training time) may reduce run-time latency!  But if the window is shorter than the longest event you are trying to recognise, then accuracy may be reduced
• :man-walking:A shorter stride can also reduce latency, but results in more frequent calls to the model, which can increase energy use.
• :kangaroo: A longer stride reduces CPU usage, and allows other functions in your app such as drawing functions more time to work - which might help reduce any performance related bugs in your app, but will increase latency.

|U03HRNBHZEX|:
Also, try not to skip frames (unless you did the same for your training data), otherwise, the effective action speed captured in the window will change, and this may mess up the prediction result (accuracy)

|U03HB4T0CA3|:
*Latency*: is the time between when the action happens in the real world to when the app detects it and tells the user.  This will be experienced as 'snappiness'.  For action classifications, latency is at least as long as the windows size, plus a bit.  It's an emergent parameter caused by other choices you make.

*Stride*: is the time the model waits in between two detections.  This can be shorter OR longer than the window length.  It's a parameter used in the inference pipeline in your app.

|U03HRNBHZEX|:
Good summary :+1:. Latency can be slightly shorter than the window size, cause the model can predict the action when it sees the partial action. That’s why a shorter stride can help to refresh the results faster

|U03HB4T0CA3|:
You may also be able to reduce energy, memory and CPU usage by setting the camera to a lower resolution.  If your app is very busy, making this change might improve app performance.

This change should not reduce model accuracy, but your user's view of the scene will not be so sharp.

|U03HRNBHZEX|:
Another inference speed factor might be your device. A newer device with neural engine will help. A fully charged device, and operating in good lighting condition, etc. can also help to reduce the latency (improve the Vision pose detection speed, and camera frame rate)

|U03HB4T0CA3|:
We have a great session on understanding the performance of apps with machine learning models this year!  Check it out:

<https://developer.apple.com/videos/play/wwdc2022/10027/>

--- 
> ####  How would you recommend to approach the classification of various fine-grained subclasses of the same class? Specifically talking about different types of something made of paper.  For example: "a postcard with something written on it", vs "an empty postcard" vs "just some piece of paper" vs "another object"?  With classifier model we were able to obtain very accurate results to distinguish "paper vs some other object". However we couldn't get accurate enough results (I think ~60% accuracy) regarding the more fine-grained decisions: "postcard vs some piece of paper" and "postcard with text vs empty postcard". The mistakes were usually into false-positive side (identifying some piece of paper as a postcard in my example).   So how would you setup the training samples for this sort of goal? Or are we looking in the wrong option, and should be considering some other method, or a combination of methods instead?  Thanks.


|U03HK3KNMDL|:
Are you using Create ML for this or a different training framework?

|U03JV9KH3G9|:
Currently had to settle on Vision (rectangle + text detection), but would prefer Create ML solution (if I can find a proper training for it - hence this question)

|U03J4CASP0R|:
Something you could try is doing a hierarchical approach where you first detect the overall class and then crop and do a more precise classification.

|U03JV9KH3G9|:
Thanks. Do you think classification is feasible at all in this case? Or I should really concentrate on trying to get the text in such case, rather than trying to classify an object?

|U03HB4V9Q5V|:
In addition to tuning the training, you can also tune the data you're training on like you mention. Adding more examples (width breadth to encompass you expect to see in practice) where you're getting the false positives might help iron out those edge cases. There's some data augmentation options in both the CreateML App and CreateML Components to that could help grow your sample size and add some diversity to it without collecting monumentally more data.

|U03J4CASP0R|:
Hard to say if it's feasible. But getting text definitely sounds better suited if your sub-classes are always text based.

|U03JV9KH3G9|:
Thank you, guys

|U03HB4V9Q5V|:
Thank you!

--- 
> ####  Does an `MLModel` need to be adapted in any way to support predicting into buffers given with `MLPredictionOptions.outputBackings`?


|U03HB4VBDGX|:
`MLModel` does *not* need to be adapted in any way to accept output backings. `MLPredictionOptions.outputBackings` can be used to provide either a `CVPixelBuffer` or `MLMultiArray` depending on the output feature value type. When a `CVPixelBuffer` is provided as output backing for prediction, please ensure that the base address is not locked for read / write. Please check out <https://developer.apple.com/videos/play/wwdc2022/10027/|Optimize your Core ML usage> session tomorrow. If you have more questions, please bring your questions to the Q&amp;A Core ML session at 9am on 6/8.

--- 
> ####  The object extraction from images ("copy the dog out of the image into iMessage") is very impressive! Can we get access to that feature via some API?


|U03HB4V9Q5V|:
Thanks! This might be a question better suited to the Vision API Q/A on Thursday from 2-3 PM PT.

|U03HMD6FP9V|:
I was able to get around this by copying it into Notes app and saving the image in notes <@U03HVD5TM7G>

--- 
> ####  I‘m trying to get into Machine learning. What’s the best way to get to know all the methods for integrating CreateML into an app?


|U03J4CARJQ1|:
One way is to train a model in CreateML and then, add the resulting model into an app.

|U03HB4V9Q5V|:
That's exciting, glad you're interested! I can definitely recommend this year's (and previous years') sessions on CreateML. Each help go over part of CreateML and might be useful to you.

|U03J4CASP0R|:
Yes, please watch _Get to know Create ML Components_ :grinning:

|U03DJTBMHFF|:
<@U03J9R7MVJ7> I'm curious to hear what kinds of features you are wanting to build. Choosing the right task and understanding the data needs for training are a great place to start.

|U03HRMABBDZ|:
Also, are you looking at off-line training (then deploy) OR on-device training (training on iOS) as the potential use cases?

|U03J9R7MVJ7|:
I would like to build an app to predict stock price trends and classify expenses in a bookkeeping / tax management app

|U03HB4V9Q5V|:
So for something like that, you might look into Tabular Regressors for predicting future prices based on past price data (and whatever other data you want to use), and Tabular Classifiers to classify expenses into categories you select.

|U03J9R7MVJ7|:
And would you use offline training for that?

|U03HRMABBDZ|:
yes, like <@U03HB4V9Q5V> suggested, this falls into offline-training (then deploy) use case

|U03HK4YQZ0W|:
Here are some videos that can help you start from scratch. As others suggested there are a lot more things added to  Create ML in the last couple years.
* Introducing Create ML - <https://developer.apple.com/videos/play/wwdc2018/703/>
* Introducing the Create ML App - <https://developer.apple.com/videos/play/wwdc2019/430/>

In this video there’s a nice example project that you can follow through:
* Build an Action Classifier with Create ML - <https://developer.apple.com/videos/play/wwdc2020/10043/>

|U03HB4T0CA3|:
Can you tell me more about the "classify expenses in a bookkeeping / tax management app" case?  What does an example input look like?

|U03J9R7MVJ7|:
Thanks to all of you for your hard work developing all these amazing technologies and providing this support! :clap::clap:

|U03J9R7MVJ7|:
I am not that far yet but I was thinking of a combination of a text and other associated values (business/personal expense) and where the payment is going

|U03HB4T0CA3|:
is the text likely to be freeform: "A box of chocolates from the candy store on main street", or more like terms: "lunchtime snack"?

|U03J9R7MVJ7|:
More likely to be terms

|U03DJTBMHFF|:
You might be particularly interested in training on-device using the Create ML framework for this... given the historical data would be highly personal and continually changing (if I'm understanding the use case). The Tabular Regressor example that Alejandro shows in the _Get to know Create ML Components_ session is almost spot on with the problem you're trying to solve.

|U03HB4T0CA3|:
If the textual input is more varied and similar to human language then you might use a *Text Classifier*.

If it's more like terms and you want to include additional context such as price (numbers), then the *Tabular Regressor* is more suitable.

|U03J9R7MVJ7|:
Thanks again for the helpful knowledge!

--- 
> ####  Create ML Components looks amazing!! Have you experimented recreating popular architectures, like GANs and Autoencoders, with Create ML components?


|U03J4CASP0R|:
I'm glad you like it. Components allow you to work with a lot of different architectures. Can't wait to see what everyone builds.

|U03JVEMS83B|:
Thank you for the answer! Would you consider Create ML Components as an alternative to Tensorflow or PyTorch for iOS Developers?

|U03J4CASP0R|:
You are welcome. No, Create ML Components does not support building or training neural networks.

|U03J4CASP0R|:
It's closer to something like scikit-learn

|U03JVEMS83B|:
Great! Thank you for the clarification! For iOS developers who code for ML, it looks way more welcoming than scikit-learn with python. I’m very excited to try it out!

--- 
> ####  I utilize the drawing classifier from Turi Create in my app which has been working well. I previously tried an image classifier with Create ML but it took very significantly longer to train (about 55 hours vs 3.5 hours). Is Turi Create still the way to go until a drawing classifier gets added to Create ML? :D Bonus q: any Turi Create updates to share?


|U03HRMWNP4J|:
Create ML does not have a drawing classifier template or task API. You may want to check out the new Create ML Components framework which will let you construct your own pipeline similar to the one used in Turi Create.

|U03HRMWNP4J|:
Turi Create is still a good option if its working for you

|U03HRMWNP4J|:
However, Turi Create is no longer under active development

|U03HRMWNP4J|:
Note: The updatable drawing classifier available on <https://developer.apple.com/machine-learning/models/> has a pre-trained feature extractor for drawings as the first model in its pipeline.  You could use this sub-model as a custom feature extractor

|U03HRMWNP4J|:
Please consider filing feature requests or feedback on drawing classifiers via <https://feedbackassistant.apple.com>

--- 
> ####  Hello everybody! I’ll follow your suggestion: what are some ways to apply Create ML and CoreML to everyday tasks? What are the best tasks for CoreML models?


|U03HK3N00TG|:
Really, the limit’s your imagination! But machine learning methods, generally, work well if you have:

• a well-defined objective (in other words, a clear, unambiguous criterion which tells you whether a classification is the right one or how far an estimate is from its true value)
• enough training data.
That’s true of a lot of different problems! Image, audio and text classification are all things which are applicable to a lot of real-world problems – what kind of app are you thinking of building?

|U03JRQ9ADA4|:
Thank you a lot, Andrew! To be honest, I’m just exploring and learning new fields - and I’d like to understand as best as possible CoreML and Create ML to be able to incorporate them in future apps. Nevertheless, Image classification really intrigues me: I think I’ll dive deep into it :smile:

|U03HK3N00TG|:
Excellent! Good luck – the key way to take advantate of ML is identifying problems where the _goal_ can be clearly defined but the _method_ is tricky. It’s not worth training a ML model to say whether something is red or blue – the average pixel value tells you that. But determining the class of an object (or reading text out of an image, or…) – these are problems where you can define what a success is unambiguously, but coming up with heuristics for the problem is harder. That’s where you’ll get most “bang for the buck” from ML methods!

|U03JRQ9ADA4|:
Thank you again! That’s an incredible technology - and I’m sure it’ll help me solve challenging problems. Thank you for your precious advices! :smile:

--- 
> ####  Can a GAN solution be made from ML Components?


|U03JFGMTU8G|:
If you already have a GAN model, then you can use it in Create ML Components using an adaptor.

|U03HVD99L14|:
Any Sample Code?

|U03HVD99L14|:
Looking for more of an “Unsharp mask”

|U03HVD99L14|:
Analog for intelligence

|U03HVD99L14|:
Classification models to Generative ones

|U03HVD99L14|:
like compute blur, create Sharp

|U03HRMABBDZ|:
What is your use case in mind? Do you already have a mlmodel for this?

|U03HVD99L14|:
Building synthetic views of objects that are well represented in the training data.

|U03HVD99L14|:
Like having 1000 hummingbird pictures, being able to create N additional ones

|U03HVD99L14|:
that look real.  Where N is large

|U03HVD99L14|:
Or creating my 3D avitar based on all the images of me in my photo library

|U03HRMABBDZ|:
Thanks. CreateML Components does not offer out-of-box support for any *specific* GAN model, but you are able to make a transformer to use a GAN under the hood.

|U03HRMABBDZ|:
for the GAN model you are interested, do you already have a corresponding mlmodel?

|U03HVD99L14|:
I have a large training set of hummingbird images,…

|U03HRMABBDZ|:
I’d suggest starting from checking these models (where they are published) that you are interested, see if they can be converted to mlmodels, if you want to perform inference (deploy) on Apple hardware. CreateML or CreateML Components do not offer out-of-box support for such models, it meant to give *you* the flexibility to do so.

|U03HB4T0CA3|:
Did you come to WWDC before, Glen?  I feel like maybe you showed me a whole lot of hummingbird photos in San Jose a few years ago. I love those little guys - we get them in the the Bay Area.

--- 
> ####  There was a great WWDC video back in 2018 titled Vision with Core ML. The example app used live video capture to feed an image through the model using scene stability. There is sample code out there for UIKit, but always wanted to try and re-make using SwiftUI as a starting point. Any tips or pointers on making an image recognition app with live video capture using SwiftUI as a starting point ?


|U03HB4T0CA3|:
You have a couple choices here.

You can use the techniques you already know, and use `UIViewRepresentable`  to import the UIViews into your app.  That will still work really well!

|U03JBEQUEAJ|:
I've actually done exactly that using `UIViewControllerRepresentable` in the app I'm working on, and used a modified version of the VisionViewController which I think came from that video's sample code. It works perfectly... the entire app is SwiftUI except for the VisionViewController part.

|U03HB4T0CA3|:
Alternatively, you can display the camera feed by sending the image from each frame into a swiftUI `Image`.

The new `CreateMLComponents` feature actually includes a `VideoReader.readCamera` method which provides an asynchronous stream of image buffers, which is a great way to get started with this approach.

Alternatively you can use your existing AVCaptureDevice logic and delegate methods to provide a series of images.

You can see an example of this approach in the rep counting demo app which will be available soon as part of the WWDC session on CreateML this year <https://developer.apple.com/wwdc22/110332>

|U03HB4T0CA3|:
Recently I refactored some UIKit code into SwiftUI and found that the `ViewController` could be relatively easily transformed into an `ObservableObject` class, changing `@IBOulet` s into `@Published` properties.

|U03K7TYHFHN|:
Thanks <@U03HB4T0CA3>  and <@U03JBEQUEAJ> . Lots of useful hints for me to try and figure out. I am excited to try working on this again 

|U03HB4T0CA3|:
I've been experimenting with using `AVCaptureVideoPreviewLayer` too, is that what you used <@U03K7TYHFHN>?

|U03HB4T0CA3|:
<@U03JBEQUEAJ> if you have a link to the VisionViewController I would appreciate it, I may take a look one day and see how that's put together.

|U03K7TYHFHN|:
Yes was using the preview layer and showed a rectangle box on the screen when scene stability was reached.

|U03HB4T0CA3|:
Cool, using a preview layer is likely to be a very CPU / memory efficient way to do it.

I don't yet have a clear picture of the efficiency of using SwiftUI views to run the preview directly in the way I proposed above, so while it can be a lot of fun to do it purely in SwiftUI it may not be the best choice just yet.

|U03JBEQUEAJ|:
<@U03HB4T0CA3> Here's a link to the original <https://developer.apple.com/documentation/vision/training_a_create_ml_model_to_classify_flowers|sample code that has the VisionViewController> (click the download button from that page). Unfortunately I don't have a publicly available version that shows where I've used that with `UIViewControllerRepresentable`.

|U03JBEQUEAJ|:
In case it helps <@U03K7TYHFHN> though (maybe ignore where the Coordinator is a subclass of my ViewModel as that's probably very specific to my use case :sweat_smile:):

|U03K7TYHFHN|:
<@U03JBEQUEAJ>Thanks so much for sharing. New to learning SwiftUI and trying to grasp how to use UIViewcontrollerRepresentable correctly. Helps to see how you approached it . I am going to keep trying as feeding in an image from live capture for image recognition is way more magical vs forcing a user to take a single snapshot . Thanks again 

|U03JLPLTZ4M|:
Great Q. - I’ve been grappling with the same question of converting to Swift UI

--- 
> ####  When will CreateML support Neural Networks?


|U03J4CASP0R|:
Just to clarify, it does support neural networks. For instance `FullyConnectedNetworkClassifier`.

|U03J4CASP0R|:
But if you wanted to create a custom network you would need to use Metal or Accelerate.

--- 
> ####  We can separate people and background on photo, for example to create stickers, using VNGeneratePersonSegmentationRequest.  What about animals, objects and etc like you did it in iOS 16? I mean feature that I can longpress at any object on photo to copy/paste it. Do we have ready API for that?


|U03J20RJQ2X|:
Interested in this as well!

|U03HRMWNP4J|:
Yes, you can use VNGeneratePersonSegmentationRequest for people. There currently is no equivalent for animals or other objects via the Vision APIs.

Please consider filing a feature request or feedback via <https://feedbackassistant.apple.com> or bringing more questions to the Q&amp;A Vision digital lounge from 2-3pm on Thursday

--- 
> ####  I've created a small image classification model using Create ML with around 350 image labels. However, for the iOS app I'm making that could scale to over 100,000 labels (and likely much more) - each with over a hundred images for training/testing. Is there any way to scale to that level using Create ML? I've started teaching myself TensorFlow and researching various cloud services like Google Colab for the training because I think I'll need to go that route... and then convert that to Core ML. I'd appreciate any thoughts / recommendations.


|U03HK3N00TG|:
Wow, 100000 classes! That’s a hard problem – in fact, it’s something which would be at the research cutting edge.

Is there any structure to your classes? That might be something you could exploit.

|U03HK3N00TG|:
It’s definitely worth having a look at the literature here — these tend to be called “extreme classification tasks”

|U03HK3N00TG|:
<http://manikvarma.org/pubs/bengio19.pdf>

|U03HK3N00TG|:
This is a review which covers some of the problems in this area. However, if you have a natural hierarchy to your labels, you might consider having a hierarchy of classifiers. Let’s say we’re talking about animals; you might have a classifier from “animal” to “bird”, “mammal”, “reptile”, etc etc etc, then from “bird” to bird species

|U03HK3N00TG|:
That way each classifier is only predicting among, say, 1000 classes – which is a more tractable problem

|U03JBEQUEAJ|:
Unfortunately there is no hierarchy. Each image is completely different but easily recognized (usually). This isn't it exactly... but it would be similar to recognizing famous paintings, but where there are hundreds of thousands of them. I appreciate the feedback and will look over that "extreme classification" info. Thanks :smile:

|U03HY66772A|:
You may want to check out algorithms behind similar image search, where you calculate an embedding for an image, then find N nearest embedding from the known images, and derive your class/object from them.

--- 
> ####  Is there the ability in CreateML to make text generation models, GPT-3 type applications? Haven’t seen it but wanted to double check


|U03HRMABBDZ|:
No. I am interested in hearing your use case.

|U03J2004PGT|:
The things I'm interested in are things like, generating writing prompts, autocompleting text in the style of famous writers (I believe there was a demo of converting a model to CoreML for this), lightweight chatbots, and so forth.

|U03HRMABBDZ|:
Great use cases!  CreateML or CreateMLComponents meant to allow you to create custom ML models fitted to your training data. If you want to use such model, it makes sense to get that converted-to-CoreML model to try it out.

--- 
> ####  I'm new to ML. I would like to implement some sort of color matching with two photos (i.e. when superimposing a person on a different background, adjusting color, contrast, etc. to match the background better). Is something like that suited for CoreML (and if so, do you have any suggestions on how to approach that?), or would a simple algorithm be a better solution for those kinds of tasks?


|U03J4CASP0R|:
Doesn't sound like something you can do with Core ML or Create ML. Try the Vision API Q/A on Thursday from 2-3 PM PT.

--- 
> ####  Hi, so trying to do on device learning. If I do    Import CoreML … Let model = try MLLinearRegressor(…)  XCode alerts something like  “can’t find MLLinear regressor in scope”  How can I fix this, thanks


|U03HRMABBDZ|:
`MLLinearRegressor` is a symbol from CreateML, do `Import CreateML` instead up there

|U03HUQAAWEB|:
I'm pretty sure I tried that too… but okay thanks

|U03HRMABBDZ|:
sure, let me if this works, quickest way is to try that in an Xcode Playground

|U03HUQAAWEB|:
Away from computer. Will try soon. Hopefully. Thinking of questions

|U03HUQAAWEB|:
Import CreateML
“No such module createML”
Tried making new project, same thing
Tried in playground, auto completed this time, then again “No such module createML”
My Computer is up to date, with Xcode Version 13.4.1 (13F100)

|U03HRMABBDZ|:
what is the Xcode and macOS combo here?

|U03HUQAAWEB|:
macOS Montery 12.4 and Xcode version 13.4.1 (13F100)

|U03J4CASP0R|:
Create ML doesn't support the simulator, make sure you are targeting a device or your mac.

|U03HRMABBDZ|:
good point above, I thought it’s a playground for macOS, but is it an app, or a playground for iOS?

|U03HUQAAWEB|:
Yep it built and ran.  Just no code completion?

|U03HUQAAWEB|:
I tried both an iOS project and a playgound. I get a warning in both cases

|U03HRMABBDZ|:
for iOS project, what is the target?

|U03HUQAAWEB|:
Wait its working

|U03HUQAAWEB|:
Okay it works apparently…including code completion. Thansk

|U03HRMABBDZ|:
just to clarify, CreateML is NOT available on iOS simulator, so you build an app for iOS, please target a physical iOS device if you want to build &amp; run. If you just want to build without worrying a physical iOS device, choose Any iOS device to build.

|U03HRMABBDZ|:
if you want to try with a Playground, please use macOS playground, since iOS playground uses iOS simulator as well.

--- 
> ####  - Given an image, I'm wondering about the best approach to identify &amp; classify an object but also determine its color - could this be done by using separate components?  - and how would you recommend handling multi-colored objects


|U03HB4V9Q5V|:
This seems like a good fit for a standard image classifier. The main step to building an effective model would be to get enough sample data in each color and of each object to get a reasonably well-trained model. You could go about this in 2 ways:
• 2 completely separate models, one for type of object and one for color, and combine the outputs together
• A single model, in which each [color/object] pair is its own class. This could help out with interaction effects (if there are no purple bowling balls you'll never predict one), but it also expands the range of classes which might make the accuracy harder.
For multi-color, One option would just be to consider "multi-color" as its own color. As long as your training data reflects that your model should train accurately to that standard.

|U03JFF1S5U0|:
Or if you need to identify the color and you can crop to the object or even a relevant sub-section like middle square then you can use CIAreaAverage to get 1x1 image of the average color

|U03JLPLTZ4M|:
Thanks - I was thinking of the first approach.  I’m interested in multi-color but also patterning e.g. plaid, floral etc….  I had read somewhere about using pixel counts by color to determine color rather than ML

|U03JLPLTZ4M|:
yes, that pixel-based approach sounds similar

|U03JFF1S5U0|:
Yes it turns more into an image processing problem at that point. Core Image provides a variety of filters that are very good for image analysis in the "traditional" space

|U03JFF1S5U0|:
You could combine it with VNGenerateObjectnessBasedSaliencyImageRequest to get a mask and bounding box of the object

|U03JLPLTZ4M|:
thanks <@U03JFF1S5U0> this is v. helpful

--- 
> ####  Would Create ML/Components/Core ML be capable of dealing with music data? Specifically I want to train a model that can predict the tempo (BPM) of a song.


|U03HRMWNP4J|:
Core ML models can support audio data through MultiArray inputs of audio samples.  Create ML does support audio/sound classification but not tempo estimation.

|U03HRMWNP4J|:
Doing a quick search online it seems there is some work on models for tempo estimation, many of which could be converted to Core ML

|U03J1RX038W|:
Thanks. I have training data where songs have been corrected to have a perfectly consistent BPM throughout and I have a platform that transforms raw audio data into less granular transient magnitudes across frequency bands. I've tried building tabular regressors with the data in a few different ways but haven't gotten useful results so far.

|U03HRMWNP4J|:
With a tabular regressor you may want to explore some additional feature engineering steps.

|U03HRMWNP4J|:
Using more traditional DSP style algorithms

|U03HRMWNP4J|:
Perhaps windowed autocorrelation

|U03J1RX038W|:
That's exactly what the existing app (Tempi, on the app store) uses now. It works pretty well but I suspect an ML approach could be much better.

|U03J1RX038W|:
I never thought of combining them though. Interesting…

--- 
> ####  How to ball park run time for linear regressor predictions func? What I really want to know, how often I can call this?


|U03HB4T0CA3|:
Hi Adrien: I love this question, and we have a *great* session for you which dropped today.

<https://developer.apple.com/wwdc22/10027>

In _Optimize your Core ML usage_ you can see how you can open a model in xcode, and with a few clicks get an estimate of how long it will take to do inference (as well as other facts) on your device.

|U03HUQAAWEB|:
I’ll check it out and come back with any questions ,comments, concerns. Thanks

--- 
> ####  Why do older devices use more memory when loading MLModel? A model used about 600MB of memory on the iPhone 12 Pro, but on the iPhone 11 Pro the app crashed over 1.2GB of memory. ``` let model = try await SomeModel.load()  // load a model ```


|U03J52T5J22|:
We need to look at the model in question. Please submit a problem report through Feedback Assistant.

|U03JHAD6E3T|:
OK. Is it not a general tendency? It’s a GAN model.

|U03J52T5J22|:
We are not aware of such memory usage issue in general between the hardwares.

|U03JHAD6E3T|:
Thanks. I’ll feedback it!

|U03J52T5J22|:
Thank you, we appreciate it.

|U03J52T5J22|:
You can also request a 1:1 lab so that we can investigate together.

|U03JHAD6E3T|:
Oh, lab! I’ll refer the lab to a more knowledgeable colleague! Thank you.

--- 
> ####  What if my data is exponential, would that need a quadratic regressor? In one of the videos the data was parabolic and you normalized it. What’s going on here


|U03HB4V9Q5V|:
So this is a technique from classical statistics, but basically a common approach is to take a raw set of data and normalize it before applying a fit function. You could run data with an exponential distribution through a log transform, for example. One of the risks if you don't is that the leverage from a few points can be very high and skew your model. There's tradeoffs to this approach and many different techniques that can help you find a good model, but data normalization is often a helpful technique.

|U03HUQAAWEB|:
hmm, so generally for better models aim for data in a linear form with minimal outliers

|U03HB4V9Q5V|:
I think in general it can be helpful in data preparation as one tool that's available to use. But there's an entire field on this and I don't want to oversimplify.

|U03HUQAAWEB|:
Ok <@U03HB4V9Q5V> I appreciate your responses. Thanks

--- 
> ####  I've noticed you have a new way to store model weights in sparse form (which is a great addition) and am wondering it there's some fundamental blocker to using sparse operations at inference time too?


|U03HRMWNP4J|:
The sparsity is leveraged during execution on certain compute units such as the neural enigne

|U03KG1FM5R6|:
interesting, would that be the case for any model which contains sparse matrices? i.e. not just for ones which have been compressed using `sparsify_weights`

|U03HRMWNP4J|:
That is not generally the case. It is best to use the sparse encoding explicitly.

--- 
> ####  We're facing some challenges on converting our AI models to CoreML, some operations 'state-of-the-art' aren't fully supported and we're considering running it in a different approach. Would it be feasable to have a model in C++ and leverage the GPU power of the devices, if yes... how?


|U03HRMWNP4J|:
A composite operator may help you convert these operations: <https://coremltools.readme.io/docs/composite-operators>

|U03HRMWNP4J|:
In some cases you can also supply a <https://coremltools.readme.io/docs/custom-operators|custom operator >but to leverage the full Core ML stack its best to see if you can represent the functionality as a composite op first

|U03J6AKH19V|:
<@U03HJ5M01M0>  is there any workaround for `torch.stft` and `torch.istft`  ?

|U03J4CNMT6D|:
Are the FFT operations in the beginning / pre processing stage of the model? If so, then you can accelerate the rest of the model by converting it to CoreML, and implementing the FFT operation using BNNS or Metal.
Would be interested to know more of your use case, so if you can request for a lab session on this topic (mentioning my name), would be happy discuss more.
In any case, submitting a feedback request with your use case would be great.

--- 
> ####  Are there any updates planned for coremltools, notably supporting complex numbers. I'm looking to convert a TensorFlow model, but even after implementing missing operations like Fast Fourier Transform, I'm blocked by the fact there is no complex number support.


|U03J4CNMT6D|:
Yes, you are right. There isn’t a complex number data type in the <https://coremltools.readme.io/docs/model-intermediate-language|CoreML MIL spec>
The best way to use them is by treating complex numbers as 2D vectors of real and imaginary numbers

--- 
> ####  Hi, can a ML model extract certain values off a json such as “VideoType” and URLs then return those values to make a network request?  I’m looking a making a video recommendation system with ML but not sure the best way to do it. 


|U03JFGMTU8G|:
Have you tried the MLRecommender in Create ML? That is a great place to start for building recommender systems. Since your data is in json format, you can also try the TabularData framework which can help with the json loading!

|U03HZ3L98TF|:
Didn't know MLRecommender existed! Thank you for that tip I'll have a look into it and use TabularData as well. Thanks again 

--- 
> ####  Can num features vary. Say I wanna guess catAge given numWhiskers, furDensity, and numLegs. But sometimes I may only have numWhiskers and numLegs and not furDensity. Would that require its own, separately trained, MLModel?  Similarly, (same question different example)   Tic tac toe…  trainingData.csv position0,p1,p2…p8, didWin 0,1,1…1,1 0,0,1…1,1 1,0,0…1,0 …  Then at next move prediction time Can I use this same model when the game is 2,3, or 4 moves in?  Effectively   nil,0,1, nil,nil,nil,nil,nil,nil,nil,nil nil,0,1, nil,nil,nil,1,nil,nil,nil,nil … 1,0,0, nil,nil,nil,0,1,1,1,nil


|U03JFGMTU8G|:
This is such a cool example! Thanks for the question. Have you tried using the tabular classifiers in Create ML? When you have missing data in your feature columns you can try replacing them (imputing). The TabularData framework makes this part really easy.

|U03HUQAAWEB|:
Im not sure if I tried it, maybe once. Mostly regressors. What do you mean I can try replacing them. Replacing them with what

I did hear tabularData has a fill function or something like that

I guess I need to read more about something

I mainly wanted to know if it was possible, and it looks like you’re saying it is. cool

|U03HUQAAWEB|:
Follow up…With linear regression models, if Im interested in predicting more than one target, do I need a model for each target I’m interested in?

--- 
> ####  I want to start learning ML and CoreML, and I have thought of a problem space that may be interesting that could use further exploration. I know NLP depends on extraordinarily large data sets, but I'm wondering about the utility of training a model on a constructed language with a much smaller data set. The one I have in mind has a very small official dictionary (slightly more than 100 official words), and rather simple grammar rules. Are there resources you would recommend for exploring this specific application of ML, or any pitfalls I might want to keep in mind?


|U03HRM0UK8B|:
This depends somewhat on what sort of tasks and models you are interested in. For example, for a classification task, the maxent classifier available through CreateML is not language-dependent. It should be able to take on classification tasks in an artificial language of this sort. Gazetteers are language-independent, so they would still be usable. Our built-in embeddings are language-dependent, so they would not be of use here. If you want to train your own embedding or language model using open-source tools, that probably would still require significant amounts of data, but perhaps not as much as with natural languages. Language modeling techniques have recently been applied with some success to programming languages. If your rules are similar to the syntax rules of programming languages, you might consider using the sorts of parsing tools that are used for them, but that is really a different area than NLP.

|U03JN80PFRQ|:
I am exploring non-ML tokenizing and parsing as well, because the grammar rules are rather straightforward and the word set is small. The language has recently been given an ISO identifier, but there is little support for it in general. I’ll take a closer look at traditional parsing tools, thank you!

--- 
> ####  We converted a Tensorflow image segmentation model to CoreML. We notice that we get different results when running this CoreML model on macOS (with Python3 and coremltools) versus on iOS. Predictions are way less accurate on iOS and we cannot explain why (even when setting computeUnits parameter to .cpuOnly).


|U03J4CNMT6D|:
Have you tried setting the `compute_units=ct.precision.FLOAT32` as described <https://coremltools.readme.io/docs/typed-execution|here>
That  said, for the CPU compute unit I would expect the predictions to match between iOS and macOS. There could be differences with the “all” compute unit depending on the actual hardware the model runs on mac and ios which can be different. If you could file a feed back request with the code to reproduce these differences that you are observing that would be great!

|U03J7ETMDHU|:
Thank you for your reply. We actually did use the `compute_units=ct.precision.FLOAT32` setting when converting the Tensorflow model to CoreML. It did not change anything in our results. We also tried using the new MLPrograms but the results were unchanged.

--- 
> ####  - What would be the best way to figure out which objects go together - say you have 10 groups of three and a pool of 100 ungrouped objects &amp; you want to group them similarly?


|U03HB4V9Q5V|:
Thanks for asking Derick! It would be helpful to clarify what the "objects" are in this context. If they are objects within image data, you could leverage the CreateML feature extractor to turn it into structured tabular data.

From there, it's a classical unsupervised clustering problem, for which there are several approaches. Something like k-means is a quick and effective approach that might work in your case. <https://apple.github.io/turicreate/docs/userguide/clustering/kmeans.html>

|U03JLPLTZ4M|:
Yes the objects would be images

|U03DJTBMHFF|:
There is also a `CIKMeans` filter in CoreImage. That may be exactly what you need, Derick.

|U03JLPLTZ4M|:
Thanks - I need to learn my way around CoreImage a bit more….this has been really helpful!

|U03DJTBMHFF|:
There are some Core Image lab appointments available on Friday if you want to dive into this 1:1 with engineering

--- 
> ####  Do you know if it is possible to have a layer-wise execution time profiling with XCode14 for the operations that run on the Neural Engine or GPU?


|U03JFGMUPCY|:
The new performance reports give a layer-wise break down of compute unit support, but not execution time. Please consider filing some feedback at <http://feedbackassistant.apple.com>

|U03HB4VBDGX|:
<@U03JK7MD2EP> we also recommend setting up a 1:1 lab to discuss this further. We would love to understand your use case and how we can support that. You can mention our names in the description.

|U03JK7MD2EP|:
<@U03HB4VBDGX> Unfortunately all is booked on Thursday 9 and it will not be possible for me on Friday. Let me know if there is another possibility to scheduled a 1:1

|U03HB4VBDGX|:
Oh no. <@U03DJTBMHFF> <@U03J7UASVEU> any thoughts on how we can proceed in this case?

|U03JK7MD2EP|:
Thanks for taking care <@U03HB4VBDGX>

|U03HB4VBDGX|:
<@U03JK7MD2EP> I heard back from WWDC organizers. Unfortunately, we can't guarantee a 1:1 outside of this week. If you could share your Feedback Assistant number (that starts with FB), we'll follow-up soon. Follow up might just be in the FeedbackAssistant itself if it's minor or warrant a call which we can assess once we see the details.

If you can make an exception to register for tomorrow's 1:1 lab, it would be great if not, no worries! We will sync via FeedbackAssistant and figure out next steps.

--- 
> ####  Do you have some method to share with us to benefit from sparse weight features (very nice features) without sacrificing the applicative performances?


|U03J4CNMT6D|:
The sparsity weight feature will be useful for models that have been trained with “weight pruning” techniques

--- 
> ####  CoreML Performance Report is great, but I can't find per-layer performance stats to find bottlenecks in our model.


|U03JFGMUPCY|:
The new performance reports offer per-layer compute unit support, but not per-layer timings. One further step you can take to find bottlenecks in the model is to press the "Open in Instruments" button where you can see further details in the Core ML Instrument. This won't offer per layer timing details, but it can help find bottlenecks related to data operations and compute unit changes.

|U03HY66772A|:
Thanks, I've seed similar question posted, and I've tried to book a lab session for tomorrow:)

|U03HY66772A|:
Filed a suggestion for this idea: FB10165588

|U03HY66772A|:
Additional suggestions following our lab session:
FB10165684 — list of layers supported by ANE
FB10165713 — more articles on ANE optimizations
FB10165760 — specific flag to let developers know if model running only on ANE

--- 
> ####  Is there a way to run performance report on older verions of iOS? I suspect new compiler runs model differently that the Xcode 13 one.


|U03HRMWNP4J|:
Performance reports require iOS 16

|U03HRMWNP4J|:
Older iOS version unfortunately cannot provide the same information.

--- 
> ####  What is a good approach in case of Image classification problem. I am trying to classify two similar shapes lets say Circle and Oval, in some case the confidence for the Ovel is very high for the circle input. 


|U03JFF1S5U0|:
Have you looked at VNDetectContourDetection? Using this traditional computer Vision approach might give you better results.

|U03JRQ81NEL|:
Thanks, will look into it

--- 
> ####  Vision question: does a VNRectangleObservation contain information about the shape's full outline?  For example: a document scanner that needs to fully extract a page from its background.  VNDetectRectanglesRequest will provide the position of each corner of the page, which allows us to clip the shape assuming the page is flat.  But if the paper is curled, we can end up with bits of background in our cropped image.  Is there a way to trace an accurate outline for imperfect rectangles?


|U03JFF1S5U0|:
For imperfect documents, you might want to look at VNDetectDocumentSegmentationRequest and they combine it with a contour detection on the globalSegmentationMask that you get as a result

|U03JML9Q51T|:
Can you explain how VNDetectDocumentSegmentationRequest differs from VNDetectRectanglesRequest? The result types look similar - does VNDetectDocumentSegmentationRequest somehow rely on text being on the page?

My real app scans papers that don't necessarily contain any text - so not a true “document”.

|U03JFF1S5U0|:
DocumentSegmentation is ML based and trained on all kinds of documents, labels, papers, etc. Rectangle detection is a traditional algorithm that works of edges that intersect to form a quad.

|U03JML9Q51T|:
I'm having a hard time finding any mention of globalSegmentationMask online, aside from the property itself in the docs. Can you provide some clarity on how this might be used for contour detection? Thanks for the help.

|U03JML9Q51T|:
It's not clear to me which region of the image this pixel buffer would contain.

|U03JFF1S5U0|:
<https://developer.apple.com/documentation/vision/vndetectedobjectobservation/3798796-globalsegmentationmask?language=objc>

|U03JFF1S5U0|:
It is a low res pixel buffer that represents the shape of the detected document. Where each pixel represents a confidence of being or not being part of the document

--- 
> ####  There are a lot of CoreMLCompiler versions throughout the Xcode history. Some break inference (e.g. some of the Xcode 13 coremlcompilers broke iOS 14 runtime). Is there a way to diagnose these errors without compiling under every compiler and running on all iOS devices?) And is there a known stable version of a compiler?


|U03HB4VBDGX|:
&gt; Some break inference (e.g. some of the Xcode 13 coremlcompilers broke iOS 14 runtime). 
Maintaining backward compatibility is really important for us. We would like to understand this better. Could you file a bug report on <http://feedbackassistant.apple.com|feedbackassistant.apple.com>? It it works for you, could you please set up a 1:1 lab with Apple engineers so we can understand the issue better?

|U03HY66772A|:
I've booked a session for CoreML Performance, do I need to book another one?

|U03HB4VBDGX|:
<@U03J7UASVEU> we might need another session to discuss this. Could a developer request more than 1 sessions?

|U03J7UASVEU|:
<@U03HB4VBDGX> I would recommend requesting multiple labs.

|U03HY66772A|:
Should I reference you, <@U03HB4VBDGX>?

|U03HB4VBDGX|:
Thanks! Looking forward to chatting with you, Viacheslav.

|U03HB4VBDGX|:
Yes, you could add my name in the description / notes.

|U03J7UASVEU|:
<@U03HY66772A> We'll also make a note when scheduling :slightly_smiling_face:

|U03HY66772A|:
Ah, looks like I can't request another session:(

|U03HY66772A|:
I can cancel previous one (and request another?)

|U03J7UASVEU|:
<@U03HY66772A> our labs are still open for Thursday/Friday, are you able to request for those days? I would not cancel at this point.

|U03HY66772A|:
Done, thanks!

|U03HY66772A|:
<@U03HB4VBDGX> Filed a feedback: FB10165528

|U03HB4VBDGX|:
Thanks for sharing this! Let's continue discussion on this.

|U03HY66772A|:
<@U03HB4VBDGX> I’ve requested a contact, btw

--- 
> ####  Is `VideoReader` a `CoreML` component, or is this a custom component, as referenced in #wwdc2022-10020, built on top of the new async `AVImageGenerator`?


|U03J4CASP0R|:
It is a ~custom~ built-in Create ML component .

|U03J20E7UBV|:
Thanks, <@U03J4CASP0R>!

|U03HRMWNP4J|:
<https://developer.apple.com/documentation/createmlcomponents/videoreader>

|U03J20E7UBV|:
Ah, thanks, <@U03HRMWNP4J>!  I was searching in the general `CreateML` docs and not the `CreateML Components`.

|U03HB4T0CA3|:
Hi Brandon, can you point me at where you found async `AVImageGenerator` ?  Was it in a session this year? I'd like to check whether it would be another good way to generate frames for CreateML.

|U03J20E7UBV|:
<@U03HB4T0CA3> I noticed the latest changes to `AVAssetImageGenerator` (sorry, I mistakenly referred to it as `AVImageGenerator` above) in the documentation here; <https://developer.apple.com/documentation/avfoundation/avassetimagegenerator?changes=latest_minor>

It seems like there are two new methods;
`func image(at time: CMTime) async throws -&gt; (image: CGImage, actualTime: CMTime)`

`func images(for times: [CMTime]) -&gt; AVAssetImageGenerator.Images`

That can take a `CMTime` or array of `CMTime`s and asynchronously return a `CGImage` or an `AsyncSequence` that includes the generated image(s).

|U03HB4T0CA3|:
Thanks for the recommendation Brandon, I will enjoy watching that.

--- 
> ####  Hi @David! Congratulations on a fine presentation. May I ask if there is some functionality to enable to recognise the direction (arrow) of time in a video?


|U03JFGMTU8G|:
Thank you! I'm so glad that you enjoyed the session. Can you clarify your problem? You may be able to detect the direction of play in a video without machine learning.

|U03K19A2324|:
Yes <@U03JFGMTU8G>! It's actually a pretty recent research question but it has high value and I was wondering if you have implemented some kind of relevant functionality. It's not so much about detection the direction of play itself but recognising time itself in a video sequence. For example, suppose you have a video of traffic (or even the gym training data in your nice presentation :slightly_smiling_face: ) and that the flow of time is scrambled sometimes going forward and sometimes in reverse. Can we recognise the flow of time at each time point?

|U03K19A2324|:
In an actual application, the problem would be simpler: Find the direction of time is some video data (is it as the video plays or the reverse?)

|U03K19A2324|:
Of course the more symmetric the video motion is the harder will be to tell the difference:
For example, in a video data representing flowing water the direction of time is clearly defined (is there some functionality in Create ML to find it?). But in a video that, let's say zooms in in an Apple Maps windows, playing it in reverse would be equivalent to zooming out, so this anti-symmetry does not allows us to have a clearly defined direction of time.

|U03HRMWNP4J|:
Interesting problem! You may find understanding the apparent motion of pixels in the image a useful input. You can compute optical flow using Vision <https://developer.apple.com/documentation/vision/vngenerateopticalflowrequest|VNGenerateOpticalFlowRequest >

|U03K19A2324|:
Hmm thanks <@U03HRMWNP4J>! That is a very useful input indeed! However, one would still have to interpret these motions as representing something going forward in actual time or backwards (like decide if water is flowing forwards, out of a faucet, or backwards, into the faucet). My guess would be entropy estimation/learning would be critical in making such a decision.

As I wrote, it is still a pretty recent research question (for example, this is an ERC grand given last year to further study it in detail
<https://cordis.europa.eu/project/id/950086>
) but it has important practical implications that it would be very nice to see any such functionality implemented in Create ML, to be able to working with temporal (agnostic) data.

--- 
> ####  Hi! I was surprised that the session video did not discuss (unless I missed it, which is definitely possible) how to write custom components. Let's say I want to write my own PoseSelector component. For example to pick the person closest to the center of the frame, and to keep the selection consistent across frames in a video.  Can I? And if yes, how?


|U03JFGMTU8G|:
Hello! Thanks for your question. You can definitely build your own custom components. In the session _Get to know Create ML Components_, <https://developer.apple.com/videos/play/wwdc2022/10019/>, Alejandro provides an example of how to do it by building a saliency transformer. All you need to do is to conform to the `Transformer` protocol!

|U03JRPTG8BS|:
Ok, great, thank you!

|U03HRMABBDZ|:
<https://developer.apple.com/documentation/createmlcomponents/transformer>

|U03HRMABBDZ|:
here is the protocol for Transformer

|U03JRPTG8BS|:
The protocol has a lot of methods. I assume/hope I would not have to implement all of them for a custom transformer?

|U03JFGMTU8G|:
Good question! The only required method for you to implement is `applied`

|U03J4CASP0R|:
<https://developer.apple.com/documentation/createmlcomponents/transformer/applied(to:eventhandler:)-38h86>

|U03HRMABBDZ|:
search for `Required` on the page

|U03JRPTG8BS|:
Perfect!

--- 
> ####  Just wanted to say thank you for such thorough content and for building a solution that makes machine learning easy to implement in our apps.  This is incredibly powerful, and so many solutions can have such a steep learning curve.  CreateML and CoreML are truly amazing; great job to you all!


|U03JFGMTU8G|:
Thank you for your positive feedback! :smile:

--- 
> ####  In addition to the built-in classifiers and regressors, is it possible to specify a neural network with a custom structure (by specifying the layers) and use that for training and inference?


|U03J4CASP0R|:
You can use a FullyConnectedNetworkClassifier or regressor, which support specifying the number of hidden layers.

|U03J4CASP0R|:
other network architectures would require using Metal or Accelerate

|U03HRMABBDZ|:
also number of hidden units in each layer for fully connected network

|U03JRPTG8BS|:
That’s nice that you can configure arbitrary MLPs :+1:

|U03JRPTG8BS|:
Or is it actually an MLP? Are there any nonlinearities between the fully connected layers? Such as ReLUs?

|U03J4CASP0R|:
Yes, there are ReLUs on every hidden layer.

|U03JRPTG8BS|:
Ok, thanks. And it seems the activation function isn’t configurable, but hardcoded to ReLU? Which is probably fine for most use cases.

|U03HRMABBDZ|:
no, it’s not configurable, only ReLu

|U03J4CASP0R|:
If you have a use case please file a ticket in Feedback Assistant

--- 
> ####  Does training (using the fitted or update methods) take advantage of the Neural Engine, for example when training a fully connected classifier?


|U03HRMABBDZ|:
Not on neural engine, but training of fully connected network is  optimized on best possible compute unit

--- 
> ####  Whats the meaning of the error below when calling model.predict()?  RuntimeError: {     NSLocalizedDescription = "Error in declaring network."; }


|U03JFGMUPCY|:
This indicates that there is an error setting up the model. Can you please file a feedback report with code to reproduce the issue? Also can you verify if this issue reproduces with different compute unit options used when loading the model?

|U03J6AKH19V|:
<@U03JFGMUPCY> is there a workaround for `torch.stft` and `torch.istft` (which are unsupported)?

--- 
> ####  Great updates. How do I go about training a dance classifier with with video files? Are there any components for audio, video to get started with?


|U03JFGMTU8G|:
Thank you! You can definitely build a dance classifier using the action classifier in Create ML <https://developer.apple.com/videos/play/wwdc2020/10043/>

--- 
> ####  With the initializers for MLImageClassifier.ModelParameters being deprecated, what is the easiest way of increasing the iterations being performed?


|U03HB4XKB8X|:
`MLImageClassifier.ModelParameters` still has the
```
init(
validation: ValidationData,
maxIterations: Int,
augmentation: ImageAugmentationOptions, algorithm: ModelAlgorithmType
)
```
 initializer which you can use to set the maxIterations along with other parameters that you want.

|U03JA6H3Z38|:
When I try to only assign the maxIterations, XCode complains that the function is deprecated, is that the expected behavior?

|U03HB4XKB8X|:
There are a few initializers that were deprecated so if you are trying to use one of those old ones to set the maxIterations, you will get this warning.

However, are you trying to use this exact initializer and still getting a warning?

|U03JA6H3Z38|:
This is how I am accessing it MLImageClassifier.ModelParameters(maxIterations: 50)

|U03HB4XKB8X|:
Yeah because the initializer that I am suggesting has no default value for `augmentation` . So, when you call this initializer you need to pass the `augmentation` parameter as well. If you don't want to set any `augmentation`, you can just pass a value of 0 for this parameter.

If you do not specify `augmentation` in the init at all, one of the old initializers will be used and hence you will get the deprecated warning.

--- 
> ####  Is there a way to use one IOSurface for moth ANE and GPU work? Or access ANE iosurface directly, and map it to MTLTexture by hand?


|U03J52T5J22|:
IOSurface-backed `CVPixelBuffer` with `OneComponent16Half` pixel format type can be shared with Neural Engine without copy. Likewise, `MLMultiArray` which is backed by the pixel buffer can also be shared without copy. (See `-[MLMultiArray initWithPixelBuffer:shape:]`).

For input features, using these objects in MLFeatureValue is enough to take advantage of the efficient data processing. When the output feature type matches the type above, CoreML automatically uses these objects in the output feature values as well.

For output features, you can even request the neural engine to write into your own buffer directly. See `-[MLPredictionOptions outputBackings]`.

You can create `MTLTexture` view into the pixel buffer with `CVMetalTextureCache`.

|U03HY66772A|:
Amazing, thanks a lot for your help!

|U03JF5PC27R|:
<@U03J52T5J22> 

is there any chance you will add support for at least 4 channels no-copy buffers?

these features are really cool and long-awaited but almost all cv models produce or take as input rgb or n channels data

|U03J52T5J22|:
&gt;  is there any chance you will add support for at least 4 channels no-copy buffers?
One way is to stack each channel on height axis and use that big pixel buffer as a backing of MLMultiArray. So:
```
let backingPixelBuffer = ... // size = (width, height * 4), format = kCVPixelFormatType_OneComponent16Half
let multiArray = MLMultiArray(pixelBuffer: backingPixelBuffer, shape: [4, height, width])
```
This won’t work if your image representation is so called “packed” format, where each channel is interleaved in the frame buffer. We appreciate your feedback assistant report with a use case if that’s what you are looking for.

|U03JF5PC27R|:
<@U03J52T5J22> ugh, that's not gonna work for my rgb-rgb models

are `float16` `MLMultiArray` no-copy also? will there be a copy event if I specify user-allocated `MLMultuArray` with float16 data into `outputBackings`?

|U03JF5PC27R|:
my goal is to share a memory between `MPSImage` and `MLModel` output so there is a seamless ANE-to-GPU transition

|U03J52T5J22|:
The neural engine is unable to write into `MLMultiArray` directly unless it was initialized with an IOSurface-backed pixel buffer. (`-initWithPixelBuffer:shape:`)

|U03JF5PC27R|:
is direct writing to IOSurface-backed buffers compatible with flexible shape input/outputs?

|U03HY66772A|:
Hello, Andrew:) I’ve guessed you'll be interested in this thread:)

|U03JF5PC27R|:
<@U03J52T5J22> friendly tagging you so the question doesn't get lost in thread notifications :innocent:

|U03JF5PC27R|:
<@U03HY66772A> these insights are crazy valuable, really appreciate the opportunity

|U03J52T5J22|:
&gt; is direct writing to IOSurface-backed buffers compatible with flexible shape input/outputs?
As the application needs to prepare the output buffer in `-outputBackings` property, it must know the shape of the output before invoking the inference. Some flexible shape models (e.g. enumerated input shapes) meet the criteria, but so called “dynamic shape”, where the output shape is dynamically determined by the network, won’t work.

|U03JF5PC27R|:
yup, enumerated shapes is something I'm targeting for

|U03JF5PC27R|:
so If I have both input and output with an enumaratedly flexible shape I can pass one of pre-allocated buffer pairs and still no copy will occur?

|U03J52T5J22|:
Sorry, I do not have a definitive answer. I would suggest to test it with the latest Instruments, which <https://developer.apple.com/videos/play/wwdc2022/10027/|shows the buffer copy event in the analysis> and send feedback assistant request if the outcome is not desired.

|U03JF5PC27R|:
<@U03J52T5J22> thanks for quick and excellent answers! it was crazy useful and insightful

|U03J52T5J22|:
You are welcome, Andrew and Viacheslav! Enjoy the rest of WWDC 2022!!

--- 
> ####  Hi! As far as I understand, extracting text from images is not possible for Arabic language, would it be possible to use CreateML to achieve the same effect that is built in to extract Arabic text from images and documents? thanks


|U03HB4T0CA3|:
Hi <@U03HVCXR1T8>.  You are right about Arabic support; While Apple announced more language support for Live Text this year, Arabic was not one of them.  The complete list is here:

<https://www.apple.com/ios/feature-availability/#live-text-live-text>

|U03HB4T0CA3|:
It's not possible to extend Live Text to add additional user languages at this time.

To build your own system would require solving multiple ML problems, including locating text in the image, decomposing it into graphemes (characters), and to be robust it should probably include some sort of spelling/grammar layer to reduce transcription errors.

Building a complete solution like this is beyond what CreateML is designed for today.

--- 
> ####  Is there any guidance on using CreateML for creating segmentation models (great for use in ARKit to segment unique types of objects as detected in the camera feed)?  Or would this be a case for building a custom Turi/other model and converting to CoreML?


|U03JFGMTU8G|:
Thanks for you question! The first thing I would try is the DeepLabV3 model!  <https://developer.apple.com/machine-learning/models> You can also convert your custom model using coremltools. <https://coremltools.readme.io/docs>

--- 
> ####  In the "Get to know Create ML Components" session around the 14m mark the presenter mentioned that the augmentation applied is only used during training, not validation. Is that really true, given that it was just applied using flatMap() to the combined dataset in the code shown? It is not what I would expect based on reading the code.


|U03J4CASP0R|:
It applies for training and validation data, but only at training time, not when doing predictions.

|U03JRPTG8BS|:
Ah yes, I misunderstood “predictions” as “validation”. Thank you.
Applying augmentations during validation seems not ideal though? Don’t you typically want to test/validate on unadulterated input data?

|U03J4CASP0R|:
In other words, the augmentations are not part of the task definition. They are applied directly to the data.

|U03J4CASP0R|:
That's a good point!

|U03JRPTG8BS|:
In terms of the overall design, I think it might be better if the augmentation transform could be passed to the fitting or update method, so that you can have random augmentations that are different for each epoch, rather than baking a fixed set of augmentations into the training data.

|U03JRPTG8BS|:
I mean that the outputs of the augmentations would be different for each epoch.

|U03J4CASP0R|:
Yes. Please share your feedback through Feedback Assistant.

--- 
> ####  Is there a way create a federated learning/training solution. I'm planning to create on-device training and since the data is private I'd want to update the model while respecting user privacy and have all users benefit from a new model I can redistribute in updates. Is there a way to achieve this? Especially while respecting user data privacy.


|U03HB4VBDGX|:
Hi <@U03HVCXR1T8> thanks for the question.

Apple doesn't offer an out-of-box solution for federated learning at the moment. Differential privacy team at Apple published this article to discuss how to think about this problem: <https://machinelearning.apple.com/research/learning-with-privacy-at-scale>

I would recommend scheduling a 1:1 lab with us so we can discuss your use case and provide specific feedback.

--- 
> ####  When building an Object Detection model, do you have any specific tools or recommendations on how to best annotate objects?  There are a lot of tools out there, but they often feel cumbersome to use in comparison to the ease of CreateML.


|U03HB4V9Q5V|:
Check out <https://developer.apple.com/documentation/createml/building-an-object-detector-data-source> for documentation on how to structure annotated data for object detection. Apple doesn't have a tool we can provide to create the annotations, and I agree it can be a bit of a cumbersome process. Hope that helps!

|U03J20E7UBV|:
That is very helpful, thank you!

|U03JRPTG8BS|:
<@U03J20E7UBV> Take a look at <https://roboflow.com|Roboflow>

|U03JRPTG8BS|:
Though if their public plan doesn’t work for you, then it is quite expensive.

|U03J20E7UBV|:
Thanks, <@U03JRPTG8BS>!  I will take a look!  Definitely not familiar with Roboflow!

|U03K67T11G8|:
<@U03J20E7UBV> <https://labelstud.io/|Label Studio> is another one to check out, it’s open source.

|U03J20E7UBV|:
Thanks, <@U03K67T11G8>!  Also not familiar with that one, either!

|U03JZAYNMMJ|:
<@U03J20E7UBV> We're using CVAT at my research institution. There is a hosted, free version available at <http://cvat.org|cvat.org>, but I'd recommend going with the self-hosted option since it allows you to integrate ML models to assist with the labeling effort: <https://github.com/openvinotoolkit/cvat>

--- 
> ####  Do you have any code snippets showing how to load a stereo audio file into MLMultiArray object?


|U03J52T5J22|:
It depends on the desired buffer layout of PCM data (interleaved or separate, int16 or float32, etc). A good starting point can be:
• <https://developer.apple.com/documentation/soundanalysis/snclassifysoundrequest>
• <https://apple.github.io/turicreate/docs/userguide/sound_classifier/export-coreml.html>

|U03J6AKH19V|:
<@U03J52T5J22> What would be the best way to have a MLMultiArray of shape [2, 44100] being 44100 equivalent to one second of audio? The main objective is to use the MLMultiArray on a CoreML prediction.

|U03J52T5J22|:
Where does the audio data come from? If you already have a buffer with the desired layout, you can use: `-[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error]` or `MLShapedArray(bytesNoCopy:shape:strides:deallocator:)`.

If you need to copy with some data type conversion (e.g. `short` to `float32`) `MLShapedArray(unsafeUninitializedShape:initializingWith:)` would work.

|U03J6AKH19V|:
<@U03J52T5J22> it comes from an AAC audio file as we mentioned in the question.

|U03J52T5J22|:
I see. AAC audio is often decoded to a sequence of audio chunks which is not aligned to one second boundary. So, we would need to do some (tedious) buffer munching. I will look for and/or write up some sample code. Stay tuned!

|U03J6AKH19V|:
yay!

|U03J6AKH19V|:
looking forward to it!

|U03J52T5J22|:
Hi Eddie! Thank you for waiting. The following code loads an AAC file into `MLShapedArray` for every one second and write each back to a new AAC file.

`MLShapedArray` is a Swift-y cousin of `MLMultiArray` and, if you are using Swift, it is preferred over `MLMultiArray`. CoreML accepts either type. `MLMultiArray(_ shapedArray:)` and `MLShapedArray(_ multiArray:)` can convert between them.

Hope it helps.
```
import AVFoundation
import CoreML

let audioFormat = AVAudioFormat(commonFormat: .pcmFormatFloat32, sampleRate: 44100, channels: 2, interleaved: false)!

let sourceAudioFile = try! AVAudioFile(forReading: URL(filePath: "/Users/apple/sample.aac"))
let sourceAudioBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: AVAudioFrameCount(audioFormat.sampleRate))!

let aacSettings = [AVFormatIDKey : kAudioFormatMPEG4AAC,
                 AVSampleRateKey : 44100,
            AVNumberOfChannelsKey: 2
]
let outputAudioFile = try! AVAudioFile(forWriting: URL(filePath: "/Users/apple/output.aac"), settings: aacSettings)

// Loop to read and decode source audio file.
while sourceAudioFile.framePosition &lt; sourceAudioFile.length {
    try! sourceAudioFile.read(into: sourceAudioBuffer)
    let frameLength = Int(sourceAudioBuffer.frameLength)

    // Make MLShapedArray from the audio buffer.
    let leftChannels = MLShapedArray&lt;Float32&gt;(bytesNoCopy: sourceAudioBuffer.floatChannelData![0], shape: [1, frameLength], strides: [frameLength, 1], deallocator: .none)
    let rightChannels = MLShapedArray&lt;Float32&gt;(bytesNoCopy: sourceAudioBuffer.floatChannelData![1], shape: [1, frameLength], strides: [frameLength, 1], deallocator: .none)
    let audioShapedArray = MLShapedArray(concatenating: [leftChannels, rightChannels], alongAxis: 0)

    // Write the MLShapedArray back to a audio buffer.
    let outputAudioBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: sourceAudioBuffer.frameLength)!
    audioShapedArray[0].withUnsafeShapedBufferPointer { ptr, _, _ in
        outputAudioBuffer.floatChannelData![0].initialize(from: ptr.baseAddress!, count: frameLength)
    }
    audioShapedArray[1].withUnsafeShapedBufferPointer { ptr, _, _ in
        outputAudioBuffer.floatChannelData![1].initialize(from: ptr.baseAddress!, count: frameLength)
    }
    outputAudioBuffer.frameLength = sourceAudioBuffer.frameLength

    // And encode and write to an AAC file.
    try! outputAudioFile.write(from: outputAudioBuffer)
}
```


|U03J6AKH19V|:
OMG! Probably our best experience in WWDC, you're a <@U03J52T5J22> rockstar!

|U03HB4VBDGX|:
This is awesome <@U03J52T5J22> :slightly_smiling_face:

--- 
> ####  Can we take compiled and encrypted models from the bundle, and host them in our own cloud? Do you see any issues with it?


|U03HB4VBDGX|:
Hi <@U03JW43N2TV> does your cloud instance understand CoreML format? I am assuming you are referring to compiled and encrypted CoreML models?

|U03JW43N2TV|:
Yes, compiled and encrypted models. I am zipping them, download and then unzip on the device.

|U03JW43N2TV|:
Hosting in S3. It is working locally but when ipa is generated, decryption isn't working. Using the same Team ID both locally and generating ipa. Is it supposed to work?

|U03HB4VBDGX|:
I see what you are saying. Could you share the error logs? It could be sensitive so, please consider using <http://feedbackassistant.apple.com|feedbackassistant.apple.com> for that.

|U03JW43N2TV|:
Sure, will do. Follow up question, does encryption key and/or encryption process involve any app specific info like bundle identifier? Or, as long as the same Team is used, is it supposed to work?

|U03JW43N2TV|:
I am following <https://developer.apple.com/documentation/coreml/generating_a_model_encryption_key?language=objc|Generating a Model Encryption Key> and <https://developer.apple.com/documentation/coreml/encrypting_a_model_in_your_app?language=objc|Encrypting a Model in Your App>.

|U03HB4T0CA3|:
Note: I would take a look at how much space savings 'zipping' is actually making in this case: you may just be wasting computation: encryption in particular produces files that won't compress well.  

|U03JW43N2TV|:
ya, agree. Compiled and encrypted model is a directory. So, zipping is done to download it as a single file rather than to save space.

|U03HB4VBDGX|:
&gt; Follow up question, does encryption key and/or encryption process involve any app specific info like bundle identifier? Or, as long as the same Team is used, is it supposed to work?
Decryption process does involve a bundle-id check but, it should be transparent to your app. If your app (signed with correct team cert) loads the encrypted model, decryption should work as expected.

|U03JW43N2TV|:
<@U03HB4VBDGX> If we have different bundle identifiers for different environments, is there a way to generate encryption key that works for all bundle identifiers? For eg: if debug/dev environ has identifier that ends with `.development` and other envs ends with a different string.

|U03HB4VBDGX|:
Bundle ID is only used to make sure app that fetched the key for the first time is using the fetched key before decryption.

|U03HB4VBDGX|:
If you are not mixing those, you should be fine

|U03JW43N2TV|:
<@U03HB4VBDGX> In that case, since the bundle ids are different for different environments, looks like I need to generate separate keys and host multiple encrypted models. Does wild card entries in bundle identifier field work while generating key and compiling with encryption? for eg: `com.something.something.*` . (Only the last `*` is variable in my case.)

|U03HB4VBDGX|:
&gt; Does wild card entries in bundle identifier field work while generating key and compiling with encryption? for eg: `com.something.something.*` . (Only the last `*` is variable in my case.)
It is not checked at the time of generating the key (in Xcode). It is checked at the time of fetching the key (at model load time before decryption).

|U03JW43N2TV|:
<@U03HB4VBDGX> Is it checked at the time of fetching against the bundle id from the encryption key? If so, is it a char to char comparison? Or, having something like `com.something.something.*` when I generate the key, and `com.something.something.development`  and `com.something.something.Enterprise` with the actual app builds work?

|U03HB4VBDGX|:
&gt; Is it checked at the time of fetching against the bundle id from the encryption key?
Bundle id is looked up from your app on the device (so, in this case  `com.something.something.Enterprise`) and persisted for cross checking on future model loads. `com.something.something.development` is not stored anywhere. So, the example you provided *should* work. If you have the feedback assistant ID, I can take a closer look at the error and get back to with what might be going on.

|U03JW43N2TV|:
Yes, bundle id is looked from the app on the device and is compared against what? I am assuming it is compared against the ID from the encryption key?

|U03JW43N2TV|:
I tried submitting in the feedback assistant with sysdiagnose logs but it is failing. It may be coz the logs are above 400MB. In the console, I see `MLModelAsset: load failed with error Error Domain=com.apple.CoreML Code=8 UserInfo={NSLocalizedDescription=&lt;private&gt;}` from the build. I am trying to generate another build with an added `NSLog` so that I see more details in the console. I will follow up once it is ready. In the meanwhile, before I lose you, I wanted to make sure if I can use wild chars in the bundle id at the time of key generation so that it matches with dev and prod builds' bundle ids.

|U03JW43N2TV|:
<@U03HB4VBDGX>

|U03HB4VBDGX|:
Bundle id is looked up from your app when the key is fetched and persisted. On subsequent model loads, bundle id from your app is looked up to validate against the first bundle id that was persisted at the time of key fetch.
&gt; I am assuming it is compared against the ID from the encryption key?
No, bundle id is not associated with your encryption key.

&gt; I wanted to make sure if I can use wild chars in the bundle id at the time of key generation so that it matches with dev and prod builds' bundle ids.
This should not matter - CoreML only uses bundle ID from your app and if app store allows, it can have wild chars.

|U03HB4VBDGX|:
&gt; I will follow up once it is ready.
Sure

|U03JW43N2TV|:
Ah got it. Bundle id only matter for subsequent loads then. My issue is with first load itself.

|U03HB4VBDGX|:
Exactly. If I see the entire error message, I might know what is differently with your case.

|U03JW43N2TV|:
I see, `Fetching decryption key from server failed: noEntryFound("No records found"). Make sure the encryption key was generated with correct team ID.` . I believe our remote builds use the same Team ID as the one I used locally to generate the key. I am waiting for a confirmation on this. While I wait for it, I wanted to see if there could be any other reason for failure because I see different errors before and after this error.

|U03JW43N2TV|:
Eg:
```
Client "com.apple.CoreMLModelSecurityService" tried to access environment "Production", even though the entitlements specified "Sandbox"
```

|U03JW43N2TV|:
Looks like the Team IDs are different. Thanks a lot for you patience going through my issue.

|U03HB4VBDGX|:
No worries <@U03JW43N2TV>! I am glad we got to the bottom of this!

|U03HB4VBDGX|:
Which app is this, if you don't mind sharing

|U03JW43N2TV|:
I personally don't mind but I may not be allowed to share unfortunately. I wanted to do a DM but looks like it is disabled. Sorry. :neutral_face:

|U03HB4VBDGX|:
No worries. Thanks!

|U03JW43N2TV|:
<@U03HB4VBDGX> We use different team IDs for distribution and enterprise program. Do you have any suggestions on how to make the encryption work for our use case?

|U03HB4VBDGX|:
The only way I can think of is to encrypt the model with two different encryption keys (with different team IDs) and include both encrypted models in the app / make it available for download. App would pick the right model based on the variant.

--- 
> ####  What image-sharpening torch model did you use in the "Optimize your Core ML usage" talk?


|U03JFGMUPCY|:
Hi <@U03K67T11G8>, we got a similar question here <https://developer.apple.com/forums/thread/707607>. Please let me know if the answer there helps.

|U03K67T11G8|:
Thanks <@U03JFGMUPCY>, that answers my question!

--- 
> ####  I'd like to classify larger article-sized bodies of text. One of the ways I'm working on doing this is by doing text classification. Given 5 categories of diary entry (eg family, health, spiritual, work, recreational), would it be preferred to use a single model that labels text with one of the 5? Or should I follow the SentimentClassifier example and use 5 separate models that each classify a string in 3 ways (notFamily, neutralFamily, isFamily)? If the latter, is this a use case for components?


|U03HRM0UK8B|:
Usually what I would tend to try first would be a single classifier model that labels text with one of your classes. That should be efficient and robust, and scale reasonably well with the number of classes. If you train multiple models, you would need to run each of them on each article you want to classify. However, the questions being asked are subtly different in the two different cases. With a single model, you are asking which category or categories best match a given document. When you use separate models, you are asking whether a given document relates to a given category or not. The question you want to ask informs everything from your annotation to the type of model you use to the way you present your results. Ultimately you will have to decide what analysis is best suited to your particular application.

|U03J4DR9GDS|:
Thanks for your great response. This definitely gives me a good direction

--- 
> ####  are there any limitations on number of iosurface-backed in a model?


|U03J52T5J22|:
Hi Andrew, no, CoreML doesn’t put the limitations.

--- 
> ####  Can the live text selected automatically (in an designated area/ simply select all) without user highlight? <https://developer.apple.com/videos/play/wwdc2022/10026/|https://developer.apple.com/videos/play/wwdc2022/10026/>


|U03HB4KUYH5|:
Hi. Sorry, select all isn't an option currently.

|U03HVCK66P8|:
Oic. So the user must select the text manually first, right?

|U03J4B065TK|:
Hi, yes, the only thing you can do is reset the selection if one exists.

|U03HVCK66P8|:
ok

|U03HVCK66P8|:
Thanks, <@U03HB4KUYH5> <@U03J4B065TK>

|U03JE2RJ2DA|:
Can we use Core ML to recognize objects such as dog in a live camera feed and then use Live Text to cut the image out of it's background?

|U03HB4KUYH5|:
The subject lifting feature does not have an API in iOS 16. We do have a Shortcuts workflow if that helps.

--- 
> ####  Is it appropriate to try to use word embeddings to match long-form text up to single worded categories? For example, figuring out the distance between `"exercise"` and `"Today I decided to ride my bike to the store. I needed to get a workout in."` I'd like to match sentences and paragraphs up to to tags.


|U03HRM0UK8B|:
The most robust approach to this sort of categorization would be to pick a set of categories in advance, collect training data, and train a classifier to classify sentences according to these categories. If you need to handle words outside the originally chosen set of categories, you could then use word embeddings to find an existing category similar to the entered word. If you aren't able to train a model, things get a bit trickier. You can use tools such as part-of-speech tagging to identify relevant words in a sentence, e.g. nouns in the example you give, and determine how similar those are to the word you are trying to match. You would then need to figure out some way to take scores for individual words and form a score for an entire sentence. Overall I think you would get better results by training a classifier, although it would require more work in advance for training.

--- 
> ####  is it possible to have flexible shape (enumaratedly) inputs (and therefore outputs) to be compatible with outputBackings and IOSurface-backed MultiArray?


|U03JFGMUPCY|:
Yes this will work as long as the output backing buffer is the correct size corresponding to the size of the input. One note is that being able to avoid data copies during inference for models with flexible shapes will vary depending on circumstances. You can use the Core ML Instrument and look in the Data lane to see if data copies are occurring.

--- 
> ####  Does CoreML have everything necessary to perform keyword extraction? How would you go about extracting keywords from articles of text?


|U03HRM0UK8B|:
Natural Language has a number of tools that can be useful in keyword extraction: tokenization, part-of-speech tagging, named entity recognition, gazetteers that could be used to identify stop words, and so on. We don't provide an implementation of a specific keyword or keyphrase extraction algorithm, but there are algorithms that are sometimes used that take into account features such as frequency, co-occurrence statistics, TF-IDF, etc. that can be calculated from text that has been tokenized and processed using some of these tools. Doing this fully unsupervised is a difficult task, though. You might be able to do better if you have some advance knowledge of the vocabulary that is relevant to the sort of text you will be working with.

--- 
> ####  can optical flow be used in situations where more than one object is moving at the same time?


|U03J4AXTF1P|:
Optical flow output is per pixel

|U03J98R7N5A|:
Yes, motion information will be returned for all parts of the image, and therefore for all moving objects in the scene.

|U03JRPP4S3A|:
Thank You

--- 
> ####  Is there a document from that talks about how ML development works with Apple products and what is needed to get started?


|U03HRMWNP4J|:
A good starting point is to check out an overview of Apple’s ML focused development tools here: <https://developer.apple.com/machine-learning/>

There are also some past WWDC videos which show you an example journey from idea to implementation such as this talk: <https://developer.apple.com/videos/play/wwdc2019/228/|Creating Great Apps Using Core ML and ARKit.>

I highly recommend checking out this session on Friday: <https://developer.apple.com/videos/play/wwdc2022/10017/|Explore the machine learning development experience>

--- 
> ####  how to handle situations where older ANE versions might not support certain layers and it will result in cpuAndNeuralEngine config being extremely slower on some devices?


|U03JFGMUPCY|:
`MLComputeUnits.all` is the default option and we recommend using that in most of the cases. CoreML tries to optimize for latency while utilizing all the available compute units. `MLComputeUnits.cpuAndNeuralEngine` is helpful when your app is using GPU for pre or post processing and would like CoreML to not dispatch the model on GPU. Other than that `MLComputeUnits.cpuAndNeuralEngine` behaves very similar to `MLComputeUnits.all`. If you have a model that is running much slower on certain devices, we recommend filing some feedback at <http://feedbackassistant.apple.com> with the model and specific device(s) included.

--- 
> ####  What is the difference between MLTrainingSessionParameters and MLObjectDetector.ModelParameters?


|U03HRMABBDZ|:
`MLTrainingSessionParameters` for async training API, e.g., `.train()`, to specify training related parameters, such as checkpointing saving location, whereas `MLObjectDetector.ModelParameters` is for both sync and asyn ctraining to specify model-specific parameters

--- 
> ####  We can use Shipment Tracking Number, URL as a source for live text. Can we define our own source for the live text ? Let’s say I wanna add detection of new couriers other than FedEx or UPS. 


|U03HB4KUYH5|:
For the DataScannerViewController? Sorry, right now just the 1 option for shipment tracking numbers and it's whatever carrier we're able to detect

|U03JLUH1V8F|:
Thanks for the answer. It could be awesome if there was a protocol that we can conform to so that we could extend the detected source.

|U03HB4KUYH5|:
How would you imagine that protocol working?

|U03JLUH1V8F|:
I assume that you're checking some kind of Regex for the tracking numbers. I also believe that maybe they have other validations as well like international tracking numbers have some check code. I wish there could be a protocol or a delegate method so that we could define our new methods or the extend the existing ones. I know I just can just scan for text but it would be better to extend the existing ones. 

|U03HB4KUYH5|:
Gotcha, I think I understand. Maybe something that gives you some text and you can tell us the range you’re interested in.

|U03JLUH1V8F|:
Exactly. Currently live text can find the FedEx tracking number because it's 12 digits. It knows that 12 digits is a tracking number and it draws a box around it. So maybe my courier Acme Corp has a tracking number of ACME-<tel:12526737|12526737>. It can't detect this as a tracking number because live text supports limited number of couriers. Only way to get this with camera is, just using a default source and selecting it manually. I just wish we could extend the default ones or give visionkit a pattern to look for.

|U03J1TN6WBD|:
^ This may be useful for detecting car license plates aswell imo (different patterns depending on countries though)

--- 
> ####  With VNDocumentCameraViewController, is it possible to limit it to just one scan, so that the user doesn't have to press "Save" at the end?


|U03HB4KUYH5|:
No, sorry. Would appreciate a Feedback for an enhancement request, though

|U03HZ2VBE21|:
Done: FB10140507

--- 
> ####  I am looking to detect or classify a jersey number from a sporting event such as hockey in a video,  I have tried VNRecongnizeTextRequest but do not get good results is there a better way to do such a task? Would I be better off creating my own model for this?


|U03JFF1S5U0|:
Are those numbers obscured or deformed?

|U03JRPP4S3A|:
Potentially yes to both

|U03JFF1S5U0|:
You could train a custom classifier but that requires loads of images to get good results from that

|U03JFF1S5U0|:
The results should have improved a bit using Revision3 of the VNRecognizeTextRequest. Have you tried it?

|U03JRPP4S3A|:
I have not yet, I certainly intend on giving it a try, I just wondered if there was a better approach

|U03JFF1S5U0|:
When text gets deformed on fabric or obscured it gets very difficult to read.

|U03JRPP4S3A|:
Is there any way that VNRecognizeTextRequest can be restrained to only numbers?

--- 
> ####  Clarifying question on what's new in vision. I think v3 brings improved face recognition &amp; barcode recognition &amp; previews for those. Optical flow is entirely new, and the UI for text recognition through video is entirely new. Do I have this right? Anything else new in Vision?


|U03J98R7N5A|:
Optical flow is not entirely new, there was already a prior revision 1 for optical flow. You are correct about barcode, but face recognition is not offered by Vision. You are also correct that the UI for text recognition is new. Other things new in Vision are a new text recognition revision, and the new functionality in Xcode for Quick Look Preview support. We also deprecated older face detection and face landmarks revisions.

--- 
> ####  Up until iOS15, the rectangle tracking VNTrackRectangleRequest returned precise corners of tracked rectangle. Since iOS15, it seems to only return the bounding box. This is present even in the original detection/tracking demos.  What is the suggested way to get tracked rectangles (and also support the original vision framework to support iOS11+)?


|U03JFF1S5U0|:
Have you tried the iOS16 beta?

|U03HZ3RCQLV|:
Not yet, but definitely will try as I get the chance :pray:

It seemed like an intentional change in iOS15, as I remember the documentation was previously describing the real corners of tracked rectangle being available, while now it describes the corners as being bounding box only (as for any other `VNDetectedObjectObservation`).

|U03HZ3RCQLV|:
What would be the suggested workaround for iOS15 - is there any other vision API that could be used for rectangle corners tracking? (ideally similar to what the native scanner in Notes nad Files offers)

--- 
> ####  What's the best way to create a "silhouette" video as opposed to a silhouette photo? Would Optical flow be best for this or sampling every frame for a silhoette or... Thank you.


|U03HK3N00TG|:
It depends! The two key considerations are:

• how expensive is it to generate a silhouette a priori for every frame? If that’s cheap enough, it might be simpler and better to do that;
• on the other hand, optical flow can help in frame-to-frame stability.
It’s really going to depend on surrounding context and performance requirements (both latency and accuracy).

--- 
> ####  What is your recommendation for using DataScannerViewController to detect money/currency values? DataScannerViewController.TextContentType does not appear to support money, currencies, or generic numbers (see FB10139138). The iOS Camera app supports money/currency detection in iOS 16. What is the best practice for me to implement a similar feature in my app? Should I recognize all text and then parse each recognized text item myself to determine if the string value contains number or currency amount?


|U03HB4KUYH5|:
Ah, good enhancement request. Currently we're not supporting currency.

|U03HB4KUYH5|:
you might be able to detect the presence of currency with UIDataDetectors, but you won't be able to highlight them.

|U03HB4KUYH5|:
another option is to use `capturePhoto()` to take as till then use the Live Text APIs

|U03HB4KUYH5|:
That'll highlight all the data detector elements, not just money.

|U03DJTBMHFF|:
Maybe some business logic on top of Vision text recognition to dial in on numbers only, specific (relative) text size or even position of the text in the rectangle of the currency?

|U03J2AD912N|:
Ah, I see. So I assume that I could grab all text, but wouldn’t necessarily be able to easily find the exact position of the numbers/currency in the view to provide an accurate highlight rectangle of just that portion.

|U03J2AD912N|:
Although I will give Eric’s suggestion a shot to see if that works.

|U03J2AD912N|:
I also just filed FB10140834
Determine bounds of substring of text from DataScannerViewController RecognizedItem

--- 
> ####  What is the difference between optical flow and a VNTrajectoryRequest? Would tracking a trajectory of an object benefit from a work flow that used both?


|U03JFF1S5U0|:
The trajectory request is especially developed to track objects on a trajectory meaning not any kind of zig zag path. Optical flow will detect any motion without the constraint of a trajectory

|U03JFF1S5U0|:
So if you want to track a ball been thrown, you will get better results with the trajectory request.

|U03JFF1S5U0|:
If you want to see if something moved in for instance security camera footage then you use optical flow.

|U03JRPP4S3A|:
understood thank you <@U03JFF1S5U0>

--- 
> ####  v3 extends VNRecognizeTextRequest with automaticallyDetectsLanguage - If I turn this on, how do I discover what language it decided to use?


|U03J98R7N5A|:
Vision will not tell you which languages have been detected. The intent of this is to allow the client to give a "hint" to the algorithm. If you already know the language up-front, it's best to specify that language explicitly, which allows the framework to target that language for better accuracy. If you do not, it's better to set automaticallyDetectsLanguage to true, which essentially is communicating to the framework "I don't know which language" and the framework will do its best to decode any language.

|U03HRMWNP4J|:
You can use <https://developer.apple.com/documentation/naturallanguage/nllanguagerecognizer|NLLanguageRecognizer> to detect the dominate language after the text has been extracted by vision.

|U03HRMWNP4J|:
Usually a sentence is sufficient to identify language. You can pass in as much as you like, but the algorithm limits the amount of text it will consider. Less than maybe 5-10 words is challenging.

|U03HRM0UK8B|:
If you have some prior information as to what the language might be, you can also pass hints and/or constraints to NLLanguageRecognizer.

--- 
> ####  How different are VNRecognizedTextObservations (returned by VNRecognizeTextRequest) to the RecognizedItem array returned by DataScannerViewController? Do they have the same information in them? Also, is the DataScannerViewController using the same VNRecognizeTextRequest (with revision3) in the background to process the results?


|U03HB4KUYH5|:
RecognizedItem contains a lot of the same information. transcript, corners (RecognizedItem's are in view coordinates, however)... and RecognizedItem exposes the related Vision observation. RecognizedItem however learns over time so the longer we see a text group, the more accurate the transcript will be. The Vision observation that is exposed, it is really just based on the last frame processed.

|U03HB4KUYH5|:
I cannot state which revision it uses, if any (sorry to be vague). But DataScanner supports the same languages as VNRecognizeTextRequest.

|U03HZ2VBE21|:
Thank you!

--- 
> ####  Can VNRecongnizeTextRequest be used to perform text recognition on images with handwritten content or should it only be used for typed text (or very close to typed)?


|U03JFF1S5U0|:
Yes it can to some degree. It won't read my bad handwriting for sure but others will work. Handwriting is of course so varied that it really depends on the person who writes it.

|U03JFF1S5U0|:
Closely typed text is a bit vague. Are you saying the characters are touching?

|U03HZ81AHCN|:
Sorry, my bad. I intended to say something which is written in a way that is very similar to typed text

|U03JQRD5KQS|:
*Try it*: Open the image in Preview on the Mac, select all the text and paste it into Text Editor

|U03HZ81AHCN|:
<@U03JQRD5KQS> Thanks for the suggestion! Indeed it works quite well, but isn’t Preview using Live Text for the recognition?

|U03JQRD5KQS|:
I'm under the impression that Live Text is mostly a marketing name: that it is powered by the Vision framework.

|U03JQRD5KQS|:
Better: download Simple Comic from the Apple Mac App store: it is free, and open source. create a .cbz file by compressing your image in Finder, then give rename that .zip to a .cbz. Open it in Simple Comic. If it works, then you'll know Vision Framework is good enough.

|U03HZ81AHCN|:
Yeah I had the same impression, that Live Text is a higher level of abstraction over the underlying Vision API

|U03HZ81AHCN|:
Thanks for the suggestion of Simple Comic, I’ll definitely try to use it to check how Vision behaves!

|U03JQRD5KQS|:
<https://github.com/MaddTheSane/Simple-Comic/blob/arc/Classes/Session/OCRVision/OCRVision.m>

|U03JFF1S5U0|:
Live text is using Vision for its recognition work

|U03HZ81AHCN|:
Thanks a lot <@U03JFF1S5U0> and <@U03JQRD5KQS>! Just one last question: I saw on another thread that there is a new revision of VNRecognizeTextRequest (v3), but I can’t find it in the documentation: how can I enable it and can I “force” Vision to use a “minimum revision” (for example, 3 and later)?

|U03JQRD5KQS|:
See the header files inside the Xcode 14 beta. - Don't expect it to work before you have the new operating systems

|U03JQRD5KQS|:
@*<https://app.slack.com/team/U03HZ81AHCN|Alessandro>* - the source file I posted shows how you set the `revision` the request should use. You can also use responsdsToSelector() but I wouldn't trust it

|U03JQRD5KQS|:
I handle code from Beta SDKs like this:
```
#if defined(MAC_OS_VERSION_13_0) &amp;&amp; MAC_OS_X_VERSION_MAX_ALLOWED &gt;= MAC_OS_VERSION_13_0
#warn "if you can see this, it's time to remove the #if."
			if (@available(macOS 13.0, *))
			{
				revision = VNRecognizeTextRequestRevision3;
			} else
#endif
```

|U03JQRD5KQS|:
…

```
#if defined(MAC_OS_VERSION_13_0) &amp;&amp; MAC_OS_X_VERSION_MAX_ALLOWED &gt;= MAC_OS_VERSION_13_0
#warn "if you can see this, it's time to remove the #if."
			if (@available(macOS 13.0, *))
			{
				textRequest.automaticallyDetectsLanguage = YES;
			}
#endif
```

|U03HZ81AHCN|:
I don’t like `respondsToSelector()`either… but is `VNRecognizeTextRequestRevision3` already public? I couldn’t find it in the documentation

|U03JQRD5KQS|:
<http://Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Vision.framework/Versions/A/Headers/VNRecognizeTextRequest.h|Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Vision.framework/Versions/A/Headers/VNRecognizeTextRequest.h>

|U03JQRD5KQS|:
Also mentioned in <https://developer.apple.com/videos/play/wwdc2022/10024/>

|U03HZ81AHCN|:
So then it probably hasn’t been added to the online documentation yet but is already available for use

|U03HZ81AHCN|:
Thanks a lot <@U03JQRD5KQS>!

|U03JQRD5KQS|:
Happy to help

--- 
> ####  Last year you introduced the VNGeneratePersonSegmentationRequest. I know you can't comment on future plans, but it would be amazing if the new pet / object segmentation of iOS 16 was available to developers


|U03JFF1S5U0|:
It is always good to file feedback and explain what you are looking for.

--- 
> ####  Live Text seems to be added to UIImageView via `.addInteraction(&lt;ImageAnalysisInteraction)`. Is there a way to add this interaction to SwiftUI's `Image`?


|U03HB4KUYH5|:
I don’t believe so. You can probably wrap a UIImageView in a ViewRepresentable - but of course it wouldn’t be a SwiftUI image anymore. I think we might have sample code that does something similar in the State of the Union donut app

|U03HB4KUYH5|:
But yeah, we definitely need SwiftUI support for the new VisionKit APIs :slightly_smiling_face: feedbacks may help

|U03JRR42L48|:
ahh. Thanks! Yes, I can file a feedback

|U03HB4T0CA3|:
at 1:06:32 in the SOTU Video, it shows how to add the Interaction to a UIView.

<https://developer.apple.com/wwdc22/102?time=3992>

|U03JRR42L48|:
nice, thanks <@U03HB4T0CA3>! Bundling it all in a UIView and then wrapping that seems cleaner :+1:

--- 
> ####  Im part of a team that is building an app that is wishing to identify and recognise faces in a collection of photos. At the moment Ive had success with Photos/Vision framework to find faces in photos and isolate them, but we're currently then sending those faces to AWS Amazon Rekognition service to help compare the face to a set of others and associate them to an existing face, or create a new face model.  If I wanted to move this type of modelling onto the device itself (rather going through a network request to a 3rd party service), could you possibly guide me where to start? Im assuming I could do the same thing locally on device using Apple frameworks?


|U03J98R7N5A|:
We do not offer on-device face recognition solutions. Generally speaking you would to either find (or train, if you have the data and the know-how) a face recognition model, which could then be run on-device through CoreML once converted into that format. Often such models return some descriptor, which can be compared to other similar descriptors to provide a distance. How best to measure that distance is often tied in to how the face recognition model was trained.

|U03K0BHRMNC|:
ah ok. Thanks for the detail. :slightly_smiling_face: Seems like it would be a bit of work to bring it on device (as no one on our team currently has the "know how" to train models), but its good to know that that is the suggested direction to go in. :slightly_smiling_face: Or continue using a service like AWS's which have really made it quite simple (at the expense of network request).
But thank you for the response!

|U03J98R7N5A|:
You may file a Feedback Assistant request if you'd like Apple to offer face recognition in the future.

|U03K0BHRMNC|:
Haha that would be a dream feature indeed. So I shall contribute a feedback request! :blush: thanks!

--- 
> ####  We currently use a CoreML model with a C+ framework to handle initialization parameters in our processing queue (how long to hold an object, time an object should be in frame etc) and then run the ML model on the image captured with those parameters. Is Vision a better alternative than running our own initializers like that? Can we specify with Vision the retention time of images for processing images asyncronously? What is best practice there? Thank you!


|U03JFF1S5U0|:
Not sure about C+ in terms of its retention. But as long as you hold a VNImageRequestHandler, the image will be held.

|U03HZ5ALQ5T|:
Awesome! Thank you Frank

--- 
> ####  My app iterates over the user's entire photo library using VNDetectHumanRectanglesRequest and VNRecognizeAnimalsRequest, in order to find all the photos containing humans and pets. For performance reasons, I'm only loading a small version of the photo. I've noticed that this (obviously) affects the results. Is there a recommended image size when using these requests? I'd also appreciate any other ideas on how to optimize the performance for such a task.


|U03JFF1S5U0|:
There is no hard and fast size that works for everything. The reason is that is limited by the ratio of the dog or human in respect to the image to be detected. So it depends on your use case if you for instance want to find a small dog in the background in a large panorama.

--- 
> ####  Is it possible to have player (end-user) enabled Machine Learning? For example in my game Follow the White Rabbit it would be helpful to adjust the model. For example supporting different hand sizes, skin tones, as well as support hands that had more/less than the standard number of fingers.


|U03HB4VBDGX|:
Hi <@U03JE2RJ2DA>. Yes, you can adapt a model on-device using any one of our ML frameworks, including Core ML, Create ML Components, MPSGraph, and BNNS. The approach you take depends on the data and problem you are working with. To detect hand poses, I recommend checking out the sample code project <https://developer.apple.com/documentation/vision/detecting_hand_poses_with_vision|Detecting Hand Poses with Vision>. If you foresee training on a small dataset, then it might be worth looking into using the KNN algorithm available in CoreML, check out the sample code project <https://developer.apple.com/documentation/coreml/model_personalization/personalizing_a_model_with_on-device_updates|Personalizing a Model with On-Device Updates> to learn more. Finally, it is worth browsing through the documentation for the newly release API, <https://developer.apple.com/documentation/createmlcomponents/|Create ML Components>.

|U03J9GM2ESE|:
sample code for human action repetition counting? 

--- 
> ####  sample code for human action repetition counting available?


|U03HRMWNP4J|:
You can find the sample code here: <https://developer.apple.com/documentation/createmlcomponents/counting_human_body_action_repetitions_in_a_live_video_feed|https://developer.apple.com/documentation/createmlcomponents/counting_human_body_action_repetitions_in_a_live_video_feed>

|U03J9GM2ESE|:
I tried the sample code on 6th gen. iPad Mini doing 20 jumper jacks at VARYING paces. I found delays and missing counts. The first few jumper jacks were always not being counted. I’m guessing the hard coded stride 5 and length 90 used for sliding window transformer may be the culprit. To me there isn’t a correct set of numbers to use because I have no control on how fast or slow my users will do his or her jumper jacks. Please advise. 

|U03HRNBHZEX|:
Hello <@U03J9GM2ESE> , a few things you may further check:
• frame rate, the sample app should print out the frame rate as debug information in the Xcode console. Please check if it is roughly 30fps. If not, try to improve the environment lighting, charge the device, etc. and see if it improves.
• body pose, please check if a single person’s full body pose is in the middle of the screen, and while the person moves, check if the poses are accurate (e.g., no missing joints or joints jumping everywhere, no visible delays of pose tracking, etc.) 
• ignored joints in `JointsSelector` . The initial setting here has 5 joints ignored (for demonstration of this transformer purpose). You may remove them if you are interested in the full body and all joints. 
• `stride`  determines how often (in terms of frame count) the counter is refreshed, and it can be set to other numbers. The `length` 90 however should not be changed. This is fixed for the model. 
• `Downsampler` transformer has a factor of 1, which works best for actions close to ~1s per repetition. It can tolerate the varying speed to some extend. If your targeted action is typically much slower, you may set the factor to 2, or other numbers, this may increase the counter delay too. Unfortunately, you have to manually set it in the sample app for now.  
• You are also free to change some of the other logics in the sample app, such as how `uiCount`  is rounded and reset, etc. 

|U03J9GM2ESE|:
Correct me if I’m wrong. 
1. Virtual HIIT fitness coach is not a good app idea for today. Action classifier can’t classify actions fast and accurate enough on mobile devices today?
2. The model was trained using 30 fps and a prediction windows size of 90 frames under the assumption that each human body action lasts about 3 seconds?


|U03HRNBHZEX|:
Hi <@U03J9GM2ESE> , see my comments below:
1. Action classifier is a model template that needs to be trained. So it is good with fitness actions that it was trained with, such as jumping jacks, squats, and some HIIT actions. Depending on your specific needs, we may further talk about how fast the actions could be and how accurate etc. topics. Some resources are also here:
• How to train an action classifier with your custom action videos: <https://developer.apple.com/documentation/createml/creating-an-action-classifier-model>
• WWDC20 session for action classifier: <https://developer.apple.com/videos/play/wwdc2020/10043/>
• iOS sample app for action classifier (can classify jumping jacks, etc.): <https://developer.apple.com/documentation/createml/detecting_human_actions_in_a_live_video_feed>

|U03HRNBHZEX|:
2. For your 2nd bullet, this model is a separate model for counting actions (not action classifier back to WWDC20). It is class-agnostic, exposed via our API and does not need to be trained. It was trained with 30fps videos, and window size is 90 frames. But this is a completely different model, the window size 90 isn’t the same concept with action classifier’s window size. Within these 90 frames, multiple completed actions are OK (e.g., best with 2~4 action repetitions captured within the window). If you have videos or camera feed other than 30fps, you could choose to downsample, using `Downsampler`  transformer. If your targeted actions are 30fps, but quite slower, such as push-ups, you could choose to do downsampling too.

--- 
> ####  Is it possible to train the model generated by MLRecommender on device when new data is available?


|U03HRMABBDZ|:
MLRecommender does not support on-device training/updating. However, I suggest you check our WWDC21 session below to build personalized recommendation-like experience into your app:
<https://developer.apple.com/videos/play/wwdc2021/10037/>

|U03JM1PJE9G|:
thanks

--- 
> ####  Great presentation! Thank you! The MetalFX team has presented a very nice (classical) method for video upscaling. What is the potential of using MSP to achieve machine learning upscaling?


|U03JFGKK1C0|:
MPSGraph supports most common neural-network machine learning layers and operations so you should be able to create an upscaling network from the basic components, but MPSGraph doesn't have prebuilt graphs or networks so you would need to investigate and research the network architecture yourself, train it (using MPSGraph or other training frameworks) and deploy on MPSGraph.
One benefit of using MPSGraph is that you can pretty easily incorporate other Metal kernels (for example MPS image processing kernels or your own kernels) and encode them to the same Metal CommandQueue (or MPSCommandBuffer) to achieve low-latency, often zero-copy execution between the pre/post-processing kernels and the MPSGraph segment(s).

|U03K19A2324|:
Thank you Teemu for the extended answer. Pretty impressive job and wonderful integration with the rest of the framework! Congratulations guys! :)

|U03K19A2324|:
<@U03JFGKK1C0>
(sorry I didn't include the ref in my previous message) :slightly_smiling_face:

--- 
> ####  I’ve tried to run a resnet50 on PyTorch MPS backend, while running Mac Pro with 6900XT, and achieved 23% utilization, while 3090 was running 10 times as fast on the same code. Do you have ideas on why is this happening, and how to further optimize things on Radeon GPU’s?


|U03HY66772A|:
P.S. I was running training, so maybe there was an issue with backprop, and GPU was stalling?

|U03HJ4J1BMG|:
Our current Proto release is focused on functionality and we have not tuned the performance yet. Do look out for performance improvements in the PyTorch nightly builds in the upcoming months.

For this particular case, we would like to know:
1. What’s the current PyTorch nightly you are using? Do update to latest and see if it still is giving bad utilization.
2. Can you share the network code?
3. Are there any operations falling back to the cpu? That hurts performance.
4. What’s the OS is it 12.3/12.4 or Ventura?
Do file an issue on PyTorch on GitHub and to us through FeedbackAssistant.
&lt;<https://github.com/pytorch/pytorch/issues>&gt;

|U03HY66772A|:
1. 1.13.0.dev20220609
2. <https://github.com/tcapelle/apple_m1_pro_python/tree/main/pytorch>
3. I’ve seen no warnings while running the code, but I may have to enable some flags (if you can suggest one)
4. Ventura

|U03HJ4J1BMG|:
Your perf concern is noted and the feedback is appreciated. Do file the issue on the Pytorch Github page and tag it with "module:mps" and also send it to Apple through FeedbackAssistant. Thank you for sharing this info!

--- 
> ####  Is it possible to convert a PyTorch Text-Image  model such a vqgan , to CoreML?


|U03HK4YQZ0W|:
You can try using `coremltools` - <https://coremltools.readme.io/docs/pytorch-conversion>

|U03JTDSCS86|:
thanks <@U03HK4YQZ0W>, I used this for  Pix2Pix, but does coreml tools support text-&gt;image conversion also?

|U03HK4YQZ0W|:
I was trying to find something more specific for you, but couldn’t. Personally I haven’t tried VQGAN, but it seems like CLIP model can be converted. Here’s an issue that has been resolved regarding CLIP: <https://github.com/apple/coremltools/issues/1418>

--- 
> ####  GPU acceleration and federated learning are two very appealing approaches for large scale training (or even training over the edge using multiple mobile devices). Is there some special provision in the MPSGraphs framework to enable/enhance such functionality?


|U03JFGKK1C0|:
MPSGraph should run just fine with iOS and iPadOS. There are no special pre-built functions that achieve techniques like PFL, but using for example the random-number generators provided by MPSGraph, one should be able to generate these operations from basic building-blocks. Then as long as you can aggregate the gradients or other weight-updates across the network (something outside the scope of MPSGraph) you should be able to do this. But again quite a bit of manual work is needed

|U03K19A2324|:
Thank you again Teemu for the a quite detailed reply! Exactly, it requires some manual work indeed to make it work, and that's why I was wondering if there was some interfacing functionality enabling a more efficient merging between these two important techniques was developed. It's nice to know that the technology is readily available and fully operational for mobile devices as well! :slightly_smiling_face:

|U03K19A2324|:
<@U03JFGKK1C0>
(sorry I didn't include the ref in my previous message) :slightly_smiling_face:

--- 
> ####  In "Accelerate machine learning with Metal" Drhuva referenced a new sample code for NeRFs at 14:08. But I can't find it anywhere:( P.S. Yaaay, NeRFs!:)


|U03HJ4J1BMG|:
Hi, here is the link:
&lt;<https://developer.apple.com/documentation/metal/metal_sample_code_library/customizing_a_tensorflow_operation?language=objc>&gt;

|U03HY66772A|:
Thanks a lot! I’ll sure will test it out and share the results:)

--- 
> ####  While using MPS backend in PyTorch, I've found out that there is no way to select a GPU. This feature would be really beneficial while running Mac Pro with multiple GPU's.


|U03J605V2BF|:
We currently don’t have multi-GPU support.

--- 
> ####  Great talk Geppy, and very well explained. I can see that the code of the slides is available, but what about the demo app? could we have it as other sample apps, just to see how are all the pieces glued together? Thanks!!!


|U03HK3KNMDL|:
The demo app is not available at the moment, but I am glad that you like it.

--- 
> ####  Great session on image colorization @Geppy P (Apple) . Do you have any examples of user-customizable hand tracking? Think magic spells.


|U03HRMWNP4J|:
Interestingly, Geppy is a super hero as well. You can watch him demonstrate his powers with hand pose and action classification at the end of this session from last year: <https://developer.apple.com/videos/play/wwdc2021/10039/>

--- 
> ####  Does coremltools support converison of PYTorch Text- Image models like CLIP?VQGAN?


|U03J4CNMT6D|:
Both these models (CLIP and VQGAN) are based on CNNs and transformer architectures, both of which should be supported.
In fact here (<https://github.com/apple/coremltools/issues/1418>) is a resolved issue of a CLIP model conversion.
Note that, depending on the details,  you may have to perform the pre-processing of the text input transformation to a tensor representation outside the pytorch model given to the coremltools convert API. The conversion operates on pytorch models with tensor in tensor out interface.

|U03JTDSCS86|:
<@U03J4CNMT6D> thanks for sharing this!

I have no idea how to do this:
“perform the pre-processing of the text input transformation to a tensor representation outside the pytorch model”

Any reference you could share on how to do that?

|U03J4CNMT6D|:
You might not need it, depends on the exact pytorch model.
I’d say just give the converter a try, and please take a look at some of the examples on the <http://coremltools.readme.io|doc> page and if you run into issues, post on the Github repo.

|U03JZNY81L0|:
Pre-processing of the text usually involves looking up a vector for a given word. The python code for CLIP is here <https://github.com/openai/CLIP/blob/main/clip/simple_tokenizer.py> (btw hi thanks for fixing my issue #1418, really appreciate it)

--- 
> ####  Hello! You mention searching for models in various "specialized" websites and such... do you have favorite places you've gone to find models? Thank you.


|U03HK3KNMDL|:
There are different places that I use. Github is one of them, but I also use <https://developer.apple.com/machine-learning/models/>

|U03HRMWNP4J|:
<https://paperswithcode.com> is also a fun place to browse

|U03HRMWNP4J|:
<https://huggingface.co/apple>

|U03HRMWNP4J|:
Others feel free to share places you like

|U03K19A2324|:
Another nice place with trained models:
<https://resources.wolframcloud.com/NeuralNetRepository/>

|U03HY66772A|:
One of my favourite places:
<https://google.github.io/mediapipe/>
They are a bit of a hussle to convert to CoreML, but they try a lot of cutting edge stuff early on.

|U03K19A2324|:
There are some marketplaces too, like this one:
<https://www.modzy.com/marketplace/>

|U03K19A2324|:
Two other cool places with pre-trained models:

|U03K19A2324|:
<https://github.com/BVLC/caffe/wiki/Model-Zoo>

|U03K19A2324|:
<https://github.com/aiworld/pretrained_net_directory>

|U03K19A2324|:
(first is also mentioned in the second one)

|U03JPBUSHLZ|:
Thank you so much! I’ll have so much fun exploring these :slightly_smiling_face:

|U03K19A2324|:
You're welcome <@U03JPBUSHLZ>! :slightly_smiling_face:

--- 
> ####  You mentioned re-training a few candidate replacement models before model integration. What's your process for deciding how many to try?


|U03HK3KNMDL|:
I tried architectures from other two scientific publications too. But then I decided to “re-work” a bit the architecture of the model I used in the session and decided to go with that.

|U03HK3KNMDL|:
The process can be different from model to model.

|U03JTGZ04HX|:
That makes sense, thank you!!

|U03JTGZ04HX|:
Amazing session!!!

--- 
> ####  Will the source code for this project be available? It would be helpful to be able to dig in and change some things up to really understand the flow.


|U03HRMWNP4J|:
The code is not available at this time. Your interest and requested is appreciated and noted :slightly_smiling_face:

--- 
> ####  Is it possible to dispatch a CoreML evaluation as part of a display or compute shader pipeline.   Or do I need to wait for the cpu to be informed the frame has been rendered before dispatching from the cpu.


|U03HB4VBDGX|:
Hi <@U03HMDSQ9JB> could you clarify this part?

&gt;&gt; Is it possible to dispatch a CoreML evaluation as part of a display or compute shader pipeline.


|U03HB4VBDGX|:
Are you looking to run CoreML evaluation from a compute shader pipeline?

|U03HMDSQ9JB|:
I would like to be able to have a coreML model run an inference evaluation as soon as a compute or even display render pass finishes rather than need to wait for the cpu to be informed that it has finshed.  Best of all would be if it could run on the ANE so that the GPU is free to work on the next frame.

|U03HB4VBDGX|:
Thanks for the clarification.

If the output of GPU is in a IOSurface (in Float16 format), you can feed that to CoreML and let ANE work on it directly without any copies but, CPU does get triggered today for synchronizing these two computations. Would you be able to file a feature request on <http://feedbackassistant.apple.com|feedbackassistant.apple.com> with a little more details about your use case and may be some sample code on how you want to accomplish this? That would really help us push the API in the right direction.

|U03HB4VBDGX|:
<@U03J52T5J22> <@U03JFGMUPCY> do you want to add anything specific?

|U03J52T5J22|:
Nothing much. CoreML doesn’t support `MTLSharedEvent`, if that’s what’s implied here.

--- 
> ####  Hi, I'm excited to see more information about optimizing recent models for CoreML including the `ane_transformers` repo. If I wanted to optimize eg CLIP for ANE, should I use code from that repo, or just try to take recommendations from the case study?


|U03J98R7N5A|:
yes I think using the code from the repo at the end of the article is the best way to get started, and definitely follow along the recommendations of the article as well. Sounds like you are already on the right track!

|U03JZNY81L0|:
afact, ane_transformers just includes distilbert…  how the recommendations apply to that code is maybe a little opaque to me. Need to think about how I would apply this to a different model, haven’t had enough time to digest it this week.

|U03J4CNMT6D|:
The default conversion should be quite efficient as well for the neural engine (NE). With the new performance tab in Xcode 14, you will see whether the model is already neural engine resident or not.
There are details in the post <https://machinelearning.apple.com/research/neural-engine-transformers> on some of the changes specific to distill bert which may or may not be required for the transformer architecture in CLIP.
In any case if you find any inefficiencies after conversion, feel free to share with us via a feedback request. We are constantly adding new converter and NE compiler optimizations to automatically detect patterns and map them efficiently to NE, so such feedback is very valuable!

|U03JZNY81L0|:
Thanks, Aseem. I got stuck on the Performance tab not working on my M1 mac (FB10107014), but I tested it out with an attached iPhone 12 now.

|U03JZNY81L0|:
Will file an issue about this when I try to open Instruments

|U03JZNY81L0|:
Ah, it’s just the wrong version of instruments, will try to find the file on disk. Really appreciate the inspectability coming this year!

|U03JZNY81L0|:
very cool!

|U03J98R7N5A|:
There are more details to be found in the following article as well, hope this helps: <https://machinelearning.apple.com/research/on-device-scene-analysis>

--- 
> ####  In the "Optimize your CoreML usage" session, the presenter Ben explains that he got a latency of 22ms using the new performance metrics and that gives him a running frame rate of 45 frames per second. How did he come to that conclusion and how can I look at my performance metrics to determine our frames per second as well?


|U03HY66772A|:
In 1 second there is 1000ms, so if your model runs at 22ms, you can run it 1000/22 = 45 times.

|U03JFGMUPCY|:
The number is just an upper bound estimate based on 1s / 22ms = ~45 prediction per seconds. Such estimates often help us to understand the amount of headroom we can use for other operations while meeting the real time requirement (30 fps, etc).

--- 
> ####  Is it possible to run a CoreML model in the cloud/on Linux?   We are using a CoreML model to power privacy-preserving, on-device features. But we want to offer a web-based demo to potential users, since downloading an app can be higher friction than just using a website.


|U03J52T5J22|:
No, it is not supported. It is an interesting use case. A feedback assistant report will be much appreciated!

|U03J1UX2CQK|:
Thanks for your consideration! Filed a feedback: FB10162636

--- 
> ####  As far as I know, multi-label image classification is not possible with Create ML. Is it possible with Create ML Components to create a multi-label classifier?


|U03HRPK5JKU|:
Hi Matthew, one option is to implement your own custom estimator using a framework like MPSGraph. To simplify the task (and data required), you may want to explore training the classifier on the features produced by a feature extractor, such as &lt;https://developer.apple.com/documentation/createmlcomponents/imagefeatureprint
|ImageFeaturePrint&gt;.

--- 
> ####  Is there custom operation support for PyTorch?


|U03J4CNMT6D|:
Check out the <https://coremltools.readme.io/docs/composite-operators|composite ops doc> that can be used to build ops composed of existing CoreML (MIL) ops

|U03JZNY81L0|:
Ah, I meant when using PyTorch on its own rather than when converting to CoreML. Eg with a metal compute kernel.

|U03JLPLT8HK|:
<@U03JZNY81L0>, I don't think so you can use it as it is rather than converting to CoreML.

|U03JLPLT8HK|:
IF anyone knows, I'm interested to learn about it. Specially for tensorflow.

|U03JLPLT8HK|:
I can't use MobileNetV3 due to Swish operation doesn't support with CoreML

|U03JZNY81L0|:
<@U03JLPLT8HK> You can definitely <https://coremltools.readme.io/docs/custom-operators|implement a custom operator> in the CoreML context, though the <https://paperswithcode.com/method/hard-swish|hard-swish operation> might be able to be expressed as a combination of other ops in CoreML as well

|U03JZNY81L0|:
<@U03JLPLT8HK> from that link it looks like you could use <https://apple.github.io/coremltools/source/coremltools.converters.mil.mil.ops.defs.html#coremltools.converters.mil.mil.ops.defs.activation.relu6|RELU6> + <https://apple.github.io/coremltools/source/coremltools.converters.mil.mil.ops.defs.html#coremltools.converters.mil.mil.ops.defs.elementwise_binary.mul|multiply>, etc to replace the hard-swish efficiently

|U03HRPPNAE6|:
Hi <@U03JZNY81L0>, to learn more about GPU acceleration for Pytorch and Tensorflow, please refer to "Accelerate machine learning with Metal":
<https://developer.apple.com/videos/play/wwdc2022/10063/>

Specifically, Pytorch is open sourced, so you can leverage this to implement custom operations in Metal. Custom ops are also supported for TensorFlow as outlined in the session.

--- 
> ####  Do you have an example of how the ML image style transfer was created from an earlier session?


|U03HRMWNP4J|:
Are you interested in how the app was built or the model itself?

|U03HRMWNP4J|:
You can learn about how Create ML can help you build style transfer models with an example integration in this session: <https://developer.apple.com/videos/play/wwdc2020/10642/|Build Image and Video Style Transfer models in Create ML>

|U03HRMWNP4J|:
There are also a wide variety of style transfer models online that can be converted to Core ML format with coremltools

|U03HRMWNP4J|:
The model takes in an image and outputs an image

|U03JE2RJ2DA|:
Both the app and the model was built

|U03JE2RJ2DA|:
…and how the model was built

|U03HRMWNP4J|:
Do the resources above help?

|U03HRMWNP4J|:
I believe the app is  streaming data from an AVCaptureSession and running each frame through the Core ML model and outputting the result properly scaled back to the original image size

--- 
> ####  Does CoreML benefit from two ANE's in M1 Ultra?


|U03HRMWNP4J|:
Yes when you are using multiple models or batch inference
