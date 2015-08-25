From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] capture file timestamping
Date: Tue, 25 Aug 2015 11:28:42 -0500
Message-ID: <20150825162841.GR6823@pobox.com>
References: <1440497229.2192.28.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440497229.2192.28.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Aug 25, 2015 at 12:07:09PM +0200, Johannes Berg wrote:
> Hi all,
> 
> [Simon brought up a related topic a few years ago]
> 
> We have a field for TSFT/mactime, which is defined as follows:
> 
>     Value in microseconds of the MAC's 64-bit 802.11 Time
>     Synchronization Function timer when the first bit of the MPDU
>     arrived at the MAC. For received frames only.
> 
> This is great, but not always feasible. Particularly when operating
> within multiple virtual interfaces and trying to record data from the
> hardware at the same time, the TSFT is either unobtainable or
> practically useless.

Can you explain why it is unobtainable or practically useless?

> Similarly, in actual monitor mode, there might not be a TSF timer -
> just a base hardware timer that is essentially free-running (though
> with the same frequency.)

I agree that it's not quite right to call it TSF time when there is not
actually any synchronization of stations.

> As Simon also found, the reference might not be the "first bit of the
> MPDU" (which I'd also say is actually somewhat vague with OFDM
> symbols), but something else entirely.

Hmm.  What's the reference for beacons and probe responses?

> There's also something that I'm not sure about - in 5/10 MHz channels,
> as I understand this is often achieved by running hardware timers at
> different frequencies - does that affect the timestamps hardware
> reports here?

Is it fair to say that you are generally concerned that not all hardware
can stamp received frames with something like a TSF time, but some
hardware can stamp frames with a time that is the "moral equivalent" for
certain purposes?

What are the use cases for the timestamps?  My use cases were these:

I. Measuring nanosecond intervals between several consecutive frames

        A. Using the measurements to verify settings of device registers

        B. Deriving from several intervals the meters distance
           between two 802.11 stations

II. Using the timestamps to place graphic representations of frames
    on a timeline

I can certainly imagine someone using hardware timestamps to put frames
back into the order they were received if the order was scrambled by,
for example, a multiprocessing network stack.

Dave

-- 
David Young
dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org    Urbana, IL    (217) 721-9981
