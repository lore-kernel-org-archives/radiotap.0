From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: [RFA] timestamp field
Date: Wed, 03 Feb 2016 14:29:42 -0800
Message-ID: <152a94167f0.27f7.e972a4f4d859b00521b2b659602cb2f9@superduper.net>
References: <1449236499.2574.4.camel@sipsolutions.net>
 <1453293763.13263.8.camel@sipsolutions.net>
 <569FC7FB.8090009@superduper.net>
 <1453362011.13263.13.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1453362011.13263.13.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

My wireshark timeline code is out for early review.

https://code.wireshark.org/review/#/c/13694

Simon

Sent with AquaMail for Android
http://www.aqua-mail.com


On January 20, 2016 11:40:14 PM Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>=
=20
wrote:

> On Wed, 2016-01-20 at 09:46 -0800, Simon Barber wrote:
>> I like this proposal. One aspect that is missing is to define the
>> meaning of the timestamp with aggregates. Should this field be
>> present for all subframes, or just the first/last? Should the
>> timestamp refer to the subframes, or the whole A-MPDU? Currently what
>> I see in different generators is the MACTIME field is either the same
>> for all subframes, and always refers to the whole A-MPDU - not
>> individual subframes. For one generator the MACTIME was 0 for
>> subframes after the 1st. Sometimes the signal strength is only
>> present on the last subframe.
>
> Yeah, I had actually noticed this - our device also has the PHY
> acquisition timestamp of the A-MPDU, in all the frames. We should
> probably elide it in all but the first, but if we somehow lost the
> first frame that would be bad. I'm not even sure you can identify that
> today at all though.
>
> I don't think we can *standardise* the behaviour, but perhaps providing
> flags for the different behaviours would at least help you identify it?
>
> Any thoughts what flags would be useful?
>
>> Macbooks generate radtiotap files with incorrect rate fields for
>> subframes with CRC errors.
>
> That's a bit odd. Talk to Broadcom? ;-)
>
>> If you look in the wireshark gerrit, you will see I have been porting
>> my timeline viewer code over to the current devel mainline.
>>
>
> Very nice! :)
>
> johannes
