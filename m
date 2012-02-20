From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Mon, 20 Feb 2012 12:03:29 +0100
Message-ID: <1329735809.3458.14.camel@jlt3.sipsolutions.net>
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
	 <1326721599.3510.18.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398C3D354@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398C3D354-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

Sorry for the delay in reviewing this.

> >But now imagine a device misses a frame due to decode problem or so ...
> >then which one would you want:
> >1) subframe index skips that one
> >2) subframe index just increases
> >
> >Say
> >   [mpdu][pad][pad][----][pad][mpdu]
> >1) 0     1    2    (3)   4    5
> >2) 0     1    2          3    4
> >
> >but then the driver would have to guess at the padding? Not sure. In any case, we need to nail
> >this down, because in the case 2) the driver can number the subframes (but it's less useful),
> >and in the case 1) the device has to provide it (and not all do -- so we need a separate valid bit).
> >In the case 1), even the application (wireshark) could provide the subframe index?
> 
> Good you brought this up.
> 
> I had basically case 2) in mind. Even the device itself may not always
> be able to provide the index for subframes totally skipped due to
> decode problems. 

Yes, good point.

> It may sometimes be able to pass to the driver subframes with bad
> delimiter CRC and these would get indexed by the driver (with flag
> 0x10 set). So the principle is that only whatever subframes the device
> can pass to the driver, good or bad, get indexed.
> 
> But I now feel the application itself can provide the subframe
> indexing (as in case 2). It can use the subframe reference number and
> timestamp for this. The burden on the driver would be decreased, and
> we also save space in the Radiotap header by removing this field.

Makes sense to me. I guess that means we just remove the ampdu subframe
index from the proposal, so we have this?


 A-MPDU radiotap field
-----------------------
bit index: TBD
alignment: 4 bytes (u32)

 * ampdu reference number (u32)
 * flags (u16)
   - 0x01: driver reports 0-length subframes
   - 0x02: is 0-length subframe (valid if 0x01 set)
   - 0x04: last subframe known
           (should be set for all subframes if driver knows)
   - 0x08: is last subframe in ampdu (valid if 0x04 set)
           (clear for all but last subframe)
   - 0x10: delimiter CRC error
   - 0x20: delimiter CRC value known
 * delimiter CRC value (u8) (valid if flag 0x20 set)
 * u8 (reserved)


(I added the reserved field and changed the flags to u16, it seems
relatively likely that other fields will need u32 alignment so it seems
reasonable to reserve a byte here, maybe for VHT extensions?)

johannes
