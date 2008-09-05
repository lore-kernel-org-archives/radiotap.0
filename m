From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Bad FCS flag
Date: Fri, 05 Sep 2008 22:44:08 +0200
Message-ID: <1220647448.11109.26.camel@johannes.berg>
References: <1220646325.11109.21.camel@johannes.berg>
	 <20080905203839.GV29499@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-fUwMwDCtlq+qtJ9T9cQa"
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
In-Reply-To: <20080905203839.GV29499-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org


--=-fUwMwDCtlq+qtJ9T9cQa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> TCPDump uses this bit, too.  I think that we are stuck with it.

Alright. I'll amend my old proposal to drop the shortGI bit for now (not
interested in 11n, let somebody else define those things) and make this
the "bad FCS" bit rather than the first bit in "RX flags".

> >  * the unofficial RX-flags stuff defines that bit 0 in "RX flags" means
> >    "bad FCS"
>=20
> Any users of this bit?

Not sure, I think we might create it in Linux, but it's easy to change.

> I think that TCPDump & Wireshark probably out-number the radiotap
> interpreters who use the rx-flags bit :-), but I don't know how many
> drivers there are who write headers with "bad FCS" in the rx flags bit.

Yeah. I'll mark the RX flags bit as reserved though so we don't run into
odd things there.

johannes

--=-fUwMwDCtlq+qtJ9T9cQa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIwZoUAAoJEKVg1VMiehFYUwsP/2ffbdap5u5HTbaHwDvhDBC5
JW9I7y+3f4QH6yfzaDGiUFLKVjvJcgxvN32UGzZ3x1g6b7Qs4nfrFiyz47XJbOTS
uDv+SxODJEgWFp6gtd/Lrvs330VzN6dXKDSeqgWn58JsMtwOj3GRa19uPqsjWG7H
+7ZMvOnMdeTiEVo0MWPETMk13q7xKhpo2l4Gd13nGQJeZ9CNVU/DZDmH/+ZPxNhg
4kH/K5ZvYy1DVs9oGawXIceOyP7lr4NlAD3U4xETRxfZm5yetSP0DW/kas5A37hV
45mrClVP5Zqp2IgGvLfjTDNLsCM8k7k70YMouAldlxRmU4cavgBI25W6dbcFh2rO
8nrsPfUaQwXXDRv5MGOVzE1imTNnawho4cBhn3fRtl4D57AcH+YcKeOUlOBYYX4I
/7mPF+XhYT94jCJKzeYkNsKwMd2VynfD7m+8+OfghfXZvvO6h2/h/zZ3phqItyv7
oxiEG/LgLCKOKwhHDuodIakTm1VHQIFKtQgWOPD2BXSyQr1KBOC6H1cdtzLAEDRo
nqQTgl8vWVIX+heZypo2JDIoG8morSOumltdOxo1A79QwDLXZvCuyzwUsU6rAqEg
wBQIo8CsvfZJy373rmymIjG5fwJui2UmZ5lvQXc6DQtULs5XMyQHn8KZ9M5g0Qce
qayqtOqIuowsLrmNb0wY
=Egc9
-----END PGP SIGNATURE-----

--=-fUwMwDCtlq+qtJ9T9cQa--
