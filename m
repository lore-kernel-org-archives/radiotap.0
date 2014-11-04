From: "C. McPherson" <ccmcphe-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Subject: Re: Vendor Namespace Question
Date: Tue, 04 Nov 2014 15:18:39 -0500
Message-ID: <5459349F.9020903@verizon.net>
References: <54591CF9.7030106@verizon.net>
 (sfid-20141104_203850_228702_C706EE9A)
 <1415130476.2064.22.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-reply-to: <1415130476.2064.22.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Thanks so much for the info Johannes. I did notice that rx_status was 
getting full.  I'll go ahead and put it in skb->data, that's a good idea.
Clyde

On 11/04/2014 02:47 PM, Johannes Berg wrote:
> On Tue, 2014-11-04 at 13:37 -0500, C. McPherson wrote:
>> Hello all:
>> I was just trying to use the latest stable backports-3.18-rc1-1 and I
>> noticed that there is no longer structure members in the
>> ieee80211_rx_status structure for Vendor namespace information?  In my
>> backports 3.14 version I used them to add some register information to
>> the radiotap header in the lab. How does one use the vendor name space
>> without those structure members?
> We removed this from the Linux kernel because there was no driver using
> it and we needed the space for other purposes. That said, it shouldn't
> be too difficult to put it back by keeping the OUI/subtype also in the
> skb->data rather than the rx_status (which is now full enough to no
> longer have space for it, I believe)
>
> johannes
>
>
