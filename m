From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 20:43:03 +0200
Message-ID: <1213900983.8967.70.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>  <1213899201.2530.12.camel@dv>
	 <1213899529.8967.62.camel@johannes.berg>  <1213900799.3240.15.camel@dv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+MVaNuo+4SlOkaUuYORk"
In-Reply-To: <1213900799.3240.15.camel@dv>
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

--=-+MVaNuo+4SlOkaUuYORk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> > Well, yes, but it seemed prudent to not introduce a third
> > "used-but-not-standardised" category and these bit numbers reflect the
> > fact that they are indeed used with those bit numbers in varying OSes.
>=20
> OK.  And proper proposals should have "unassigned" under "Bit Number".

Yeah, I'll add a note.

> > I hope the audience of this website is smart enough to realise that.
>=20
> Sure, but the contested fields set a bad example.  It may be better to
> write "don't do it again" in some places.

Ok :)

> > Well, I don't have a proposal yet, those fields that are there are
> > sufficient if we also accept the vendor-namespaces idea that I'm just
> > trying to put into understandable words.
>=20
> There should be a local/testing/vendor area or bit numbers so that the
> proposals can be tested before they are submitted.  Another approach
> would be to have an extra header consisting of items in the format like:

[...]

Dave had come up with a different proposal which I just captured on the
wiki at http://www.radiotap.org/Discussion/Vendor-Extensions

johannes

--=-+MVaNuo+4SlOkaUuYORk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWqizAAoJEKVg1VMiehFYJ2YQAKLh96hpDfpI0aHdhGHdjqM4
+Y5K8xcPuIAlCwTx5QQFD8amKMaIxXC///stEUCSo1+VeDmkI3Z6ozUuCl1qE2dF
o0+EiBwNzuxLLKI1V9W1GvjmJbun44E8aBAfhNdLxTyYJ63qU5dYL2sLEW4B2AUM
uTaQXW/rj2/EyJ9sWJTt46yd77cYXvKGpot3LuQH4M/t0PD0p4fi+mKjSYkz9I6y
bP/drSeDm8/hqlZMHiwhjK4C+6/mwD2IXjncf3XWGQ/yF+H9FDOXedA60YXTcvto
hULEc4lJlN5jb2fFHYRLkEj7/XFupWZEfc4boGup3Adn2bWiy5udwpEmz8J3lDeb
/JxHc0n5NOwlJKfARfyf+aR5G5PyDE/rbo+xgaIAcfvtvn/qBzPGWY2Wx1d0USP/
HYSxEzIQWAiwqnUju49/cGQ+fnTgDKE63/UHzwLvITnsSAw89BdODpyun8teT0Kx
VtY1kXOSRBclXiMBywhyFoyOuwxRSRor55Nqw+fVNiepTc2QXjqxQvKq6CvixY0g
17zGpFRGLBYWnev+og7v7owJePPjw9Fx0lL00cmTYimq657INalrv24eWkYRtsB9
DVEJcU/b1QyZjAhwZDHsHcTeH7P8FXW13tWZuoKreHgeYoq55NCc8kXuUJ8GZTWd
2YD6hQg9r+cDNxY8fBgl
=ZMma
-----END PGP SIGNATURE-----

--=-+MVaNuo+4SlOkaUuYORk--
