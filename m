From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 22:05:20 +0200
Message-ID: <1213905920.8967.103.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
	 <1213898387.8967.54.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HsRqJocAOBBzyzMIZtyM"
In-Reply-To: <1213898387.8967.54.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

--=-HsRqJocAOBBzyzMIZtyM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> I just noticed that at least wireshark also defines two non-standard
> bits for the 'flags' field (field bit 1):
>=20
> =EF=BB=BF#define IEEE80211_RADIOTAP_F_BADFCS     0x40    /* does not pass=
 FCS check */

Incidentally, the RX flags (field 14) have a flag for that too... Should
we remove that from the proposal and use this one instead so we don't
upset even more people?

johannes

--=-HsRqJocAOBBzyzMIZtyM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWrv8AAoJEKVg1VMiehFYtZoP/jFeAcEG5W5CLJ9lebEWZL9K
SARfGIBnKkrlCYn+6gOt4Wtvt+KN1QCqbvw09GnpA/wgehwNjzfpjfkLjYrPo9AS
fE+YJZ4K8CxhHGdZgeLqkcliyFcHgjg3k1tZoR3+eFdrcZ29zQOHrZFHUOdesd3F
mZNi42NV9UyvUOuaPZqV+Ey6WRN2qZ9RL/SmLHnW/m8X3mEdSNsKdnl1q7DtPKhO
hLy7z2IED061M+SkdKv4mRjc7hqTkd2ewTi5+4eOj3camVwXzTWBiVIjLiZ6QBep
xL6fuycDwfVAH7ioTMl9VpOUKta4afM10IbDeuZLVqJEqrwhbZfB5FNmfvfwShXP
Yy4HiwW+oTt2Vf8xpWp4Pm5utgAmjK/U8QN86uttWK37AWYOI6zYmHI/rtR+YxzN
QWlL7zqZbEPFV/x+e27JBbCxF1NGL65VAc40tFOBLO/k6plSRX9Nfj4TcYYMAdvM
6skDY7K/RX/DCf8bfgc9TlzpI+WaqJLRSA5A+7Ra2lO0EIJPgFEcu4/AqxCtEBSi
e7RZduB95RWKPQyvF/EUotYLO8ohod1wawvjSUJ7vSlCA8MS5qRnAWXPzeqRrUfj
JClpWz5GueZhBUMGuLp4QCL4k9VMueTY3ULA3XRi2ipi0Pv8ZSGFmg0ctIeYkUP7
f54RNPmPE/I9u5ZP53VH
=XlqB
-----END PGP SIGNATURE-----

--=-HsRqJocAOBBzyzMIZtyM--
