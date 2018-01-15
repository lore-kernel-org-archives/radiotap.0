From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: A-MPDU status extension to include EOF bit
Date: Mon, 15 Jan 2018 14:40:12 +0100
Message-ID: <1516023612.410.35.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

In the upcoming HE, there's a need to capture the EOF bit.

Thus, I'm proposing the following addition:


 | **0x0010** | delimiter CRC error |
 | **0x0020** | delimiter CRC value known: the delimiter CRC value field is valid |
-| **0xffc0** | reserved |
+| **0x0040** | EOF value |
+| **0x0080** | EOF value known |
+| **0xff00** | reserved |

I can't really generate this right now, but once I can I'll come back
with patches.

Does this seem reasonable?

johannes
