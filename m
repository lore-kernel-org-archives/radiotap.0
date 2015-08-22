From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Sat, 22 Aug 2015 16:34:30 -0700
Message-ID: <1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com> <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <38F46E1D-1C4A-48DC-A906-9522006E8474-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org


On Aug 22, 2015, at 1:59 PM, Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> =46rom the *radiotap* point of view, I would say that the last field =
is incorrect because the page for the MCS field on the radiotap site =
says:
>=20
> 	The mcs field indicates the MCS rate index as in =
IEEE_802.11n-2009.
>=20
> which, if we update it to say "as in Clause 20 of IEEE 802.11-2012", =
means it has values from 0 to 76, with modulations different from the =
ones in 11ad's Clause 21, i.e. the radiotap MCS field is *not* =
appropriate for 11ad.

For what it's worth, it appears that the wil6210 driver:

	https://wireless.wiki.kernel.org/en/users/drivers/wil6210

uses the MCS field and its mcs value for 11ad.  It can also be =
configured to supply raw "PHY data" with a vendor-namespace field.

So code that processes radiotap headers, such as Wireshark's =
radiotap-header dissector, will have to interpret packets with an MCS =
field and a channel frequence in the 11ad range as being 11ad packets, =
and treat the mcs value in the MCS field as an 11ad MCS, not an 11n MCS.=
