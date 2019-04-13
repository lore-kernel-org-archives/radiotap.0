From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Sat, 13 Apr 2019 00:49:59 -0700
Message-ID: <7C48A51C-852F-480B-9F6D-C5BFEBB1A389@alum.mit.edu>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
 <20190410234555.GO25552@nataraja>
 <f0a64bb751b8c601f58130a7f3a3158d70f18f63.camel@sipsolutions.net>
 <20190413071227.GC24451@nataraja>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190413071227.GC24451@nataraja>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

On Apr 13, 2019, at 12:12 AM, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org> wrote:

> On Fri, Apr 12, 2019 at 07:15:56PM +0200, Johannes Berg wrote:
>=20
>> Agree. Sorry about that. No disrespect was intended, but I'm still =
not
>> sure I understand the need for UDP encapsulation *as part of the
>> protocol*. I guess saying "GSMTAP can optionally be encapsulated in =
UDP
>> with the well-known port xyz" would be something else, and it'd make
>> more sense to me than saying it has to be.
>=20
> Sure, like with most protocols you can wrap them in anything you want.
>=20
> Let me put it like this:
> You don't have to run RTP inside UDP, you could equally put the RTP
> frames in to SCTP or DCTP.   It's just not what the original users of
> the protocol/spec had envisioned, but it can for sure be done, and has
> no side-effect other than not being interoperable with existing
> implementations.

Or you can just have LINKTYPE_RTP/DLT_RTP and supply them inside =
nothing.

However, unlike RTP, there is no reason *not* to do that for GSMTAP - =
it's not as if the IP or UDP headers in a packet from a host supplying =
GSMTAP-encapsulated packets provide any information necessary or even =
useful for dissecting the encapsulated packets.

Whether it's useful, or possible, to have any interfaces on a *host* =
with cellular modem connectivity supply the cellular-network traffic as =
packets with GSMTAP headers - which appears to be what Johannes is =
thinking of - is another matter (but even if the answer is no, there is, =
as per my other message, a use for a LINKTYPE_GSMTAP/DLT_GSMTAP header =
type).  That might not be possible, as cellular modems, as you note, =
tend to hide a lot of lower-layer details from the host.
