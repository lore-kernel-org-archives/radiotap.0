From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Wed, 27 Jan 2010 10:36:05 +0100
Message-ID: <1264584965.25642.15.camel@johannes.local>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <20100126174728.GV1060@ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-4K/pZ998/AyWwxyk3wQi"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20100126174728.GV1060-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-4K/pZ998/AyWwxyk3wQi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-01-26 at 11:47 -0600, David Young wrote:

> FreeBSD uses the flags field and the channel flags to indicate Short
> GI and 40 MHz frames.  Let's adopt the FreeBSD definitions for that
> purpose.

I'd mostly agree, but I'm not sure what they really use the 40MHz flag
for. For instance, might there be value in knowing that the AP opened
the channel for 40MHz, but for some reason we are doing 20MHz
transmissions instead? And would this be an appropriate way of
conferring that information?

johannes

--=-4K/pZ998/AyWwxyk3wQi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLYAkCAAoJEODzc/N7+QmaMQgP/iQ/JPYOoH3oZM/Ge5Lg9eQ/
akCg60Mq0/IGY0aTlHi+0/ThNmamCseT59jfH2MLJH10OpJ+DDK2NDohuaWaUll7
NuxbI0yuLACJhw7qNDhvfFHTF6mGtlNv8PNIX2gTqBlhi5jhL0paXpCv6ulxce+P
infDvDz/5iTh44OStHFM/cFDluPoKndDI3AMUM9QNo8WW+9dH7hEDohgm9nC+zby
eiOTfCEt7SZyQL143RvDPqrU9CcnNwaDRyZ4rvC2qIkD0wyXhg0THP9Jfazq/w34
j8zCgIK+lFfu9rQgH/GShbsy/qrkgIYqWLh09Njjl8v4YGhfvwGE3WnrRpznsWaF
87+5IGdu4/KQV9yq6GOFsfR6mERVr0kuXjbuY1pQbc+J3V+It9IbK9MfTsWlWGmO
wFWZFipDJSNLPBk/UG5iPHv04n7OdIxh/H6UGqz9F4IA5EVo0tdJQIhUedXng4XE
XYKs0N0hLZiALNYw74EUayzqjmkuNKr0PbGD6Pqt3Kww6Sg5qh8o9h/2w1/8+Y0M
RM8z/aWKC29O7G7l0IP1yXw2VtOQxOxAoG85vBW7JGWELVryhMsRMJN1DRUocp4B
7oU49azfdJJDfMWYArdE7IneUBXxGcNxUoJryqUNHO68og5wFxssml/44JTc1fzo
4+VoHpqRVCixKp6NL6hu
=BV2F
-----END PGP SIGNATURE-----

--=-4K/pZ998/AyWwxyk3wQi--
