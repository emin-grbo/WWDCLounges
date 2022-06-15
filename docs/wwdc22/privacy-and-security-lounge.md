# privacy-and-security-lounge QAs
#### by [shirblc](https://github.com/shirblc)
---

> ####  Do passkeys require a device passcode and biometrics to be enabled?


 They require iCloud Keychain to be turned on. In most cases, this requires at least a passcode. There’s a lot more detail in the article <https://support.apple.com/en-us/HT213305>

---
> ####  How are passkeys protected if someone gets access to your iCloud account?


 There’s a brief explanation of the various protections in the article published earlier today <https://support.apple.com/en-us/HT213305>, with a more in depth explanation in the Apple Platform Security Guide

---
> ####  Is there anything similar to android’s protected confirmation (<https://developer.android.com/training/articles/security-android-protected-confirmation),|https://developer.android.com/training/articles/security-android-protected-confirmation),> to provide a signed proof that a user has seen and agreed to a statement, for things like approving payments, or any plans to provide this in the future?


 Not at this time! We’re open to feedback about this. Please send feedback via Feedback Assistant with a clear explanation of what you’d like to do with this ability. We’ll take this information to standards bodies to work on this, if we agree it’s important to do in the near term.

---
> ####  Is there a way to mark a passkey as non-shareable, so it can’t be sent from one iCloud account to another?


 There is not.

---
> ####  Can you use passkeys for forms of authentication other than sign in? For example, as additional authentication for a stock trade or money transfer in a financial app?


 You can. However, there isn’t a way for your app or website to specify that intent such that it’s communicated in the system Passkeys UI to the user. If you’re interested in this, please send us feedback via Feedback Assistant. We’d be happy to think about this!

---
> ####  Can passkeys be locked to a single device?


 No. A passkeys is saved to a user’s iCloud Keychain so that it’s backed up and available on all of their devices. We think this is a great thing, because it makes passkeys safe and easy-to-use. There’s a new document about Passkey and iCloud Keychain security available here: <https://support.apple.com/en-us/HT213305>

---
> ####  Can you require biometric authentication for a passkey?


 You can, but we don’t recommend it. Check out the Meet passkeys video around 18:23.

---
> ####  Passkeys look great, though as I understand it webauthn doesn’t support transaction text in the FIDO authentication, so presumably passkeys don’t provide this either, if it’s even possible to use a passkey to authenticate an action in this way, like a payment approval?


 We currently do not support this, but it sounds interesting! Please tell us your use case in Feedback Assistant, so that we can take a look at it :slightly_smiling_face:

---
> ####  Is it possible to add passkeys as an additional way of signing in for an account that was created with "sign in with apple ID"


 It is not.

---
> ####  Have you published documentation on how to parse and verify a passkey attestation on the server?


 Passkeys do not provide attestation statements. If you have a use case where attestation is required, we’d love to hear about it through Feedback Assistant :slightly_smiling_face:

---
> ####  Is the private key for a passkey stored in the Secure Enclave?


 Passkeys use iCloud Keychain for their security. Their on-device security properties are identical to those of passwords saved to iCloud Keychain. <https://support.apple.com/en-us/HT213305>

---
> ####  Hi there! I really like Passkeys and I think they are really necessary as the computational power increases (otherwise we would have to remember / store very long passwords), so I think this is a great alternative to old passwords.  Could you explain how it works, especially on the backend side, since they cannot be stolen from the server (from what I understood, there's nothing to steal)?


 Thanks for the kind words!

There’s an explanation of how passkeys work in the video that was released this morning. Have you watched this? <https://developer.apple.com/videos/play/wwdc2022/10092/>

---
> ####  Can multiple passkeys for the same site be stored in iCloud? Can a sign-in fall back to a QR code if you don't want to use the iCloud passkey?


 Yes, multiple passkeys can be saved for the same site in iCloud Keychain.
Yes, users will have an option to choose to instead sign in with a nearby device using a QR code.

---
> ####  Are there any recommendations for testing webauthn/passkey integrations locally, for example on the Simulator via a server running on localhost?


 Passkeys should fully work with locally hosted developer environments, though you’ll need to make sure your dev environment’s hostname matches your RPID. There is some support for testing in Simulator, but it’s limited as Simulator does not support iCloud Keychain

---
> ####  If passkeys are stored in iCloud Keychain, is it right to assume that they sync between multiple (Apple) devices? What if a device including its stored keys are compromised? Would it be recommended to create a passkey per device for easier revocation?


 &gt; If passkeys are stored in iCloud Keychain, is it right to assume that they sync between multiple (Apple) devices?
Yes, that’s exactly right.

&gt; What if a device including its stored keys are compromised?
Then whoever compromised that device has access to the passkeys! It’s really important to think hard about what this means: that someone with physical access to a device has gained access to the device’s passcode.

Please compare this threat model to the more common, prevalent threat model of online phishing, password compromise via a website leak, and password reuse.

&gt; Would it be recommended to create a passkey per device for easier revocation?
No. Not only is this not possible with passkeys, but it would inconvenience the user. Replacing passwords for people means giving them a delightful, fluid experience.

---
> ####  Hello there, first of all, let me know that passkeys are mindblowing!! I'd like to know if to support passkeys you need to implement it only client side or is there some server to server logic for keys exchange and signing? Thank you


 Hey Christina! :wave: There is some server side work to do. Your backend needs to learn how to speak WebAuthn and FIDO.

---
> ####  Is it possible to export generated passkeys? What file format are they using? (Is it a plain text format?)


 Not at this time. However, data portability in the way that you’re describing is extremely important. We understand why this is desired.

---
> ####  What does an account recovery process look like for someone who only ever signed in with a passkey?


 The recovery method for an account is independent of the authentication mechanism. Websites are welcome to continue to use the same recovery methods they use today, such as sending a link in an email to create a new passkey

 Recovery will likely be a much less common scenario with passkeys though, as they’re guaranteed to be saved by the device and there’s nothing for a human to forget

---
> ####  Is anyone going to work on a Rust based server side tooling that supports passkeys or webauth etc, that supports Apple Passkeys, or is there a library that already exists for this? I want to implement passkeys for authentication/authorization for my multiplayer server framework. Thanks :)


 There are open source libraries for server-side tooling. One such rust library is <https://github.com/kanidm/webauthn-rs|webauthn-rs>.

---
> ####  Hey folks, love the passkeys work, thank you! I'm curious to know what the stance would be from your side on Sign in with Apple vs passkeys? Is it recommended to implement both? If not, what are the implications for the review guideline wrt other social sign in methods?


 &gt; Hey folks, love the passkeys work, thank you!
Thank you! :green_heart:

&gt; I’m curious to know what the stance would be from your side on Sign in with Apple vs passkeys?
We don’t think of this as a conflict!

Sign in with Apple is a privacy-preserving federated authentication system. It makes it really easy for a user to get up-and-running, and for your app or website to onboard a user.

Passkeys are a *replacement for passwords* that are _far more secure than passwords_.

This distinction might seem subtle at first, but it’s really key — Sign in with Apple gives your user an _account_. Passkeys are an authentication technology that replace passwords.

---
> ####  Can a single user have multiple passkeys for my app ? (one generated from a first device, and another from another one ?)


 Hey <@U03JJAEKX4H>:wave: Yep! You can have multiple credentials for a single app :slightly_smiling_face:

 <@U03JJAEKX4H> Curious about your :x:. Is that not what you’re seeing?

---
> ####  Just curious, why usernames as the visible account identifier instead of an email address? Is it possible to use an email? (This would coexist with existing login UI much easier)


 Totally possible! We’ve used user name as an example in some places, and email in others. Nothing about account identifiers has to change. Passkeys are a replacement for _passwords_.

---
> ####  Is there anything about the device that is being used that is passed along to the server during passkey authentication?


 Nope! Any network traffic would be between your app and your server (fetching the authentication challenge, returning the assertion result to your server for verification). Anything you include in your traffic is entirely up to you. Everything else happens on device.

---
> ####  If iCloud Keychain syncing is down, what happens if in the meantime two devices generated passkeys for the same username? Once iCloud is working again, do both passkeys end up in iCloud, or does one 'win' ?


 The “identity” for a passkey is actually a hash of the public key. So if you created two passkeys for the same user name, they’d have different public keys. You’d end up with two public keys.

This is dissimilar to passwords in iCloud Keychain, whose “identity” is the literal username.

 This doesn’t mean that “changing” one’s passkey will make duplicated passkeys. I was just answering the specific question that was asked. :slightly_smiling_face:

---
> ####  Do you anticipate that passkeys will be used in an enterprise setting, or are they purely for consumer use?


 Hey Jonathan! Passkeys are not just for consumer use. They are a replacement for passwords, and they’re intended to be used anywhere passwords are currently used.

---
> ####  Will it be possible to login to an account protected by a passkey on, for example, an iPhone that will not support iOS 16?


 Great question! For devices that don’t support passkeys, you’ll likely want an alternate method of sign in, which may take the form of something like a magic link or a backup password/2FA method. This will become less common with time, as more devices and platforms support passkeys

---
> ####  Can you describe the authentication flow when a passkey on an iPhone is being used to authenticate an application using Chrome on Windows?  Does all that work now?


 Yes we can! It’s actually super cool, and pretty important to understand.

Check out 28:23 of <https://developer.apple.com/videos/play/wwdc2022/10092/> for a technical description of how the cross-device, cross-platform sign-in mechanism works. In the State of the Union, we demoed this capability working in Google Chrome.

---
> ####  Can Passkeys be used with Managed Apple IDs?


 Not at this time, no.

---
> ####  Eryn W (Apple)  1 minute ago @Jean-Christophe Curious about your :x:. Is that not what you’re seeing?  I can't answer in the thread. I wanted to send you a sign because it wasn't my initiale question.  I didn't mean can multiple user generate multiple passkey for my app, I mean't can a single user gets in a situation where it has multiple passkeys generated ? (maybe on different device).  This relate to how and when the private key is save on device. If the server deny the authentication because he already know another public key for this user, how can the user use the correct passkey ? (or maybe this can never happen, and I'm interesting to understand why we are protected against such a thing, as passkey may not be already shared between my iphone and ipad and/or mac)


 In WebAuthn with security keys, it is already expected that websites will have multiple valid credentials for an account (i.e. one per physical security key). This is also true when using passkeys, as a user may have one passkey for an account saved in their iCloud Keychain, and another passkey saved for the same account on another platform.

---
> ####  If someone’s device is stolen, can they revoke the passkeys in their iCloud Keychain?


 This concern is addressed more comprehensively for Apple ID and iCloud: devices can be remotely wiped entirely.

---
> ####  My interpretation of the FIDO2 spec was that syncing keys across devices is discouraged, and that multiple device support should be achieved through generating new keys which are derived from the same authenticator (e.g. Yubikey). Am I misunderstanding something in the spec?


 The thinking here from the FIDO Alliance itself has evolved. See <https://fidoalliance.org/multi-device-fido-credentials/> for more information.

---
> ####  How can we help existing users using password migrating to passkey ?


 This is an awesome question!

The first step what we’re all at now is to start supporting passkeys on websites and apps. If we start doing this, we can offer this capability to customers. User interface patterns will emerge, and we’ll all be able to ramp up how many folks are encouraged to switch to passkeys.

The first step is adopting the technology.

---
> ####  Is there any way to achieve Sign in with Apple on a multi-tenant platform without publishing all the branded iOS apps on one account?


 This is a great question to bring to one of the Q&amp;A: Sign in with Apple activities in this lounge later in the week!

There are two, both at 1pm PST on Thursday and Friday. Search for “Q&amp;A: Sign in with Apple”.

---
> ####  Is there support for setting a preference for which algorithm (IE; P-256 vs Ed25519) is used for making the passkeys?


 Passkeys on Apple devices only support the ES256 algorithm

---
> ####  Ventura brings notifications when Login Items are added which are LaunchDaemons and LaunchAgents. Standard users appear to be able to disable these items in System Settings. This will break all macOS management tools. Will there be a way to manage the permissions for users to disable/enable Login Items?


 We’re focused on passkeys in this Q&amp;A. This is a great security question for a Security lab appointment to make sure that you talk to the right people. There are two later in the week: Wednesday and Friday.

---
> ####  Will passkeys be usable to setup a new device? For example, if I buy a new iPhone?


 Passkeys aren’t currently used in this way. Setting up a new device securely and quickly is handled through the “Quick Start” mechanism. <https://support.apple.com/en-us/HT202033>

---
> ####  Can the private key for a passkey be accessed by an application on the device?


 No.

---
> ####  What options will people have to use FIDO2/passkeys on iOS if they aren't able to use iCloud Keychain for any reason?


 You can sign in to an account on a device running iOS 16 or iPadOS 16 using a passkey from another device, including devices on other platforms, even without iCloud Keychain. However, passkeys cannot be created on Apple devices without iCloud Keychain turned on

 Saying that another way:
• You cannot create a passkey on an Apple device without iCloud Keychain setup. When attempting to register a passkey, the user will see a screen asking them to turn on iCloud Keychain.
• You _can_ use cross-device passkey sign in to sign in to an account on an Apple device without iCloud Keychain. For example, if you have a shared iPad without iCloud Keychain, users can use the passkey from their iPhone to sign in to their respective accounts

---
> ####  This really excites me – here’s to hoping we’ll see passkeys pop up everywhere soon!   My question: When already (password) authenticated users register a passkey, is it best practice to disable password-based logins for that user and delete their password hash, or should the user be able to keep the password login option, possibly degrading security for their account?


 That is a best _security practice_, yes. However, that might not be the right answer from a _usability_ perspective, especially at this time, during the transition.

Disabling password-based logins will be safer in a world with more and more devices compatible with passkeys. To start, you might want the user to keep their password around for signing in on devices without passkey compatibility.

This is really a personal choice for you and your user.

---
> ####  What advice do you have for people trying to get internal buy-in for passkeys/FIDO2? I'm facing skepticism that users will be willing to replace passwords, but I don't have any evidence to prove that they are.


 <https://www.apple.com/newsroom/2022/05/apple-google-and-microsoft-commit-to-expanded-support-for-fido-standard/>

Passkeys are happening, across the industry. People have already used their devices to replace older ways of doings things, and now it’s happening with passwords. The wide industry support means that there’s a really great chance that this succeeds.

People hate passwords. Constantly forget them. Feel guilt about not using them properly. Passwords are honestly pretty unpleasant.

This is a chicken and egg problem. Users have a right to be skeptical about this — we, collectively as an industry, haven’t shown them that passkeys are awesome _*yet*._ Your organization can be on the earlier side of making this industry-wide transition happen, or on the later side.

As you weigh this timing, make sure y’all are considering the user experience and security benefits of establishing unphishable accounts.

---
> ####  Say <http://example-a.com|example-a.com> has to move to <http://eample-b.com|eample-b.com> – will all current passkeys for <http://example-a.com|example-a.com> become unusable on <http://example-b.com|example-b.com> after the transition?


 This answer has 2 parts. For apps, you will need to make sure your app is associated with both <http://example-a.com|example-a.com> and <http://example-b.com|example-b.com>. This will let your app continue to generate passkey assertions against the original domain

 One of my colleagues is going to follow up with how this affects passkeys flows on the web

 For websites, a cross-origin i-frame may be used for authentication across domains. More information about these can be found here: <https://www.w3.org/TR/webauthn-2/#sctn-iframe-guidance>

---
> ####  After authenticating users with Sign in with Apple or passkeys, is the best way of authorising a user on your API using refresh &amp; access tokens?


 Passkeys are a replacement for passwords.

Replacing passwords doesn’t necessitate changing your local auth token/cookie story.

---
> ####  Will this Q&amp;A be available after the session has concluded?


 The digital lounge content will be available for the duration of WWDC, and a period after that as long as the workspace is up.

---
> ####  are passkeys created on a subdomain locked-in or would they apply to the whole domain? And inversely, do passkeys created on the primary domain apply to the subdomains?


 You can specify a `rpId` when creating a credential or performing an assertion. This is the rpId that will be associated with the credential or used for fetching credentials. This can be any registrable domain suffix of the the effective domain.

<https://www.w3.org/TR/webauthn-2/#dom-publickeycredentialrequestoptions-rpid|Example from the spec>:
&gt; For example, given a <https://www.w3.org/TR/webauthn-2/#relying-party|Relying Party> whose origin is `<https://login.example.com:1337>`, then the following <https://www.w3.org/TR/webauthn-2/#rp-id|RP ID>s are valid: `<http://login.example.com|login.example.com>` (default) and `<http://example.com|example.com>`, but not `<http://m.login.example.com|m.login.example.com>` and not `com`.

 Cross-origin assertions via iframes are also an option.

---
> ####  Are passkeys supported with Managed Apple IDs? If not, why not, and is there any effort within Apple to support this for their enterprise customers?


 Managed Apple IDs do not currently support passkeys

---
> ####  Why doesn’t Apple support WebAuthN in the MDM Automated Device Enrollment’s web auth (<http://developer.apple.com/documentation/|developer.apple.com/documentation/>…)?


 Hi. Your link got cut off, we'd love to hear more. Please send feedback via Feedback Assistant with an explanation of what you’d like to do with this ability.

 Thanks <@U03JFEFGUBY>, we got your FB#s!

---
> ####  Do passkeys support the PRF webauthn extension?


 WebKit does not support the PRF extension at this time. We'd like to learn more. Please file a bug on <https://bugs.webkit.org> bug with your use case.

---
> ####  Can we get an upto date repo of the Shiny demo? I couldn't get it to compile on the latest Xcode, thanks! Or if there is a Github link.


 I meant to answer this earlier today, but didn’t hit send. The repo has been updated: <https://developer.apple.com/documentation/authenticationservices/connecting_to_a_service_with_passkeys>

---
> ####  If we don't currently utilize CAPTCHAs, is there a way to implement this and still be compatible with older browsers? I'm not sure what to do after the server sends the 401, but the browser can't respond.


 Yes, you can absolutely utilize Private Access Tokens even if you don't currently have CAPTCHAs. However, it is important to make sure you still support clients that can't respond to the 401 challenge.

In general, you can send the 401 challenge to see if the client will respond with a valid token. That let's you know for sure that they're a legitimate client. Not getting a token doesn't mean for sure that they're not a valid client, though — even iOS 16 clients can get rate-limited and sometimes won't return a token.

If you do have a CAPTCHA system, you can fall back to it if you don't get a token quickly. But you can also have a fallback to a two-factor auth system, or requiring more user info. Or, if you're simply being overwhelmed by what looks like fraudulent activity, you can prefer letting the clients with tokens through.

---
> ####  Passkeys question: 1. Introducing passkeys has replaced the traditional platform authenticator registration, which raise the question whether or not a developer could identify the type of a registered key being used (hardware bound vs passkey) 2. Is there a way to still enforce a key to be hardware bound? 3. Is there a plan to allow a migration option for existing hardware bound keys to become passkeys? 4. Does passkeys support discoverable credentials?  5. Is there an option to build the passkey QR code by ourselves?


 Hi <@U03JRF2U93L>, this is a Q&amp;A about Private Access Tokens. The passkeys Q&amp;A was earlier in the week. There’s still an _Authentication Services lab_ on Friday. You should apply for a slot there to ask these questions.

---
> ####  In labs, we’ve gotten a common question: what's the best way to try these tokens out?


 As we announced, we support two token issuers right now, from Cloudflare and Fastly.

For each, you need the token issuer name, and their public key. Here’s the info!

Cloudflare:
<http://demo-pat.issuer.cloudflare.com|demo-pat.issuer.cloudflare.com>
`MIIBUjA9BgkqhkiG9w0BAQowMKANMAsGCWCGSAFlAwQCAqEaMBgGCSqGSIb3DQEBCDALBglghkgBZQMEAgKiAwIBMAOCAQ8AMIIBCgKCAQEA6T_4uXx1RZ6BzvwWbgOb0zMGwipfqt1XQ2EgoTh3p6uCh1EATk8sVDkdFTz-kDwczVS9W0Zt5mLWi9Avksd29wXJ_9oM-pTqjblP97M9wKOgsDHy9HrHrFpJvHVgpKzUKwDKIkHlej531xatZb2p5itAwroSQMasUbGmqAfm9NlPLUmRX1P4B7Rb7IbuIWvDZuPMQpb9CrFhQ3RfX7K8UTZvfcTGDiQ2aEuLEVmI6lj_LJf-zdTkIPNdcnhDLlYl7CtOkWNoq1p-psLQBkLdA7HN3dZgUtrz5GhPdxBf8vzdjZzMX6bfMQ-jwECAl6MktwTlN3RYyk6Ar_YqtDewpwIDAQAB`

Fastly:
<http://demo-issuer.private-access-tokens.fastly.com|demo-issuer.private-access-tokens.fastly.com>
`MIICUjA9BgkqhkiG9w0BAQowMKANMAsGCWCGSAFlAwQCAqEaMBgGCSqGSIb3DQEBCDALBglghkgBZQMEAgKiAwIBMAOCAg8AMIICCgKCAgEAubzND7lvK-u5aIFHSt_NHIzsUFuHCiwVm88kvUvbvJbjj4be_IdNwpfdfXz-vq6NeEwlKEDLtD9oMVop_kEf5HEBkiipBrcn10h17XvYPuc6lA7Z4Y8IjvSjLVydXmcabmslwreMysD1ZINjzadjlJxiIKWCeS_3OJ4dxMTirt8HMUl8cRQafTjSOBJIZNtoNiT5rr5_5SYfEQW8v25RZcitkL0Lrg1mkSutRR00EE3zMelQBGR0sf8jDgBRiPQ1-sSgaIicIciZ2ysiPdkQZBIDpIFnvqed4yKY9gZCn-ASztoe1JhJvzWUwO7Nyz1Mb6pxAV0aQNfb0rDMTPNtyF4z7kgtFcsr5SXiJUa13bm0G2QvEdhl177poghh2RDaT5tcEmiRRvdQWBTeVgFyjrX3-29TZCT4z8VyvDxPPIUIi2rN8-9lN6mmsF0KhlyKe4jUuDwK7dc6Q0gZyjKiE3n-ygErrlbOYU16MGQiJQRV6Z8j38OSD4Lf5-SzsgkAa6Zbv95Zf8TZRS-fuagiXGZcmfdO9zXkuNlRlGguEUpx520SANRciPIBZxFBDXga6kcT9Hfha0n97Mhq57kFRe2Cox7qpq79x9TjUvHOZkWMSv2KmZpoF0wbI2NvlZngbW6Z1hC-X4C3evilX7O498r45Ct7PNjq11Qjso82DwMCAwEAAQ`

---
> ####  I couldn't reply to the thread from my previous question. I'm still uncertain how to implement the fallback. The server sends the 401 and typically washes its hands of the request. So then is it on the browser to parse the 401 and initiate another request asking for the fallback option? That seems vulnerable to a replay. And, not that we do this, but if the initial request was not an AJAX request, the browser would just be sitting with a 401, right?


 Thanks for the follow-up!

Your 401 challenge can either come from your main resource load — in which case you should also send a body with the response of the page to show — or it can be in response to separate connection request that you trigger using javascript, etc.

A client that can't fetch a token, or doesn't know about this auth type won't respond to the 401 at all with any auth type.

So, if this was your main resource load, a client that supports tokens would fetch a token and return it to you before loading the page; and a client that doesn't support tokens or can't fetch one, would load the page returned with the 401.

If this was a secondary load triggered by (for example) javascript, you could have a heuristic to recognize when the client isn't responding to that challenge, or have it load some content based on body of it's response.

---
> ####  Another common question: Tokens are one-time use only, but how do I enforce that on my server?


 It’s important to prevent “replay attacks” when your server is receiving tokens. iOS and macOS won’t ever send a token multiple times, but your server still needs to prevent this behavior.

There are two ways you can do this:
1. Remember what tokens you’ve received. This is a classic approach to replay prevention where you have a database, which may be shared across your server instances, to keep track of token spending. The downside here is the complexity of maintaining this shared database.
2. Make each token sign a unique value! That way when you receive a token, you can just check it against what you expect. To do this, you include a 32-byte “redemption_context” in your challenges.

---
> ####  I've just watched the session video. Is documentation made available on <http://apple.com|apple.com> about Private Access Tokens (in terms of the actual technical implementation/usage), or is it entirely covered by IETF 'Privacy Pass' documentation, and the session video is to announced its introduction to Apple's OSs? (I don't see any associated links under the session video, so I'm not sure)


 Great question! As of today, we have a coding challenge that is linked to the video that provides some of the detailed specifics:

<https://developer.apple.com/news/?id=huqjyh7k>

This explains how to use the Privacy Pass specs, and links to the documents.

Specifically, your challenges use the format defined here:
<https://www.ietf.org/archive/id/draft-ietf-privacypass-auth-scheme-02.html>

And the token type is "2", which is the publicly verifiable blind RSA signature token defined here:
<https://www.ietf.org/archive/id/draft-ietf-privacypass-protocol-04.html#name-issuance-protocol-for-publi>

---
> ####  FAQ: How are these tokens private? Does Apple or the token issuer get to see the pages I’m accessing?


 Neither Apple nor your token issuer gets to see what the client is accessing! There are two cool ways this is made private:

1. The token challenge includes the server name, but before the token request is sent to the Apple attester or the issuer, the RSA blinding operation obfuscates all of the content. When the token issuance completes, the client transforms it so the server can recognize the token, but the issuance flow cannot recognize it.
2. Tokens are fetched in batches and are cached by the client, so not every token issuance corresponds in time to a server requesting a token.

---
> ####  Am I right that: sending a token challenge with a unique `redemption_context` prevents client-side caching (and a new token is always fetched)?


 That's right — a unique redemption context means that the client can't cache, and needs to fetch a new token.

If you have an empty redemption context, the client will fetch batches of ~5 tokens at a time.

One subtlety here is that you _could_ use a redemption content for multiple challenges. Let's say, you have a context that you use for all requests that come from a given region, etc. In that case, it's theoretically possible for the clients to recognize that the challenges have a matching context, and optimize things by fetching a batch.

---
> ####  FAQ: How do Private Access Tokens relate to the DeviceCheck attestation APIs?


 The attester for Private Access Tokens is checking a lot of the same things as DeviceCheck. There are a few key differences, however:

• Private Access Tokens work both from an app and through web browsers, like Safari; DeviceCheck only works through your app.
• DeviceCheck requires that your server checks in with an Apple Server. Private Access Tokens are publicly verifiable, and don’t require your server to communicate with any other server on the validation path.
• Private Access Tokens uses a standard protocol model that will allow other platforms to define their own attesters, so your servers don’t need to write specific code to handle different platforms and operating systems.
• Private Access tokens only work when the user is logged into a device with an Apple ID, and the Apple ID is in good standing.

---
> ####  FAQ: Can tokens be redeemed across multiple websites?


 Yes! This is up to how you send your token challenges.

The “origin_info” field in the challenge defines which servers can receive tokens associated with this challenge. If it’s empty, then the client can cache tokens for the token issuer and use them across any website that leaves the origin info empty. The origin info can just include one hostname if you want it to only apply to your server, or it can include a list of hostnames to work with multiple.

Note that the actual server that sends the challenge _must_ be listed in the origin_info field if it is non-empty.

---
> ####  If we are using `WKWebView` in our applications, will there need to be changes to support passkeys (i.e. a new `URLAuthenticationChallenge.protectionSpace.authenticationMethod` to handle)? Or will it be handled natively within the WebView?


 For Passkeys (which is different from this Q&amp;A session on Private Access Tokens), please sign up for an Authentication Services lab for this Friday, or ask on the developer forums!

From what I know, though, WKWebView doesn't support passkeys.

---
> ####  Should we replace `Sign up with Apple` with `Sign up with Passkey` on our Sign up flow, leaving `Sign in with Apple` only for the flow when the user says he has an account?  Are there human interface guidelines regarding how we should design `Sign up with Passkey` and which logo to choose?


 In general for Passkeys (which is different from this Q&amp;A session on Private Access Tokens), please sign up for an Authentication Services lab for this Friday, or ask on the developer forums.

This particular question was addressed during the Q&amp;A for passkeys, too!

<https://wwdc22.slack.com/archives/C03H77CBZ7D/p1654634529781859?thread_ts=1654634338.561809&amp;cid=C03H77CBZ7D>

---
> ####  Is it a known issue that the Sign In with Apple button is visually blank in a Mac Catalyst app on Ventura? I encountered this once but wasn't sure if it was an app issue or on Apple's end.


 The team is aware of this issue, and we’re looking into it! Please file a bug report using <http://feedbackassistant.apple.com|Feedback Assistant> with additional context, and provide the Feedback ID for us to look into it further

---
> ####  Is it possible to Sign in with Apple on Mac apps distributed outside the App Store? If not, how can I support users on Mac who have existing accounts with Sign in with Apple?


 Hi!

You cannot use the Native API for applications that will be distributed outside the AppStore as the entitlement is only available that way.

However the Rest API as well as the JS API are options that are available for all platforms including macOS apps that ship outside of the AppStore.

 Thank you!

 Important to note that an App in the App Store is also required for Sign in with Apple to work on that configuration.
Even if the application is marked as "Not for Sale" in the developer portal.

---
> ####  One of my kids can't use their AppleID to create an account for a game. Apple Support suggested it might be a developer issue, so I tried with a sample App: No luck. No particularly useful error (AKAuthenticationError Code=7076). Where can I find info how to solve this issue?


 He is 15

 (And for Germany, the Apple Page also says 13. It would — at least — be a good thing the users got a useful message like “you are not old enough”)

 Thank you for that feedback <@U03J4CWFAN8>!
It is really useful to know that we have a string that might mislead users and developers.

Would you mind filing a Feedback Request with this information?

 I absolutely will. And also it would be good to understand what the age in my region is, if the age on the Apple page is wrong …

 Here you go: FB10139982. Thanks!

 No, Thank *you* <@U03J4CWFAN8>!

---
> ####  Are we able to ask questions on sessions from other days that’s didn’t have a dedicated Q&amp;A (e.g. endpoint security)?


 We're not necessarily staffed for all areas, but we're happy to try and forward questions here as they come in.  Feel free to submit them or reply here in later activities in the lounge. :slightly_smiling_face:

---
> ####  In iOS 16, it seems some 2FA apps are appearing in the settings app. There doesn't seem to be an extension/api/entitlement to enable this for apps, how can we enable our 2FA app appear in this list?  <https://images.macrumors.com/t/8tEM1CCevYzR5sJGoJbBslBsvjU=/2500x0/filters:no_upscale()/article-new/2022/06/passwords-two-factor-third-party-ios-16.jpg|https://images.macrumors.com/t/8tEM1CCevYzR5sJGoJbBslBsvjU=/2500x0/filters:no_upscale()/article-new/2022/06/passwords-two-factor-third-party-ios-16.jpg>


 The list is populated with apps that register themselves as handlers of URLs with the `otpauth` scheme. This doc talks through how to do that for your app. <https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app|https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app>

 that doc links in turn _For information about the schemes supported by Apple_ to a legacy page <https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007899>

would be nice to have a non-legacy version including important schemes like `otpauth`

 <@U03JELM0ZNV> That’s a good bit of feedback, thanks. :slightly_smiling_face:

---
> ####  I don't really have a question, I just want to say thanks for the amazing documentation!


 :slightly_smiling_face: Thank you for being part of this community. We're really excited to see what you build :rocket:  Enjoy the rest of WWDC22!

 Thank you! You too! Have a great rest of WWDC!

---
> ####  For authentication, do I have it right that these are the two new capabilities? Are there others to notice?   - ASAuthorizationController (choose which account to login with) - Authentication Modification Extension (upgrade to Sign In with Apple or upgrade to strong passwords)


 Hi Jaime, the `ASAuthorizationController` APIs have existed since iOS 13.0. New this year in iOS 16.0 is the ability to specify `preferImmediatelyAvailableCredentials` when calling `performRequests()`. On older releases `performRequests()` does not take any parameter.

 The Account Authentication Modification Extension was introduced in iOS 14.0

 Thank you, perhaps I

---
> ####  I saw that the Local Authentication framework now has LARight, LARightStore for storing secrets. Can this be used for the OAuth access and refresh tokens? It's a nicer API than keychain, but saving it using the secure enclave seems a bit excessive.


 We got a moment to catch up with the team responsible for this and they sent us back with an answer for you here:
&gt; The new API of LocalAuthentication is perfect for protecting this type of refresh tokens. Under the hood this data gets stored in the keychain, and there aren’t any penalties (performance or otherwise) in using the SEP protection it affords; this simply binds the key and the data to a specific device.

---
> ####  I have a question about the Secure Enclave, just trying my luck if anybody here can answer it: When my app creates a private key in the Secure Enclave, is it ensured that only my app can use that key to for example sign data with it?


 The secure enclave is technology behind a number of our APIs, some of which by design allow multiple components of the system to sign with a key, while others allow restricting a private key for use by solely the application that owns it.  Please refer to the API documentation for your specific usecase!
