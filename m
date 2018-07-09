From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] L-SIG field
Date: Mon, 09 Jul 2018 10:31:09 +0200
Message-ID: <1531125069.3298.6.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

---
title: L-SIG
categories: [suggested]
---
Bit Number
: 27

Structure
  - u16 data1, data2

Required Alignment
: 2

Unit(s)
: none

This field indicates - if known - the contents of the L-SIG.

## data1

| **`0x0001`** | rate known |
| **`0x0002`** | length known |
| **`0xfffc`** | (reserved) |

## data2

| **`0x000f`** | rate |
| **`0xfff0`** | length |
