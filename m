From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Mon, 13 Feb 2017 11:42:26 -0800
Message-ID: <0FB8C34C-910C-404F-97BA-18BB7F8949C4@superduper.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
 <D96F5F50-5B44-487C-8FF8-36A793960B7D@superduper.net>
 <1487014748.19813.5.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1487014748.19813.5.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

It=E2=80=99s not correctly implemented on captures from Macs - it =
increments for every MPDU. TSF is reliable on all platforms that I=E2=80=99=
ve seen, although has different reference points for different =
platforms.

One things that is very odd is the different parameters for MU - 4 sets, =
but I=E2=80=99ve only ever seen 1 MPDU reported. How is this supposed to =
be used?

Simon

> On Feb 13, 2017, at 11:39 AM, Johannes Berg =
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
>=20
> On Mon, 2017-02-13 at 11:33 -0800, Simon Barber wrote:
>> For HT and VHT one of the things that is missing is the total length
>> of aggregates (including padding) - it=E2=80=99s in the L-SIG header, =
would
>> be nice to have it exposed (since most chipsets pass up everything
>> that=E2=80=99s in the header).
>=20
> I don't know about "most", but I know ours doesn't :-)
>=20
>> Also some standardized way to put aggregates back together. My latest
>> wireshark extension uses same TSF as that clue.
>> See https://code.wireshark.org/review/#/c/20043/
>=20
> We already have that, in the A-MPDU status field there's a reference
> number that's supposed to be constant within the same A-MPDU and =
change
> between consecutive A-MPDUs.
>=20
> johannes
