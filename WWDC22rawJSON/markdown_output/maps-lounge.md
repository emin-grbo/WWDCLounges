# maps-lounge QAs
#### by [shirblc](https://github.com/shirblc)
---

> ####  When using a "virtual camera" in a new Maps-based experience within our apps, is there a limit as to "how close" we can bring users?  More specifically, could we go almost ground-level, as if the user is standing inside the maps experience, or is that not advised due to performance, difficulty in navigating around the map, building quality, etc.?


|U03HML1P7GD|:
We do have limit for how close your camera can get to the ground and unfortunately you cannot override that value.

|U03JUASCSN8|:
<@U03HML1P7GD> Is there a way to access this value?

|U03HML1P7GD|:
Sadly, it is not exposed through MapKit, please file a feedback if you feel it should

|U03JUASCSN8|:
All right, thanks! I’ll do that. :slightly_smiling_face:

|U03HA09MXN3|:
<@U03JUASCSN8> Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03HA09MXN3|:
Feel free to paste the feedback id in this thread, so we can reference it later

--- 
> ####  With MapKit, we can use +[MKMapItem openMapsWithItems:] to open the Apple Maps app with a destination and select ‘driving directions’. Till now, it's only been possible to pass in one destination. But with iOS16 Maps app supporting multi-stop routing, is it possible to send in multiple destinations to this API as well? I didn't


|U03JEAKCY6L|:
We do not currently have support for `-[MKMapItem openMapsWithItems:...]` with multiple destinations. Please file an enhancement request via <https://feedbackassistant.apple.com/|Feedback Assistant>.

If you are able to use <http://maps.apple.com|maps.apple.com> URLs in your app, you can add multiple `daddr` query parameters to the URL, which will behave similarly. You can reference the <http://maps.apple.com|maps.apple.com> URL scheme here: <https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html>

|U03HZ2VBE21|:
Feedback: FB9157471

|U03HZ2VBE21|:
Interesting ... so opening the maps url will open the Maps app on the device? Also, will this solution work for iOS16 devices only?

|U03JEAKCY6L|:
Yes, opening a <http://maps.apple.com|maps.apple.com> URL in your app will launch <http://Maps.app|Maps.app> on the device. Since Multi-stop routing is only available in iOS 16, this solution will only work for iOS 16 devices.

|U03HZ2VBE21|:
Perfect! One last question ... is this only on iOS, or is it supported on macOS as well?

|U03JEAKCY6L|:
<http://maps.apple.com|maps.apple.com> URLs are also supported on macOS!

--- 
> ####  Howdy :wave::skin-tone-3: With the introduction of multi-stop navigation in the Maps app (YAY! :partying_face:), is there API available to open a multi-stop route in Maps? — as in, via manually-crafted URL scheme, or via API like MKMapItem’s openMaps method?


|U03JEAKCY6L|:
We do not currently have support for `-[MKMapItem openMapsWithItems:...]` with multiple destinations. Please file an enhancement request via <https://feedbackassistant.apple.com/|Feedback Assistant>.

If you are able to use <http://maps.apple.com|maps.apple.com> URLs in your app, you can add multiple `daddr` query parameters to the URL, which will behave similarly. You can reference the <http://maps.apple.com|maps.apple.com> URL scheme here: <https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html>

|U03JEEUJPMJ|:
Okay, noted— I'll file an enhancement request. Thanks

|U03HJ92ED6W|:
Feel free to provide a feedback ID in this thread so that we can reference it later :sunglasses:

|U03JEEUJPMJ|:
Will do :relaxed:

[Just jumped into a Lab, back now]

Just to check: does the URL scheme (multiple `daddr` parameters) also work in CarPlay, or solely on the ‘main device’ itself? (To launch into a multi-stop route)

|U03JEAKCY6L|:
Calling `-openURL:...` on your CarPlay app's UIScene will open Maps on the CarPlay screen, while calling it on the phone UIScene will open Maps on the phone. Note that CarPlay only supports the driving transport type

|U03JEEUJPMJ|:
Ah, to clarify what I meant: is it just Maps _on iPhone_ that supports the multiple `daddr` parameters for multi-stop routing, or does Maps in CarPlay also handle a multi-stop <http://maps.apple.com|maps.apple.com> URL? (Gracias!)

(/ In my CarPlay app, I currently launch Maps in CarPlay with a _single destination_, but I’ve love to be able to launch Maps in CarPlay with a multi-stop route, and just want to confirm that’s doable at the moment. Unsure if that multiple `daddr` parameter functionality is available in CarPlay too)

|U03JEAKCY6L|:
CarPlay also supports Multi-stop routing in iOS 16!

--- 
> ####  Hi! I love that the improved map with better colours and elevation is now available in MapKit as well. Any plans to make the 3D globe version of the standard map available? We would love that over at Flighty.


|U03HML1P7GD|:
We cannot comment on future plans. Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03HJ92ED6W|:
Feel free to provide a feedback ID in this thread so that we can reference it later :sunglasses:

--- 
> ####  As far as I can tell, there's no specific API for animating overlays (like lines). Do you have any tips on how to achieve an animated-like look with the existing APIs?


|U03J36CBE49|:
Hello! While there’s currently no way to _truly_ mutate/animate overlays, you _can_ animate several properties of the standard `MKOverlayRenderer` subclasses. Specifically, you can change things like `MKOverlayPathRenderer.fillColor`, `MKOverlayPathRenderer.strokeColor`, `MKOverlayPathRenderer.lineWidth`, `MKPolylineRenderer.strokeStart`, `MKPolylineRenderer.strokeEnd`, and more from within a `UIView` animation block, and the resulting change will animate accordingly.

`strokeStart` and `strokeEnd` in particular can be used to achieve some pretty dynamic effects, such as “revealing” a line from start to finish (similar to the effect you see when <http://Maps.app|Maps.app> first displays a route.

If your animation needs are more complex than the animatable properties described above, please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03HJ92ED6W|:
Feel free to provide a feedback ID in this thread so that we can reference it later :sunglasses:

|U03JRR40QRE|:
Thanks :pray:! We have filed FB10107051

--- 
> ####  Congrats on the new announcements. While the satellite/hybrid globe is very nice, can you confirm if it is also possible to use the new "standard" theme with the globe?


|U03HML1P7GD|:
Unfortunately no, but please feel free to file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03HJ92ED6W|:
Thank you for your questions and feel free to provide a feedback ID in this thread so that we can reference it later :sunglasses:

|U03HQMMSA8P|:
Hi <@U03HJ92ED6W> :slightly_smiling_face: We already filed one last year after the release of iOS15 (FB9180623). Do you want me to file a new one? :earth_africa:

|U03HJ92ED6W|:
Thank you, Markus. The original feedback ID is enough for us to follow up :+1:

|U03HQMMSA8P|:
<@U03HJ92ED6W> Great! We would love for you to take a look at FB9498647/FB9554109 and FB9498786 while you're at it :pray:  Especially the first ones are not the best look for any of us :confused:

--- 
> ####  Is there any way to add a polyline or other overlays to a SwiftUI `Map` or `WKInterfaceMap`? (or any clever workarounds?) I'm looking to render polylines like the Apple Watch Maps app does.


|U03HQGPJ1U3|:
SwiftUI's `Map` does not currently support Overlays. Platforms with `MKMapView` can use `UIViewRepresentable` to add Overlay content. MapKit does not currently offer Overlay support on WatchOS.

|U03JCQQ5CRJ|:
Thanks for the details. I opened FB8970956 to have MKOverlays added on watchOS

|U03J21CNQ1G|:
Hey <@U03JCQQ5CRJ>, not an Apple Engineer, but reckon I could help. I had actually integrated an overlay in my Apple Watch app through a slightly hacky way before. I had written a bit about how i got through it in my blog: <https://www.vincent-neo.com/rp/environment/app/weather/watchos/pd/2021/06/01/PD4-EnvironmentApp.html>

|U03JCQQ5CRJ|:
Clever workaround <@U03J21CNQ1G>, looks like you ran into issues with interactivity :disappointed:

|U03J21CNQ1G|:
yup thats the unfortunate part

|U03JCQQ5CRJ|:
How were you able to convert from map coordinates to screen coordinates without the `MKMapView.convert()` functions?

|U03J21CNQ1G|:
i remember though, as long as the transparent annotations remain on screen its fine to move around a little

|U03J21CNQ1G|:
<@U03JCQQ5CRJ>, I used GeometryReader to provide me the frame info of each of the transparent anotations

|U03J21CNQ1G|:
from then on you can position it via that by computing things like size and screen coordinate

|U03JCQQ5CRJ|:
Nice! I'll poke around and see if I can put together something usable, thanks for the tips

--- 
> ####  Thanks for adding Look Around to MapKit, that's awesome! What's the purpose of MKLookAroundViewControllerDelegate? Is there a way to get the new coordinates/heading when a user moved in the scene?


|U03HJ92E4E6|:
`MKLookAroundViewControllerDelegate` provides a means to retrieve the new `MKLookAroundScene` once a user has navigated to it.

`MKLookAroundScene` is an opaque object. It can be used to subsequently initialize a new `MKLookAroundViewController` or grab a snapshot via `MKLookAroundSnapshotter`.

There is not currently a way to retrieve coordinates / heading after the user has moved in a scene.

Please file an enhancement request via <https://feedbackassistant.apple.com/|Feedback Assistant>. If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03J4J6MMK8|:
Thanks, I've logged FB10106431. I assume there's also no way to programmatically move around in the scene?

|U03HJ92E4E6|:
Thank you and yes, that is correct. Again, please file new enhancement requests as this will help us better server your needs.

|U03J4J6MMK8|:
Thanks, done: FB10106802: MKLookAroundViewController: programmatically move around in the scene

--- 
> ####  Why is there no MKLaunchOptionsDirectionsModeBiking to launch the Maps app into bike directions? Can this be achieved somehow?


|U03HQH9U3BL|:
We currently do not support MKLaunchOptionsDirectionsModeCycling to launch the Maps app into bike directions.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03J4J6MMK8|:
Already filed last fall: FB9684432 MKLaunchOptionsDirectionsMode should be extended with Bicycle

--- 
> ####  Is there a reason the LookAround API is not available on tvOS or did I just miss it?


|U03HJ92E4E6|:
The LookAround API is only supported on iOS.

If you would like tvOS support, please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

--- 
> ####  Is there an OpenAPI/Swagger Spec file for <https://developer.apple.com/documentation/applemapsserverapi/|https://developer.apple.com/documentation/applemapsserverapi/> ?


|U03HSU80E6Q|:
We currently don't have the OpenAPI/Swagger Spec file.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03K8HA5U2U|:
<https://feedbackassistant.apple.com/feedback/10106782>

--- 
> ####  Can I use map overlays with Map in SwiftUI?


|U03HQGPJ1U3|:
SwiftUI's `Map` does not currently support Overlays. Platforms with `MKMapView` can use `UIViewRepresentable` to add Overlay content.

|U03HQGPJ1U3|:
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

--- 
> ####  When using MKMapView with MKMapType.satelliteFlyover and setting a camera there seems to be a minimal altitude which changes over time. Is there a way to request this to prevent the camera from bouncing up and down when e.g. animating over a skyscraper?


|U03HQHD1QLA|:
Hi Rico! Thanks for your question.

The flyover camera will automatically adjust its altitude to prevent clipping through buildings when pitched. The minimal altitude at which the camera doesn’t move to prevent clipping varies by region and can’t be queried.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Is it possible to get rich metadata from MapKit searches, such as ratings, hours, etc? Right now, we have to direct the user to the Maps page so users can see rich metadata, but leaving our app is not a smooth or great experience,


|U03HSU2HNUU|:
Rich metadata, such as ratings and hours are not supported by MapKit.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03J4D45DEY|:
@Sean let us know when you file the enhancement request so we can follow it and upvote / add more details.

This is a huge missing piece of MapKit ATM.

--- 
> ####  Are Look Around and the new more detailed map supported in snapshots as well as interactive map views?


|U03HML1P7GD|:
For MKMapSnapshotter, we support Look Around (through `MKLookAroundSnapshotter` ), but not the Detailed City Experience.
For MKMapView, we support both Look Around (through `MKLookAroundViewController`) and the Detailed City Experience (through `MKMapView`)..

If you’d like us to add support for the Detailed City Experience in snapshots, please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs. (edited)

--- 
> ####  I’m using MapKit JS to show a map on my website and I have a tile overlay added to it. The problem is that the tile map is shown twice as large as it should, basically at @1x instead of @2x resolution. Is there any way to control this in mapkit.TileOverlay?


|U03HHUG7ZD4|:
Hey Pasi, you may have set your `scale` parameter incorrectly. Please refer to the documentation for <https://developer.apple.com/documentation/mapkitjs/mapkit/tileoverlay/2974035-mapkit_tileoverlay|the >`TileOverlay`<https://developer.apple.com/documentation/mapkitjs/mapkit/tileoverlay/2974035-mapkit_tileoverlay| >`urlTemplate`<https://developer.apple.com/documentation/mapkitjs/mapkit/tileoverlay/2974035-mapkit_tileoverlay| parameter>. Additionally, MapKit JS expects `256*scale px` tiles, please double check that your server is serving the proper response.

|U03JRR3H0DN|:
Actually I think my issue is that the public API I'm using does not use that tile size so they appear too large. A `tileSize` parameter in the tile overlay would solve this for me.

|U03HHUG7ZD4|:
Not `256*scale` tiles? Interesting.

In that case, please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JPSJS03E|:
Check with your tile server/vendor.  Some only serve up tiles that are 256x256 px.

|U03JPSJS03E|:
One way to request @2x in Mapbox is this pattern.  Works with MapKit JS &amp; Mobile
`<https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/256/{z}/{x}/{y}@2x?access_token=MAPBOX_TOKEN_HERE>`

|U03JRR3H0DN|:
Oh this is actually a WMTS API, with URLs like <https://avoin-karttakuva.maanmittauslaitos.fi/avoin/wmts/1.0.0/maastokartta/default/WGS84_Pseudo-Mercator/14/4617/9275.png|https://avoin-karttakuva.maanmittauslaitos.fi/avoin/wmts/1.0.0/maastokartta/default/WGS84_Pseudo-Mercator/14/4617/9275.png> and I don't think there's a way to get anything other than 256px sized tiles, sorry that the URL won't work for you as I had to remove my api key

|U03HHUG7ZD4|:
References to WMTS API will be very helpful in the enhancement request!

|U03JRR3H0DN|:
I'll be sure to include those in my request!

|U03HHUG7ZD4|:
Thank you.

|U03JPSJS03E|:
Your WMTS server may only have data at 256px, which means you are data limited.  Meaning all they serve is 1x (usually 256 px at 96 ppi).  For retina displays you typically want the 2x (usually 512 px at 192 ppi).  This is not limited to WMTS.

|U03JRR3H0DN|:
My thinking was, I could somehow make the tiles smaller on screen, similar to how MKTileOverlay size can be set with tileSize property

|U03JRR3H0DN|:
But I'll submit an enhancement request for it with more details :slightly_smiling_face::+1:

|U03JPSJS03E|:
Another thought:   Check with your WMTS server admin if they can serve up `WGS84_Pseudo-Mercator/14/4617/9275@2x.png`  or something similar.

|U03JRR3H0DN|:
I can ask but I don't think that's part of the WMTS spec, not sure though

|U03HHUG7ZD4|:
<@U03JRR3H0DN> References to MapKit interfaces will be helpful for a MapKit JS enhancement request.

|U03JRR3H0DN|:
maybe these screenshots also better visualize the issue. at the same zoom level one will be pixel accurate where the other won't

|U03JRR3H0DN|:
I'm using the same WMTS API in both, my iOS app and my website, but I can only set the tileSize for the iOS app

--- 
> ####  I'm pretty sure this is an enhancement request and not a bug, but currently multi-stop routing does not work for transit modes.  In NYC this feature would actually be very useful for planning a day's outing (or for a custom app to bring together different activities).


|U03HHUD64KY|:
Hi, multi-stop routing only works for driving.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03JSMJF0LC|:
Great thanks for verifying I wasn't missing something in the app already.  Will do.

--- 
> ####  Who is the best person to speak to when discussing increasing the quotas for Apple Maps Server APIs?


|U03HMKXHML5|:
You can request quota increase via this form: <https://developer.apple.com/contact/request/mapkitjs/>

--- 
> ####  In order for us to migrate to Apple Server Geocoding we would need an indication of the lat/long accuracy as we do user initiated map validation when accuracy is low. Google/Loqate already return this - is this on your radar and something you expect to introduce in the future?


|U03HSU80E6Q|:
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Do you have some suggestions on what's the best way of drawing line overlays in the globe?   We have noticed, for example, that if you have a long line, parts of it will have different widths.


|U03H3M7UAP9|:
Hi! This is an expected behavior. In globe map, `MKPolyline` and `MKGeodesicPolyline` are rendered as *rasters*. Thus, if the polyline is crossing tiles with different *z* (map tile zoom level) you’ll see different width, as we compute raster polyline width using the *z* value.

It’s possible that adjacent map tiles are at different zoom levels. Tile zoom level is determined using camera position, e.g the distance between tile and the camera.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03JRR40QRE|:
Thanks for the details! Do you know if there is any possible workaround for this behavior?

We filed FB9554109 about the issue.

|U03H3M7UAP9|:
Hi! Currently there is no work around for globe map :grimacing: All overlays on globe map are rendered as rasters. Sorry about that. I’m not sure about your use case….. but you’ll definitely get more options if you use the standard map.

We’ll prioritize the tasks, once our team receive your enhancement request. Cheers!!

--- 
> ####  With the new Detailed City Experience, can I also display indoor maps from malls, airports etc.?


|U03JEAKJBDW|:
The indoor maps for malls and airports continue to be available only in Apple Maps.

|U03J4J6MMK8|:
:disappointed_relieved:

|U03JEAKJBDW|:
```
Thank you for your questions. You can also file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later
```


--- 
> ####  We use `MKTileOverlay` to pull in PNG &amp; JPG tiles to overlay on MapKit maps.  We want to somehow provide _offline_ tiles for customers.  We are looking for a truly offline or cached solution.  Sniffing around in the Simulator, we see that the files are cached  in a new file structure (`fsCachedData`), which is not the same XYZ tiles in our `urlTemplate`  How long will that cache stick around?  Will it survive an app restart or device reboot?


|U03HA087EMV|:
That cache is the one provide by NSURLCache and like any cache, no guarantees can be made about its lifetime. If you want to provide your own tiles when no network is available you’ll need to implement your own `MKOverlayRenderer` renderer rather than using the `MKTileOverlayRenderer`

--- 
> ####  Can I use Pin Clustering with Map in SwiftUI?


|U03HQGPJ1U3|:
Annotation clustering is not currently supported in the SwiftUI `Map`.

|U03HQGPJ1U3|:
Clustering is supported by `MKMapView`, which can be used in SwiftUI via `UIViewRepresentable`.

|U03HQGPJ1U3|:
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JF5S79RQ|:
This was requested via Feedback Assistant as an Enhancement Request by myself on 7/13/21.
<https://feedbackassistant.apple.com/feedback/9321885>

|U03HPUBDM47|:
Not as great as native support `MKMapView` clustering but it is possible to write your own pin clustering on top of SwiftUI `Map` . I did this last year using `QuadTrees`, observing the `mapRect` and looping over regions to cluster.

|U03JF5S79RQ|:
Yes I spoke once with a Apple engineer from another team who did something similar. While I appreciated the time and effort he shared with me, unfortunately due to my level of understanding I was unable to utilize the methods within my project so I opted to go to UIViewRepresentable with an MKMapKit.  

--- 
> ####  When making a custom `MKAnnotationView`, how would you recommend adding a title to it that would be shown on the map, similar to `MKMarkerAnnotationView`s title?  Currently we're adding a label inside of our view and sizing/positioning it in `layoutSubviews`. This works alright but it makes the collision bounds much larger for clustering. `MKMarkerAnnotationView` is able to move the title to different sides and hide just the title if there isn't enough space to show it.


|U03HQH9U3BL|:
When the annotation is instantiated you could assign the title as follows:
```
let startAnnotation = MKPointAnnotation()
startAnnotation.coordinate = requiredCoordinate
startAnnotation.title = "My title"
```

|U03KH907MME|:
We have a custom `MKAnnotation` that is setting the title. The question is about the view side of it. It seems that by default that custom `MKAnnotationView` subclasses wont show a title on the map.

|U03HQH9U3BL|:
Hi - Thanks for the clarification.  Currently for custom `MKAnnotationView` subclasses, adding a title such that it would be shown on the map, similar to `MKMarkerAnnotationView`  is not supported.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Is there a recommended method to add additional data to a custom MKMarkerAnnotation in terms of text, at this time I believe we're limited to title &amp; subtitle.


|U03HJ92E4E6|:
You can use callout accessory views as a means providing extra information, either directly inline, such as an image if the information is limited / graphical in nature, or as a button to open/present the additional information in a separate view / sheet.

|U03JF5S79RQ|:
Can the callout accessory be always displayed on the map in a position below / above the title / subtitle?

|U03JF5S79RQ|:
For instance, a grouping of stars to represent a current rating of said location.

|U03HJ92E4E6|:
Thank you for your questions!

It is currently not possible to display additional information in the callout in the manner that you are describing.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

--- 
> ####  MKOverlayPathRenderer sometimes fallbacks from vector to bitmap drawing which we clearly wanna avoid as it looks bad when zooming. Can you share under what circumstances this happens?


|U03HML1P7GD|:
self-intersecting or colinear polygons will always be rasterized, and certain renderer settings — such as using a dashed stroke pattern, exceeding a certain number of colors in a MKGradientPolylineRenderer, and more — can also cause rasterization to occur.

|U03J4J6MMK8|:
Is it possible to display an arc or bezier curve non-rasterized?

|U03HML1P7GD|:
yes, unless it is using a dashed pattern

|U03J4J6MMK8|:
Hm, doesn't work here. I just set the path property to my CGPath I constructed. Apart from that I only set lineWidth and strokeColor. Unfortunately it's rasterized.

|U03HML1P7GD|:
hmmm, in that case please file a feedback via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible please provide some sample code to reproduce this, we can certainly investigate why in this case it is rasterized.

|U03J4J6MMK8|:
Thanks, will do.

|U03J4J6MMK8|:
Took a while but here we are: FB10109219

--- 
> ####  Hi, Maps team! :wave: Do you plan any sort of Offline functionality for use with MapKit? There are plenty of Map frameworks available on Apple platforms, most notably the multiplatform Mapbox, also allowing things like tiles caching, prebundling with mbtiles files, etc. that empowers a huge set of mapping apps like trip planners, destination guides, and others. At this moment, the only possibility is drawing an externally sourced _raster_ layer over the MapKit content, which is honestly so 2000s today – *vectors are definitely the future*. :rocket: Thank you!


|U03HA09MXN3|:
Hi <@U03JPFQNX5K>, Thanks for your question! We do not offer any Offline functionality for MapKit, and we can’t comment on future plans.

|U03HA09MXN3|:
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03J4J6MMK8|:
Indeed, supporting vector tiles in MKTileOverlayRenderer would be huge!

|U03JPFQNX5K|:
I guess so, maybe having an option to provide standardised vector tiles via some MapKit-based tile rendered would just do, we could stick with implementing the offline functionality on our own… :thinking_face:

|U03JPFQNX5K|:
On the other hand, Apple already has great tiles, possibly with an option to reuse them across all app using MapKit, so a generic solution provided by the system framework would be the best scenario.

--- 
> ####  Can we show a .satellite Map in SwiftUI?


|U03HQGPJ1U3|:
The SwiftUI `Map` does not currently support satellite map presentation.

|U03HQGPJ1U3|:
`MKMapView` offers `MKImageryMapConfiguration` and `MKHybridMapConfiguration` which can be used in SwiftUI via `UIViewRepresentable` .

|U03HQGPJ1U3|:
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JMMN8659|:
ok, thank you! :pray:Hoping for WWDC23, this is an important feature!

|U03JMMN8659|:
Submitted as FB10108565

--- 
> ####  Across multiple iOS 15 versions, I’ve found that annotations on MKMapView will either: perfectly move when the map is panned (:ok_hand::skin-tone-3:), or they will stutter along behind the underlying map motion (:pleading_face:). I’ve noticed it in my own apps, but also in seemingly all MKMapView-using apps.  Am I right in thinking that this behaviour isn’t intentional, and I should file a bug, or is this behaviour expected?


|U03J36CBE49|:
This is definitely not intentional behavior. Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>).

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Congratulations on the awesome work you're doing on Maps in the latest years, it's beautiful! I wanted to ask, this is more as a user than a developer, how can we report any inaccuracy in the proposed path? Like when it tells you to turn right but it's actually forbidden. Is there some quick user feedback mechanism like the one for fixing places? Thanks!


|U03JEAKCY6L|:
Hi Cristina! You can use the Report an Issue flow in the Maps app to report inaccurate directions.
1. From the main Maps screen, tap your image next to the search field, then tap Reports.
2. Select Report Route Issue, then select the route you had an issue with.
3. Select the step where you were unable to turn, then select No entry, and Turn not allowed.
Thanks for helping to improve Maps!

|U03HMBPKU0P|:
Thank you very much!

--- 
> ####  Are the models/floorplans generated from the new room scanning app able to be converted to the indoor map format?    Said another way, can I show my position within one of those scans?


|U03JEAKJBDW|:
The new room scanning app does not support creating an IMDF at this point.
```
Thank you for your questions. You can also file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later
```


--- 
> ####  When submitting Feedback / Enhancement Requests, what information is most crucial for the Maps team to assist them? Additionally, is there a method to request a status update on a Feedback Assistant or Enhancement Request?


|U03HA09MXN3|:
Hi Robert, Thanks for joining our Digital Lounge today! What a great question!

The most important information is a description of your use case. Understanding what you’re ultimately trying to achieve helps us tremendously!

If you have a link to an existing app / website we can look at to better understand the use case, feel free to include that as well (An app is worth a thousand words :wink: ).

|U03JF5S79RQ|:
Are Feedback Assistant posts updatable / editable to add additional information?

|U03HA09MXN3|:
There is no way to request a status update on a Feedback request, but the Feedback will automatically get updated when the issue is resolved and/or if we have follow-up questions

|U03HA09MXN3|:
Also, if you are filing a bug report, attaching a sample code project which reproduces the issue helps us a ton

--- 
> ####  Any plans on developing an app to design maps that can be easily consumed in the Maps app for MacOS/iPadOS/iOS? Currently we are using ESRI software and SDKS to design and consume mobile maps. Would really prefer a native Apple solution.


|U03HA09MXN3|:
Hi Donovan, Thanks for your question! In general, we can’t comment on future plans.

|U03HA09MXN3|:
Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03HA09MXN3|:
In your request, can you please clarify what you mean by “designing maps”? Do you mean specifying different style attributes, or are you talking about providing your own vector data?

--- 
> ####  I have a map that i want to place two markers on, the map is in a portrait layout and if the two points require the map to be zoomed out to the point it wouldn't fully cover the containing view. Is there a way to get it to zoom further out or to detect when it would not work so i can resize the container?


|U03HSU2HNUU|:
Hello Talby!

Changing the visible map region of an `MKMapView` to show two points can be done as the following...

```
// these are your two lat/long coordinates
CLLocationCoordinate2D coordinate1 = CLLocationCoordinate2DMake(lat1,long1);
CLLocationCoordinate2D coordinate2 = CLLocationCoordinate2DMake(lat2,long2);

// convert them to MKMapPoint
MKMapPoint p1 = MKMapPointForCoordinate (coordinate1);
MKMapPoint p2 = MKMapPointForCoordinate (coordinate2);

// and make a MKMapRect using mins and spans
MKMapRect mapRect = MKMapRectMake(fmin(p1.x,p2.x), fmin(p1.y,p2.y), fabs(p1.x-p2.x), fabs(p1.y-p2.y));

[mapView setVisibleMapRect:mapRect animated:YES];
```
Thanks for your question!

|U03JQV7JC76|:
So this is what i’m already doing, unfortunately if you have two things on opposite sides of the map and your map is in portrait, this will cause it to not show either and rather center the map filling the mapView. I’m wondering if there’s either a way to not force the mapView to fill, or if there’s an easy way to detect when this happens so externally i can change the aspect ratio of the mapView

|U03JQV7JC76|:
example of the issue

|U03HSU2HNUU|:
Hi Talby, unfortunately there is no easy way to accomplish what you want to do. You may be able to convert `MKMapPoints` to screen coordinates to do things like determine if the point is offscreen or how to change the aspect ratio of your view to account for the two distant points.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>).

Feel free to provide a feedback ID in this thread so that we can reference it later. Thank you!

|U03JQV7JC76|:
Thanks! Do you happen to know the aspect ratio of the map itself so i can try and do this math myself?

|U03HSU2HNUU|:
Hello Talby, the aspect ratio of the map is not an available value. However you may be able to use `-[MKMapView mapRectThatFits:]` as the returned `MKMapRect` is modified to fit the aspect ratio of the map.

--- 
> ####  Is there a method to properly scale map clusters? At this time, when my cluster indicates triple digit count the numbers are cut off by the size of the cluster.


|U03HJ92E4E6|:
Thank you for your question, this is certainly not intentional behavior.

Please file a bug report via Feedback Assistant (<https://feedbackassistant.apple.com/>).

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JF5S79RQ|:
Will file later today and if able, respond here.

|U03HJ92E4E6|:
Thank you for your participation in the Maps &amp; Location Digital Lounge!

--- 
> ####  Hello! Wayfinding is a critical use case in our app, and we make extensive use of satellite view in both 2D and 3D.  Unfortunately the tiles used in MapKit are woefully out of date (several years old now) and many existing buildings look like construction sites or fields. Is there any way developers can flag regions as needing a new data load? We've tried using the built in location feedback in Maps but that doesn't seem to result in any improvement. The non-satellite maptypes have the new buildings with proper dimensions and we're happy about that, but we really would like for all types to be accurate.


|U03HJLZ497Y|:
Hi Christopher! Thank you for stopping by our digital lounge and taking the time to provide this detail about your experience with satellite imagery. Please file a report about this via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please include screenshots to help illustrate your experience.

Please feel free to provide a feedback ID in this thread so that we can reference it later.

|U03J211JCKU|:
Thanks!

|U03J211JCKU|:
40855707

--- 
> ####  This is not really a question, but I really like the way you can explore using Apple Maps. Amazing work!


|U03HA09MXN3|:
Hi <@U03JRP87THN>, Thanks so much for the feedback! :relaxed: We’re glad you like it!

|U03JRP87THN|:
Oh, and also, I really liked the Landmarks SwiftUI tutorial. It’s one of the first tutorials I followed to learn SwiftUI. Amazing work on that too! It would be interesting to see a new version that uses the new 3D features.

|U03J9S1L38W|:
There's a new MapKIt Sample app out now which is pretty cool!

|U03J9S1L38W|:
Nice little animated tour of some SF landmarks

|U03JRP87THN|:
Thanks! Sadly, I didn’t see it, but I’m going to look for it now!

|U03JRP87THN|:
Also, I think I sent an unfinished question trough the workflow, sorry for the inconvenience!

|U03J9S1L38W|:
<https://developer.apple.com/documentation/mapkit/explore_a_location_with_a_highly_detailed_map_and_look_around?language=objc>

|U03J9S1L38W|:
Feel free to use Swift as well, I'm just old school :slightly_smiling_face:

|U03JRP87THN|:
Thanks! Old school is nice too, haha:smile:

--- 
> ####  Is there any plans to adapt custom map annotations, much like the use of glyphs for MKMarkerAnnotation (or MKPointAnnotation) for SwiftUI? 


|U03HQGPJ1U3|:
Hi Robert! Thank you for joining us today.

SwiftUI's `MapMarker` does not currently support the same level of configuration (such as glyph support) offered by `MKMarkerAnnotationView` .

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JF5S79RQ|:
Thank you. I think the SwiftUI `Map` functionality could really benefit from those two key features which is custom annotations &amp; clustering. I sure hope it's on the radar!

--- 
> ####  Are you planning on creating a new tutorial that uses the new MapKit features, as well as


|U03HA09MXN3|:
Hi <@U03JRP87THN>, your question got cut off there, but I’ll try to answer the first part:

|U03HA09MXN3|:
We are adding / updating sample code projects for some of the new features this year. The Look Around one is already live, but more are yet to come
<https://developer.apple.com/documentation/mapkit/explore_a_location_with_a_highly_detailed_map_and_look_around>

|U03JRP87THN|:
Yeah, I immediately realised I sent it unfinished by mistake. Thank you very much!

--- 
> ####  Meta question here: I'm intending to file a couple of Feedback Assistant requests for bugs &amp; enhancements, relating to questions asked here. Will I be able to reply to the relevant question threads here with those Feedback Assistant IDs as requested, or does this all lock at the end of the 2 hour window? :)


|U03HA09MXN3|:
Hi Michael, the threads will remain open for the remainder of the conference. We won’t be available to reply to activity on the thread outside of the Q&amp;A timeslots, but we’ll definitely capture all threads and your Feedback IDs before the Workspace closes.

--- 
> ####  When using the <http://Maps.app|Maps.app> and planning a trip for example over the Golden Gate Bridge the Overlay for the track gets drawn correctly on the road when using .satelliteFlyover. When I do this in an MKMapView the overlay drops onto the ground level. How can I do this correctly?


|U03H3M7UAP9|:
Hi rico ! Thanks for joining us today!

Currently MapKit does not support elevated route line in Hybrid or Imagery mode. We only support elevated route line in Standard mode. And you’ll have to use the polyline returned by MKDirection API.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

|U03HJ92ED6W|:
Thank you for so many great questions today! Feel free to provide a feedback ID in this thread so that we can reference it later  :sunglasses:

--- 
> ####  I'm currently using `MKMapKit` and UIKit's `SearchBar` with a `UIViewRepresentable` to display the map using SwiftUI. I'm having an issue when a user completes a search of a location or uses the `Current Location` button and the map begins to zoom / pan, there is a noticeable stutter / FPS drop.   Is there a method to best diagnose the issue and determine its root cause?


|U03HQGPJ1U3|:
Hi Robert; thanks for bringing this to our attention.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs. Please note the scenarios in which you observe stutter / FPS drop, and also note if there are scenarios where similar map zooming or panning does not cause those to occur.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JF5S79RQ|:
Thanks. Will do. Is there a method to add video snippets so I can best show what is happening?

|U03HQGPJ1U3|:
Yes; Feedback Assistant should offer an option to upload files (including Video).

--- 
> ####  The disclaimer overlay over Map in SwiftUI (Apple Maps logo, link to licence) can appear in places that are inappropriate, and they do not respect the .ignoresSafeArea() modifier. Can we show these disclaimers programmatically?


|U03HQGPJ1U3|:
Hi Jan, thank you very much for bringing this to our attention.

It sounds like that is not working as expected. Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JMMN8659|:
Ok, will do :i_love_you_hand_sign:

|U03JMMN8659|:
Sent as FB10110753

--- 
> ####  I'm loving SwiftUI, and had been drawing annotations with SwiftUI, but have had to fall back to `MKMapView` for now while things mature on the SwiftUI `Map` front (because I'd like to use MapKit's clustering behaviour).   To continue using my SwiftUI annotation views, I've been: using `UIHostingController` to get a `UIView`, and then snapshotting the `UIView` to get a `UIImage`. This …works, but feels a bit sketchy. Would you recommend a different approach, or is this likely the only way to do this? (`MKMapView` annotation from a -static- SwiftUI `View`)


|U03HQGPJ1U3|:
Hi Michael!

You could eliminate the `UIView` snapshotting step by adding the SwiftUI hosting view as a subview of an `MKAnnotationView` subclass. If your annotation content is static, the simplicity of your `UIImage`-based approach could be preferable, depending on the specifics of your use case.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03J1TN6WBD|:
Should either solutions have about the same performance as in using UIKit ?

|U03JEEUJPMJ|:
Thanks <@U03HQGPJ1U3> – in my quest to get _something_ working; I think I tried, as suggested, adding a SwiftUI hosting view as an `MKAnnotationView` subclass, but had issues with the SwiftUI view being:
• vertically ‘pushed down’, with empty space above
• the bottom cut off (by the same vertical amount as the empty space at the top)
It seems that there’s an issue relating to `UIHostingController` and `safeAreaInsets`: the vertical ‘pushing down’ seemed to always be the exact height of the device-top’s `safeAreaInsets` (for the notch, on iPhone X and newer, for example). I was able to work around this when converting to a `UIImage`, but couldn’t find a workaround -at the time- when using annotation views directly.

I’ll try again (`MKAnnotationView` subclass with a hosting controller subview), and if the same ‘cut-off’ behaviour occurs, I’ll file feedback specific to the `safeAreaInsets` issue.

(Screenshots speak a thousand words, and all that jazz, but I can’t easily dig up screenshots I took at the time, right this moment)

I’ll separately file an enhancement request :relaxed:

Thanks for the reply!

--- 
> ####  Were there any changes/improvements to the MKMapView clustering mechanism this year?


|U03HQH9U3BL|:
This year we were focused on expanding our feature set. While we are continuously working on enriching our features, we are always listening for feedback. Curious to know if there are specific changes/improvements you are looking for regarding the MKMapView clustering mechanism.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Hi :wave:  not really a question relating to any new MapKit APIs, but I was wondering what would be the best approach to converting a Polyline route returned from MKDirections into an array of lat and long values that represent that route in order? Any guidance would be much appreciated.


|U03HQH9U3BL|:
Hi - Thanks for the question. Is each point of the Polyline accessible? If yes, the corresponding lat long of each point can be extracted and stored in an array.

--- 
> ####  I've got a question about MKMapView when using MKMapType.satelliteFlyover with annotations. The annotations are positioned above (an inaccessible) minimal elevation. I assume this data comes from a database and is not exposed via an API.  When animating the annotation this sometimes looks strange because it jumps up and down (over trees for example).  Is there any way around this?  I've already tried to get the screen coordinate from the geo position but this has the exact same effect.


|U03HQH9U3BL|:
Hi - Thanks for the feedback. Currently there is no way around this.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Will Look Around be made available in MapKit JS?


|U03HQHDTEGJ|:
Hi Erick, thanks for your question! We can’t comment on future plans but please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later. :gratitude-thank-you:

|U03JSS2QCHG|:
Will do. Thanks.

|U03JSS2QCHG|:
Here's the feedback ID: FB10141912 (Make Look Around available in MapKit JS)

--- 
> ####  Hoping this is the correct place. CarPlay simulator - does it require new OS Beta or is it currently not working? It manages to detect and launch carplay instances when i connect my devices however the screen shows the 4 icons and nothing more. all buttons seem to do nothing. I've tried it both with the beta one and iOS 15.5 - same result (approved alert to allow carplay while device is locked, use my phones with carplay regularly in real cars)


|U03HA09MXN3|:
Hi <@U03HMDFD7TR>, Welcome to the Maps Lounge! Unfortunately, we don’t have any CarPlay experts in this lounge. However, the CarPlay team has a dedicated lounge tomorrow, Friday, from 1PM to 3PM! I’d encourage you to re-post your question over there

|U03HMDFD7TR|:
ah perfect - can i be added to the relevant lounge please?

|U03HA09MXN3|:
You’ll have to sign up through <https://developer.apple.com/wwdc22/digital-lounges/>
I don’t have the powers to add you. Fortunately, the lounges are not limited in terms of capacity, so you still be able to sign up.

--- 
> ####  To get the behaviour of a *custom annotation image*, and the *annotation title text* of MKMarkerAnnotationView: I've been using MKMarkerAnnotationView with its `image` property populated, and `markerTintColor` set to `UIColor.clear`. This shows my provided annotation image, and not the default 'balloon shape'.  However, in iOS 16, I'm seeing *both* my passed-in `image` *and* a ghostly mostly-transparent ballon shape. Is there a way, in iOS 16, to continue the behaviour of not showing the balloon shape at all?  (As far as I can tell, MKMarkerAnnotationView is the *only* way to achieve annotation title text which: appears when there's space on-screen, and automatically moves out of the way when needed.)


|U03HQH9U3BL|:
Hi Michael - Thanks for the questions / feedback.

This year one of the enhancements we made was to render a gradient for MKMarkerAnnotationView to make it consistent with the Maps application, which is the transparent ballon shape you are observing.

Could you please file two enhancement requests via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

1 - If `markerTintColor` set to `UIColor.clear`, not to render the gradient.
2 - Render `text` and `subtitle` for custom `MKAnnotationView` similar to `MKMarkerAnnotationView`

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03JEEUJPMJ|:
<@U03HQH9U3BL> Feedback Assistant requests:

#1: 10141923 (`markerTintColor` = `UIColor.clear`)
#2: 10142054 (`MKAnnotationView` `text` and `subtitle` rendering)

:crossed_fingers::skin-tone-3::relaxed:

|U03HQH9U3BL|:
Thank you!

--- 
> ####  Can the LookAround view controller be presented in fullscreen or is the user required to tap on the preview to then launch look around in fullscreen?


|U03HJ92E4E6|:
Hi Erick, thank you for your question!

Yes, the Look Around view controller can be presented in fullscreen directly.

If you are using storyboards, just add a push segue to your Look Around View Controller scene.

If you are using code, you could have code like the following in the action handler of a `UIButton`:

```
{
    let coordinate = CLLocationCoordinate2D(latitude: xxx, longitude: yyy) // the location to display
	let lookAroundViewController = MKLookAroundViewController()
	view.present(lookAroundViewController, animated: true)
	let request = MKLookAroundSceneRequest(coordinate: coordinate)
	Task {
		do {
			if let scene = try await request.scene {
				lookAroundViewController.scene = scene
			}
		}
	}
}
```
Note that is a fairly simple implementation that doesn’t verify that the specified coordinate does indeed support an `MKLookAroundScene`.

Ideally, you would have retrieved the scene ahead of time and only show the Show Look Around button if you know you have a scen to display.

|U03JSS2QCHG|:
Awesome. Good to know that it's possible.

--- 
> ####  For the new `/etas` API, does it take into account traffic information, including for multi-stop? And is there any plans to return route information in-future (e.g. legs/poly-lines)?


|U03HA080UBZ|:
Thanks Josh for your question.

`/etas` response has `expectedTravelTimeSeconds` and `staticTravelTimeSeconds`. Please note that `expectedTravelTimeSeconds` takes liveTraffic conditions into account while  `staticTravelTimeSeconds` doesn't.



For any proposed enhancement, Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03J1UFC1QB|:
That makes sense, thank you! Is traffic taken into account when *departureDate* is in the future or only when it’s not specified?

|U03J1UFC1QB|:
And could I clarify whether a series of destinations is a multi-stop i.e. A → B → C, or the origin to each individual destination, e.g. A → B, A → C ? My reading of the documentation is the latter.

|U03HA080UBZ|:
traffic condition is taken into account in both the cases.

|U03HA080UBZ|:
answer to your second question :  its the later A-&gt;B, A-&gt; C

|U03J1UFC1QB|:
Thank you :slightly_smiling_face: I’ll file an enhancement request for multi-stop and route information and share the IDs here.

--- 
> ####  Is there any means to get results from the MKLocalSearchCompleter for a specific locale?   Here is our use case: our app is only available in French, as it’s a content app providing content in French. I am currently developing a new feature where I use a search field and an MKLocalSearchCompleter to allow the user to search for a city name, and I would like the city names to be in French, to match the UI.   If the user has his device language set to French, then I do get localised names in French (e.g. Londres, not London). However, if the device is set to another language, then the place names are in that language, which may be surprising to the user as the rest of the app is fully in French.   This is why we would very much like to ask MKLocalSearchCompleter to do the search in a specific locale. How could we do that?


|U03HSU2HNUU|:
Hey <@U03J4D7EZNY>, thank you for your question. Could you please clarify which languages your app supports? Is the only localization for French or are there localized strings for other languages? Thank you!

|U03J4D7EZNY|:
Only French

|U03J4D7EZNY|:
The app is not localised at all actually. All user-facing strings are directly typed in French.

|U03HSU2HNUU|:
Hello <@U03J4D7EZNY>! Thank you for your clarification. We will be happy to look into this behavior.

Please file a feedback request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

Thank you so much!

|U03J4J6MMK8|:
I'd love to see a locale property we can set, similar to CLGeocoder.

--- 
> ####  Less of a question but more of a request to look at a feedback. Back in 2020 when cycling was introduced I was working on an app that could benefit from cycling directions in maps, however the appropriate MKLaunchOptionsDirectionsModeKey API for this was not made available. It is still not available in iOS 16. FB7824756


|U03HJ92ED6W|:
Thank you, <@U03JRR4R3CY>, for this enhancement request. We’ll be sure to review :eyes: all submitted feedback after WWDC

|U03J4J6MMK8|:
I second this! I filed FB9684432 last fall. I'd also welcome bicycle support for MKDirections.Request (FB9684428). Let's go biking to make our planet greener! :green_heart:

--- 
> ####  ARGeoAnchor seems to be able to calculate an altitude from MapKit when no altitude is provided in the CLLocation. Is this an API developers can use? Or is it available in the new web API? We have basemap heightmaps for some cities but would like to leverage the same data as MapKit on iOS. 


|U03J36CBE49|:
Hello! Unfortunately, this information isn’t currently exposed via any APIs (except indirectly, via things like `ARGeoAnchor`, as you mentioned). However, we’d love to learn more about your specific use case, to help inform how elevation data might be used/exposed in the future.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>).

Feel free to provide a feedback ID in this thread so that we can reference it later

|U03JEMGKNDP|:
OK thank you <@U03J36CBE49> 

--- 
> ####  Can the Apple Maps server-side API return back the geometry/shapes of various regional entities? (ie: countries, states/provinces etc.)  This would be fantastic to be able to access without having to use a third party service to overlay them.  Don’t know to what level the data may be generally available (ie: down to the neighbourhood?) but even having countries and states would be a great thing to leverage


|U03HSUJ9LP6|:
Thanks for your question, we are not supporting that today.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

--- 
> ####  What's the recommended way to add an outline border to a route line, preferably to a 3D route line based on MKRoute.polyline? I wanna avoid rasterization.


|U03HQHD1QLA|:
Hi Ortwin!

It’s possible to achieve a stroked effect similar to the routeline by adding two identical polylines to the map (with different colors), and specifying a wider stroke width for the polyline that you want to represent the stroke.

Additionally, if you want to avoid a rasterized polyline, make sure that both polylines are not using a dashed pattern

|U03J4J6MMK8|:
Thanks. For that I have to copy the polyline from MKRoute. Is that supported? According to the documentation, MKPolyline doesn't conform to NSCopying.

|U03HQHD1QLA|:
Yes, MKPolyline does not support `NSCopying` at the moment, but that’s a good suggestion for enhancement. You can submit a feedback request for it!

To work around this, you can get the MKPoints that form the polyline with `- (MKMapPoint *)points`, and pass them in when creating a new `MKPolyline` with `polylineWithPoints`. This will do the copying for you.

--- 
> ####  Are there any terms of service for the Maps Server API and any restrictions of use beyond the API call limit?  In particular is it within acceptable usage to cache any data received server-side (or client-side) as to support whatever query patterns and/or system architecture?  Could not find any specific Terms of Use for the API part of the service, only the end-user Apple Maps TOU (<https://www.apple.com/legal/internet-services/maps/terms-en.html)|https://www.apple.com/legal/internet-services/maps/terms-en.html)>


|U03HMKXHML5|:
Thanks Marcel for joining us today.

Please refer to our developer program license agreement: <https://developer.apple.com/support/downloads/terms/apple-developer-program/Apple-Developer-Program-License-Agreement-20220606-English.pdf>

|U03J4D45DEY|:
Ahh perfect. That's what we were looking for! Thanks

--- 
> ####  Context: I love love *love* that Apple Maps now supports multi-stop routing; it's going to enable a use-case I couldn't previously support with Apple Maps (and would've had to pass users exclusively to other navigation apps).  I'm aware that I can launch Maps with a multi-stop route, by calling a <http://maps.apple.com|maps.apple.com> URL with multiple `daddr` parameters, but: I've not been able to find documentation on what format the `daddr` values can be / should ideally be. I've tested with 'fuzzy' search queries ("Disneyland Paris") and it functions, but: can I somehow provide explicit coordinates along with a place name?   (I'm fairly certain that, with a string query alone, there will be cases where my users see one location in my app, and a different one altogether in Maps)


|U03JEAKCY6L|:
Hi Michael! Thanks for stopping by again today! Here's an example URL of some query items that are supported: <https://maps.apple.com/?daddr=Apple+Park&amp;daddr=1+Infinite+Loop+Cupertino+CA&amp;daddr=37.31955,-122.02077>
As you can see, you can add fuzzy search queries as you discovered above, addresses, and coordinates.

If the `+[MKMapItem openMapsWithItems:...]` API is a better fit for your app, please file a feedback request (and feel free to drop the feedback ID in the chat here so we can follow up on it)

|U03JEEUJPMJ|:
<@U03JEAKCY6L> :wave::skin-tone-3:

Fuzzy search, or address, or coordinates, but not: place name + coordinates in a single value? Gotcha

`openMaps(with:launchOptions:)` Feedback Assistant request: 10142364

--- 
> ####  What is the difference between geocoding through the new Apple Maps Server API and the geocode functions within CLGeocoder. Are there any advantages to using the new Apple Maps Server API over CLGeocoder to turn an address string into location coordinates in my App?


|U03HSU80E6Q|:
Thank you Quentin for your question!  Using CLGeocoder vs geocoding via Apple Maps Server API is functionally almost the same. The best option depends on your use case.

If your architecture involves a server-side component already and/or your geocoding results are shared across multiple clients, Apple Maps Server APIs are the way to go.

If your geocoding requests are user-specific and issued at a low rate, you will likely want to stick to CLGeocoder

|U03JVJKPR4K|:
Great! Thanks for the clarification :smile:

--- 
> ####  Really cool to see all the new features regarding MapKits POI capabilities! Can we expect that all available POI information will be available via the API, especially a unique id for POI or pictures and opening times?


|U03HQH9U3BL|:
Hi Felix - Thanks for the question.

You can leverage `MKMapItemRequest` to request additional information about a map feature - <https://developer.apple.com/documentation/mapkit/mkmapitemrequest>
The returned MKMapItem currently does not have unique ids, pictures and/or opening times.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>) for additional POI information you are interested in . If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later

--- 
> ####  Is there a plan to eventually add a way to have in-app Turn by Turn navigation powered by mapkit?


|U03HA09MXN3|:
Hi Jean, in general, we don’t discuss future plans.

However, we’d really be interested in your use case. Can you please file an enhancement request via Feedback Assistant? (<https://feedbackassistant.apple.com/>)

|U03JE7VT43Z|:
Thanks, I’ve filed FB10142507

|U03HA09MXN3|:
Awesome, Thank you!

--- 
> ####  Hi, my question is regarding Maps Server API service call daily quota.  For context here is some background on our use case:  Our business is as a multi-tenant backend service provider of location data processing on behalf of our clients mobile and web applications.  In total, our usage would greatly exceed this quota, but on a per client basis this quota could be workable.  Questions:  Can you detail how the daily quota of 25,000 is measured?  For instance is it measured per Maps ID, per Developer Account, or some other context?  If we were to use ID/Key for each of our clients, could we create them on their behalf under our Developer Accout?  If our usage warranted exceeding the daily quota, who should we contact to discuss alternative models?


|U03HMKXHML5|:
Thanks David for your question. We are excited to see how you take advantage of these APIs.

The daily quota of 25000 service calls is measured against any service usage via API or MapKitJS calls like search, geocoding, etc.

The daily quota provided is per developer team (Team Id).

If you need to exceed your quota - you can use this request form <https://developer.apple.com/contact/request/mapkitjs/>

|U03JK9F9WBZ|:
:+1:

--- 
> ####  When a cluster annotation declutters we saw that it takes time for it to hide himself which affects our UX. Is this something that was made by design? Should we file Feedback on it?


|U03HQH9U3BL|:
Hi Lior - Thanks for the question.

What is the annotation and cluster count when the slowness is observed?

|U03J1TN6WBD|:
If I remember right we found this slowness even on clusters with 2-3 annotations.

In our use case Cluster annotations can be selectable if one of their children is selectable, so we found we have to add a delay in order to be able to select a child annotation after the parent cluster annotation gets removed by the clustering mechanism.

|U03HQH9U3BL|:
Hi Lior - Thanks for the feedback.

Please file a feedback request via Feedback Assistant (<https://feedbackassistant.apple.com/>). If possible could you please attach a sample project or a video of the behavior you are observing.

Feel free to provide a feedback ID in this thread so that we can reference it later.

--- 
> ####  Hi! I would like to know how I can report data errors in Apple Maps.   I have had a Labs exchange with the CL team earlier this week, where I asked why I was getting some erroneous place details when I sent a reverse geocoded result. If I drop a pin in Apple Maps on that same location, I get the exact same erroneous data.   They suggested to ask a question in this Lounge to report an issue with the data returned from the server.   Thanks!


|U03JEAKCY6L|:
Thank you for your patience while we looked into this, Karim-Pierre! You can report issues with forward or reverse geocoding with the Report an Issue flow in the Maps app.

Since you mentioned reverse geocoding, if you search for coordinates in the Maps app, then at the bottom of the place details card there is a Report an Issue button.

If you aren't able to report your issue using the Report an Issue flow in the Maps app, you can also use <https://feedbackassistant.apple.com/|Feedback Assistant> to report your issue. If you do that, feel free to drop the feedback ID here in chat so we can follow up on it. Thanks!

--- 
> ####  When I look up MapKit's SwiftUI `Map` View in the beta developer documentation, and show API changes; no changes are shown. Have there not been any functional additions to `Map` this year, or are they maybe not being 'surfaced' by the documentation API changes feature, or?


|U03HA09MXN3|:
Hi Michael, Thanks for your question!

While the SwiftUI API has not changed this year, the all-new map is available to SwiftUI apps just the same. All that’s needed is to build with the new SDK.

To use more of the new MapKit API, you will need to use `MKMapView` via `UIViewRepresentable`. Read more here: <https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit>

--- 
> ####  I noticed you're deprecating MKPinAnnotationView. We're still using it because they work better for many annotations in a small regions. We'd love to move to marker annotations though. For that we need the smaller marker annotations that collapse down to a small point depending on the zoom level, as used in Maps app. How can we achieve this using MapKit?


|U03HQH9U3BL|:
Hi Ortwin - Thanks for the question(s).

1 - You could leverage a custom `MKAnnotationView` instead of `MKPinAnnotationView`.

2 - Regarding the following - `smaller marker annotations that collapse down to a small point depending on the zoom level, as used in Maps app`.

Please file an enhancement request via Feedback Assistant (<https://feedbackassistant.apple.com/>).
If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.

|U03J4J6MMK8|:
Thanks, we'll look into it. I've logged FB10143146 (small marker annotation).

--- 
> ####  Previously, when using MKDirections, if I started a route with coordinates from a point on one side of a motorway/highway (i.e. the northbound side), to a destination that was physically closer to the other side of the motorway (i.e. the southbound side): often the returned route would route from the (incorrect) physically-nearest side of the motorway.   It's been a few months since I last tried, but: is there anything you can think of that I can do to get MKDirections to start from the specific point provided? (More decimal places on the coordinates? :man-shrugging::skin-tone-3:)


|U03HA09MXN3|:
Hi Michael, do you have a specific use case which requires routing from one side of the highway to the other side?

|U03HA09MXN3|:
It would be great if you could provide some more context, to help us understand the problem

|U03JEEUJPMJ|:
I was working on a route planner for road trips, which would involve adding stops for, among other things, EV charging.  My logic was to follow the overall road trip’s MKRoute polyline, then - when I knew the user’s vehicle would be low on energy - find (from external APIs) a handful of the nearest known-reliable rapid-charging stations.

Here in the UK, most motorway services have a site either side of the motorway; and each site has charging stations.

However: the *physically-closest* (as a bird flies) charging station is sometimes on the /other side/ of the motorway (e.g. southbound services, even though the user is driving northbound), and would actually require tens of miles of additional driving, coming back on oneself (to go southbound), and then doing the same thing to resume the road trip (northbound).

So, I figured I’d run MKDirections on each of the handful of stations nearby, to get the *actual* closest stations, based on driving distance and driving time.

However, because MapKit would begin the route from the closest side of the motorway seemingly each time, this wasn’t doable.

(Hopefully that conveys what I mean, but I realise that my explanation is inherently fairly convoluted :see_no_evil:)

|U03JEEUJPMJ|:
Correction: “However, because MapKit would begin each route from [the side of the motorway physically-closest to each charging station]  seemingly each time, this wasn’t doable.”

|U03HA09MXN3|:
Thanks for the additional context!

|U03HA09MXN3|:
We’ll have to look into this some more. Would you mind filing a feedback report?

--- 
> ####  Hello apple, my app need show thousands annotations on map, but when about 10k annotations on map, the map will memory leak and crash, how to resolve this problem?


|U03J7M8F7CJ|:
Good question

|U03KJSLF04Q|:
Server-side clustering?

|U03J7M8F7CJ|:
Could also be done locally with ClusterAnnotion...

<@U03KJSLF04Q> But sometimes you need to show all annotations.
I have e.g. an watch app that uses a map with annotations to show a route (polylines are not supported on watchOS Map). I have approx. 100 annotations on the map and it still leaking memory

--- 
> ####  Hello! Is there are reason why the maps shown in outdoor workouts are now rendered with black backgrounds? This started after Dark Mode was introduced, but it is difficult to see details in a dark background map. And when this was done we were only left with satellite views as alternatives. Is there a way to toggle the maps back to light backgrounds? Thanks in advance!


|U03HJ92ED6W|:
<@U03J21EKNSE> That’s a great question for the folks on the fitness team! Head over to the <https://developer.apple.com/wwdc22/110415|Heath and fitness technologies Q&amp;A> running now!

|U03J21EKNSE|:
Thank you, I have submitted the question there. I submitted here too in case there were people working in both teams! No takers yet; fingers crossed for a reply!

|U03J21EKNSE|:
Success! Chris T (Apple) told me to go to the iPhone’s Health app, and go to Browse -&gt; Activity -&gt; Workouts -&gt; Show All Workout Routes. It was easier earlier, but it’s better than just having a dark background map. Have a good day!

|U03J21EKNSE|:
FYI: I filed a feedback document to suggest adding the light background to the dark/satellite view choices (we can always hope!): FB <tel:10161742|10161742>. Thanks again!

--- 
> ####  Are there any improvements in Maps for watchOS?


|U03HQH9U3BL|:
Hi - Thanks for the question.

This year we focused on expanding our features on various other platforms which can be viewed at <https://developer.apple.com/videos/play/wwdc2022/10035/>. While we are continuously working on enriching our features, we are always listening for feedback. Are there specific improvements you are looking for Maps on watchOS?

Please file an enhancement request via <https://feedbackassistant.apple.com/|Feedback Assistant>.
If possible, please describe both your technical requirements and a description of your use case so we can better serve your needs.

Feel free to provide a feedback ID in this thread so that we can reference it later.
