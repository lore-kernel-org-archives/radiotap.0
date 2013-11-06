From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [Query] Decryption and Monitor Mode
Date: Wed, 06 Nov 2013 08:59:54 +0100
Message-ID: <1383724794.14307.2.camel__23809.4783890576$1383728898$gmane$org@jlt4.sipsolutions.net>
References: <CABPxzY++gCivs1u8nDtAeB5=p+ZkGHXmOnqud1hkh=TWB5Xprg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CABPxzY++gCivs1u8nDtAeB5=p+ZkGHXmOnqud1hkh=TWB5Xprg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Krishna Chaitanya <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, 2013-11-06 at 01:22 +0530, Krishna Chaitanya wrote:

> With this wireshark is not able to decode the packets, even thought
> they are decrypted. I propose 2 solutions

Well, you can say "ignore protected bit (with IV)" in the settings of
wireshark. But I agree that this is cumbersome, and previously floated
the idea of addings bits to radiotap to make this auto-detected.

> Radiotap and Wireshark:
> 
> 1) Add 2 flags to the radiotap RX Flags (HW Decrypted the packet,
> Packet has security Header (for some chipsets which consume the
> security header as well..??).)
> 
> Based on these the wireshark dissector decodes the packet accordingly.
> 
> mac80211:
> 
> 2) Remove the security header information in the monitor path as well
> based on the existing RX_FLAGS.
> 
> 
> Solutions 2 looks more elegant and simple, any comments?

Solution 2 drops information and makes the kernel code more expensive,
so I don't think we want that.

I think the radiotap bits would be better.

johannes
