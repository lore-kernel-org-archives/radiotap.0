From: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Sun, 20 Nov 2011 16:37:25 +0000
Message-ID: <21E1C3B49A18BA428D58607D5EEA5398BC8C00@nasanexd02b.na.qualcomm.com>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
	 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>
	 ,<1320847366.3845.72.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BBBD18@nasanexd02b.na.qualcomm.com>,<1321259214.4472.16.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1321259214.4472.16.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,=0A=
=0A=
I apologize for the delay in responding. Was held up with some other work.=
=0A=
=0A=
>>>I don't think the length of the padding is=0A=
>>>actually needed -- it can be calculated after the fact since it is=0A=
>>>always 0-3 bytes up to a multiple of 4.=0A=
>=0A=
>> The objective behind suggesting its inclusion was to help users easily=
=0A=
>> observe and filter on this value without having to resort to any post=0A=
>> processing scripts.=0A=
[cut]=0A=
>> However, in case the design philosophy behind radiotap is to store=0A=
>> only non-deducible information, I agree we should stick to that. May=0A=
>> be Wireshark dissector code can independently calculate and display=0A=
>> this info instead? (Am yet to get familiar with the code internals,=0A=
>> especially with regard to how filtering is impacted by this).=0A=
>=0A=
>I can't really say if that's the design philosophy (some things make me=0A=
>think it's not, like the strange channel type field), but it'd certainly=
=0A=
>be trivial to show it in wireshark either way so personally I think we=0A=
>should leave it out.=0A=
I agree we can leave it out of the A-MPDU status field itself then.=0A=
=0A=
>>>> 3) A bit to indicate if the Delimiter CRC is in error.=0A=
>>>That's useful, but in that case are you even decoding the MPDU and=0A=
>>>passing it up?=0A=
>> In case the delimiter CRC for a subframe containing an MPDU is=0A=
>> corrupted, is it an option to record and display only the radiotap=0A=
>> header without the (suspect) MPDU following it? This will at least let=
=0A=
>> the user know a subframe corruption has happened. Except the=0A=
>> 'Delimiter CRC error' bit, all other A-MPDU status field contents can=0A=
>> be set as invalid.=0A=
>> If this option is not available, may be we should just drop 3 (and by=0A=
>> extension, 4 'Delimiter CRC Value') to avoid ambiguity.=0A=
>=0A=
>I think we can do that. Or display it but mark it as bad in some way if=0A=
>this happens=0A=
Ok. For hardware that does return the suspect MPDU, we can display it - I s=
uggest not as an MPDU, but as a bunch of un-dissected bytes (the reason for=
 this suggestion, along with alternatives, will be discussed shortly). For =
hardware that doesn't return the suspect MPDU (or is capable, but doesn't u=
nder some circumstances), we should have the flexibility to display only th=
e Radiotap header.=0A=
=0A=
>(maybe also set the bad FCS bit if that isn't independently=0A=
>calculated anyway?)=0A=
Since the Delimiter CRC only covers the Reserved bits and MPDU length field=
 of the subframe (and not the MPDU itself), we wouldn't be sure if the MPDU=
 FCS is really bad on the basis of just the Delimiter CRC being bad. For th=
at matter, we wouldn't even be sure if what we think is the MPDU FCS is act=
ually so (depending on hardware implementations and parse recovery failures=
). This is the reason I suggested displaying the MPDU as a bunch of un-diss=
ected bytes. =0A=
Alternatively, the wireshark implementation can carry out an attempted heur=
istic dissection, with Wireshark documentation updated to warn that this ca=
n go quite awry.=0A=
=0A=
>>>Also what if a zero delimiter has a bad CRC? Or what if=0A=
>>>it just got corrupted and you have to recover parsing? I'm not sure=0A=
>>>we can cover all these cases.=0A=
>> Assuming the option discussed above is available:=0A=
>> Perhaps we should limit the scope of all A-MPDU status field=0A=
>> information as being applicable only to subframes actually containing=0A=
>> MPDUs. Even 1b, 'Number of zero delimiters before current subframe'=0A=
>> would be with reference to a given 'non-zero' MPDU bearing subframe. =0A=
>> If we accept the above limitation, then a zero delimiter having a bad=0A=
>> CRC doesn't matter for subfield 3) 'Delimiter CRC error'. We will=0A=
>> never be providing this information for any zero delimiter. However,=0A=
>> there is an open question about what happens once hardware recovers=0A=
>> parsing after a corrupted zero delimiter and and successfully gets a=0A=
>> non-zero MPDU bearing subframe. Generally speaking, I feel there is=0A=
>> scope for ambiguity/variances about how differing products can react=0A=
>> and return information used for constructing 1b. In case this is a=0A=
>> concern, we could drop 1b as well. =0A=
>=0A=
>Given that hardware might even implement different strategies for=0A=
>recovering (iirc the spec only has an informational description of an=0A=
>algorithm), I think that's fair. It'd be nicer to have perfectly=0A=
>comparable values, but I wouldn't leave things out just because of that.=
=0A=
=0A=
>Technically we could also report each zero delimiter as a separate=0A=
>zero-length frame I guess.=0A=
I like this idea. It sounds better than having subfield 1b. We can more uni=
formly handle bad delimiter CRC events.=0A=
=0A=
Regards,=0A=
Krishna =0A=
