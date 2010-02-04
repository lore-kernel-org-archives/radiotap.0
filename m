From: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Wed, 3 Feb 2010 17:11:06 -0800
Message-ID: <d521a2311002031711i4293ae26i8c460aa3f41997e6@mail.gmail.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <20100126174728.GV1060@ojctech.com>
	 <1264584965.25642.15.camel@johannes.local>
	 <20100127153002.GC1060@ojctech.com>
	 <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
	 <loom.20100201T230554-2@post.gmane.org>
	 <20100202195424.GE1060@ojctech.com>
	 <C33B109A-9A6C-4931-8A69-5147A418E8B5@me.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C33B109A-9A6C-4931-8A69-5147A418E8B5-BUHhN+a2lJ4@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

In 802.11, there is no official concept of 20L or 20U. There is
primary channel and secondary channel used in a BSS. However, as a
sniffer sees a packet on the air, sniffer can only tell the packet's
bandwidth and operating channel. But we know, if a 40MHz-capable
AP/STA sends a 20MHz signal, it must use its primary channel.

So I agree with what David described using channel flag indicating
bandwidth and guard interval. A MCS field is good for HT case.

David,
where is the details about freeBSD's definition?

Thanks,
Joshua


On Tue, Feb 2, 2010 at 9:24 PM, Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org> wrote:
> On Feb 2, 2010, at 11:54 AM, David Young wrote:
>> On Mon, Feb 01, 2010 at 10:09:37PM +0000, Bill Stafford wrote:
>>>
>>> So the bandwidth options for a packet when the device is tuned to a 40 MHz
>>> channel are:
>>> 40 MHz (full 40 MHz bandwidth packet)
>>> 20L (20 MHz packet in the lower 20 MHz of the 40 MHz channel)
>>> 20U (20 MHz packet in the upper 20 MHz of the 40 MHz channel)
>>>
>>> When tuned to a 20 MHz channel, the packets can only be 20MHz
>>
>> My recollection of 802.11n may be incorrect, but aren't 20L and 20U HT
>> transmission channels aliases for the same center frequency and width as
>> a 20 MHz HT/legacy channel?
>
> As I understand it, those transmission modes, and rx attributes,
> do represent packets on the the air that look just like packets
> sent by a device tuned to the 20 MHz channels. So if a device is
> on the 40 MHz channel that is the pair of {36,40}, then when it
> transmits a 20L packet, it should be received by a device tuned
> to the 20 MHz channel 36 just as if the transmitter had been
> tuned to 36. So in that way you could think of it as an
> alias---at least from what you would see on the air. But packet
> reception would be from a radio that is really tuned to a 40 MHz
> wide channel. I've got to assume that the transmit side would
> also be operating in a 40 MHz mode as it generated the 20U or 20L
> packet. So these transmit/receive modes are different than being
> tuned to a 20 MHz channel.
>
> I think it is an important piece of information for capture on
> both transmit and receive. For instance, if a capture shows that
> a receiver is getting a higher rate of packet errors when it
> receives 20L packets from the 40 MHz channel pair {36,40}, than
> it is when receiving 20 MHz packets while tuned to 36, then you
> might be suspicious of how well the 20L decode is working. If the
> capture just reported 20 MHz packets on 36 in both cases, you
> would not have anything to go on. Same sort of example for tx.
>
> Also, on use of RadioTap as an app level 802.11 packet format,
> you would want to be able to make the distinction between
> remaining on a 40 MHz channel and sending a 20L packet, and
> actually switching to lower 20 MHz channel and sending a packet.
>
> -Bill
>
>
