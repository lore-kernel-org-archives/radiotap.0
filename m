From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: [RFC] 0-length PPDU reporting
Date: Mon, 18 Jun 2018 09:05:36 -0700
Message-ID: <00986C20-9443-40FC-9A7E-DE636A743951@superduper.net>
References: <1529332670.3490.50.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1529332670.3490.50.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Some chipsets will also report particular types of noise as a special =
PPDU - used for radar detection - it might be nice to allow these as =
well.

Simon


> On Jun 18, 2018, at 7:37 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:
>=20
> Hi,
>=20
> With HE in particular, but also previously, there are PPDUs that don't
> carry any MAC header, for example sounding frames.
>=20
> It seems useful to report these up, but they cause wireshark to =
display
> an error since it's expecting to be able to decode the remainder of =
the
> data after radiotap as an 802.11 frame.
>=20
> To fix that, and to be able to show the type of PPDU, I think we =
should
> add a new field, that contains just a 16-bit value (or 8? or even 32
> since we often need more alignment anyway?) indicating the type of 0-
> length PPDU.
>=20
> Does anyone happen to have a more comprehensive list of PPDUs that are
> like this?
>=20
> johannes
