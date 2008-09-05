From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Bad FCS flag
Date: Fri, 05 Sep 2008 22:25:24 +0200
Message-ID: <1220646325.11109.21.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Sv4UrriLs/PRCRM4NKzB"
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-Sv4UrriLs/PRCRM4NKzB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry I haven't actually updated my proposal, had other stuff.

Here's a representation of the non-conflict we're running into with RX
flags:

 * wireshark defines that bit 6 in field 1 ("flags") means "bad FCS".
 * the unofficial RX-flags stuff defines that bit 0 in "RX flags" means
   "bad FCS"

I want to avoid having _two_ "bad FCS" bits and chose the RX flags one
to leave room for possible generic flags in "flags"/1, but I don't
really care either way.

Opinions?

johannes

--=-Sv4UrriLs/PRCRM4NKzB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIwZWxAAoJEKVg1VMiehFYD24P/3aqr1a8vReqcBtqSLk0mk1g
PmqMLmZLzYJT4YzB8GVGIhjPMi1FqGJAh11tdUSstItq5NBY1qeXyVEu0wDNZJIb
akn1TlUk6fGPvrZHlnZGB69RN3TMNQ5ySXaXE2HU2kGNFKByRXvMxCgYTTX9zU1J
xhmsrqPEqANRKGXnrJPfBTG8KBeOQfA1dUgyjI0counIhYxGlhUSht0HiIjNuqQC
SHXp4rYf4rHqaO076bkjxDzTB5Di8k9ReoyyEAaBk3/X5NWtRLhDTcVf4pP7kRRq
QXIckPRWgFGcyZd2xkT1Kpxksej5OLfHbAXbTBXhsGJ97elvdTlTBswzaF7GAvlO
xezpItyI5UB2WowhLiBU0HrVOdhIdrDDLJxuBfXoo0S6NrCw9kbSTcUh3C84Gs8x
z0/Ot2oHl/L5B/XKoVuZHgOCzTvhriKSm6A5AwAeEe92vzoWezK09L2vkgXDFUjp
Og432VJsRcaGPjhQVxAyyP8L0aUVp54KukAIhiiX0LCJrUqeoG287sTRbbl3C+5D
Ha9s74Rldxp5Pyx//elgBKTigo3sRaml+D93BAKinlvqwKeQChf6GGoF9RpoAvit
0PxSmqX5jPfAVFDcMUbSaI//Y3LakFxAwVa+MIG+kFNir2pHKDyV9QapUJmKYh9w
h+F/MKPA8DhVhmEPYJir
=a5Tz
-----END PGP SIGNATURE-----

--=-Sv4UrriLs/PRCRM4NKzB--
