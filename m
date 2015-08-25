From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [RFC] capture file timestamping
Date: Tue, 25 Aug 2015 10:47:48 -0700
Message-ID: <4E4FE63E-B636-4808-BBFF-6D2CE4EAFB2F@alum.mit.edu>
References: <1440497229.2192.28.camel@sipsolutions.net> <20150825162841.GR6823@pobox.com> <1440521168.2192.50.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1440521168.2192.50.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
List-Id: radiotap@radiotap.org


On Aug 25, 2015, at 9:46 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:

> The timestamps added by the capture (e.g. tcpdump) are also =
notoriously
> unreliable since there are processing delays - even without =
reordering.

If you have tcpdump 4.6 or later, with libpcap 1.6 or later, on Linux, =
you should have the --time-stamp-type and --list-time-stamp-types =
options.

If so, what does

	tcpdump --list-time-stamp-types

print?

If it prints "adapter" or "adapter_unsynced", you might want to try =
those with the --time-stamp-type option, as those time stamp types mean =
that the time stamp will come from the adapter rather than from Linux.  =
("unsynced" means that the time stamps aren't synchronized with the =
host's clock.)

That won't address

> b) the timestamps there are at the end of the frame,
>    beginning is much more useful

unless that's how the adapter time-stamps the packet and won't address

> c) the timer I'm getting is an internal hardware timer and I can't
>    easily derive either a TSF-based value, nor easily put it at the
>    first bit/symbol of the MPDU (since it's earlier) [*]

unless it's based on the TSF (which it probably won't be, as it should, =
at least in principle, be Epoch time, although I think Linux may have, =
at some point, changed adapter time stamps in a fashion making them not =
useful as libpcap time stamps).

(I.e., the "host time stamps are applied at times not well correlated =
with actual network events" problem is not best solved with radiotap, =
it's best solved by libpcap and the capture mechanism atop which it =
runs, but "I want a time stamp that comes from the TSF timers" is one =
best solved with radiotap.)=
