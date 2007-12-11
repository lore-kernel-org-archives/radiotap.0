From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: rfc: "canonical" radiotap parser
Date: Tue, 11 Dec 2007 22:38:18 +0100
Message-ID: <1197409098.6558.18.camel@johannes.berg>
References: <20071207045545.GO3568@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HiKgrUYicov9KavmuAl8"
In-Reply-To: <20071207045545.GO3568-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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
Cc: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

--=-HiKgrUYicov9KavmuAl8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Thu, 2007-12-06 at 22:55 -0600, David Young wrote:
> At <http://svn.cuwireless.net/svn/cuw/trunk/src/radiotap/> is the radiota=
p

Another thing, I think it has endianness issues. Have you tested on big
endian platforms?

        case IEEE80211_RADIOTAP_LOCK_QUALITY:
        case IEEE80211_RADIOTAP_TX_ATTENUATION:
        case IEEE80211_RADIOTAP_DB_TX_ATTENUATION:
                printf("%s %" PRIu16 " ", fi->fi_shortdesc,
f->f_u16[0]);
                break;

That looks like it should have a conversion.

Also, here's an ambiguity in the standard:

 * IEEE80211_RADIOTAP_FHSS              uint16_t        see below
 *
 *      For frequency-hopping radios, the hop set (first byte)
 *      and pattern (second byte).

first/second byte is not really defined, I think this should be defined
as 2x uint8_t.

FWIW, I'm working on per-field pages on the wiki.

johannes

--=-HiKgrUYicov9KavmuAl8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUAR18DSaVg1VMiehFYAQLy5Q/9Gd/pOqvUfIbnZbdoRR0fqkwXRnQNRoOZ
k7BIGs64LwbH9AudTdlv//R08a/Jf2UaDRv1w5LNv9UDryJXL4ZV2/i0NTzC/7W0
FgoH93buLhbftXykFk1dCh/HHjnyGYYRYFXoR2rAhXyuG4pcnN2H90HhA1HsgtHA
mB99zH69a+ySMhQHm584MMKe6moyZvVi0j8ptMXmz6CEZ+W2oyQ05eO2ol7cXQnM
GS00KXVZDqot3bJi098Y1gpaIqpeXsHH5mjZGAqC5oEhQtHhUKhEI5Uvnjc58XQG
2u2o+G5UnfYB6YNQ8JNCpxvPBfS2V0tjLW3l2LhgLQ83s82468cWpqLV8Nsl2Ibu
lBkiQRRk7MgObOmiGThu0gUgBMvAic4ANjmhWMjFk3eL8XIuMsfn+wXRycPl3wCu
0Ak3kBys5oUkPanqhWnN3VDlyT9Sh22Cmr2wueeWbBn+xFNMOAis9jqz5fcGmsc4
0twhxCvzAnKFZBpxYysVnXvdSqCsdSZ3xl9iiVrd+Lu3rb7QtxiT/ZV96Ybub8Vz
8fz2bcbQ+DwtNiC7o6tw/m06pTCeeuzArZkutlR5XIwplJSxo9RE7YjLZb8Xr2gx
ygdyqWA2O+6CqlYzghgLeaUCtgvCm+DRdJZVwYJS3Z9IkukAqTAEjMzr1h0S2/5I
j/2H+gjuVTA=
=OLsX
-----END PGP SIGNATURE-----

--=-HiKgrUYicov9KavmuAl8--
