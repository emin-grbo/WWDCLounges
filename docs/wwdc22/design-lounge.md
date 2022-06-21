# design-lounge QAs
### Lounge Contributors

---

--- 
> ####  what are the next challenges you're working on tackling for SF Symbols?


--- 
> ####  What design program do you prefer for creating the symbol paths...Sketch, Illustrator or something else?


|Mike S - from Design Evangelism (Apple)|:
For custom symbols, I prefer using Illustrator. But Sketch works well too

|Mike S - from Design Evangelism (Apple)|:
Illustrator’s blending tools are helpfull

|U03JEKW67KJ|:
For variable templates that will use interpolation, I personally like to nudge points around in a font editor before going back to Illustrator, this way I get more info on the number of points and the point order

|U03HA9EC4T1|:
Illustrator and Glyphs 3

|U03JDV4PQR0|:
<@U03JEKW67KJ> Interesting. I’ve never used a font editor, do you have a recommendation? Getting points correct for interpolation an issue I ran into with Sketch.

|U03JEKW67KJ|:
I’ve used Glyphs3 (Glyphs App) same as Lance mentioned, but other popular font editors include RoboFont and FontLab. All have fairly good documentation (and forums) so you should be able to get up and running quickly

--- 
> ####  When would we be able to see variable fonts come to the SF Font Family? It would be awesome to have this along with SF Symbols.


|U03HLJY8FRA|:
The SF Pro and SF Compact fonts that are installed with the SF Symbols app are variable!

|Mike S - from Design Evangelism (Apple)|:
BTW, SF Symbols 4 and the updated fonts should be going live this morning.

|U03J1UQCFGB|:
They are :slightly_smiling_face:

|U03JENZF5S5|:
Out of curiosity, the new SF Symbol variable colors for values from zero-to-one (like volume and signal strength symbols)... are those implemented as a variable font axis?

|U03HLJY8FRA|:
Variable color is not available in the fonts, unfortunately. For showing different rendering modes and variable color in design comps, we recommend using the `Edit &gt; Copy Image`

|U03JENZF5S5|:
Thanks, Paul!

|U03JZNY81L0|:
Fonts are live!

--- 
> ####  After creating a new custom symbol, how do we add it to our app? Is it like any other SF Symbol?


|U03HLJY8FRA|:
After you've made and annotated your symbol in the app, choose File &gt; Export Symbol... and bring the resulting SVG into an Xcode asset catalog. Then, you can access it like other embedded images.

|U03JRP87THN|:
Thank you very much!

--- 
> ####  Hi! Is there any limit of layers a symbol can have?


|U03HLJY8FRA|:
There's not a hard-set limit in the app.

|U03HQSKKXR8|:
There isn’t a limit for practical purposes in the template either.

--- 
> ####  Is there a way to transfer your own custom symbols with all the settings between different Mac's or pass it to other co-designers?


|U03HLJY8FRA|:
The file created when you choose File &gt; Export Symbol... can be shared with other people. It can be imported back in to the SF Symbols app and should preserve all of the annotations, too!

|U03HVFJUN14|:
Oh nice, so it’s basically an SVG that’s on steroids. :smile: Or is it a different file format?

|U03JEKW67KJ|:
Yep, File &gt; Export Symbol will give you an SVG. If you plan on sharing it with other designers it’s best to export the latest version (4.0) so that new features like monochrome layers + variable color are included

|U03HVFJUN14|:
Awesome. Thanks a lot for! :pray::slightly_smiling_face:

|U03HLJY8FRA|:
We don't recommend editing the SVGs that come out of the `File &gt; Export Symbol...`  option, however, they're just intended for data delivery. The recommended workflow is to use `File &gt; Export Template...` if you want to edit the shape of the symbol, bring that template back into the SF Symbols app, do your annotation within the app, and then use `File &gt; Export Symbol...` for delivery.

--- 
> ####  Any tips for creating SVG files that will work well with this? E.g. should we avoid internal groups, etc...


|U03J3FV12KB|:
There are some great tips in the Human Interface Guidlines:

|U03J3FV12KB|:
<https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/>

|U03J3FV12KB|:
Check out the section titled "Creating Custom Symbols"

|U03J5P9M6R3|:
will do, thank you!

--- 
> ####  Is it possible to assign colors dynamically to SF Symbols rendering in multicolor mode?


|U03J3FPKF7B|:
Multicolor rendering mode uses the colors assigned to the symbol by the designer. Use palette mode to use a dynamic set of colors.

|U03HLJY8FRA|:
There are some parts of symbols in multicolor that are still controlled by colors you specify, however. For example, `folder.fill.badge.plus` in multicolor will keep the badge's colors locked to green and white, but you still have control over the color of the folder.

|U03J4BG14R2|:
Is it possible to dynamically assign multiple colors to the symbol rendering in palette mode?

|U03J3FPKF7B|:
Yes. SwiftUI allows multiple foreground styles, and AppKit &amp; UIKit allow an array of colors for palette mode

|U03J4BG14R2|:
Amazing! Thanks for answering I will do some reading on how to do it

|U03J3FPKF7B|:
The API for AppKit/UIKit is `configurationWithPaletteColors:` which takes an array of colors

|U03JEKW67KJ|:
And in SwiftUI what you want is the `.foregroundStyle` modifier:
<https://developer.apple.com/documentation/swiftui/view/foregroundstyle(_:)>

--- 
> ####  When creating new symbols, what criteria is followed? I’ve wanted to make custom symbols before but want it to match with the rest of the rest of the SF Symbol catalog.


|Mike S - from Design Evangelism (Apple)|:
Awesome, we have Thalia here to answer this.

|Mike S - from Design Evangelism (Apple)|:
I’m sure it might take a minute to compose her many thoughts…

|U03J814M5MW|:
I would start with looking at the symbols in the context of other symbols. For example, if you are drawing a symbol about astronomy, you would want to looks at symbols that are lated like the moon, stars, etc.

|U03J814M5MW|:
From there, I would start by defining the proportions, not too wide, not too tall, all related to the other symbols.

|U03J814M5MW|:
And next I'll try to match the stroke thickness, roundness of the shapes, angles. It all depends on what you are trying to draw.

|U03J814M5MW|:
Let's say you need a telescope. Then I'll probably try to match some of the angles of other symbols.

|U03J814M5MW|:
It's about looking at the context and iterating to get the best results. It's also good to look at the symbol in small and big sizes, to craft the best drawing possible for all scenarios.

|U03HA9EC4T1|:
Matching the line weight within SF Symbols is a good metric to follow. Also, referencing the scale and alignment of SF Symbols for shapes that are similar to what you are trying to make is a good place to start. For example, if your custom symbol is circular, scale it similar to a circle in SF Symbols.

--- 
> ####  Are there any books you'd recommend reading regarding topics like typography, color theory, grid designs, and anything else regarding mobile UI design?


|Mike S - from Design Evangelism (Apple)|:
Grid systems: Grid system - josef müller brockmann

|Linda D - Design Evangelist|:
The Elements of Typographic Style!

|U03DJTBMVRT|:
The 1923 ATF Catalog and Specimen book!

|U03J814M5MW|:
Interaction of Color if one of my fav books!

--- 
> ####  How would you convince a product team to adopt SF Symbols that already has a wide array of their own custom icons?


|Linda D - Design Evangelist|:
<@U03HLJY8FRA>?

|Mike S - from Design Evangelism (Apple)|:
But do their symbols have variable color support?!

|Mike S - from Design Evangelism (Apple)|:
A big advantage is that there are so many symbols to choose from so extending the library is easy. And also the way symbols are designed to work with text (font weight matching, small and large variants). Right to left support

|U03HLJY8FRA|:
As I said in the talk last year, the kind of design that requires no additional work from me is the *best* kind of design! :stuck_out_tongue_closed_eyes:

But really, the team has been working on SF Symbols as a way to help people make apps that look fantastic and blend seamlessly with the rest of Apple platforms. Even *more* importantly, SF Symbols are also designed with accessibility and inclusivity in mind. They react to things like Dynamic Type and Increased Contrast automatically, which is a big win for users of your app.

|U03HA9EC4T1|:
Symbols offer many benefits: visual craft and integration with the system font, accessibility features including localized variants for many languages and scripts. Familiarity with users across the platforms. Smaller app footprint.

--- 
> ####  I think it was last year the .square and .circle modifier were added for some symbols. Is there a chance that will become and option for all symbols including custom symbols? :grimacing: I ended up creating square variants for a lot of our custom symbols last year and it was super tedious.


|Mike S - from Design Evangelism (Apple)|:
Hi Emile, we have this policy where we don’t talk about future products. :slightly_smiling_face:

|U03JDV4PQR0|:
It was worth a shot :rolling_on_the_floor_laughing: Maybe a seed was planted.

|Sarah M - Design Evangelist|:
Hi <@U03JDV4PQR0>, happy to see you’re here!!

|U03JDV4PQR0|:
Hello!!!! I hope you are well!

|U03JEKW67KJ|:
For these sorts of things we always encourage capturing your use case + request in a bug via Feedback Assistant:
<https://feedbackassistant.apple.com/>

|U03J211JCKU|:
Will do.

--- 
> ####  Will there ever be a Clarus the DogCow SF Symbol? :D


|Mike S - from Design Evangelism (Apple)|:
Moof?

|Linda D - Design Evangelist|:
Moof.

|Mike S - from Design Evangelism (Apple)|:
:dog::cow2:

|U03HVE4TV8E|:
MOOF!

|U03HLJY8FRA|:
Moof, definitely.

|U03J3FV12KB|:
~ Moof ~

|U03J3FPKF7B|:
Moof

|U03HJ8DAEMC|:
Moof!

|Mike S - from Design Evangelism (Apple)|:
Moof!!! Moof!!!

|U03J814M5MW|:
Mooooooooof!

|U03HVE4TV8E|:
Omg this is amazing! :sweat_smile::joy:

|U03HA9EC4T1|:
See if you can spot Clarus: <https://www.wallpaper.com/design/apple-park-behind-the-scenes-design-team-interview>

|U03HKV4V1FW|:
Moof?

|U03HVE4TV8E|:
Found it! Love all the vintage Mac icons!

|U03JNAGPDS6|:
Found it!

|U03HVE4TV8E|:
So is there a clarus hidden within the SF Symbols app?!?! :face_with_monocle::face_with_monocle:

|U03HVE4TV8E|:
The Great Moof Mystery of WWDC22

|Mike S - from Design Evangelism (Apple)|:
I’m still looking for that <@U03HA9EC4T1>!

|Mike S - from Design Evangelism (Apple)|:
I need glasses I think

|U03JELQLESV|:
I only get this because I was randomly watching this the other day (linked to the relevant timestamp)

<https://youtu.be/2bewvHiWLYA?t=927>

--- 
> ####  Can we use SF or SF Symbols in other, non-Apple related projects or are we limited to Apple platforms? Thanks :blush: 


|Mike S - from Design Evangelism (Apple)|:
Hi Sean, only for software running on Apple Platforms

|U03HA9EC4T1|:
SF Symbols are for Apple platforms only.

|U03HVE4TV8E|:
Great thanks! :grinning:

|U03HQSKKXR8|:
SF Symbols as you have seen are very dynamic. This functionality is implemented by Apple’s OSs. So besides the restriction, it isn’t practical.

--- 
> ####  Paul, what are some similarities between solving Rubik's Cubes and working on the SF Symbols app?


|Mike S - from Design Evangelism (Apple)|:
<@U03HLJY8FRA> Got an answer here?

|Mike S - from Design Evangelism (Apple)|:
<@U03J3FV12KB>?

|U03JELQLESV|:
Anyone is welcome to answer this pressing question.

|Mike S - from Design Evangelism (Apple)|:
I don’t do either so my answer is that it seems like a lot of work. LOL

|U03HLJY8FRA|:
Lots of colors, lots of moving pieces, but in the end it all comes together to make something completely unified!

|U03HLJY8FRA|:
(how's THAT for deep)

|Mike S - from Design Evangelism (Apple)|:
Wow Paul, real deep. :slightly_smiling_face:

|Mike S - from Design Evangelism (Apple)|:
That sounds like a nice way to bring this study hall to an end…

--- 
> ####  Not really related to the session, but are we allowed to export and use SF Symbols in a cross platform app (e.g. an app for Windows/Linux/Mac), or are the symbols only allowed for use on Apple platforms? 


|U03J3FV12KB|:
SF Symbols are for Apple platforms only.

|U03HMBY0SDV|:
Okay, thanks

--- 
> ####  Hey! Thanks for the epic video! Is there anyway to use new symbols from iOS 16 in iOS 15 and below? Thanks :grinning:


|U03HLJY8FRA|:
It's possible to export a new symbol using `File &gt; Export Symbol...` and bring that into your app to support lower deployment targets. Remember to adjust the symbol version accordingly, though! 3.0 for last year's releases and 2.0 for the year before that.

|U03J3FVDR97|:
Note that you can still use the latest template format (4.0) with custom symbols even when deploying to earlier deployment targets as long as you are using Xcode 14 to compile your app.  Naturally, the new content features won't be present on those earlier releases, so you need to be careful about which template content features you use.  Safest of course is to just export with the older template versions as Paul recommends.

--- 
> ####  I’d love to hear more about what it was like working on this massive update to SF Symbols. How do you go about figuring out which symbols to choose? Is there a lot of collaboration across teams within Apple for such projects? Also: amazing work!


|U03J814M5MW|:
I think I can answer the second part of the question only :wink: but yes, there is definitely a lot of collaboration between teams to define what are the best symbols and design that fit best in the UIs. We want to make the symbols as good as possible, so there is a lot of iterations too!

|U03JRQ62JQY|:
I can’t imagine the amount of work it must take when the library is so huge and each symbol is so carefully crafted. Thanks for your answer!

|U03HLJY8FRA|:
There's also an incredible amount of work that comes in from the frameworks and platform engineering sides to support all these new features like Variable Color and different rendering modes!

|U03HA9EC4T1|:
For adding new symbols: it’s a combination of supporting new platform features, adopting symbols for existing features and identifying concepts that have broad utility and application across a variety of apps and contexts.

|U03JRQ62JQY|:
Thanks so much for your replies, everyone! I _super_ appreciate all of your hard work! :heart:

--- 
> ####  SF Symbols are underrated, they really make designing an effective UI a lot easier. Great work with the new updates! It would be awesome to see collections expanded to an in app feature to allow users to pick from a set (like in the Reminders app). Unless this already exists and I am unaware :grin:


|U03J3FV12KB|:
Thank you. We don't offer that feature, but thanks for feedback!

--- 
> ####  Are there ways we can submit icons for consideration as additions to future updates of SF Symbols and/or is there a place we can share our custom icons with the wider developer community?


|Mike S - from Design Evangelism (Apple)|:
Absolutely. Use Feedback Assistant. Requests get routed right to the team for consideration

|Mike S - from Design Evangelism (Apple)|:
It’s been a very helpful way to learn about what symbols developers most want.

|U03J20D4Q03|:
Great, thank you! I work on a lot of medical/health apps that would benefit from SF symbols.

|U03JELQLESV|:
My Feedback Assistant request for a tennis ball from 2020 is still open, but I'm stoked to see new symbols for a tennis racket and a player serving!

|U03J9D6803X|:
I think a differentiated experience from Feedback Assistant for SF Symbols feedback would be helpful.  There would probably be a lot more involvement from the community.

--- 
> ####  I may have missed this in the SF Symbols video, but I was wondering: how do these new rendering modes interact with WidgetKit rendering using the new lock screen widget layouts like .accessoryCircular etc?


|U03J3FV12KB|:
Great question. For consistency, we suggest using monochrome, hierarchical, or automatic, but WidgetKit may not actually end up enforcing that in the betas.

|U03J3FV12KB|:
We also welcome your feedback on WidgetKit and SF Symbols in general as you get a chance to use them together. We learn from you, too!

--- 
> ####  Not a question, just a thanks for adding symbols that represent HomeKit objects. Was hoping for those since SF Symbols was introduced.


|U03J814M5MW|:
YAY! :heart:

|U03HMESB695|:
Really means a lot to the HomeKit community as they mean most apps will end up using similar icons now.

--- 
> ####  Do variable colors animate automatically when changed?


|Mike S - from Design Evangelism (Apple)|:
Hi <@U03JBMMB10A> can you elaborate a bit?

|U03HLJY8FRA|:
There isn't any animation when the variable color percentage changes and causes a layer to "dim" or "un-dim." The change appears instantly.

|U03JBMMB10A|:
Okay, thank you.

|U03HA9EC4T1|:
The path color will instantly change according to the corresponding percentage value.

|U03J3FVDR97|:
Using variable colors does not automatically animate across the visual states. However it is entirely possible to add animation to Symbol just as you would to other UI Images using the UI framework animation facilities of your choice.

|U03JBMMB10A|:
Right, thank y’all!

--- 
> ####  Thank you for the new HIG! Especially appreciate that it starts from UI elements and themes and then mentions platform considerations, instead of being branched off into different platforms only.   Are there good examples that come to mind of intentionally breaking the HIG for good reason (after knowing it well)?


|Linda D - Design Evangelist|:
Great question! I think that starts coming down to the customization you'd love to do for the app. For example there's no hard and fast rule that you *have* to use SF Symbols, or Apple Typefaces or a specific aesthetic for your app (and that's even more true for games).

Think of the HIG as a great "base" for what you're doing, and tailor the guidance based on what makes the most sense for your users!

|Linda D - Design Evangelist|:
<@U03HJ86L1BL>’s also done a great job at wording the language of the HIG so we rarely ever say "don't" or "never" unless that's really true.

--- 
> ####  What are the key changes in the advice being given in the revised HIG, if any?


|Mike S - from Design Evangelism (Apple)|:
Hey Duncan, a lot of the content in the HIG carries through from previous versions. But a lot of the older content was adjusted for clarity and we removed things that no longer seemed all that relevant. It’s hard to go through all the specifics but pretty much every page needed to be edited.

|Mike S - from Design Evangelism (Apple)|:
We also started adding in new guidance for iOS 16, macOS Ventura, and watchOS 9 (though there’s still a lot more coming this summer

|Mike S - from Design Evangelism (Apple)|:
One example I recall was the Buttons page. There was content in there about placard buttons and bezel buttons but those really aren’t used these days

|Mike S - from Design Evangelism (Apple)|:
We also removed some of the content about full color icons in toolbars, for example, since that’s not something modern apps do all that much of.

|U03HJ86L1BL|:
Another key change is in perspective: Rather than starting with guidance for an iOS experience, the revised HIG encourages designing the experience first and then adjusting it as needed to run great on each platform.

|Mike S - from Design Evangelism (Apple)|:
We added a lot of new information in the Patterns section for things like Searching or Sharing. That kind of content was spread out in component pages previously and missed a lot of important information and context when it was tied to specific controls

--- 
> ####  First off, congrats on the new HIG! I love how much more comprehensive it is. What are best practices when designing an app that is cross platform? Should the app design's adapt to the respective OS' design guidelines e.g. HIG on iOS, Material You on Android, and Fluent on Windows, or stick with one for a consistent user experience across different platforms (even though it might look slightly out of place depending on the OS)?


|Mike S - from Design Evangelism (Apple)|:
The best approach is to follow the relevant platform conventions. Many of them exist because of how the hardware functions. So ignoring that leads to software that feels disconnected from the hardware.

|U03JELQLESV|:
I also wonder to what extent it's applicable to the web, especially considering seeing more web apps coming from Apple!

|Mike S - from Design Evangelism (Apple)|:
Apps that are designed once for all platforms will never feel right everywhere

|Mike S - from Design Evangelism (Apple)|:
It does apply, there are differences in conventions between web and apps.

|Mike S - from Design Evangelism (Apple)|:
Some of the difference are pretty easy to address. Like not using “Click this button” in an app that only runs on touch screen devices

|Linda D - Design Evangelist|:
^ huge pet peeve! Also Android and iOS differ a lot in how "back" functionality works for example. So making sure that the design patterns follow system conventions helps quite a bit to not make your app feel like it's alien to the platform

|U03J20D4Q03|:
Thanks for the insight, <@U03HBJXV0TY> and <@U03DMQBFPH8>! They are really helpful. I'll definitely share them with my team who insists on having the same design across different platforms (hamburger menus and FABs everywhere!)

|Linda D - Design Evangelist|:
Look I love a good FAB but only when I've designed for Android in the past! Thanks for the question <@U03J20D4Q03> hope that helps because yes, you can be 80%-90% consistent where you can but those platform details matter

--- 
> ####  I'd love to know more about the process of evolving the HIG.  How do you identify things that feel out of date and less relevant, as well as spotting new design trends within Apple that you feel need documenting?


|U03H3HNAGSK|:
This is a great question. Multiple things influence this. One is our work (in evangelism) with developers. Questions that we get during this work can often spark ideas for new areas of guidance, or new details to add to pages

|U03H3HNAGSK|:
Another thing that influences the HIG is the work of our design and engineering teams, naturally. As the platforms evolve, there are needs to overhaul pages, or whole sections, to match the direction of the platform (or multiple platforms)

|Linda D - Design Evangelist|:
+1 to what Doug said! We talk with so many designers throughout the year and for this particular redesign we reached out specifically to the community to get input on where we could improve the HIG.

|U03H3HNAGSK|:
I am resisting the urge to point out the various sections that are in need of work now, although I’d like to illustrate the point I’m making by doing so

--- 
> ####  What’s stayed the same in the HIG over the past decades?


|U03HJ86L1BL|:
Although many details have changed, I think it's the keen focus on keeping the user experience at the center of design that's at the heart of the HIG, from the earliest days to the present.

|Linda D - Design Evangelist|:
Yes the earliest HIG (I believe from 1977???) continually emphasized the human nature of computers. How computer should conform to people and not the other way around. We are still very much firm believers of this, but with more nuance on what that means ergonomically, inclusively, as a holistic experience.

--- 
> ####  Were there any topics/areas that were completely, or mostly rewritten? Any specific portions that you are most proud of that you'd really like to call out?


|U03JMGRA538|:
I haven't had time to dig in as much as I'd like to yet, but at just the bit I have it looks really fantastic! Miss seeing you folks btw, sad I wasn't able to make it out this year :slightly_smiling_face:

|Linda D - Design Evangelist|:
That's a great question! I want to say that almost every section was rewritten to take out old, missing, or revised guidance :sweat_smile: It was a huge haul.

Two sections that I personally love:

|Linda D - Design Evangelist|:
<https://developer.apple.com/design/human-interface-guidelines/foundations/inclusion|Inclusion: >We're SO happy this page is here because it speaks not only to good design guidance but our values
<https://developer.apple.com/design/human-interface-guidelines/platforms/overview|The new Platform pages: >These are brand spanking new and give a nice overview of "getting started with designing for [ios/mac/etc]" that also speak to how many people use these devices and the considerations you need to have.

|U03JMGRA538|:
&gt; that were completely, or mostly rewritten
I should clarify this, I guess what I'm wondering is  if there are areas where in the rewrites the guidance has fully changed overall, rather than clarified or revised.

|U03JMGRA538|:
The platform pages look great btw and I would imagine it's going to be super helpful for a lot of folks to have those as starting points :heart:

|U03HJ86L1BL|:
Because we were working with content that ranged in age from months to more than a decade (in a few cases), I'm certain that there were places where in rewriting, we made significant changes to the guidance. But honestly, I'm not sure I can point to specific ones offhand! :face_with_monocle:

--- 
> ####  Hi, nice work on the redesign, I've been going through it this morning! I have a question about color.  On this page: <https://developer.apple.com/design/human-interface-guidelines/foundations/dark-mode|https://developer.apple.com/design/human-interface-guidelines/foundations/dark-mode> there's the advice "At a minimum, make sure the contrast ratio between colors is no lower than 4.5:1. For custom foreground and background colors, strive for a contrast ratio of 7:1, especially in small text."  I aim for high contrast as much as possible, but 4.5:1 is pretty limiting, and I don't think Apple always follows this rule themselves. Specifically I'm wondering about the systemColors such as systemOrange, systemMint etc, many of which have quite low contrast against white (i.e., in Light Mode). What is the intended purpose of these colours? Is it meant for text/SF Symbols? Because if so, systemMint comes in at 2.02:1 against white. Should we ever even use systemYellow? Or can we just rely on users turning on Increase Contrast if they need to? But maybe someone doesn't want to have to increase contrast for everything just so they can see that darn yellow text.  Any insight on the intended use of these systemColors would be greatly appreciated. Thanks!


|Mike S - from Design Evangelism (Apple)|:
Awesome questions Jessiah! I could take the next 45 minutes trying to answer. :slightly_smiling_face:

|Mike S - from Design Evangelism (Apple)|:
In short, the rules about color contrast are a bit tricky, it’s not black and white (forgive the pun)

|Mike S - from Design Evangelism (Apple)|:
Higher contrast is always better but there are mitigating circumstances that make it OK to have lower contrast. For example, text size. The larger or bolder the font, the easier it is to read given the same color value

|Mike S - from Design Evangelism (Apple)|:
But a color choice that works for large type can be too low contrast for smaller text.

|Mike S - from Design Evangelism (Apple)|:
The same applies for icons or glyphs (symbols): Finer features are harder to naturally harder to discern so boosting contrast is useful

|Mike S - from Design Evangelism (Apple)|:
As for system colors, they don’t all work equally well in every circumstance. Orange or mint on a light background probably isn’t the best choice. Definitely not as legible as blue or purple

|U03J1EHL4KY|:
Yeah I was wondering about the Notes app, it looks like some darkening is being applied to the tint colour in this case, rather than using the default system color?

|U03J1EHL4KY|:
to

|U03JK302NRH|:
I’ve worked on products where I had to incorporate colours that are notoriously difficult to have high contrast - like teal/green.

In those instances i’ve provided darker versions, that are perhaps not so aesthetically pleasing, but pass AA/AAA to assist visually impaired users once they enable accessible system settings. It has worked for me :heart:

|U03J1EHL4KY|:
Yeah for our app which uses orange tint, we’ve used our own custom orange for light mode, and only use the sytemOrange for dark mode

|U03J23RAFK4|:
My personal guide when designing is to make all elements that need to be legible and clear have strong contrast. Details like a divider, for example, can be lighter to convey less prominence. But text should always be readable and accessible.

|Linda D - Design Evangelist|:
I also feel like I could spend the next hour speaking about this :sweat_smile: so GREAT question. As you might know, the 4.5:1 contrast ratio comes from WCAG 2.0 guidelines. While WCAG 3.0 is still not officially "out" they have an improved way of calculating contrast that I find incredibly interesting: <https://www.w3.org/TR/wcag-3.0/#visual-contrast-of-text>

|U03J1EHL4KY|:
nice I’ll take a look :thumbsup:

|U03J1EHL4KY|:
I’m imagining a future accessibility feature that allows you to increase contrast per colour :stuck_out_tongue: :wink:

|U03J1EHL4KY|:
or colour range

|Mike S - from Design Evangelism (Apple)|:
Hahahahah, yes <@U03J1EHL4KY> Providing high-contrast colors in the asset catalog is a good thing. :slightly_smiling_face: We do have some technical solutions after all. And of course the system colors provide high-contrast colors for free

--- 
> ####  When filing feedback related to the HIG in Feedback Assistant, should it be under the “documentation” category or “design resources”?


|U03HJ86L1BL|:
First of all, thank you SO much for filing feedback!! For the HIG, please use the "documentation" category; for issues or requests related to Apple Design Resources, please use the "design resources" category.

--- 
> ####  How do ADA-winning apps balance the best practices and standards in the HIG with the novelty that makes them...well...ADA-winning?


|U03H3HNAGSK|:
Well you hit on the two, sometimes opposing, forces that define ADA winners

|U03H3HNAGSK|:
In my view, an ADA winner has to embody the spirit of the HIG, even if there are details that might not conform to the letter of the HIG

|U03H3HNAGSK|:
But an equally important thing is the voice, or personality, of the app

|U03H3HNAGSK|:
The categories that we introduced last year (2021) try to add a bit more substance and clarity around the qualities that define winning apps

|U03JJD6G79B|:
<@U03H3HNAGSK> Can you elaborate on the voice/personality please?

|U03H3HNAGSK|:
Yeah, fair question

|U03H3HNAGSK|:
I guess I just see those terms as representing two things — (1) a cohesiveness across the app — the app feels like a single experience, and is internally consistent, and (2) the app has a character or look or feel that is memorable

|U03JJD6G79B|:
Ohhh I think I gotcha, like how Carrot Weather uses satire and the robotic voice to strengthen the personality of the app’s narrator?

|Linda D - Design Evangelist|:
Yes there's being consistent with the platform experience, and then there's taking that to the next level by differentiating your app/game as a stellar example of one of our categories. That means you don't necessarily need a visually-heavy custom branded app but you offer something by way of your design/UX that sets you apart (I'm thinking Slopes here as a great example of this)

--- 
> ####  Could you elaborate on any user research (quantitive or qualitative) processes the team uses to shape HIG guidelines?


|Mike S - from Design Evangelism (Apple)|:
(These questions are good!)

|Mike S - from Design Evangelism (Apple)|:
We meet with developers to ask them for feedback on existing content (qualitative). We also regularly talk with developers throughout the year about their apps and, in those conversations, common questions come up that we realize we haven’t really answered in the HIG (or videos). So those turn into ideas about how we can improve the HIG.

|Mike S - from Design Evangelism (Apple)|:
And the HIG is really a massive collective effort involving design and engineering teams throughout Apple. This HIG is the product of internal experiences where people had misconceptions or questions during the design process that we anticipate designer and developers will have once we ship new features.

|U03JMEET43F|:
Does the team do any old school, Bruce Tognazzini-style quantitative experiments when designing new features? I’m thinking of the equivalent of Fitts’s Law, but for touch.

|Linda D - Design Evangelist|:
<@U03JCS2C03Z> Depends on the team! We always nerded out about that and other things (catmull rom) on the Prototyping team, but other teams keep their process more intuitive/empathy-based vs. scientific

--- 
> ####  Is the latest version of the HIG the first time I've seen Apple adopt sentence case for headings?! :smile:


|Linda D - Design Evangelist|:
Ha! Nice catch :smile: We also use sentence-casing throughout the developer app

|Mike S - from Design Evangelism (Apple)|:
Love the attention to detail!

|Mike S - from Design Evangelism (Apple)|:
Also WWDC videos

|Mike S - from Design Evangelism (Apple)|:
It’s the future!

|U03HMCT187R|:
I’m sure this is in the HIG if so :grin: but figured it may be worth asking, are yall changing recommendations for when to use title-case vs sentence-case? :eyes:

--- 
> ####  A web based HIG is great as documentation but right now—wanting to read the entire revised HIG—I want to reach for an ePUB that would keep track of where I’m up to, and lead me linearly from start to finish, to ensure I read the whole thing. Is an ePUB available, or is there another solution for this use case?


|Linda D - Design Evangelist|:
Thanks for the question! Could you submit this idea using <http://feedbackassistant.apple.com>? Right now there isn't mostly because we've found folks stop by the HIG because they're looking for specific documentation vs. reading it like a whole book.

|U03J20D4Q03|:
Yes, I agree! I would love it if there were an ePUB or Apple Books version of the HIG, like the one for the Apple Style Guide. Great for offline and bedtime reading!

|U03J23RAFK4|:
A physical HIG book would be some nice swag! I know it's a living document though :grinning:

|U03HMCT187R|:
HIG used to be available in iBooks! Back when it was separate for OS X vs iOS. Still have em in my Library. It’s reallllly nice being able to use the search feature.

|U03HMCT187R|:
And I added the original HIG from a PDF too :heart:

|Linda D - Design Evangelist|:
I have some of the old HIG books in front of me!

|U03J4D1FEP6|:
FB10108496: Provide a mechanism to keep track of progress in reading the whole HIG

|U03J4D1FEP6|:
^ in which I quickly argue for either progress indicators and “Next” links at the bottom of each page on the web version, or an ePub version, and do so quickly in the hopes of linking the FB number here before the lounge closes. :partying_face:

|U03J4D1FEP6|:
<@U03HMCT187R> I included the superior search options in an ePub btw. Great point.

--- 
> ####  Not a question but I LOVE the new HIG redesign!!!


|Linda D - Design Evangelist|:
Not an answer but THANK YOU! - from all of us

--- 
> ####  Hi there! Amazing work on the design guidelines. How can I measure contrast in my apps?


|Mike S - from Design Evangelism (Apple)|:
Thank you so much!

|Mike S - from Design Evangelism (Apple)|:
There are good tools online for measuring color contrast. Searching for “color contrast calculator” will return good results

|Mike S - from Design Evangelism (Apple)|:
<https://coolors.co/contrast-checker/112a46-acc8e5>

|Mike S - from Design Evangelism (Apple)|:
<https://colourcontrast.cc>

|Mike S - from Design Evangelism (Apple)|:
<https://contrast-ratio.com>

|U03JRP87THN|:
Thank you very much, and again, amazing work on the HIG!

|Linda D - Design Evangelist|:
You're listing the nice looking ones – I've always used this:  :sweat_smile: <https://webaim.org/resources/contrastchecker/>

|Mike S - from Design Evangelism (Apple)|:
LOL

|Mike S - from Design Evangelism (Apple)|:
Yes, it’s true, I only picked the nice looking ones.

|U03H3HNAGSK|:
<@U03DMQBFPH8> so funny, that’s the one I use too

|U03JRP87THN|:
It’s about design after all:sweat_smile:

|U03J1EHL4KY|:
If you use Sketch, the Stark plugin is a great in-app option

|U03HKV4V1FW|:
Xcode has a built-in Color Contrast Calculator. To open it:
1. Open the Accessibility Inspector by choosing Xcode &gt; Open Developer Tool &gt; Accessibility Inspector.
2. In Accessibility Inspector, choose Window &gt; Show Color Contrast Calculator

|U03JK302NRH|:
Cluse is also a great one

|U03JTFWKMMF|:
I love this one. It sits in the menu bar so you can use it anywhere.
<https://apps.apple.com/gb/app/contrast-color-accessibility/id1254981365?mt=12>

|U03JRQAFUKA|:
<@U03J1EHL4KY> Same with XD

|U03JMGRA538|:
I'm really hoping more tools start adding the LCH (lightness, chroma, hue) color space, it makes trying to keep similar contrast across different colors much easier since it (mostly) keeps the same perceptual contrast while just adjusting the hue.

|U03JMGRA538|:
Good article on it if anyone is a color nerd like me and wants to dig in more: <https://lea.verou.me/2020/04/lch-colors-in-css-what-why-and-how/>

|U03J1EHL4KY|:
not a color nerd but often feel like i should be :joy:

--- 
> ####  Hi, thank you for update for great HIG! Is there any design files or design system in Figma / Sketch?


|Linda D - Design Evangelist|:
<@U03HBJXV0TY> <@U03H3LD2M2T>

|U03HVQQMNCF|:
Will be released on this page?
<https://developer.apple.com/design/resources/>

|U03HVQQMNCF|:
I hope to be also in Figma. Japanese designers love to use Figma now:pleading_face:

|U03JTFWKMMF|:
The Sketch libraries are so cool - I love poking around in there to see how things are set up.
For Figma, <https://www.figma.com/@joey|Joey Banks> has become the unofficial supplier of iOS UI Kits there :wink:

|Linda D - Design Evangelist|:
So glad you shouted out Joey! He's doing great work :slightly_smiling_face:

|Linda D - Design Evangelist|:
We currently don't support Figma at this time but updates to the Sketch and XD libraries and templates are coming later this summer

|U03HVQQMNCF|:
Thank you Linda, I’m waiting for release new ones!

--- 
> ####  Hi all! The HIG for watchOS subscription paywall show buttons for T&amp;C and Privacy Policy. But we cannot open these in a website like on iOS. What is the recommended way to show these, potentially very large, text elements on the Apple Watch?


|U03H3HNAGSK|:
Hi <@U03JMMN8659>. This is a great question. The recommendation at this point is to display the T&amp;C and Privacy Policy text in (likely very long) modal sheets or detail views on watchOS

|U03H3HNAGSK|:
If you haven’t already, can you file feedback for this?

|U03JMMN8659|:
ok, thank you! :pray: will do

--- 
> ####  How long has the team been working on this huge HIG update?


|U03HJ86L1BL|:
The bulk of the work started late 2021 and ran to last Sunday or so! :sweat_smile: Seriously, this project has been our hearts for a long time and we're ecstatic to deliver this update.

|Linda D - Design Evangelist|:
hahaha, yes we've been working on it consistently for about a year now!

--- 
> ####  Firstly, congrats on such a great update to the HIG! :clap: Throughout the OS, there's often times when a temporary sheet appears at the bottom of the screen. For example, when connecting your AirPods to the iPhone - I've made my way through the guidelines and can't find any write ups about that view. Is this view actually just a "Medium sheet" that is styled differently?  I'll thread a screenshot for context


|Mike S - from Design Evangelism (Apple)|:
Hm… not sure if my reply came through. Posting again “Hi Ryan, yep, a medium height sheet is the closest system-provided element.”

|U03JE2RK60J|:
Thanks <@U03HBJXV0TY> :ok_hand:

--- 
> ####  Curious what your pov is on link buttons, specifically buttons embedded within text content on native.  There are some cases where this type of treatment can make sense and then others where it feels like we’re just pulling over from web.  Do you have any formalized process around when to use and not use this treatment?


|Mike S - from Design Evangelism (Apple)|:
Good question! My sense is that links inline commonly get overlooked because (a) not expected in apps and (b) the color distinction is often too subtle. In general they should be avoided. But there are cases where it can work. One that comes to mind are “More &gt;” links at the end of a paragraph of text where you navigate to a child view to see more. Or expand a partially revealed block of text.

|Mike S - from Design Evangelism (Apple)|:
But it’s almost always more clear to use a proper button or table row with a chevron.

|Mike S - from Design Evangelism (Apple)|:
Probably the biggest issue with link style buttons, especially when presented in context of other text, is that the tap target size is too small (not 44pt tall) so tapping accuracy is compromised

|U03J1UU7HS7|:
Thanks for the response.  Right, we’ve certainly argued from an accessibility perspective - tap targets and contrast.  The challenge is (as component devs/designers) to come up with a general alternative.  We’ve seen push back that there is an efficiency to associating an action with a verb in a sentence.  Pulling actions out to separate buttons can end up elevating them.  T&amp;C or legal section, for example.

--- 
> ####  I wanted to say that I really love the unified experience of the supported platform the updated HIG adopts.  I have recently come across a component that the native iOS Maps app uses to filter/refine searched results which I can't seem to find reference of in the HIG. I am not sure it if is a combination of a segmented controls and pull-down buttons.  Is this filtering component something that will be added to the guidelines in the near future?


|U03JL795TE2|:
This is the view I am referring to in iPadOS for Maps.

|U03H3HNAGSK|:
Hi <@U03JL795TE2>. I think I know the component that you’re talking about … It’s the bar below the string?

|U03H3HNAGSK|:
With the filter button, and the toggles?

|U03JL795TE2|:
Hi <@U03H3HNAGSK>, yes thats correct. So the filter buttons.

|U03JL795TE2|:
I had also noticed during the WWDC Keynote on Monday that the updated Home app on iOS adopts a similar component with different functionality. So my question expands to this as well.

|U03H3HNAGSK|:
Ahh, I see. Toggle-able filters / buttons. Something like this may be the beginning of a pattern that is adopted across Apple apps, or these may be one-off solutions within particular apps. From a HIG POV, there is a bit of push-pull with this. If it turns into a pattern, and if that pattern is formalized as a specific element in a framework, that is typically the criteria for arrival in the HIG

|U03H3HNAGSK|:
This is an interesting one, though.

|U03H3HNAGSK|:
Thanks for raising it.

|U03JL795TE2|:
Appreciate the feedback on this <@U03H3HNAGSK>.

|U03H3HNAGSK|:
Thanks for asking, this is a fun one

|U03H3HNAGSK|:
Makes me realize that, for a concrete control like this, the HIG is relatively conservative; something really needs to be a component that is defined in a framework to get guidance at this level. But for bigger picture, experiential things, the HIG is a bit more predictive? Or proactive?

|U03JF56NNBW|:
I've seen this type of control over the years in quite a few apps. Here is an example from Apple News on iOS 15 without the borders but works the same. Think most people understand how to use this control.

|U03JF56NNBW|:
Interestingly this has been changed in iOS 16 Beta 1 to a dropdown type control.

|U03JF56NNBW|:
Sorry correct screenshot.

--- 
> ####  Any design guidelines for EDR color on Apple platforms?


|Mike S - from Design Evangelism (Apple)|:
Mostly we just want people to add color profiles to their images. If we could do that, it’d be a huge win.

|Mike S - from Design Evangelism (Apple)|:
We don’t really have guidance specifically about EDR in the HIG. Might be some good documentation elsewhere on <http://developer.apple.com|developer.apple.com> but I’m not familiar with it.

|U03JZNY81L0|:
Color profile tagging is critical, esp for P3!
AFAIK, images with EDR profiles don’t show up in EDR across the OS, though videos do. Photos does do EDR for photos, though, so it’s clearly something where thought has gone into it.

--- 
> ####  What prototyping app would you recommend?


|Mike S - from Design Evangelism (Apple)|:
Such a good question. There are lots of good methods and tools out there that there’s really no one good answer.

|Linda D - Design Evangelist|:
That one you're fastest in!

|Mike S - from Design Evangelism (Apple)|:
It depends on what you like

|Mike S - from Design Evangelism (Apple)|:
OK, that was a good answer Linda

|U03JNAGPDS6|:
Currently using Sketch and XD, Figma is something I want to try :eyes:

|Mike S - from Design Evangelism (Apple)|:
Principle, Figma, Sketch, XD, Keynote, paper and pencil,…

|U03JNAGPDS6|:
Funny you say Keynote, that's actually what I began designing in :joy:

|U03J20RJQ2X|:
Principle is underrated!

|Mike S - from Design Evangelism (Apple)|:
They’re really all good in their own ways. We use Sketch a lot at Apple. XD. Keynote

|U03JL795TE2|:
<@U03HBJXV0TY> would the paper and pencil prototyping be used in the initial phase of the design process at Apple?

|U03HKV4V1FW|:
Xcode and SwiftUI may also be great for prototyping.

|Linda D - Design Evangelist|:
<@U03JL795TE2> you bet! Some people love paper sketches first (me) others go straight to SwiftUI because they're lightning fast in it

--- 
> ####  In your guidance around colors, have you all started digging into color spaces like LCH and perceptual color contrast much yet? Maybe not something you can discuss yet but it's a super interesting area and trying to choose colors with a matching human perceptual contrast across the palette is super useful and something I'd love to see Apple push as well.


|Linda D - Design Evangelist|:
I also think it's a great area to explore! I posted this in another question but the WCAG 3.0 perspective on color contrast is fascinating and something that addresses our issues with how color contrast is calculated now

|U03JMGRA538|:
It really is fascinating stuff. And how it's looking to take into account type size, boldness, etc. into the calculation in a much more nuanced way than just large or small type. Would be awesome to see Apple push some things like this outside of WCAG as well.

|U03JELM0ZNV|:
eg <https://blog.datawrapper.de/color-contrast-check-data-vis-wcag-apca/>

--- 
> ####  Do the HIG and Apple Style Guide influence each other?


|Mike S - from Design Evangelism (Apple)|:
Yes!

|Mike S - from Design Evangelism (Apple)|:
<@U03HJ86L1BL> will be here in a minute to say more. :wink:

|Mike S - from Design Evangelism (Apple)|:
If you’re interested in knowing more about writing for apps, we have this session coming up tomorrow: <https://developer.apple.com/wwdc22/10037>

|U03HJ86L1BL|:
LOL, thanks, <@U03HBJXV0TY>! Yes, definitely: Even though the use cases differ for these documents, both try to stay aligned with the other.

--- 
> ####  It’s a super fun detail that the Design page on <http://developer.apple.com|developer.apple.com> changes colour. How many different looks are there?


|U03JRQAFUKA|:
I refreshed and counted 6 :laughing:

|U03J23RAFK4|:
Some different looks.

|Mike S - from Design Evangelism (Apple)|:
Yep, six colors

|U03J23RAFK4|:
Ohhh… of course! :wink:

|Mike S - from Design Evangelism (Apple)|:
They’re meant to be read in order matching the old 6 colors logo. Tells a little bit of a story about making a button.

|U03J23RAFK4|:
Love it!

--- 
> ####  Outline views are in the HIG as being macOS only but the need for a nested outline can still occur on iOS. The HIG just says _not supported_ but that's from a control aspect. I've implemented them by using different list cell layout to provide a nesting but would welcome other suggestions.  <https://developer.apple.com/design/human-interface-guidelines/components/layout-and-organization/outline-views|https://developer.apple.com/design/human-interface-guidelines/components/layout-and-organization/outline-views>


|U03JELM0ZNV|:
Here's an example of these home-grown outlines (note there's no collapsing, which I'm mulling over).

|Linda D - Design Evangelist|:
<@U03HJ7LRK43>

|U03HJ7LRK43|:
Howdy! This is a great question — we're aware of the need for better guidance around outline views on platforms other than macOS, and it's on our radar for an update over the summer.

--- 
> ####  I’m a big believer in Human Interface Guidelines. However, I’d like to have some sincere feedback.   1. The all-new version seems dominated by texts. The older version contains a lot of illustrations and animation along with the content, and maybe it would be better to add more images and animation in the new version.   2. I’m so confused that even though this is an all-new version, there are still some images coming from macOS 10.x, with the design from Yosemite. Please update these images to the design after Big Sur.


|Mike S - from Design Evangelism (Apple)|:
Hi <@U03HMCH9D5M> - appreciate you feedback and we full agree. We have a huge list of to-do items when it comes to making illustrations for the HIG. We’re a small team and there’s a lot of pages. But this is a top priority for us.

|Mike S - from Design Evangelism (Apple)|:
As is fixing all those old screenshots!

|Linda D - Design Evangelist|:
Yup we feel the same way! Luckily now that the redesign is out we can focus on these tasks and more exciting things we're planning! :slightly_smiling_face:

|Mike S - from Design Evangelism (Apple)|:
It bothers us too. :slightly_smiling_face:

|U03HMCH9D5M|:
Appreciate it !!!

--- 
> ####  Do you follow an 8-point grid? For example, Table row padding would be 16 on either side, but 44 in height? I understand tap states need to be large enough, but why not 48?


|Mike S - from Design Evangelism (Apple)|:
Hi <@U03JK302NRH> - Yes, an 8-point grid is used in many circumstances. However, there are some exceptions. For example, layout margins are 16pt in compact size class but 20pt in regular…. 24pt would’ve been too much. Sticking at 16 would look too thin.

|Mike S - from Design Evangelism (Apple)|:
The grid is mostly about width, not height

|Mike S - from Design Evangelism (Apple)|:
IIRC, the decision about 44pt goes back further than the use of an 8pt grid for layout.

|U03JK302NRH|:
Thanks for the insight <@U03HBJXV0TY>!

--- 
> ####  With dynamic type is it expect that all text based content on the interface will scale? Is there a time where that's not appropriate such as in button containers?


|Mike S - from Design Evangelism (Apple)|:
Great question. It’s really not possible for ALL text to scale in some cases. Tab bars, for instance, don’t scale because text would truncate immediately which defeats the purpose. And there is an AX setting for showing the tab icon and label in a bezel on tap.

|Mike S - from Design Evangelism (Apple)|:
The general approach is to make sure all text in the content area / scroll views scales.

|U03JTFWKMMF|:
Awesome, thanks for the clarification Mike :thumbsup:

|Mike S - from Design Evangelism (Apple)|:
Text in fixed height elements (like tab / toolbars) is tricker

--- 
> ####  I often struggle with trying to minimize the amount of submenus, while not making the interface look too bloated (especially since I work on photo editing apps that get somewhat complex). Do you maybe have some thoughts on how to balance those things (how many controls there should be visible at once, how many submenus deep you can go, etc)?


|U03H3HNAGSK|:
Hi <@U03J20RJQ2X>. Not sure whether a Slack answer will even scratch the surface of this question, but I have a couple of quick thoughts

|U03JELM0ZNV|:
I share <@U03J20RJQ2X>'s pain, having a rich document editing experience within an iPhone interface

|U03H3HNAGSK|:
(1) The person. Is this photo editing for … professionals? influences? some specific person? … I really would start here, even though it’s the obvious designery thing to say, because I think it helps shape what level of detail and density is appropriate

|U03J20RJQ2X|:
It gets especially difficult when you try to cater to both, making the app easy to use while also giving advanced users more tools. But that’s for sure a good place to start, professionals are used to different kinds of UIs as well

|U03H3HNAGSK|:
(2) The platform will dictate your heuristics around detail and density. Designing for Mac and iPad, I would push the density, and try to deliver sets of controls as completely as possible — i.e., i’d try to avoid submenus, and where I had them, I would try to make them “similar” or at least similarly labeled across controls

--- 
> ####  How do I know when a small button is ok? :smile: Do I just need to ensure they have appropriate clearance of 44px all the way around to meet the guidelines?


|Mike S - from Design Evangelism (Apple)|:
It’s OK to have smaller button but you definitely want to have a tap area that extends to 44pts in height

|Mike S - from Design Evangelism (Apple)|:
So, yes, padding can be a factor

|Mike S - from Design Evangelism (Apple)|:
In general though, a physical background height of 44pt is a good idea. Even if the tap target is taller, users don’t know that. So they’ll naturally slow down to aim accurately

--- 
> ####  Sparked by a previous thread, are yall changing any recommendations for when to use title-case vs sentence-case capitalization style?


|U03HJ86L1BL|:
Great question! Although the guidance is to use title case in components like button labels and menu items, it also comes down to stylistic choices for the text content within your app.

|U03EBH4MA8Y|:
100%, <@U03HJ86L1BL>! And when it comes to the content within your app, it — and your style guide — is going to evolve over time. As folks in this channel noted, we decided to move to sentence case in the HIG after many years. :slightly_smiling_face: The most important thing is to be consistent — if you’re going to use title case for your content headers, make sure you’re doing that everywhere in your app. If you change that style, make sure you’re adopting it across the board. And final tip: Even if you largely follow the paradigms of a guide like AP or Chicago Style, it’s super helpful to maintain a separate personal style guide for your content — that way, you have a great reference document.

--- 
> ####  Is there still guidance on designing the navigation graph for an app? I cannot find it in the new layout.


|Mike S - from Design Evangelism (Apple)|:
Hey <@U03JQEX9MGS> I’m not totally sure I understood your question. Do you mean the diagrams we used to have?

|Mike S - from Design Evangelism (Apple)|:
May not answer your question, but we have a video about Navigation this week you might want to check out. <https://developer.apple.com/wwdc22/10001>

|U03JQEX9MGS|:
I will watch that video! I was referring to the explanation of the different styles of navigation graphs (like event driven).

|U03JQEX9MGS|:
That page helped a lot a couple of weeks ago when trying to explain why app navigation should be treated different from websites.

--- 
> ####  More of an abstract question: Taking the Fitness app as an example, the calendar view tends to stick out as a completely separate design pattern. Are there any guidelines on when you would want to implement charting in a calendar as opposed to a tabbed interfaced that grouped by day/week/month etc.?


|U03J7U2NDSL|:
That's a great question! The Fitness app is focused on a daily activity like closing your rings. Since this is a top-level goal of the app, the calendar view makes it easy to see your successes through time.

|U03J7U2NDSL|:
The Health app mirrors the same information but in a longitudinal form, where you can see larger trends.

|U03K1SMSPUZ|:
Yup that makes sense! I guess what I'm trying to wrap my head around is finding the medium of digest-able information and _too much_ but that's the joy of design!

|U03J7U2NDSL|:
Each of these approaches has its advantages. The calendar view excels at showing streaks and achievements relative to the day of the week. Conversely, the charts in Health aggregate away those daily details into larger trends.

|U03H3HNAGSK|:
Yeah, it’s interesting to me that the calendar format is sort of perfect for the Activity Rings in that they can be displayed neatly in rows / columns on a calendar grid

|U03K1SMSPUZ|:
I would say the calendar is quick overview but the trends, such as in Health, is where the power of charts come in.

--- 
> ####  Is it possible to decide the number of decimals if the numbers on one of the axes are really close to each other, e.g. a range from 0 to 1 with 5 lines


|U03H3193G3H|:
A swift charts question I'm assuming! The framework can truncate labels for you to fit the space, but otherwise you could write in some logic to format the labels according to the space you have available.

--- 
> ####  What are the best practices for using color in charts (such as considering accessibility for color blindness)?


|U03HBGL2MJA|:
Great question! We talk about these best practices in the “Color” section of our companion talk, <https://developer.apple.com/videos/play/wwdc2022/110340/|Design and effective chart>

|U03HBGL2MJA|:
At a high level, here are some key concepts to think about when using color in charts:
• Use color to enhance
• Consider associated meanings
• Balance visual weight
• Choose distinct colors
• Respect system settings

|U03HBGL2MJA|:
You can also find general best practices around color in the Human Interface Guidelines: <https://developer.apple.com/design/human-interface-guidelines/foundations/color/>

--- 
> ####  Please tell me if I'm missing important nuance here but would it be fair to boil the different scales down to: Macro scale = highlighting all regions of all marks Medium scale = highlighting same region across all marks Micro = highlighting a specific region of a specific mark


|U03J7U2NDSL|:
That sounds right, as long as with Micro the highlight is about a single data point (since a chart mark could represent multiple data points).

--- 
> ####  Are there any samples or repositories we can look at?


|U03JDDPLMHD|:
for SwiftCharts*

|U03HBGL2MJA|:
You bet! Here’s sample code for implementations with Swift Charts <https://developer.apple.com/documentation/charts/visualizing_your_app_s_data>

|U03HBGL2MJA|:
It’s got our same beloved theme on pancakes :pancakes:

|U03JDDPLMHD|:
OMG YESSSS THANK YOUUUU

--- 
> ####  For apps that have multiple ways/formats to share, (say gif, video, images of selection, HTML) that have wildly different UI flows - how would you recommend exposing that in the UI? As far as I can tell the share button only really works for apps with single-format export


|U03H3HNAGSK|:
Hi <@U03JB8S4SJ0>

|U03H3HNAGSK|:
Innocent question: Is this about sharing a chart, or just sharing in general?

|U03JB8S4SJ0|:
Sharing in general. Sorry, are we only talking about charts right now?

--- 
> ####  What considerations should be made when designing a time-based chart like Safari's inspector timeline?


|U03J7U2NDSL|:
One of the most important considerations is that each mark has a start-time, and end-time and a duration. So it will be important to have a UI that reveals all of these pieces of data for each mark.

--- 
> ####  Hello! This may be considered off topic, apologies in advance: can anyone recommend an alternative to “flow charts” for SwiftUI code? It was great to show non-programmers how the code execution should work. But since SwiftUI depends on state, this goes out the window. And I’m not sure if UML is the way to go either. Any comments would be appreciated, thank you! 


|U03H3HNAGSK|:
Hi <@U03J21EKNSE>! This is a really good question, and it’s not completely off topic. I would suggest that you bring it to the Swift UI lounge <https://wwdc22.slack.com/archives/C03HX19UNCQ>

|U03J21EKNSE|:
Hello Doug L! Thanks for letting me know; relief to know it’s not a bad thing to ask. If you are referring to the Swift UI Lounge happening right now, I have posted it there too. No bites yet; still holding hope! Thanks again.

|U03H3HNAGSK|:
Thanks, yeah. The folks in here are more focused on the design side of things, so you’ll have better luck with the “how to” aspect of your question

|U03J21EKNSE|:
Copy, understood! Thanks for your time, and have a good afternoon!

--- 
> ####  With Swift Charts, is it possible to reproduce the scrollable chart we find in Health App (where the chart is updated as we scroll the content)? I know we can use gestures on the chart to highlight some marks, but what about pan gesture?


|U03K1SMSPUZ|:
There was a similar question in <#C03HX19UNCQ|> and they called out that the views would work the same, just need to give proper widths.

|U03H3193G3H|:
Hi Axel! Any Chart can be placed in a scroll view, but I'm guessing you are interested in the "pinned" Y axis behavior. You should be able to achieve this with a workaround, that is by ZStacking the Y axis on top of the scrolling chart. Please file a radar if this is a feature you want to get added to the API!

|U03J20KFJG3|:
Thanks <@U03H3193G3H>. Here is the result I want.

|U03H3193G3H|:
Gottit. We'd love to make this easier for you, feature request this please!

|U03J20KFJG3|:
I'll thanks!

|U03H3193G3H|:
you're welcome, thank you!

--- 
> ####  Will there be some samples on building good-looking Watch Fitness apps like in the WWCD21 Session? I would love some samples showing off the design techniques used in this years Watch Workout app.


|U03H3HNAGSK|:
Hi <@U03KJSLF04Q>. Very much agree that the new Workout app is quite inspiring. There isn’t currently a code-along for it, but we will try to continue to update the HIG, Design Resources, and developer documentation with new patterns and techniques

|U03KJSLF04Q|:
Would love that!

--- 
> ####  What's the best way to design crown rotation behavior in my app? I found it hard to replicate the smooth flipping between different pages for example as the API only gives a float. Are there any samples on well done crown rotation integrations?


|U03H3HNAGSK|:
hello again! I would bring this question to the Watch labs if possible

|U03KJSLF04Q|:
Will do thanks!

|U03H3HNAGSK|:
But to be clear, it sounds like you’re trying to replicate the behavior of the in-workout UI for the Workouts app … Is your watch app made with SwiftUI?

|U03H3HNAGSK|:
Or WatchKit?

|U03KJSLF04Q|:
SwiftUI. Workouts is one example. Like selecting the currently highlighted metric (my implementation works but is not as "satifying" as the Workouts app), but also other views that might implement "pages" themselves.

--- 
> ####  Is it possible to zoom in on a SwiftUI chart? I.e., pinch and zoom to see details closer up? Could you tap on a bar (or other mark) to open a new view, for example, showing a list of the items presented in that bar?


|U03H3193G3H|:
Hi <@U03J1EHL4KY> great questions!

(1) This might depend on what behavior you're looking for. There currently isn't a pinch + zoom API built directly into Swift Charts, but you could capture a the gesture in a `chartOverlay` and respond to it accordingly by manipulating the scale / data in the chart.

(2) Yes! Absolutely. Using a `chartOverlay` and the provided `ChartProxy` to read the data point being tapped.

There are some great examples of these in the Swift Charts sample app (<https://developer.apple.com/documentation/charts/visualizing_your_app_s_data>)

Check out the "Swift Charts: Raise the bar" talk too! Donghao explains more there. <https://developer.apple.com/videos/play/wwdc2022/10137/>

|U03J1EHL4KY|:
okay awesome thank you!

|U03H3193G3H|:
you're welcome! thank you for the question

--- 
> ####  is there any sense in adding animations to Charts (w/o user interaction) or its a bad practice?


|U03J7U2NDSL|:
When used properly, animation can certainly enhance your chart… even when not tied to user interaction. For example, to indicate that a chart has updated, animating a point or growing a bar can be a helpful and delightful addition.

|U03HBGL2MJA|:
Note that when adding animation, it’s also important to ensure they adapt as needed for a device’s “Reduce Motion” accessibility setting

--- 
> ####  Is there documentation about all the option types for open ended requests?  I was curious about `Person` in particular


|U03H3HNAGSK|:
Hey <@U03J8GWEFU7> … It would help to know a bit more about what you’re looking for related to `Person`

|U03J8GWEFU7|:
Lynn mentioned that using these common options has Siri NLU benefits.  So i was curious what data was backing this.   Does `Person` referred to the customer’s Contacts?  Or something else

|U03H3HNAGSK|:
Gotcha.

|U03H3HNAGSK|:
Trying to find a reference for this.

|U03J4D1FEP6|:
Is this section from the transcript relevant:
&gt; The App Intent framework does provide a set of common options for these open-ended requests, such as numerical values, dates, or time values. If your required parameter aligns with one of these, definitely select it. This will allow you to benefit from certain built-in dialog and visual patterns, as well as Siri’s natural language understanding as it pertains to these types of information. If not, you can use a custom entity. 

|U03J4D1FEP6|:
I am also interested if there is anything `Person` related but can’t find anything in the transcript re that being a supported common option type.

|U03J8GWEFU7|:
here’s the screen grab where I noticed it

|U03HJ5M01M0|:
Here’s the documentation on `IntentPerson`: <https://developer.apple.com/documentation/appintents/intentperson>

|U03H3HNAGSK|:
<@U03HJ5M01M0> has entered the chat.

|U03HJ5M01M0|:
Siri has built in, baseline NLU for many of these types. For example, for an integer, the user might say “one dozen”. Siri will parse this as 12 for you automatically

|U03HJ5M01M0|:
Similarly, for IntentPerson, Siri has some baseline understanding of what is a first name, what is a last name, etc. Siri will attempt to construct an IntentPerson for you if you do an open ended value prompt for an IntentPerson type

--- 
> ####  Is it still posable to have user inputs in initial Siri request for media requests?


|U03H3HNAGSK|:
Good question <@U03JBMMB10A> … <@U03HJ506BGT> is on it

|U03HJ506BGT|:
Yes, you can do an open-ended request, disambiguation, or parameter confirmation before completing your intent.

--- 
> ####  I'm wondering what the maximum (sensible) number of values is for a parameter. In my app, users attach notes to people. It'd be great to have a shortcut for "New note for &lt;Person Name"... but an active user could easily have 1,000 or more people in the app that the note could be attached to... which it sounds like isn't the kind of "fixed list" you have in mind?  So... the 20 top favorite people, or similar?


|U03HJ5M1UV8|:
Right, for lists of this size and for a list of contacts, you would want to use an open-ended request, which would also allow you to use a person entity.

|U03J4D1FEP6|:
Ok right, thanks.

|U03HJ5M1UV8|:
It wouldn’t be suitable for a dynamic parameter, because those contact names would become an array of strings, which limits the flexibility people can use to ask for them.

|U03J4D1FEP6|:
Reading in the other thread about IntentPerson parameters. For an app that has access to CNContacts, is there a way (other than matching on name) to link an IntentPerson to the CNContact that presumably underlies the source of that information?

|U03HJ506BGT|:
<@U03HJ5M01M0> can you take this?

|U03HJ5M01M0|:
right now you’ll need to match on name. Please file a feedback request! We’d like to hear about your use case and look into this more

--- 
> ####  Could I create an iOS app that once downloaded from the App Store is never really meant to be opened by the user?  Instead it would include App Intents, and primarily be accessed via Siri with just dialogs &amp; custom snippets?


|U03H3HNAGSK|:
It’s an interesting question <@U03J8GWEFU7> … It’s a paradigm we’ve seen on Apple Watch with watch apps. Some watch apps are really just ways to deliver complications to the watch face, and rich notifications on the watch itself

|U03H3HNAGSK|:
However, those watch apps also display the information that is delivered in the complication and notification.

|U03H3HNAGSK|:
So anyway, the app matters :muscle:

|U03HJ506BGT|:
But technically yes, you can build an app that’s focused on providing App Shortcuts, but when someone taps on your app icon you’ll still have to have a viable experience that explains what it does.

Also, if you support dynamic parameters, your app will need to be be opened for you to update the order.

|U03J8GWEFU7|:
So I could make an app that’s intended primarily as a container for Siri first App Intent interactions, and the app itself could just provide some context that explains the Siri functionality?

|U03HJ506BGT|:
You can build that, but if you want to manage your dynamic parameter and people are never opening your app (because it doesn’t have functionality in itself), you won’t be able to re-order or update your parameter values.

|U03J8GWEFU7|:
Got it, that makes sense.   I’m just trying to get a mental model for what’s the `minimum viable app` to create for Siri!  This was so helpful

--- 
> ####  How to create a timer shortcut with shorter phrase for our app if the system already have one, for example, Set a timer for 5 mins, how can we tell the system to use our app to setup the timer instead of the system clock app.


|U03HJ5M1UV8|:
Notably, App Shortcuts will need to include your app name, so that will help distinguish your phrases from standard Siri phrases. (i.e. “start a &lt;app name&gt; timer.“)

|U03HJ5M1UV8|:
With a particularly strong brand, you may even be able to skip the word timer. (i.e. “Start a Super Special Countdown”, assuming “Super Special Countdown is the app name)

|U03HJ5M1UV8|:
A note though! You wouldn’t want to use “for &lt;time value&gt;” in your invocation phrase, because there are infinite possible replies. That’s better as an open-ended request, for a Duration

|U03J4D1FEP6|:
<@U03HJ5M1UV8> I want to check I understand this. Is the distinction here that “open-ended requests” are always by definition follow-up requests after the invocation phrase? I wasn’t clear on this till now.

|U03HJ5M1UV8|:
There are a few different types of follow-up requests after the invocation phrase, and open-ended requests are one of them. Others are parameter confirmation, intent confirmation, and disambiguation.

|U03HJ5M1UV8|:
But these are distinct from the dynamic parameter that you provide as part of your initial invocation

--- 
> ####  Working on the prototyping team seems like such an incredible thing to be a part of. Can you tell us about your journeys to becoming prototypers at Apple? And what do you look for in potential candidates for your team?


|U03J52JBK0C|:
A lot of us some mix of backgrounds that don’t fit neatly into the typical design / engineering teams.

|U03JRQ62JQY|:
Are there a lot of folks on the team who have a hard time identifying themselves as either designers or engineers, but actually both?

|U03J52JBK0C|:
I taught myself programming outside of school and dabbled in a number of open source projects and the like. Realized I enjoyed psychology / cognitive science to learn more about how people think and approach technology. Studied Cognitive Science, HCI, and Communication Design in school. Had some design jobs but eventually accidentally found this team where I got to use my programming skills too!

|U03JRQ62JQY|:
That’s amazing, thank you for sharing Julian :slightly_smiling_face:

|U03J20E1BPD|:
That’s amazing!

|U03J0DULM0V|:
A teammate was at an HCI conference (TEI '17) in Japan that I happened to have work in. He passed on my name to the recruiter. I studied Design and HCI in school, and then I interviewed!

|U03JRQ62JQY|:
That’s awesome, Marisa!

|U03HBKARTV4|:
I studied computer science, spent some time in HCI academia, and worked for a few startups before joining Apple. For me making delightful interactive things has always been a single pursuit, and the boundaries between things like “design” and “engineering” never made too much sense to me. My teammates will have different answers but when I look at candidate portfolios, I like to see inspiration from fields beyond design &amp; tech, a general sense of curiosity and playfulness… and just weird, unexpected, unique things! (even if they’re not the most polished)

|U03JRQ62JQY|:
I completely agree, Guillaume. And I super appreciate you all taking the time to answer. Thank you!

|U03JGA79CQZ|:
I was a fresh graduated from ECAL in Lausanne Switzerland, where I studied interaction design. A few months after that, Jeff our current Manager saw my bachelor graduation project on a blog and then reached out. It was such a suprise! I was super excited and curious to know more about the team and I end up joining in 2018. It was great that even though I had not much professional experience, the team was interested in my portfolio. When we are looking at candidate, I think we are interested about ideas and how the candidate communicates them, even if you have short resume like I did back then.

|U03JRQ62JQY|:
Thank you <@U03JGA79CQZ>! That’s super inspiring to read!

--- 
> ####  Hey team! Im curious, when first designing a prototype of a new product, what would you say the ratio is of looks to functionality? Are looks secondary or are they the focus from the get go? Thanks :)


|U03HBKARTV4|:
I think the main thing is to think about what questions you are trying to answer by building one (or several) prototypes. Are they questions of technical feasibility, product usefulness,…? etc. Looks for the sake of looks are rarely worth spending lots of early prototyping time on, but sometimes different aesthetic directions or visual metaphors are definitely things you want to prototype!

|U03J52JBK0C|:
I’d add that the key balance to strike in prototyping is to make the least amount you need to make to still learn something. Sometimes that means things have to look very real so that you don’t distract from the part you’re trying to learn.

|U03HMEA0C4X|:
Interesting, forsure functionality and user experience is so important - although I do find myself holding my AirPod Max’s and just staring at how beautiful they are more then I listen to music :rolling_on_the_floor_laughing:

Do you guys have separate teams for functionality and then a team for looks, or is it all entwined?

|U03J20E1BPD|:
<@U03J52JBK0C> haha, sometimes when I’m prototyping/evaluating a feature, I’ll find some unrelated annoyances, and I HAVE TO FIX it.

--- 
> ####  The Fake it Till You Make It Talk from WWDC 2014 was incredibly influential in me becoming a designer (also now have fond memories of toast). What has inspired you to join the Prototyping Team / what continues to motivate you? 


|U03JE2RK60J|:
Those sessions were awesome!:round_pushpin::bread:

|U03JEPCUBG9|:
IIRC from the presentation, they used Keynote as a prototyping tool. Is SwiftUI used by the team for prototyping?

|Linda D - Design Evangelist|:
Glad you like the session! (back when I was on the team :sweat_smile:) Perhaps <@U03J52JBK0C> <@U03J0DULM0V> could add to your question

|U03JELM0ZNV|:
You can get a set of templates for Keynote <https://keynotopia.com/> or the ones on <https://developer.apple.com/design/resources/>

|U03J52JBK0C|:
We’ve used SwiftUI a little bit, yes. We still use Keynote a lot though!

--- 
> ####  How does your team go about quickly prototyping advanced interactions? I have lots of ideas for interactions I want to test but I feel my momentum is burnt out by the time I get everything set up in, say, a SwiftUI project.


|U03J52JBK0C|:
Finding a way to fake it! We talk about this in most of our old WWDC sessions, but Prototyping for AR (2018) has some good examples of finding clever ways to prototype that don’t involve code at all.

|U03J52JBK0C|:
There are ways to fake things with paper printouts, or with clever video capture. But often doing some simple Keynote animations can teach a lot too.

--- 
> ####  What types of products do you prototype, what's the process of making a design, and how many rough drafts do you usually have before finalizing anything?


|U03HBKARTV4|:
Anything that Apple has shipped and might ship is the sort of thing we prototype! :slightly_smiling_face: I personally have worked a lot on cameras (iPhone, iPad) and Pencil over the years, as well as Watch and Health related features more recently. The process of making a design is generally making something, showing it to people, and learning from their feedback, and doing it over and over again. We've given a few WWDC talks on that topic over the years! We don't really count how many "drafts" we make, but everything we work on undergoes many, many iterations.

|U03JNAGPDS6|:
Are there differences between the final product hardware and software, or are the prototypes meant to test a specific feature and include some hardware and software features, but not all of it? aka. are you trying to test something with the mindset of a customer, or as a engineer?

|U03J52JBK0C|:
The mindset of a customer, or a person using the product or feature. We collaborate closely with engineering teams that figure out feasibility. Our prototypes help them understand which use cases need to be supported.

--- 
> ####  When creating prototypes, how extensively do you test it? i.e. Is it used only within the direct team or do you take the prototype to broader teams to test as well?


|U03HBKARTV4|:
Definitely show it to broader teams. It's less about testing in a traditional, thorough sense, and more about getting lots of people from different backgrounds to try it and tell us what they think.

|U03JE2RK60J|:
Thanks <@U03HBKARTV4> :raised_hands: If I may ask a follow up question, what kind of feedback are you looking for when testing the prototype?

|U03HBKARTV4|:
We always build a prototype to answer questions, so what we're looking for will be about what that specific prototype is trying to answer. For example, when we were working on Scribble for iPad &amp; Pencil, we wanted to really understand how people reacted to their handwriting being converted to digital text, what made that process more clear/understandable, what sorts of input would lead to confusion situations, and so on.

|U03JE2RK60J|:
Awesome, thanks for the insight :bulb:

--- 
> ####  What are some of the tools you use for prototyping?


|U03HBKARTV4|:
As far as digital tools I personally use Sketch and Keynote a lot for static/2D interfaces, After Effects for animation, and Swift/UIKit/Core Animation/Metal when I need to make things a bit more real/custom or interface with hardware. But everyone on our team uses different tools and has workflows that work for them.

--- 
> ####  The devs behind one of the ADA winners this year, Not Boring Habits, wrote a really interesting blog post (<https://www.andy.works/words/the-future-of-design-tools)|https://www.andy.works/words/the-future-of-design-tools)> about the future of prototyping/design tools, arguing for a shift from flat tools like Figma to rich, 3D-first tools like Unity and SceneKit. Do you see those tools becoming first-class citizens in a prototypers toolkit in the future?


|U03J0DULM0V|:
Hi Sam! Making in the medium the design is meant to be in is important! For a prototype seeking to answer an interaction design question, interactive prototypes are essential. For the design of a graphic poster, print out poster iterations.

|U03J0DULM0V|:
If the end artifact is meant to be spatial, then making in 3D is essential too

|U03J0DULM0V|:
I'd say there's an underlying principle that the medium that one makes/prototypes in is also a very intentional choice, and should be chosen to best align with the desired end artifact

--- 
> ####  Do you have a shrine to Bill Buxton? More seriously, do you start with paper prototypes and, if so, do you use any tooling to go from them to something digital?


|U03J0DULM0V|:
I love sketching on my iPad. Note taking and drawing in meetings is important to me.

|U03J0DULM0V|:
I've also found that Looom makes animation so fast I am able to make simple hand drawn animations describing interactions / motion in or immediately after meetings too

|U03J0DULM0V|:
(Looom won an apple design award a few years back. Highly recommend!)

|Linda D - Design Evangelist|:
We love Looom!!

|U03J0DULM0V|:
Yes! Makes putting thoughts to motion so much faster! No more pushing pixels key frame by key frame out through molasses

|U03JELM0ZNV|:
Thanks for the reminder - I didn't have an iPad capable of running it when first heard about it &amp; had forgotten (my wife's 12" Pro laptop-replacement turned out to be harder to prise from her grasp than I'd expected). Now have an iPad8 with Pencil so will try it out. Nice to see it's SVG-based for export too!

|U03J0DULM0V|:
Ah! I'm excited for you!

--- 
> ####  How do you go about adding \(magic || whimsey || delight) to a prototype? I feel a lot of my designs lack that extra :sparkles: to make a great experience.


|U03J52JBK0C|:
Give yourself time to _not_ worry so much about solving the problem. “What other ideas does this give us?” can mean completely unrelated things. But if they seem _interesting_ they’re worth trying. Those weird-but-interesting ideas can inspire us to connect the weird / whimsical inspiration to something that actually does solve the problem.

|Linda D - Design Evangelist|:
well said :smiling_face_with_tear:

--- 
> ####  What tool would you suggest for rapid prototyping?


|U03HBKARTV4|:
Whatever you're most comfortable with will be what lets you try things rapidly! For some people that's code, others animations in a tool like After Effects... to get started it's really about what you're able to quickly be productive with.

|U03JL795TE2|:
Thanks for the feedback <@U03HBKARTV4> :raised_hands:

--- 
> ####  When testing with people, how often do you change the prototype in between sessions, or not at all? i.e picking up issues from the first session and adjusting it before the next session. Is this recommended or should we stick to one prototype throughout?


|U03J52JBK0C|:
We try to keep more than one direction open at a time. It might mean having multiple very different prototypes, or one prototype than has sliders / prefs and can be adjusted. If someone gives us good feedback, we incorporate it or try it out. If it’s in conflict with the previous direction, we keep both around to let people compare.

|U03J7HT7DBR|:
That’s great - thanks Julian. It makes sense to let people interact with different prototypes and observe, if I may ask, how flexible do you make prototypes? Are people allowed to tap on anything interactive on the screen, or is it limited to one flow?

|U03J52JBK0C|:
It’s usually very limited. We make it look like everything’s there, but only certain parts will be functional. It’s important that the rest look real because it’s often in the whole context of a product that we learn the most.

|U03J7HT7DBR|:
Thanks Julian.

--- 
> ####  When you're prototyping new ideas that are likely to meet some resistance (touch bar or dropping headphone jack), what process, if any other than just gut, do you have to decide whether to ship it or kill it?


|U03HBKARTV4|:
Generally our team doesn't get to decide whether to ship or kill things. Our job is to explore (by making prototypes) + document all the possible directions that seem interesting or plausible for a specific topic, share with relevant teams, and see what the reactions are. It happens that something we're very excited about is not something that makes it out the door for some reason, in those cases we tend to keep bringing it up in future work that touches on that concept, and work with teams inside the company who are excited about it too to try to build momentum together.

|U03JRDB98KB|:
Very insightful thanks

|U03JF56NNBW|:
Cool

--- 
> ####  A question about tools: I'm a UX/UI designer who mostly use Sketch and Figma to prototype apps mockup, but recently I have discovered SwiftUI as an alternative to make high fidelity prototypes, do you think it's worth learning to program just enough to prototype better? Which tools your team use?


|U03JELM0ZNV|:
Alberto, you just described the founding philosophy of Meng To over at <https://designcode.io/>

|Linda D - Design Evangelist|:
<@U03HBKARTV4>?

|U03HBKARTV4|:
Haha, the question of "should designers learn to code" is an eternal one... long answer short, I think code should be seen as one more tool in your toolbox. If you feel like it might let you make things you couldn't make otherwise, and you're drawn to it, then go for it! SwiftUI is the easiest to learn it's ever been :slightly_smiling_face: And Meng's website is great!

--- 
> ####  MagicMove in Keynote lets you prototype a lot of simple animations - do you have preferred animation prototyping tools?  One of my gripes about most "modern" tools is they stop short of helping with animation handover or code generation, if they have any animation at all.


|U03J0DULM0V|:
AfterEffects has been my go to (light scripting, integration with C4D, able to combine with footage, I end up doing a lot of green screening)

|U03J0DULM0V|:
Recently got excited about a library that makes Unity's interface more like a traditional-timeline-animation-style ui

|U03J0DULM0V|:
I understand and commiserate with your gripes about modern animation tools though. I have to pull up Grapher and just fiddle with my equations (when transitioning to code)

|U03J0DULM0V|:
(so happy you mentioned magic move in keynote though! Early decks where we try to cover as many ideas as possible, going for breadth, there's plenty of keynote animations for our light sketches)

|U03JELM0ZNV|:
I'm a big fan of <https://createwithflow.com/> who generate code from visually-designed animations.
Supernova Studio was another doing similar things but they pivoted off to _design system management_

--- 
> ####  How long does it usually take from the first in hand prototype to the final polished version?


|U03J52JBK0C|:
Because we’re often working with new hardware features: Years! The shortest turnaround we’ve had on a project has been about two years. Some other projects we’ve worked on have been on the order of seven years.

|U03HMEA0C4X|:
<@U03J52JBK0C> Can I ask what that two year project was? :eyes:

|Linda D - Design Evangelist|:
I believe our official answer is "you may ask but Julian can't respond" :stuck_out_tongue:

--- 
> ####  Hi there! It's really nice to meet the prototyping team. Do you have any tips on prototyping? (best practices, stages of prototyping, and anything else you would consider important)


|U03JGA79CQZ|:
Always remember what are you building a prototype for, what are you trying to answer. We can get caught up sometimes in trying to have a very polish prototype but it should always be about quickly and efficiently testing a panel of different ideas. Sometimes it helps to just use low tech tools, quickly sketch things on paper, get away from screen.

|U03JRP87THN|:
Thank you!

|U03JGA79CQZ|:
Our team like to repeat the process of:
make things -&gt; show to people -&gt; get some feedback
and repeat until it the experience feels good!

|U03JRP87THN|:
Sounds like a great process to follow!

|U03K0FHSLAE|:
Great advices <@U03JGA79CQZ> :raised_hands: thank you :pray: 

|U03JRP87THN|:
Yeah, thank you for this great advices!

|U03JRP87THN|:
I really appreciate it. Having the opportunity to talk to Apple’s Prototyping team is amazing!

--- 
> ####  Do your prototypes sometimes lead to product ideas that Apple pursues, or is the context of your prototyping often within the confines of product ideas that already exist?


|U03J52JBK0C|:
It’s often the opposite direction — we’re typically prototyping new products or features that in turn teach us things we could make better about existing products!

|U03JRQ62JQY|:
Ah, that’s very interesting! And when prototyping new products, is that something your team decides to explore, or do you get “asked” to explore a certain thing?

|U03J52JBK0C|:
Both. We pursue things that we think might be interesting, but we’re also keeping tabs on the possibilities that interest partner teams that are asking for our help.

--- 
> ####  What is the collaboration dynamic between the prototyping team and Design / Eng partners?


|U03HBKARTV4|:
We work closely with them! With engineering teams to understand the technical capabilities and limitations that we are working with, and with design teams to understand the roadmap they have for their products, and what problems they're trying to solve right now. The time horizon we work on (3-5 years) is a bit longer than the one most teams operate on, so communication is key for us to be aligned.

|U03JENY84QH|:
If you're able to speak about it, I'd be interested to know if either of these roles ever initiate requests from the prototyping teams, or if novel / net new experiences are normally initiated by the prototyping team

|U03EBH4MA8Y|:
<@U03JENY84QH> Funny enough, this just got answered in the thread immediately above you! <https://wwdc22.slack.com/archives/C03H77GM1NW/p1654795791726889>

--- 
> ####  I often find that because there are so many considerations to make for a design to be truly great, that can hamper my creativity and almost block me from making progress. Do you deal with similar things, and if so, how do you manage to stay creative and keep going?


|U03HBKARTV4|:
Absolutely! I think any creative in any field suffers from the "blank page" problem... for me I find that spending time doing things not tech/design related (playing music, spending time outdoors, reading books about random obscure topics,...) will often spark unexpected connections &amp; inspiration that somehow find their way into my work. Something a little more specific I like to do too is to dive in the history of a topic I'm working on - for example the history of human mark making &amp; handwriting through various cultures was very inspirational when I worked on Pencil.

|U03JRQ62JQY|:
That’s both reassuring and inspiring to read. Thanks <@U03HBKARTV4>!

|U03J0DULM0V|:
"too many things to consider" is totally relatable, and absolutely something present in the day to day. I have personally really enjoyed organizing and grouping ideas along a "design space", by trying to figure out what common axis the ideas might have. It helps me feel less overwhelmed, and also allows me to identify any areas I haven't considered.

|U03JRQ62JQY|:
That’s a really great idea, <@U03J0DULM0V>! I suppose it’s also about sometimes just going with the flow and then reviewing and adapting the work to feedback and design principles afterwards.

--- 
> ####  Are there any good WWDC sessions on prototyping past or present you’d recommend?


|U03HBKARTV4|:
Absolutely! You can search for the "prototyping" keyword in WWDC sessions, but here are a couple we did:
Life of a Button: <https://developer.apple.com/videos/play/wwdc2018/804/>
Prototyping for AR: <https://developer.apple.com/videos/play/wwdc2018/808>

|U03HBKARTV4|:
Oh and this one too! Not specifically about prototyping but discoverability, something we care a lot about.
Discoverable Design <https://developer.apple.com/videos/play/wwdc2021/10126/>

|U03J23RAFK4|:
Nice, thank you!

|Linda D - Design Evangelist|:
And some say the Fake It Til You Make It talk may still be on youtube if you search :wink:

|U03J23RAFK4|:
Okay, I’ve seen a few mentions of this Fake it Til You Make It talk here, so I must find it!

|Linda D - Design Evangelist|:
And gasp! Here it is again: <https://developer.apple.com/wwdc14/223> cc <@U03J23RAFK4>

|U03J23RAFK4|:
Thanks! Added it to my bookmarks. :smile:

--- 
> ####  how does your design process look like? Do you take part in problem define, before you start work on some ideas? Thanks!


|U03J52JBK0C|:
We try not to be too rigid. Often we are starting with a specific problem to solve, yes. But sometimes we make things just because they seem interesting, and then figure out why and what they can help solve. It’s about giving ourselves space to figure out what feels great.

|U03J52JBK0C|:
We can fit both types of process into the cycle we describe in our WWDC sessions: Make things, Show them to people, Learn from their feedback.

|U03JKSQ9D7Z|:
sounds great! thanks

--- 
> ####  Thanks for this Q/A and congrats on all the work being released this week. Part of my day to day work is taking prototypes and being able to communicate findings to groups and teams that may not have an interest in them (yet..). If you're able to share high level insight - I'm curious how the findings from your prototypes are communicated (format, findings, risks) to external teams or even execs. To some extent the prototype itself carries this weight, but in cases where not and in person communication is infrequent - I'm curious how your team tackles this :)


|U03J52JBK0C|:
It’s an interesting challenge, because different people respond to different communication styles. We do have to adapt how we communicate work depending on what people are looking for.

|U03J52JBK0C|:
The nice thing about a prototype that _appears_ high-fidelity is that it lessens the amount of assumptions people are making. If it _looks_ like a real app, but we fake one part of the interaction, we are helping to direct feedback toward the parts that seem new.

|U03JRUP5YP2|:
Thank you - that's a nice answer and an excellent point on minimizing assumptions.

--- 
> ####  How do you come up with an idea of a product? For example, do you do brainstorming sessions? And how do you transform an idea into a prototype?


|U03HBKARTV4|:
I think it's important to know what the biggest questions around an idea you have, because that's what you'll want to prototype first. Is it about testing the usefulness of a feature? About exploring how to best display the results from an algorithm or machine learning model? Or is it about seeing if a new gesture interaction you came up with is easy for people to understand and perform? The goal of prototypes is to answer questions before investing a lot of time into making things real (hence why it's important to keep your prototyping process light &amp; nimble). As far as coming up with ideas... ask people questions, and listen to what they have to say!

|U03JRP87THN|:
Thank you very much!

|U03JRP87THN|:
I really appreciate your advice.

--- 
> ####  How has your workflow &amp; design reviews changed in a WFH world? What have you found works well for collaborating remotely?


|U03J0DULM0V|:
I've done much more green screening with remote work. (green screening with props and suits with OBS running the effects and compositing in realtime to a virtual camera I use in webex)

|U03J52JBK0C|:
We have a lot of collaborative Keynote decks too. Even for in-hand prototypes we build we’re taking a lot more video of them that we then place in those Keynote decks.

|U03J0DULM0V|:
I'm not in a green suit day to day of course :sweat_smile:, but I was very happy the extensive setup came in use for a project in 2020-2021. I had thought to myself "never thought I'd be grateful for webex"

|U03JGA79CQZ|:
I like how it gives more opportunity to make real life situation prototypes, because your setup is at home, and not in a studio where things are impersonal.

|U03JGA79CQZ|:
It forces you to stay even more connected with your teammates, to make sure you share regularly about the work

--- 
> ####  How do you prototype Siri experiences?


|U03J52JBK0C|:
Keynote animations with audio, in short! It’s like anything else in that we’re just faking the audio response portion.

|U03J8GWEFU7|:
Thanks <@U03J52JBK0C>!  Do you use human VO in place of Siri in prototypes? Or do you generate mock Siri audio?

|U03J52JBK0C|:
For our purposes it is better if it sounds like Siri. Mac’s “Speak selection” is very useful for this.

--- 
> ####  Hey! Firstly, it’s truly an honour to speak with this team and thank you for making products that impact each and every one of us each day :D As for my question, I would love to get better at design User Interfaces. What are the benefits of Sketch/Figma/etc. and would you recommend their usage? Thanks!


|U03HBKARTV4|:
Sketch and Figma are two popular tools for UI design and prototyping, but ultimately they're just tools - they won't give you magical results on their own. If you'd like to get better at designing UIs and you're starting from scratch I'd encourage you to focus more on things like layout, type, color, interaction patterns (the Apple HIG is a great place to get started on those topics as they specifically pertain to Apple platforms! <https://developer.apple.com/design/human-interface-guidelines/>) than focusing on a specific tool.

--- 
> ####  I saw Julian mention the process of 'Make things, Show them to people, Learn from their feedback' and I was wondering if you've ever had a product that's had little to no changes after feedback? A product thats a hole in one? And how much does the product usually change after feedback?


|U03J52JBK0C|:
Never.

|U03J52JBK0C|:
If we’re not getting feedback on something, we’re just not showing it to the right people. We will eventually show it to someone who will have feedback about it (improvements or reasons why it won’t work!)

|U03J52JBK0C|:
Things change a lot between our first conception of it and what makes it out the door. That’s the fun part about working with a whole lot of people who are very talented at what they do.

|U03HMEA0C4X|:
Thanks for this insight, and thanks for these amazing products!

--- 
> ####  What are some philosophies that the team adheres to when designing and prototyping things? :D


|U03HBKARTV4|:
Make things, show them to people, learn from their feedback!

|Linda D - Design Evangelist|:
That should be a tattoo at this point!

|U03JGA79CQZ|:
Fake it until you make it

|U03HVE4TV8E|:
<@U03DMQBFPH8> I’m getting a WWDC tattoo in July! I’ll get that phrase added for the prototyping team :laughing: 

|U03JRPTDF6U|:
&gt;  show them to people
This piece is so, so important. It almost immediately pays off by helping break down assumptions and normalities established by devs and designers, and lets you see your project and tools from a new perspective. Being open and receptive to that feedback is an incredibly value experience :heart:

|U03J0DULM0V|:
Considering an interaction "Before, During, and After" (i.e. in the example of a button before people press a button, how do they know they can do it, and what it will do, during the press how do they know the action is registered and whether they need to continue pressing ( any visuals that encourage continued action would be 'feed-forward'). And afterwards, what is the feedback that ensures we know how the action went?) Julian;s 2018 WWDC talk covers this in more detail

|U03JGA79CQZ|:
Always bring positive feedback when sharing the work. It should never be about personal judgement but how to make your app experience better.
For example:
"I don't like this color" vs "I think blue instead of read would better communicate what the experience is about"

|U03J0DULM0V|:
"Always design a thing by considering it in its next larger context – a chair in a room, a room in a house, a house in an environment, an environment in a city plan." is a quote that I think also nicely captures the spirit of always being able to step back and not design something in isolation

|Linda D - Design Evangelist|:
<@U03HVE4TV8E>!!! You will absolutely need to show this to us on Twitter when you do

--- 
> ####  Favorite books?


|U03HBKARTV4|:
So many, I love books! We reference Tufte a lot in our studio. Some recent design books I read and enjoyed were Extra Bold <https://papress.com/pages/extra-bold>, and Politics of Design <https://www.counter-print.co.uk/products/the-politics-of-design>

|U03J52JBK0C|:
I always like The Humane Interface and The Design of Everyday Things. Been re-reading Interface Culture recently.

|U03HUQAAWEB|:
Interesting

--- 
> ####  How much individual work vs collaboration do you do? Do you work together within a document, or work independently and then present that work for feedback?


|U03J52JBK0C|:
Different people on the team have different preferences. But we all attend a weekly design review with the whole Prototyping team in which all our work is shared.

|U03J52JBK0C|:
It helps us build a joint understanding of what a project is, even if it’s mostly one individual “doing the work”, we’re all helping with feedback, new ideas, and critique. The team’s brain makes the work better.

|U03J52JBK0C|:
Some folks on the team prefer being in collaborative documents 100% of the time. Others will just bring their individual work to design review.

--- 
> ####  Is there ever a time where you have to stop and refocus the vision or design? Like, if too many new ideas have been added and the original focus has been lost?


|U03J52JBK0C|:
Yes, but usually not because of too many new ideas! If there are too many new ideas it means we have a lot we can try out.

|U03HBKARTV4|:
Yes absolutely. When that happens we typically try to focus on what it was that people loved the most in that set of work. If you have dozens of things competing for your attention, focusing on the 2-3 that really seem to be winning hearts over is often a good way to move forward without getting bogged down. But sometimes you also have to accept that while you may have a bunch of kind of cool things, there's nothing in there that's a true winner. And that's okay! There's always way for those things you liked but which weren't clear winners to make their way into other work in the future.

|U03J52JBK0C|:
Yeah the latter part of Guillaume’s answer was the second part of what I was going to say. If we pause a project it’s because we feel we’ve thoroughly explored a space and we just haven’t hit on what feels great.

--- 
> ####  You mentioned not being too rigid on your team and often times working on things in the span of several years. Do you have any rituals as a team to stay connected and get into a "let’s make some awesome things!" mode?


|U03JRQ62JQY|:
Maybe this is already somewhat answered in <https://wwdc22.slack.com/archives/C03H77GM1NW/p1654797234259859?thread_ts=1654797121.173549&amp;cid=C03H77GM1NW|this thread>, but perhaps there’s some additional thoughts around team rituals that you could reflect on here?

|U03HBKARTV4|:
Yes, as Julian said we have weekly team meetings and design reviews where we share very openly what we're working on. Those have happened every week as long as the team's been around, over 15 years now. I think being a small tight knit team is essential to our success.

|U03J52JBK0C|:
And in those design reviews we’re very open (and excited) to see random things people made that aren’t directly related to current/ongoing projects.

|U03JRQ62JQY|:
This is so awesome and inspiring! Thanks so much for sharing!

|U03JZNY81L0|:
How do you scale a weekly meeting as the team / scope grows?

|U03HBKARTV4|:
We'll have smaller, more focused meetings for individual projects. The goal for the team meetings is for the whole team to see what's going on that week, but they're not exhaustive. Our team has never been bigger than ~12 people, which I think is a feature.

|U03JZNY81L0|:
I with you on keeping things small… let’s just say that’s a rarity in my experience :unicorn_face:

--- 
> ####  Hello again, and thanks for your time! I am looking for general design guidelines on building out visuospatial metaphors in a 3D + AR environment. I have a project, <http://github.com/tikimcfee/LookAtThat|github.com/tikimcfee/LookAtThat>, that renders and visualizes an entire code base at once, but there's just so much to see, it gets cluttered and overwhelming! I would really appreciate some time to talk and think about what kinds of things can be presented, hidden, animated, and made otherwise visually appealing for users, such that the tool is less burdensome, and more useful. Cheers!!


|Linda D - Design Evangelist|:
Hey Ivan! This is a great question to ask in a 1:1 Design lab! There's still slots for tomorrow let me hand you a link

|Linda D - Design Evangelist|:
<https://developer.apple.com/wwdc22/labs-and-lounges/dashboard/upcoming?q=design%20lab> here you go!

|U03JRPTDF6U|:
Thank you once, twice, and thrice! I’ll make sure I’m signed up ASAP :smiley:

|Linda D - Design Evangelist|:
cc <@U03HBHWCB4N> ^

--- 
> ####  What are some non-digital sources of inspiration for each of ya? Books, music, art, something that you aspire to perhaps.


|U03J0DULM0V|:
Ah. So many things, how does one dimension reduce to answer this? haha, everything from me spending too much time on a saturday morning brunch watching caustics, of light going through different glassware, to thursday night Exploratorium trips, adoring Tokuujin Yoshioka's installation work, Olafur Eliasson,

|U03J0DULM0V|:
Looking at the special effects work for movies ("making of The Mandalorian" a year or two ago with their realtime rendering was :fire:) (does this count as non-digital, it is half physical ahaha)

|U03JGA79CQZ|:
See some fine art in museum is always inspiring! But yeah so many things. For me, just taking long walk randomly in San Francisco can help my thoughts wander in unexpected places.

|U03JRUP5YP2|:
Those are great! I 100% love making of essays, vids, docs Thank you for sharing these :)

|U03J0DULM0V|:
To answer the last part, "something you aspire to perhaps" I aspire to make things as beautiful as poetry :pleading_face:. I like Amanda Gorman, Jack Gilbert, some good ol' TS Eliot, but ahah, thus far haven't personally been able to draw direct application for poetry.

|U03JRUP5YP2|:
Oof poetry is a good one and not often an answer to such a question - maybe applied to UI copywriting ha?

--- 
> ####  How accurately does the original design idea translate to the prototype? Are there many changes? I saw Jony Ive say that the best ideas come from conversation, does that continue through the prototype stage?


|U03J52JBK0C|:
The purpose of prototypes is to help advance the conversation. Instead of going in circles verbally about what might be, we start to talk about what’s in front of us. Or what could be in front of us that we haven’t made yet!

|U03J52JBK0C|:
Which is to say, we often find the things we think are interesting change dramatically once we have a few prototypes in front of us. And we have conversations about that!

--- 
> ####  Do you differentiate between designing user interfaces and prototyping? Are they related or separate focuses?


|U03HBKARTV4|:
Yes they are definitely 2 different things, although for us they overlap a lot! I think prototyping in general refers to building artefacts quickly to answer questions that will then inform how to build something "for real". So Apple also has silicon prototypers working on the M series chips, for instance! For us, we prototype interactions and user interfaces, which means we try to explore what new modes of input or new capabilities (think for example something like FaceID/Depth Camera, or Apple Pencil) would bring to our products, which then informs whether the company should invest the resources in actually building that hardware/product.

|U03JGA79CQZ|:
It depends on what the prototype is trying to answer and at what stage of the project we are. But generally a polished UI would help better communicate with other teams, make it look real.

|U03J52JBK0C|:
Yes to add to Mylène’s answer, we often have to design user interfaces _as a part of_ prototyping something!

|U03J23RAFK4|:
Thanks for the answers! So sometimes it involves building a UI, but much more and not just limited to a digital UI with prototyping.

|U03J52JBK0C|:
Though sometimes we can get away with re-using large parts of the existing designs.

|U03J52JBK0C|:
I’m not sure we’re necessarily doing _more_ — the final user interface designs require a lot of work to be designed for all the different devices, screen sizes, edge cases, accessibility cases, error cases… we’re fortunate to get to pass on that until it becomes a specific issue for our concept. We build on what’s already there for those parts.

|U03J23RAFK4|:
Thanks for the clarity!

--- 
> ####  Have you ever had to build a new tool in order to design a new experience? Do you ever use custom or internal prototyping tools that apple makes?


|U03J52JBK0C|:
Yes! And yes! The “tools” are a lot rougher than you might have in mind, but we’re often cobbling together our own sets of code to be able to try things. We don’t build it out into a generic reusable tool as much as we build the frameworks / scaffolding necessary to try out the very-specific thing we want to get into our hands.

|U03J52JBK0C|:
We build what’s necessary to try the specific things we want to try. We try really hard to stay away from prematurely abstracting. It’s too easy to accidentally become a framework engineer or tools engineer when we really were just trying to try something out.

--- 
> ####  I noticed you said that a destructive action should be on the left and red text. I never knew that - where is this sort of thing in the HIG?


|Mike S - from Design Evangelism (Apple)|:
Ooops, should’ve responded with a reply. :wink:

|Mike S - from Design Evangelism (Apple)|:
Hey Dan, we have writing guidance sprinkled around the HIG in various locations. This guidance is on the Alerts page: <https://developer.apple.com/design/human-interface-guidelines/components/presentation/alerts>

--- 
> ####  Other than users and learners, any other suggestions for referring to the people using our apps?


|U03HVEWEGAF|:
What is your audience? We often just use “people” but if you can be more specific, like “family member” or “subscriber” that’s a good way to go.

|U03HWQ6F9A5|:
Think about what people using your app would call themselves.

|U03HWQ6F9A5|:
We try to avoid the word “users” when we refer the people who use our apps, and prefer something that sounds more human, like "artists",  "collaborators", "participants", etc. depending on the app and what people are trying to do. :slightly_smiling_face:

|U03K6K2J79P|:
Thank you! That is very helpful :relaxed:

--- 
> ####  Are there any examples of combining different tonalities within one app? Or should one just stick to one?


|U03HJ5LRUEN|:
The _voice_ of your app is something you want to remain consistent, so that folks get consistent messaging inside your app. But, as you point out, the _tone_ can certainly modulate. When you welcome somebody, you might sound excited. But when that person has a credit card declined, you may want to sound more serious.

|U03HWQ6F9A5|:
Similar to how your voice is always you, but your tone changes depending on context and who you're talking to.

|U03HJ5LRUEN|:
In other words (no pun intended, hiyooo!), it's very common — if not important — to adjust your tone throughout your app. The tone should reflect the situation.

|U03HJ5LRUEN|:
As an example, coaching from the Activity app on Apple Watch is celebratory when you close a ring. But it's more matter-of-fact if your progress is lacking.

|U03JSLQRRP0|:
Right, there is a clear distinction between voice and tone, thanks for answering both of you! And I loved your pun <@U03HJ5LRUEN> :joy:

|U03J1UGE04B|:
Hmmm - I guess I’m still struggling with tone vs voice - Carrot weather has insults woven into weather forecasts. Is that voice? Maybe it doesn’t have a tone. I’ve never bought it because I didn’t like whatever it was

|U03JSLQRRP0|:
I don't think these rules apply to Carrot Weather App :joy:

--- 
> ####  How do you see the different roles of the HIG's writing guidance, and the Apple Style Guide (<https://help.apple.com/applestyleguide/#/apsg1eef9171)?|https://help.apple.com/applestyleguide/#/apsg1eef9171)?> Is the style guide more for contexts outside of apps and long form writing?


|U03HJ5LRUEN|:
Great question. One way to think about it, is that your product is a major part of your brand.

With that in mind, your product may have more specific guidelines to follow so that you can make your interface feel familiar — and subsequently, intuitive. These kinds of patterns are outlined in the the Human Interface Guidelines.

Your brand, however, may encompass more than just what appears in your product. Your website, emails, marketing collaterals, events, and even the App Store descriptions mentioned earlier, these are all examples of surfaces where your voice extends beyond your app. For us, that's where the Apple Style Guide kicks in, helping us to adhere to a wider set of grammar and syntax to ensure we have consistency at every customer touchpoint.

Think about this balance for your app, too. How can your app have clarity and consistency throughout, and how can that narrative continue outside of your app to complement what you — and your users — are trying to do?

|U03HJ5LRUEN|:
*HIG*            *ASG*
          :handshake:
     *continuing*
 *the conversation*

|U03JELQLESV|:
I think the ASG should be more visible! For some reason it's hidden from search engines.

--- 
> ####  Great session! So many useful tips I am 100% gonna apply to my apps. Just wondering though, would you recommend Onboarding for apps? I’ve heard before it interrupts the user’s usage of the app, but I’ve also heard that it makes users feel more welcome. What do you think? Thanks :grinning:


|U03H3HNAGSK|:
This is such a good question <@U03HVE4TV8E>

|U03H3HNAGSK|:
I don't think there's a single answer to it, but <@U03HVEWEGAF> <@U03HWQ6F9A5> and <@U03HJ5LRUEN> have some thoughts

|U03HBGQ6V2S|:
It's going to vary based on the complexity of your app or how simple its premise is. We find what often helps is to incorporate onboarding elements or moments into the first-time experience for someone new.

|U03HBGQ6V2S|:
Also great question :fire:

|U03H3HNAGSK|:
Maybe I'm saying the same thing, but the best onboarding doesn't feel like "onboarding"

|U03HVE4TV8E|:
Thanks for answering :D so, I have an app that tracks deliveries, so should the be super simple along the lines of “Track your deliveries” in large title text, maybe a little but of information, and then “Get started”? All in one view. Thanks :pray: 

|U03HVEWEGAF|:
There’s no one answer to this! My favorite onboarding experiences are the ones you do right within the app itself. Like those early levels of a game that teach you how to play it. Or a chat app that uses the chat to get you set up.

|U03H3HNAGSK|:
Alto's Adventure!

|U03H3HNAGSK|:
You're just dropped into the game, and you're playing, and it's teaching you along the way

|U03JRQAFUKA|:
<@U03H3HNAGSK> Ahh, I love that game! And yeah, the onboarding is really nice and seamless!

|U03HBGQ6V2S|:
Oooh off the cuff it's hard to give specific feedback over Slack. If you have time <@U03HVE4TV8E>, sign up for a slot in our UX Writing Lab tomorrow—and add that question.

<https://developer.apple.com/wwdc22/labs-and-lounges/dashboard/Y2Z4GC8D8Q/dashboard|Sign Up Here>

|U03HVE4TV8E|:
Ooooh I didn’t know there was a lab happening tomorrow! Thanks :D

--- 
> ####  Thanks for amazing advice! I wonder what the arrangement for options in an alarm means. For example putting major option on the left or top. Is it recommended to change the order, e.g. from major-on-left to major-on-right, for languages using different reading order?


|Mike S - from Design Evangelism (Apple)|:
Hi Zhang - Yes, typically you’d want to order more important things above or to the left of less important things. And for RTL languages, check out this page in the HIG: <https://developer.apple.com/design/human-interface-guidelines/foundations/right-to-left>

|Mike S - from Design Evangelism (Apple)|:
Also this video: <https://developer.apple.com/wwdc22/10034>

|U03JERVQBFX|:
Thank you for answering! Such fun designing for different cultures.

--- 
> ####  For full screen modals with no interaction, is Apple's preferred dismiss control an X in a circle in the top right corner (as is referenced in the Explore Navigation Design for iOS talk) as opposed to a grab style control at the top middle (indicating to pull down to close)?


|U03HVE4TV8E|:
Great question! I’ve been wondering this myself recently :facepunch:

|Mike S - from Design Evangelism (Apple)|:
Totally great question. we get it a lot. We have an answer for you in the HIG: <https://developer.apple.com/design/human-interface-guidelines/components/presentation/sheets>

|Mike S - from Design Evangelism (Apple)|:
Position Done and Cancel buttons as people expect. Typically, a Done or Dismiss button belongs in a sheet’s top-right corner (in a left-to-right layout) or top-left corner (in a right-to-left layout). The Cancel button belongs in a sheet’s top-left (in a left-to-right layout) or top-right (in a right-to-left layout) corner.

|U03H3HNAGSK|:
Good question <@U03JRQUJ27J>. This has been an interaction pattern in recent releases, moving away from the elevated sheet and toward the full-screen presentation with the close in the top right

|U03HMCT187R|:
Omg I LOVE that this is in the HIG now!! I literally have sent in at least 100 bug reports pointing out where the Cancel button is incorrectly located at the right. I have like 100 screenshots collected I attach to each bug report showing places where Cancel is correctly located at the left. :heart:

|U03HMCT187R|:
It is interesting however there seems to be a bit of conflict with close buttons moving to the right recently (Safari, sheets with X instead of Cancel) :thinking_face:

--- 
> ####  If you add a new feature to an app, is it a good idea to showcase that new feature when the user does a certain action (i.e. completes a task etc.) or is that bad user experience as you’re interrupting their session? Thanks :grin:


|U03HVEWEGAF|:
This goes back to context. If that feature is relevant or helpful at that moment, then yes, go ahead and talk about the new feature. But if it’s not relevant to that moment, think about where else it would feel more contextual.

|U03HVE4TV8E|:
That’s great, thanks :blush: 

--- 
> ####  Seems common for interface copy to be too verbose before it's edited down. Are there examples that come to mind where the UI was the opposite, too terse and needed more explanation?


|U03HJ5LRUEN|:
There are may examples of this, I'm sure. One that comes to mind is when people input personal information, like when ordering something for delivery to their home. Sure, you could just indicate that you received the information, but by restating what you received (so the customer can ensure it was entered correctly) and maybe even stating that the info won't be used for nefarious purposes (eg. it wont be sold to advertisers), you create a level of comfort that more economical language might not afford.

|U03HJ5LRUEN|:
Think about when you tell a server at a restaurant that you want a certain dish, but with extra pickles and hot sauce but no tomatoes and can you please switch the fries for a salad. Some servers won't write that down. And while that's impressive to see, it's also nice to hear when the server repeats it back to you so you know the meal will come as you asked.

|U03HWQ6F9A5|:
Love that metaphor <@U03HJ5LRUEN>. Another thing we do often is link out to support articles for people who want to learn more about a particular subject. That way the information is there if you need, but it's not in the way.

--- 
> ####  What would be the best way to dismiss a full screen modal that has content? Would it be a button along the lines of ‘Done’ at the bottom, or is it still a cross in the top right as mentioned earlier?


|Mike S - from Design Evangelism (Apple)|:
Hi Charlie, there’s some good insights in the HIG on the Sheets and Modality pages.

|Mike S - from Design Evangelism (Apple)|:
<https://developer.apple.com/design/human-interface-guidelines/components/presentation/sheets>

|U03JELQLESV|:
Personally I would be reluctant to use a bottom corner in a Mac app, since you have to consider window movement and that it could be clipped by the Dock.

|Mike S - from Design Evangelism (Apple)|:
<https://developer.apple.com/design/human-interface-guidelines/patterns/modality>

|Mike S - from Design Evangelism (Apple)|:
Yes Austin, generally not a good idea to position controls at the bottom of mac windows.

|Mike S - from Design Evangelism (Apple)|:
Also, check out: <https://developer.apple.com/videos/play/wwdc2022/10001/>

--- 
> ####  Any tips on how to position elements so as to help with functionality and design?


|U03HVEWEGAF|:
In our session, we talked about information hierarchy. As with everything it’s going to depend on the specifics, but in general, think about your headlines and buttons. Make them clear and aligned with each other.

|U03HVEWEGAF|:
Keep other text brief and easy to read. Rather than a big block of text, can you break it up into bullet points or even multiple screens?

|U03JRQAFUKA|:
Oh okay, that makes sense. I just have a lot of trouble getting my designs to be both intuitive and aesthetic. I’ll keep that in mind, thank you!

--- 
> ####  Should I still add an ‘Add to Siri’ button to my app with the new SiriKit/shortcuts functionality, or is it completely obsolete?


|U03H3HNAGSK|:
Good question <@U03K1B3MQL8> ... You don't need to remove it, if you've got it. But on iOS 16 forward, you can begin to move away from it by creating and supplying App Shortcuts, rather than requiring people to set them up

|U03K1B3MQL8|:
I haven't fully looked into the new SiriKit interactions… Does it just mean that if an Intent is available, iOS knows this and will automatically integrate it with Siri/shortcuts?

|U03H3HNAGSK|:
I think you've essentially got it, but I would watch the App Intents video and the Design App Shortcuts video as well

--- 
> ####  What's the average number of times you edit your Slack messages?


|U03HJ5LRUEN|:
Many times, sometimes.

|U03HWQ6F9A5|:
Too many times to count. :sweat_smile:

--- 
> ####  I’ve found a small mistake in the HIG, where should I report this?  The Feedback assistant doesn’t seem to have a appropriate category


|Mike S - from Design Evangelism (Apple)|:
Would love the feedback! We are working on adding a HIG category. You can use the Apple Design Resources component for now. I’ll make sure it gets to the right place. :wink:

|U03JRR4R3CY|:
Reported, it’s really small but wanted to mention it somewhere, FB10140417

|U03JELQLESV|:
Typos happen, but I don't think I'll ever in my lifetime see a HIG screenshot accidentally show a time other than 9:41 or 10:09.

|Mike S - from Design Evangelism (Apple)|:
Not as long as I’m here <@U03JELQLESV>!

--- 
> ####  Have you ever accidentally shipped out a typo with an OS release?


|U03HJ5LRUEN|:
"An Apple spokesperson declined to comment." :wink:

|Mike S - from Design Evangelism (Apple)|:
It happened onec

|U03JELQLESV|:
Apparently one of original iPhone's important demos to a cell carrier's boss accidentally contained a profanity as a localization string lookup key!

Source: a Computer History Museum interview.

--- 
> ####  Is the Apple Pencil mightier than the sword?


--- 
> ####  Sorry for joining so late! I make a photo editing app and I often wonder how I should deal with technical terms. One example that comes to mind are blend modes (screen, overlay, multiply, etc.) as those things are foreign concepts to the average person. Do you recommend sticking to such technical terms and providing explanations via graphics, for example?


|U03HWQ6F9A5|:
Ooh good question. It really depends on your audience - are they professional photographers? Then they might understand more technical terms. You can also help define things with secondary text.

|U03J20RJQ2X|:
Thanks for the reply! The app is not targeted at professionals, so I’ve tried to find ways to better communicate what those tools do

|U03HVEWEGAF|:
If these are terms of art, and it sounds like they are, it can be best to stick with them. Avoid jargon, or making up terms that might end up confusing everyone. That said, if your audience is less technical, maybe define the terms so people can learn them.

|U03HJ5LRUEN|:
+1 to what <@U03HWQ6F9A5> and <@U03HVEWEGAF> said here. We aim to democratize access to technology with much of our hardware, software, and services at Apple; so we aim to have our language be understood by as many people as possible. But with a few of our apps, we have a specific audience (eg our creator tools, like Apple Music for Artists, that focus on specific audiences), and therefore we want the language to be in the vernacular of the users—otherwise it may feel like we've shipped a watered-down professional feature.

|U03HJ5LRUEN|:
Since it's not aimed at professionals, show it to friends (or strangers) and see if they understand what's written. And as Jen and Kaely pointed out in their talk, consider reading it out loud to yourself as well.

|U03J20RJQ2X|:
Thanks a lot the replies! One area of iOS that just came to mind was the blur intensity adjustment in Portrait Mode. Even though it’s a feature that’s not necessarily aimed at pros, it’s using f-stops as an analogy to real life photography.

--- 
> ####  If I want to read the new HIG end-to-end, when should I plan to do that so everything will be in there? I know yall are working on more goodies.


|U03H3HNAGSK|:
Hi <@U03HMCT187R> good question. The HIG is a living document, so it’s always getting updated in big and small ways. Between now and the fall, the updates will (most likely) be small. In the fall, the bigger updates will land.

|U03H3HNAGSK|:
Another way of answering your question is: You might as well get started with that read-through! It has been great to get feedback on the redesign, so don’t be shy about that, either

|U03JELQLESV|:
I think it would be great if it was clearer when there's more minor updates, like a technologies page gets added or something. Sometimes I'll discover on Twitter, but a more central diff would be nice! I can file feedback about this too.

|Linda D - Design Evangelist|:
We're already planning for changelogs in the HIG coming some time this summer!

--- 
> ####  The wonderful crusade against home tabs reminds me of the one you did for hamburger menus many years back. Are there other common app conventions that you see that you disagree with?


|Mike S - from Design Evangelism (Apple)|:
Thanks for remembering that session. It was YEARS ago.

|Mike S - from Design Evangelism (Apple)|:
We have a few, mostly they center on design conventions that come over from other platforms that could be adapted to match Apple platform conventions

|Mike S - from Design Evangelism (Apple)|:
For example, drawing a back button as an arrow (with a tail) instead of a chevron ( &lt; )

|Linda D - Design Evangelist|:
^ that's an android thing

|Mike S - from Design Evangelism (Apple)|:
Tab bars that have a button in the center that performs an action rather than navigating to a location in the app

|U03JELQLESV|:
One that comes to mind that might've been mentioned in that session is avoiding the standard Apple platform icon for share sheet button.

|U03J20EAJKV|:
Both so common :pensive:

|Mike S - from Design Evangelism (Apple)|:
Yep!

|Mike S - from Design Evangelism (Apple)|:
That one gets my blood boiling. :slightly_smiling_face:

|U03HVE4TV8E|:
My current pet peeve is floating buttons (i.e. on Twitter). Like, a plus in the corner that is just floating there :joy:

|U03J20EAJKV|:
What's the icon they use, like three dots or something?

|Mike S - from Design Evangelism (Apple)|:
Also, kabob menus (three vertical stacked dots) instead of an ellipses symbol

|Linda D - Design Evangelist|:
For me I personally dislike icons without labels. Unless you think your icon is universally understandable across all cultures – because it usually isn't :stuck_out_tongue:

|U03JELQLESV|:
This thread really stirred the pot with food-related anti-patterns.

|U03J20EAJKV|:
Another one I just thought of: close buttons on the right instead of the left?

|U03J1UPA8UB|:
That’s the one that always gets me. Where does one place close buttons?

--- 
> ####  In reference to not creating a "home" tab, what are your thoughts on having "cards" that are overviews of content from a different tab? Would you consider that a duplicate?


|Sarah M - Design Evangelist|:
Hey <@U03K1SMSPUZ>, great question. This is highly dependent of the context and content of the app. Be cautious of cards that display unrelated or disparate types of information and make an interface feel like a dashboard. Dashboards are similar to Home tabs, as the information is not directly related and often overloaded. This makes it difficult to glance and takes longer to understand the relationships and how to take action

|U03J1EHL4KY|:
So, if you use cards or have a dashboard like view, try to keep the content relevant to the current tab?

|Adam H (no title)|:
We’ve seen some apps that have a wide array of Widgets that can be configured like a dashboard. It can be very powerful, especially on iPad. But these widgets would take you to the corresponding tab in the app.

--- 
> ####  when do you recommend hiding the navigation bar when pushing a view? Ex: Apple News: When you open an article, the app pushes the article view and hides the main navigation.


|U03JELQLESV|:
Curious about if there are situations when the tab bar should be hidden also.

|Mike S - from Design Evangelism (Apple)|:
It’s true that News doesn’t follow the typical convention we recommend for tabbed apps. I can’t really speak for the News team, but I believe the thinking was that people don’t generally switch between tabs frequently or want to persist state in each tab since the content changes all the time

|Mike S - from Design Evangelism (Apple)|:
People drill into articles, read, and then often leave.

|Majo C - Design Evangelist|:
You could consider temporarily hide the Navigation Bar for immersive experiences, just be sure to allow
the reverse interaction and show it when swiping down or tapping the screen.

|Mike S - from Design Evangelism (Apple)|:
In that usage pattern, persisting the tab bar to allow for fast lateral navigation, or keeping it visible to help people stay oriented, is less of an imperative.

|Mike S - from Design Evangelism (Apple)|:
This is pretty atypical for tabbed apps though

|U03KA893DUY|:
got it! Yes I was thinking it can be also be possible to use a modal instead of a push with hidden nav bar

--- 
> ####  I saw in Sarah M's session that there were Places cells with a ... button on their top right side. On what cases should we use such a button?


|Sarah M - Design Evangelist|:
I believe you’re referring to the ellipses SF Symbol in the navigation bar?

|Sarah M - Design Evangelist|:
We would use this button for secondary actions that are related to the view, but perhaps not the primary actions someone would take

|Linda D - Design Evangelist|:
"..." More menus are typically used to host a set of additional actions vs. navigation. You'll often see designs conflate the two.

|U03J1EHL4KY|:
If an app must use more than 5 tabs, is an ellipsis the appropriate icon for the “More” tab?

|U03JRQ62JQY|:
<@U03J1EHL4KY> I believe that <@U03DMQBFPH8> answered this here:

<https://wwdc22.slack.com/archives/C03H77GM1NW/p1654813779763509?thread_ts=1654812948.356689&amp;cid=C03H77GM1NW>

--- 
> ####  Are there resources we can share with more web-minded colleagues. It can be difficult to explain that apps and websites should not have the same navigation design.


|Mike S - from Design Evangelism (Apple)|:
Absolutely! <http://developer.apple.com/design|developer.apple.com/design>

|Mike S - from Design Evangelism (Apple)|:
Also this video :slightly_smiling_face:

|Mike S - from Design Evangelism (Apple)|:
I’m not sure we really speak explicitly to web designers per se, but this should be a helpful primer on Apple platform design patterns

|Linda D - Design Evangelist|:
Also more specifically all the content inside "Navigation and search" in the HIG <https://developer.apple.com/design/human-interface-guidelines/components/navigation-and-search/navigation-bars>

|Linda D - Design Evangelist|:
As well as modality: <https://developer.apple.com/design/human-interface-guidelines/patterns/modality>

--- 
> ####  I saw in the session that there are list section headers that are bold and bigger than normal section headers. In which cases should we use these? Thanks 


|Mike S - from Design Evangelism (Apple)|:
They’re a relative recent change to iOS (last year I think). It’s a matter of taste and judgement I think. But they’re particularly effective when the list is text only. It helps created needed differentiation (or grouping) between content items and category labels

|Mike S - from Design Evangelism (Apple)|:
If the list items are visually distinctive, larger section headers might not be needed. But, personally, I think they’re an improvement in all situations.

--- 
> ####  "Home" is such a lazy name for the app's first tab! But the argument that's often given in its favour is that people understand it because that's how the first page is often referred to in web and app design and changing it would mean forcing people to change their already established habits.  Would Spotify / Twitter doing away with the home tab be a risky UI move that could lose them followers or a much needed navigation cleanse?


|Majo C - Design Evangelist|:
We can’t speak about what other companies should do, but I don’t consider risky moving to a more intuitive labeling convention, this way you ensure predictability and intention.

|Mike S - from Design Evangelism (Apple)|:
Specificity is always a good thing. If there’s a more descriptive word to use, it should be used.

|U03J20EAJKV|:
I was just thinking that. Maybe instead of “Home” it should just be “Timeline” for Twitter

|Linda D - Design Evangelist|:
And even web is starting to move away from the "home" concept. I have a feeling it will end up in the same category as having a floppy disk represent "save"

--- 
> ####  In the demo app shown, the Navigation Bar was hidden but the toolbar items was still showing. Is this new in iOS 16?! :blush:


|Sarah M - Design Evangelist|:
Hmm. Can you elaborate what example you’re referring to?

|Sarah M - Design Evangelist|:
None of these examples share UI that isn’t yet released :blush:

|U03JQEX9MGS|:
Navigation bar appearances? <https://developer.apple.com/documentation/uikit/uinavigationbar/3198027-scrolledgeappearance>

|U03HVE4TV8E|:
Yeah of course! If you notice how the image goes behind an invisible NavigationBar but the toolbar is still visible

|Sarah M - Design Evangelist|:
That’s a standard navigation bar with the background blur removed

|Majo C - Design Evangelist|:
The image goes behind the navigation bar and it’s optional to remove its background, but for TAB BARS it’s not recommended.

|Sarah M - Design Evangelist|:
Yes, the background translucency should not be changed or removed on the tab bar. On a navigation bar, it can be an aesthetic choice if it doesn’t hinder the user experience

--- 
> ####  I would love to hear the Design Teams thoughts on Kebab Menus and Floating Action Buttons! (I get a feeling they fall in the same boat as Hamburger Menus and Home Tab Bar Items :smile:)


|Linda D - Design Evangelist|:
Funnily enough we were just talking about this here: <https://wwdc22.slack.com/archives/C03H77GM1NW/p1654814044982489>

|U03JRNE4KJL|:
“Kebab menu”? Is that a thing? now I’m hungry…

|Sarah M - Design Evangelist|:
Most of these components are problematic for other reasons. For example, FABS tend to cover elements of an interface which can be difficult to read or interact with the content behind the action. They also tend to be duplicated across tabs and the redundancy, shows that the action lacks context

|Linda D - Design Evangelist|:
And yes to all of the above, a lot of those paradigms you'll see on Android and it instantly makes people feel as if the design wasn't intended for an Apple platform.

|Mike S - from Design Evangelism (Apple)|:
Yes to above! I should add that FABs aren’t verboten on iOS but the action should be VERY important and VERY frequently used. Otherwise they get in the way. Things and Notes are two good examples of where a FAB makes sense. Problem is a lot of other apps use FABs for an action that isn’t all that common.

|U03JRNE4KJL|:
After years of freelancing and working in startups, the most annoying thing was UI/UX concepts fighting against the (native) platform language - for the sake of brand experience, for “streamlining and build it faster” (the opposite was true) or lack of knowledge (or empowerment) of the designers. It is really hard to find good mobile1st designers…. still after over 10yrs

|Mike S - from Design Evangelism (Apple)|:
We feel your pain.

|U03JRNE4KJL|:
btw: I consider SwiftUI more a design than a code challenge… (for the same reasons)

|U03JELQLESV|:
Agree Oliver. I'm not a designer but I've certainly tried to advocate for native look and feel when working with designers on iOS apps, <@U03HBJXV0TY>'s session Essential Design Principles from WWDC 2017 helped clarify my thinking around this.

--- 
> ####  Wondering where "featured" tabs would fall—are they just home tabs with a different name or could they actually be considered useful?


|Sarah M - Design Evangelist|:
Hi <@U03JRQAFUKA>, could you share what a feature tab would consist of?

|U03JRQAFUKA|:
I guess maybe recommended articles for example?

|Linda D - Design Evangelist|:
Hard to say a blanket "yes or no" because it depends on the content inside the tab. We do "For You" tabs where the content inside changes dynamically based on what we think is relevant to the user. That could be considered a "featured" section but its use case is specific enough from navigation that it can be its own page

|Linda D - Design Evangelist|:
Where it gets iffy is when you're just repeating the same content as in your navigation put on a page. That causes confusion with whether people should use the tab bar or Featured page to access information

|Majo C - Design Evangelist|:
Recommended &amp; feature articles could be highlighted under the Articles tab, instead of having a dedicated tab. I’d say, as <@U03DMQBFPH8>, that it would be case by case and depending of the level of personalization the app offers.

|U03JRQAFUKA|:
Ah okay, that makes sense! Thank you!

--- 
> ####  I hope it's still fine to ask an unrelated question. I missed the previous Q&amp;As here, there is just so much going on :exploding_head:  I would love to have the design templates available for Affinity Photo and Designer. Is this something you are considering? I guess I should probably file a feedback for that, just thought about it now :innocent:


|Mike S - from Design Evangelism (Apple)|:
Hi <@U03J4CVE1U4> - We are continually considering what apps to support for the ADR. :wink:

|Mike S - from Design Evangelism (Apple)|:
Feedback Assistant would be a good next move.

|U03J4CVE1U4|:
Awesome, I'm glad to hear it! Actually just submitted one: FB10142299 :muscle:

--- 
> ####  I saw a tweet showing batch editing in the iOS 16 Photos app and apparently it uses a progress indicator at the bottom that reminds me of an Android-style snackbar/toast. Do you have any guidance on this UI element? <https://twitter.com/apollozac/status/1534903049373761537|https://twitter.com/apollozac/status/1534903049373761537>


|Sarah M - Design Evangelist|:
We have progress indicators on iOS currently
<https://developer.apple.com/design/human-interface-guidelines/components/status/progress-indicators>

|Linda D - Design Evangelist|:
We don't currently have published design guidance on that particular style of progress indicator (when it becomes more common the platform we'll consider).

|U03JDNMQDKN|:
Gotcha! Thanks for your answers, <@U03HBHWCB4N> and <@U03DMQBFPH8>. I really enjoy reading through the conversations going on here.

|Linda D - Design Evangelist|:
Although from prior experience I can say that what that toasts are tricky to work with. The one you're seeing in iOS 16 is nice because it's using a deliberate "x" close button so people can dismiss the UI and it knows the process takes long enough that the toast won't magically disappear in 1 sec making it impossible to read or interact with

|U03JDNMQDKN|:
So it's not disappearing automatically after the batch edit has completed? I need to try it myself, I guess…

|Linda D - Design Evangelist|:
It is disappearing automatically after the batch edit completes, but the reason it appears in the first place is that batch edits take time so it's appropriate for this context

--- 
> ####  In the "Explore navigation design for iOS" session there is an example of a "Profile" Tab which I've seen several apps using, but others like f.e. the Appstore uses Profile as button in the top-right side. Does that depend on the importance of such a Profile screen ? in other words, What makes something to be a "tab-worthy" ?


|Sarah M - Design Evangelist|:
Great question, <@U03J1TN6WBD>. This is a judgement call based off of the importance of the profile. In many cases, the profile is not that important to the apps main functionality and it isn’t needed as a tab bar item.

|Sarah M - Design Evangelist|:
When considering what should be a tab, think of your apps menu of options. When tabs are designed well, they tell a story at a glance about what your app can do and how people can use it. Profile tends to be less important in the scheme of things.

|Sarah M - Design Evangelist|:
And just because you have tabs to use, doesn’t mean you have to use them all. Sometimes an app will feel more approachable if the tabbed navigation is simplified

|Adam H (no title)|:
Agree with <@U03HBHWCB4N>. Also, if the user needs to access the Profile content regularly and you don’t want to place a profile button in the nav bar of every tab, a profile tab may be a better option.

|U03HMCT187R|:
Side note I wish the Updates tab were restored in App Store, I check for app updates multiple times a day and read the release notes. Def inefficient to open the profile screen. (Yes I might have a problem :laughing:)

--- 
> ####  Another "heated" topic: where to put the X/close/cancel button - top left or top right? Are there really no guidelines about it? Confuses the hell out me (as a user and developer)


|Majo C - Design Evangelist|:
<@U03JRNE4KJL> I totally understand how this could be confusing. You’re right, top right accessories are used for the main actions. But in the case of Modals there might be other resources more suitable - like buttons - to convey important actions. So Close takes the top right place.
I’d say that prioritization of the actions on screen are key here, once you have a clear understanding - you could decide what’s the best pattern to follow.

|Linda D - Design Evangelist|:
<@U03JRNE4KJL> a bit late but your question is answered here: <https://wwdc22.slack.com/archives/C03H77GM1NW/p1654807862947179>

--- 
> ####  It struck me that tab bars and navigation bars are, at least in principle, identical to the original iPhone interaction paradigm. I’m wondering what the biggest difference you’ve seen in navigation is, since that first iPhone?


|Sarah M - Design Evangelist|:
I love this question. I wish I had the time to answer more thoroughly. Here are some thoughts about tab bars and navigation bars: these components and interaction patterns clearly resonated with people. Maybe that was luck, maybe it’s a pattern that reflected our natural understanding of how things are organized and arranged already in the world around us. But they have evolved and modernized while staying true to what ‘just worked’ originally. As people’s comfort with apps grow, new patterns emerge to support new complexity such as sidebar being a solution specific to a new device and form factor

--- 
> ####  Thank you for such an amazing WWDC! I definitely learned a lot this week. One last question from me: what are some books/resources that you would recommend every designer to read for design guidance, creative inspiration, best practices, etc (besides Apple's HIG, of course)?


|Linda D - Design Evangelist|:
For me:
• <https://www.goodreads.com/book/show/9386.Free_Play|Free Play: Improvisation in Life and Art> – Not specific to UX but this has really helped me unblock myself creatively 
• <https://www.goodreads.com/book/show/111113.Interaction_of_Color|Interaction of Color by Josef Albers >– Great color theory resource
• <https://www.goodreads.com/book/show/44735.The_Elements_of_Typographic_Style?from_search=true&amp;from_srp=true&amp;qid=Q1DklR77Li&amp;rank=1|The Elements of Typographic Style >– Great typography resource
• <https://www.goodreads.com/book/show/34473.In_Praise_of_Shadows|In Praise of Shadows >– Lovely essay on aesthetic

--- 
> ####  I lost the description of Stickers and Sticker packs from HIG. Where can I find them?


|Mike S - from Design Evangelism (Apple)|:
<@U03HVBUV0KY> This will be coming back soon!

--- 
> ####  I have heavy use of swipe buttons on different rows of a "tree control". (TableView with lots of different cell types).  I've not found any recent writing on swipe button discoverability but watching people, _average users_ don't seem to explore to see if swipes are available on lists.   Any suggestions on affordances or onboarding approaches? I've thought about an initial animation of sliding things over enough for a button to _peek_ through.


|Sarah M - Design Evangelist|:
Since swipe actions are more for power users, we always recommend that they are _also_ exposed in the detail view. For example, if there’s a delete action on your table cell, make sure there’s a delete action in a toolbar, navigation bar or in-line within the secondary view.

--- 
> ####  Hi, I really enjoyed the session on the new iPad navigation bar for document-based apps. I just did a lab to explore this further - one of the suggestions was to adopt a layout/hierarchy similar to the Notes app.   I wanted to ask if there is any API for the file explorer (lists and grid view) that the Notes app uses. I would like to adopt this in a sidebar as well, and move my document-based app away from a tab controller. Thanks.


|Sarah M - Design Evangelist|:
Hi <@U03JGS1CE2H>, thank you for the question, I’m not sure about an API specifically (I’m just a designer!). But here are two resources from the session side that may be helpful for you:
1. The session Designed for iPad, which dives deep into the design for Sidebar 
<https://developer.apple.com/wwdc20/10206>

2. This year’s session about Desktop Class iPad apps which covers some tips for the new toolbar design
<https://developer.apple.com/wwdc22/10009>

|Sarah M - Design Evangelist|:
Just realized you referenced the second video in your message, it’s been a long week :sweat_smile:
