From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Mon, 15 Apr 2019 12:41:42 +0200
Message-ID: <e1066a7120769ea18ea88856ca17116355d8c2d2.camel__35333.630016406$1555324924$gmane$org@sipsolutions.net>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
	 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
	 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
	 <6F1998DC-EFD2-4145-BD81-A80F9DC7ED2D@holtmann.org>
	 <1d64c578cd5b254d301cf1cac82f32a062916888.camel@sipsolutions.net>
	 <D4D12CF9-9CE5-46FB-9738-F89DB6B6F9EA@holtmann.org>
	 <92e8e142b6d441c1c995abc57d64ad7b7747a688.camel@sipsolutions.net>
	 <87d0ln1s0a.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <87d0ln1s0a.fsf-3F4PFWf5pNjpjLOzFPqGjWGXanvQGlWp@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
Cc: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:NFC
 SUBSYSTEM" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: radiotap@radiotap.org

On Mon, 2019-04-15 at 12:29 +0200, Bjørn Mork wrote:
> 
> I don't understand where you are going here? Neither QMI, AT command nor
> MBIM management are transported over netdevs. AT is usually transported
> using simple USB bulk streams, exported to userspace as tty devices by
> some USB serial driver.  Both QMI and MBIM management are transported as
> USB control messages, and exported to userspace as chardevs.  There are
> no netdevs involved.

OK. I've also been looking at a driver for Intel modems, and I think it
works that way.

> > and people do things like "socat" to set up
> > PTYs and pretend to have serial channels there, on top of the netdevs?
> 
> I assume you are referring to my MBIM DSS examples here.

I was more thinking of what I've been told the Intel modem does,
actually. But that in turn might very well be inspired by what you
documented there. I think the folks doing this were just trying to make
it work and nobody really understands the whole landscape.

> I don't know
> if anyone is actually using that, so you should probably ignore it...
> I'll happily admit it was a bad idea.  Should have just added the
> necessary code to map DSS channels to some sort of character device in
> the driver, like most users requested.

OK. So I guess a framework should consider that possibility, and let you
create new chardevs for a given (DSS) channel?

> But there really isn't anything in the MBIM spec saying how DSS should
> be used. DSS is a generic data stream.  Could easily be connected to a
> single TCP session for example, in which case you'd probably want to
> connect it to a TCP session in the other end too.  So I wouldn't want to
> force DSS into character devices on the host end.  

Fair point.

I suppose some of these may also be debug channels that give you modem
debug information, which is useful (if you can interpret it).

> This doesn't rule out
> a userspace controlled optional mapping though. We could probably still
> add that, replacing the VLAN mapping with a chardev for a specific DSS
> session if requested by userspace.  I guess this is something to
> consider for a generic cellular framework - supporting non-ip data
> streams between modem and host.

Right.

> Adding to my previous excuses: The DSS implementation in the cdc_mbim
> driver was added without having seen a single modem firmware with *any*
> type of DSS support.  It was purely based on spec{ification,culation}.
> The VLAN mapping, along with examples of how to use socat to further map
> the streams from VLANs into suitable application specific forms, seemed
> like a simple and flexible enough solution.

:-)

johannes
