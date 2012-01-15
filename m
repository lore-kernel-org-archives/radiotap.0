From: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Sun, 15 Jan 2012 19:14:30 +0000
Message-ID: <21E1C3B49A18BA428D58607D5EEA5398C36652@nasanexd02b.na.qualcomm.com>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
	 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>
	 ,<1320847366.3845.72.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BBBD18@nasanexd02b.na.qualcomm.com>
	 ,<1321259214.4472.16.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BC8C00@nasanexd02b.na.qualcomm.com>
	 <1321867620.3999.7.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398C1F289@nasanexd02b.na.qualcomm.com>
	 ,<1325673736.3339.27.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398C20149@nasanexd02b.na.qualcomm.com>,<1326104166.3451.21.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1326104166.3451.21.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,=0A=
=0A=
>> If space isn=92t at a premium, I agree we should make it u32. There=0A=
>> might be some embedded system sniffers where this space still matters,=
=0A=
>> since it is multiplied by # of packets =96 but see discussion a=0A=
>> paragraph later.=0A=
>Hm, not sure -- yes, it is multiplied, but it's still dwarfed by the=0A=
>size of the packets -- this won't help much if your system is disk space=
=0A=
>constrained -- in that case you'll need to get the data out of it as=0A=
>soon as possible anyway.=0A=
I agree. In any case, we need the extra bytes for 'future-proofing'.=0A=
=0A=
>> I didn=92t get which app you are referring to  =96 Wireshark or the=0A=
>> real-time app?=0A=
>Sorry, not sure -- either one? Any application that displays things?=0A=
You summarized correctly below about the calculations in the illustration I=
 presented. =0A=
=0A=
>> I was suggesting in my example that the developer of the real-time app=
=0A=
>> would gain knowledge about the padding behavior when experimenting=0A=
>> with Wireshark during a study phase. She could then develop the real=0A=
>> time app such that it checks the TCP/IP and 802.11 settings to=0A=
>> estimate what the MPDU size would be, and then adjusts the # of app=0A=
>> payload bytes (fed into the socket) to minimize the subframe-end=0A=
>> padding wastage. This would be one among a series of little=0A=
>> optimizations (and it wouldn=92t work all the time).=0A=
>> This is just an illustration.=0A=
>> Again, it is independent of the Radiotap field definition.=0A=
>Right. I had misunderstood you -- you wanted wireshark to display the=0A=
>padding saying it could easily be calculated, and I thought you were=0A=
>referring to a calculation wireshark would make, while you were in fact=0A=
>referring to a calculation the user of wireshark would make. Sorry :)=0A=
=0A=
>So let me briefly recap what we talked about, is that accurate?=0A=
Thanks for summarizing the field definitions. =0A=
=0A=
> A-MPDU radiotap field=0A=
>-----------------------=0A=
>bit index: TBD=0A=
>alignment: 4 bytes (u32)=0A=
>=0A=
> * ampdu reference number (u32)=0A=
We need to add a note about the reference number being different for every =
channel.=0A=
=0A=
> * ampdu subframe index (u32) [*1]=0A=
> * flags (u8?)=0A=
>   - 0x01: driver reports 0-length subframes=0A=
>   - 0x02: is 0-length subframe (valid if 0x01 set)=0A=
>   - 0x04: last subframe known=0A=
>           (should be set for all subframes if driver knows)=0A=
>   - 0x08: is last subframe in ampdu (valid if 0x04 set)=0A=
>           (clear for all but last subframe)=0A=
>   - 0x10: delimiter CRC error=0A=
>   - 0x20: delimiter CRC value known=0A=
> * delimiter CRC value (u8) (valid if flag 0x20 set)=0A=
>=0A=
>=0A=
>[*1] you said subframe index would be valid if driver reports 0-length=0A=
>subframes -- why not a separate bit to indicate this is valid?=0A=
The subframe index would always be valid. It would provide the position of =
the current subframe, in within the A-MPDU (irrespective of whether the sub=
frame is zero or non-zero MPDU length). The index value itself is zero-base=
d (i.e., it starts from 0 and increments onwards).=0A=
=0A=
a) If 0x01 is set, then the index for the current subframe takes into accou=
nt previous zero MPDU length subframes (because these previous zero subfram=
es have been reported individually and the index incremented for each of th=
em).=0A=
b) If 0x01 is clear, then the index for the current subframe does not accou=
nt for previous zero MPDU length subframes that might have been transmitted=
 over the air.=0A=
=0A=
Thus if two different drivers are observing the same traffic:=0A=
The driver that sets 0x01 will report a larger index value for a given non-=
zero subframe, than the driver that clears 0x01 (if zero padding occurs bef=
ore that subframe). =0A=
=0A=
If 0x01 is set, then the sniffer app can calculate zero padding by processi=
ng index information and MPDU length field values across subframes.=0A=
=0A=
Everything else looks good.=0A=
=0A=
Regds,=0A=
Krishna.=0A=
