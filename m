From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 01 Dec 2009 10:16:51 +0100
Message-ID: <1259659011.32171.45.camel@johannes.local>
References: <1259258152.32372.90.camel@johannes.local>
	 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-QCzttB8Q2u+b3Omi+50W"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <d521a2310911301441l3c5503b5hf43d31a47e83fe4b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-QCzttB8Q2u+b3Omi+50W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joshua,

> For the structure of the vendor space, you extend 'skip_length' from 8
> bits to 16 bits.
> > Structure
> >        u8 OUI[3], u8 sub_namespace, __le16 skip_length
> I'm neutral on that. My question is why not extend 'sub_namespace' to
> 16 bits too?=20

I don't see much point in having more than 255 sub-namespaces per OUI,
do you?

> I hardly see that a vendor extension part can go over 255
> bytes. But if that happens, it's quite likely that the extension may
> contain more than 8 fields.

Where are you taking 8 fields from? After the vendor extensions bit, the
vendor extension puts vendor-defined presence bits into the it_present
bitmap. Therefore, you have an unlimited number of fields per vendor
sub-namespace, as such I see little reason to support more than 255
sub-namespaces.

johannes

--=-QCzttB8Q2u+b3Omi+50W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLFN7/AAoJEODzc/N7+QmagfoP/joDOyiVpAea6q9C3U3HTnY0
uCfo+2HdhGyiN4D/dJeulriTfJs4zt//do+woV6NvpriGn4pLuy+sZV7Z8YBYJg5
VhnZrdmTzsxjjZX3LE7ZiuN0wGUMSw4tZCBj5xl9slmilrqYx/PP77RLJ6+diz1m
8XFMLyhEFk9aq1wzKwFcAEseKCv4aDzAR4e0l4fZKr1pZPJc3WkiEVjzVS0S01lV
I+35i/zlPKur21lZGQ++DZWXAnMPKrYgJgEQA3wIQQrIsqgtirTvdGReRA6kMNvo
Cgo3FOlrsMteGc6OqkkaGe6/FoMRzsgF5xoPszZYxEqxTcDNhH7ufZo/Sb+Clah/
2YYdYFcV7CLnyc+aF8dkTDODnQpNpNl6NPAYiUz2H5MYDbhRO2TgDvTtC7NS949n
xLnVQ0Xzdp2UDY2tNwsGEvw5n70OVZul1Q84IGATO1q1D79F6X7NgiI4ck6H6v6Q
strcZQ4+sRuYgHy83+Lb6wyQaYT8uBXiAl5T3rh8434QTXvuy8iHJCbdNjsPFwmP
AK47yMcyLhAnLMKCsjOP9ZT32aZTZiGtWFek/P3UfJwhYGx0geZ1QWdgsT71Udk4
+eYPSj/eBumAWZe5bDpUw2uLke2eCZRiPlzWzllIz9rHxPruzw5H3m+sROp0hdWR
HmwELQgcsuP7ryYKz64M
=Eemc
-----END PGP SIGNATURE-----

--=-QCzttB8Q2u+b3Omi+50W--
