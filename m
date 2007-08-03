From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: new RX flag request: bad PLCP
Date: Fri, 03 Aug 2007 23:28:31 +0200
Message-ID: <1186176511.13315.2.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-T2kazIWXPTAWtu/YbAyE"
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

--=-T2kazIWXPTAWtu/YbAyE
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Some people actually want to see frames their microwave sends; thus we
need a flag to indicate that the PLCP checksum failed. I thus propose:

/* frame failed PLCP check; for the benefit of older software (and
 * because it is most likely true) you should also set the BADFCS flag) */
#define IEEE80211_RADIOTAP_F_RX_BADPLCPCHECK  0x0002  /* frame failed PLCP =
check */

Comments?

johannes

--=-T2kazIWXPTAWtu/YbAyE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBGs53//ETPhpq3jKURAvjoAJ44JvMIudt8QWp/xSIY/Sl6umIiwQCfZMgN
JSB/oI4bcNSs7imZh/l42/8=
=v35n
-----END PGP SIGNATURE-----

--=-T2kazIWXPTAWtu/YbAyE--
