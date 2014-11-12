From: "C. McPherson" <ccmcphe-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Subject: Re: Vendor Namespace Question
Date: Wed, 12 Nov 2014 15:55:13 -0500
Message-ID: <5463C931.6000502@verizon.net>
References: <54591CF9.7030106@verizon.net>
 (sfid-20141104_203850_228702_C706EE9A)
 <1415130476.2064.22.camel@sipsolutions.net>	<5459349F.9020903@verizon.net>
 <1415313070.17015.19.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1415313070.17015.19.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

I've been off for a while, but I will download it and use it. Thanks 
Johannes!!


On 11/06/2014 05:31 PM, Johannes Berg wrote:
> On Tue, 2014-11-04 at 15:18 -0500, C. McPherson wrote:
>> Thanks so much for the info Johannes. I did notice that rx_status was
>> getting full.  I'll go ahead and put it in skb->data, that's a good idea.
> I just sent a patch to restore vendor radiotap stuff in mac80211.
>
> Works for me, and I might actually have a use case for it, but please
> tell me if you have issues with it.
>
> johannes
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
