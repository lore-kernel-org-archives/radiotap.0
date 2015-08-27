From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Wed, 26 Aug 2015 18:17:46 -0700
Message-ID: <126B842D-05EA-4510-BC9B-DB1A4AABEC12@alum.mit.edu>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>	<38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>	<1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>	<1440402013.3735.1.camel@sipsolutions.net> <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com> <55DE44EB.6080603@superduper.net>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <55DE44EB.6080603-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org


On Aug 26, 2015, at 3:59 PM, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org> wrote:

> The HT and VHT fields are missing various bits of phy layer info, and =
are defined missing enough bits for other fields. I've always thought It =
would be much simpler if these fields could convey the whole SIGNAL bits =
from the PLCP header, along with a mask in case it's not all available. =
The drivers I've seen have the whole PLCP SIGNAL field available.

So that's the L-SIG bits from 20.3.9.3.5 "L-SIG definition", and either =
the HT-SIG bits from 20.3.9.4.3 "HT-SIG definition" or the VHT-SIG-A =
bits from 11ac's 22.3.8.3.3 "VHT-SIG-A definition" and the VHT-SIG-B =
bits from 11ac's 22.3.8.3.6 "VHT-SIG-B definition"?

And for 11ad, would it be the bits from 21.5.3.1.1 "General"?=
