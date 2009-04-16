From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: radiotap feature discovery
Date: Thu, 16 Apr 2009 18:05:01 +0200
Message-ID: <1239897901.14169.18.camel@johannes.local>
References: <1239897757.14169.16.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-i3+ZwiVtRYMU0eX+d+oH"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1239897757.14169.16.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-i3+ZwiVtRYMU0eX+d+oH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-04-16 at 18:02 +0200, Johannes Berg wrote:

> The other way I could imagine would be to export, in a yet to be defined
> way, a radiotap header that lists the capabilities. For example, upon
> feature query you'd return a header like this:
>=20
> 	0x00, 0x00,		// <-- radiotap version
> 	0x0b, 0x00,		// <- radiotap header length
> 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> 	0x00,			// <-- rate
> 	0x00,			// <-- tx power
> 	0x08, 0x00		// <-- tx flags

Oops, that header length was broken, should be 0x0c, 0x00

johannes

--=-i3+ZwiVtRYMU0eX+d+oH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ51cnAAoJEKVg1VMiehFY5X8P/0QKIjnoFQ3sJHx1QYM5uC+8
JzCNV9eJkREdkRKnPgzocs3xcQDly8wshoOg11kqhumSKKgi0yNj1Q5q/iouiExR
yaEyqHRfuNgmAhZHwmhlvwNUFWPOaXwncTseIHYUecVXDZTNURg73lvSL3EUFaae
AcN7hGQz3BrFMlRMKqCZO9F939Pa9mpxRXt4C1PBkhKVLslbZMgruEeUod6IGusI
eE6XgNBZ++HHiByHsJ5Cj8e3sQXK2yb76kMHQXa3vSL2YV7mJ8Tr3F0WN2+Y6VEr
P3R64aUjJZEHtpxICqos+FKNs4x+DGK8P/hO6EXfLXvyuNwjag+uK7STFiPcQAaU
C4iBsSiL3/mPyE+NGVRatyjRaWXJuGx4NV+cLZd8DBwBE9it2KmCh3BtUI/I+uhK
jlmaO3IKau5ASygsEZNW0hctRVTcI87nvpZJetQSJVxiKnz4ARHoj9ZaBK/shhGA
hX0kcTkfblt+zoW5xbJICQZrebJor4CEWcXR7xEff3TYeE3x8DZE+h4TSYfFk+XC
O14VZqskQhJGjXrk3Q7FNiuirDkBCAFnY6G968K12bLGVh9MLFMgiUwqkkVRfaWt
Z9TptYboKof3MrZAxReJt/TAYw4rbPLcsEaoqtFf1DC4bEBY+Nu4ZPCp7UsYpSFy
lOE4yhha59/Uz9kYaBHJ
=5VT3
-----END PGP SIGNATURE-----

--=-i3+ZwiVtRYMU0eX+d+oH--
