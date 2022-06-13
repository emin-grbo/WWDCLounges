# Localization and internationalization Lounge QAs
#### by [emin](https://twitter.com/emin_ui)
---

> #### Sometimes there is a difference in font size(width/height) between LTR and RTL , how can we make this better?",

>> There are a couple of things you could be seeing and I’d like to understand which it might be.\n\nThe System Font for some languages like Arabic (which is RTL) uses a *taller line height* than other languages, which you will notice if you’re using Text Styles and have multiline labels or even in the default cell heights in Table Views. In fact, we recommend using Text Styles to ensure that you do get this language-specific tailoring.\n\nDifferent System Fonts also may have *different relative font weights and sizing* and it’s possible that what you’re seeing is as a result of that.

---

> #### Hi all! When editing an .xloc file in XCode, I'm missing one key feature: filtering or sorting the list of keys by whether or not they were translated into the second language. I seem to only be able to sort alphabetically. Am I missing something?
>> Hi Jan!
As you pointed out, Xcloc Editor supports sorting alphabetically and filtering by search terms, but does not support filtering by “translated” or “untranslated” strings.
This is great feedback though! If you would benefit from this feature, please file a feedback report and paste the ID in this thread.

---

> #### Hi! Is there a built-in workflow in Xcode to localize settings bundles? In a way that Xcode would export all the relevant strings to .string files and the Export Localizations menu command would include those automatically into the exported .xliff files?
>>Xcode supports localization export for Settings bundles that are named “Settings.bundle” and contain .strings files.\n\nIf this isn’t working for you, can you explain the setup you’re using and the behavior you’re experiencing?

>>Hi Matt, ok, I understand what my problem was. As you mentioned, the strings from the Settings.bundle plist are actually exported correctly. I'm in addition using the third party \u003chttps://github.com/futuretap/InAppSettingsKit|InAppSettings framework\u003e, which builds on the Settings.bundle format but supports additional key/values and can be embedded into the app. It was its InAppSettings.bundle where the strings weren't automatically exported from the plist. Thanks for the answer!

---

> ### How would you handle the case where you want to provide variations in a language? For example I want to provide localization for the word colour. UK people would see colour, but US people would see color. Is there a way so all other text is shared but I could localize that one word?
>> Hi! Unfortunately, once we find a strings table for a specific lproj, we use the contents of that table as they are without doing any more fallbacks


///////////////////


 How do we format and sort time values in a localized way? for example, if i'm showing a list of hours of operation for the week, the time strings will be different (24 hr vs 12 hr), and the order of the week days will be different (starting on monday vs sunday).",
      "ts": "1654729371.151589",
      "thread_ts": "1654729371.151589",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 12,
      "latest_reply": "1654731370.685159",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "Ith7",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03HWEGHRKR"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"How do we format and sort time values in a localized way? for example, if i'm showing a list of hours of operation for the week, the time strings will be different (24 hr vs 12 hr), and the order of the week days will be different (starting on monday vs sunday).\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "32929a4a-f5c5-41d7-a871-5d35498b0884",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "Hi! For sorting, it would be best to sort based on the original binary data, then use .formatted() to produce a localized time and/or date.",
          "ts": "1654729437.082189",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "DqZ",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi! For sorting, it would be best to sort based on the original binary data, then use .formatted() to produce a localized time and/or date."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "38ec0fa4-6526-4cf4-ac71-6eb54cdb939d",
          "type": "message",
          "user": "U03HWEGHRKR",
          "text": "could you clarify what “original binary data” means?",
          "ts": "1654729471.261499",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "BU3I",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "could you clarify what “original binary data” means?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "748149e0-8419-4e1c-8185-673037c56089",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "How are you storing the days/hours prior to localization?",
          "ts": "1654729490.420009",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "3hP3I",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "How are you storing the days/hours prior to localization?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "a8cee02e-2ecf-4ee6-a180-5674fd8baf0a",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "For example, is it a `Date`, or are you receiving the data in some other form?",
          "ts": "1654729618.187299",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "hzJ=",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "For example, is it a "
                    },
                    {
                      "type": "text",
                      "text": "Date",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", or are you receiving the data in some other form?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "86921fdb-0916-477a-bcd7-e5453061bc20",
          "type": "message",
          "user": "U03HWEGHRKR",
          "text": "it would be a JSON from an API response in english,\n```{\nday: 0,\nstart: \"0700\",\nend: \"2300\"\n}```\nand 0 means sunday as specified in the API",
          "ts": "1654729909.571349",
          "thread_ts": "1654729371.151589",
          "edited": {
            "user": "U03HWEGHRKR",
            "ts": "1654729938.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "zP6",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "it would be a JSON from an API response in english,\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_preformatted",
                  "Raw": "{\"type\":\"rich_text_preformatted\",\"elements\":[{\"type\":\"text\",\"text\":\"{\\nday: 0,\\nstart: \\\"0700\\\",\\nend: \\\"2300\\\"\\n}\"}],\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "and 0 means sunday as specified in the API"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "6ba5f50d-4e7b-4d3f-a066-8efbbb407684",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "Got it. You should be able to sort directly on those strings. For the first day of the week issue, you can check `Calendar.firstWeekday`.",
          "ts": "1654729999.882879",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "/en",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Got it. You should be able to sort directly on those strings. For the first day of the week issue, you can check "
                    },
                    {
                      "type": "text",
                      "text": "Calendar.firstWeekday",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "f36e1246-7cd4-4d61-9cdb-6831cf6d2301",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "(on the current user default calendar)",
          "ts": "1654730012.966799",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HWEGHRKR"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "vfYrZ",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "(on the current user default calendar)"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "526c09f5-f027-4e23-881a-64ef52c311e6",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "To produce formatted times, you'll need to convert the strings to a `Date` object, then use `.formatted()` with the appropriate options to produce the string you want.",
          "ts": "1654730088.772889",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HWEGHRKR"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "uh2",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "To produce formatted times, you'll need to convert the strings to a "
                    },
                    {
                      "type": "text",
                      "text": "Date",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " object, then use "
                    },
                    {
                      "type": "text",
                      "text": ".formatted()",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " with the appropriate options to produce the string you want."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "9ca82cb0-caa2-4533-b12d-849e58f77b62",
          "type": "message",
          "user": "U03HWEGHRKR",
          "text": "thank you!!",
          "ts": "1654730125.394729",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "z94+F",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "thank you!!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "3c7af7b2-cd7f-4b82-9645-e3fddf2a8d87",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "You should be able to put a weekday/hour/minute in `DateComponents` and then use `Calendar`  to make a `Date` from that.",
          "ts": "1654730148.690459",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "phUY+",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "You should be able to put a weekday/hour/minute in "
                    },
                    {
                      "type": "text",
                      "text": "DateComponents",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " and then use "
                    },
                    {
                      "type": "text",
                      "text": "Calendar",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "  to make a "
                    },
                    {
                      "type": "text",
                      "text": "Date",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " from that."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "da00b6c4-18b4-4516-aed7-cc168578c182",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "You can then make a `DateInterval` from two Dates for the range (e.g. \"9 AM - 5 PM\") and then use `.formatted()` on that.",
          "ts": "1654730213.055389",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "eyes",
              "count": 1,
              "users": [
                "U03HWEGHRKR"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "I1kD",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "You can then make a "
                    },
                    {
                      "type": "text",
                      "text": "DateInterval",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " from two Dates for the range (e.g. \"9 AM - 5 PM\") and then use "
                    },
                    {
                      "type": "text",
                      "text": ".formatted()",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " on that."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "675cf625-48b3-43f1-94e1-3ab0f1288d01",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "One more note: when using `Calendar` to convert `DateComponents` to `Date`, set the time zone to GMT to avoid Daylight Time issues. Same with `.formatted()`",
          "ts": "1654731370.685159",
          "thread_ts": "1654729371.151589",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 2,
              "users": [
                "U03HWEGHRKR",
                "U03J21EKNSE"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "u4IaC",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "One more note: when using "
                    },
                    {
                      "type": "text",
                      "text": "Calendar",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " to convert "
                    },
                    {
                      "type": "text",
                      "text": "DateComponents",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " to "
                    },
                    {
                      "type": "text",
                      "text": "Date",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", set the time zone to GMT to avoid Daylight Time issues. Same with "
                    },
                    {
                      "type": "text",
                      "text": ".formatted()",
                      "style": {
                        "code": true
                      }
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "dfaebbe0-611a-4fd4-88ac-8983b2a1fc1c",
      "type": "message",
      "user": "U03HBMCRX0E",
      "text": ":tv: Have you had a chance to watch the *\u003chttps://developer.apple.com/videos/play/wwdc2022/10110/|Localization by example\u003e* talk from \u003c@U03J83G5TT2\u003e, released earlier today :thumbsup:?  Share your highlights in the :thread:!\n\nFor me, I’m most excited about how `ViewThatFits` makes it easy to dynamically switch to a layout that works best for localization, accessibility preferences, and device form factor.",
      "ts": "1654730183.774239",
      "thread_ts": "1654730183.774239",
      "reply_count": 2,
      "latest_reply": "1654730547.891449",
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "+1",
          "count": 8,
          "users": [
            "U03J83G5TT2",
            "U03J83FDB40",
            "U03HJ9M2WKV",
            "U03HBMCRX0E",
            "U03HJA9JVGA",
            "U03H3NEH4CX",
            "U03HJ9NKTV1",
            "U03HJA9AJTU"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "Wx5",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "emoji",
                  "name": "tv",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " Have you had a chance to watch the "
                },
                {
                  "type": "link",
                  "url": "https://developer.apple.com/videos/play/wwdc2022/10110/",
                  "text": "Localization by example",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": " talk from "
                },
                {
                  "type": "user",
                  "user_id": "U03J83G5TT2"
                },
                {
                  "type": "text",
                  "text": ", released earlier today "
                },
                {
                  "type": "emoji",
                  "name": "thumbsup",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": "?  Share your highlights in the "
                },
                {
                  "type": "emoji",
                  "name": "thread",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": "!\n\nFor me, I’m most excited about how "
                },
                {
                  "type": "text",
                  "text": "ViewThatFits",
                  "style": {
                    "code": true
                  }
                },
                {
                  "type": "text",
                  "text": " makes it easy to dynamically switch to a layout that works best for localization, accessibility preferences, and device form factor."
                }
              ]
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "01945b07-857b-4df3-9703-2f1f36a5b380",
          "type": "message",
          "user": "U03HJ9NKTV1",
          "text": "That was a great talk!",
          "ts": "1654730400.429439",
          "thread_ts": "1654730183.774239",
          "parent_user_id": "U03HBMCRX0E",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "heart",
              "count": 1,
              "users": [
                "U03J83G5TT2"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "GWC1V",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "That was a great talk!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "38f63974-fa2c-4e82-b597-785302d0dde6",
          "type": "message",
          "user": "U03HLM4HSAG",
          "text": "Yes, this SwiftUI new feature is really cool:\n```ViewThatFits(in: .horizontal) {\n    HStack {\n        Text(\"\\(uploadProgress.formatted(.percent))\")\n        ProgressView(value: uploadProgress)\n            .frame(width: 100)\n    }\n    ProgressView(value: uploadProgress)\n        .frame(width: 100)\n    Text(\"\\(uploadProgress.formatted(.percent))\")\n}```\nIt chooses between the 3 views based on the available space! Preferring the 1st if it fits",
          "ts": "1654730547.891449",
          "thread_ts": "1654730183.774239",
          "edited": {
            "user": "U03HLM4HSAG",
            "ts": "1654730842.000000"
          },
          "parent_user_id": "U03HBMCRX0E",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "wBvxV",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yes, this SwiftUI new feature is really cool:\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_preformatted",
                  "Raw": "{\"type\":\"rich_text_preformatted\",\"elements\":[{\"type\":\"text\",\"text\":\"ViewThatFits(in: .horizontal) {\\n    HStack {\\n        Text(\\\"\\\\(uploadProgress.formatted(.percent))\\\")\\n        ProgressView(value: uploadProgress)\\n            .frame(width: 100)\\n    }\\n    ProgressView(value: uploadProgress)\\n        .frame(width: 100)\\n    Text(\\\"\\\\(uploadProgress.formatted(.percent))\\\")\\n}\"}],\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "\nIt chooses between the 3 views based on the available space! Preferring the 1st if it fits"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JER2C7MX\u003e asked\n\u0026gt; We have an app that has English only features. Let's imagine that's as an advanced assistant for editing English texts and our assistant doesn't support other languages.\n\u0026gt; \n\u0026gt; If we localize our app, would it improve user experience for people who use English as a second language, or would it only confuse them on why their main language is not supported, since we only expect English texts for now?",
      "ts": "1654730208.169229",
      "thread_ts": "1654730208.169229",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 11,
      "latest_reply": "1654734195.622989",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "2Sb",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JER2C7MX"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"We have an app that has English only features. Let's imagine that's as an advanced assistant for editing English texts and our assistant doesn't support other languages.\\n\\nIf we localize our app, would it improve user experience for people who use English as a second language, or would it only confuse them on why their main language is not supported, since we only expect English texts for now?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "95f8d658-5e73-4278-9198-39a5e61f7b38",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Hi Roman, I think it’ll depend on exactly what your app does.\n\nFor example, hypothetically, if you have an app that points out grammar notes about English, it might still be useful for people to see that information in a language they find easier to understand than English.\n\nSo, if you can share details, I might be able to help give you a more specific, helpful answer :slightly_smiling_face:",
          "ts": "1654730288.704939",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "raised_hands",
              "count": 2,
              "users": [
                "U03JER2C7MX",
                "U03J4K9FD8R"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "=UVTx",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi Roman, I think it’ll depend on exactly what your app does.\n\nFor example, hypothetically, if you have an app that points out grammar notes about English, it might still be useful for people to see that information in a language they find easier to understand than English.\n\nSo, if you can share details, I might be able to help give you a more specific, helpful answer "
                    },
                    {
                      "type": "emoji",
                      "name": "slightly_smiling_face",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "78FAD66D-708E-41CA-BEA7-D3CE5E6CE794",
          "type": "message",
          "user": "U03JER2C7MX",
          "text": "Basically, it is an editor app, which has users' documents. When user creates the doc and fills it with a text, he receives grammar suggestions, as well as clarity, fluency, readability and other suggestions.\n\nEach suggestion is a card that has:\n• previous word/sentence and the resulting sentence\n• detailed explanation of why the user should apply this suggestion in that particular context - like because it sounds unconfident, or because it has a grammatical error, and so on",
          "ts": "1654730773.168349",
          "thread_ts": "1654730208.169229",
          "edited": {
            "user": "U03JER2C7MX",
            "ts": "1654730799.000000"
          },
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03J83G0WQG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "aZgt",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Basically, it is an editor app, which has users' documents. When user creates the doc and fills it with a text, he receives grammar suggestions, as well as clarity, fluency, readability and other suggestions."
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "Each suggestion is a card that has:"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"previous word\\/sentence and the resulting sentence\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"detailed explanation of why the user should apply this suggestion in that particular context - like because it sounds unconfident, or because it has a grammatical error, and so on\"}]}],\"style\":\"bullet\",\"indent\":0,\"offset\":0,\"border\":0}"
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "5542e667-c0cc-4e9b-ad51-c200f2739367",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Right… I think some users—especially those who have less familiarity with English to begin with—could certainly benefit from localization.\n\nHowever, you may want to be cautious about (a) which languages you choose, and (b) how you separate out the “content language” (English) from the “UI language” so that there’s no confusion or aesthetically displeasing mixture of languages.",
          "ts": "1654731061.954199",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HJ9NLS1H"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "oNwjG",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Right… I think some users—especially those who have less familiarity with English to begin with—could certainly benefit from localization.\n\nHowever, you may want to be cautious about (a) which languages you choose, and (b) how you separate out the “content language” (English) from the “UI language” so that there’s no confusion or aesthetically displeasing mixture of languages."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "26476E8B-A12B-4971-95DD-AF343F1B7326",
          "type": "message",
          "user": "U03JER2C7MX",
          "text": "I've been thinking about some extra flow to suggest users who are not from EFL countries to have some pieces of the content being translated to their native language, just like that hint on why they should apply that alert. \n\nHowever, I dunno if users would be ok with English interface since they already write some English texts and the interface is primitive enough to be understandable. But at the same time having some interface parts in the native language, like we as an app just forgot to translate everything :sweat_smile::sweat_smile:",
          "ts": "1654731459.881499",
          "thread_ts": "1654730208.169229",
          "edited": {
            "user": "U03JER2C7MX",
            "ts": "1654731518.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "GeB/j",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I've been thinking about some extra flow to suggest users who are not from EFL countries to have some pieces of the content being translated to their native language, just like that hint on why they should apply that alert. "
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "However, I dunno if users would be ok with English interface since they already write some English texts and the interface is primitive enough to be understandable. But at the same time having some "
                    },
                    {
                      "type": "text",
                      "text": "interface parts"
                    },
                    {
                      "type": "text",
                      "text": " in the native language, like we as an app just forgot to translate everything "
                    },
                    {
                      "type": "emoji",
                      "name": "sweat_smile",
                      "skin_tone": 0
                    },
                    {
                      "type": "emoji",
                      "name": "sweat_smile",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "e3a98e54-60dc-4f2e-b542-bd4e4cc5d0e4",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "You’re thinking about all the right things! And it’s true that with English being the _lingua franca_ in today’s world, many people might be familiar enough with the English user interface such that they won’t need localization. However, it’s always handy to have choices, and your users can also go into Settings to switch your app to English if that’s what they prefer.\n\nIn terms of making sure that the localization doesn’t look partial or incomplete, I would definitely suggest making sure that any “chrome” (i.e. UI elements) is translated consistently in each of the languages you target.\n\nFor example, if the tables are turned and your app is actually for helping people with French, as a French learner, I would appreciate it if I could use it in English and see suggestions like this:\n\n\u0026gt; _The verb_ *bouffer* _could be too formal. Consider using_ *déjeuner* _or_ *manger*_._\nI’m limited by what I can do in Slack here stylistically, but you can see that I have marked the text in the content language in a different style than the UI language, which gives me clarity as the user as to what’s going on and where the language boundaries are.",
          "ts": "1654731715.802719",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "KHLV",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "You’re thinking about all the right things! And it’s true that with English being the "
                    },
                    {
                      "type": "text",
                      "text": "lingua franca",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " in today’s world, many people might be familiar enough with the English user interface such that they won’t need localization. However, it’s always handy to have choices, and your users can also go into Settings to switch your app to English if that’s what they prefer.\n\nIn terms of making sure that the localization doesn’t look partial or incomplete, I would definitely suggest making sure that any “chrome” (i.e. UI elements) is translated consistently in each of the languages you target.\n\nFor example, if the tables are turned and your app is actually for helping people with French, as a French learner, I would appreciate it if I could use it in English and see suggestions like this:\n\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_quote",
                  "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"The verb \",\"style\":{\"italic\":true}},{\"type\":\"text\",\"text\":\"bouffer\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\" could be too formal. Consider using\",\"style\":{\"italic\":true}},{\"type\":\"text\",\"text\":\" \"},{\"type\":\"text\",\"text\":\"d\\u00e9jeuner\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\" or \",\"style\":{\"italic\":true}},{\"type\":\"text\",\"text\":\"manger\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\".\",\"style\":{\"italic\":true}}]}"
                },
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "\nI’m limited by what I can do in Slack here stylistically, but you can see that I have marked the text in the content language in a different style than the UI language, which gives me clarity as the user as to what’s going on and where the language boundaries are."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "DC34C0A3-1C01-4BC0-A328-CBFC8D6C8564",
          "type": "message",
          "user": "U03JER2C7MX",
          "text": "That's exactly what I've been thinking about. \n\nLast one - if  you will have those suggestions in English, having French texts, would you as a new user prefer having whole app interface in English? \n\nWouldn't you start typing in English instead of French, since the app is fully localized?)) ",
          "ts": "1654732598.038679",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "ZLlvh",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "That's"
                    },
                    {
                      "type": "text",
                      "text": " exactly what I've been think"
                    },
                    {
                      "type": "text",
                      "text": "ing"
                    },
                    {
                      "type": "text",
                      "text": " about"
                    },
                    {
                      "type": "text",
                      "text": "."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "Last"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "one"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "-"
                    },
                    {
                      "type": "text",
                      "text": " if  "
                    },
                    {
                      "type": "text",
                      "text": "you will have those"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "suggestions"
                    },
                    {
                      "type": "text",
                      "text": " in English"
                    },
                    {
                      "type": "text",
                      "text": ","
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "having"
                    },
                    {
                      "type": "text",
                      "text": " French texts"
                    },
                    {
                      "type": "text",
                      "text": ","
                    },
                    {
                      "type": "text",
                      "text": " would you "
                    },
                    {
                      "type": "text",
                      "text": "as"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " new "
                    },
                    {
                      "type": "text",
                      "text": "user"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "prefer"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "having"
                    },
                    {
                      "type": "text",
                      "text": " whole app interface in E"
                    },
                    {
                      "type": "text",
                      "text": "nglish?"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "\n\n"
                    },
                    {
                      "type": "text",
                      "text": "Wouldn't"
                    },
                    {
                      "type": "text",
                      "text": " you start typing in English instead of French"
                    },
                    {
                      "type": "text",
                      "text": ","
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "since"
                    },
                    {
                      "type": "text",
                      "text": " the app is "
                    },
                    {
                      "type": "text",
                      "text": "f"
                    },
                    {
                      "type": "text",
                      "text": "ully localized"
                    },
                    {
                      "type": "text",
                      "text": "?))"
                    },
                    {
                      "type": "text",
                      "text": " "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2add2536-8ef1-4fc0-88f8-b6e4bfe7fadc",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Yes, I suppose I might! It’s hard to answer that in the abstract though without knowing exactly what the app looks and feels like. It all depends on which direction your app’s design steers the user in.",
          "ts": "1654732681.072879",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Nv919",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yes, I suppose I might! It’s hard to answer that in the abstract though without knowing exactly what the app looks and feels like. It all depends on which direction your app’s design steers the user in."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "E8C8F969-2090-4BF4-93C8-3BD39DDDEF61",
          "type": "message",
          "user": "U03JER2C7MX",
          "text": "Yeah, well... I'm talking about Grammarly app for iOS. Would be great to learn your thoughts on that.",
          "ts": "1654732951.823419",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "0tIIf",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yeah,"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "well..."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": "'m talking about G"
                    },
                    {
                      "type": "text",
                      "text": "rammarly"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "app"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "for"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "iOS."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Would"
                    },
                    {
                      "type": "text",
                      "text": " be "
                    },
                    {
                      "type": "text",
                      "text": "great"
                    },
                    {
                      "type": "text",
                      "text": " to learn your thoughts on that"
                    },
                    {
                      "type": "text",
                      "text": "."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "d227458b-b7e0-42de-bb0f-95d4bf1b059b",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Oh, interesting! I was guessing that this _sounded_ like Grammarly!",
          "ts": "1654733014.167549",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "smile",
              "count": 1,
              "users": [
                "U03JER2C7MX"
              ]
            },
            {
              "name": "ghost",
              "count": 1,
              "users": [
                "U03JER2C7MX"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Qkw",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Oh, interesting! I was guessing that this "
                    },
                    {
                      "type": "text",
                      "text": "sounded",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " like Grammarly!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "f018457c-a916-4980-860a-0fe7edbe0b08",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "I would suggest looking at your app’s usage and tackling one market as an initial foray, e.g. China or Japan, and see what feedback you get from your customers :slightly_smiling_face:",
          "ts": "1654733140.755749",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "gratitude-thank-you",
              "count": 1,
              "users": [
                "U03JER2C7MX"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Ul7",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I would suggest looking at your app’s usage and tackling one market as an initial foray, e.g. China or Japan, and see what feedback you get from your customers "
                    },
                    {
                      "type": "emoji",
                      "name": "slightly_smiling_face",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2B9FBFFE-DAD7-4679-BBC6-3594FAE95C14",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "Personally, I don't know that the app being localized in a given language would necessarily imply that I can input text in that language (though obviously it's ideal!). Taking for example our own products, we localize all features of the OS into all languages completely, including things like Apple Pay Later that might only be available in some regions.",
          "ts": "1654734195.622989",
          "thread_ts": "1654730208.169229",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "YvgUa",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Personally, I don't know that the app being localized in a given language would necessarily imply that I can input text in that language (though obviously it's ideal!). Taking for example our own products, we localize all features of the OS into all languages completely, including things like Apple Pay Later that might only be available in some regions."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "9f747eec-a653-477e-a8c5-802c0508774f",
      "type": "message",
      "user": "U03HJA9JVGA",
      "text": ":earth_africa: Don’t forget to check out some more localization sessions releasing tomorrow! We have two talks focused on localizing your apps into RTL languages such as Arabic and Hebrew!\n\n_*Get it right (to left)*_\nDiscover how to develop your app so that it can be localized into “right-to-left” languages such as Arabic and Hebrew. We’ll take you through important considerations for these languages, share solutions to challenges, and provide best practices for delivering a great right-to-left experience in your app.\n\n_*Design for Arabic*_\nFind out how to design or optimize your app or game for Arabic. Whether you’re planning a first release or improving an existing app or game, we’ll help you learn best practices and tips for UI design for Arabic speakers. Learn how to create beautiful Right to Left layouts with UI components and iconography, discover the nuances of Arabic script and typography in product design, and explore Arabic numerals.",
      "ts": "1654732229.477829",
      "thread_ts": "1654732229.477829",
      "pinned_to": [
        "C03H786M2V8"
      ],
      "reply_count": 1,
      "latest_reply": "1654732418.498909",
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "purple_heart",
          "count": 2,
          "users": [
            "U03J83G0WQG",
            "U03JTC23LLU"
          ]
        },
        {
          "name": "globe_with_meridians",
          "count": 1,
          "users": [
            "U03HWDD6RED"
          ]
        },
        {
          "name": "gratitude-thank-you",
          "count": 2,
          "users": [
            "U03HWDD6RED",
            "U03HJ9NKTV1"
          ]
        },
        {
          "name": "raised_hands",
          "count": 1,
          "users": [
            "U03J83G5TT2"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "b8e",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "emoji",
                  "name": "earth_africa",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " Don’t forget to check out some more localization sessions releasing tomorrow! We have two talks focused on localizing your apps into RTL languages such as Arabic and Hebrew!\n\n"
                },
                {
                  "type": "text",
                  "text": "Get it right (to left)",
                  "style": {
                    "bold": true,
                    "italic": true
                  }
                },
                {
                  "type": "text",
                  "text": "\nDiscover how to develop your app so that it can be localized into “right-to-left” languages such as Arabic and Hebrew. We’ll take you through important considerations for these languages, share solutions to challenges, and provide best practices for delivering a great right-to-left experience in your app.\n\n"
                },
                {
                  "type": "text",
                  "text": "Design for Arabic",
                  "style": {
                    "bold": true,
                    "italic": true
                  }
                },
                {
                  "type": "text",
                  "text": "\nFind out how to design or optimize your app or game for Arabic. Whether you’re planning a first release or improving an existing app or game, we’ll help you learn best practices and tips for UI design for Arabic speakers. Learn how to create beautiful Right to Left layouts with UI components and iconography, discover the nuances of Arabic script and typography in product design, and explore Arabic numerals."
                }
              ]
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "d17f1b58-e553-4ba8-ae5f-3cae7cd9ae3f",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Note that « Design for Arabic » will be available as two different sessions: one in English, and the other in Arabic as « صمّم بالعربي » :partying_face:",
          "ts": "1654732418.498909",
          "thread_ts": "1654732229.477829",
          "subtype": "thread_broadcast",
          "parent_user_id": "U03HJA9JVGA",
          "files": [
            {
              "id": "F03JW2EGAN7",
              "created": 1654732307,
              "timestamp": 1654732307,
              "name": "image.png",
              "title": "image.png",
              "mimetype": "image/png",
              "image_exif_rotation": 0,
              "filetype": "png",
              "pretty_type": "PNG",
              "user": "U03J83G0WQG",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 740371,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JW2EGAN7/image.png",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JW2EGAN7/download/image.png",
              "original_h": 850,
              "original_w": 1360,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_64.png",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_80.png",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_160.png",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_360.png",
              "thumb_360_gif": "",
              "thumb_360_w": 360,
              "thumb_360_h": 225,
              "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_480.png",
              "thumb_480_w": 480,
              "thumb_480_h": 300,
              "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_720.png",
              "thumb_720_w": 720,
              "thumb_720_h": 450,
              "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_960.png",
              "thumb_960_w": 960,
              "thumb_960_h": 600,
              "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_1024.png",
              "thumb_1024_w": 1024,
              "thumb_1024_h": 640,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03J83G0WQG/F03JW2EGAN7/image.png",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03JW2EGAN7-143aab54f1",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "reactions": [
            {
              "name": "raised_hands",
              "count": 5,
              "users": [
                "U03J83G5TT2",
                "U03HJ9NKTV1",
                "U03JTC23LLU",
                "U03J7F5L5C2",
                "U03HZ4URLDB"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "CCyKw",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Note that « Design for Arabic » will be available as two different sessions: one in English, and the other in Arabic as « صمّم بالعربي » "
                    },
                    {
                      "type": "emoji",
                      "name": "partying_face",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03J20RJQ2X\u003e asked\n\u0026gt; There's probably no right way to do this, but when working with localized strings in code, do you recommend using the new string initializer (which looks great btw!) directly throughout the app, or creating, for example, a file with enums that return those localized strings?",
      "ts": "1654732414.673769",
      "thread_ts": "1654732414.673769",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 8,
      "latest_reply": "1654733035.841449",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "8zFJ",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03J20RJQ2X"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"There's probably no right way to do this, but when working with localized strings in code, do you recommend using the new string initializer (which looks great btw!) directly throughout the app, or creating, for example, a file with enums that return those localized strings?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "f8c1a5e3-4bc7-4d0a-9114-7b243268c15f",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "We strongly recommend that you use `String(localized:…)`, `AttributedString(localized:…)` or in Objective-C `NSLocalizedString` and `NSAttributedLocalizedString`!",
          "ts": "1654732456.620959",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "heavy_plus_sign",
              "count": 1,
              "users": [
                "U03HLM4HSAG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "IHwY",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "We strongly recommend that you use "
                    },
                    {
                      "type": "text",
                      "text": "String(localized:…)",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", "
                    },
                    {
                      "type": "text",
                      "text": "AttributedString(localized:…)",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " or in Objective-C "
                    },
                    {
                      "type": "text",
                      "text": "NSLocalizedString",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " and "
                    },
                    {
                      "type": "text",
                      "text": "NSAttributedLocalizedString",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2afde8c5-318e-42ef-9c89-04be9f7c3404",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "If you do that, Xcode can extract strings for you to provide to your localizers — it knows how to recognize these macros and initializers and how to produce a `xcloc` bundle that contains them all, and then reintegrate it into your project.",
          "ts": "1654732509.078399",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "yjo",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "If you do that, Xcode can extract strings for you to provide to your localizers — it knows how to recognize these macros and initializers and how to produce a "
                    },
                    {
                      "type": "text",
                      "text": "xcloc",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " bundle that contains them all, and then reintegrate it into your project."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "414cdf34-3891-4e2a-acd1-b0daf990967f",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "String constants used with other mechanism will not be recognized by this mechanism, and you will have to manually handle extraction into .strings files and any changes going forward.",
          "ts": "1654732622.810049",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "oUYp",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "String constants used with other mechanism will not be recognized by this mechanism, and you will have to manually handle extraction into .strings files and any changes going forward."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "757beb28-527b-4b81-9ecd-088b14c6779a",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "Note that SwiftUI also uses the `LocalizedStringKey` type, and Xcode also knows about it. So, when you write `Text(\"Hello, world!\")`, since `Text(…)` takes a `LocalizedStringKey`, Xcode will also know to extract it.",
          "ts": "1654732670.861559",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Li0Ax",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Note that SwiftUI also uses the "
                    },
                    {
                      "type": "text",
                      "text": "LocalizedStringKey",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " type, and Xcode also knows about it. So, when you write "
                    },
                    {
                      "type": "text",
                      "text": "Text(\"Hello, world!\")",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", since "
                    },
                    {
                      "type": "text",
                      "text": "Text(…)",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " takes a "
                    },
                    {
                      "type": "text",
                      "text": "LocalizedStringKey",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", Xcode will also know to extract it."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "be43a0d6-264e-4096-9234-83937534dd29",
          "type": "message",
          "user": "U03J83G5TT2",
          "text": "In Swift, you can even use String interpolation to include variables directly in the initializer `String(localized: \"Welcome to \\(newCity)\", comment:\"Large headline label welcoming the user to their new location, the variable refers to the city name.\")`\nPlease make sure to explain what the variable refers to, so that translators have that knowledge, too :slightly_smiling_face:",
          "ts": "1654732788.263909",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "C4O",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "In Swift, you can even use String interpolation to include variables directly in the initializer "
                    },
                    {
                      "type": "text",
                      "text": "String(localized: \"Welcome to \\(newCity)\", comment:\"Large headline label welcoming the user to their new location, the variable refers to the city name.\")",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "\nPlease make sure to explain what the variable refers to, so that translators have that knowledge, too "
                    },
                    {
                      "type": "emoji",
                      "name": "slightly_smiling_face",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "d96e5f70-1a2c-4520-8dd2-dc0a61a0dcd4",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "Yup! This works in `String(localized:…)`, `AttributedString(localized:…)` and in SwiftUI.",
          "ts": "1654732829.733519",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "lHV",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yup! This works in "
                    },
                    {
                      "type": "text",
                      "text": "String(localized:…)",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", "
                    },
                    {
                      "type": "text",
                      "text": "AttributedString(localized:…)",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " and in SwiftUI."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "4eea1aaf-34b6-4fb2-b6ed-1c72a7860101",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "As long as you’re using this setup, in general, you’re golden — if you’re using enums to represent your strings, just make sure that they’re calling into these functions.",
          "ts": "1654732993.209139",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "heavy_plus_sign",
              "count": 1,
              "users": [
                "U03HLM4HSAG"
              ]
            },
            {
              "name": "raised_hands",
              "count": 1,
              "users": [
                "U03J20RJQ2X"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "YC+",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "As long as you’re using this setup, in general, you’re golden — if you’re using enums to represent your strings, just make sure that they’re calling into these functions."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "32c201fb-b752-46e0-a24b-0e75e98f6f76",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "In general, using enums may complicate your patches a little and interact weirdly with SwiftUI if you try to pass `String`s to SwiftUI initializers that expect localized keys.",
          "ts": "1654733035.841449",
          "thread_ts": "1654732414.673769",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "heavy_plus_sign",
              "count": 2,
              "users": [
                "U03HLM4HSAG",
                "U03J83G5TT2"
              ]
            },
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03J20RJQ2X"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "VIv",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "In general, using enums may complicate your patches a little and interact weirdly with SwiftUI if you try to pass "
                    },
                    {
                      "type": "text",
                      "text": "String",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "s to SwiftUI initializers that expect localized keys."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "d17f1b58-e553-4ba8-ae5f-3cae7cd9ae3f",
      "type": "message",
      "user": "U03J83G0WQG",
      "text": "Note that « Design for Arabic » will be available as two different sessions: one in English, and the other in Arabic as « صمّم بالعربي » :partying_face:",
      "ts": "1654732418.498909",
      "thread_ts": "1654732229.477829",
      "subtype": "thread_broadcast",
      "parent_user_id": "U03HJA9JVGA",
      "files": [
        {
          "id": "F03JW2EGAN7",
          "created": 1654732307,
          "timestamp": 1654732307,
          "name": "image.png",
          "title": "image.png",
          "mimetype": "image/png",
          "image_exif_rotation": 0,
          "filetype": "png",
          "pretty_type": "PNG",
          "user": "U03J83G0WQG",
          "mode": "hosted",
          "editable": false,
          "is_external": false,
          "external_type": "",
          "size": 740371,
          "url": "",
          "url_download": "",
          "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JW2EGAN7/image.png",
          "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JW2EGAN7/download/image.png",
          "original_h": 850,
          "original_w": 1360,
          "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_64.png",
          "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_80.png",
          "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_160.png",
          "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_360.png",
          "thumb_360_gif": "",
          "thumb_360_w": 360,
          "thumb_360_h": 225,
          "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_480.png",
          "thumb_480_w": 480,
          "thumb_480_h": 300,
          "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_720.png",
          "thumb_720_w": 720,
          "thumb_720_h": 450,
          "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_960.png",
          "thumb_960_w": 960,
          "thumb_960_h": 600,
          "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_1024.png",
          "thumb_1024_w": 1024,
          "thumb_1024_h": 640,
          "permalink": "https://appleevents.enterprise.slack.com/files/U03J83G0WQG/F03JW2EGAN7/image.png",
          "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03JW2EGAN7-143aab54f1",
          "edit_link": "",
          "preview": "",
          "preview_highlight": "",
          "lines": 0,
          "lines_more": 0,
          "is_public": false,
          "public_url_shared": false,
          "channels": null,
          "groups": null,
          "ims": null,
          "initial_comment": {},
          "comments_count": 0,
          "num_stars": 0,
          "is_starred": false,
          "shares": {
            "public": null,
            "private": null
          }
        }
      ],
      "reactions": [
        {
          "name": "raised_hands",
          "count": 5,
          "users": [
            "U03J83G5TT2",
            "U03HJ9NKTV1",
            "U03JTC23LLU",
            "U03J7F5L5C2",
            "U03HZ4URLDB"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "CCyKw",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "text",
                  "text": "Note that « Design for Arabic » will be available as two different sessions: one in English, and the other in Arabic as « صمّم بالعربي » "
                },
                {
                  "type": "emoji",
                  "name": "partying_face",
                  "skin_tone": 0
                }
              ]
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "d17f1b58-e553-4ba8-ae5f-3cae7cd9ae3f",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Note that « Design for Arabic » will be available as two different sessions: one in English, and the other in Arabic as « صمّم بالعربي » :partying_face:",
          "ts": "1654732418.498909",
          "thread_ts": "1654732229.477829",
          "subtype": "thread_broadcast",
          "parent_user_id": "U03HJA9JVGA",
          "files": [
            {
              "id": "F03JW2EGAN7",
              "created": 1654732307,
              "timestamp": 1654732307,
              "name": "image.png",
              "title": "image.png",
              "mimetype": "image/png",
              "image_exif_rotation": 0,
              "filetype": "png",
              "pretty_type": "PNG",
              "user": "U03J83G0WQG",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 740371,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JW2EGAN7/image.png",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JW2EGAN7/download/image.png",
              "original_h": 850,
              "original_w": 1360,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_64.png",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_80.png",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_160.png",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_360.png",
              "thumb_360_gif": "",
              "thumb_360_w": 360,
              "thumb_360_h": 225,
              "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_480.png",
              "thumb_480_w": 480,
              "thumb_480_h": 300,
              "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_720.png",
              "thumb_720_w": 720,
              "thumb_720_h": 450,
              "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_960.png",
              "thumb_960_w": 960,
              "thumb_960_h": 600,
              "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JW2EGAN7-f653412d4f/image_1024.png",
              "thumb_1024_w": 1024,
              "thumb_1024_h": 640,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03J83G0WQG/F03JW2EGAN7/image.png",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03JW2EGAN7-143aab54f1",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "reactions": [
            {
              "name": "raised_hands",
              "count": 5,
              "users": [
                "U03J83G5TT2",
                "U03HJ9NKTV1",
                "U03JTC23LLU",
                "U03J7F5L5C2",
                "U03HZ4URLDB"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "CCyKw",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Note that « Design for Arabic » will be available as two different sessions: one in English, and the other in Arabic as « صمّم بالعربي » "
                    },
                    {
                      "type": "emoji",
                      "name": "partying_face",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "0257a124-3bcc-4b96-88c5-978b134067ab",
      "type": "message",
      "user": "U03HJ9NLS1H",
      "text": "Thanks everyone for sending us your questions! It’s been amazing :raised_hands: We’ll close off this lounge for now. If you’d like to learn more, sign up for *\u003chttps://developer.apple.com/wwdc22/labs/|tomorrow’s lab\u003e* (registration closes in an hour!) for a 1:1 session with an Apple engineer – or join us for Friday’s lounge at 9am Pacific Time, where we’ll answer questions about Right-to-left. Have a great WWDC!",
      "ts": "1654733013.201629",
      "pinned_to": [
        "C03H786M2V8"
      ],
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "raised_hands",
          "count": 2,
          "users": [
            "U03J83G0WQG",
            "U03J83G5TT2"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "/Migq",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "text",
                  "text": "Thanks everyone for sending us your questions! It’s been amazing "
                },
                {
                  "type": "emoji",
                  "name": "raised_hands",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " We’ll close off this lounge for now. If you’d like to learn more, sign up for "
                },
                {
                  "type": "link",
                  "url": "https://developer.apple.com/wwdc22/labs/",
                  "text": "tomorrow’s lab",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": " (registration closes in an hour!) for a 1:1 session with an Apple engineer – or join us for Friday’s lounge at 9am Pacific Time, where we’ll answer questions about Right-to-left. Have a great WWDC!"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "435f7d68-46ac-432a-9748-c5182fc5dcc7",
      "type": "message",
      "user": "U03HJ9NLS1H",
      "text": "For our friends outside of the US, we're going to leave the :workflowbolt: enabled so you can go ahead and submit your questions for any of our lounge topics tomorrow.  We’re all going to sign off for the night, but we’ll answer your questions throughout the day tomorrow so you can check back when you wake up!",
      "ts": "1654733577.407559",
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "+1",
          "count": 3,
          "users": [
            "U03K00ZTUTB",
            "U03JER2C7MX",
            "U03JHCQN4GK"
          ]
        },
        {
          "name": "partying_face",
          "count": 6,
          "users": [
            "U03J7JKA23F",
            "U03J83G5TT2",
            "U03J83G0WQG",
            "U03JRQAFUKA",
            "U03JLTMSAV7",
            "U03JRNU59UG"
          ]
        },
        {
          "name": "gratitude-thank-you",
          "count": 3,
          "users": [
            "U03JER2C7MX",
            "U03JPJ277SQ",
            "U03JRNU59UG"
          ]
        },
        {
          "name": "earth_africa",
          "count": 1,
          "users": [
            "U03J83G0WQG"
          ]
        },
        {
          "name": "earth_asia",
          "count": 3,
          "users": [
            "U03J83G0WQG",
            "U03HVCK66P8",
            "U03JEME3C73"
          ]
        },
        {
          "name": "earth_americas",
          "count": 1,
          "users": [
            "U03J83G0WQG"
          ]
        },
        {
          "name": "flag-eu",
          "count": 2,
          "users": [
            "U03HZ4VFBKP",
            "U03JYPC2A04"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "FNoT",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "text",
                  "text": "For our friends outside of the US, we're going to leave the "
                },
                {
                  "type": "emoji",
                  "name": "workflowbolt",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " enabled so you can go ahead and submit your questions for any of our lounge topics tomorrow.  We’re all going to sign off for the night, but we’ll answer your questions throughout the day tomorrow so you can check back when you wake up!"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03HVCK66P8\u003e asked\n\u0026gt; Hello. Can the Localizable.strings updates itself? The first time export and import is okay. However, when the project contains a  Localizable.strings file then the next export will not contain new strings added.",
      "ts": "1654804988.358809",
      "thread_ts": "1654804988.358809",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 5,
      "latest_reply": "1654881136.174829",
      "reactions": [
        {
          "name": "eyes",
          "count": 1,
          "users": [
            "U03JGFEJDGA"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "xAeG",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03HVCK66P8"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Hello. Can the Localizable.strings updates itself? The first time export and import is okay. However, when the project contains a  Localizable.strings file then the next export will not contain new strings added.\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "cb4b5a41-a855-4ef3-b182-95891b6df366",
          "type": "message",
          "user": "U03H3NEH4CX",
          "text": "Hi ChakMing!\n\nThe expected flow is as follows:\n1. Have some strings in your project (either .strings files or strings in code)\n2. Export Localizations, which includes all strings in an xcloc\n3. Translate the xcloc\n4. Import Localizations with the translated xcloc (This step updates/adds .strings files in/to the project.)\n5. Exporting again should include all strings in the project (including those previously imported) in the xcloc\nIf this is not working as expected, please file a feedback so that we can take a look.",
          "ts": "1654805464.764919",
          "thread_ts": "1654804988.358809",
          "edited": {
            "user": "U03H3NEH4CX",
            "ts": "1654805680.000000"
          },
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "ok_hand",
              "count": 1,
              "users": [
                "U03HVCK66P8"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "hHjL",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi ChakMing!\n\nThe expected flow is as follows:\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Have some strings in your project (either .strings files or strings in code)\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Export Localizations, which includes all strings in an xcloc\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Translate the xcloc\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Import Localizations with the translated xcloc (This step updates\\/adds .strings files in\\/to the project.)\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Exporting again should include all strings in the project (including those previously imported) in the xcloc\"}]}],\"style\":\"ordered\",\"indent\":0,\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "\nIf this is not working as expected, please file a feedback so that we can take a look."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "83c7b7ce-1b65-4400-9055-28f659e2c2d7",
          "type": "message",
          "user": "U03HVCK66P8",
          "text": "\u003c@U03H3NEH4CX\u003e Hello again. Here’s what I found.\nAt initial, the export will include all strings.\nIf I imported the xcloc, it will generate Localizable Files.\nThen I add more words on SwiftUI, and export. The xcloc is still using the old localizable file.\n\nI thought it had been happening for a long time… Do you think it is a bug, or is this correct?",
          "ts": "1654879512.571169",
          "thread_ts": "1654804988.358809",
          "edited": {
            "user": "U03HVCK66P8",
            "ts": "1654879547.000000"
          },
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "eyes",
              "count": 2,
              "users": [
                "U03HBMCRX0E",
                "U03H3NEH4CX"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "8G8C7",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "user",
                      "user_id": "U03H3NEH4CX"
                    },
                    {
                      "type": "text",
                      "text": " Hello again. Here’s what I found.\nAt initial, the export will include all strings.\nIf I imported the xcloc, it will generate Localizable Files.\nThen I add more words on SwiftUI, and export. The xcloc is still using the old localizable file.\n\nI thought it had been happening for a long time… Do you think it is a bug, or is this correct?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "0b8c4b0f-ef74-4159-b1db-a01b90da4346",
          "type": "message",
          "user": "U03H3NEH4CX",
          "text": "So my expectation here is that the second export would include *both* the strings in your SwiftUI code *and* the strings in the .strings files that the import created. Xcode won’t remove stale translations automatically, because those translated strings can be a valuable resource if you ever need to translate them again.",
          "ts": "1654881009.811849",
          "thread_ts": "1654804988.358809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "WCJg",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "So my expectation here is that the second export would include "
                    },
                    {
                      "type": "text",
                      "text": "both",
                      "style": {
                        "bold": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " the strings in your SwiftUI code "
                    },
                    {
                      "type": "text",
                      "text": "and",
                      "style": {
                        "bold": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " the strings in the .strings files that the import created. Xcode won’t remove stale translations automatically, because those translated strings can be a valuable resource if you ever need to translate them again."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "f00732be-9f86-4ea3-a2e0-d9b1b4736200",
          "type": "message",
          "user": "U03H3NEH4CX",
          "text": "However, please feel free to file a feedback request if you think we should change the flow here!",
          "ts": "1654881084.068359",
          "thread_ts": "1654804988.358809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "fSp6A",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "However, please feel free to file a feedback request if you think we should change the flow here!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "00affc82-6f34-4c8e-9c7a-174ff0c196b4",
          "type": "message",
          "user": "U03HVCK66P8",
          "text": "I just re-export and seems it works this time! Thanks, \u003c@U03H3NEH4CX\u003e \u003c@U03HBMCRX0E\u003e",
          "ts": "1654881136.174829",
          "thread_ts": "1654804988.358809",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HBMCRX0E"
              ]
            },
            {
              "name": "tada",
              "count": 2,
              "users": [
                "U03HBMCRX0E",
                "U03H3NEH4CX"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "6yW",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I just re-export and seems it works this time! Thanks, "
                    },
                    {
                      "type": "user",
                      "user_id": "U03H3NEH4CX"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "user",
                      "user_id": "U03HBMCRX0E"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JPJ277SQ\u003e asked\n\u0026gt; Hello. How can we make sure the system and VoiceOver identify a certain text’s language correctly. Is there a tag we can set somewhere? I’m asking for both web and apps.\n\u0026gt; It happens from time to time where the system falsely identifies Urdu for Arabic, or recently on iOS 16, Persian for Arabic. How can we improve this?",
      "ts": "1654805001.973809",
      "thread_ts": "1654805001.973809",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 9,
      "latest_reply": "1654877010.451969",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "AmSry",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JPJ277SQ"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Hello. How can we make sure the system and VoiceOver identify a certain text\\u2019s language correctly. Is there a tag we can set somewhere? I\\u2019m asking for both web and apps.\\nIt happens from time to time where the system falsely identifies Urdu for Arabic, or recently on iOS 16, Persian for Arabic. How can we improve this?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "06ce8ce6-783c-4b4c-b2c6-040a0fee41e7",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "If you know the language of your text, you can annotate it with that language.\n\nFor web content, you can use the \u003chttps://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/lang|lang\u003e attribute, which can be applied to any HTML element, including `\u0026lt;p\u0026gt;`, `\u0026lt;span\u0026gt;`, and `\u0026lt;body\u0026gt;`.\n\nFor app content, you can create an attributed string and set the `NSLanguageIdentifierAttributeName` to the language code of the corresponding text.",
          "ts": "1654805791.996549",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JPJ277SQ"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "UHEgL",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "If you know the language of your text, you can annotate it with that language.\n\nFor web content, you can use the "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/lang",
                      "text": "lang"
                    },
                    {
                      "type": "text",
                      "text": " attribute, which can be applied to any HTML element, including "
                    },
                    {
                      "type": "text",
                      "text": "\u003cp\u003e",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", "
                    },
                    {
                      "type": "text",
                      "text": "\u003cspan\u003e",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ", and "
                    },
                    {
                      "type": "text",
                      "text": "\u003cbody\u003e",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": ".\n\nFor app content, you can create an attributed string and set the "
                    },
                    {
                      "type": "text",
                      "text": "NSLanguageIdentifierAttributeName",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " to the language code of the corresponding text."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "9d8a863e-17db-4987-9b6f-a82100afb3c2",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "If you have reproducible strings that are incorrectly identified, we would love to have feedback with those examples as well!",
          "ts": "1654805813.339589",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JPJ277SQ"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "v9B",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "If you have reproducible strings that are incorrectly identified, we would love to have feedback with those examples as well!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "E3E4840C-5A4D-48E6-9D68-63E80EE39382",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "Here’s the feedback ID: FB10152753",
          "ts": "1654857760.150779",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "oRl7",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Here’s"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "feedback"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "ID: FB10152753"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "84C6097E-2549-4B7A-A2B7-065AA8622940",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "It fails on everything. Here are some example texts:",
          "ts": "1654857775.222059",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "KEk",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "fails"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "on"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "everything."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Here"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "are"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "some"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "example"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "texts:"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "6CD2D350-C2AF-4AFC-A385-15102B392777",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "من سعید هستم",
          "ts": "1654857782.233519",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "TbaT",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "من"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "سعید"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "هستم"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "844CCAE8-1ECE-40F2-9ABF-586DA7A5CCC0",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "امروز بریم رستوران؟",
          "ts": "1654857786.426409",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "CDFJM",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "امروز"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "بریم"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "رستوران؟"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "0112BCEC-CE5A-4523-8347-A86910FAB95C",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "چه خبر؟",
          "ts": "1654857789.083709",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "9qa",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "چه"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "خبر؟"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "56C33783-F3CC-4392-824C-767C10134E14",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "\u003c@U03HW7PE3SM\u003e ",
          "ts": "1654857796.202139",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "xL5",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "user",
                      "user_id": "U03HW7PE3SM"
                    },
                    {
                      "type": "text",
                      "text": " "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "d42607a8-54b6-4312-9305-599726769e89",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "Thanks! We’ll be sure to pass this along.",
          "ts": "1654877010.451969",
          "thread_ts": "1654805001.973809",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "pray",
              "count": 1,
              "users": [
                "U03JPJ277SQ"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "9NV5",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Thanks! We’ll be sure to pass this along."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JPJ277SQ\u003e asked\n\u0026gt; What’s the best way to use two custom fonts (non SF Pro for marketing reasons) for Arabic and Latin scripts? The most challenging part is that the text could be bilingual and it may come from the server. For instance, “به WWDC خوش آمدید”. I want two fonts to be used for this snippet.",
      "ts": "1654805012.348259",
      "thread_ts": "1654805012.348259",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 5,
      "latest_reply": "1654881270.509789",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "+Bo",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JPJ277SQ"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"What\\u2019s the best way to use two custom fonts (non SF Pro for marketing reasons) for Arabic and Latin scripts? The most challenging part is that the text could be bilingual and it may come from the server. For instance, \\u201c\\u0628\\u0647 WWDC \\u062e\\u0648\\u0634 \\u0622\\u0645\\u062f\\u06cc\\u062f\\u201d. I want two fonts to be used for this snippet.\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "7b3a9d1d-8dd3-49a0-bda5-67ddd0701267",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "It looks you forgot to answer this.",
          "ts": "1654806635.502139",
          "thread_ts": "1654805012.348259",
          "edited": {
            "user": "U03JPJ277SQ",
            "ts": "1654806665.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "nWW",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It looks you forgot to answer this."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "cf0360b4-7066-4e10-ab62-259720cadfb7",
          "type": "message",
          "user": "U03HJ9NPCBD",
          "text": "You can do it by setting \u003chttps://developer.apple.com/documentation/coretext/kctfontcascadelistattribute|kCTFontCascadeListAttribute\u003e, either have the primary font be the Latin font, then have the cascade list contain your Arabic font (the way we do it for our system), or the other way around.",
          "ts": "1654825061.557939",
          "thread_ts": "1654805012.348259",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JPJ277SQ"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "RwlaA",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "You can do it by setting "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.apple.com/documentation/coretext/kctfontcascadelistattribute",
                      "text": "kCTFontCascadeListAttribute"
                    },
                    {
                      "type": "text",
                      "text": ", either have the primary font be the Latin font, then have the cascade list contain your Arabic font (the way we do it for our system), or the other way around."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "88abce55-9318-4c18-8d40-d91a5b7dce35",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "Another option is to use `(NS)AttributedString` and set the fonts on the individual segments of the string.",
          "ts": "1654880562.526019",
          "thread_ts": "1654805012.348259",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "83B+i",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Another option is to use "
                    },
                    {
                      "type": "text",
                      "text": "(NS)AttributedString",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " and set the fonts on the individual segments of the string."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "f62e3a33-f042-467a-b2e8-41752446079d",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "The thing is I mostly don’t have access to the text beforehand. Let’s say it’s coming from a server.",
          "ts": "1654880924.227359",
          "thread_ts": "1654805012.348259",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Ibw9",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "The thing is I mostly don’t have access to the text beforehand. Let’s say it’s coming from a server."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "d05c04f0-3d23-43db-aac1-4471f9909aaf",
          "type": "message",
          "user": "U03J83F72HW",
          "text": "Then the font fallback list (as above) is best. Note that in addition to the CoreText version above, there's also \u003chttps://developer.apple.com/documentation/uikit/uifontdescriptorcascadelistattribute/|UIFontDescriptorCascadeListAttribute\u003e and \u003chttps://developer.apple.com/documentation/appkitsfontcascadelistattribute/|NSFontCascadeListAttribute\u003e, if you're using higher-level text APIs.",
          "ts": "1654881270.509789",
          "thread_ts": "1654805012.348259",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 2,
              "users": [
                "U03JPJ277SQ",
                "U03HW7PE3SM"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "2Yenh",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Then the font fallback list (as above) is best. Note that in addition to the CoreText version above, there's also "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.apple.com/documentation/uikit/uifontdescriptorcascadelistattribute/",
                      "text": "UIFontDescriptorCascadeListAttribute"
                    },
                    {
                      "type": "text",
                      "text": " and "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.apple.com/documentation/appkit sfontcascadelistattribute/",
                      "text": "NSFontCascadeListAttribute"
                    },
                    {
                      "type": "text",
                      "text": ", if you're using higher-level text APIs."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JPJ277SQ\u003e asked\n\u0026gt; Is there a non-hacky way to force a single language for an app? Let’s say the app only supports “ar-SA” and the user’s device language is set to “en-US”. I used to set a value for a certain in key in UserDefaults at launch to make it work.",
      "ts": "1654805078.574049",
      "thread_ts": "1654805078.574049",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 1,
      "latest_reply": "1654805746.595289",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "VpvG",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JPJ277SQ"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Is there a non-hacky way to force a single language for an app? Let\\u2019s say the app only supports \\u201car-SA\\u201d and the user\\u2019s device language is set to \\u201cen-US\\u201d. I used to set a value for a certain in key in UserDefaults at launch to make it work.\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "9f60929f-28f4-4c89-b098-e0a7f29c2c57",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "You should not need to set any user defaults. Simply make sure that the `developmentRegion` in your project.pbxproj is set to the correct language and that all your localizable files are in the correct lproj. If your app does not have an lproj folder, you will need to be on iOS 16, macOS 13, tvOS 16, and watchOS 9 to get correct behavior.",
          "ts": "1654805746.595289",
          "thread_ts": "1654805078.574049",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 2,
              "users": [
                "U03JPJ277SQ",
                "U03HLM4HSAG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "r6Z",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "You should not need to set any user defaults. Simply make sure that the "
                    },
                    {
                      "type": "text",
                      "text": "developmentRegion",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " in your project.pbxproj is set to the correct language and that all your localizable files are in the correct lproj. If your app does not have an lproj folder, you will need to be on iOS 16, macOS 13, tvOS 16, and watchOS 9 to get correct behavior."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JPJ277SQ\u003e asked\n\u0026gt; Is there a way to force the numeral system for an app? For instance, the user may have chosen ‘۱۲۳’ as their numbering system of choice where it only make sense in our app to show numbers as ‘123’.\n\u0026gt; One thing that’s still missing and I’d already filed a report as I remember, is choosing the numeral system when changing the language for a specific app. Now you can only change the numeral system when you change the device language as a whole.",
      "ts": "1654805124.703549",
      "thread_ts": "1654805124.703549",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 5,
      "latest_reply": "1654859229.703909",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "Nhc",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JPJ277SQ"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Is there a way to force the numeral system for an app? For instance, the user may have chosen \\u2018\\u06f1\\u06f2\\u06f3\\u2019 as their numbering system of choice where it only make sense in our app to show numbers as \\u2018123\\u2019.\\nOne thing that\\u2019s still missing and I\\u2019d already filed a report as I remember, is choosing the numeral system when changing the language for a specific app. Now you can only change the numeral system when you change the device language as a whole.\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "4f3d5802-b71c-43bf-91ff-0287795a0d34",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "Simply don’t localize the numbers (e.g. don’t use a formatter) and the numbers should be preserved as the literals you are using in your code. Do you have a code sample to share to elaborate more on the issues you are seeing?",
          "ts": "1654805860.203089",
          "thread_ts": "1654805124.703549",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "0oZL",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Simply don’t localize the numbers (e.g. don’t use a formatter) and the numbers should be preserved as the literals you are using in your code. Do you have a code sample to share to elaborate more on the issues you are seeing?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "adf07f03-a76f-49d7-b52a-e66d9345a349",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "I think I phrased my question wrong. For instance, install Whatsapp on a device whose locale is set to English - United States. Then, go to Whatsapp settings page inside system Settings and change its language to Persian. Now Open Whatsapp. You’ll see the system keyboard has number row in Latin.",
          "ts": "1654806537.315889",
          "thread_ts": "1654805124.703549",
          "files": [
            {
              "id": "F03JV464YR4",
              "created": 1654806520,
              "timestamp": 1654806520,
              "name": "image.png",
              "title": "image.png",
              "mimetype": "image/png",
              "image_exif_rotation": 0,
              "filetype": "png",
              "pretty_type": "PNG",
              "user": "U03JPJ277SQ",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 1274476,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JV464YR4/image.png",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JV464YR4/download/image.png",
              "original_h": 2532,
              "original_w": 1170,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_64.png",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_80.png",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_160.png",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_360.png",
              "thumb_360_gif": "",
              "thumb_360_w": 166,
              "thumb_360_h": 360,
              "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_480.png",
              "thumb_480_w": 222,
              "thumb_480_h": 480,
              "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_720.png",
              "thumb_720_w": 333,
              "thumb_720_h": 720,
              "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_960.png",
              "thumb_960_w": 444,
              "thumb_960_h": 960,
              "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JV464YR4-59c66f60e7/image_1024.png",
              "thumb_1024_w": 473,
              "thumb_1024_h": 1024,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03JPJ277SQ/F03JV464YR4/image.png",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03JV464YR4-0dad527e68",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "O+8",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I think I phrased my question wrong. For instance, install Whatsapp on a device whose locale is set to English - United States. Then, go to Whatsapp settings page inside system Settings and change its language to Persian. Now Open Whatsapp. You’ll see the system keyboard has number row in Latin."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "10d1465f-cce6-4922-a129-9dd7d4ef83fc",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "Whereas in iMessage on the same device it’s in `۱۲۳‍` form.",
          "ts": "1654806568.623629",
          "thread_ts": "1654805124.703549",
          "files": [
            {
              "id": "F03K1L5TC5R",
              "created": 1654806562,
              "timestamp": 1654806562,
              "name": "image.png",
              "title": "image.png",
              "mimetype": "image/png",
              "image_exif_rotation": 0,
              "filetype": "png",
              "pretty_type": "PNG",
              "user": "U03JPJ277SQ",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 390565,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03K1L5TC5R/image.png",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03K1L5TC5R/download/image.png",
              "original_h": 2532,
              "original_w": 1170,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_64.png",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_80.png",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_160.png",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_360.png",
              "thumb_360_gif": "",
              "thumb_360_w": 166,
              "thumb_360_h": 360,
              "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_480.png",
              "thumb_480_w": 222,
              "thumb_480_h": 480,
              "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_720.png",
              "thumb_720_w": 333,
              "thumb_720_h": 720,
              "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_960.png",
              "thumb_960_w": 444,
              "thumb_960_h": 960,
              "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K1L5TC5R-8784e8f04d/image_1024.png",
              "thumb_1024_w": 473,
              "thumb_1024_h": 1024,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03JPJ277SQ/F03K1L5TC5R/image.png",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03K1L5TC5R-5116e1b5bf",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "8Sg",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Whereas in iMessage on the same device it’s in "
                    },
                    {
                      "type": "text",
                      "text": "۱۲۳‍",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " form."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "8b65efeb-8b23-44ca-a5a1-12cf26cb1aa8",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "\u003c@U03JPJ277SQ\u003e IMHO, this may be a bug. Do you mind reporting this bug and sharing the FB # here?",
          "ts": "1654811033.838469",
          "thread_ts": "1654805124.703549",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "t1V",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "user",
                      "user_id": "U03JPJ277SQ"
                    },
                    {
                      "type": "text",
                      "text": " IMHO, this may be a bug. Do you mind reporting this bug and sharing the FB # here?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "3778A2BA-23F6-4C97-A510-CD1C72C5B700",
          "type": "message",
          "user": "U03JPJ277SQ",
          "text": "\u003c@U03J83G0WQG\u003e Here it is: FB9647599. I believe we already discussed this on Twitter as well.",
          "ts": "1654859229.703909",
          "thread_ts": "1654805124.703549",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "pray",
              "count": 1,
              "users": [
                "U03J83G0WQG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "PQfC",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "user",
                      "user_id": "U03J83G0WQG"
                    },
                    {
                      "type": "text",
                      "text": " Here"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "it"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "is: FB9647599."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "believe"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "we"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "already"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "discussed"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "this"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "on"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Twitter"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "as"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "well."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JS4B5KS4\u003e asked\n\u0026gt; When I release my apps I can usually find some people to help me translate the initial release. But over time it makes it difficult for me to create updates which require new translation strings. Any best practices you would have there for indie developers that don't have a lot of resources to pay 20+ translators for each release?",
      "ts": "1654805157.026269",
      "thread_ts": "1654805157.026269",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 7,
      "latest_reply": "1654877188.094599",
      "reactions": [
        {
          "name": "heavy_plus_sign",
          "count": 1,
          "users": [
            "U03HMCT187R"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "lof",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JS4B5KS4"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"When I release my apps I can usually find some people to help me translate the initial release. But over time it makes it difficult for me to create updates which require new translation strings. Any best practices you would have there for indie developers that don't have a lot of resources to pay 20+ translators for each release?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "0e1e3c3d-c9cb-43c9-90ac-ff42217093e3",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "It is understood that adding languages to your application can become quite the commitment — not just a commitment in the moment, but also going forward.",
          "ts": "1654806638.945959",
          "thread_ts": "1654805157.026269",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "LdmHo",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It is understood that adding languages to your application can become quite the commitment — not just a commitment in the moment, but also going forward."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2172f598-f367-46b9-861c-60a7afb23fef",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "It does pay off to make a plan in which you can sit down and think whether you can do so sustainably for every single feature you do, including adding languages to your application.",
          "ts": "1654806677.842529",
          "thread_ts": "1654805157.026269",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Iyjg",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It does pay off to make a plan in which you can sit down and think whether you can do so sustainably for every single feature you do, including adding languages to your application."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "f64592c5-60dd-4de8-a2ab-b7f680a9c8c3",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "Sometimes, it is a valid choice to know that the time may just not be there every release, and to choose perhaps to support fewer languages.",
          "ts": "1654806750.307199",
          "thread_ts": "1654805157.026269",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "/eivM",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Sometimes, it is a valid choice to know that the time may just not be there every release, and to choose perhaps to support fewer languages."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "cc441384-875d-4e18-a52c-da7bee8190af",
          "type": "message",
          "user": "U03HWDD6RED",
          "text": "At other times, community-supported projects may be able to elicit contributions from the community that can help where a single developer may not, depending on what your relationship is with that community. But it is very much a commitment — often an economic one — you may want to think about as an ongoing task that requires care and maintenance.",
          "ts": "1654806789.784679",
          "thread_ts": "1654805157.026269",
          "edited": {
            "user": "U03HWDD6RED",
            "ts": "1654806797.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "7ar",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "At other times, community-supported projects may be able to elicit contributions from the community that can help where a single developer may not, depending on what your relationship is with that community. But it is very much a commitment — often an economic one — you may want to think about as an ongoing task that requires care and maintenance."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "419b1035-e576-49aa-b9d1-37c6da2adf93",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "Just to clarify — you are not having issues with filtering out new strings from old ones, correct?",
          "ts": "1654811471.208569",
          "thread_ts": "1654805157.026269",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "padC",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Just to clarify — you are not having issues with filtering out new strings from old ones, correct?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2c83b332-0a8f-42f3-b0e5-fa40faa31a08",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "in other words, using the Xcode import/export workflow, you _should_ be able to only have to deal with new/changed strings on every release, rather than re-translating the entire app.",
          "ts": "1654811501.926429",
          "thread_ts": "1654805157.026269",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "ABTs",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "in other words, using the Xcode import/export workflow, you "
                    },
                    {
                      "type": "text",
                      "text": "should",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " be able to only have to deal with new/changed strings on every release, rather than re-translating the entire app."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "53f99292-b2a4-4929-874b-63c46a7ed52d",
          "type": "message",
          "user": "U03JC9AHBFE",
          "text": "There are third-party services that offer (human) translation as a service for your localizable strings. But you'll have to document your strings well, or they may get the context wrong and mistranslate.",
          "ts": "1654877188.094599",
          "thread_ts": "1654805157.026269",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HW7PE3SM"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "58Gn6",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "There are third-party services that offer (human) translation as a service for your localizable strings. But you'll have to document your strings well, or they may get the context wrong and mistranslate."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03J1TN6WBD\u003e asked\n\u0026gt; We saw that this year you're adding punctuation to Hebrew (Thank you for that! תודה רבה)\n\u0026gt; Besides the obvious addition to the Hebrew Keyboard is there anything else we should know about that?",
      "ts": "1654810880.398029",
      "thread_ts": "1654810880.398029",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 2,
      "latest_reply": "1654812815.248119",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "sZqIg",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03J1TN6WBD"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"We saw that this year you're adding punctuation to Hebrew (Thank you for that! \\u05ea\\u05d5\\u05d3\\u05d4 \\u05e8\\u05d1\\u05d4)\\nBesides the obvious addition to the Hebrew Keyboard is there anything else we should know about that?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "d436b96d-8b95-4e72-9b8f-299decb93d33",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Hi \u003c@U03J1TN6WBD\u003e, we have indeed added _niqqud_ support to the iPhone \u0026amp; iPad keyboard layouts this year.\n\nThere’s nothing else new for Hebrew this year per se, but it’s worth mentioning that Yiddish is also now supported as a separate keyboard language.",
          "ts": "1654810952.018869",
          "thread_ts": "1654810880.398029",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "raised_hands",
              "count": 1,
              "users": [
                "U03J1TN6WBD"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Cam",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi "
                    },
                    {
                      "type": "user",
                      "user_id": "U03J1TN6WBD"
                    },
                    {
                      "type": "text",
                      "text": ", we have indeed added "
                    },
                    {
                      "type": "text",
                      "text": "niqqud",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " support to the iPhone \u0026 iPad keyboard layouts this year.\n\nThere’s nothing else new for Hebrew this year per se, but it’s worth mentioning that Yiddish is also now supported as a separate keyboard language."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "98affccd-c42e-4ca7-91cd-b039eb21fe36",
          "type": "message",
          "user": "U03J1TN6WBD",
          "text": "Thank you! a dank",
          "ts": "1654812815.248119",
          "thread_ts": "1654810880.398029",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "orange_heart",
              "count": 1,
              "users": [
                "U03J83G0WQG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Pa0i",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Thank you! a dank"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "7c137dba-ae77-4bf2-a5ae-f0c2280fc816",
      "type": "message",
      "user": "U03HJ9NLS1H",
      "text": ":wave: Welcome back everyone! We’re soon about to start our *Right-to-Left digital lounge*. In a few minutes, our Apple engineers will be ready to answer your questions about designing great apps to support Right-to-Left languages, and what are the best practices to follow!\nBefore we start, make sure to check out:\n• :books: Our *\u003chttps://developer.apple.com/design/human-interface-guidelines/foundations/right-to-left|Right-to-Left design guidelines\u003e*, which includes best practices to design an app for a global audience.\n• :movie_camera: Our new talks from this year:\n    ◦ *\u003chttps://developer.apple.com/videos/play/wwdc2022/10107/|Get it Right (to left)\u003e*, to learn how to deliver great experiences for Arabic and Hebrew speakers.\n    ◦ *\u003chttps://developer.apple.com/videos/play/wwdc2022/10034/|Design for Arabic\u003e*, by our very own \u003c@U03J83F2TDE\u003e, to learn more about best practices specifically for great experiences for Arabic speakers – \u003chttps://developer.apple.com/videos/play/wwdc2022/110441/|also available in Arabic\u003e!\nWe'll get started in a bit, so have a coffee and get ready! :coffee:",
      "ts": "1654876200.495499",
      "edited": {
        "user": "U03HJ9NLS1H",
        "ts": "1654876431.000000"
      },
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "purple_heart",
          "count": 5,
          "users": [
            "U03J83G0WQG",
            "U03HJA9JVGA",
            "U03JGH0JLMQ",
            "U03J83F2TDE",
            "U03JCRFMPHV"
          ]
        },
        {
          "name": "pray",
          "count": 3,
          "users": [
            "U03J83G0WQG",
            "U03HJA9JVGA",
            "U03HJ9NFC9Z"
          ]
        },
        {
          "name": "+1",
          "count": 1,
          "users": [
            "U03J83F2TDE"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "L5BoU",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "emoji",
                  "name": "wave",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " Welcome back everyone! We’re soon about to start our "
                },
                {
                  "type": "text",
                  "text": "Right-to-Left digital lounge",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": ". In a few minutes, our Apple engineers will be ready to answer your questions about designing great apps to support Right-to-Left languages, and what are the best practices to follow!\nBefore we start, make sure to check out:\n"
                }
              ]
            },
            {
              "Type": "rich_text_list",
              "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"emoji\",\"name\":\"books\"},{\"type\":\"text\",\"text\":\" Our \"},{\"type\":\"link\",\"url\":\"https:\\/\\/developer.apple.com\\/design\\/human-interface-guidelines\\/foundations\\/right-to-left\",\"text\":\"Right-to-Left design guidelines\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\", which includes best practices to design an app for a global audience.\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"emoji\",\"name\":\"movie_camera\"},{\"type\":\"text\",\"text\":\" Our new talks from this year:\"}]}],\"style\":\"bullet\",\"indent\":0,\"border\":0}"
            },
            {
              "Type": "rich_text_list",
              "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"link\",\"url\":\"https:\\/\\/developer.apple.com\\/videos\\/play\\/wwdc2022\\/10107\\/\",\"text\":\"Get it Right (to left)\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\", to learn how to deliver great experiences for Arabic and Hebrew speakers.\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"link\",\"url\":\"https:\\/\\/developer.apple.com\\/videos\\/play\\/wwdc2022\\/10034\\/\",\"text\":\"Design for Arabic\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\", by our very own \"},{\"type\":\"user\",\"user_id\":\"U03J83F2TDE\"},{\"type\":\"text\",\"text\":\", to learn more about best practices specifically for great experiences for Arabic speakers \\u2013 \"},{\"type\":\"link\",\"url\":\"https:\\/\\/developer.apple.com\\/videos\\/play\\/wwdc2022\\/110441\\/\",\"text\":\"also available in Arabic\"},{\"type\":\"text\",\"text\":\"!\"}]}],\"style\":\"bullet\",\"indent\":1,\"border\":0}"
            },
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "text",
                  "text": "We'll get started in a bit, so have a coffee and get ready! "
                },
                {
                  "type": "emoji",
                  "name": "coffee",
                  "skin_tone": 0
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "4ce64326-59e1-43de-9597-6a99b53ef196",
      "type": "message",
      "user": "U03HJ9NLS1H",
      "text": "\u003c!channel\u003e And *we're live*! Send us all your Right-to-Left-adjacent questions, and we'll dive right in :eyes:",
      "ts": "1654876841.381519",
      "thread_ts": "1654876841.381519",
      "reply_count": 2,
      "latest_reply": "1654877717.215619",
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "clock9",
          "count": 8,
          "users": [
            "U03HBMCRX0E",
            "U03JFN63EJ3",
            "U03J83G0WQG",
            "U03HJA9JVGA",
            "U03HJA9AJTU",
            "U03HJ9NFC9Z",
            "U03K720M8RW",
            "U03J5SM2VUJ"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "B0Y",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "broadcast",
                  "range": "channel"
                },
                {
                  "type": "text",
                  "text": " And "
                },
                {
                  "type": "text",
                  "text": "we're live",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": "! Send us all your Right-to-Left-adjacent questions, and we'll dive right in "
                },
                {
                  "type": "emoji",
                  "name": "eyes",
                  "skin_tone": 0
                }
              ]
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "cc2c2518-8615-40a1-91c9-457fb4164333",
          "type": "message",
          "user": "U03JBLYMHSS",
          "text": "Hello Eric,\n\nWe have localization Strings being delivered by Middle ware and get updated and stored in Application Directory on each app launch. Where we used to load them using `\"Localizable.nocache\"`  as mentioned on Apple Docs. However this slow down the UI performance way too much. As it seems it would load whole strings map for each call to NSLocalizationString. Can you suggest a work around?\n\nThanks\nFahied",
          "ts": "1654877322.303209",
          "thread_ts": "1654876841.381519",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "z/WY",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hello Eric,\n\nWe have localization Strings being delivered by Middle ware and get updated and stored in Application Directory on each app launch. Where we used to load them using "
                    },
                    {
                      "type": "text",
                      "text": "\"Localizable.nocache\"",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "  as mentioned on Apple Docs. However this slow down the UI performance way too much. As it seems it would load whole strings map for each call to NSLocalizationString. Can you suggest a work around?\n\nThanks\nFahied"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "3558ba27-4ca5-43b6-9450-69ea8ec4ac5f",
          "type": "message",
          "user": "U03HJ9NLS1H",
          "text": "Hi Muhammad, please use the workflow :workflowbolt: to ask your question! That'll make your question visible to all Apple engineers. Thank you :grin:",
          "ts": "1654877717.215619",
          "thread_ts": "1654876841.381519",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JBLYMHSS"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "uAr",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi Muhammad, please use the workflow "
                    },
                    {
                      "type": "emoji",
                      "name": "workflowbolt",
                      "skin_tone": 0
                    },
                    {
                      "type": "text",
                      "text": " to ask your question! That'll make your question visible to all Apple engineers. Thank you "
                    },
                    {
                      "type": "emoji",
                      "name": "grin",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JCRFMPHV\u003e asked\n\u0026gt; Maybe a slightly tangential question, but are there learnings or strategies used during RTL localization that could be beneficial for adapting a UI with significant lateral elements for left handed use? Does “handedness” come into play when considering the design of RTL UIs?",
      "ts": "1654877608.387819",
      "thread_ts": "1654877608.387819",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 10,
      "latest_reply": "1654882655.088939",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "3FG",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JCRFMPHV"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Maybe a slightly tangential question, but are there learnings or strategies used during RTL localization that could be beneficial for adapting a UI with significant lateral elements for left handed use? Does \\u201chandedness\\u201d come into play when considering the design of RTL UIs?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "5c3077e6-a8fa-4a54-ac2d-de03685292f8",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "We treat _Handedness_ and _Layout Directionality_ as distinct elements and handle each of those in different ways.\n\nFor example, for the One-Handed Keyboard, we offer both Left-Handed and Right-Handed modes.\n\nUI elements or gestures that indicate a progression that go left-to-right in an LTR language do mirror to go right-to-left in an RTL language. So, handedness does not come into play here.\n\nThis is all fairly abstract, of course. If you have a concrete example that you want to ask about, do feel free to share it :)",
          "ts": "1654877846.972849",
          "thread_ts": "1654877608.387819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "2AK",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "We treat "
                    },
                    {
                      "type": "text",
                      "text": "Handedness",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " and "
                    },
                    {
                      "type": "text",
                      "text": "Layout Directionality",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " as distinct elements and handle each of those in different ways.\n\nFor example, for the One-Handed Keyboard, we offer both Left-Handed and Right-Handed modes.\n\nUI elements or gestures that indicate a progression that go left-to-right in an LTR language do mirror to go right-to-left in an RTL language. So, handedness does not come into play here.\n\nThis is all fairly abstract, of course. If you have a concrete example that you want to ask about, do feel free to share it :)"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "7A549903-C053-4266-BB00-5347E77426C7",
          "type": "message",
          "user": "U03JCRFMPHV",
          "text": "I guess, as a lefty, I never really understood how an adaptive layout could really change how someone uses a device until I started looking at how RTL languages are handled in the HIG. The chevrons in lists are meant to point towards the thumb you use to tap them :exploding_head:. I would imagine that the inverse could be true in RTL situations… has that changed your design strategy?",
          "ts": "1654879160.655229",
          "thread_ts": "1654877608.387819",
          "edited": {
            "user": "U03JCRFMPHV",
            "ts": "1654879282.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "BL0F",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I guess, as a lefty, I never really understood how an adaptive layout could really change how someone uses a device until I started looking at how RTL languages are handled in the HIG. The chevrons in lists are meant to point towards the thumb you use to tap them "
                    },
                    {
                      "type": "emoji",
                      "name": "exploding_head",
                      "skin_tone": 0
                    },
                    {
                      "type": "text",
                      "text": "."
                    },
                    {
                      "type": "text",
                      "text": " I "
                    },
                    {
                      "type": "text",
                      "text": "would"
                    },
                    {
                      "type": "text",
                      "text": " imagine "
                    },
                    {
                      "type": "text",
                      "text": "that"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " inverse could be "
                    },
                    {
                      "type": "text",
                      "text": "true"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "in"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "RTL"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "situations…"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "has"
                    },
                    {
                      "type": "text",
                      "text": " that change"
                    },
                    {
                      "type": "text",
                      "text": "d"
                    },
                    {
                      "type": "text",
                      "text": " your design "
                    },
                    {
                      "type": "text",
                      "text": "strategy?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2E395484-A9CE-4B60-B624-202563F3F158",
          "type": "message",
          "user": "U03JCRFMPHV",
          "text": "For example, an iPad in portrait orientation puts the capture button on the right hand side. This seems like a place where handedness would take priority. But there are other situations where the inverse would be true?",
          "ts": "1654879388.852129",
          "thread_ts": "1654877608.387819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "dMDv",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "For"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "example,"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "an"
                    },
                    {
                      "type": "text",
                      "text": " iPad "
                    },
                    {
                      "type": "text",
                      "text": "in"
                    },
                    {
                      "type": "text",
                      "text": " portrait orientation puts t"
                    },
                    {
                      "type": "text",
                      "text": "he"
                    },
                    {
                      "type": "text",
                      "text": " capture "
                    },
                    {
                      "type": "text",
                      "text": "button"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "on"
                    },
                    {
                      "type": "text",
                      "text": " the "
                    },
                    {
                      "type": "text",
                      "text": "right"
                    },
                    {
                      "type": "text",
                      "text": " hand "
                    },
                    {
                      "type": "text",
                      "text": "side."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "This"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "seems"
                    },
                    {
                      "type": "text",
                      "text": " like "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "place"
                    },
                    {
                      "type": "text",
                      "text": " where "
                    },
                    {
                      "type": "text",
                      "text": "handedness"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "would"
                    },
                    {
                      "type": "text",
                      "text": " take priority"
                    },
                    {
                      "type": "text",
                      "text": "."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "But"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "there"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "are"
                    },
                    {
                      "type": "text",
                      "text": " other situations "
                    },
                    {
                      "type": "text",
                      "text": "where"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "inverse"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "would"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "be"
                    },
                    {
                      "type": "text",
                      "text": " true"
                    },
                    {
                      "type": "text",
                      "text": "?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "1764855A-F81F-433C-9B8A-384541371B9E",
          "type": "message",
          "user": "U03JCRFMPHV",
          "text": "I didn't see specifics about gestures in the HIG article, so I was wondering if I just missed something or if there was some type of helpful underlying principle to keep in mind.",
          "ts": "1654879456.726169",
          "thread_ts": "1654877608.387819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "6wU",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": " didn't "
                    },
                    {
                      "type": "text",
                      "text": "see"
                    },
                    {
                      "type": "text",
                      "text": " specifics "
                    },
                    {
                      "type": "text",
                      "text": "about"
                    },
                    {
                      "type": "text",
                      "text": " gesture"
                    },
                    {
                      "type": "text",
                      "text": "s"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "in"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " HIG "
                    },
                    {
                      "type": "text",
                      "text": "article,"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "so"
                    },
                    {
                      "type": "text",
                      "text": " I was "
                    },
                    {
                      "type": "text",
                      "text": "wondering"
                    },
                    {
                      "type": "text",
                      "text": " if I "
                    },
                    {
                      "type": "text",
                      "text": "just"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "missed"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "something"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "or"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "if"
                    },
                    {
                      "type": "text",
                      "text": " there "
                    },
                    {
                      "type": "text",
                      "text": "was"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "some"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "type"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "of"
                    },
                    {
                      "type": "text",
                      "text": " helpful "
                    },
                    {
                      "type": "text",
                      "text": "underlying"
                    },
                    {
                      "type": "text",
                      "text": " p"
                    },
                    {
                      "type": "text",
                      "text": "rinciple"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "to"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "keep"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "in"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "mind."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "0d729ee4-d808-45e0-ba79-40de3655db4f",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Those are thought-provoking questions, \u003c@U03JCRFMPHV\u003e, and I likely won’t have any satisfying answers to your larger question in this forum.\n\nIt does seem like Handedness and how it applies to User Interface Design is a topic that I’m not the best person to answer, though I’ll see if there are any other colleagues of mine who may have an answer for you.",
          "ts": "1654879587.657209",
          "thread_ts": "1654877608.387819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "N4Z4F",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Those are thought-provoking questions, "
                    },
                    {
                      "type": "user",
                      "user_id": "U03JCRFMPHV"
                    },
                    {
                      "type": "text",
                      "text": ", and I likely won’t have any satisfying answers to your larger question in this forum.\n\nIt does seem like Handedness and how it applies to User Interface Design is a topic that I’m not the best person to answer, though I’ll see if there are any other colleagues of mine who may have an answer for you."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "007d61ab-e265-453b-9a25-6aadf0e72df7",
          "type": "message",
          "user": "U03J83F2TDE",
          "text": "The overall rule is that the design layout in RTL matches the flow that the user would expect elements to flow in the UI - including the text strings, animation, navigation (E.g. If the heat map of people that uses an LTR layout - e.g. website - is on the top left corner, it would be top right corner in RTL).\n\nThe only thing that we should take care of is:\n*Reachability:* if the design intention is to have an element closer to the right hand - then it should not be changing because of the RTL layout (E.g. the keyboard layout does not change when you switch LTR or RTL / emojis entry point would be at the same exact place).\n\nOther elements that could impact our decisions while changing to RTL layout:\n1. *Memorization:* If the UI component would be very connected to how user would remember things, it should not change (E.g. the order of the lock screen numbers remain the same in both RTL \u0026amp; LTR)\n2. *Images,* videos, backgrounds should not also be impacted (E.g. the weather App background).\n\u003c@U03JCRFMPHV\u003e Let me know what do you think.",
          "ts": "1654880624.325509",
          "thread_ts": "1654877608.387819",
          "edited": {
            "user": "U03J83F2TDE",
            "ts": "1654880829.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "SLp",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "The overall rule is that the design layout in RTL matches the flow that the user would expect elements to flow in the UI - including the text strings, animation, navigation (E.g. If the heat map of people that uses an LTR layout - e.g. website - is on the top left corner, it would be top right corner in RTL).\n\nThe only thing that we should take care of is:\n"
                    },
                    {
                      "type": "text",
                      "text": "Reachability: ",
                      "style": {
                        "bold": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "if the design intention is to have an element closer to the right hand - then it should not be changing because of the RTL layout (E.g. the keyboard layout does not change when you switch LTR or RTL / emojis entry point would be at the same exact place).\n\nOther elements that could impact our decisions while changing to RTL layout:\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Memorization: \",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\"If the UI component would be very connected to how user would remember things, it should not change (E.g. the order of the lock screen numbers remain the same in both RTL \u0026 LTR)\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Images,\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\" videos, backgrounds should not also be impacted (E.g. the weather App background).\"}]}],\"style\":\"ordered\",\"indent\":0,\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "user",
                      "user_id": "U03JCRFMPHV"
                    },
                    {
                      "type": "text",
                      "text": " Let me know what do you think."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "51381266-84D8-499C-BF19-3925BACB766C",
          "type": "message",
          "user": "U03JCRFMPHV",
          "text": "This is very interesting, thank you for sharing some of the methodology in your design thinking. I was surprised to see elements like system level scroll bars flip to the left side. It's never been under my thumb before. Seems disadvantageous for RTL righties?\n\n\u003c@U03J83F2TDE\u003e ",
          "ts": "1654880849.130029",
          "thread_ts": "1654877608.387819",
          "edited": {
            "user": "U03JCRFMPHV",
            "ts": "1654881032.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "jpLVP",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "This is very interesting, thank you for sharing some of the methodology in your design thinking. I was surprised to see elements like system level scroll bars flip to the left side. It's never been under my thumb before. Seems disadvantageous for RTL righties?"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "user",
                      "user_id": "U03J83F2TDE"
                    },
                    {
                      "type": "text",
                      "text": " "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "07b3ba81-7d8d-4951-8877-a5d4503c7f63",
          "type": "message",
          "user": "U03J83F2TDE",
          "text": "That’s a really great question \u003c@U03JCRFMPHV\u003e\n\n*Two angles for this:* (which are up for discussion too) :slightly_smiling_face:\n\n• In the layout, having scroll bars usually is on the other side where your attention should be.\n• And for reachability, I usually think about it device by device. On macOS - which I think is where scroll bars are used the most - there is no reachability issue as it is not touch based. Touch based devices are less likely to rely on it and it is used as an indicator more than an interactive piece of the UI as we use swipe instead. And even on iPad for example if we decide to use it, we mostly hold it with two hands and the left hand solves it too. ",
          "ts": "1654881627.074239",
          "thread_ts": "1654877608.387819",
          "edited": {
            "user": "U03J83F2TDE",
            "ts": "1654881639.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "nsYj",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "That’s a really great question "
                    },
                    {
                      "type": "user",
                      "user_id": "U03JCRFMPHV"
                    },
                    {
                      "type": "text",
                      "text": "\n\n"
                    },
                    {
                      "type": "text",
                      "text": "Two angles for this: ",
                      "style": {
                        "bold": true
                      }
                    },
                    {
                      "type": "text",
                      "text": "(which are up for discussion too) "
                    },
                    {
                      "type": "emoji",
                      "name": "slightly_smiling_face",
                      "skin_tone": 0
                    },
                    {
                      "type": "text",
                      "text": "\n\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"In the layout, having scroll bars usually is on the other side where your attention should be.\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"And for reachability, I usually think about it device by device. On macOS - which I think is where scroll bars are used the most - there is no reachability issue as it is not touch based. Touch based devices are less likely to rely on it and it is used as an indicator more than an interactive piece of the UI as we use swipe instead. And even on iPad for example if we decide to use it, we mostly hold it with two hands and the left hand solves it too. \"}]}],\"style\":\"bullet\",\"indent\":0,\"border\":0}"
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "E0482A86-A696-4EC4-B766-5B0FCFFBA68E",
          "type": "message",
          "user": "U03JCRFMPHV",
          "text": "Definitely. I can honestly say that having the scroll bar under my thumb for the first time… and to not have my scrolling thumb blocking the icons in lists for example, was a brand new experience. \n\nEspecially on the larger phone, it makes reaching the compose button much easier :joy:. \n\nInteresting to see places where steps were taken to counteract reachability issues. Like floating the iPad portrait camera capture button to the right. Thank you for your thoughtful response! \u003c@U03J83F2TDE\u003e ",
          "ts": "1654882542.228509",
          "thread_ts": "1654877608.387819",
          "edited": {
            "user": "U03JCRFMPHV",
            "ts": "1654882600.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Xhw",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Definitely. I can honestly say that having the scroll bar under my thumb for the first time… and to not have my scrolling thumb blocking the icons in lists for example, was a brand new experience. "
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "Especially on the larger phone, it makes reaching the compose button much easier "
                    },
                    {
                      "type": "emoji",
                      "name": "joy",
                      "skin_tone": 0
                    },
                    {
                      "type": "text",
                      "text": ". "
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "Interesting to see places where steps were taken to counteract reachability issues. Like floating the iPad portrait camera capture button to the right. Thank you for your thoughtful response! "
                    },
                    {
                      "type": "user",
                      "user_id": "U03J83F2TDE"
                    },
                    {
                      "type": "text",
                      "text": " "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "33f0afa1-00f5-4e40-9275-b9ef54f3ecf8",
          "type": "message",
          "user": "U03J83F2TDE",
          "text": "You’re always welcome \u003c@U03JCRFMPHV\u003e\nNice questions :D",
          "ts": "1654882655.088939",
          "thread_ts": "1654877608.387819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Dp=A",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "You’re always welcome "
                    },
                    {
                      "type": "user",
                      "user_id": "U03JCRFMPHV"
                    },
                    {
                      "type": "text",
                      "text": "\nNice questions :D"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JRP87THN\u003e asked\n\u0026gt; Hi there! Didn't have time to check out the new resources yet (but will do in the future for sure!). Could you tell me what are the main key points that we should take into account when designing apps targeting an international audience?",
      "ts": "1654878077.954829",
      "thread_ts": "1654878077.954829",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 4,
      "latest_reply": "1654878892.047589",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "T=1F",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JRP87THN"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Hi there! Didn't have time to check out the new resources yet (but will do in the future for sure!). Could you tell me what are the main key points that we should take into account when designing apps targeting an international audience?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "3054099b-fbe8-40f6-a3c2-c2921b76bd9a",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Hi \u003c@U03JRP87THN\u003e, there’s no succinct answer for this; so, I would highly recommend checking out \u003chttps://developer.apple.com/videos/play/wwdc2018/201/?time=1665|Creating Apps for a Global Audience\u003e, \u003chttps://developer.apple.com/videos/play/wwdc2022/10110/|Localization by example\u003e, and \u003chttps://developer.apple.com/videos/play/wwdc2022/10107/|Get it Right (to Left)\u003e to build up an understanding of what you should take into account when designing apps for an international audience.",
          "ts": "1654878265.889109",
          "thread_ts": "1654878077.954829",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JRP87THN"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "gvaZz",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi "
                    },
                    {
                      "type": "user",
                      "user_id": "U03JRP87THN"
                    },
                    {
                      "type": "text",
                      "text": ", there’s no succinct answer for this; so, I would highly recommend checking out "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.apple.com/videos/play/wwdc2018/201/?time=1665",
                      "text": "Creating Apps for a Global Audience"
                    },
                    {
                      "type": "text",
                      "text": ", "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.apple.com/videos/play/wwdc2022/10110/",
                      "text": "Localization by example"
                    },
                    {
                      "type": "text",
                      "text": ", and "
                    },
                    {
                      "type": "link",
                      "url": "https://developer.apple.com/videos/play/wwdc2022/10107/",
                      "text": "Get it Right (to Left)"
                    },
                    {
                      "type": "text",
                      "text": " to build up an understanding of what you should take into account when designing apps for an international audience."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "f3d3757d-0f38-4f81-9527-722f7ef2c7cb",
          "type": "message",
          "user": "U03J83F2TDE",
          "text": "\u003c@U03JRP87THN\u003e I would say, generally speaking look out for two things:\n1. *Language:* design layouts may be impacted by RTL languages Orientation or the less dense text strings in CJK languages. Another example is that certain scripts require different bounding boxes or spacing whether less or more than latin (E.g. Thai needs more vertical spacing in the UI to avoid clipping).\n2. *Culture:* What are the cultural behaviors and nuances that can impact the features you support, the hierarchy or the elements in the UI, or simply the visual language (E.g. colours that could be perceived differently in different cultures).\n",
          "ts": "1654878627.617649",
          "thread_ts": "1654878077.954829",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 3,
              "users": [
                "U03J83G0WQG",
                "U03HJ9NLS1H",
                "U03JRP87THN"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "lJE+0",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "user",
                      "user_id": "U03JRP87THN"
                    },
                    {
                      "type": "text",
                      "text": " I would say, generally speaking look out for two things:\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Language: \",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\"design layouts may be impacted by RTL languages Orientation or the less dense text strings in CJK languages. Another example is that certain scripts require different bounding boxes or spacing whether less or more than latin (E.g. Thai needs more vertical spacing in the UI to avoid clipping).\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Culture: \",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\"What are the cultural behaviors and nuances that can impact the features you support, the hierarchy or the elements in the UI, or simply the visual language (E.g. colours that could be perceived differently in different cultures).\"}]}],\"style\":\"ordered\",\"indent\":0,\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": []
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "0b50e822-6665-46cb-8a23-97bdf80bfa57",
          "type": "message",
          "user": "U03JRP87THN",
          "text": "Thank you!",
          "ts": "1654878880.329549",
          "thread_ts": "1654878077.954829",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "EI2",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Thank you!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "cca91c5b-587a-4094-ad64-5b81cc256fc6",
          "type": "message",
          "user": "U03JRP87THN",
          "text": "Will look into the resources.",
          "ts": "1654878892.047589",
          "thread_ts": "1654878077.954829",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "/LI",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Will look into the resources."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03HVF46TEJ\u003e asked\n\u0026gt; Should RTL (specifically Arabic) text work out of the box using SwiftUI on watchOS 8? Are there any configurations or SwiftUI properties that might break it? I have a Watch app and RTL seem to work fine (I can’t read them but they look okay) but I’ve gotten feedback that they fail for some users — Arabic text is “backwards” and the characters aren’t joined like they should be. I’m just using Text so I can’t see why this would happen. I can provide screenshots in the thread if possible.",
      "ts": "1654878273.192779",
      "thread_ts": "1654878273.192779",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 24,
      "latest_reply": "1654880219.374769",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "6GBl",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03HVF46TEJ"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Should RTL (specifically Arabic) text work out of the box using SwiftUI on watchOS 8? Are there any configurations or SwiftUI properties that might break it? I have a Watch app and RTL seem to work fine (I can\\u2019t read them but they look okay) but I\\u2019ve gotten feedback that they fail for some users \\u2014 Arabic text is \\u201cbackwards\\u201d and the characters aren\\u2019t joined like they should be. I\\u2019m just using Text so I can\\u2019t see why this would happen. I can provide screenshots in the thread if possible.\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "8e70ae21-e65c-4669-902c-fa83163e2318",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Hi Christopher! I think I may have an idea of what issue you’re encountering, but to be sure, a screenshot would definitely help. Please feel free to share.",
          "ts": "1654878313.999909",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "3jm",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi Christopher! I think I may have an idea of what issue you’re encountering, but to be sure, a screenshot would definitely help. Please feel free to share."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "FACB2515-77FF-4354-8A8E-8EAE544D620A",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "Sure, here's the same text on watchOS and iOS. ",
          "ts": "1654878438.832479",
          "thread_ts": "1654878273.192779",
          "files": [
            {
              "id": "F03JRP0L51V",
              "created": 1654878416,
              "timestamp": 1654878416,
              "name": "Image from iOS.jpg",
              "title": "Image from iOS",
              "mimetype": "image/jpeg",
              "image_exif_rotation": 0,
              "filetype": "jpg",
              "pretty_type": "JPEG",
              "user": "U03HVF46TEJ",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 19757,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JRP0L51V/image_from_ios.jpg",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JRP0L51V/download/image_from_ios.jpg",
              "original_h": 448,
              "original_w": 368,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRP0L51V-15eaffcd67/image_from_ios_64.jpg",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRP0L51V-15eaffcd67/image_from_ios_80.jpg",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRP0L51V-15eaffcd67/image_from_ios_160.jpg",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRP0L51V-15eaffcd67/image_from_ios_360.jpg",
              "thumb_360_gif": "",
              "thumb_360_w": 296,
              "thumb_360_h": 360,
              "thumb_480": "",
              "thumb_480_w": 0,
              "thumb_480_h": 0,
              "thumb_720": "",
              "thumb_720_w": 0,
              "thumb_720_h": 0,
              "thumb_960": "",
              "thumb_960_w": 0,
              "thumb_960_h": 0,
              "thumb_1024": "",
              "thumb_1024_w": 0,
              "thumb_1024_h": 0,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03HVF46TEJ/F03JRP0L51V/image_from_ios.jpg",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03JRP0L51V-f49ca3d5a9",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            },
            {
              "id": "F03KW4AFDU0",
              "created": 1654878424,
              "timestamp": 1654878424,
              "name": "Image from iOS.jpg",
              "title": "Image from iOS",
              "mimetype": "image/jpeg",
              "image_exif_rotation": 0,
              "filetype": "jpg",
              "pretty_type": "JPEG",
              "user": "U03HVF46TEJ",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 103700,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03KW4AFDU0/image_from_ios.jpg",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03KW4AFDU0/download/image_from_ios.jpg",
              "original_h": 1334,
              "original_w": 750,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_64.jpg",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_80.jpg",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_160.jpg",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_360.jpg",
              "thumb_360_gif": "",
              "thumb_360_w": 202,
              "thumb_360_h": 360,
              "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_480.jpg",
              "thumb_480_w": 270,
              "thumb_480_h": 480,
              "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_720.jpg",
              "thumb_720_w": 405,
              "thumb_720_h": 720,
              "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_960.jpg",
              "thumb_960_w": 540,
              "thumb_960_h": 960,
              "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03KW4AFDU0-d7ea2b1bf1/image_from_ios_1024.jpg",
              "thumb_1024_w": 576,
              "thumb_1024_h": 1024,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03HVF46TEJ/F03KW4AFDU0/image_from_ios.jpg",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03KW4AFDU0-9bbf27db8a",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "CasY",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Sure,"
                    },
                    {
                      "type": "text",
                      "text": " here's the "
                    },
                    {
                      "type": "text",
                      "text": "same"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "text"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "on"
                    },
                    {
                      "type": "text",
                      "text": " watchOS "
                    },
                    {
                      "type": "text",
                      "text": "and"
                    },
                    {
                      "type": "text",
                      "text": " iOS"
                    },
                    {
                      "type": "text",
                      "text": ". "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "C012D695-4DD9-4BDD-933F-7FD75C1E490C",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "I've been unable to reproduce the this with my own strings but I don't have a copy of this exact text.",
          "ts": "1654878486.143089",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "z/RR9",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I've "
                    },
                    {
                      "type": "text",
                      "text": "been"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "unable"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "to"
                    },
                    {
                      "type": "text",
                      "text": " reproduce "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "this"
                    },
                    {
                      "type": "text",
                      "text": " with "
                    },
                    {
                      "type": "text",
                      "text": "my"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "own"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "strings"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "but"
                    },
                    {
                      "type": "text",
                      "text": " I don't "
                    },
                    {
                      "type": "text",
                      "text": "have"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "copy"
                    },
                    {
                      "type": "text",
                      "text": " of "
                    },
                    {
                      "type": "text",
                      "text": "this"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "exact"
                    },
                    {
                      "type": "text",
                      "text": " text"
                    },
                    {
                      "type": "text",
                      "text": "."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "1febee6b-bf84-4956-966d-007562182e31",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "I see; there are two different issues going on here.",
          "ts": "1654878559.933199",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "TOC2F",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I see; there are two different issues going on here."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "68f669a0-846e-4c60-98d8-4f49f89b9f44",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "The Watch screenshot demonstrates broken and completely illegible Arabic text, and it’s also not using the System Font. It’s difficult to be sure about what’s going on here without a sample app to reproduce this issue in.",
          "ts": "1654878579.424239",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "1Zcs",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "The Watch screenshot demonstrates broken and completely illegible Arabic text, and it’s also not using the System Font. It’s difficult to be sure about what’s going on here without a sample app to reproduce this issue in."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "3BA2C2FE-B7C2-4109-8DCD-A22A411E220F",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "I am setting the Text’s font using UIFont and a FontDescriptor so I'd guess that's the culprit",
          "ts": "1654878603.670739",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "gNZ",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "am"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "setting"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Text’s"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "font"
                    },
                    {
                      "type": "text",
                      "text": " using UIFont "
                    },
                    {
                      "type": "text",
                      "text": "and"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "FontDescriptor"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "so"
                    },
                    {
                      "type": "text",
                      "text": " I'd "
                    },
                    {
                      "type": "text",
                      "text": "guess"
                    },
                    {
                      "type": "text",
                      "text": " that's "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " culprit"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "a57e2156-a67b-40e3-8e50-24d9383a4d2e",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "One thing I will note is that in the Watch screenshot, the title `التحريم` is rendering correctly, but the body text below that is what’s completely broken.",
          "ts": "1654878609.896979",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "qW5",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "One thing I will note is that in the Watch screenshot, the title "
                    },
                    {
                      "type": "text",
                      "text": "التحريم",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " is rendering correctly, but the body text below that is what’s completely broken."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "CE3B3423-02C8-435D-A7C1-2064F685435F",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "Not sure why it fails for some RTL strings and not others",
          "ts": "1654878629.076379",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "0eeuC",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "N"
                    },
                    {
                      "type": "text",
                      "text": "ot"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "sure"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "why"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "it"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "fails"
                    },
                    {
                      "type": "text",
                      "text": " for "
                    },
                    {
                      "type": "text",
                      "text": "some"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "RTL"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "strings"
                    },
                    {
                      "type": "text",
                      "text": " and "
                    },
                    {
                      "type": "text",
                      "text": "not"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "others"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "a4f6f095-1d09-48c2-aaa7-8b6a66620c21",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "It’s possible that the specific font you’re using supports Arabic glyphs, but not the appropriate shaping.",
          "ts": "1654878633.797099",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "MF+",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It’s possible that the specific font you’re using supports Arabic glyphs, but not the appropriate shaping."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "c851ff48-4c64-48a3-909e-4ecc55575466",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "I should note that the _alignment_ in both the iOS and watchOS screenshot is unnatural for Arabic, i.e. the text is left-aligned instead of right-aligned. Does this app localize into Arabic, i.e. have `ar.lproj` or is it localized into another language and this content is being loaded at runtime?",
          "ts": "1654878706.640109",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "y289R",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I should note that the "
                    },
                    {
                      "type": "text",
                      "text": "alignment",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " in both the iOS and watchOS screenshot is unnatural for Arabic, i.e. the text is left-aligned instead of right-aligned. Does this app localize into Arabic, i.e. have "
                    },
                    {
                      "type": "text",
                      "text": "ar.lproj",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " or is it localized into another language and this content is being loaded at runtime?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "B6E03BCF-10F6-474D-937C-C3C1C7B032A6",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "The app is localized in Russian, which is what this user is set to. And then he's entered Arabic text.",
          "ts": "1654878762.652519",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "moTft",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "The "
                    },
                    {
                      "type": "text",
                      "text": "app"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "localized"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "in"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Russian,"
                    },
                    {
                      "type": "text",
                      "text": " which "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " what "
                    },
                    {
                      "type": "text",
                      "text": "this"
                    },
                    {
                      "type": "text",
                      "text": " user "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " set "
                    },
                    {
                      "type": "text",
                      "text": "to. And"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "then"
                    },
                    {
                      "type": "text",
                      "text": " he's "
                    },
                    {
                      "type": "text",
                      "text": "entered"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Arabic"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "text."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "1BACD5D2-04A9-4006-8941-BD5AE81106F5",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "I'm using the system font but applying a design: ",
          "ts": "1654878791.869299",
          "thread_ts": "1654878273.192779",
          "files": [
            {
              "id": "F03JRQ55RP1",
              "created": 1654878788,
              "timestamp": 1654878788,
              "name": "Image from iOS.jpg",
              "title": "Image from iOS",
              "mimetype": "image/jpeg",
              "image_exif_rotation": 0,
              "filetype": "jpg",
              "pretty_type": "JPEG",
              "user": "U03HVF46TEJ",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 81244,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JRQ55RP1/image_from_ios.jpg",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03JRQ55RP1/download/image_from_ios.jpg",
              "original_h": 676,
              "original_w": 2019,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_64.jpg",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_80.jpg",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_160.jpg",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_360.jpg",
              "thumb_360_gif": "",
              "thumb_360_w": 360,
              "thumb_360_h": 121,
              "thumb_480": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_480.jpg",
              "thumb_480_w": 480,
              "thumb_480_h": 161,
              "thumb_720": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_720.jpg",
              "thumb_720_w": 720,
              "thumb_720_h": 241,
              "thumb_960": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_960.jpg",
              "thumb_960_w": 960,
              "thumb_960_h": 321,
              "thumb_1024": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03JRQ55RP1-7095789b3c/image_from_ios_1024.jpg",
              "thumb_1024_w": 1024,
              "thumb_1024_h": 343,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03HVF46TEJ/F03JRQ55RP1/image_from_ios.jpg",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03JRQ55RP1-e03e2842ec",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "mh/cY",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I'm u"
                    },
                    {
                      "type": "text",
                      "text": "sing"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "system"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "font"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "but"
                    },
                    {
                      "type": "text",
                      "text": " applying "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "design:"
                    },
                    {
                      "type": "text",
                      "text": " "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "F81C7572-5D70-4F61-B41A-DC9E9B89B742",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "Here's another example where (I think?) all the text is working fine: ",
          "ts": "1654878868.774259",
          "thread_ts": "1654878273.192779",
          "files": [
            {
              "id": "F03K3FD5SMT",
              "created": 1654878866,
              "timestamp": 1654878866,
              "name": "Image from iOS.jpg",
              "title": "Image from iOS",
              "mimetype": "image/jpeg",
              "image_exif_rotation": 0,
              "filetype": "jpg",
              "pretty_type": "JPEG",
              "user": "U03HVF46TEJ",
              "mode": "hosted",
              "editable": false,
              "is_external": false,
              "external_type": "",
              "size": 29243,
              "url": "",
              "url_download": "",
              "url_private": "https://files.slack.com/files-pri/T01PTBJ95PS-F03K3FD5SMT/image_from_ios.jpg",
              "url_private_download": "https://files.slack.com/files-pri/T01PTBJ95PS-F03K3FD5SMT/download/image_from_ios.jpg",
              "original_h": 394,
              "original_w": 324,
              "thumb_64": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K3FD5SMT-05527ec933/image_from_ios_64.jpg",
              "thumb_80": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K3FD5SMT-05527ec933/image_from_ios_80.jpg",
              "thumb_160": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K3FD5SMT-05527ec933/image_from_ios_160.jpg",
              "thumb_360": "https://files.slack.com/files-tmb/T01PTBJ95PS-F03K3FD5SMT-05527ec933/image_from_ios_360.jpg",
              "thumb_360_gif": "",
              "thumb_360_w": 296,
              "thumb_360_h": 360,
              "thumb_480": "",
              "thumb_480_w": 0,
              "thumb_480_h": 0,
              "thumb_720": "",
              "thumb_720_w": 0,
              "thumb_720_h": 0,
              "thumb_960": "",
              "thumb_960_w": 0,
              "thumb_960_h": 0,
              "thumb_1024": "",
              "thumb_1024_w": 0,
              "thumb_1024_h": 0,
              "permalink": "https://appleevents.enterprise.slack.com/files/U03HVF46TEJ/F03K3FD5SMT/image_from_ios.jpg",
              "permalink_public": "https://slack-files.com/T01PTBJ95PS-F03K3FD5SMT-7d4c1b8556",
              "edit_link": "",
              "preview": "",
              "preview_highlight": "",
              "lines": 0,
              "lines_more": 0,
              "is_public": false,
              "public_url_shared": false,
              "channels": null,
              "groups": null,
              "ims": null,
              "initial_comment": {},
              "comments_count": 0,
              "num_stars": 0,
              "is_starred": false,
              "shares": {
                "public": null,
                "private": null
              }
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "O0hLy",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Here's "
                    },
                    {
                      "type": "text",
                      "text": "another"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "example"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "where"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "("
                    },
                    {
                      "type": "text",
                      "text": "I "
                    },
                    {
                      "type": "text",
                      "text": "think?)"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "all"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "text"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "working"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "fine:"
                    },
                    {
                      "type": "text",
                      "text": " "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "5b10ba05-1a0d-40df-9cba-b02be4a83878",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "indeed that does look correct",
          "ts": "1654878884.677099",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "R/f2t",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "indeed that does look correct"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "931098c3-e514-43c9-a066-02151e8422bb",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "I see. Nothing jumps out to me immediately as being wrong here. I would really appreciate it if you could file a Feedback Report with a sample app which demonstrates this issue. I would love to look into this problem further.",
          "ts": "1654878886.692309",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "7cS",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I see. Nothing jumps out to me immediately as being wrong here. I would really appreciate it if you could file a Feedback Report with a sample app which demonstrates this issue. I would love to look into this problem further."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "8a2df025-baf5-47f9-abe1-207f4971d6a3",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Yes, the second screenshot here looks correct; I also see that it’s using the System Font.",
          "ts": "1654878898.120109",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "gpnd",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yes, the second screenshot here looks correct; I also see that it’s using the System Font."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "5a855f01-b104-4413-b164-cfbeed391de1",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "have you ever been able to reproduce this locally, or are your only reports of this from user(s)?",
          "ts": "1654878912.087239",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "iRIm",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "have you ever been able to reproduce this locally, or are your only reports of this from user(s)?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "72300185-9BE1-49B3-8C7E-4E5F16B80A9F",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "I have not been able to reproduce (second screenshot is mine). I've asked the user to send me the text itself so I can try it. Unfortunately I haven't been able to copy that Arabic text out of the iPhone screenshot.",
          "ts": "1654879034.296739",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "=PXT7",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "have"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "not"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "been"
                    },
                    {
                      "type": "text",
                      "text": " able "
                    },
                    {
                      "type": "text",
                      "text": "to"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "reproduce"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "(second"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "screenshot"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "mine)."
                    },
                    {
                      "type": "text",
                      "text": " I've "
                    },
                    {
                      "type": "text",
                      "text": "asked"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "user"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "to"
                    },
                    {
                      "type": "text",
                      "text": " send "
                    },
                    {
                      "type": "text",
                      "text": "me"
                    },
                    {
                      "type": "text",
                      "text": " the "
                    },
                    {
                      "type": "text",
                      "text": "text"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "itself"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "so"
                    },
                    {
                      "type": "text",
                      "text": " I "
                    },
                    {
                      "type": "text",
                      "text": "can"
                    },
                    {
                      "type": "text",
                      "text": " try "
                    },
                    {
                      "type": "text",
                      "text": "it. "
                    },
                    {
                      "type": "text",
                      "text": "Unfortunately I haven't "
                    },
                    {
                      "type": "text",
                      "text": "been"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "able"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "to"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "copy"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "that"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Arabic"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "text"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "out"
                    },
                    {
                      "type": "text",
                      "text": " of "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " iPhone "
                    },
                    {
                      "type": "text",
                      "text": "screenshot."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "70b9c147-7139-477e-89bd-4cd0426f1aeb",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "To start, I think it would be good to file a feedback with as much of your watch app as you can reasonably include (with build instructions if needed beyond build and run) and these screenshots.",
          "ts": "1654879134.105659",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 2,
              "users": [
                "U03J83G0WQG",
                "U03HVF46TEJ"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "WFLXw",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "To start, I think it would be good to file a feedback with as much of your watch app as you can reasonably include (with build instructions if needed beyond build and run) and these screenshots."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "6c3f6b3d-c9f9-468e-bbff-8bbfba4b48c1",
          "type": "message",
          "user": "U03J83G0WQG",
          "text": "Out of curiosity, was the iPhone screenshot above also from the same user? I happened to notice that one of the UI elements was rendering text using the Urdu font, and it’s possible that that is the clue to when this issue reproduces, i.e. when Urdu is added to the preferred languages list (higher than Arabic, if Arabic is also present).",
          "ts": "1654879232.422329",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "eyes",
              "count": 1,
              "users": [
                "U03J4D7EZNY"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "q9ns",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Out of curiosity, was the iPhone screenshot above also from the same user? I happened to notice that one of the UI elements was rendering text using the Urdu font, and it’s possible that that is the clue to when this issue reproduces, i.e. when Urdu is added to the preferred languages list (higher than Arabic, if Arabic is also present)."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "9053CF1A-DCCC-4744-B589-CFF665C598B7",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "Yes, that iPhone screenshot was from the same user. ",
          "ts": "1654879303.463769",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03J83G0WQG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "xtC8k",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yes,"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "that"
                    },
                    {
                      "type": "text",
                      "text": " iPhone screenshot "
                    },
                    {
                      "type": "text",
                      "text": "was"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "from"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "same"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "user. "
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "CFB4915C-7F27-4EFA-8441-D21B68767221",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "Okay, I'll put together a Feedback with whatever I can get. Thanks!",
          "ts": "1654879512.579199",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03J83G0WQG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "jn1Y",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Okay,"
                    },
                    {
                      "type": "text",
                      "text": " I'll "
                    },
                    {
                      "type": "text",
                      "text": "put"
                    },
                    {
                      "type": "text",
                      "text": " together "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " Feedback "
                    },
                    {
                      "type": "text",
                      "text": "with"
                    },
                    {
                      "type": "text",
                      "text": " whatever I "
                    },
                    {
                      "type": "text",
                      "text": "can"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "get. Thanks!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "c164f02a-2fa7-492d-afe7-0e42393842f7",
          "type": "message",
          "user": "U03J4D7EZNY",
          "text": "Good spot! I was also wondering why the Arabic text was shaped like this on the navigation bar, but it’s actually Urdu!",
          "ts": "1654879551.181399",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "orange_heart",
              "count": 1,
              "users": [
                "U03J83G0WQG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "QlD",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Good spot! I was also wondering why the Arabic text was shaped like this on the navigation bar, but it’s actually Urdu!"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "d014821d-9e2b-4c01-83a0-40feb92a46dd",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "Please do post the feedback number once you have that filed back in this thread. Thanks again!",
          "ts": "1654880219.374769",
          "thread_ts": "1654878273.192779",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "0LKT",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Please do post the feedback number once you have that filed back in this thread. Thanks again!"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03J6B7G2QN\u003e asked\n\u0026gt; How can I right align Arabic text in push notifications efficiently when only the app language is Arabic not the entire device.",
      "ts": "1654879345.740899",
      "thread_ts": "1654879345.740899",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 4,
      "latest_reply": "1654882280.351769",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "tYp5",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03J6B7G2QN"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"How can I right align Arabic text in push notifications efficiently when only the app language is Arabic not the entire device.\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "4530b940-536d-4be9-a92c-4118fa68e7ad",
          "type": "message",
          "user": "U03HBMCRX0E",
          "text": "Thanks for raising this use case.  Can you please describe your use case in a bit more detail in a Feedback report, sharing the number here?  We’ll follow up there.",
          "ts": "1654879409.204369",
          "thread_ts": "1654879345.740899",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "WNC=g",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Thanks for raising this use case.  Can you please describe your use case in a bit more detail in a Feedback report, sharing the number here?  We’ll follow up there."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "126d5508-dd1e-44a4-b642-5292f1037c49",
          "type": "message",
          "user": "U03J6B7G2QN",
          "text": "I am working on an application which has two languages English and Arabic, now users can change the app language whenever they want. So ideally if the app language is English the text displayed in push notifications is left aligned as it should be, but when the app language is Arabic the text should be right aligned but it's not. Even when the app is in Arabic the text in push notifications is left aligned. While the rest of the app is completely right aligned.",
          "ts": "1654879767.984879",
          "thread_ts": "1654879345.740899",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "c0/Mo",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I am working on an application which has two languages English and Arabic, now users can change the app language whenever they want. So ideally if the app language is English the text displayed in push notifications is left aligned as it should be, but when the app language is Arabic the text should be right aligned but it's not. Even when the app is in Arabic the text in push notifications is left aligned. While the rest of the app is completely right aligned."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "2e18e94b-243b-4c5a-a3f8-6f1cf79ef739",
          "type": "message",
          "user": "U03HBMCRX0E",
          "text": "Thanks \u003c@U03J6B7G2QN\u003e, that is a great description.  If you don’t mind reporting that via the Feedback tool, it makes it easier for us to track a solution internally, and follow up with you beyond the Digital Lounge.",
          "ts": "1654880122.798409",
          "thread_ts": "1654879345.740899",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "DnNXn",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Thanks "
                    },
                    {
                      "type": "user",
                      "user_id": "U03J6B7G2QN"
                    },
                    {
                      "type": "text",
                      "text": ", that is a great description.  If you don’t mind reporting that via the Feedback tool, it makes it easier for us to track a solution internally, and follow up with you beyond the Digital Lounge."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "3ff52c44-8899-4626-bb20-4670506775a5",
          "type": "message",
          "user": "U03J6B7G2QN",
          "text": "Here FB10161536",
          "ts": "1654882280.351769",
          "thread_ts": "1654879345.740899",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HBMCRX0E"
              ]
            },
            {
              "name": "gratitude-thank-you",
              "count": 1,
              "users": [
                "U03HLM4HSAG"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Rsi",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Here FB10161536"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03HVCK66P8\u003e asked\n\u0026gt; Hi. Is the generated xcloc file will fetch all strings update in every export?",
      "ts": "1654880013.411839",
      "thread_ts": "1654880013.411839",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 4,
      "latest_reply": "1654880189.723229",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "62QME",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03HVCK66P8"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Hi. Is the generated xcloc file will fetch all strings update in every export?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "2168f51d-558f-4eb7-b528-6f655440d129",
          "type": "message",
          "user": "U03HBMCRX0E",
          "text": "Yes, running Export Localizations will re-process your source code to extract any newly added, removed, or changed strings and include them in the exported localization catalog. It will also include the existing translations when exporting for languages other than English.",
          "ts": "1654880037.465859",
          "thread_ts": "1654880013.411839",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03HVCK66P8"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "s40I",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Yes, running Export Localizations will re-process your source code to extract any newly added, removed, or changed strings and include them in the exported localization catalog. It will also include the existing translations when exporting for languages other than English."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "d80e10cd-5957-4c7c-afb4-21d3dc8bbfbe",
          "type": "message",
          "user": "U03HVCK66P8",
          "text": "That’s Weird. Becoz I found it only works at the 1st time. Then all xcloc will follow the version of the 1st import…\n\n\u003chttps://wwdc22.slack.com/archives/C03H786M2V8/p1654879512571169?thread_ts=1654804988.358809\u0026amp;cid=C03H786M2V8\u003e",
          "ts": "1654880140.203909",
          "thread_ts": "1654880013.411839",
          "edited": {
            "user": "U03HVCK66P8",
            "ts": "1654880159.000000"
          },
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Nk42J",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "That’s Weird. Becoz I found it only works at the 1st time. Then all xcloc will follow the version of the 1st import…\n\n"
                    },
                    {
                      "type": "link",
                      "url": "https://wwdc22.slack.com/archives/C03H786M2V8/p1654879512571169?thread_ts=1654804988.358809\u0026cid=C03H786M2V8",
                      "text": ""
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "62fa654f-06aa-4c0c-8523-bcdb4f066710",
          "type": "message",
          "user": "U03HBMCRX0E",
          "text": "I can follow up in your other thread",
          "ts": "1654880183.426399",
          "thread_ts": "1654880013.411839",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "CtrSJ",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I can follow up in your other thread"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "e35ea540-6b86-4165-a528-1f0c2a6973a1",
          "type": "message",
          "user": "U03HVCK66P8",
          "text": "ok thx",
          "ts": "1654880189.723229",
          "thread_ts": "1654880013.411839",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "td2K",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "ok thx"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03HVF46TEJ\u003e asked\n\u0026gt; So if I have a SwiftUI or UIKit notes app that’s not localized in any RTL languages but a user enters RTL text, am I correct that the expected behavior is that the text itself will appear RTL but will be left-aligned? Is there an easy way to get this to appear right-aligned, or would I have to analyze the language myself? Or is this undesirable behavior in an otherwise left-aligned app?",
      "ts": "1654880260.012099",
      "thread_ts": "1654880260.012099",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 3,
      "latest_reply": "1654880395.431399",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "pADs",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03HVF46TEJ"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"So if I have a SwiftUI or UIKit notes app that\\u2019s not localized in any RTL languages but a user enters RTL text, am I correct that the expected behavior is that the text itself will appear RTL but will be left-aligned? Is there an easy way to get this to appear right-aligned, or would I have to analyze the language myself? Or is this undesirable behavior in an otherwise left-aligned app?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "565bd127-33b7-4e2b-9fc9-e351f569368f",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "On iOS, when a user enters text into a text field or text view, the alignment follows the default alignment of the keyboard, and you should not need to do anything extra on top of this.",
          "ts": "1654880298.732899",
          "thread_ts": "1654880260.012099",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "hZgU",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "On iOS, when a user enters text into a text field or text view, the alignment follows the default alignment of the keyboard, and you should not need to do anything extra on top of this."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "940fa405-5697-4c7e-94ce-674f5b3603b6",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "If that text is _then_ displayed in a UILabel, for example, the alignment would be based on the UI language, rather than the content of the label itself. If you have a use case for something more automatic, please do file a feedback describing it in more detail.",
          "ts": "1654880346.679759",
          "thread_ts": "1654880260.012099",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Ml96",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "If that text is "
                    },
                    {
                      "type": "text",
                      "text": "then",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " displayed in a UILabel, for example, the alignment would be based on the UI language, rather than the content of the label itself. If you have a use case for something more automatic, please do file a feedback describing it in more detail."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "B15D0FD1-79C4-4C09-8E11-EE32A9299CF5",
          "type": "message",
          "user": "U03HVF46TEJ",
          "text": "Okay thanks ",
          "ts": "1654880395.431399",
          "thread_ts": "1654880260.012099",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "x7F96",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Okay thanks "
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "75056c00-2933-4c8b-8c93-2959db6b5f9c",
      "type": "message",
      "user": "U03HJ9NLS1H",
      "text": ":eyes: I'm curious: how many of you have *already localized an app in an RTL language*?\n• For those of you *who have*, react with a :man-raising-hand:, and share with us – was it challenging? Or did underlying frameworks do the heavy lifting for you? Any stories to tell?\n• For those of you *who haven't yet*, react with a :man-gesturing-no: !",
      "ts": "1654880427.621669",
      "thread_ts": "1654880427.621669",
      "reply_count": 6,
      "latest_reply": "1654882678.192599",
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "man-raising-hand",
          "count": 8,
          "users": [
            "U03HJ9NLS1H",
            "U03HVE7BD1U",
            "U03HVC6M81L",
            "U03HBMCRX0E",
            "U03J6B7G2QN",
            "U03J4D7EZNY",
            "U03HJ9NFC9Z",
            "U03JDTLSGLU"
          ]
        },
        {
          "name": "man-gesturing-no",
          "count": 11,
          "users": [
            "U03HJ9NLS1H",
            "U03KA0FE82D",
            "U03JG82PB0R",
            "U03HVF46TEJ",
            "U03JER2C7MX",
            "U03JCRFMPHV",
            "U03JDTAPX0C",
            "U03JRR4R3CY",
            "U03JRQTC63S",
            "U03J1TN6WBD",
            "U03JN2004TY"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "+yd3",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "emoji",
                  "name": "eyes",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " I'm curious: how many of you have "
                },
                {
                  "type": "text",
                  "text": "already localized an app in an RTL language",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": "?\n"
                }
              ]
            },
            {
              "Type": "rich_text_list",
              "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"For those of you \"},{\"type\":\"text\",\"text\":\"who have\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\", react with a \"},{\"type\":\"emoji\",\"name\":\"man-raising-hand\"},{\"type\":\"text\",\"text\":\", and share with us \\u2013 was it challenging? Or did underlying frameworks do the heavy lifting for you? Any stories to tell?\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"For those of you \"},{\"type\":\"text\",\"text\":\"who haven't yet\",\"style\":{\"bold\":true}},{\"type\":\"text\",\"text\":\", react with a \"},{\"type\":\"emoji\",\"name\":\"man-gesturing-no\"},{\"type\":\"text\",\"text\":\" !\"}]}],\"style\":\"bullet\",\"indent\":0,\"border\":0}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "34AD046A-3EC4-4CCB-9584-B29F13F6B7B1",
          "type": "message",
          "user": "U03HVE7BD1U",
          "text": "It was surprisingly easy. Much easier than with a website. The only thing you really always have to remember is also switching the directions of all directional icons :smile:",
          "ts": "1654880736.986779",
          "thread_ts": "1654880427.621669",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "HUE",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "was"
                    },
                    {
                      "type": "text",
                      "text": " surprisingly "
                    },
                    {
                      "type": "text",
                      "text": "easy."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Much"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "easier"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "than"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "with"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "a"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "website."
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "The"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "only"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "thing"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "you"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "really"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "always"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "have"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "to"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "remember"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "also"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "switching"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "directions"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "of"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "all"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "directional"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "icons"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "emoji",
                      "name": "smile",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "45d49aab-f743-4ebf-a8c2-5230de6b95b6",
          "type": "message",
          "user": "U03HVC6M81L",
          "text": "It wasn’t too bad… there are some tricks you learn along the way to make life easier… like how you break up your strings (mine was for some Swift Playground Book projects). And it was also important to conditionalize pieces of the UI like menus and action buttons (it was a SpriteKit-based project) to swap directions to fit better in RTL localizations.",
          "ts": "1654880949.788969",
          "thread_ts": "1654880427.621669",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "W0wH",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "It wasn’t too bad… there are some tricks you learn along the way to make life easier… like how you break up your strings (mine was for some Swift Playground Book projects). And it was also important to conditionalize pieces of the UI like menus and action buttons (it was a SpriteKit-based project) to swap directions to fit better in RTL localizations."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "129520b8-e7a4-45db-8bfe-67e49dab1603",
          "type": "message",
          "user": "U03J9D6803X",
          "text": "I haven't localized any RTL apps with Apple technologies, but I have with some other languages.  I'd caution developers to check for possible bugs with character counts and offsets when localizing for languages with diacritics, especially for characters that can have multiple diacritics.",
          "ts": "1654881306.688169",
          "thread_ts": "1654880427.621669",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "bulb",
              "count": 1,
              "users": [
                "U03HJ9NLS1H"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "08v",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I haven't localized any RTL apps with Apple technologies, but I have with some other languages.  I'd caution developers to check for possible bugs with character counts and offsets when localizing for languages with diacritics, especially for characters that can have multiple diacritics."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "ab887eb9-9751-497f-9fdc-4f8878648868",
          "type": "message",
          "user": "U03J6B7G2QN",
          "text": "The challenge in my case was when users switched languages the RTL would always mess up at some screens and it would only recover or work perfectly when the app got restarted. I still haven't figured why it happens.",
          "ts": "1654881698.571709",
          "thread_ts": "1654880427.621669",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "=kC",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "The challenge in my case was when users switched languages the RTL would always mess up at some screens and it would only recover or work perfectly when the app got restarted. I still haven't figured why it happens."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "e5acc286-c688-45e9-b7f2-0f4a268b86e0",
          "type": "message",
          "user": "U03J4D7EZNY",
          "text": "Did it several years ago, way before SwiftUI and even way before Swift existed at all. At it was already very straightforward.",
          "ts": "1654882532.928109",
          "thread_ts": "1654880427.621669",
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Fd5",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Did it several years ago, way before SwiftUI and even way before Swift existed at all. At it was already very straightforward."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "3198452b-44cd-4b3c-9200-e5d1981bca23",
          "type": "message",
          "user": "U03J4D7EZNY",
          "text": "Main challenge was that my some elements in my UI were always displayed in two scripts (Arabic on the right and Latin on the left), while others were localised and therefore were RTL if language was Arabic and LTR if it was English or French.\n\nBut the distinction made in UIKit between right/left and leading/trailing made this a breeze.",
          "ts": "1654882678.192599",
          "thread_ts": "1654880427.621669",
          "edited": {
            "user": "U03J4D7EZNY",
            "ts": "1654882721.000000"
          },
          "parent_user_id": "U03HJ9NLS1H",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "7s+",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Main challenge was that my some elements in my UI were always displayed in two scripts (Arabic on the right and Latin on the left), while others were localised and therefore were RTL if language was Arabic and LTR if it was English or French.\n\nBut the distinction made in UIKit between right/left and leading/trailing made this a breeze."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JBLYMHSS\u003e asked\n\u0026gt; Hello Devs,\n\u0026gt; \n\u0026gt; We have localization Strings being delivered by\n\u0026gt; Middle ware and get updated and stored in\n\u0026gt; Application Directory on each app launch.\n\u0026gt; Where we used to load them using\n\u0026gt; ‘Localizable. nocache’ as mentioned on\n\u0026gt; Apple Docs. However this slow down the Ul\n\u0026gt; performance way too much. As it seems it\n\u0026gt; would load whole strings map for each call to\n\u0026gt; NSLocalizationString. Can you suggest a work\n\u0026gt; around?\n\u0026gt; \n\u0026gt; Thanks\n\u0026gt; Fahied",
      "ts": "1654880936.052819",
      "thread_ts": "1654880936.052819",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 8,
      "latest_reply": "1654884038.741629",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "EoFdh",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JBLYMHSS"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Hello Devs,\\n\\nWe have localization Strings being delivered by\\nMiddle ware and get updated and stored in\\nApplication Directory on each app launch.\\nWhere we used to load them using\\n\\u2018Localizable. nocache\\u2019 as mentioned on\\nApple Docs. However this slow down the Ul\\nperformance way too much. As it seems it\\nwould load whole strings map for each call to\\nNSLocalizationString. Can you suggest a work\\naround?\\n\\nThanks\\nFahied\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "148d90a8-2f2b-4611-b87c-b129ebdafadf",
          "type": "message",
          "user": "U03HBMCRX0E",
          "text": "Hi Muhammad!\n\n`.nocache` should only need to be used if:\n• the strings table has already been loaded during your app processes lifetime,\n• the table is known to have been updated based on some other signal\nUse of `.nocache` is expected to have some performance overhead so some techniques to reduce are :\n• Use it as sparingly as necessary (ie is it really user critical to get non-cached strings)\n• Consider re-organizing the strings tables into smaller tables that map to user activities so that unnecessary strings aren’t being loaded into memory\n",
          "ts": "1654880990.850769",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JBLYMHSS"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "qnD",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi Muhammad!\n\n"
                    },
                    {
                      "type": "text",
                      "text": ".nocache",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " should only need to be used if:\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"the strings table has already been loaded during your app processes lifetime,\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"the table is known to have been updated based on some other signal\"}]}],\"style\":\"bullet\",\"indent\":0,\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "\nUse of "
                    },
                    {
                      "type": "text",
                      "text": ".nocache",
                      "style": {
                        "code": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " is expected to have some performance overhead so some techniques to reduce are :\n"
                    }
                  ]
                },
                {
                  "Type": "rich_text_list",
                  "Raw": "{\"type\":\"rich_text_list\",\"elements\":[{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Use it as sparingly as necessary (ie is it really user critical to get non-cached strings)\"}]},{\"type\":\"rich_text_section\",\"elements\":[{\"type\":\"text\",\"text\":\"Consider re-organizing the strings tables into smaller tables that map to user activities so that unnecessary strings aren\\u2019t being loaded into memory\"}]}],\"style\":\"bullet\",\"indent\":0,\"border\":0}"
                },
                {
                  "type": "rich_text_section",
                  "elements": []
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "0120730f-6a34-4a68-bd97-6d361d9e23f5",
          "type": "message",
          "user": "U03HJ9P9VV1",
          "text": "Hi Muhammad, can you also file a feedback report about your specific use case so we can look into enhancement in this area too?",
          "ts": "1654881892.560099",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "+1",
              "count": 1,
              "users": [
                "U03JBLYMHSS"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "LIYX",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Hi Muhammad, can you also file a feedback report about your specific use case so we can look into enhancement in this area too?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "501FFD34-48DF-45FF-8D98-ACD7555ADD63",
          "type": "message",
          "user": "U03JBLYMHSS",
          "text": "Sounds great, I ll do that.\n\nThe problem is really If I load Strings without .nocache, It will not load the updated strings even though the same source files .strings is overriden or even you force load main bundle again.",
          "ts": "1654882133.930349",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "Pbbq",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Sounds "
                    },
                    {
                      "type": "text",
                      "text": "great,"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "ll"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "do"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "that."
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "\n"
                    },
                    {
                      "type": "text",
                      "text": "The"
                    },
                    {
                      "type": "text",
                      "text": " problem "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " really "
                    },
                    {
                      "type": "text",
                      "text": "If"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "I"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "load"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "Strings"
                    },
                    {
                      "type": "text",
                      "text": " without "
                    },
                    {
                      "type": "text",
                      "text": ".nocache,"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "It"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "will"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "not"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "load"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " update"
                    },
                    {
                      "type": "text",
                      "text": "d"
                    },
                    {
                      "type": "text",
                      "text": " string"
                    },
                    {
                      "type": "text",
                      "text": "s"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "even"
                    },
                    {
                      "type": "text",
                      "text": " though "
                    },
                    {
                      "type": "text",
                      "text": "the"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "same"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "source"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "files"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": ".strings"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "is"
                    },
                    {
                      "type": "text",
                      "text": " override"
                    },
                    {
                      "type": "text",
                      "text": "n"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "or"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "even"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "you"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "force"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "load"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "main"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "bundle"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "again."
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "86eea9a1-5b32-44cc-9215-2df56a09aae2",
          "type": "message",
          "user": "U03HJ9P9VV1",
          "text": "That's right. The strings files are cached by bundle when bundle is created. Since there's no way to really \"unload\" a bundle, the cached resources remained cached",
          "ts": "1654883095.275389",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "/2mBu",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "That's right. The strings files are cached by bundle when bundle is created. Since there's no way to really \"unload\" a bundle, the cached resources remained cached"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "e57a5da5-c907-4497-937c-c0a46195239a",
          "type": "message",
          "user": "U03HJ9P9VV1",
          "text": "Depending on the scope of your project, you can consider having a separate XPC service to load the strings, and kill and relaunch the service when you get a notification when the strings are updated, if such feedback is available via your middle ware",
          "ts": "1654883215.787889",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "5mvNT",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Depending on the scope of your project, you can consider having a separate XPC service to load the strings, and kill and relaunch the service when you get a notification when the strings are updated, if such feedback is available via your middle ware"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "4359C4D5-54B6-4D9C-95FD-C0A0B1E8A0AB",
          "type": "message",
          "user": "U03JBLYMHSS",
          "text": "Would there be any possibility for iOS in term of XPC service?",
          "ts": "1654883432.801289",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "mfb",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Would "
                    },
                    {
                      "type": "text",
                      "text": "there"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "be"
                    },
                    {
                      "type": "text",
                      "text": " any possibility "
                    },
                    {
                      "type": "text",
                      "text": "for"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "iOS"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "in"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "term"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "of"
                    },
                    {
                      "type": "text",
                      "text": " "
                    },
                    {
                      "type": "text",
                      "text": "XPC"
                    },
                    {
                      "type": "text",
                      "text": " service"
                    },
                    {
                      "type": "text",
                      "text": "?"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "72f7a4d7-dd86-4d47-9c75-589ac01e9964",
          "type": "message",
          "user": "U03HJ9P9VV1",
          "text": "Ah.. sorry I didn't ask about your environment first. Unfortunately I don't think so",
          "ts": "1654883969.213159",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "wink",
              "count": 1,
              "users": [
                "U03JBLYMHSS"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "vUu",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Ah.. sorry I didn't ask about your environment first. Unfortunately I don't think so"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "client_msg_id": "ffa0d74a-198f-4463-b9d1-0fd17a846202",
          "type": "message",
          "user": "U03JBLYMHSS",
          "text": "I thought may be you guys holding on to something :smile:",
          "ts": "1654884038.741629",
          "thread_ts": "1654880936.052819",
          "team": "T031SG5MZ7U",
          "reactions": [
            {
              "name": "smiling_face_with_tear",
              "count": 1,
              "users": [
                "U03HJ9P9VV1"
              ]
            }
          ],
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "y4QlY",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "I thought may be you guys holding on to something "
                    },
                    {
                      "type": "emoji",
                      "name": "smile",
                      "skin_tone": 0
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "client_msg_id": "37191a15-5372-4703-84d8-12f060bf1966",
      "type": "message",
      "user": "U03HJ9NLS1H",
      "text": "And *it's a wrap*! Thanks everyone for sharing your questions, problems, and insights with us :raised_hands: We're now going to go ahead and close this lounge. A phenomenal thank you to all the Apple engineers who contributed to this lounge!\n\nIf you have more questions about Localization and Internationalization, please join us on the *\u003chttps://developer.apple.com/forums/|developer forums\u003e*, which we monitor all year long, or send us any issues in the form of *\u003chttps://feedbackassistant.apple.com/|feedbacks\u003e*. Have a wonderful day!",
      "ts": "1654884257.312029",
      "pinned_to": [
        "C03H786M2V8"
      ],
      "team": "T031SG5MZ7U",
      "reactions": [
        {
          "name": "gratitude-merci",
          "count": 13,
          "users": [
            "U03HBMCRX0E",
            "U03HJ9NLS1H",
            "U03J8B88VE1",
            "U03J83G0WQG",
            "U03KA0FE82D",
            "U03JFN63EJ3",
            "U03JRP87THN",
            "U03K6BTQCEL",
            "U03K337E8GJ",
            "U03JERVQBFX",
            "U03JBAX2H36",
            "U03JBL54J12",
            "U03JNTKEZ3R"
          ]
        },
        {
          "name": "gratitude-danke",
          "count": 9,
          "users": [
            "U03HBMCRX0E",
            "U03J21P47PU",
            "U03J83G5TT2",
            "U03J200TFL3",
            "U03J83G0WQG",
            "U03HVE7BD1U",
            "U03JRP87THN",
            "U03K6BTQCEL",
            "U03JERVQBFX"
          ]
        },
        {
          "name": "gratitude-xiexie",
          "count": 5,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JERVQBFX",
            "U03HMCMHXGF"
          ]
        },
        {
          "name": "gratitude-grazie",
          "count": 5,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JERVQBFX",
            "U03JEFFP47N"
          ]
        },
        {
          "name": "gratitude-spasibo",
          "count": 5,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JERVQBFX",
            "U03JRNQ7KB2"
          ]
        },
        {
          "name": "gratitude-gracias",
          "count": 9,
          "users": [
            "U03HBMCRX0E",
            "U03J83FDB40",
            "U03J3E3KTFH",
            "U03J83G0WQG",
            "U03KRRHQN2U",
            "U03JRP87THN",
            "U03JERVQBFX",
            "U03J4C1RWMA",
            "U03JBL54J12"
          ]
        },
        {
          "name": "gratitude-xiexieni",
          "count": 4,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JERVQBFX"
          ]
        },
        {
          "name": "gratitude-obrigado",
          "count": 7,
          "users": [
            "U03HBMCRX0E",
            "U03J4CXHVNY",
            "U03J8B88VE1",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JERVQBFX",
            "U03J4C1RWMA"
          ]
        },
        {
          "name": "gratitude-obrigada",
          "count": 4,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JERVQBFX"
          ]
        },
        {
          "name": "gratitude-thank-you",
          "count": 10,
          "users": [
            "U03HBMCRX0E",
            "U03HZ3N1QFP",
            "U03JRPWSDJ4",
            "U03J4BZ7E9J",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03JJQ3BMB7",
            "U03JERVQBFX",
            "U03JBL54J12",
            "U03JELDBMT3"
          ]
        },
        {
          "name": "gratitude-arigatou-gozaimasu",
          "count": 4,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN",
            "U03HXAWRV0F"
          ]
        },
        {
          "name": "gratitude-gamsahamnida",
          "count": 3,
          "users": [
            "U03HBMCRX0E",
            "U03J83G0WQG",
            "U03JRP87THN"
          ]
        },
        {
          "name": "+1",
          "count": 3,
          "users": [
            "U03HRN6A39D",
            "U03JRP87THN",
            "U03JXAU7EG6"
          ]
        },
        {
          "name": "tada",
          "count": 3,
          "users": [
            "U03JG9VGEEA",
            "U03JRP87THN",
            "U03JR6S2NRJ"
          ]
        },
        {
          "name": "the_horns",
          "count": 1,
          "users": [
            "U03JR6S2NRJ"
          ]
        },
        {
          "name": "+1::skin-tone-2",
          "count": 1,
          "users": [
            "U03JEM8GN2D"
          ]
        }
      ],
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "U83o",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "text",
                  "text": "And "
                },
                {
                  "type": "text",
                  "text": "it's a wrap",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": "! Thanks everyone for sharing your questions, problems, and insights with us "
                },
                {
                  "type": "emoji",
                  "name": "raised_hands",
                  "skin_tone": 0
                },
                {
                  "type": "text",
                  "text": " We're now going to go ahead and close this lounge. A phenomenal thank you to all the Apple engineers who contributed to this lounge!\n\nIf you have more questions about Localization and Internationalization, please join us on the "
                },
                {
                  "type": "link",
                  "url": "https://developer.apple.com/forums/",
                  "text": "developer forums",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": ", which we monitor all year long, or send us any issues in the form of "
                },
                {
                  "type": "link",
                  "url": "https://feedbackassistant.apple.com/",
                  "text": "feedbacks",
                  "style": {
                    "bold": true
                  }
                },
                {
                  "type": "text",
                  "text": ". Have a wonderful day!"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "message",
      "text": "\u003c@U03JQ7PU1L1\u003e asked\n\u0026gt; Not sure it's a bug bug if my development lanugage is english but if I don't add English in my Localization it going to display other language. The work around I did now is add empty english localization file for each file?",
      "ts": "1654895377.583549",
      "thread_ts": "1654895377.583549",
      "subtype": "bot_message",
      "bot_id": "B03HELVPZB5",
      "username": "Localization and Internationalization - Ask a Question",
      "reply_count": 1,
      "latest_reply": "1654895472.058309",
      "replace_original": false,
      "delete_original": false,
      "blocks": [
        {
          "type": "rich_text",
          "block_id": "ZRJ",
          "elements": [
            {
              "type": "rich_text_section",
              "elements": [
                {
                  "type": "user",
                  "user_id": "U03JQ7PU1L1"
                },
                {
                  "type": "text",
                  "text": " asked\n"
                }
              ]
            },
            {
              "Type": "rich_text_quote",
              "Raw": "{\"type\":\"rich_text_quote\",\"elements\":[{\"type\":\"text\",\"text\":\"Not sure it's a bug bug if my development lanugage is english but if I don't add English in my Localization it going to display other language. The work around I did now is add empty english localization file for each file?\"}]}"
            }
          ]
        }
      ],
      "slackdump_thread_replies": [
        {
          "client_msg_id": "4ce73e64-9a7e-4497-9b60-aa93678e8bda",
          "type": "message",
          "user": "U03HW7PE3SM",
          "text": "Can you clarify your project setup? In general, your development localization _should_ be one of your app localizations. Prior to iOS 16/macOS Ventura, it was required that your app bundle also contain a corresponding lproj folder for the development language, but you should not need any empty files.",
          "ts": "1654895472.058309",
          "thread_ts": "1654895377.583549",
          "team": "T031SG5MZ7U",
          "replace_original": false,
          "delete_original": false,
          "blocks": [
            {
              "type": "rich_text",
              "block_id": "6W8",
              "elements": [
                {
                  "type": "rich_text_section",
                  "elements": [
                    {
                      "type": "text",
                      "text": "Can you clarify your project setup? In general, your development localization "
                    },
                    {
                      "type": "text",
                      "text": "should",
                      "style": {
                        "italic": true
                      }
                    },
                    {
                      "type": "text",
                      "text": " be one of your app localizations. Prior to iOS 16/macOS Ventura, it was required that your app bundle also contain a corresponding lproj folder for the development language, but you should not need any empty files."
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ],
  "channel_id": "C03H786M2V8"
}
