From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Mon, 14 Nov 2011 09:26:54 +0100
Message-ID: <1321259214.4472.16.camel@jlt3.sipsolutions.net>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
	 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>
	 ,<1320847366.3845.72.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BBBD18@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398BBBD18-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

> >I don't think the length of the padding is
> >actually needed -- it can be calculated after the fact since it is
> >always 0-3 bytes up to a multiple of 4.

> The objective behind suggesting its inclusion was to help users easily
> observe and filter on this value without having to resort to any post
> processing scripts. If the value is readily observable, it might help
> for example, a mobile app developer with only cursory knowledge of
> 802.11n to chance upon and inquire into the reason for the padding.
> For real-time apps operating in noisy RF environments, adjusting the
> payload bytes to minimize subframe padding may form one of many little
> optimizations  to extract better performance (depending on traffic
> characteristics). In the absence of an explicitly viewable field, the
> possibility might not occur to some users.
> However, in case the design philosophy behind radiotap is to store
> only non-deducible information, I agree we should stick to that. May
> be Wireshark dissector code can independently calculate and display
> this info instead? (Am yet to get familiar with the code internals,
> especially with regard to how filtering is impacted by this).

I can't really say if that's the design philosophy (some things make me
think it's not, like the strange channel type field), but it'd certainly
be trivial to show it in wireshark either way so personally I think we
should leave it out.

> >The number of zero delimiters
> >would be more interesting.
> I agree. Also (as implicit in your reply) instead of providing the
> number of bytes, it can simply be the number of delimiters.
> But the second part of the discussion below for point 3) 'Delimiter
> CRC' opens up a new question as to whether we should have this
> subfield at all.

Well, ok, so I don't really care about bytes vs. delimiters, I didn't
put it that way to mean I'd prefer the number of delimiters.

> >> 2) A bit to indicate if this is the last subframe in the A-MPDU.
> >> Though there might be other ways to infer this information, having
> it
> >> as an explicit field would provide convenience.
> >That seems useful, although I'm not even sure how you would even know
> >that it is the last one?
> It is possible for hardware to detect this and provide this
> information to the driver (am making a generic technical statement
> without referring to specific products here). For products not having
> this capability, this subfield can be marked as invalid (if the driver
> has no other way to infer the information).

Ok, that sounds good. Let's just include it then, it's only a bit after
all.

> >> 3) A bit to indicate if the Delimiter CRC is in error.
> >That's useful, but in that case are you even decoding the MPDU and
> >passing it up?
> In case the delimiter CRC for a subframe containing an MPDU is
> corrupted, is it an option to record and display only the radiotap
> header without the (suspect) MPDU following it? This will at least let
> the user know a subframe corruption has happened. Except the
> 'Delimiter CRC error' bit, all other A-MPDU status field contents can
> be set as invalid.
> If this option is not available, may be we should just drop 3 (and by
> extension, 4 'Delimiter CRC Value') to avoid ambiguity.

I think we can do that. Or display it but mark it as bad in some way if
this happens (maybe also set the bad FCS bit if that isn't independently
calculated anyway?)

> >Also what if a zero delimiter has a bad CRC? Or what if
> >it just got corrupted and you have to recover parsing? I'm not sure
> >we can cover all these cases.
> Assuming the option discussed above is available:
> Perhaps we should limit the scope of all A-MPDU status field
> information as being applicable only to subframes actually containing
> MPDUs. Even 1b, 'Number of zero delimiters before current subframe'
> would be with reference to a given 'non-zero' MPDU bearing subframe. 
> If we accept the above limitation, then a zero delimiter having a bad
> CRC doesn't matter for subfield 3) 'Delimiter CRC error'. We will
> never be providing this information for any zero delimiter. However,
> there is an open question about what happens once hardware recovers
> parsing after a corrupted zero delimiter and and successfully gets a
> non-zero MPDU bearing subframe. Generally speaking, I feel there is
> scope for ambiguity/variances about how differing products can react
> and return information used for constructing 1b. In case this is a
> concern, we could drop 1b as well. 

Given that hardware might even implement different strategies for
recovering (iirc the spec only has an informational description of an
algorithm), I think that's fair. It'd be nicer to have perfectly
comparable values, but I wouldn't leave things out just because of that.

Technically we could also report each zero delimiter as a separate
zero-length frame I guess.

johannes
