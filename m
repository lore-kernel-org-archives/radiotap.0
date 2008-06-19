From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: outgoing interface field
Date: Thu, 19 Jun 2008 21:44:14 +0200
Message-ID: <1213904654.8967.96.camel@johannes.berg>
References: <1213903728.8967.92.camel@johannes.berg>
	 <1213904505.3240.27.camel@dv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Dfzk2lPTQm2ZKwpuHWy9"
In-Reply-To: <1213904505.3240.27.camel@dv>
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
Cc: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org, "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-Dfzk2lPTQm2ZKwpuHWy9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> Are you injecting by sending data to a socket?  I think the sockets are
> bound to VAPs, not to PHYs since VAPs are seen as network devices.

Yes. The socket is bound to a _cooked monitor_ interface.

> Besides, are you going to serve more than one VAP with one socket?  I
> would not do it without a good reason.  I think ioctl on the socket
> would be an easier solution, as it needs to be done once per VAP, not
> once per packet.

Well, yes, of course we're going to serve multiple BSSes with one socket
if they're all associated to one physical interface. Why not? It makes
the code much cleaner and nicer. Why do you think I need a good reason
to do this? I think you need a good reason _not to_ and this isn't a
good reason. Besides, ioctls suck.

> >  Further uses would be to use, for
> > data frames, the fragmentation/RTS threshold from the given interface.
> >=20
> > I don't, off-hand, see any other OS requiring this, so I'm shopping
> > around asking vendors if I can have part of their vendor OUI namespace
> > (one of the sub-namespaces) for Linux, but if anybody sees value in suc=
h
> > a field for other OSes we can also add it to the standard.
>=20
> We could probably register an official Linux OUI for that if the code is
> intended for Linux.

Who'd pay for it, and why bother to pollute the OUI namespace with
something we're not using elsewhere?

johannes

--=-Dfzk2lPTQm2ZKwpuHWy9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWrcKAAoJEKVg1VMiehFYCMUQAL1gBsHjvSVkTONXABA6b9X/
UmgiVYf7D5gV9ziJqDhQzCMDxjd3Jrcxf85BuhFR7k6F8EDJXVuxa5X5KktQalgv
NUNQQGSqPpBKYhSKPNtt//zSXC3cZ36yHeOfp/NMRHs9LrlOONYXCpO9ffL6uxWD
53CtwFvcPARKjfoQnhLOlseuBK9ysBlOEiL0SnwyvHG6Ik/0rhmtoRj+lzK759VL
Vhq6pZiDKKzfOKhRuwb6KkEAYRZSeagA1WQeScjUnH0I8KUSUq1dawIFJ3sSz+ED
DjtMBbK5YaBmzZ37K7g71LuVJmYLWJ34sKVVGEM/2MR+YtsAteIuY+YfhNhX+qVa
lNFvfItlxloiCbJ4b3nhAhZUlAatVcFxSAXnfvb8ywd+EwzVxLsC0UpitpmKeflA
RS+nZ9gWQU9qyrO7N5FLVE2smxy+8mDQXEaFISowXGL9s/3XksdUVwAEfQxavkqw
Q+y5X6F8I08nyJ0KkZMWK1L/So2IoLDC0ilqzhayTcHMgYjQcD1YpjMmoTscvt0C
BfJMTH76BDbJi0lHxGRWVTZAo9jX3Z9YGGVenNpIbvffJS+jMlTZb+mE0QlpNx+G
rVuGzlW0Dg0Z0apdTfudajlsS3hocHFSden0kTzrpJ6Chqdl5zsi6z3x8AYXTXtS
ovnYivQLl4jZTPl/8Prq
=/DlV
-----END PGP SIGNATURE-----

--=-Dfzk2lPTQm2ZKwpuHWy9--
