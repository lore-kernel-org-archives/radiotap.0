From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Wed, 03 Feb 2010 21:50:38 -0800
Message-ID: <1F39C830-A521-456A-A5FA-2FC97914A74A@me.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
 <20100126174728.GV1060@ojctech.com> <1264584965.25642.15.camel@johannes.local>
 <20100127153002.GC1060@ojctech.com>
 <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
 <loom.20100201T230554-2@post.gmane.org> <20100202195424.GE1060@ojctech.com>
 <C33B109A-9A6C-4931-8A69-5147A418E8B5@me.com>
 <d521a2311002031711i4293ae26i8c460aa3f41997e6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-reply-to: <d521a2311002031711i4293ae26i8c460aa3f41997e6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Feb 3, 2010, at 5:11 PM, Joshua (Shiwei) Zhao wrote:
> In 802.11, there is no official concept of 20L or 20U. There is
> primary channel and secondary channel used in a BSS.

I know what you mean about about the channel definition. The IEs
in beacons and probe responses will describe a 40 MHz BSS as
having the control (primary) and extension (secondary)
channel. So if you were setting up the channel pair {36,40}, you
might pick channel 36 as control and have the extension channel
above on 40. You could also set it up as ctl 40 with extension
below on 36. Both would cover the same 40 MHz, but as you say,
the 20 MHz traffic should always go on the control channel.

But the spec does have the concept of 20U and 20L in terms of the
phy layer. Section 20.2.2 "TXVECTOR and RXVECTOR parameters"
defines the CH_OFFSET field with values {CH_OFF_20, CH_OFF_40,
CH_OFF_20U, CH_OFF_20L}. So it is not a BSS attribute, which is
where I think you are coming from, but it is an attribute of
packets both on TX and RX.

> However, as a
> sniffer sees a packet on the air, sniffer can only tell the packet's
> bandwidth and operating channel. But we know, if a 40MHz-capable
> AP/STA sends a 20MHz signal, it must use its primary channel.

Sure, any 20 MHz traffic from the first BSS I mentioned {ctl 36,
ext 40} would be on channel 36 (CH_OFF_20L, or just 20L as I
suggested). But that does not mean all 20 MHz traffic will be on
36. 20 MHz traffic from the other BSS {ext 36, ctl 40} would be
on 40, and legacy BSSs might be on either. So the sniffer would
pick up the packets as 20L or 20U while the radio was tuned to
{36,40}.

As I mentioned, you are loosing what seems like important
information if you just capture a packet as (channel 36 20MHz)
instead of (20L, channel 36-40). You can always have the sniffer
app display the resulting channel (ch36) with the second form
because it has more information. But with the first form, you've
lost the info about what the receiver mode was at the time of
capture. Also, for a user app using radio tap, using the
first form would not allow for the 20U/L transmissions.

> So I agree with what David described using channel flag indicating
> bandwidth and guard interval. A MCS field is good for HT case.


And LDPC vs BCC?

-Bill
