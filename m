From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Mon, 15 Apr 2019 11:28:30 +0200
Message-ID: <446da2afcad3c7bb539027147030649ad08f3f33.camel@sipsolutions.net>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
	 <20190410233213.GN25552@nataraja>
	 <1462659018bc40830efbe2348791b8df45b54cff.camel@sipsolutions.net>
	 <1089142F-2966-4C41-921B-465FBA721E79@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1089142F-2966-4C41-921B-465FBA721E79-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, 2019-04-12 at 12:48 -0700, Guy Harris wrote:

> I.e., there's a split there between "capture" and "getting the packets
> from a capture delivered to you over an IP network".

Right. That's what I was trying to get at, you said it much more
succinctly.

> Depending on how your system is set up:
> 
> 	$ ls -l /dev/bpf*
> 	crw-rw----  1 root  access_bpf   23,   0 Apr 10 22:57 /dev/bpf0
> 	crw-rw----  1 root  access_bpf   23,   1 Apr 10 22:56 /dev/bpf1
> 
> 		...
> 
> and it could just be rw-rw-rw-.  Perhaps other systems make it harder
> to grant capture privileges.

Yeah, generally it's not that *hard*. It still seems *wrong*, and e.g.
it would also mean if you do need to do it remotely you'd have to filter
out your own remote control (ssh) traffic lest you cause traffic
amplification, etc.

johannes
