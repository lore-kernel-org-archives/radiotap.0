From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field - STBC and Ness
Date: Thu, 05 Jul 2012 11:12:30 +0200
Message-ID: <1341479550.4455.36.camel@jlt3.sipsolutions.net>
References: <4FAC5DE0.90708@superduper.net> <4FACBA13.9040509@neratec.com>
	 <4FAD41E4.3090803@superduper.net> <4FAD43F0.20807@superduper.net>
	 <1336761346.8739.3.camel@jlt3.sipsolutions.net>
	 <4FADE69F.9040100@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4FADE69F.9040100-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: Wojciech Dubowik <wojciech.dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2012-05-11 at 21:27 -0700, Simon Barber wrote:
> Another slight tweak - I think STBC is more commonly used than Ness (as 
> witnessed by Wojciech's interest), so give STBC the simpler encoding. I 
> believe Ness is used for beamforming soundings.
> 
> Spec would look like this:
> 
> known    definition
> 0x01    bandwidth
> 0x02    MCS index known (in mcs part of the field)
> 0x04    guard interval
> 0x08    HT format
> 0x10    FEC type
> 0x20    STBC
> 0x40    Ness - Number of extension spatial streams is known
> 0x80    Ness2 - bit 1 (MSB) of Number of extension spatial streams.
> 
> The flags field is any combination of the following:
> 
> flag    definition
> 0x03    bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
> 0x04    guard interval - 0: long GI, 1: short GI
> 0x08    HT format - 0: mixed, 1: greenfield
> 0x10    FEC type - 0: BCC, 1: LDPC
> 0x60    STBC - 0, 1 or 2: number of STBC streams
> 0x80    Ness - bit 0 (LSB) of Number of extension spatial streams.
> 
> What should I do to advance this as an approved radiotap extension?

I suppose you already have patches for wireshark for this? I can help
you out with a patch for the Linux kernel as an example producer of
this, and then I think just repost it to the list again to leave some
more discussion time.

johannes
