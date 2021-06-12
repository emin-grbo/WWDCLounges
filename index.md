## SwiftUI Lounge QAs

### Q:
What's your recommended approach to displaying a new macOS window? Not a new document or a confirmation dialog, just "here is some information that makes sense to show right now", such as unlocking an IAP. I've seen hacks with `handlesExternalEvents()` but it's not very pleasant.

### A:
We don’t have much API in this area. A NavigationLink when used within a commands context will open a new window, and as you noted, handlesExternalEvents can be used to, though this is primarily due to the default behavior of that modifier, which is to create a new window for the given scene, if no windows prefer to handle the event. We’d love a feedback for this functionality, and if you can share any specifics of your use case in it, that is even better. Thanks!

---
### Q:
For SwiftUI macOS document apps, is there a recommended way to save and restore window size and position?

### A:
Hi, when state restoration is not enabled on macOS, this is expected behavior at the moment. We’d welcome a feedback for this, though. If you could include any information about your use case as well, that’d be very helpful. Thanks!
---
### Q:

### A:
