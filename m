From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: radiotap feature discovery
Date: Thu, 16 Apr 2009 19:30:02 +0200
Message-ID: <1239903002.26575.17.camel@johannes.local>
References: <1239897757.14169.16.camel@johannes.local>
	 <20090416171256.GY25412@ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-W+Wtq3/8pEeVEPOL3IHq"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20090416171256.GY25412-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-W+Wtq3/8pEeVEPOL3IHq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> > The other way I could imagine would be to export, in a yet to be define=
d
> > way, a radiotap header that lists the capabilities. For example, upon
> > feature query you'd return a header like this:
> >=20
> > 	0x00, 0x00,		// <-- radiotap version
> > 	0x0b, 0x00,		// <- radiotap header length
> > 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> > 	0x00,			// <-- rate
> > 	0x00,			// <-- tx power
> > 	0x08, 0x00		// <-- tx flags
> >=20
> > This would indicate support for controlling
> >  * rate
> >  * tx power
> >  * tx flags - only no-ACK
> >=20
> > How to export this information is to be determined and would most likel=
y
> > be platform dependent though.
>=20
> Some standardization may be possible.  For example, Linux, *BSD, et
> cetera, may be able to share a getsockopt(2) interface for querying
> the capabilities on a socket.  Platforms with BPF could share an
> ioctl(2) interface for the same.

Indeed, that would be doable. Any suggestions?

> > Thoughts?
>=20
> Suppose that we let the OS pass back one or more "capability headers."
> Each capability header consists of two radiotap headers.  The first
> header contains supported Tx parameters.  The second header must be as
> long as the first, and it is a bitmap that tells which bits are variable
> (0) and which are fixed (1).  In your example, the first header
>=20
> > 	0x00, 0x00,		// <-- radiotap version
> > 	0x0b, 0x00,		// <- radiotap header length
> > 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> > 	0x00,			// <-- rate
> > 	0x00,			// <-- tx power
> > 	0x08, 0x00		// <-- tx flags
>=20
> may be followed by the bitmap
>=20
> > 	0xff, 0xff,		// <-- radiotap version
> > 	0xf0, 0xff,		// <- radiotap header length
> > 	0xfb, 0x7b, 0xff, 0xff,	// <-- bitmap
> > 	0x00,			// <-- rate
> > 	0x00,			// <-- tx power
> > 	0xf7, 0xff		// <-- tx flags
>=20
> meaning that only radiotap version 0 is supported, the header length is
> somewhat variable, only rate, tx power and flags may be set, and only
> the no-ACK Tx flag is allowed.

Hmm. That seems useful on first sight, but is it really? It seems to be
useful only for things like the tx flags.

Supporting multiple radiotap versions is still impossible, since the
bits would have entirely different meanings, or even the format changed,
otherwise we wouldn't have cycled the version number.

For the bitmap we already know - I don't think any reasonable
implementation would _require_ some field to be present.

For rate/txpower there may be limits you cannot express with this, but
must discover in some other way, or the implementation just clamps or
something.

So that leaves tx flags only, and could there really be flags that are
_required_ to be set or will be assumed to be set? I guess with the
'override default' thing I just asked for that might make sense...

johannes

--=-W+Wtq3/8pEeVEPOL3IHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ52sXAAoJEKVg1VMiehFY3WoP+wR9wmgkDdFpVhZ3Ysys1wKz
XxkY0WtBY6smgNeoDRjUim9VBw6i9z1c9UG4N+6ojUBEaGnjltBH0oZYu3jNH3VI
jISAylzOadn2w4FwB8shptVEDlFYKvT69UvkaEGXcPwl/EBFhX00hhkSqwEKyJff
IL+9ACv0nxj1pa/PQJRpPngJXxnAwGBvatv1KfHEkHjMMW/momiYSDBBDgWgnJqE
1pa/VO7GZNNhpA5V7osPhtH1RijzEHAYv6lQfbnK0kJKQUz3j10J5MmN6tR8FY/i
noZqHMP2w3Lm/60uHmsDPoTHl6vwh42RxuV7QxutHPmbjAsGwEPaIvsXzRRwFMv+
8Pk4Bd5vQJ5ATZW6q5tgEsgnamzA/36PGMJLt9w4B385MwNWsH+LAc3qQnJz6y9O
Ey/Vd/hrbUvKDIZmAdt0mGBz5Ah3HyeJkgs1B2m+bg4E5VzpdBIXA58Zv2STJb+V
ajPm0nEIllHeC0GhB/Z/AcyO5GPajxj5yiRnISG+S+G6JQ6z0D9ejDKc41zIHVTe
nlFE/Jfne+1C0zZ9NFNs04yXnbz5Te9Jwbg/p/LoRm1iAbWijT39+8Xv/gDIbBEl
mwlXThuuMwns87NTbYRwAXQ1NSRcOxjuJQdvp1gPO1Vb4LuEQ6nJLvUmQeqvzlEJ
z0P/rGW3Pvm/B0/a3uMD
=tZjI
-----END PGP SIGNATURE-----

--=-W+Wtq3/8pEeVEPOL3IHq--
