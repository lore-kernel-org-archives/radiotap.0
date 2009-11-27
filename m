From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS rate suggested field - how about aggregation
Date: Fri, 27 Nov 2009 10:22:11 +0100
Message-ID: <1259313731.5428.6.camel@johannes.local>
References: <43e72e890911261350yadfa099n2c9d44d2f30d4845@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-P8L+5QMrgG0Ed6UlfEIk"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <43e72e890911261350yadfa099n2c9d44d2f30d4845-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Matteo Croce <matteo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-P8L+5QMrgG0Ed6UlfEIk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-11-26 at 13:50 -0800, Luis R. Rodriguez wrote:
> Matteo added an MCS field as a suggested field:
>=20
> http://www.radiotap.org/suggested-fields/MCS

He was going to submit an RFA -- can we not jump that? :)

> Curious if anyone has thought about how to process aggregates though.

FWIW, I think MCS and aggregation is logically different although they
both belong to HT most of the time. Therefore, I think aggregates should
be handled in a different field.

johannes

--=-P8L+5QMrgG0Ed6UlfEIk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLD5o/AAoJEODzc/N7+QmaMa0P/1slSOB1HQAx0ZjVTzJcDV5F
ija6ceEZKUhlnuTeJ0h6Dmug/NpLwjlTcIeuNu9HzQYmGUkx8sxaJzkb3ptyITCI
W2lsifDd8lqr/g0zxwKBs0x+O7skOvTNxtRkl8pKZPPM2Jc4m3cjI/bK7KdXOt/p
qmWvIc45Tvt6i/pbWm3NLeCd69woLQF87WJV69UIRuw/Kvgb69s5TVebJ4iyRbar
wrJoYIl272maWukR5cge0tmtekMqlWtzAmue4xaOuoe/3KFOM0uO2W2PhFqsh1hp
mCRhHpkF0pWAdtD2lvigix8MvCDBvgfaPJS8+hmGrVIZBsvfAZbZZDj/c5+9itBi
qdsTwbiosAdnGbv83G3GZwLnlw4YAdfU4Q/VR+Fje9JZYGNFOgho23Q0zFNmGhTf
lXOSqjEEusUOlwbxoOTpjPgwvyaiETRy3uPReGagnswyfBIRTidAQX884phLjFKq
C/z4UL7/btEiTPdD6Mvm8nml30Gb0f7A5j1y5qgDHA5kMmp80VahU0rf2vZPvjBo
vsNiLk6raIOpLv/3X0uuVqGrFgYBw9lz0umpFNRc6HHCeUD7JOsoxoDMjXDf5YdR
sxGok0f/lt8AMdh7qkLxUPUufr248x3YrtBtSoFwmJLkOMlwSBovB1301UeOcZ7r
mByP84R7wWJJmUVOevjL
=sbG2
-----END PGP SIGNATURE-----

--=-P8L+5QMrgG0Ed6UlfEIk--
