From: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Sun, 13 Nov 2011 16:49:56 +0000
Message-ID: <21E1C3B49A18BA428D58607D5EEA5398BBBD18@nasanexd02b.na.qualcomm.com>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
	 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>,<1320847366.3845.72.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1320847366.3845.72.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org" <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,=0A=
=0A=
>I don't think the length of the padding is=0A=
>actually needed -- it can be calculated after the fact since it is=0A=
>always 0-3 bytes up to a multiple of 4.=0A=
The objective behind suggesting its inclusion was to help users easily obse=
rve and filter on this value without having to resort to any post processin=
g scripts. If the value is readily observable, it might help for example, a=
 mobile app developer with only cursory knowledge of 802.11n to chance upon=
 and inquire into the reason for the padding. For real-time apps operating =
in noisy RF environments, adjusting the payload bytes to minimize subframe =
padding may form one of many little optimizations  to extract better perfor=
mance (depending on traffic characteristics). In the absence of an explicit=
ly viewable field, the possibility might not occur to some users.=0A=
However, in case the design philosophy behind radiotap is to store only non=
-deducible information, I agree we should stick to that. May be Wireshark d=
issector code can independently calculate and display this info instead? (A=
m yet to get familiar with the code internals, especially with regard to ho=
w filtering is impacted by this).=0A=
=0A=
>The number of zero delimiters=0A=
>would be more interesting.=0A=
I agree. Also (as implicit in your reply) instead of providing the number o=
f bytes, it can simply be the number of delimiters.=0A=
But the second part of the discussion below for point 3) 'Delimiter CRC' op=
ens up a new question as to whether we should have this subfield at all.=0A=
=0A=
>I'm not sure how to deal with the corruption case.=0A=
See discussion below for point 3) 'Delimiter CRC'=0A=
=0A=
>> 2) A bit to indicate if this is the last subframe in the A-MPDU.=0A=
>> Though there might be other ways to infer this information, having it=0A=
>> as an explicit field would provide convenience.=0A=
>That seems useful, although I'm not even sure how you would even know=0A=
>that it is the last one?=0A=
It is possible for hardware to detect this and provide this information to =
the driver (am making a generic technical statement without referring to sp=
ecific products here). For products not having this capability, this subfie=
ld can be marked as invalid (if the driver has no other way to infer the in=
formation).=0A=
=0A=
>> 3) A bit to indicate if the Delimiter CRC is in error.=0A=
>That's useful, but in that case are you even decoding the MPDU and=0A=
>passing it up?=0A=
In case the delimiter CRC for a subframe containing an MPDU is corrupted, i=
s it an option to record and display only the radiotap header without the (=
suspect) MPDU following it? This will at least let the user know a subframe=
 corruption has happened. Except the 'Delimiter CRC error' bit, all other A=
-MPDU status field contents can be set as invalid.=0A=
If this option is not available, may be we should just drop 3 (and by exten=
sion, 4 'Delimiter CRC Value') to avoid ambiguity.=0A=
=0A=
>Also what if a zero delimiter has a bad CRC? Or what if=0A=
>it just got corrupted and you have to recover parsing? I'm not sure we=0A=
>can cover all these cases.=0A=
Assuming the option discussed above is available:=0A=
Perhaps we should limit the scope of all A-MPDU status field information as=
 being applicable only to subframes actually containing MPDUs. Even 1b, 'Nu=
mber of zero delimiters before current subframe' would be with reference to=
 a given 'non-zero' MPDU bearing subframe. =0A=
If we accept the above limitation, then a zero delimiter having a bad CRC d=
oesn't matter for subfield 3) 'Delimiter CRC error'. We will never be provi=
ding this information for any zero delimiter. However, there is an open que=
stion about what happens once hardware recovers parsing after a corrupted z=
ero delimiter and and successfully gets a non-zero MPDU bearing subframe. G=
enerally speaking, I feel there is scope for ambiguity/variances about how =
differing products can react and return information used for constructing 1=
b. In case this is a concern, we could drop 1b as well. =0A=
=0A=
Regards,=0A=
Krishna=0A=
