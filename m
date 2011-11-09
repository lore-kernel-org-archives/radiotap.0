From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: Regarding A-MPDU status field
Date: Wed, 09 Nov 2011 15:02:46 +0100
Message-ID: <1320847366.3845.72.camel@jlt3.sipsolutions.net>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
	 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
	 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398BB67FA-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

> > -- it might also be helpful to know the padding length before/after
> (?) the packet for example.
> We can add
> 1) Padding length information
> a) value of padding length after the MPDU, and
> b) (debatable) total padding length before the subframe for the
> special case of preceding delimiters with MPDU length zero used to
> meet minimum MPDU start spacing requirements. All the octets of the
> preceding 'zero delimiters' together form the pad, as I understand.
> Note that this information might not be provided by some hardware.
> If an MPDU (not 'zero delimiter') is actually present prior to the
> current subframe for which radiotap info is being displayed, 1b)
> should be zero for the current subframe. Post MPDU pad length
> information for the prior MPDU would anyway be available (assuming the
> containing subframe of the prior MPDU is not corrupted).

So what I wanted here was to be able to reconstruct what happened on the
air as precisely as possible. I don't think the length of the padding is
actually needed -- it can be calculated after the fact since it is
always 0-3 bytes up to a multiple of 4. The number of zero delimiters
would be more interesting.

I'm not sure how to deal with the corruption case.

> Additionally:
> 2) A bit to indicate if this is the last subframe in the A-MPDU.
> Though there might be other ways to infer this information, having it
> as an explicit field would provide convenience. 

That seems useful, although I'm not even sure how you would even know
that it is the last one?

> 3) A bit to indicate if the Delimiter CRC is in error.

That's useful, but in that case are you even decoding the MPDU and
passing it up? Also what if a zero delimiter has a bad CRC? Or what if
it just got corrupted and you have to recover parsing? I'm not sure we
can cover all these cases.

> 4) (Debatable) Delimiter CRC value itself. I don't know if there is
> any hardware which returns the actual value to software. Anyway,
> having it as part of the field will allow platforms which do possess
> the capability, to provide this information. It may come in handy for
> some users.

That seems a bit of a stretch, but it's only 8 bits so I wouldn't mind
adding it.

johannes
