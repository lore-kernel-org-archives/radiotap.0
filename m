From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: parser with vendor extensions
Date: Thu, 26 Nov 2009 11:29:33 +0100
Message-ID: <1259231373.32372.55.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-iTcs7/iGtnzOYQIbMk0y"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Cc: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-iTcs7/iGtnzOYQIbMk0y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Andy Green had graciously allowed us to use his radiotap parser he wrote
for the Linux kernel under BSD license for hostapd.

I've lifted that parser into a separate project at
http://git.sipsolutions.net/radiotap.git/ (both git clone and gitweb)
and added namespace/vendor extension support.

It's easy to embed into other projects and I'm hoping to eventually make
wireshark use it, its home-grown parser is really reaching its limits
and doesn't even parse current standard radiotap properly (it doesn't
handle bitmap extension bits properly afaict).

It also contains test cases for radiotap headers that I think are valid
along with how they should be parsed. More test cases, and especially
review of the existing ones would be very welcome.

johannes

--=-iTcs7/iGtnzOYQIbMk0y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLDliIAAoJEODzc/N7+Qma/gUQAKYxU8ZkZp9XE9DHlSms0+5j
rloVJpoy8nU/HllxrgUR+yCtT0Wo4ia2aaw4drPdJA+0YQDGmfhp5NRIHFAXq06h
NNRcoEdA0GbgLPJJ6xIutPn8Sh7w0Ey/fyml1jAqPtXYg7n9+w1R7kQGkfr3vrhg
ZER54Ip1OaAMTfD6l+2RbsXGW8cnlxxC7yBn62lnPcaSMaGTn4dARGmJ6QLlvQM2
lxZu+S8LWwAw1cYKA5TDWhdxs1khBL8+QfTk/eRD2gSXAf/C3BYHL4vQ5VVerVLy
iljPGIWxTLFRK/4VioLPYIkHyiEeZszwug2CM3h8aTO4NQb+h8zoG3A1IXaOUuFt
y0TO8tiWM+9xL2mXk3QovvnvOTWxz33AjvqBKi8KBDMthaYh3tlDuYncKO3CyXpl
2M41BsBzgSGH7ukM+2BUavaENNhLJLFlrJ7lydNkSkLPtvrn636tB4xmxFALBjss
ON+6j1elw54iYFhEFNajJu8xaKX+BOhdN7PoxWrBdz1uP4N92TVL2/J5hjm4RUFr
EvxwB1nMGCW+k5IW3y585u8MxCGJl+ulXQ2lqOV++H+/wtsUpfRWrWS/CzV6CNuL
SAf+kt0bJYtX4vWO4Dd63ZhZz+Is4vSuh5sTSq/UVG69zeGjgKukbarwbws1DcHl
gjx7fElkVfXC70JuKccr
=S9TK
-----END PGP SIGNATURE-----

--=-iTcs7/iGtnzOYQIbMk0y--
