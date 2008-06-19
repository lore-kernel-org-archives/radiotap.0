From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 18:13:17 +0200
Message-ID: <1213891997.8967.38.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
	 <1189668582.6161.91.camel@johannes.berg>
	 <20071007235551.GN6429@che.ojctech.com>
	 <1191836708.4063.17.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-RHBUuVehBqVJX1Q98mdN"
In-Reply-To: <1191836708.4063.17.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

--=-RHBUuVehBqVJX1Q98mdN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> > My problem with #2 right now is that you and I are acting as stronger
> > advocates for the folks who adopted conflicting radiotap numbers than
> > they themselves are.  Meanwhile, v0 has some momentum: FreeBSD has
> > introduced useful new fields, FreeBSD and NetBSD are in agreement,
> > and there are NO interpreters in tcpdump or in wireshark for any field
> > past 15.  Let's stick with v0 until somebody objects.
>=20
> Ok. I just need a bunch of fields in the Linux code for injection
> purposes and am actually developing userspace code to parse/create
> these. Also, here I am actually using bit 14/15/16/17 as RX/TX flags,
> RTS/DATA retries. It would help much if we could go forward with hosting
> the radiotap header "on neutral ground" and standardise these fields, no
> matter how.
>=20
> > I propose to add two new presence bits, 29 and 30.  Let them both reset
> > the bitmap index to 0.  That is, the bits in following next 32-bit
> > presence word are interpreted as bits in 0..31, not n..31+n.  We must
> > use both of these bits in conjunction with the extension bit, bit 31,
> > or else they will have no effect.

Ping? Any news on this? Proper 11w implementation in Linux may require
Linux-specific fields to specify which interface a frame belongs to (ie.
which interface the code should use to look up keys etc.)

johannes

--=-RHBUuVehBqVJX1Q98mdN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWoWaAAoJEKVg1VMiehFY2M0P/2nID+BopASb9VH9KjxUWY6t
fvc3MPZBjxXLWx1ijlvutXNPYr9PUydcZUYLTEXquge3YbEIIGi+kZXJwdRbU/Eu
xaf9WT5Af6Zd0vWb72McaJzhbJ9eZfQYGZQ7uOgb3mFdLiCgJ7XY7iLUxD6y9iR1
7LR4kjgE1f4R9tq2WUpcQ2esE5ahwzT08pdt6tKnj8x3GxheRg2J4bV5/QNeeNgU
AFf0RQSJHsNKgaiTQjd2D/zUZSwxlqRMn0EnS9kQ7oQLUfziMToazaGHZuTeTQcd
dFqZPRb+Y9s8SeJ7/3ZZvs0ai7VGRJV0j5h+RS3YyXQnzwI++ammAfxr1pv/4bgk
wKUO4ODZaQN+qpxardNHVcVhtKnuVkxO7YjejyoKzNj0mVfccZGhwmVnqywLM4lA
tHb5k0LWDncgjjeF2hf5vsaiZhCBTplxlrcwfmw/Rhq/KF7S/UVUQYgmGvNesC2M
Rwsypujd1YTnlMzXPSeUFwsvy0ssa3/H63JCBtTq+DKdLbDnBnKsKT3LRLn42wkf
aHInk7g1FzL/SjhD9w0NMXDx0On5bsOZ5byhw9eXy4CR3XThmU1O5ahTcOUJGBpu
81N+8NQ7Hr3S+VD1mFEHctjVKZe36B0OnpTv9x4Bg5gKwdbl3GMtMhDXrKficqRt
Y4sAkeb6YXrlV28kft/n
=mhsl
-----END PGP SIGNATURE-----

--=-RHBUuVehBqVJX1Q98mdN--
