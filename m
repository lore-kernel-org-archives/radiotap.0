From: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Thu, 11 Apr 2019 01:45:55 +0200
Message-ID: <20190410234555.GO25552__16868.7731189252$1554939977$gmane$org@nataraja>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <46474c61d7748042cc0a1f23773186786020638e.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Johannes,

On Wed, Apr 10, 2019 at 09:23:13AM +0200, Johannes Berg wrote:
> > but unfortunately, nobody has invested time into this (yet?).
> 
> 2012! 

Well, Osmocom is a very small community, with probably somewhere less than
25 active developers over the last few years (less than 15 full-time),
with an *incredibly* large scope:  Implement virtually any protocol
layer of any protocol stack on any of the 3GPP interfaces and all their
related network elements for 2G/3G as well as even other technologies
like TETRA, GMR-1, ...

And all that in a field of technology that has less free software than
the Operating Systems world had in the mid-1990ies.  It really feels a
bit like the Linux community 20 years ago.

So resources are always *extremely* tight, and given those limited
resources, I'm actually very happy with the results by now, having
automatied CI, build verifications, unit tests, functional test suites,
end-to-end testing, and all the code we implemented on git.osmocom.org :)

While current GSMTAPv2 is ugly, it works rather solid for all known
existing use cases, so there was no urgency to introduce a new version
of it.

> Not sure I get this, but I also don't really care all that much. 

Well, with all respect, GSMTAP was created for a variety of use cases,
see my other lengthy mail.  It's fine if you don't care, but unless you
could explain your use cases with a few paragraphs, neither you nor us
are able to determine if there is common functionality and if it makes
sense to use GSMTAP or not :)

So far I have not seen any explanation about what kind of data you want
to encapsulate at all.

> just a pretty strange design if the kernel were to output this, I'm not
> even sure how I'd do that properly. I don't want to be generating UDP
> packets there...

There are well-established APIs for having sockets in the kernel and for
generating + receiving UDP packets from it.  NFS has been doing this for
decades, as do various kernel-side tunneling helpers including the GTP
kernel module.

I'm not saying it's the right approach for your problem, I'm just saying
kernel-side code can for sure use UDP sockets.

> Perhaps we can define something (GSMTAPv3) to not really care how it's
> encapsulated, and for 'native' packet captures like what I want on Linux
> when integrated with the driver, actually use an ARPHDR_GSMTAP, and
> encapsulate in UDP when you create it in an application and want to send
> it elsewhere, rather than just writing it to a pcap file?

Sure, that works.  But the real question is, to me:  Are there common
GSMTAP payload types that both the existing GSMTAP users carry, as well
as what you would want to carry?  If yes, then it makes sense to think
about a common encapsulation like GSMTAP.  If the payload types differ,
then it seems rather like there are two distinct use cases that
wouldn't benefit from standardizing on one format.

Regards,
	Harald
-- 
- Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
