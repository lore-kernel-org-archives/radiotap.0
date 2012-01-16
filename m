From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Mon, 16 Jan 2012 14:46:39 +0100
Message-ID: <1326721599.3510.18.camel@jlt3.sipsolutions.net>
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
	 <21E1C3B49A18BA428D58607D5EEA5398C20149@nasanexd02b.na.qualcomm.com>
	 ,<1326104166.3451.21.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398C36652@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398C36652-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

> > A-MPDU radiotap field
> >-----------------------
> >bit index: TBD
> >alignment: 4 bytes (u32)
> >
> > * ampdu reference number (u32)

> We need to add a note about the reference number being different for every channel.

Right, sorry, missed that.

> > * ampdu subframe index (u32) [*1]
> > * flags (u8?)
> >   - 0x01: driver reports 0-length subframes
> >   - 0x02: is 0-length subframe (valid if 0x01 set)
> >   - 0x04: last subframe known
> >           (should be set for all subframes if driver knows)
> >   - 0x08: is last subframe in ampdu (valid if 0x04 set)
> >           (clear for all but last subframe)
> >   - 0x10: delimiter CRC error
> >   - 0x20: delimiter CRC value known
> > * delimiter CRC value (u8) (valid if flag 0x20 set)
> >
> >
> >[*1] you said subframe index would be valid if driver reports 0-length
> >subframes -- why not a separate bit to indicate this is valid?

> The subframe index would always be valid. 

Ok, I misunderstood this then.

> It would provide the position of the current subframe, in within the
> A-MPDU (irrespective of whether the subframe is zero or non-zero MPDU
> length). The index value itself is zero-based (i.e., it starts from 0
> and increments onwards).
> 
> a) If 0x01 is set, then the index for the current subframe takes into
> account previous zero MPDU length subframes (because these previous
> zero subframes have been reported individually and the index
> incremented for each of them).
> b) If 0x01 is clear, then the index for the current subframe does not
> account for previous zero MPDU length subframes that might have been
> transmitted over the air.
> 
> Thus if two different drivers are observing the same traffic:
> The driver that sets 0x01 will report a larger index value for a given
> non-zero subframe, than the driver that clears 0x01 (if zero padding
> occurs before that subframe). 
> 
> If 0x01 is set, then the sniffer app can calculate zero padding by
> processing index information and MPDU length field values across
> subframes.


Ok, but I think that then we still need to resolve a small ambiguity
here. Imagine this:

   [mpdu][pad][pad][mpdu][pad][mpdu]
a) 0     1    2    3     4    5
b) 0               1          2

Right?

But now imagine a device misses a frame due to decode problem or so ...
then which one would you want:
1) subframe index skips that one
2) subframe index just increases

Say
   [mpdu][pad][pad][----][pad][mpdu]
1) 0     1    2    (3)   4    5
2) 0     1    2          3    4

but then the driver would have to guess at the padding? Not sure. In any
case, we need to nail this down, because in the case 2) the driver can
number the subframes (but it's less useful), and in the case 1) the
device has to provide it (and not all do -- so we need a separate valid
bit). In the case 1), even the application (wireshark) could provide the
subframe index?

johannes
