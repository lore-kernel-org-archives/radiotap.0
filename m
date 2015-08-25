From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] capture file timestamping
Date: Tue, 25 Aug 2015 19:55:46 +0200
Message-ID: <1440525346.2192.55.camel@sipsolutions.net>
References: <1440497229.2192.28.camel@sipsolutions.net>
	 <20150825162841.GR6823@pobox.com>
	 <1440521168.2192.50.camel@sipsolutions.net>
	 <4E4FE63E-B636-4808-BBFF-6D2CE4EAFB2F@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4E4FE63E-B636-4808-BBFF-6D2CE4EAFB2F-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2015-08-25 at 10:47 -0700, Guy Harris wrote:
> 
> If you have tcpdump 4.6 or later, with libpcap 1.6 or later, on 
> Linux, you should have the --time-stamp-type and --list-time-stamp
> -types options.
> 
> If so, what does
> 
> 	> tcpdump --list-time-stamp-types
> 
> print?
> 
> If it prints "adapter" or "adapter_unsynced", you might want to try 
> those with the --time-stamp-type option, as those time stamp types 
> mean that the time stamp will come from the adapter rather than from 
> Linux.  ("unsynced" means that the time stamps aren't synchronized 
> with the host's clock.)

It does have "adapter_unsynced", but wouldn't the adapter also have to
support it? Ah, yes, if I do
	tcpdump -i wlan0 --list-time-stamp-types

it no longer shows it.

Although perhaps I could possibly convince the driver to report this
timestamp somehow, rather than changing radiotap.

> unless it's based on the TSF (which it probably won't be, as it 
> should, at least in principle, be Epoch time, although I think Linux 
> may have, at some point, changed adapter time stamps in a fashion 
> making them not useful as libpcap time stamps).

That, however, I almost certainly cannot do - I don't see how I'd
synchronize from the adapter time (a free-running 32-bit counter at
microseconds resolution) to the host time.

johannes
