From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Wed, 12 Dec 2007 18:27:56 +0100
Message-ID: <1197480476.6558.130.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
	 <1189668582.6161.91.camel@johannes.berg>
	 <20071007235551.GN6429@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-S+Bql8BV08M+myTnY9cu"
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

--=-S+Bql8BV08M+myTnY9cu
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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

Maybe we can find somebody whose OUI we can borrow, then we could define
that the namespace selector 0 within that OUI selects the radiotap
namespace rather than having an extra bit for it. I think that would be
simpler to parse and understand.

That way, we could do everything with a single bit. Since that takes
quite a bit of space (5 bytes plus padding for each switch) the reset
bit would be useful independently to reset within a namespace. It might
make sense to define it to have a field too, namely a u8 that indicates
which offset to reset to: field value * 32 (or 24 if you accept my other
proposal)

If there is somebody willing to donate part of their radiotap namespace,
having an "experimental" selector and a selectors for each OS would
probably be useful as well.

johannes

--=-S+Bql8BV08M+myTnY9cu
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIUAwUAR2AaG6Vg1VMiehFYAQJVwA/3cSFzF7eRX6tstS9LET2xEX1UmvP8BtcB
zqJwOIBZGCL9tPeCWH2N5pqmByk8SUtqsWXT8oqZJ/hsx9Acp/91QpkWXgQlZ1qH
2kRBwYHGPctE+4EhK5Zgkgm+F7bMCSts7eLZIHM3NfAFBJ4IjoT3hTVj1PhAKylZ
6DNkf65rzAj7D1600krK3kcNWEpVJFmj9vZe1XxsiQQGabO/p4pRM0YrJ1IfZTO0
kLXuW9v4DfNOcTjmfvMX3VbPGHyaF2lgqxqRLFUtio1PRubfglQMAySGeM2NKEmN
iv6tLR9kjstrgo8ebQwJdmNVJsTpuwfYodbqkBvEr6J49i+ZlUw7oFqRlYF/1qb+
Nvhj2DyilReSfRCMiF2q/R0k8mfPXo3A9oaTHOUG/59g5tJ61ODHW6mGQu7FkUqD
vkEQig6ebjyKEGu8lzYfIB3YuxWW6uzSSGJ87nHluLKJrBTqPdyJ13pC570haj3J
5igy36Fncb9aztMbw8QfAgY+7Mi5vP+TGtBbbXsRZGyCVlX1SH31x7tqHEjfMqUe
po2py6n33RY1XIvBeAz67267Fk9OGbSw1wgeE6iyASoP/prhRkyD4ZM4J6aFxgUY
4ifU7bstuKsgYdetUdwbTMWdye7dkDDaciL5IO2xTWBKBYb6TxZJTqU2OSOIfot+
C+6yBV+SQg==
=dWGA
-----END PGP SIGNATURE-----

--=-S+Bql8BV08M+myTnY9cu--
