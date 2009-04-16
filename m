From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Thu, 16 Apr 2009 19:28:30 +0200
Message-ID: <1239902910.26575.14.camel@johannes.local>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-bGqLbf/IdX87x8mPyN0E"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69e28c910904141733m72ce521ap8f1865bec991fff7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?G=E1bor?= Stefanik <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-bGqLbf/IdX87x8mPyN0E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-04-15 at 02:33 +0200, G=C3=A1bor Stefanik wrote:

>    - Define bit 1 (mask 0x0002) as "CTS-to-self protection",
>    - Define bit 2 (mask 0x0004) as "RTS/CTS handshake",

Since you're defining these for injection too I think it would be useful
to also define a way to _not_ use RTS or CTS, or define a way to use the
default that the device would use from dot11RTSThreshold for example.

Otherwise, when leaving out these bits, it wouldn't be clear whether
that means "do not use, overriding default" or "use default".

johannes

--=-bGqLbf/IdX87x8mPyN0E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJ52q8AAoJEKVg1VMiehFYzgkP/Ru5zliynmpnGgqdzU7CrWng
gsxzY4zpcrLUur9wXtvnaf0IvIY2c7Y2B5hXj8RUZaapG+c+mY+GTz98nithYnTC
SJWr1ES1MDWYNMrdUrNYzyFK8A7bhl92ffVSlD/qYo5cOgmfJeEPySsAaZnVvhWo
cf1oU+e5xneqw25XO/Bvzaj/M/cdFILACIfKjCOB1KJ5b0SRdd9aRjGDFwTaAWkD
TzUaCPPhyR8ATVDAKJlnQL+UVmB7BfNo210jO/qr39wNvIAUmR524Miv/zC8liH+
yDQ6lM5VKpLLL3NfwrpQdPi0SE/NN3kawVG9Gdmn+Exdekr9G+hpc94mW8cZXQbu
ClT0L9JdPydaeRBn/BSyOodn+tlXorof/TRtHChNB1jW/qFyOfMf0pd2qJjclQka
JPdSepIxFrUjDSFcjNib6smkE3ODzg9MAIsxhaR27Ctzcj6b1Ek65qdPTFgtmKel
miZ+vyDmcjenvPWqe3o97VleqEFjazXhM/xKCnpSPtb4M5ZgdUUKpwtNaf3XkWzZ
PDgKmI3jusXdMhsOrdhgPDyd5XQ1i2lc2Dok39FN6Ee+yZE4/AWutO503s/po6Xy
PI3fNQMx7IBCxZrN9AJYNzJVaevuAlRmtygUjIWt56gBemtmq802t5XiPU9wkAhj
23CaNgIGWojcTsYM0UKK
=5d6O
-----END PGP SIGNATURE-----

--=-bGqLbf/IdX87x8mPyN0E--

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
