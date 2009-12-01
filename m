From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Wed, 02 Dec 2009 00:11:16 +0100
Message-ID: <1259709076.32171.133.camel@johannes.local>
References: <1259258152.32372.90.camel@johannes.local>
	 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
	 <1259659011.32171.45.camel@johannes.local> <4B154CD4.8020700@wireshark.org>
	 <43e72e890912011337l704c68ebscea8fd23160f7a8b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-zmPcCzsCW7sJs0dhvyjR"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <43e72e890912011337l704c68ebscea8fd23160f7a8b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-zmPcCzsCW7sJs0dhvyjR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2009-12-01 at 13:37 -0800, Luis R. Rodriguez wrote:
> On Tue, Dec 1, 2009 at 9:05 AM, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org> wrote=
:
> > Johannes Berg wrote:
> >> Joshua,
> >>
> >>> For the structure of the vendor space, you extend 'skip_length' from =
8
> >>> bits to 16 bits.
> >>>> Structure
> >>>>        u8 OUI[3], u8 sub_namespace, __le16 skip_length
> >
> > What happens if someone without an OUI wants to add a vendor extension?
> > Do they need to purchase an OUI or IAB from the IEEE?
>=20
> No, you can use a locally administered OUI, there is a bit on the OUI
> you can use to mark this.

As we've discussed, I don't think this is true. The EUI-48 (or only MAC
address?) has such a bit along with the group bit, but it is not
inconceivable that OUIs could be assigned in that range for other uses.

johannes

--=-zmPcCzsCW7sJs0dhvyjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLFaKQAAoJEODzc/N7+QmaUa8QAMhFvii/uOniaFF2+u+HSZgc
W23/ZcPOeZqNf8uKpaq9LI7FcghUDD1AdJFkjxYGWXqZ/UkMLiYGsJ5+Bx45x7F/
1A/uronmLHsztg3RDVgxIrkSlO20E5E33nSZKxk75wZfshFNCKz28igQPs5KG3nI
PHpUZWfowsxDb73rQoSY9CGkFPqgkhIGxHP3N6w5hQafRwzfl5EOi9PRcGen6ACi
OoBt8qotDz/8QWujNY0VZP2+5SdMEOKC1CtBY9EVmXwsf2OKc/UQ9gFX3UCN8qKl
ZB6EueAG93/mhPnlz1RCFWP11ZxTGS7Rs6H39ubAC01z4ANrz6dpqxmfM6H5Pr0m
46F/oBzQgfkCZCzO54oII5opyCQTHA3hhDcqCo3wsRgE/2Qd1AYAa6EyCU/docwf
hWOJkHHncYK1m2zgbZAHanCK/TqPRb5JDxcM/MVAcIldRonRKpQVc2jyfTuXSpd1
8RnY20L7lKgEtfy7PR7AJziD+A9E5D4frB3GxSJqGjBAcUZ+Sn8qjR91Pz+2/Ia/
o7Ah84UO5JAqUPQiBJ4tueYw80OMp5RsyBOeKGrp1xVw+k+FkEAu6W0JbHNtpofv
Dy006qTsGIsejyUlR25h5/gGzlW3Iu9PY+hfwWz0dkd+KaVt05cfvo3MnTVm7Giy
ZhZ4VWcQskbUk4TzieCu
=uMDf
-----END PGP SIGNATURE-----

--=-zmPcCzsCW7sJs0dhvyjR--
