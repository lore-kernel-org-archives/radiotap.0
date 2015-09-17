From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Thu, 17 Sep 2015 18:32:37 +0200
Message-ID: <1442507557.2821.5.camel@sipsolutions.net>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
		<38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
		<1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
		<1440402013.3735.1.camel@sipsolutions.net>
	 <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com>
	 <55DE44EB.6080603@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <55DE44EB.6080603-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, 2015-08-26 at 15:59 -0700, Simon Barber wrote:
> The HT and VHT fields are missing various bits of phy layer info, and 
> 
> are defined missing enough bits for other fields. I've always thought It 
> would be much simpler if these fields could convey the whole SIGNAL bits 
> from the PLCP header, along with a mask in case it's not all available. 
> The drivers I've seen have the whole PLCP SIGNAL field available.
> 

What drivers have you been looking at? Most I've seen don't actually
have it.

I don't really object to this proposal though - the mask would be very
much needed though and one might have to re-construct the signal field
from available data.

johannes
