From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 20:18:49 +0200
Message-ID: <1213899529.8967.62.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>  <1213899201.2530.12.camel@dv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vNP3Hv82PMp3YMmclXqw"
In-Reply-To: <1213899201.2530.12.camel@dv>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>, radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-vNP3Hv82PMp3YMmclXqw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 14:13 -0400, Pavel Roskin wrote:
> On Thu, 2008-06-19 at 19:44 +0200, Johannes Berg wrote:
> > Ok, I tried collecting all the information, and here's what I found so
> > far:
> >=20
> > http://www.radiotap.org/suggested-fields
> >=20
> > Bits 14, 15 and 16 are defined twice.
>=20
> If we call those fields "suggested", we deceive ourselves.  Suggested
> fields should not come with bit numbers.  There bit numbers should be
> assigned only when the suggestion is accepted.

Well, yes, but it seemed prudent to not introduce a third
"used-but-not-standardised" category and these bit numbers reflect the
fact that they are indeed used with those bit numbers in varying OSes.

I hope the audience of this website is smart enough to realise that.

> Perhaps you could add your proposal without a bit number and then ask
> for the numbers to be assigned?  If 19 is the lowest uncontested number,
> then it would be assigned.
>=20
> There is no need to wait with your proposals until the contested fields
> controversy is resolved.

Well, I don't have a proposal yet, those fields that are there are
sufficient if we also accept the vendor-namespaces idea that I'm just
trying to put into understandable words.

johannes

--=-vNP3Hv82PMp3YMmclXqw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWqMGAAoJEKVg1VMiehFYfxUQAKG2CBhZxVLt8s8rDF+Sc4bb
yktHcuL0FXsRj2CnGl2ZhfYvwVb8XuZLSYMVNdEYFsk2pKK6xMwSl0q5lERkGIVn
rix2qSoa4PZE0TSZiIl+mjYWH9Sk1Ix7VMiwyvzFSLiwtWje+973sm5SOJeWeF/a
QM4IRfW9AUvBsLo2Y3mXeJ45jxJjSPTxI4GMamxgDj5nrmSdcSuZcx+hIYah9pi0
XOkk+DB4Ugx6oveZNbZnj0mNFTFkg4GnRvOgLecIXQ7DlUDsdp6+g9xSKPyDWVj/
bQgFmxA6drRrysO/yC/ii0wOp4UzKoUDOZl69T0P5l2soDMaJxC0JaU40/2w7mU2
YeJOvDuVGVWANppbfc6ibqPhReG4c3YQP3tVZgvgSuopcvH08z9B6l7CjAejj5fQ
Stglqvpm0hNFJvx+Y8ukcNuSJ40s5cCK6nGwoFBkMuMyJKMcrINJEQe4KCT6Njqv
0Yk5sd/zU0jOiJ1qsFtxOPtDMFp6Qnoh8by0mNIS9u7R9lVdPAW4pnzUJEMNNuAt
NVK5+l9OmkqC7YyOF35WKcJvNyXnsVavJSt+94JJIzn8gWRQODTB4M1ZigPYfMtJ
H2t01nuHmzv1NMvLpYuHHtN76EZwaBDMLd+xne9u2ZSkSbHaQj0au6zk22iHNlF1
uUGhEHniLGgovYDRFYFl
=V0Xg
-----END PGP SIGNATURE-----

--=-vNP3Hv82PMp3YMmclXqw--
