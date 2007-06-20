From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: radiotap for TX
Date: Wed, 20 Jun 2007 23:44:13 +0200
Message-ID: <1182375853.3714.103.camel__15631.6254557625$1216696514$gmane$org@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VUw67X+5RWkBi2VBNlrR"
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
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-VUw67X+5RWkBi2VBNlrR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hey,

I'm currently working on using radiotap for some stuff in the Linux
wireless stack (mac80211), and ran across the case where we want
userspace to be able to send the frame to a high-priority queue. I'm
thinking this should probably be in radiotap.

There are also other things that need to be controlled via radiotap,
here's what I can propose so far:

 * IEEE80211_RADIOTAP_SEND_AC		u8		access category
 *
 *	Indicates which access category to send the frame in, 0-3.
 *
 * IEEE80211_RADIOTAP_SEND_FLAGS	u8		flags
 *
   IEEE80211_RADIOTAP_SEND_FLAG_ENCRYPT (1<<0)
   /* encrypt with key for the station named in addr1 or default key */

   IEEE80211_RADIOTAP_SEND_FLAG_AUTO_RTSCTS (1<<1)
   /* automatically decide whether rts/cts are used, if unset then
    * rts/cts are used depending on IEEE80211_RADIOTAP_F_TX_{CTS,RTS} */

   IEEE80211_RADIOTAP_SEND_FLAG_RATE_CONTROL (1<<2)
   /* should rate control be applied to this algorithm? if not, take
    * the value of IEEE80211_RADIOTAP_RATE or lowest rate */

   IEEE80211_RADIOTAP_SEND_FLAG_SEQNR (1<<3)
   /* set if the sequence number in the packet shouldn't be changed,
    * if not set then the packet is sequence numbered properly */

So far that's all I would need, but some regular fields would also be
used like I said above for example IEEE80211_RADIOTAP_F_TX_{CTS,RTS}. A
good text on using radiotap for this purpose should probably be written,
I think somebody other than Andy and me was working on something like
this so we really should work together and define this properly.

johannes

--=-VUw67X+5RWkBi2VBNlrR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBGeZ+t/ETPhpq3jKURAhcGAKCWu20gdaLLh+sD6EyK/qxC+3gzIQCcCEzw
zwYr800yBk4dmZja3ZCaUGs=
=JeA7
-----END PGP SIGNATURE-----

--=-VUw67X+5RWkBi2VBNlrR--
