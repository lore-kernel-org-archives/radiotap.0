From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: TSFT
Date: Sat, 17 Nov 2012 00:48:49 -0600
Message-ID: <20121117064848.GO21779@pixotech.com>
References: <50A72E17.6070207@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A72E17.6070207-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, Nov 16, 2012 at 10:26:31PM -0800, Simon Barber wrote:
> This is the current definition of TSFT:
> 
> "Value in microseconds of the MAC's 64-bit 802.11 Time
> Synchronization Function timer when the first bit of the MPDU
> arrived at the MAC. For received frames only."
> 
> My experience with TSFT is with Atheros cards, which record the
> timestamp at the end of the frame, not the start.

Interesting.  Is it consistent across the whole Atheros product line?

> Furthermore for DSSS/CCK the definition above is reasonable, but for
> OFDM and HT (802.11n) the SIGNAL field (part of the PLCP header, not
> part of the MPDU) is part of the first data symbol. It would be much
> clearer to change the definition to state that the timestamp is at
> the start of this first SIGNAL/data symbol. Any objections to doing
> this, or preference to change the reference point to a different
> part of the frame?
> 
> In my wireshark patch I've added options to interpret TSFT as the
> start of end of the frame.

I think we need 1) a methodology for an author to identify their
device's reference point so that they can calibrate their driver to the
standard and/or 2) a radiotap datum that identifies the reference point
in use or 3) something entirely different.

Dave

-- 
David Young
dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org    Urbana, IL    (217) 721-9981
