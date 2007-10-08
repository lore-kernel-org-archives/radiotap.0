From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Mon, 08 Oct 2007 11:45:08 +0200
Message-ID: <1191836708.4063.17.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
	 <1189668582.6161.91.camel@johannes.berg>
	 <20071007235551.GN6429@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Lmk35N0kZ1tieRsg8wJl"
In-Reply-To: <20071007235551.GN6429-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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

--=-Lmk35N0kZ1tieRsg8wJl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-10-07 at 18:55 -0500, David Young wrote:

> My problem with #2 right now is that you and I are acting as stronger
> advocates for the folks who adopted conflicting radiotap numbers than
> they themselves are.  Meanwhile, v0 has some momentum: FreeBSD has
> introduced useful new fields, FreeBSD and NetBSD are in agreement,
> and there are NO interpreters in tcpdump or in wireshark for any field
> past 15.  Let's stick with v0 until somebody objects.

Ok. I just need a bunch of fields in the Linux code for injection
purposes and am actually developing userspace code to parse/create
these. Also, here I am actually using bit 14/15/16/17 as RX/TX flags,
RTS/DATA retries. It would help much if we could go forward with hosting
the radiotap header "on neutral ground" and standardise these fields, no
matter how.

> I propose to add two new presence bits, 29 and 30.  Let them both reset
> the bitmap index to 0.  That is, the bits in following next 32-bit
> presence word are interpreted as bits in 0..31, not n..31+n.  We must
> use both of these bits in conjunction with the extension bit, bit 31,
> or else they will have no effect.
>=20
> Let bit 29 make the interpreter change to a vendor namespace, and let
> bit 30 make the interpreter change back to the default radiotap namespace=
.

This doesn't seem to require two bits, why not just use a single one to
mean "next bitmap is vendor namespace"?

> Some detailed field specs follow.
>=20
> Vendor Namespace Field (29)
>=20
>         presence bit IEEE80211_RADIOTAP_NSVENDOR =3D 29
>         1-byte alignment
>         5 bytes long
>         scope: this bit is reserved in all namespaces, and it is
>                interpreted identically in every namespace
>=20
>         The Vendor Namespace Field contains three sub-fields.  The first
>         sub-field is 3 bytes long.  It contains the vendor's IEEE 802
>         Organizationally Unique Identifier (OUI).  The fourth byte is
>         a vendor-specific "namespace selector."
>=20
>         Before it resumes interpretation of presence bits in the followin=
g
>         32-bit presence words, if any, the interpreter shall reset its
>         presence-bitmap index to 0, and change to the vendor namespace
>         specified by the OUI and selector.
>=20
>         The fifth byte, skip_length, tells the interpreter how many bytes
>         of data after the end of the Vendor Namespace Field can only be
>         interpreted according to the vendor namespace.  If a radiotap
>         header changes to a namespace that the interpreter does not
>         understand, and back, the interpreter may resume interpretation
>         in the new namespace by skipping skip_length data bytes after
>         the end of the Vendor Namespace Field.
>=20
> Reset Namespace Field (30)
>=20
>         presence bit IEEE80211_RADIOTAP_NSRESET =3D 30
>         1-byte alignment
>         0 bytes long
>         scope: this bit is reserved in all namespaces, and it is
>                interpreted identically in every namespace
>=20
>         Upon interpreting this field, the interpreter shall reset its
>         presence-bitmap index to 0, and change to the default radiotap
>         namespace, before it interprets subsequent presence-bitmap words.
>=20
> If we adopt Reset/Vendor Namespace, it is possible for a radiotap field
> to appear twice or more in one radiotap header.  I believe that this is
> a feature, and I have some ideas for using Reset Namespace to specify /
> record transmit strategies.

Ah, I see, ok, yes, now I know why you want two bits. Sounds good to me,
although I think you could add some ascii art example as this
description is quite procedural and gives little overview :)

johannes

--=-Lmk35N0kZ1tieRsg8wJl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUARwn8I6Vg1VMiehFYAQIyFg/+Iw1t+TXzlH3mln1oeVjK6VoLQlI0yOgL
ncC5p85DgPRe2QWQ8R6JSA5JiEGmiLYNkpaboZpuMQbzD1OZ/GTlL5dmqE9wJ3SH
0st4t4fGWuUiUtHM1Vc7LsUR4oXdgwPxevpQQS5qxiZqsYUZugbj662QgB4BcmXX
+yXc9E50qugMRRvocgL3gVm5NYZQOXtaOJ0xjgS6919iT2wKJdjklvahAL1+iaXs
TVNsxS2zFqvzuQigu07HrvXd/bBNS93LAocW7Xt/k0V6M0O6IHdKUqGH4kfJJroU
qKM5T7ih+3AdpkygvtD67H/KqgBDDgs0sI7C7cq4EMJePKm8+1/gFkRBmzZPk8Cr
VmwOO1TUzCUUr55xOpAvloWkr2RXy/8r5K7Ak3WVb34/isrrrttqBccPxjkMRF9/
HiRAEO3TfsgeN4brKm0Z2KEprd3kskjovp8Kdvls+owY0K5kH4oJfamCQ6p7nSeO
lMbcgZdCIKNjOw1QuCrAMVJ64sI+7+LWBaLPcjRhq7KFeSu5S8McGmt+030bajD3
NeDwoicPYME1UlzwPf4Rzp7Nn4hE6DcV79wyjeTjSPvZLVGMMQcVPYKb0a3s57Tx
NmTIJkFt9GxYAiQUbWKbL0c+uDi4sXQ5Ie0WO3yJhvZUMtQLRh5zsY674TwPvwCu
Dyj5n8kLw58=
=1VoX
-----END PGP SIGNATURE-----

--=-Lmk35N0kZ1tieRsg8wJl--
