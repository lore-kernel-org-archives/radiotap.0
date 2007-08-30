From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: use of radiotap bit 14?
Date: Fri, 31 Aug 2007 00:16:54 +0200
Message-ID: <1188512214.7585.3.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-p9ZoxseOC57Ey2lXxZew"
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
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-p9ZoxseOC57Ey2lXxZew
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Our radiotap header in Linux defines bit 14 as
IEEE80211_RADIOTAP_RX_FLAGS; however running wireshark on it tells me
that this bit means "FCS in header". Does anybody know which use is
correct, if any?

Maybe we should simply skip to bit 32 or something and start redefining
things properly?

johannes

--=-p9ZoxseOC57Ey2lXxZew
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBG10HV/ETPhpq3jKURAme3AJ4grp/Cd1nz2K+iz3CRJu4UlSRsWQCgsWS8
KmFwsT34gTqMCnXjMAhIWWA=
=jPBE
-----END PGP SIGNATURE-----

--=-p9ZoxseOC57Ey2lXxZew--
