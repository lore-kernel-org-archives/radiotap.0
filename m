From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Tue, 2 Feb 2010 13:54:25 -0600
Message-ID: <20100202195424.GE1060@ojctech.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
 <20100126174728.GV1060@ojctech.com>
 <1264584965.25642.15.camel@johannes.local>
 <20100127153002.GC1060@ojctech.com>
 <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
 <loom.20100201T230554-2@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <loom.20100201T230554-2-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, Feb 01, 2010 at 10:09:37PM +0000, Bill Stafford wrote:
> The MCS field description (http://www.radiotap.org/suggested-fields/MCS)
> just shows a bit for 40 MHz Channel and a bit for Short GI.
> 
> On the "40 MHz Channel" bit, it seems like it make more sense as "40 MHz
> transmission". That is, it is a description of the modulation of the
> packet, not a description of the channel to which the radio is currently
> tuned. But there is more to the packet bandwidth than just 20 vs 40
> MHz. When a device is tuned to a 40 MHz channel, it may receive 20 MHz
> packets on either half of the 40-wide channel.
> 
> So the bandwidth options for a packet when the device is tuned to a 40 MHz
> channel are:
> 40 MHz (full 40 MHz bandwidth packet)
> 20L (20 MHz packet in the lower 20 MHz of the 40 MHz channel)
> 20U (20 MHz packet in the upper 20 MHz of the 40 MHz channel)
> 
> When tuned to a 20 MHz channel, the packets can only be 20MHz

My recollection of 802.11n may be incorrect, but aren't 20L and 20U HT
transmission channels aliases for the same center frequency and width as
a 20 MHz HT/legacy channel?

> I also have a question about how the RadioTap design deals with information
> that may not be available. I know that RadioTap works for many different
> drivers, and I am wondering if all the drivers get full information about
> the packets.

The problem of don't-know/don't-care flags has come up before.  It'd be
nice to have a general solution.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
