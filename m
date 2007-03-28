From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: PLCP header information (was: Re: [PATCH] zd1211rw-mac80211: Fix
 for monitor mode bug)
Date: Wed, 28 Mar 2007 12:18:42 +0200
Message-ID: <1175077122.5151.43.camel__21651.673972565$1216696505$gmane$org@johannes.berg>
References: <20070325231817.9C5887B409F@zog.reactivated.net>
	 <200703262239.07013.mb@bu3sch.de> <1175073595.5151.28.camel@johannes.berg>
	 <200703281155.52208.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-oX1+TeLDf4ofHViDVkXa"
In-Reply-To: <200703281155.52208.mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Cc: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>, Jiri Benc <jbenc-AlSwsSmVLrQ@public.gmane.org>, Daniel Drake <dsd-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kune-hUSrv6EASfkEnNRfnnE9gw@public.gmane.org, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

--=-oX1+TeLDf4ofHViDVkXa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2007-03-28 at 11:55 +0200, Michael Buesch wrote:

> I think we need at least two "stages" for this config.
> One that says: Get all packets with bad FCS
> And one that says: Get all packets with bad FCS and everything else
> that looks like a signal, which is probably your microwave oven, though.

I agree.

> So, when these packets are passed up the stack the PLCP is stripped.
> I think we should make the stack aware of the PLCP (and add an RX flag
> PLCP_available) so that it is able to check the PLCP checksum.
> Otherwise the only way to detect your microwave oven from the packet
> stream would be failed FCS. Which would also most likely failed then, but
> I think it's probably useful for the user to see the PLCP, too, on
> a mon interface.
>=20
> So we need RX flags "PLCP_available" and "Not_checksummed".

Also "PLCP checksummed" or such. And we need to think about how we
represent the PLCP in radiotap.

The PLCP header has different lengths depending on the type of PHY used,
for Clause 17 (A) it is 40 bits, for the others (I think) it is 48 bits.
For N I think the whole notion was changed a bit with the stuff being
defined in terms of microseconds and not bits.

It'd be useful to make this part of radiotap but it'd need a length byte
too. I propose always padding it to a multiple of 8 bytes with a length
byte as the first byte.

For mac80211, we'd add a new item s16 plcp offset that tells us where in
the radiotap header that the driver generated the plcp header can be
found so that in the RX path we don't need to parse the radiotap header
to find the PLCP if necessary.

johannes

--=-oX1+TeLDf4ofHViDVkXa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBGCkEC/ETPhpq3jKURArGoAKCnmjXZCvmgDh8Kqt1TCqSg3BFV+wCgtTl/
+spbR8U09UWATK1VjxvWMRI=
=Lh8g
-----END PGP SIGNATURE-----

--=-oX1+TeLDf4ofHViDVkXa--
