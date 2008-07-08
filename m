From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] RX flags
Date: Tue, 08 Jul 2008 11:51:57 +0200
Message-ID: <1215510717.9610.11.camel@johannes.berg>
References: <1214478891.20763.38.camel@johannes.berg>
	 <20080707181217.GL1269@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-406xgI3y+ibawJ/Ko92b"
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
In-Reply-To: <20080707181217.GL1269-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap <radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-406xgI3y+ibawJ/Ko92b
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-07-07 at 13:12 -0500, David Young wrote:
> On Thu, Jun 26, 2008 at 01:14:50PM +0200, Johannes Berg wrote:
> > This is a request for adoption of the following new radiotap features:
> >=20
> >  * a new flag in the "flags" field (field 1):
> >     - short guard interval
> >  * the new "RX flags" field (field 14), currently containing the
> >    following flag:
> > ???    - bad FCS
>=20
> >     - bad PLCP
>=20
> Thanks for bringing this proposal.  I agree with it, for one.  I have
> a few clarifying questions.
>=20
> Just to be clear, perhaps cite the IEEE specs where they define FCS and
> short GI.  Implementors will want to know, is FCS failure different
> than ICV failure?  Presumably, by "bad PLCP," PLCP CRC check failure
> is intended.

Short GI isn't actually defined yet, it's part of 802.11n. Did I say
antything about ICV failures? As for PLCP, yes, there's a checksum in
it, but I think there are also other ways it can be invalid. I'll look
it up and add some documentation.

> > I propose to make changes to radiotap as follows [1]:
> >=20
> >  1) Reserve bit number 6 (mask 0x40) of the flags field (field 1)
> >     because it was used by some implementations (wireshark) as "bad FCS=
"
>=20
> Pleas excuse my forgetfulness. :-) Is there a conflict with "bad FCS"
> at bit 6 field 1?  Is there representation for the conflict on the list?

I might not have posted that, sorry. Basically, bit 6 in field 1 is used
by wireshark for "bad FCS".

> If not, I may bring a second proposal to assign bit 6 for bad FCS,
> the rationale being that the bit is already used in that way, and some
> implementations may avoid including an Rx flags field by using bit 6
> field 1.

There's no actual conflict, but I'm trying to avoid a situation where
"standard" radiotap has _two_ bits meaning the same thing, one in the RX
flags and one in the field 1 flags. Since the RX flags one seems to be
more used, I opted for using that one and reserving the other one.

I did consider using bit 6 field 1 for "bad FCS" for precisely that
reason (no need to add RX flags) but that would mean even those
generators currently generating "RX flags" in bit 14 would have to be
changed. I don't have a problem with that per se, but I fear that it may
lead to confusion.

johannes

--=-406xgI3y+ibawJ/Ko92b
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIczi5AAoJEKVg1VMiehFYxAcP/j6G/X/AvPzzlDqWMgg2wLZC
1nviTIdw5Dl6M8chw+AoZF8XnTjdPlitQUenITbkiZjacCkas08nwOt0Kb7Wo+V/
Nzx2SeEy60QQj3a/jZ0JN/BjU+MosncvJbBpCkBDKhn1EE5Dl9vOcb9J25VBHvUl
30V/AT3CizGFtYUv3Vu03ClDIfKESynH308Z1o/43smpRFojygkOzoMG3usGkXei
+aKOcLBaRTq2ckRnuTSDxD6h/RgOSZsmuU/P6yfiCmnHCmuv2O0ExXrIWQRvR0Oe
3FmuBvoXHXM3u549bFApHvV9XQk5sOjLlzzwnNqWuTkdFHnrVXZ5VZI9L3FIpMlR
Al4TQkInf82OoR8i9L/eqtn8//t+mn+j7q3SGHHa3A39eeProMJo7AX54As1Ngc4
A0Oic410OgXyJUpJwaBHQqhejiZ4PLmXGIFCbh7IdNrR027obYRfb7Pf9UlXOtB+
ajwlrhxMtcR8i6sFumn48k6nUSS23w9Cang+Xm/xr8V2hoVcaCngBooP2aPnOfG0
2glnb/oNdzc/A1c/WptblG2b9XgMkviBIGwYtmvw647TMmOXFRDRX1UsSGXtw7Kf
lIity3n5LXYLLDK5WLfdc4+RnnhnKXI92uyAniY+l3C3uF/WutyZK/kD6+eup7Bg
kUbmFwZIhlTFJyD+F118
=JOgu
-----END PGP SIGNATURE-----

--=-406xgI3y+ibawJ/Ko92b--
