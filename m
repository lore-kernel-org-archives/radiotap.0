From: Matteo Cypriani <mcy-yxGd9NVxpOI@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Wed, 25 Jun 2014 09:09:01 -0400
Message-ID: <20140625090901.fa121a689f823f3af1db1e3a@lm7.fr>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net>
	<1373273952.8312.7.camel@jlt4.sipsolutions.net>
	<C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu>
	<1403679889.4140.2.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__25_Jun_2014_09_09_01_-0400_PJJtm9ngDj_+tTR1"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1403679889.4140.2.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

--Signature=_Wed__25_Jun_2014_09_09_01_-0400_PJJtm9ngDj_+tTR1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi there,

On Wed, 25 Jun 2014 09:04:49 +0200, Johannes Berg <johannes-cdvu00un1Vhtvz77W8JrvQ@public.gmane.org=
t>
wrote:
> > Context: somebody asked on ask.wireshark.org about a capture from a
> > D-Link router running OpenWRT; he claims that the router has 2
> > antennas, but the capture has 3 antenna signal strength values, the
> > first of which is in the first radiotap namespace:
> >=20
> > 	http://ask.wireshark.org/questions/33994/why-there-are-3-rssi-values-i=
n-the-radiotap-header-for-a-dual-antenna-wireless-card
>=20
> That's a bit strange - might be a driver quirk. The code I wrote has to
> rely on the driver, adding Felix who might know more, I don't know how
> ath9k works in this regard.

I observed the same on TP-Link TL-WDR3500 (which is also ath9k-based), and
assumed the signal in the first namespace was an average of the two others.
Should I understand this may be a wrong assumption?

  Matteo

--Signature=_Wed__25_Jun_2014_09_09_01_-0400_PJJtm9ngDj_+tTR1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTqsntAAoJEE6QGOCjKRJrA5IQAI9MiU0mELYpp8R1wN6QmQze
lCrBLTNJHNe5JiKpXROLbAcz48d2fF0gNfx6GIpVtgxv3Ravj3Z8XEp/rXu1R6qU
1b+IHIbaPLQadhbNU6oj1Li6je6R38oeClG4UuJyqwvg7+CZABtkaG38+4jfj5ei
zoPjHwYXZa8dvjUaSTuiQhBygQlnM5+TnTPpznnRKX8jzOkrLHEgcl0duzgpAs1E
Xsz5JNWXj9yY4Bh5z8/74HV6yqygQmkus9FZzIzlLzfzoBj2Uh3/mybIImaCHPwv
+fbsds7Sp5I/W3MHx/XaIFJCYxwIgXQXVB0BWg954n4HxiR6BSTEq73mF/dqTqVr
NNAFtbX6BHsAn0Casb5GV4uOZNPWvQrxsWyY7XP49J0dketGZbr63jdWgBqJ1Z1F
XLsthkBlWkXrQyuzxQnJ8HvkHRC6rtmYfptV92hek960cNxqO8fIuEyTHnPTUj3C
Uorzg5XYBzzbTRtmnWyendPiF+DWI/6cpDvOyb8tn7SFTziZEV1wHX8oPc5PGkcI
b6+8P5PO8Sq3XbiymEdS0Nw5Qqrkwm9s20xeFbzoHkzZi9HdTuO6ZzskUI58P6hx
LL2mGCY0FTylg0ouzBNRMgfb1QOdgqzPF3acTR62VLwvS9DP+O05l5PyFEUT29eO
DOFfCUdjfjWowOw2uA3w
=UkGj
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2014_09_09_01_-0400_PJJtm9ngDj_+tTR1--
