From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: naming conventions for "fixed" and "floating" bits
Date: Thu, 19 Jun 2008 20:54:42 +0200
Message-ID: <1213901682.8967.74.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hTSejbJyoFzDPhLRk2JS"
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-hTSejbJyoFzDPhLRk2JS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

When we were discussing the namespace bits 29 and 30 we really all knew
we meant that those bits are reserved in _every_ 32-bit it_present value
like the extension flag 31, not just reserved as field numbers.

Would anybody object to adopting the naming convention that the "fixed"
bits be called "flags" and the "floating" bits be called "field
indicators", or similar?

johannes

--=-hTSejbJyoFzDPhLRk2JS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWqtsAAoJEKVg1VMiehFYBoMP/isqqU507bZSaaSFyzqJUc3E
UVbw82HMJRAGhdZ4rXQUR75wt97yTyIdXQm5fAASTU2EmBoV8Jn0ZRFX3pGwqxfq
sS7K9Ti3+y4y3ZJ47q5vMMX5mtTuYFKpQm4iXKznUmrRcnpfigLaKy/FN1wZ55gD
7jbl8cL+xz+0uKVz+lupdb5EKRvKke2iKoCwWBQg9hBS2sFPZkeeVdvL9ybUUQ12
DPMn88DFxZgvj/obH57QMe7a86V8Y4oLJJZP7PqgNkUCivQFh3bpSb5UnAcwIe1L
3vlGfEilwGpc9NAlOVZs3dY4wIYfeF+W/qSD71dmiXUEqf6+7GIPbmuYlBcuMt61
gVWu654+XB5dxvJossD0tfnbJ8l6irI/fZ4kC+YaNxaQXXziFR6ZWqdVzF8sUAnS
c+O4AGguEJ4TwiBvwK2ycNX0rcbs2pL4KrvtgtbzOfRKAULda0lKn/UsBx3Ixbm4
PGKT19X4q1MphDqxJqG0l2pqLO8fbncSAOLr2t32prTgHrzHQv5+G/QiSl9Uk+iK
UV7N8IbKadgmPvYHA1L7aztG0P1adGMo92B8wfw56xQQWAW+FacxkRI68Lf/KAA0
bIMg4Nla6hvf/9y4ucnea7uH2FAjQS7VSkXVnod4Cd1harjFJxoDHM6fwbxQZBNv
hBIr2Glql9zXtgKyI0xD
=6ofD
-----END PGP SIGNATURE-----

--=-hTSejbJyoFzDPhLRk2JS--
