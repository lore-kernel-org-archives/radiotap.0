From: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Thu, 11 Apr 2019 01:32:13 +0200
Message-ID: <20190410233213.GN25552@nataraja>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cf07ae24c436f92769f9289d208f01846ebe8826.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Johannes,

On Tue, Apr 09, 2019 at 03:50:45PM +0200, Johannes Berg wrote:
> As I'm looking into adding a generic cell modem framework to the linux
> kernel (to create session netdevs etc.), I started looking for a
> metadata encapsulation, a la Radiotap (I'm a wifi guy :-) ).

Is there any discussion about "session netdevs, etc." anywhere?  What exactly
do you have in mind for that "generic cell modem framework"?  I'm quite
curious to learn more about it and happy to provide feedback from the
perspective of my cellular protocols/specs/systems knowledge.

> So obviously, I found gsmtap, but for my use case it doesn't really
> address most of the interesting data, 

I have no knowledge of your use case, so I don't feel like I can
comment on that :/

> 1) Why the design with encapsulating it in UDP? Radiotap is just a raw
>    header without IP etc. in front, and you use it with tcpdump,
>    wireshark or similar tools on the local system. What's the value in
>    having something "network transparent"?

GSMTAP was designed as a format to encapsulate protocols normally not spoken over IP
(such as classic GSM radio protocols, e.g. the Layer 2 LAPDm over GSM Um)
inside an IP transport.

The existing implementations of such protocols all live outside of the
kernel but in userspace.  So you either have

a) a pure SDR software implementation of a GSM phy, whether on the MS/UE
   side or on the BTS/network side, or whether in sniffing mode, running
   as a userspace process.  This could e.g. be airprobe or gr-gsm

b) a OsmocomBB phone attached over serial port running the Osmocom Layer1
   firmware on the baseband processor, with some userspace program on a Linux
   PC implementing higher layers

c) GSM base station software such as osmo-bts, running in userspace

d) Using an old nokia phone attached via serial cable to a Linux PC running
   dct3-gsmtap.

So for any of those, if you want to provide real-time data streams, you have to
somehow transmit those over some kind of network technology.   One could have
done raw ethernet frames or raw IP frames, but using UDP seemed straight-forward
as one can create UDP socket from non-privileged processes.

We also have a virtual physical layer between OsmocomBB and OsmoBTS called
virt_phy where the GSMTAP over multicast IP is used to simulate/virtualize
the entire Layer1 / PHY / radio interface between phone and base station.

Once again, all related network elements are implemented in userspace,
and having an 

> 2) The format of gsmtap doesn't seem very extensible, but I guess a new
>    version could be made that has a TLV-based format or so. I'd have
>    argued that a new version isn't even needed, but the length field is
>    only 8 bits right now which seems too short.

Yes, it's a known problem.  The format was originally designed for GSM,
that is circuit switched common and dedicated channels on the GSM Um interface.
It was later extended for GPRS, TETRA, SIM card protocol traces and many others,
but all of that was an afterthought.

For sure any future version should be more extensible and e.g. use TLVs

> (speaking of versions - the docs say "version, set to 0x01 currently"
> but "#define GSMTAP_VERSION 0x02")

Sorry, it's the usual "developer changes code but not comment". patches
are welcome, we use gerrit.osmocom.org :)

> 3) Does the packet data follow the gsmtap header? It's not really clear
>    to me based on reading the wireshark code.

Sure, the packet data follows the GSMTAP header, and the type of data
is defined by the GSMTAP type / sub-type as per the specific use case.  As
you can see, there's 18 TYPE by now (each of which has at least one
program/implementation generating the data).

I think the best way to learn about GSMTAP is to use any of the many
programs that support it by now.  I think not only the examples above
use it, but meanwhile many others like the independently-developed OpenBTS
project that's unrelated to Osmocom, as are other projects implementing LTE.

> In particular, the data I'm thinking of is higher-level things, like the
> session ID for a frame when it's going through the kernel, or perhaps a
> flow label on RX, etc.

I'm not quite sure how that relates to GSM?  GSMTAP so far was intended
to encapsulate ETSI/3GPP messages inside UDP/IP, particularly messages of
protocols that don't traditionally are transported over IP baesd transports.

Having said, we're open to extending the scope - it just all needs to make
sense

> Also, vendor-specific data would be useful, e.g. to encapsulate the
> device-specific headers like QMI, where such metadata is encapsulated in
> a vendor- or device-specific way, which you'd want to see for debugging
> certain things, but for other things the generic "session ID" type
> information - encoded in a vendor-agnostic way - would be better to show
> in wireshark.

I'm really not following you here.  What's a "session ID"?

In terms of vendor-specific encapsulations: We do have a GSMTAP sub-type
for Qualcomm DIAG, as well as the osmo-qcdiag program to take DIAG from
Qualcomm chips + put it in GSMTAP and I do have plenty of experimental
wireshark dissectors for various parts of the DIAG protocl in a branch
on git.osmocom.org.  This just never went anywhere complete enough that
I'd consider merging it.

> Since it doesn't seem possible to use gsmtap in the current version,
> would it make sense to define a new gsmtap that (say) has version 3 or
> something, followed by an overall length and TLVs? 

By all means.  Vadim has once presented some ideas/plans about exactly
that at an Osmocom conference, but I don't think any related work
ever started.

> I do note that this
> wouldn't be compatible with the current wireshark code as it doesn't
> check the version, just shows it...

If that's the case that's sad, and I should have paid more attention to
it when originally writing it.  We should get a related fix into
wireshark ASAP then.  But then, the current dissector would just state
something like unsupported version instead of showing some garbage it
cannot parse.  Either way, you will of course need new sources and
sink side implemetations.

> Or would it make more sense to define a new ARPHDR_WWANTAP like
> ARPHDR_IEEE80211_RADIOTAP and just use that instead of encapsulating in
> IP/UDP, and then have a completely new (extensible) protocol inside of
> that? 

No userspace source would ever be able to generate such data and stream
it real-time into wireshark, would it?  Sure, I can write pcap file with
such ARPHDR_* values, but I could never do this in real-time.  For many
but not all use cases, that's really what it is: A vehicle to stream
real-time non-IP protocol traces into wireshark so it can visualize
the protocol traces.

Regards,
	Harald
-- 
- Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
