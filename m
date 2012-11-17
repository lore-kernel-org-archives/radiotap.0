From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: TSFT
Date: Sat, 17 Nov 2012 09:45:50 +0100
Message-ID: <1353141950.9543.3.camel@jlt4.sipsolutions.net>
References: <50A72E17.6070207@superduper.net>
	 <20121117064848.GO21779@pixotech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20121117064848.GO21779-Gq8g4XVd89tWk0Htik3J/w@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Sat, 2012-11-17 at 00:48 -0600, David Young wrote:
> On Fri, Nov 16, 2012 at 10:26:31PM -0800, Simon Barber wrote:
> > This is the current definition of TSFT:
> > 
> > "Value in microseconds of the MAC's 64-bit 802.11 Time
> > Synchronization Function timer when the first bit of the MPDU
> > arrived at the MAC. For received frames only."
> > 
> > My experience with TSFT is with Atheros cards, which record the
> > timestamp at the end of the frame, not the start.
> 
> Interesting.  Is it consistent across the whole Atheros product line?

Pretty much.

> > Furthermore for DSSS/CCK the definition above is reasonable, but for
> > OFDM and HT (802.11n) the SIGNAL field (part of the PLCP header, not
> > part of the MPDU) is part of the first data symbol. It would be much
> > clearer to change the definition to state that the timestamp is at
> > the start of this first SIGNAL/data symbol. Any objections to doing
> > this, or preference to change the reference point to a different
> > part of the frame?
> > 
> > In my wireshark patch I've added options to interpret TSFT as the
> > start of end of the frame.
> 
> I think we need 1) a methodology for an author to identify their
> device's reference point so that they can calibrate their driver to the
> standard and/or 2) a radiotap datum that identifies the reference point
> in use or 3) something entirely different.

FWIW, for the Atheros drivers we *just* added (1) to the Linux kernel,
but for radiotap output we calculate the difference to the start of the
frame, see here:

http://git.kernel.org/?p=linux/kernel/git/jberg/mac80211-next.git;a=commit;h=f4bda337bbb6e245e2a07f344990adeb6a70ff35

(the patches for the drivers are separate, but simply change the _START
flag to _END)

I have no objections to (also) allowing this information to be in
radiotap though, but I'm not sure we want to? Our (Intel's) device for
example has the "on air rise" timestamp which is different again, so we
could potentially end up with at least three different reference points?
OTOH, I don't see more than these three making sense at all...

johannes
