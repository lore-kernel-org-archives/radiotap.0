From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 21:59:58 +0200
Message-ID: <1213905598.8967.97.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
	 <20080619185646.GA17738@che.ojctech.com>
	 <1213902633.8967.84.camel@johannes.berg>  <485AB49B.4080403@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6vSjyai3/sdSchCXW7Nl"
In-Reply-To: <485AB49B.4080403-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

--=-6vSjyai3/sdSchCXW7Nl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 12:33 -0700, Guy Harris wrote:
> Johannes Berg wrote:
>=20
> > Problem is, wireshark actually takes bit 14 to mean "FCS in header".
> > Easily changed though if Gerald is willing to take such a patch, I can
> > cook up a patch to make it parse the fields above.
>=20
> OpenBSD defines 14 as IEEE80211_RADIOTAP_FCS.  However, a search through=20
> the top-of-CVS-tree OpenBSD kernel code shows nothing that *uses* that=20
> presence bit, and neither top-of-tree FreeBSD nor NetBSD use it (I=20
> assume from what Sam Leffler said that no FreeBSD release did, and given=20
> that NetBSD uses it for other purposes I assume no NetBSD release did),=20
> and I assume, given that you're proposing this, that Linux doesn't use=20
> it for that purpose.

Ok, cool. Yes, we use the RX flags meaning for bit 14. I guess we
shouldn't have started doing that but that stuff was there before I
understood the issue.

johannes

--=-6vSjyai3/sdSchCXW7Nl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWrq6AAoJEKVg1VMiehFYXzIQAMFukfqdp/4VsMpATGdAO15K
TT3+7cRxzWQZ7mZUInTmNZrbQDFGtI2iEltVaGrAXIauh3v6D/y8z9W3ntjaCm76
ymtzbC7uvBZEeBl4u+SVxR2fRoTSDxbIq/0T2hhB4IMQGPyNEsQo7wcFjPMSKCDe
sgJ1srIMy9aqJiXsfBfC0Wu3HfqJ6p6BHYk3GpF6inZB+0R7usmQCCGNOxq7jfzC
1QxAusdsRajVy7nzscUGeZidb5hl1ZtU7UnJrctkC/ppWFnot5Epg2eGrJ2MjXPg
hBvugZ0IRRt7z5rFvCJFK7qgsqwbhrp40aIKS07b6Q/sPWryCtP1YK9JlaTGbjSh
Q76zgMKTkjA/gtBk/B7Bl7NDvPpH8m0F6K8zm78hFzDQSx9cr4H+UrVEPRcGHggI
Jif01iosk7n7TIIUbFY5/qRDQzmMF4kqentSkDrSHQrS5/vtCGHJylg1pX89usu3
wXDuP5VmLiHxtV29jCytmXxFcdwEMZK/BRrhkKXf8qrkUV7ZLroGl5WhnbnXuZCS
VpQMbDS7GBiRZLjC1BJLGFO/WRSn1z/pJktTS3JE31iR52Rf1SonipLvk7cuk9JS
HYat5FUCz70B8mEuRUqHnYBxH9ptSi2ko3Nxw286Lv4swYbJ5VW3gzJPxjtGzDzs
dr384wT7hwFNMN1txz+z
=4MqG
-----END PGP SIGNATURE-----

--=-6vSjyai3/sdSchCXW7Nl--
