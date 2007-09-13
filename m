From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 13 Sep 2007 09:29:42 +0200
Message-ID: <1189668582.6161.91.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-BqIcMPxUQ3gqfJFcOVs5"
In-Reply-To: <20070912180619.GB17887-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-BqIcMPxUQ3gqfJFcOVs5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2007-09-12 at 13:06 -0500, David Young wrote:

> Solution 2: increase the radiotap version number, and start over from
>         bit 0.  Now we need a "legacy" parser for v0, 0 <=3D bit <=3D 13,
>         and a "next gen" parser for v1.  No v0 header with bits >=3D
>         14 set can be interpreted without ambiguity.
>=20
>         2a: adopt all of the legacy presence bits 0 through 13 in v1
>         2b: adopt some of the legacy presence bits in v1
>         2c: start from scratch for v1

Personally, I favour solution 2a as it allows us to easily port parsers
and even share code, but before we do that, we need a good way to allow
vendor-specific extensions. I've been thinking that a format with an
explicit length field like 802.11 information elements would have been
easier for this (think 802.11 vendor-specific IEs) but I'm sure we can
come up with a solution for vendor-specific fields, for example breaking
the "bit ordering" =3D=3D "element ordering" for them and requiring them to
be last at all times or something similar.

johannes

--=-BqIcMPxUQ3gqfJFcOVs5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBG6Obm/ETPhpq3jKURAnGbAKCit8u8vuzeMnTYDIg3w2xImrq9fQCfeRHa
rBk1UFjIzOz9QCtXp7G3IIU=
=GKNq
-----END PGP SIGNATURE-----

--=-BqIcMPxUQ3gqfJFcOVs5--
