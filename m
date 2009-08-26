From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Vendor extensions on radiotap for Atheros
Date: Wed, 26 Aug 2009 22:00:31 +0200
Message-ID: <1251316831.13717.5.camel@johannes.local>
References: <43e72e890908261052g237dd19cy18baa900721f245a@mail.gmail.com>
	 <20090826195115.GF1260@ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-HVeAyRsg+niWoENbtqVu"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20090826195115.GF1260-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Joshua Zhao <Joshua.Zhao-DlyHzToyqoxBDgjK7y7TUQ@public.gmane.org>, Matt Smith <Matt.Smith-DlyHzToyqoxBDgjK7y7TUQ@public.gmane.org>, Jouni Malinen <j@w1.fi>
List-Id: radiotap@radiotap.org


--=-HVeAyRsg+niWoENbtqVu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-08-26 at 14:51 -0500, David Young wrote:

> I should underscore that for backwards compatibility, an implementation
> should not interpret bit 29 or bit 30 as an implicit extension of the
> presence-bitmap, but you still have to use bit 31, the presence-bitmap
> extension bit, to extend the bitmap.

Indeed. The text there says:

        Before it resumes interpretation of presence bits in the
        following 32-bit presence words, if any, the interpreter shall
        reset its presence-bitmap index to 0, and change to the vendor
        namespace specified by the OUI and selector.=20

or

        Upon interpreting this field, the interpreter shall reset its
        presence-bitmap index to 0 and its namespace to the default
        radiotap namespace, and change to the default radiotap
        namespace, before it interprets subsequent presence-bitmap
        words.=20

but of course that's useless unless you also used bit 31 to indicate
that there actually _are_ follow-up bitmaps.

But I think we should follow the standard practise of having a generator
and a parser for this. Then again, a generator may be hard, so maybe
just a parser in wireshark or so. Showing multiple trees if there are
multiple standard namespaces, and skipping over vendor namespaces while
showing the vendor would be nice. Bonus points for making it easily
extensible so vendors who care to publish what they do in their
namespace can extend wireshark easily.

Or we could make a patch for linux to generate multiple namespaces for
multi-rate retries -- we have the info just don't publish it right now
(we only show the first rate).

johannes

--=-HVeAyRsg+niWoENbtqVu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJKlZRcAAoJEODzc/N7+QmaBJYP/33tCF1pBrM19nMf2lvPw6E4
qVNBgsPGYSFuaIdzFXBsyIiO3dYOmyGnjuzKU8ofXaft4d3+kbT08EXfFoU7Lemt
mRX+Ybp/CTKCMZr6Fu6nRAiM8UBvLxbMvFEuju9e91hieLtTnth3wIFYc/V0Voek
7EhBv4f5zvj0kI3H7cX+kSx02mjBaCYB7uvdfOjXqOvPJ24imUd2PGEPOw2ogmpk
Y/vFelTBBK5i4pczWUcHgkSwMA9WuEcxThJgd56MmyIPMKJ7CYUB0MsLLNz4DHoh
QxLFGrDncEL2/Vx5MRdQj+UwcyBijplhpUsL9xDPBNEjeqzYCVQLYvlnWRK3IfCE
DNeZaGxA32Qr97rNjzRf7lX4dEYitfjiH7E8IwN6B/QS14BwJsAoAGuxb8b8MEdS
Y1pGI7W/OkDAfBvbHbx/ofqM6vyx2sjbpJmNkFNYx6IxIG7shAnQ0Q46J2bu6rkG
qRZnER+ctPT0XMVBIPy3qNL0tdhZonBTQaUh4yoqDrl7kBtpSvxCAxbFNUbXDnFQ
6XQAS4QlVW/py6iP1WJ14LU+bP011gOys5Qtsz+h5qdi5pRdJp9cCQTlECg8wBl4
kBNs7rTfVC/0bd+FeyWwRk8rZfWIvjhwMK5QMj2K0ncgFPJV87R3b6ryTI03CEap
s/ECsSw/QF6H3SbGNyfV
=WprV
-----END PGP SIGNATURE-----

--=-HVeAyRsg+niWoENbtqVu--
