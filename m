From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] 0-length PSDU reporting
Date: Mon, 09 Jul 2018 10:30:42 +0200
Message-ID: <1531125042.3298.5.camel@sipsolutions.net>
References: <1529332670.3490.50.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1529332670.3490.50.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

So, since there were no comments - here's a proper RFA.

I'll be on vacation and then bonding leave soon, but should hopefully
manage to see this through.

(fixed title PPDU -> PSDU)


---
title: 0-length-PSDU
categories: [suggested]
---
Bit Number
: 26

Structure
  - u8 type

Required Alignment
: None

Unit(s)
: none

The presence of this field indicates that there was no PSDU in or
captured for this PPDU, only the PHY data is valid and the radiotap
header is not followed by an 802.11 header.

The type field indicates the type of PPDU.

| **type value** | **meaning** |
| 0              | sounding PPDU |
| 1              | data not captured (e.g. multi-user PPDU) |
| 0xff           | vendor-specific |
