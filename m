From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: radiotap feature discovery
Date: Thu, 16 Apr 2009 18:02:37 +0200
Message-ID: <1239897757.14169.16.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-QRyLQWq56A04xSIekKIu"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-QRyLQWq56A04xSIekKIu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi!

With all these injection things, we'll invariably find devices that do
not support some of them, e.g. will not support not setting the sequence
number because the hardware always assigns them.

Thus, I think we need a way to do feature discovery. This isn't relevant
for RX -- there the driver just provides what it has -- but is for TX
where tools would like to know what they can do.

One way I could think of would be to define a whole bunch of flags for
the various injection features, and export those somehow. Not sure I
like this, since it means we need to keep track of yet another bitmap.

The other way I could imagine would be to export, in a yet to be defined
way, a radiotap header that lists the capabilities. For example, upon
feature query you'd return a header like this:

	0x00, 0x00,		// <-- radiotap version
	0x0b, 0x00,		// <- radiotap header length
	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
	0x00,			// <-- rate
	0x00,			// <-- tx power
	0x08, 0x00		// <-- tx flags

This would indicate support for controlling
 * rate
 * tx power
 * tx flags - only no-ACK

How to export this information is to be determined and would most likely
be platform dependent though.

Thoughts?

johannes

--=-QRyLQWq56A04xSIekKIu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ51aaAAoJEKVg1VMiehFYUgoQALuHZx3fOeqKNcXkJaeKSAyl
C6YrBUQqQfBV2X7Mja4yQxntS5b3adDxLK0jBsQLnBEb9V9Edk7fUzuJzyXVXjH2
mlbPuEEhN+/dodToEDFD+4Du1B39JBtzzlK052fHfLXwo8Lg1psLQMsDhjbC8JGx
Iioef1R/coT8aTVlJkWI7J5MDsxZG4Qj+n2ydnMl7dX9+zrezYvVLkic8LYV6zdc
f1dqWmz1nfJDmWfHA3F3N7mXqT2IVkMaS2BL0ILnu4SfrZRygR7jbXokQnUQPCLC
Y3b39KwGmB+QoQcQiejtrxYaQU5LgcgTILA7UrRuTbZQrLcjyXqgjbwj8LUlDleO
bpMj/QwKLgAW8y04T6mucPjRFcn6XwFWQvt07D9Eb72CzIbVph/DQop5b7p4zWwx
0mfRTkgYrJEFXWOinLRW+nRvRgDYkrshnOk/aOY/OaN84c6nQpc38hNiDjjz7+eJ
cSdMBfLDZEGPmGwAh4YDAnsd/k0/ltLh6yh/LkIfCWLX8nSFVQYWInKU+3T3OQ0z
ZCb/er5HreBQVGDZi+SVSM9tbEoa1PnqUbn3zdNSUEJ8sz5q8WxJvqVTChx7Vq1m
qXaHVXgC0KwsXVl9VmH6nNy8oCGAj05NnIWmAOg0dBYTSsuBIorTEIxGv124X3sS
nIzRtAVB0KTLS0qFtU//
=Bk35
-----END PGP SIGNATURE-----

--=-QRyLQWq56A04xSIekKIu--
