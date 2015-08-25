From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFC] capture file timestamping
Date: Tue, 25 Aug 2015 12:07:09 +0200
Message-ID: <1440497229.2192.28.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi all,

[Simon brought up a related topic a few years ago]

We have a field for TSFT/mactime, which is defined as follows:

    Value in microseconds of the MAC's 64-bit 802.11 Time
    Synchronization Function timer when the first bit of the MPDU
    arrived at the MAC. For received frames only.

This is great, but not always feasible. Particularly when operating
within multiple virtual interfaces and trying to record data from the
hardware at the same time, the TSFT is either unobtainable or
practically useless.

Similarly, in actual monitor mode, there might not be a TSF timer -
just a base hardware timer that is essentially free-running (though
with the same frequency.)

As Simon also found, the reference might not be the "first bit of the
MPDU" (which I'd also say is actually somewhat vague with OFDM
symbols), but something else entirely.

There's also something that I'm not sure about - in 5/10 MHz channels,
as I understand this is often achieved by running hardware timers at
different frequencies - does that affect the timestamps hardware
reports here?

I'm not sure we'll be able to capture everything in a single value, but
we could add a field that has a "type" that can be extended in the
future.

Say, for example, we add a new field like this:

Structure: u64 timestamp, u32 flags
Alignment: 8

We'd probably need flags for
 * TSF timer
 * first bit/symbol of MPDU
(these two allow reproducing the existing TSFT field functionality,
which might not be necessary, but each could still be useful)
 * 32-bit only [our hardware only has an internal 32-bit timestamp]
 * end-of-frame [maybe define this better?]

We could also go into the various other places of the frame where a
timestamp can be taken - our hardware does it when it detects energy on
the air.

The most common use for this would really be looking at monitor files,
so for me personally simply having a more generic "timestamp" field
that doesn't specify much of its semantics would be sufficient -
however, I believe that to be very dangerous as somebody's semantics
will eventually get hard-coded into wireshark and then it's fixed
anyway ...

Anyone want to offer any thoughts?

johannes
