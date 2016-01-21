From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] timestamp field
Date: Thu, 21 Jan 2016 08:40:11 +0100
Message-ID: <1453362011.13263.13.camel@sipsolutions.net>
References: <1449236499.2574.4.camel@sipsolutions.net>
	 <1453293763.13263.8.camel@sipsolutions.net>
	 <569FC7FB.8090009@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <569FC7FB.8090009-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, 2016-01-20 at 09:46 -0800, Simon Barber wrote:
> I like this proposal. One aspect that is missing is to define the 
> meaning of the timestamp with aggregates. Should this field be
> present for all subframes, or just the first/last? Should the
> timestamp refer to the subframes, or the whole A-MPDU? Currently what
> I see in different generators is the MACTIME field is either the same
> for all subframes, and always refers to the whole A-MPDU - not
> individual subframes. For one generator the MACTIME was 0 for
> subframes after the 1st. Sometimes the signal strength is only
> present on the last subframe.

Yeah, I had actually noticed this - our device also has the PHY
acquisition timestamp of the A-MPDU, in all the frames. We should
probably elide it in all but the first, but if we somehow lost the
first frame that would be bad. I'm not even sure you can identify that
today at all though.

I don't think we can *standardise* the behaviour, but perhaps providing
flags for the different behaviours would at least help you identify it?

Any thoughts what flags would be useful?

> Macbooks generate radtiotap files with incorrect rate fields for 
> subframes with CRC errors.

That's a bit odd. Talk to Broadcom? ;-)

> If you look in the wireshark gerrit, you will see I have been porting
> my timeline viewer code over to the current devel mainline.
> 

Very nice! :)

johannes
