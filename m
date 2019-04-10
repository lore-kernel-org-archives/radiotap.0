From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Wed, 10 Apr 2019 09:23:13 +0200
Message-ID: <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
	 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
	 (sfid-20190410_083605_324978_F3549EC8)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20190410_083605_324978_F3549EC8)
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, 2019-04-10 at 13:35 +0700, Vadim Yanitskiy wrote:
> Hello Johannes,
> 
> FYI, there already was a discussion about GSMTAPv3:
> 
> https://www.youtube.com/watch?v=vum9jzavZi0&list=PL07C78AF831FFE8F9&index=10
> 
> but unfortunately, nobody has invested time into this (yet?).

2012! But, umm, I don't really have time for a whole video right now -
anyone have the slides? :-)

But yeah, the first slides look sensible :-)

> > 1) Why the design with encapsulating it in UDP?
> 
> This gives us a possibility to "demux" multiple GSMTAP streams on the
> receiving side, e.g. if you are running multiple processes.

Not sure I get this, but I also don't really care all that much. It's
just a pretty strange design if the kernel were to output this, I'm not
even sure how I'd do that properly. I don't want to be generating UDP
packets there...

Perhaps we can define something (GSMTAPv3) to not really care how it's
encapsulated, and for 'native' packet captures like what I want on Linux
when integrated with the driver, actually use an ARPHDR_GSMTAP, and
encapsulate in UDP when you create it in an application and want to send
it elsewhere, rather than just writing it to a pcap file?

johannes
