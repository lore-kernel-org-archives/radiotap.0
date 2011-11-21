From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Mon, 21 Nov 2011 10:27:00 +0100
Message-ID: <1321867620.3999.7.camel@jlt3.sipsolutions.net>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
	 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>
	 ,<1320847366.3845.72.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BBBD18@nasanexd02b.na.qualcomm.com>
	 ,<1321259214.4472.16.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BC8C00@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398BC8C00-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

> >>>> 3) A bit to indicate if the Delimiter CRC is in error.
> >>>That's useful, but in that case are you even decoding the MPDU and
> >>>passing it up?
> >> In case the delimiter CRC for a subframe containing an MPDU is
> >> corrupted, is it an option to record and display only the radiotap
> >> header without the (suspect) MPDU following it? This will at least let
> >> the user know a subframe corruption has happened. Except the
> >> 'Delimiter CRC error' bit, all other A-MPDU status field contents can
> >> be set as invalid.
> >> If this option is not available, may be we should just drop 3 (and by
> >> extension, 4 'Delimiter CRC Value') to avoid ambiguity.
> >
> >I think we can do that. Or display it but mark it as bad in some way if
> >this happens

> Ok. For hardware that does return the suspect MPDU, we can display it
> - I suggest not as an MPDU, but as a bunch of un-dissected bytes (the
> reason for this suggestion, along with alternatives, will be discussed
> shortly). For hardware that doesn't return the suspect MPDU (or is
> capable, but doesn't under some circumstances), we should have the
> flexibility to display only the Radiotap header.
> 
> >(maybe also set the bad FCS bit if that isn't independently
> >calculated anyway?)
> Since the Delimiter CRC only covers the Reserved bits and MPDU length
> field of the subframe (and not the MPDU itself), we wouldn't be sure
> if the MPDU FCS is really bad on the basis of just the Delimiter CRC
> being bad. For that matter, we wouldn't even be sure if what we think
> is the MPDU FCS is actually so (depending on hardware implementations
> and parse recovery failures). This is the reason I suggested
> displaying the MPDU as a bunch of un-dissected bytes. 

Right, that makes sense.

> Alternatively, the wireshark implementation can carry out an attempted
> heuristic dissection, with Wireshark documentation updated to warn
> that this can go quite awry.

That might be easier to implement, but ultimately it's up to the
wireshark implementation. Could even be configurable :-)

> >>>Also what if a zero delimiter has a bad CRC? Or what if
> >>>it just got corrupted and you have to recover parsing? I'm not sure
> >>>we can cover all these cases.
> >> Assuming the option discussed above is available:
> >> Perhaps we should limit the scope of all A-MPDU status field
> >> information as being applicable only to subframes actually containing
> >> MPDUs. Even 1b, 'Number of zero delimiters before current subframe'
> >> would be with reference to a given 'non-zero' MPDU bearing subframe. 
> >> If we accept the above limitation, then a zero delimiter having a bad
> >> CRC doesn't matter for subfield 3) 'Delimiter CRC error'. We will
> >> never be providing this information for any zero delimiter. However,
> >> there is an open question about what happens once hardware recovers
> >> parsing after a corrupted zero delimiter and and successfully gets a
> >> non-zero MPDU bearing subframe. Generally speaking, I feel there is
> >> scope for ambiguity/variances about how differing products can react
> >> and return information used for constructing 1b. In case this is a
> >> concern, we could drop 1b as well. 
> >
> >Given that hardware might even implement different strategies for
> >recovering (iirc the spec only has an informational description of an
> >algorithm), I think that's fair. It'd be nicer to have perfectly
> >comparable values, but I wouldn't leave things out just because of that.
> 
> >Technically we could also report each zero delimiter as a separate
> >zero-length frame I guess.

> I like this idea. It sounds better than having subfield 1b. We can
> more uniformly handle bad delimiter CRC events.

:)

Did you keep track and want to write up a new proposal?

johannes
