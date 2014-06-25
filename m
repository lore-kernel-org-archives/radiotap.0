From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Tue, 24 Jun 2014 18:53:48 -0700
Message-ID: <C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net> <1373273952.8312.7.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1373273952.8312.7.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


On Jul 8, 2013, at 1:59 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:

> FWIW, I've now implemented this in Linux (in mac80211), although I =
start
> a new radiotap namespace for each antenna, separate from the first =
one,
> so you'll see
>=20
> * any of: TSF, flags, rate, channel, MCS, a-mpdu, VHT, ...
> (new radiotap namespace)
> * ant signal: -40 dBm
> * anntenna: 0
> (new radiotap namespace)
> * ant signal: -45 dBm
> * anntenna: 1
> ... for however many antennas/chains there are.

So is the idea that, in the first radiotap-namespace block, there will =
be no per-antenna information such as the antenna signal - the only =
per-antenna information will be in the subsequent namespace blocks?

Context: somebody asked on ask.wireshark.org about a capture from a =
D-Link router running OpenWRT; he claims that the router has 2 antennas, =
but the capture has 3 antenna signal strength values, the first of which =
is in the first radiotap namespace:

	=
http://ask.wireshark.org/questions/33994/why-there-are-3-rssi-values-in-th=
e-radiotap-header-for-a-dual-antenna-wireless-card=
