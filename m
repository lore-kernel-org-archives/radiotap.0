From: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Sat, 13 Apr 2019 08:41:52 +0200
Message-ID: <20190413064152.GB24451__16203.3970862225$1555138223$gmane$org@nataraja>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
 <20190410234555.GO25552@nataraja>
 <f0a64bb751b8c601f58130a7f3a3158d70f18f63.camel@sipsolutions.net>
 <196E881D-AB4A-4569-9C1F-5BCB41FE832F@alum.mit.edu>
 <1D6FE33B-DC15-47D8-A1AD-E95608300FDC@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1D6FE33B-DC15-47D8-A1AD-E95608300FDC-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

Dear Guy and others,

On Fri, Apr 12, 2019 at 03:47:26PM -0700, Guy Harris wrote:
> On Apr 12, 2019, at 12:54 PM, Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> 
> > I see nothing about a struct gsmtap_hdr:
> > 	http://osmocom.org/projects/baseband/wiki/GSMTAP
> > that...
> > 	2) would prevent it from being at the beginning of a LINKTYPE_GSMTAP/DLT_GSMTAP packet in a pcap or pcapng file.
> With a specification based on
> 	http://cgit.osmocom.org/libosmocore/plain/include/osmocom/core/gsmtap.h

I completely agree that there is no technical reason why one couldn't put GSMTAP
headers in current (v2) or future formats inside an ETHERTYPE / DLT and have
them natively appearing in a pcap file of the given DLT.  There would be no objections
from my side to do so.

One could then simply call the same dissector in wireshark from that DLT or from
the existing UDP port number based dispatch via the IANA-registered GSMTAP port
number.

However, among the existing users of GSMTAP in the last decade or so,
there would be no advantage, as the related sources of GSMTAP frames all
exist in userspace and are feeding data, particularly from potentially
multiple sources, which can very well run on different hosts.

But that of course doesn't prevent new users from using different
transport mechanisms of getting GSMTAP from e.g. the kernel into
userspace.

Regards,
	Harald
-- 
- Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
