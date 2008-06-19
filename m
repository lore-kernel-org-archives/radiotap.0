From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 20:37:28 +0200
Message-ID: <1213900649.8967.64.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
	 <1213898387.8967.54.camel@johannes.berg> <485AA531.4010408@wireshark.org>
	 <485AA6C3.8090303@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+Efcq6D57GKPuRSVFFBA"
In-Reply-To: <485AA6C3.8090303-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>, radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-+Efcq6D57GKPuRSVFFBA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 11:34 -0700, Guy Harris wrote:
> Gerald Combs wrote:
>=20
> > FreeBSD: http://www.freebsd.org/cgi/cvsweb.cgi/src/sys/net80211/ieee802=
11_radiotap.h
>=20
> In particular, note both bits, as well as the comment for=20
> IEEE80211_RADIOTAP_RATE:
>=20
>   * IEEE80211_RADIOTAP_RATE              uint8_t         500kb/s or index
>   *
>   *      Tx/Rx data rate.  If bit 0x80 is set then it represents an
>   *      an MCS index and not an IEEE rate.
>=20
> The BADFCS bit, and the comment for IEEE80211_RADIOTAP_RATE, but not the=20
> SHORTGI bit, are also in the NetBSD header:
>=20
> 	http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/net80211/ieee80211_radiotap.=
h
>=20
> OpenBSD has none of them.

Ok, thank you both, I had only checked out the respective man-pages.

johannes

--=-+Efcq6D57GKPuRSVFFBA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWqdkAAoJEKVg1VMiehFYoKkQAL2bYvTBRqkPsiaLf7DzCiOU
oS+O/5ZwP3/gSu917NymP5x5P3G6ngGlFi422Mz5UlYjFvhhI5HhtE9LOz4kYw5c
ghLeFRhTktMvRJmtB7z+8P/yI4oh058cJZmtYiufy+M2kU6MLLNLXS6EWGQKWXF/
TP1AuyB80zLgxeke1ukyGCJ1PQZiucht+14ag78iDefHQxZeiVZbzpTYJg1BrZcN
cyzoayZT+wr2rYkuDG55MFNzJa5nz2dXYfU1aq3jXmiyir7zI98RiOQTPyC5KyoH
RXEuAI4WRw8gtNZ9yMyHLJiZxqxKbdUcS2//ChOr/3yTBVoQTdGbZwwgh5XoOdZn
HYWuTAog8whMP1nrla6+FuzUCPq8ojdOKTwfLwhsPgjNr8G8wglVfcn0cIGqNCcE
AEbb8q1tksJhFMAgHPuPEl8u8EsyT5+NylAFibzeYxlnu01Pq0Ch0m1E+rxkjGWA
JNlsHsE9UIkO8Gu/hFyD9+DwjK4SB78CkMu1dG6u3vGtWNkYzYjMGUFwqpuAHmAU
h2b8tdWznQtaMfbcZbuZGtM7qepqXKlXKZ3f7THJ192V2vsDZZdDr8DOfboVynzg
0x+Rf0772L1966x1YHMBvODD/dCAse8zLKTi+MWPfUxziLWDoWBEsCmVbEVVniHx
WSNUXmi4wQcFUeCalKGJ
=pYn0
-----END PGP SIGNATURE-----

--=-+Efcq6D57GKPuRSVFFBA--
