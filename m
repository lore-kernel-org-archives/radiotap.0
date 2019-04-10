From: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Wed, 10 Apr 2019 13:35:52 +0700
Message-ID: <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw__40474.624005013$1554878177$gmane$org@mail.gmail.com>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <cf07ae24c436f92769f9289d208f01846ebe8826.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

Hello Johannes,

FYI, there already was a discussion about GSMTAPv3:

https://www.youtube.com/watch?v=vum9jzavZi0&list=PL07C78AF831FFE8F9&index=10

but unfortunately, nobody has invested time into this (yet?).

> 1) Why the design with encapsulating it in UDP?

This gives us a possibility to "demux" multiple GSMTAP streams on the
receiving side, e.g. if you are running multiple processes.

> 2) The format of gsmtap doesn't seem very extensible [...]

ACK. I definitely support the idea of using TLVs.

With best regards,
Vadim Yanitskiy.
