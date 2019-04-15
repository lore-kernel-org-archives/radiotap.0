From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Mon, 15 Apr 2019 11:26:22 +0200
Message-ID: <77ac708e198c8b04f45e47f53f63bd2f4ed006df.camel@sipsolutions.net>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
	 <20190410233213.GN25552@nataraja>
	 <1462659018bc40830efbe2348791b8df45b54cff.camel@sipsolutions.net>
	 <20190413073505.GD24451@nataraja>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190413073505.GD24451@nataraja>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Cc: openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Harald,

> Agreed.  However, the protocol stacks on WiFi and cellular technologies
> are very different, to say the least.  There is no easy mapping of PHY
> related parameters to a given IP packet, and the related quality metrics
> of the radio channels don't work that way.

Sure. I'm (vaguely) aware of that.

> But yes, I agree, that whatever transport mechanism you wan to use between the modem
> and the user/Linux side should allow for additional, extensible metadata beyond
> the identifier of the PDP/PDN context.

Really the question it goes down to is whether there's possible overlap
here with GSMTAP or not.

If yes - we can define a GSMTAPv3, with TLVs or so, and add a "PDP/PDN
context" or "session" field or something like that, and maybe a tag that
says "IP packet is here", or some kind of "content type" field. I expect
there would be some such "sessions" that actually just transport the
local AT command chat.

If no, I guess we'll just define something else for this use case? Or,
perhaps, even get rid of it entirely and just rely on trace-cmd
recording or so, though then I guess we'd really want to teach libpcap
and/or wireshark to understand this in some way.

Though it almost sounds like in GSMTAP you're never actually
transporting IP data, but other types of packets that in turn transport
the (fragmented/compressed/encrypted) IP data. That would kinda mean
there's very little potential overlap.

> > This is the part I guess I don't understand. I haven't really tried, but
> > it seems you should be able to encapsulate arbitrary protocols into
> > 802.3 OUI-based ethertype or so?
> 
> But why?  I'm in an userspace program, and I want to send data to one or
> more other userspace programs.  Why would I not simply open a UDP socket
> to do so?  I would have to have CAP_NET_RAW and open a packet socket,
> and then generate ethernet frames from that?
> 
> I admit that the use case with wireshark is a bit odd, but there are
> other receivers out there.

Yeah, ok. I was thinking kinda the other way around - if all you need is
network transparency for wireshark it shouldn't matter, but that's
really discussed over in the other subthread with Guy Harris better.

Anyway it doesn't matter, and I'm beginning to understand that a (maybe
even the primary) use case is getting multiple parts of your stack to
talk to each other (over UDP).

> Yes, you're looking only at a single interface (the radio interface
> between one BSS and one STA).  You're not looking at five different
> interfaces at five different levels of network hierarchy/topology in the "wifi
> controller" and want to mix in a radio interface trace in the same
> timeline.

Indeed. Well, actually, we often do, but use different mechanics for
that (trace-cmd record comes to mind, it records all our driver/fw chat
as well as possibly adding in logging from wpa_supplicant etc.)

> > Basically, I was looking at it as if it was like WiFi in a sense - you
> > have an IP frame, you're going to transport it over some physical link,
> > so it gets PHY information in the sense of modulation etc.
> 
> As stated elsewhere, there's an M:N mapping between user (IP) payload
> and actual radio interface "MAC blocks", so I'm not aware of anyone
> mapping radio interface performance to user plane IP.

Right, OK.

> the "physical link info" is present in GSMTAP, but the granularity of
> GSMTAP frames is not user-IP frames, but "MAC blocks".  So your user IP
> frame might not be visible as it's still compressed, encrypted,
> fragmented, etc.

Sure. As Guy Harris pointed out, this is also true for wifi though - we
don't have compression, but certainly encryption & fragmentation,
wireshark was taught to handle that and recreate the original MSDU (mac
service data unit).

johannes
