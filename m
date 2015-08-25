From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] capture file timestamping
Date: Tue, 25 Aug 2015 18:46:08 +0200
Message-ID: <1440521168.2192.50.camel@sipsolutions.net>
References: <1440497229.2192.28.camel@sipsolutions.net>
	 <20150825162841.GR6823@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20150825162841.GR6823-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2015-08-25 at 11:28 -0500, David Young wrote:

> > This is great, but not always feasible. Particularly when operating
> > within multiple virtual interfaces and trying to record data from 
> > the
> > hardware at the same time, the TSFT is either unobtainable or
> > practically useless.
> 
> Can you explain why it is unobtainable or practically useless?

If you have two stations, for example, you need to have synchronisation
with the two different APs, so you can have two vastly different TSF
values. Maybe your device gives those to you, or maybe not. It may make
sense for some analysis to look at that, but if you need to look at
timing inside the device to be evident then this is useless.

> > Similarly, in actual monitor mode, there might not be a TSF timer -
> > just a base hardware timer that is essentially free-running (though
> > with the same frequency.)
> 
> I agree that it's not quite right to call it TSF time when there is 
> not actually any synchronization of stations.

It's not really a major defect though.

> > As Simon also found, the reference might not be the "first bit of the
> > MPDU" (which I'd also say is actually somewhat vague with OFDM
> > symbols), but something else entirely.
> 
> Hmm.  What's the reference for beacons and probe responses?

First symbol containing the first bit of the timestamp field, I
believe. Haven't double-checked now.

> Is it fair to say that you are generally concerned that not all hardware
> can stamp received frames with something like a TSF time, but some
> hardware can stamp frames with a time that is the "moral equivalent" for
> certain purposes?

Yeah, you could put it that way.

> What are the use cases for the timestamps?  My use cases were these:
> 
> I. Measuring nanosecond intervals between several consecutive frames

I don't think I have ever seen nanoseconds, and we don't currently
allow that resolution. However, it's a good point - any new field
should probably take resolution into account.

>         A. Using the measurements to verify settings of device registers

This could be done I guess.

>         B. Deriving from several intervals the meters distance
>            between two 802.11 stations

Possible, but I'm not sure it's all that feasible.

> II. Using the timestamps to place graphic representations of frames
>     on a timeline

This is one.

One I ran into recently is that I needed to check the relative timings
of packets to verify the backoff function was working correctly, which
is really just very similar to your I-A case.

> I can certainly imagine someone using hardware timestamps to put frames
> back into the order they were received if the order was scrambled by,
> for example, a multiprocessing network stack.

The timestamps added by the capture (e.g. tcpdump) are also notoriously
unreliable since there are processing delays - even without reordering.

I was trying to be a bit more generic, but in my case it mostly boils
down to this:
 a) the timestamps recorded by (e.g.) tcpdump in the pcap packet
    headers are unreliable
 b) the timestamps there are at the end of the frame,
    beginning is much more useful
 c) the timer I'm getting is an internal hardware timer and I can't
    easily derive either a TSF-based value, nor easily put it at the
    first bit/symbol of the MPDU (since it's earlier) [*]

johannes

[*] it's actually also somewhat unreliable, due to the reference it's
taken at, but that's something I can generally live with, it's in the
order of a few microseconds, not the milliseconds I sometimes see with
tcpdump
