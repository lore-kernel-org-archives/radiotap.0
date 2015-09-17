From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] capture file timestamping
Date: Thu, 17 Sep 2015 18:51:38 +0200
Message-ID: <1442508698.2821.16.camel@sipsolutions.net>
References: <1440497229.2192.28.camel@sipsolutions.net>
		 <20150825162841.GR6823@pobox.com>
	 <1440521168.2192.50.camel@sipsolutions.net>
	 <55DE4244.9030407@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <55DE4244.9030407-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, 2015-08-26 at 15:48 -0700, Simon Barber wrote:
> 
> This is exactly what I was doing when I ran into the current TSFT 
> field limitations a few years ago. 

Right, I vaguely remembered that, hence the CC :)

> GPL code is here:
> 
> https://github.com/parc-wifi/wireshark

> I'm working on getting this updated for 11ac now, so revisiting some 
> of the same issues.

Ah, that's really nice! I really needed something like this the other
day, will check it out.

> The HT and VHT headers in radiotap are incomplete, and would be much 
> nicer if they could just include the signal field from the plcp 
> (perhaps with a mask to indicate parts that are missing). This would 
> be a better approach for 60GHz I think.

Yeah, can't really object to that, even if we might not be able to
provide all the data for all the hardware, and might have to re
-assemble the field from the available parsed data.

As far as our device is concerned we might perhaps be able to include
this data in firmware's monitor mode.

> I'd like to display the L-SIG txop protection on the timeline as 
> well.
> 

Good idea.


As far as the timestamp is concerned though, what would you suggest?

Also, what timestamp would be best for a tool like yours? I'm assuming
ours, which is the signal detection timestamp and inherently vague by
perhaps a dozen microseconds won't really work that well.

johannes
