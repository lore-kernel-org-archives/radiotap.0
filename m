From: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Sat, 13 Apr 2019 09:12:27 +0200
Message-ID: <20190413071227.GC24451@nataraja>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
 <20190410234555.GO25552@nataraja>
 <f0a64bb751b8c601f58130a7f3a3158d70f18f63.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f0a64bb751b8c601f58130a7f3a3158d70f18f63.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Johannes,

On Fri, Apr 12, 2019 at 07:15:56PM +0200, Johannes Berg wrote:

> Agree. Sorry about that. No disrespect was intended, but I'm still not
> sure I understand the need for UDP encapsulation *as part of the
> protocol*. I guess saying "GSMTAP can optionally be encapsulated in UDP
> with the well-known port xyz" would be something else, and it'd make
> more sense to me than saying it has to be.

Sure, like with most protocols you can wrap them in anything you want.

Let me put it like this:
You don't have to run RTP inside UDP, you could equally put the RTP
frames in to SCTP or DCTP.   It's just not what the original users of
the protocol/spec had envisioned, but it can for sure be done, and has
no side-effect other than not being interoperable with existing
implementations.

> Right, see my other mail(s) from today as well. Basically the IP frame
> that we're actually sending, and then attaching to that the "session" or
> "mux id" that it's being sent on. Sorry, I probably also don't know the
> right term - those show up in the drivers now.

So it's basically the information whch PDP/PDN context your user IP packet
belongs to.  A single integer "tag". that resembles the identifier that
was used by the control plane when activating that context (which is
basically a tunnel).

> > Sure, that works.  But the real question is, to me:  Are there common
> > GSMTAP payload types that both the existing GSMTAP users carry, as well
> > as what you would want to carry?  If yes, then it makes sense to think
> > about a common encapsulation like GSMTAP.  If the payload types differ,
> > then it seems rather like there are two distinct use cases that
> > wouldn't benefit from standardizing on one format.
> 
> Agree, and I don't really know.

>From what I can tell after the burst of e-mails in this thread so far,
I don't think there's much commonality here.  A modem will "never" give
you access to the actual cellular protocol layers that we care about
in the Osmocom/srsLTE/YateBTS/OpenBTS/airprobe/gr-gsm/... world, for
which GSMTAP was designed (see more below).

I'm not saying it cannot be done. If you want to use GSMTAP, I'm happy
to help.  But at least so far, I don't see why it would make any sense.

> Maybe I should start differently. Do you have an example GSMTAP capture
> file that I could look at in wireshark? Yes, I see you've pointed out
> how I can get all the software running, but if you have a file already
> that's almost certainly faster :-)

There are a couple of files attached at
https://osmocom.org/projects/baseband/wiki/WiresharkIntegration

> And then the question I'd want answer is this: If there's an IP frame
> that I send to the modem from the application using a regular UDP or TCP
> socket, what would the corresponding GSMTAP capture look like? Surely it
> includes the IP frame in some way?!

GSMTAP was generated initially for GSM. GSM is a circuit-switched digital
wireless telephony system that has no inherent/native way of transporting
IP payload.  As such, the GSMTAP Um captures linked above will not contain
IP user data but will contain the signaling plane data of the Um air interface
protocol stack, consisting of the LAPDm potocol on Layer2 and the TS 04.08
RR (Radio Resource), MM (Mobility Management) and CC (Call Control) data.

Of course one can also use GSMTAP for GPRS, which is packet oriented.  In
this case, you have the following layering stack inside a GSMTAP Um frame:

TCP
IP
SNDCP (TS 04.65)
LLC (TS 04.64)
RLC/MAC
PHY

There is segmentation/reassembly potentially at least at the LLC and at
the RLC/MAC layer.  There can be encryption at the LLC layer so the IP
payload is already invisible at that point.  You cab also have both
header and payload compression at the SNDCP layer.

In the end, you can have start/middle/end segments of LLC frames inside
a single RLC/MAC block, belonging to either one or multiple LLC frames,
and then the LLC frames contain [segments of] IP packets.

GSMTAP can be used on various other interfaces of the cellular network,
which are *not* the radio interface between modem/phone and base
station (such as e.g. between the Phone and the SIM card), so they're not
of interest to your use case and I'll not cover them here.

GSMTAP can also be used to encapsulate later cellular technologies such
as UMTS aka WCDMA aka 3G, or LTE aka 4G.  In all those cases you always
have a different (sometimes deeper and sometimes not so deep) protocol
stack between the user IP payload and the actual radio interface (PHY).

You can think of it a bit if you are not thinking about a User IP packet
but you assume for the sake of an argument that you want to see "HTML".

Then underneath HTML you either have, depending on the technoolgy, HTTP
1.0, 1.1 or 2.0.  And under that you can have any number of additional
protocol stacking whether it's TCP based, with or without SSL or TLS,
with IPv3 or IPv6, with or without IPsec, inside a VLAN or not, ...  -
and most importantly, next to all of that you have important "control
information" like let's say DHCP or neighbor discovery.

So, in other words, the user IP plan is *very* far away from the PHY on
the radio interface, and the really interesting things are those that
are happening beneath or next to the user IP.

However, commercially available cellular modems will go to the utmost
extent to make sure you never have access to any of this, and they
invent various different ways to make the user (whether that's ofono,
the ModemManager, ...) as far away from that as possible.  The
interfaces between the cellular protocol stacks and the user (whether
QMI, MBIM, AT commands, ...) are so abstract that virtually any useful
resemblance to what happens on the actual radio interface is lost.

You can get a glimpse to some of what's happening with Qualcomm DIAG
protocol, but even that doesn't really [always] expose full protocol
traces to you, particularly not on the user plane.

> If the answer to that question is yes, then I think there is some
> overlap, because you can always imagine the modem receiving an IP frame
> and telling you more about how it was encapsulated over the air, no?

Not really.  The modem implements the entire protocol stacks for the
various cellular technologies and in the end provides you as the user
something like a tunnel endpoint.

> Mind, most if not all modems probably don't actually do that today, but
> I wonder how much of that is because of lack of infrastructure to do it,
> vs. it just not being necessary - since I've been told that the modems
> do in fact often output tracing that contains information about this.
> Just not directly combined with the IP frame.

The most widespread technology to obtain tracing/debugging information
is the Qualcomm DIAG protocol, which is a collection of dozens of
sub-systems each of whcih has up to hundreds of individual
flags/settings of categories that can be enabled and/or disabled.

We once did a bit of development in that area, see osmo-qcdiag to enable
this (http://git.osmocom.org/osmo-qcdiag/) as well as *extremely
minimal* wireshark dissectors at http://git.osmocom.org/wireshark/log/?h=laforge/qcdiag

However, this is a proprietary mechanism available only to Qualcomm stack
based devices, will only work on those devices where one has figured out
how to enable an access it.  And the information it provides is
completely asynchronous to the user IP plane.

There is a similar project for (now very old) Infineon XGold based
phones, see https://github.com/2b-as/xgoldmon.  It also generates
GSMTAP.  But AFAIR only for the control plane data and not the user
plane data.

To be honest, I don't even think there's a lot of context that one could
theoretically provide "attached" to the user IP packet, as the
interesting bits are happening at lower protocol layers, and due to
segmentation/reassembly/compression/...  etc. there is no 1:1 mapping
between the user IP packet and what's happening on the radio interface.

Regards,
	Harald
-- 
- Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
