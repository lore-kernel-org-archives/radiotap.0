From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 19:44:59 +0200
Message-ID: <1213897499.8967.46.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-XgGrXIsYsJgcmZQwqh6T"
In-Reply-To: <1188512214.7585.3.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-XgGrXIsYsJgcmZQwqh6T
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Ok, I tried collecting all the information, and here's what I found so
far:

http://www.radiotap.org/suggested-fields

Bits 14, 15 and 16 are defined twice.

Can we declare bits 14 through 18 reserved (i.e. may not be used) and
continue life at 19? Current parsers would have to be changed (the only
one I found is wireshark and internal ones like hostapd, Linux kernel)
to treat the presence of those bits to be an abort-condition and as an
error if there are any above them, current generators would have to stop
generating those fields over time and instead generate standardised
versions.

For me, of course, it would be more comfortable to stick with RX/TX
flags in 14/15 and RTS retries in 16, but since it's not widely used in
Linux yet I can easily discard them.

We need to reach a decision though, this is blocking further work on 11w
and AP mode in Linux. I'm willing to lead such an effort if you let me
"take over" maintainership of the standard.

johannes

--=-XgGrXIsYsJgcmZQwqh6T
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWpsYAAoJEKVg1VMiehFY/nQQAIWHeIiB/YyXVUTOFiJpE03n
nXLdlH7VWe11A6nNIHbDJTthJ5OH4PVxZt7ZwJbZEuM87PbDxACmsAtYlSbOOJ26
0Pr6ebN4kOmVe+Dfc0o+EG0Hf8/37mbnSrT9dnww2inhwaOoVFH8GltusQ2P6b1j
N7kY3fbaaDgZmmOKcZ9BDH2ypGLDP32JHShVWpTvJWr+q0mCG8GdNIwmy4CUpvJV
3Uuy4Qjdjee0gn4nfM2qBPKM0bHXvUmHL6lSUw262TZhKWMUu2zKxnH0gmMcIDlU
hhaU1vGLYCfyuV0u0+IT5J1TGk8ayQQF/gqsQ4xZutCqaFBteLqZE8/IrfBEQWg6
CnJFEWStzMItVOm+8erDLrRgyWLnD/f4TJ6nIdmksU2jhWZ9b4O6NSVi6Ql5d2Z8
+ibor9rAHk6xXMs7ii8fm36HevFolOtvgJTfNDiuqH/HUtrANRhUEbFMivgqgdyK
goXknxK0TOkWceU5KG5IuuShPKB7UUonyqNIQaQCibn9/N8d81qLmUSoZSo0B42n
4a1G+QcxgdqqtiuMH+TqO9qAENJ1wfaaMXwiYdOX6kQdxz0/7NTzwBbat5HXAyaq
o8qcZKHafht9rADmBS2E+c2ZoNGHFE8J8/BeMDzdWBUHiVltKZiKlDv9dn7VAm5e
tVab2ORAdkuB720MculB
=fWDh
-----END PGP SIGNATURE-----

--=-XgGrXIsYsJgcmZQwqh6T--
