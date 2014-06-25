From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Wed, 25 Jun 2014 09:04:49 +0200
Message-ID: <1403679889.4140.2.camel@jlt4.sipsolutions.net>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net>
	 <1373273952.8312.7.camel@jlt4.sipsolutions.net>
	 <C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C7AC152F-CCC4-48E7-B752-71655EFD0C58-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2014-06-24 at 18:53 -0700, Guy Harris wrote:

> > FWIW, I've now implemented this in Linux (in mac80211), although I start
> > a new radiotap namespace for each antenna, separate from the first one,
> > so you'll see
> > 
> > * any of: TSF, flags, rate, channel, MCS, a-mpdu, VHT, ...
> > (new radiotap namespace)
> > * ant signal: -40 dBm
> > * anntenna: 0
> > (new radiotap namespace)
> > * ant signal: -45 dBm
> > * anntenna: 1
> > ... for however many antennas/chains there are.
> 
> So is the idea that, in the first radiotap-namespace block, there will
> be no per-antenna information such as the antenna signal - the only
> per-antenna information will be in the subsequent namespace blocks?

Exactly. It would have seemed strange to include the per-antenna fields
in general since the other data isn't specific to an antenna. It also
shows nicer in wireshark this way :)

> Context: somebody asked on ask.wireshark.org about a capture from a
> D-Link router running OpenWRT; he claims that the router has 2
> antennas, but the capture has 3 antenna signal strength values, the
> first of which is in the first radiotap namespace:
> 
> 	http://ask.wireshark.org/questions/33994/why-there-are-3-rssi-values-in-the-radiotap-header-for-a-dual-antenna-wireless-card

That's a bit strange - might be a driver quirk. The code I wrote has to
rely on the driver, adding Felix who might know more, I don't know how
ath9k works in this regard.

johannes
