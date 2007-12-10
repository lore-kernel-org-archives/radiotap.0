From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: rfc: "canonical" radiotap parser
Date: Mon, 10 Dec 2007 13:37:30 +0100
Message-ID: <1197290250.6035.69.camel@johannes.berg>
References: <20071207045545.GO3568@che.ojctech.com>
	 <1197110397.4171.46.camel@johannes.berg>
	 <20071208210645.GX3568@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qLoaY2Ct7ZsJosbdh/UO"
In-Reply-To: <20071208210645.GX3568-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

--=-qLoaY2Ct7ZsJosbdh/UO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> I was trying to give the compiler a hint to help it generate better
> code on architectures, such as ARM, where unaligned loads may take
> many instructions.

Well, yes, but who guarantees that it actually *is* aligned that way?
Radiotap only specifies that the fields are aligned with respect to the
start of the header, but there's nothing that guarantees alignment of
that.

johannes

--=-qLoaY2Ct7ZsJosbdh/UO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUAR10zCaVg1VMiehFYAQJewA/+NIimE+mSddkrVb2Rlm3OlumlHI1JF6al
Bzo7Mkg07S1X20OEGlfyUqBW3BFetbpG++MnRSYyOe3aaXEj7Dfy0/oufcn/YUTQ
f7Ax1Ic+yeVrtPho2PnLJPHjciFLVFg8HskGYPv7RCT3ZMvNzvaohZONf8vfOD4s
sgWFaOGxd6dFDAaE+DjZhXSiq7e8mfz41j9AF6eD9ziTP6LoixHDNHOnyp9TODgb
++MsPvnijeWrw1B93CuCgtzpXdcExgSdA/DLUYuF+TQ3x98b7BgnkjdPkzikkDTH
qtuwSFCsgvgFV4sXIDfAqUZ+7BFcmB3wm8TyqupC7753Ppia3xWfbVEKsC4bkYxK
2a6Qk25b9kgLQHKF/devTKLKAYoeVbhHCBqZImC/n5x/lYNDqU8yrgcC0k4Mp3Fy
iVQSrY5w2nw4e2EwrPFJ6EEeioUIgkBnEyN+w5dgyOgVpL5EMY7OOSdsaciSd3le
Uw9bCZemC/OgoeFlJY4o/2mgskpIpP212egaQyVsOxOsSy2dbmNgwugiLdD/eqXi
YKJdQ6ERlXtoII1OVFPM4A68zh+fflwEL9xDb6j82Ay8f3quIy57QlQ5jibkdgAM
o/lxLgc4MuJiJn4/cCz+mYhwmdxCsg7NP77tjCcAV2mwach6YfbZHHBqGn7Bg4gN
GHWY2NS+IPo=
=45Y0
-----END PGP SIGNATURE-----

--=-qLoaY2Ct7ZsJosbdh/UO--
