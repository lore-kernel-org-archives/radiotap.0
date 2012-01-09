From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Mon, 09 Jan 2012 11:16:06 +0100
Message-ID: <1326104166.3451.21.camel@jlt3.sipsolutions.net>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398C20149-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

> If space isn=E2=80=99t at a premium, I agree we should make it u32. The=
re
> might be some embedded system sniffers where this space still matters,
> since it is multiplied by # of packets =E2=80=93 but see discussion a
> paragraph later.

Hm, not sure -- yes, it is multiplied, but it's still dwarfed by the
size of the packets -- this won't help much if your system is disk space
constrained -- in that case you'll need to get the data out of it as
soon as possible anyway.

> >> 2) (New) A bit to indicate if the driver is capable of returning=20
> >> information about individual zero MPDU length subframes.
> >Is that required/useful? It doesn't seem like per-frame information,
> and
> >global things are hard to deduct out of per-frame information?
>=20
> The thought process behind adding that is as follows:
[...]
> An explicit indication of the driver=E2=80=99s capability to return inf=
o on
> 0-subframes  was proposed as a means to solve problem a).  Including
> it in every frame was suggested as a means to solve b-d.

Good points.

> But there may be better solutions. Requesting comments/alternatives
> from the group.

I can't think of anything, and it's just a bit in there anyway.

> Note:
> Some additional wireshark suggestions will be required (subject to
> comments from the group regarding the above):
> - Bit 2 should be processed by wireshark for every single frame.
> - Due to c),  =E2=80=98Driver generated A-MPDU reference number=E2=80=99=
 should be
> considered separate for every channel.
> If the end user combines two different sniffer captures taken on the
> same channel having overlapping absolute times, IMHO that is an
> end-user mistake.

That's an interesting point regarding channels -- I think that should be
a note in the radiotap spec of the field (for implementation purposes)

> >> 3) (New) A bit to indicate if the current subframe is a zero MPDU=20
> >> length subframe. Valid if bit =E2=80=982=E2=80=99 above is set.
> >This seems good, but the if the driver isn't capable this bit would
> >always be 0 obviously, so I'm not sure I see the need for '2'.
>=20
> See explanation above regarding  why bit =E2=80=982=E2=80=99 might be r=
equired.
> Besides, if we retain bit 2, the sniffer app can first examine it, and
> if it is zero, it can skip two things at once:
> - examination of  bit 3 here and
> - any additional 0-subframe related code while processing the Index
> field below (depending on sniffer app design).

Ok.

> >> 4) (Updated) Index field: Zero-based index of the subframe, within
> the=20
> >> A-MPDU (u16). This is applicable to zero MPDU length subframes as=20
> >> well, if bit =E2=80=982=E2=80=99 above is set.
> >I guess a u16 will be sufficient even for VHT, right?
>=20
> Yes (there was one piece of information I couldn=E2=80=99t manage to fi=
nd in
> the draft I have when verifying this, but it should be ok).
>=20
> For reasons similar to a) and b) under the discussion for =E2=80=981) D=
river
> generated A-MPDU reference number=E2=80=99,  I propose making this a u3=
2.

Sounds good to me.

> >> Wireshark Implementation Suggestions:
> >>=20
> >> 1) If bit 2 is set by driver: Total value of zero MPDU length
> padding=20
> >> before a given non-zero length MPDU containing subframe should be=20
> >> calculated by Wireshark. If the Delimiter CRC is in error for any
> of=20
> >> the zero-length MPDU subframes involved, then the padding value
> should=20
> >> be set to invalid (Question: Can we set this to something like=20
> >> =E2=80=98indeterminate=E2=80=99 to differentiate it from the case wh=
ere bit 2 is
> 0,=20
> >> described below?)
> >"indeterminate" would be not adding the field to the parse tree at
> all
>=20
> Am not sure I understood this fully. If the field is not added to the
> parse tree, and one tries to work with the value of this field using a
> filter expression, or if one uses tshark to try and extract the value
> of the field, what would be the outcome?
> (Sorry, I should be digging this from the Wireshark documentation or
> sources. But I am a bit short on time, so thought of asking).

You can't work with the field then. It has no value, and any comparison
will return false. This is why you can do things like just
"radiotap.field" in a filter -- that checks that it exists.


> >> 4) (Optional) Value of subframe padding length after the MPDU could
> be=20
> >> calculated and displayed by Wireshark. Though this can be easily=20
> >> calculated from MPDU length, it is good to help users easily
> observe=20
> >> and filter on this value without having to resort to any post=20
> >> processing scripts. If the value is readily observable, it might
> help=20
> >> for example, a mobile app developer with only cursory knowledge of=20
> >> 802.11n to chance upon and inquire into the reason for the padding.
> >> For real-time apps operating in noisy RF environments, adjusting
> the=20
> >> payload bytes to minimize subframe padding may form one of many
> little=20
> >> optimizations  to extract better performance (depending on traffic=20
> >> characteristics).
> >What would it calculate, based on the data provided?
>=20
> I didn=E2=80=99t get which app you are referring to  =E2=80=93 Wireshar=
k or the
> real-time app?

Sorry, not sure -- either one? Any application that displays things?

> I was suggesting in my example that the developer of the real-time app
> would gain knowledge about the padding behavior when experimenting
> with Wireshark during a study phase. She could then develop the real
> time app such that it checks the TCP/IP and 802.11 settings to
> estimate what the MPDU size would be, and then adjusts the # of app
> payload bytes (fed into the socket) to minimize the subframe-end
> padding wastage. This would be one among a series of little
> optimizations (and it wouldn=E2=80=99t work all the time).
> This is just an illustration.
> Again, it is independent of the Radiotap field definition.

Right. I had misunderstood you -- you wanted wireshark to display the
padding saying it could easily be calculated, and I thought you were
referring to a calculation wireshark would make, while you were in fact
referring to a calculation the user of wireshark would make. Sorry :)


So let me briefly recap what we talked about, is that accurate?

 A-MPDU radiotap field
-----------------------
bit index: TBD
alignment: 4 bytes (u32)

 * ampdu reference number (u32)
 * ampdu subframe index (u32) [*1]
 * flags (u8?)
   - 0x01: driver reports 0-length subframes
   - 0x02: is 0-length subframe (valid if 0x01 set)
   - 0x04: last subframe known
           (should be set for all subframes if driver knows)
   - 0x08: is last subframe in ampdu (valid if 0x04 set)
           (clear for all but last subframe)
   - 0x10: delimiter CRC error
   - 0x20: delimiter CRC value known
 * delimiter CRC value (u8) (valid if flag 0x20 set)


[*1] you said subframe index would be valid if driver reports 0-length
subframes -- why not a separate bit to indicate this is valid?

johannes
