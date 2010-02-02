From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Tue, 02 Feb 2010 19:24:05 +0100
Message-ID: <1265135045.29119.79.camel@johannes.local>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <20100126174728.GV1060@ojctech.com>
	 <1264584965.25642.15.camel@johannes.local>
	 <20100127153002.GC1060@ojctech.com>
	 <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
	 <loom.20100201T230554-2@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-1n48IBDWTppVjobRk2C7"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <loom.20100201T230554-2-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-1n48IBDWTppVjobRk2C7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-02-01 at 22:09 +0000, Bill Stafford wrote:

> I also have a question about how the RadioTap design deals with informati=
on
> that may not be available.=20

That's a good point.

> So if it was in this longer format the flags might be something like this=
:
> 0x0001 20 MHz
> 0x0002 40 MHz
> 0x0004 20L (20 MHz in lower half of 40 MHz channel)
> 0x0008 20U (20 MHz in upper half of 40 MHz channel)
> 0x0010 Long GI
> 0x0020 Short GI
> 0x0040 HT Format - Mixed
> 0x0080 HT Format - Greenfield
> 0x0100 FEC type BCC
> 0x0200 FEC type LDPC
>=20
> It seems like this expanded bitfield might be better than the more compac=
t
> version.

Which speaks much in favour of this way, even though it may seem
redundant it would allow implementations to say "don't know about
upper/lower but do know it's 20mhz".

> When the radio is tuned to a 40 MHz channel, then the 20L and 20U bits co=
uld
> indicate a 20 MHz packet on the lower or upper side of the 40 MHz channel=
. I
> think leaving in the 20L/U bits would be better than changing the channel=
 field
> to indicate the modulation of the packet. It might be better to leave the
> channel field describing the channel to which the radio is tuned, and the=
se
> 20U/L bits to indicate how the receiver saw the packets. When capturing p=
ackets,
> it would seem surprising to see the channel field indicating channel chan=
ges on
> what might be a packet by packet basis.

That was my gut feeling as well, but it's a pure definition problem. We
do currently use the OFDM/CCK etc. bits in there on a per-packet basis
too, for instance, and they don't really make sense per-channel anyway.

johannes

--=-1n48IBDWTppVjobRk2C7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLaG3CAAoJEODzc/N7+QmankUP/i2EkQuBlmNoF4O4CzsYLpTm
m5R/QAmYJ+CNc2SHJIgTpdSlYAPdoAoBN7mO1DBbAfFu4YQ8GfAKWDiXQnlqAVis
Ik6GQvSc4bE5bUlP4yU6EtkSs4RLMVuSWWHPXfFJNFq5sY5NUepOIVCWVBbbe+D9
GMnfItFzRtIi84P1qxHszWbylBlY6rNUUSZvRzzZayQdfEZkz64WIYjpFYLrjKW5
jLZVoCNDKr0JiUnW/N/hnFpgKcZKpeWfqM0/d5YI2Ba26UePKjuBAvFoQdTgLJ71
jehA9OVlwGrM/tekE4j0LfIaQyZLZJqHvJge4Plnp7wEphDDFU53vnLSClLkHOHK
0ZZVSrstGaFEpDMxjPSnqr5ZXzumIX+sBsi3m/J6mYTAywY3eG6ub4/VmVWvn6pm
vSUBd7U4ixcHLTqsZJNMfZTEctmTB9OiszNPTkdOM0QQZvLxvvQ1ildVGOTaz9Xy
/yPllal4KaHtogZ5EkzbJpWcjiUdloTj7zfO/1fy45Kmnr7wCmQJ92T+lJ8vRRW+
ZPjpTj18s4/PoujoFep43arGQQ4JZbPmtDeLnYcwTm+Mka0HXjXwPEwlU0k4q90X
6oJjj2qkj0O91gonyy/2e+kfjyiVQujijDYW7LWBJTFISYGCHZ+yMn4n5LJ/MixB
Fj8RV8OuQk5EDQVRgFXe
=G1m/
-----END PGP SIGNATURE-----

--=-1n48IBDWTppVjobRk2C7--
