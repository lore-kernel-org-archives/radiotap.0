From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: [RFC] capture file timestamping
Date: Wed, 26 Aug 2015 15:48:36 -0700
Message-ID: <55DE4244.9030407@superduper.net>
References: <1440497229.2192.28.camel@sipsolutions.net>	 <20150825162841.GR6823@pobox.com> <1440521168.2192.50.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1440521168.2192.50.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org



On 8/25/2015 9:46 AM, Johannes Berg wrote:
>
>> II. Using the timestamps to place graphic representations of frames
>>      on a timeline
> This is one.
>
> One I ran into recently is that I needed to check the relative timings
> of packets to verify the backoff function was working correctly, which
> is really just very similar to your I-A case.
>
>

This is exactly what I was doing when I ran into the current TSFT field 
limitations a few years ago. GPL code is here:

https://github.com/parc-wifi/wireshark

I'm working on getting this updated for 11ac now, so revisiting some of 
the same issues.

The HT and VHT headers in radiotap are incomplete, and would be much 
nicer if they could just include the signal field from the plcp (perhaps 
with a mask to indicate parts that are missing). This would be a better 
approach for 60GHz I think.

I'd like to display the L-SIG txop protection on the timeline as well.

Simon
