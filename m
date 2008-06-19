From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 20:41:17 +0200
Message-ID: <1213900878.8967.67.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
	 <1189668582.6161.91.camel@johannes.berg>
	 <20071007235551.GN6429@che.ojctech.com>
	 <1213899026.8967.56.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/te1Tlws8xfZPKzg2Sl3"
In-Reply-To: <1213899026.8967.56.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

--=-/te1Tlws8xfZPKzg2Sl3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> > I propose to add two new presence bits, 29 and 30.
> [...]
>=20
> I'm trying to capture this with examples here:
> http://www.radiotap.org/Discussion/Vendor-Extensions
>=20
> Look there in a bit.

Done. While writing that, I noticed that it is not strictly required to
reserve two bits in every it_present field and added the following under
a "Discussion" headline:

=EF=BB=BFThere is no need to reserve two bits in every it_present bitmap if=
 one
is willing to expend slightly more space for vendor namespaces: Say the
reset bit is 30 instead of 29 and vendor-namespace is a regular
free-running bit number (e.g. 20) that is reserved in every namespace.
Then, to switch into a vendor namespace, you first reset the radiotap
namespace to 0 using flagbit 30 and then switch to the vendor namespace
using a normal field (e.g. 20).

johannes

--=-/te1Tlws8xfZPKzg2Sl3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWqhKAAoJEKVg1VMiehFY6SYP/iwEmBQlebO3BVYHnbSeuzOl
WPNMbKJV+763iS1mlJdBdAhFXepB5TuNJV1QYsqD3jTvsCTNEV5J6ma0YN2AeK2A
w5rsAD+oIxfe4Rnx5xkOhDsiPDfC5hcA4U+TAniyPP3JtEFrsy6zZ7lqxdycgu5H
jnCkT6TFbNKYwAI4e9fmJrn10qy/s1WiUJm91mDmKqm5q9LR/o/9LCGXCaOxm5g+
Vn3ldhKpc+U2CRyjAgsfS6z5l6BOdEkelkMabK0rPt/4KVeRG4o+49npT0irU+te
0MwGHt4Y6UawSdvYlle/TTTtogubUGF/lXK9Kyj6Cn3NsVD4BYCvkKTXEotzy3lE
93/GW6qVU/PczytLx8E65XVn5EAdAL1rVYuOl59Vdx/MRTtPVZa002Q0sYZNcbPz
bIoCmPJ3/7Uu7f0APqNfsl2xlIb7WP0xRwMBJkgfytINuW1CFbQvoPkqkty278lZ
Luzt/gILqBQ5gU9rOPITRUFey/dDuBqJMHS3Thun44r7ZCiFvL4vsKehSVOPARvf
7rKGQvrdFDfiaRtmXA4Srd0WxeizF8WkTWRIyA0Zj7s0lSRT+YDZfVJXOOiHgoTX
FGSF2+BXqhIXS4Gm+cM0kPGwspJZpMtnps3OFR8h62UgkY61EdH28OlO3+s9fAGw
AlgCj1fouTEKKJYtdUMd
=JgdC
-----END PGP SIGNATURE-----

--=-/te1Tlws8xfZPKzg2Sl3--
