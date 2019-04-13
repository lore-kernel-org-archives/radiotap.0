From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Sat, 13 Apr 2019 00:36:39 -0700
Message-ID: <B99492E6-9EA9-4A4E-8585-8EA84D8E7267@alum.mit.edu>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
 <20190410234555.GO25552@nataraja>
 <f0a64bb751b8c601f58130a7f3a3158d70f18f63.camel@sipsolutions.net>
 <196E881D-AB4A-4569-9C1F-5BCB41FE832F@alum.mit.edu>
 <1D6FE33B-DC15-47D8-A1AD-E95608300FDC@alum.mit.edu>
 <20190413064152.GB24451@nataraja>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190413064152.GB24451@nataraja>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

On Apr 12, 2019, at 11:41 PM, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org> wrote:

> But that of course doesn't prevent new users from using different
> transport mechanisms of getting GSMTAP from e.g. the kernel into
> userspace.

Nor does it prevent libpcap (once I generalize the remote-capture =
mechanism) from supporting gsmtap://{host}[:port] (port optional) URLs =
that cause it to set up a UDP ({PF_INET or PF_INET6}, SOCK_DGRAM, =
IPPROTO_UDP) socket on which to receive UDP packets from the specified =
host (at the specified port or, if no port is specified, the default =
GSMTAP socket) and supplying packets that begin with a GSMTAP header, =
with a new linktype of LINKTYPE_GSMTAP/DLT_GSMTAP.=
