From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Thu, 17 Sep 2015 18:37:59 +0200
Message-ID: <1442507879.2821.9.camel@sipsolutions.net>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
		<38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
		<1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
		<1440402013.3735.1.camel@sipsolutions.net>
	 <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com>
	 <55DE44EB.6080603@superduper.net>
	 <126B842D-05EA-4510-BC9B-DB1A4AABEC12@alum.mit.edu>
	 <1135A126-6A5A-4C84-A52D-13C0387609CC@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1135A126-6A5A-4C84-A52D-13C0387609CC-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, "radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org" <radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>
Cc: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, 2015-09-10 at 11:25 -0700, Guy Harris wrote:
> 
> The ones that aren't in the MCS field or the A-MPDU field are:
> 
> 	HT Length - is that just the length of the data following 
> the radiotap header?

I don't think so - at least not with A-MPDU.

> 	Smoothing
> 
> 	Not Sounding
> 
> 	CRC - is this of any interest?
> 
> 	Tail Bits - always 0, so these are presumably not of 
> interest
> 
> Can:
> 
> 	whether "20" means "20", "20L", or "20U";
> 
> 	HT mixed vs. greenfield;
> 
> both of which are available from the MCS field, be determined from 
> the PLCP header?
> 
> Or is what "20" means not fully determinable for received packets, so 
> that "20L", "20U", and "40" are indistinguishable, similar to what 
> the Radiotap spec for the VHT field says?

I have a hard time seeing 20L/20U being distinguishable if you're
hearing those while tuned to a 20 MHz channel, but if you're tuned to a
40 MHz channel then perhaps that's possible - likely not from the PLCP
though since that would have to look like a regular 20 MHz transmission
for purposes of somebody picking it up on a 20 MHz channel? I'm not
really all that familiar with the PHY details though.

> 20.3.9.5.4 "HT-greenfield format HT-SIG" says "The content and format 
> of the HT-SIG of an HT-greenfield format frame is identical to the HT
> -SIG in an HT-mixed format frame, as described in 20.3.9.4.3.", so if 
> that information can be determined for received frames, it sounds as 
> if greenfield vs. mixed *can't* be determined from the HT-SIG bits.

You can know whether or not it was preceded by a compat preamble
though.

> For *transmitted* frames, I guess you have more control over how it's 
> transmitted, which is presumably why there's a VHT field rather than 
> just a PLCP header field.
> 
> I.e., as radiotap is used for transmission, it needs to include at 
> least some of the parameters to the PHY service's transmission 
> operation, which may not be available in the PLCP header.

That's also a good point - having to build a PLCP signal field for
transmission would be somewhat painful, especially if you just want to
control some part of the transmission.

> And is there anything more that would be needed for *injected* 11ad 
> frames?  If so, that's an argument for a "DMG" field containing the 
> interesting information from the PLCP header combined with 
> information necessary for injected frames?

Not being familiar with DMG, I can't really comment on this.

It does sound like we need *some* new field though, be it either a DMG
field or a PLCP SIGNAL field, or perhaps even both.

Going back to the original thread though, I think using the MCS field
is quite wrong.

johannes
