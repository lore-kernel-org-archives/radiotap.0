From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: packet injection and Suggested fields -
Date: Wed, 18 Feb 2009 09:45:48 +0100
Message-ID: <1234946748.4149.12.camel@johannes.local>
References: <be79082c0902162214y34784ed8u384c01d617ac5e03@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WLbrFx9mFx7q6BQNrvF/"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <be79082c0902162214y34784ed8u384c01d617ac5e03-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Vipin M <vipintm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-WLbrFx9mFx7q6BQNrvF/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

> 1) In packet injection if radiotap values link "Channel" is set to a
> specific channel does it send in that channel  or it is only for
> sniffing.

Since your PHY can only be on one channel at a time, I suspect this
field isn't useful for injection. We certainly haven't implemented it in
Linux.

> 2) The suggested fields ( http://www.radiotap.org/suggested-fields )
> can be used, is they are incorporated.

Certainly, for example the 0x0008 bit in
http://www.radiotap.org/suggested-fields/TX%20flags is useful only for
injection.

Maybe we need to clarify which fields are useful for injection and
should be supported if injection control is supported?

johannes

--=-WLbrFx9mFx7q6BQNrvF/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJm8q5AAoJEKVg1VMiehFYSz8P/0laqTU096/Pf+ZHr0XLCNJT
nejVNR2uZ4DeRp7Q2SokWDpQIBFRIwyfNOJ3a1N8mF3yUaApzgZTs5sJipugk/pb
OkPD7JCfPuthL7UiiLzvEMVRpm6eVSbvPyzMnu7OVjV+DN0iPDZbZaI30h05HUsf
MCWyCtBkJwevN1IR1o/aEsYPBhJcX6t7P4Z9/cwHbhE0GO0nFymSm3Tq/rnCsXVX
8Y2tsTG+hEp5jL7ZnrsIG+sY8gdiRBF4Iy4+MEHxOZWQlNTne+sguexQtRLW0wxC
sg8O/dGwezON8+xRMCyQV83rAvjZBYs5e+/xYhxZ9odC3gmH7L9epnCfs1j6RudG
/IPxuKLP3G9Oht3hNFaCcv7JNsM4aOGojrIKcAsTuwXSgkcwksqbCe5UWFF+etDT
RwvnfJ6EX1wuj1qtzDUqLcDLX76eDjsXGJLbhORzALMI4l/1xzd9oXalsP6yd5KY
XV8j1WGKhy6ji9lpXZUiHtWjslLNAWo4+E+4FpyX75q30WKu17rShhXbCIepN+Tr
vJDPJZuzuAJPM6lvvXXdF4KI80WRUDU5YGzTkdzEiju2c0ljCUoZFHRuWSVOnicT
Dh9Nh4PpLAw+uyo5YUkxaP3MHoBA5r6X+h3IHcW1ONNX/hAzgq+sKIFjjh5bkjMY
d49ufipbTfpHBK1pFHwb
=eoBU
-----END PGP SIGNATURE-----

--=-WLbrFx9mFx7q6BQNrvF/--
