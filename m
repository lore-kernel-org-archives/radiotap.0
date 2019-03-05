From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Radiotap header for S1G captures and associated changes and
 other definitions
Date: Tue, 05 Mar 2019 12:58:43 +0100
Message-ID: <56728a565c1f84862615f8804881bf72b7d12511.camel@sipsolutions.net>
References: <CACyXjPy-Lr143wcWaLkv-xgs9Ebc0j8pYfw8MzMXNEv2tLA0Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPy-Lr143wcWaLkv-xgs9Ebc0j8pYfw8MzMXNEv2tLA0Kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, Tasheng Lin <tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, "Aaron J. Lee" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Richard,

> 1. Channel field:
> 
> 3 new values for Mask: 0x0002 for 700 MHz, 0x0004 for 800 MHz and
> 0x0008 for 900 MHz spectrum channels respectively.

How much space do we have there btw? We're going to get 6-7 GHz channels
soon ... perhaps we should just give up on this field and put the actual
frequency & bandwidth etc. somewhere? If we don't already ...

> 2. 0-length MPDU field:
> 
> 1 new value: 0x02 in the type value: 2 indicates that this is an S1G
> NDP frame and that an S1G field is included in the Radiotap header..

I'm not sure I'd go as far as saying that it must have an S1G field in
this case.

> 3. The new S1G frame.
> 
> It consists of three 16-bit fields, an 8-bit field and a 40-bit field:
> 
> U16 known, U16 data1, U16 data2, U8 ndp_type, U8 ndp_data[5]
> 
> Known:
> 0x0001 S1G PPDU format known
> 0x0002 Response indication known
> 0x0004 Guard Interval known
> 0x0008 NSS known
> 0x0010 Bandwidth known
> 0x0020 MCS known
> 0x0040 Color known
> 0x0080 Is NDP

Don't think you need "Is NDP" now with the 0-length field change?

> 0x0100 NDP known

Better reword to "NDP data known" I think. Actually, you probably need
to split into "NDP type known" and "NDP data known"? Not sure if that's
realistic though, to know one and not the other? But you have a lot of
bits so it doesn't hurt to split it either.

> 0xFE00 Reserved
> 
> Data1:
> 0x0003: S1G PPDU Format: 0=S1G_1M, 1=S1G_SHORT, 2=S1G_LONG
> 0x000C: Response indication: 0=NO_RESPONSE, 1=NDP_RESPONSE,
> 2=NORMAL_RESPONSE, 3=LONG_RESPPNSE

typo - LONG_RESPONSE was intended?

> 0x0010: Reserved
> 0x0020: Guard interval: 0=Long GI, 1=Short GI
> 0x00C0: Number spatial streams: 0=1 Spatial stream, 1=2, .. 3=4 Spatial streams
> 0x0F00: Bandwidth: 0=1MHz, 1=2MHz, 2=4MHz, 3=8MHz, 4=16MHz, 5-15 reserved

You could make that 0x0700 and leave the 0x0800 bit reserved.

Not a big deal though since you have a lot of free bits in the 'known'
and 'data2' fields. But if you leave it reserved you could use it later
if needed as parsers wouldn't be using/showing it.

> 0xF000:  MCS (MCS rate index, 0-10, 11-15 reserved)
> 
> Data2:
> 0x000F: Color: 0-7

Similarly here, 0-7 fits into 3 bits.

> 0xFFF0: Reserved
> 
> NDP type:
> 0x00: NDP Control frame
> 0x01: NDP Management frame
> 0x02-0xFF: Reserved
> 
> NDP data:
> 
> These are as defined in 802.11ah-2016 Section 9.9 except that the top
> two bits of data[4] are:
> 
> 0x00: 1MHz
> 0x01: 2MHz
> 0x02-0x03: Reserved

Is it really worth packing this into the end? You could have lots of
space in e.g. the data2 or NDP type fields (I guess, you reserved lots
of values there).

> The S1G NPD format is essentially from section 9.9 of 802.11ah-2016
> with some additional syntactic sugar:
> 
> It is a 40-bit field.

Not sure I understand this sentence. What's the syntactic sugar in being
a 40-bit field?

> In between, a 1MHz NDP CMAC frame contains 26 used bits and 13 unused
> bits. The used bits are defined in section 9.9 of 802.11ah-2016. A
> 2MHz NDP CMAC frame contains 37 used bits and one unused bit. Again,
> the used bits are defined in 802.11ah-2016.

Right.

However, these also come with a 1-bit "NDP indication", 4-bit CRC and 6-
bit tail; perhaps it should be at least *possible* to capture those too,
even if nobody might do that right now? Then you'd need a total of 48
bits for this, afaict.


I guess a more fundamental question would be whether we should treat
these as metadata or payload. Obviously here we're treating them as
metadata and saying (by way of the 0-length field) that there's no
payload. But perhaps these *should* in fact be the payload instead, and
not use the 0-length field at all?

I really don't know the answer to that. It seems fairly obvious that
this one is more convenient, and the format of those frames is very
specific to the S1G things, and they couldn't really be used outside of
S1G unlike the 802.11 header & frame. So I think I'm happy with this,
just wanted to note this design decision explicitly.

johannes
