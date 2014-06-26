From: Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Thu, 26 Jun 2014 10:24:57 +0200
Message-ID: <53ABD8D9.3030705@openwrt.org>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net>	 <1373273952.8312.7.camel@jlt4.sipsolutions.net>	 <C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu>	 <1403679889.4140.2.camel@jlt4.sipsolutions.net>	 <20140625090901.fa121a689f823f3af1db1e3a@lm7.fr>	 <1403709105.4140.13.camel@jlt4.sipsolutions.net>	 <636CB894-79D9-4CC3-B820-833761A9666D@alum.mit.edu> <1403763600.4131.3.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1403763600.4131.3.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Matteo Cypriani <mcy-yxGd9NVxpOI@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On 2014-06-26 08:20, Johannes Berg wrote:
>>     Present flags
>>         .... .... .... .... .... .... .... ...1 = TSFT: True
>>         .... .... .... .... .... .... .... ..1. = Flags: True
>>         .... .... .... .... .... .... .... .1.. = Rate: True
>>         .... .... .... .... .... .... .... 1... = Channel: True
>>         .... .... .... .... .... .... ...0 .... = FHSS: False
>>         .... .... .... .... .... .... ..1. .... = dBm Antenna Signal: True
>>         .... .... .... .... .... 0... .... .... = Antenna: False
> [...]
>>         .... .... .... .... .... .... ..1. .... = dBm Antenna Signal: True
>>         .... .... .... .... .... 1... .... .... = Antenna: True
>>         .... .... .... .... .... .... ..1. .... = dBm Antenna Signal: True
>>         .... .... .... .... .... 1... .... .... = Antenna: True
> 
>>     SSI Signal: -67 dBm
> 
>>     SSI Signal: -68 dBm
>>     Antenna: 0
>>     SSI Signal: -73 dBm
>>     Antenna: 1
> 
> We actually have one per-chain value, and one "overall" value, the
> latter is what we report in the first radiotap namespace, the per-chain
> ones in the latter namespaces that only have the signal and antenna
> value (but obviously we could add anything else that made sense per
> antenna)
> 
> Maybe we shouldn't be reporting the "overall" value? The calculation of
> that seems to be driver dependent, our (the Intel) driver just takes the
> max. If ath9k has a more specific calculation then I can see how that's
> a bit confusing but OTOH it actually reports what much else of the stack
> used for further work.
ath9k does not calculate the combined signal strength itself, it simply
passes on what the hardware reports. I'm pretty sure the hardware
reports the effective signal strength after combining chain inputs (e.g.
via MRC).

- Felix
