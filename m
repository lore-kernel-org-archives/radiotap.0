From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Wed, 02 Dec 2009 00:08:16 +0100
Message-ID: <1259708896.32171.132.camel@johannes.local>
References: <1259258152.32372.90.camel@johannes.local>
	 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
	 <1259659011.32171.45.camel@johannes.local> <4B154CD4.8020700@wireshark.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-1G/pFl1FcFjdttd47k/j"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4B154CD4.8020700-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-1G/pFl1FcFjdttd47k/j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2009-12-01 at 09:05 -0800, Gerald Combs wrote:
> Johannes Berg wrote:
> > Joshua,
> >=20
> >> For the structure of the vendor space, you extend 'skip_length' from 8
> >> bits to 16 bits.
> >>> Structure
> >>>        u8 OUI[3], u8 sub_namespace, __le16 skip_length
>=20
> What happens if someone without an OUI wants to add a vendor extension?
> Do they need to purchase an OUI or IAB from the IEEE?

IABs won't work, because we only have 24 bits reserved in this proposal.

However, is there a good reason for anyone to be wanting this, apart
from hardware-specific (and thus probably being affiliated with a
vendor) information? Shouldn't almost everything else be standardised
within the regular radiotap namespace? We do have a use case on Linux,
but we also have vendor backing so we'll be using a sub-namespace for
that specific use case (and maintenance within that namespace is easy by
controlling what patches go into the source tree).

I have no interest in helping maintain a second namespace in addition to
the radiotap bit namespace, and since we do allow sub-typing, being able
to use a subtype of somebody's OUI should be possible for virtually
anyone. If somebody ends up being completely lost without one, there are
probably enough people on this list willing to assign a sub-namespace to
them.

johannes

--=-1G/pFl1FcFjdttd47k/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLFaHcAAoJEODzc/N7+QmahMMQAJhp/zFGbl66tLPKMr2PkCoU
JGsaoq0w6e7vZSWO2v2BAWqsBOwOuyjViAGNrSgdBAvMMUuWUzx6SsXzlzpCU6Uh
lViSSjx2oOEF0wQ4Chu/K1RzQcQQOjDPUZJaRRmtj2xwPVmQ9ngNvsNOWY9r3eBW
iQEA85i4iTPjznQt25v8dO8d8jTkq+5BLOnwZvOiZafabt9STfxXSj2xlzVuK0U0
llTWfO/oZV02NwZkhU47BV+uMZduHs3j/lk8CdZxzHpBOX3jER77hwoSO3fTa8DM
hNxTyMn5WSt6pLcbNguzOlM56tXr9hk+1PGyFIhBzKpPnFFaXlcGmyW8wJZT7JKW
WbMi0yyaXXA7rvdYQviwmRQNhvGPKTudi0M8d4ALcCllwv0xjsKN2e5hSCYEoU6V
zzkg17dOIItfwAPjEKhKYeWxqilCF/leJpn38JcC5J+HohIWztu0TJ7a9rnLoLk1
cseEEeDcMNG+7d+++iUv0+OJhHrmSBP7HKsZQumiEV2Cv2PRKetSbiiAsZD+QUCS
V1EmEV07ZnL7uNrJ7093pq8xTDi6ZTWJElq+PX10cVSPPhEz2B/UAMTmRuY6n+/0
PciPGMiPOtOzhW0WLBdsO9Wxl6VTtqwIpQit2t+2OU9FU3rFVAh9Tkcl/tvy0DS4
Nk9m7RxRtAL6stYODpl8
=P0S8
-----END PGP SIGNATURE-----

--=-1G/pFl1FcFjdttd47k/j--
