From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: parser with vendor extensions
Date: Thu, 26 Nov 2009 19:42:48 +0100
Message-ID: <1259260968.24540.6.camel@johannes.local>
References: <1259231373.32372.55.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-4YLU6sS/chTPyk1KYgrO"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1259231373.32372.55.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Cc: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-4YLU6sS/chTPyk1KYgrO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-11-26 at 11:29 +0100, Johannes Berg wrote:

> I've lifted that parser into a separate project at
> http://git.sipsolutions.net/radiotap.git/ (both git clone and gitweb)
> and added namespace/vendor extension support.
>=20
> It's easy to embed into other projects and I'm hoping to eventually make
> wireshark use it

Done now, but I'm not sure I like having a copy of this in wireshark.
Should we create a libradiotap out of it?

johannes

--=-4YLU6sS/chTPyk1KYgrO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLDswkAAoJEODzc/N7+QmaQxEQAIcK1PkaO+t5qipp55dEXWZV
YOukvfHa7HEh9xFqfPhDBykTWKFugFSbohDzXcRkhFRDQkc4xOkHmxTZszKSSBhP
CV8Oh7L3Et/fo+K3NBZSF96KcOtuwBH+LtGvMS1M3pUbuYFV1+nv6fncOmE5Yocf
oXvqGpgOS6xmQFz65eFNMx6E5mnHqjPannQSESgf1BWejd1+6ppbcouQTQ3UhT+7
+8dkC4eE58rdNfsIZarhM7OazKMPVklCYYhYg+1em4DyymA1uGQBaz8vOPoUurX0
X8nldb92giT6O0KrdUhJAiI7NrEIqOjyz2Hmw/mbhIMGRSjqZ74gSBHyjELsSlM6
DlvqXZ3FKS7mIchELTxVkhiZzXpuvj5DO34RiVoosxOfeDG4fkejwRTvdoYIn78n
XTqvdthgmGhY56QJ1rdV4VCbPvBS7Gt/Z52k5OCW/0Y6yewUNEC7u/7IO0qKCg/2
/tSZpPB02GOkta/81vFiyFVpsghx/kZDQvATOW1I1NjEqGsJK/uGM/nX5dhmGWrV
RLJo3DBEKGGViwWEz5eVeABEV5FBTX+35vnuCcvoyQQaar/vB/w9umgLpuJ//Clv
Cq5vB/6tBjLBNp7w1ORUrITV/I5To9+8UV2dEiRIJ0H3qWZJ6Otg9gPRYPzNaiXw
X/aq74HfzbVzogosXrhK
=z932
-----END PGP SIGNATURE-----

--=-4YLU6sS/chTPyk1KYgrO--
