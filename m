From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: "Overall" and per-chain signal/noise values (was Re:
 multi-antenna handling)
Date: Tue, 15 Jan 2019 14:19:40 +0100
Message-ID: <314bf4573f84bf0df673e94e4e085522cce10fcd.camel@sipsolutions.net>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net>
	 <1373273952.8312.7.camel@jlt4.sipsolutions.net>
	 <C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu>
	 <1403679889.4140.2.camel@jlt4.sipsolutions.net>
	 <20140625090901.fa121a689f823f3af1db1e3a@lm7.fr>
	 <1403709105.4140.13.camel@jlt4.sipsolutions.net>
	 <636CB894-79D9-4CC3-B820-833761A9666D@alum.mit.edu>
	 <1403763600.4131.3.camel@jlt4.sipsolutions.net>
	 <0836AF8F-37B1-4E52-B14C-7D7B31D4C5E8@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <0836AF8F-37B1-4E52-B14C-7D7B31D4C5E8-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Matteo Cypriani <mcy-yxGd9NVxpOI@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Sun, 2018-12-30 at 13:47 -0800, Guy Harris wrote:
> On Jun 25, 2014, at 11:20 PM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> 
> > We actually have one per-chain value, and one "overall" value, the
> > latter is what we report in the first radiotap namespace, the per-chain
> > ones in the latter namespaces that only have the signal and antenna
> > value (but obviously we could add anything else that made sense per
> > antenna)
> > 
> > Maybe we shouldn't be reporting the "overall" value? The calculation of
> > that seems to be driver dependent, our (the Intel) driver just takes the
> > max. If ath9k has a more specific calculation then I can see how that's
> > a bit confusing but OTOH it actually reports what much else of the stack
> > used for further work.
> 
> About 4 1/2 years later, the ath9k driver plus the mac80211 code
> appears to provide the "overall" strength plus per-antenna strengths,
> at least as of the 4.17.10 kernel, so I guess it's somewhat of a *de
> facto* standard that there's an "overall" value.

I suppose you could argue that. The per-chain signals are actually
optional for drivers to provide, but the overall signal strength (which,
btw, isn't defined how this is derived from the per-chain signals if at
all) is more or less necessary for proper operation (roaming, ...)

> Given that, this is probably worth documenting - but not requiring, in
> case some adapter+driver combination doesn't supply it.
> 
> Presumably the description would be that:
> 
> 	if you see a signal strength indication, and *don't* see an
> antenna number before the end of the header or a Radiotap Namespace
> field, it's an "overall" value;
> 
> 	otherwise, it's a per-antenna value for the specified antenna.
> 
> Parsers must not assume that there will or won't be an "overall" value
> if there are per-antenna values.
> 
> The "overall" value for a multi-antenna receiver could be described as
> device-dependent, which might suggest that, unless you know the
> device, you shouldn't try to interpret it.

Makes sense. Want to update the github docs?

johannes
