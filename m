From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: [RFA] timestamp field
Date: Wed, 20 Jan 2016 09:46:35 -0800
Message-ID: <569FC7FB.8090009@superduper.net>
References: <1449236499.2574.4.camel@sipsolutions.net>
 <1453293763.13263.8.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1453293763.13263.8.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

I like this proposal. One aspect that is missing is to define the 
meaning of the timestamp with aggregates. Should this field be present 
for all subframes, or just the first/last? Should the timestamp refer to 
the subframes, or the whole A-MPDU? Currently what I see in different 
generators is the MACTIME field is either the same for all subframes, 
and always refers to the whole A-MPDU - not individual subframes. For 
one generator the MACTIME was 0 for subframes after the 1st. Sometimes 
the signal strength is only present on the last subframe.

Macbooks generate radtiotap files with incorrect rate fields for 
subframes with CRC errors.

If you look in the wireshark gerrit, you will see I have been porting my 
timeline viewer code over to the current devel mainline.

Simon

On 1/20/2016 4:42 AM, Johannes Berg wrote:
> Repost, since a few weeks have passed.
>
> Any comments?
>
> Simon, would this help you at all?
>
> johannes
>
> On Fri, 2015-12-04 at 14:41 +0100, Johannes Berg wrote:
>> Hi all,
>>
>> This is a request for adoption of the timestamp field as documented on
>> http://www.radiotap.org/suggested-fields/timestamp
>>
>> I've attached the necessary wireshark patch, as well as a patch to the
>> Linux hardware simulator (mac80211_hwsim) to generate a dummy field for
>> experimentation.
>>
>> I'd previously sent an RFC, but I didn't receive that much feedback so
>> I've just tried to be fairly generic here.
>>
>> johannes
