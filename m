From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: [RFC] L-SIG field
Date: Mon, 2 Jul 2018 10:45:58 -0700
Message-ID: <2C890112-D4D8-4764-8A0E-1544E21457A5@superduper.net>
References: <1530542232.3117.5.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1530542232.3117.5.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

I'd love to see this! It would be very useful for the Wireshark =
timeline, to accurately display aggregate duration when not all the =
subframes are passed up by the driver.

Simon

> On Jul 2, 2018, at 7:37 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:
>=20
> Looks like we need this, any thoughts? Seems like a straight-forward
> extension.
>=20
> ---
> title: L-SIG
> categories: [suggested]
> ---
> Bit Number
> : 27 (tentatively assigned, field data may change)
>=20
> Structure
>  - u16 data1, data2
>=20
> Required Alignment
> : 2
>=20
> Unit(s)
> : none
>=20
> This field indicates - if known - the contents of the L-SIG.
>=20
> ## data1
>=20
> | **`0x0001`** | rate known |
> | **`0x0002`** | length known |
> | **`0xfffc`** | (reserved) |
>=20
> ## data2
>=20
> | **`0x000f`** | rate |
> | **`0xfff0`** | length |
>=20
