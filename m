From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: Regarding A-MPDU status field
Date: Tue, 22 Nov 2011 11:06:05 -0600
Message-ID: <20111122170605.GJ20624@pixotech.com>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
 <1320223343.3950.29.camel@jlt3.sipsolutions.net>
 <21E1C3B49A18BA428D58607D5EEA5398BB67FA@nasanexd02b.na.qualcomm.com>
 <1320847366.3845.72.camel@jlt3.sipsolutions.net>
 <21E1C3B49A18BA428D58607D5EEA5398BBBD18@nasanexd02b.na.qualcomm.com>
 <1321259214.4472.16.camel@jlt3.sipsolutions.net>
 <21E1C3B49A18BA428D58607D5EEA5398BC8C00@nasanexd02b.na.qualcomm.com>
 <1321867620.3999.7.camel@jlt3.sipsolutions.net>
 <21E1C3B49A18BA428D58607D5EEA5398BC971A@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398BC971A-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Nov 22, 2011 at 02:27:17PM +0000, Rao, Krishna wrote:
> Hi,
> 
> >>> 4) (Debatable) Delimiter CRC value itself. I don't know if there is
> >>> any hardware which returns the actual value to software. Anyway,
> >>> having it as part of the field will allow platforms which do possess
> >>> the capability, to provide this information. It may come in handy for
> >>> some users.
> >> 
> >> That seems a bit of a stretch, but it's only 8 bits so I wouldn't mind
> >> adding it.
> >
> >I think that in the interest of, as you say, "reconstruct[ing] what
> >happened on the air as precisely as possible", which is a goal that I
> >strongly agree with, it is important to pass that information up.
> >
> >On the other hand, if the information is only hypothetically
> >available....
> Since there is always a possibility that some existing or future
> hardware might have this capability, having this subfield in the
> specification might prove useful down the line. Inviting comments on
> this.

Still thinking along the lines of "reconstruct ... as precisely", let me
throw this idea out there: the A-MPDU field can help us to reconstruct a
whole A-MPDU by telling us the range of byte indices where the subframe
may have begun in the aggregate, [start0, start1].  If the driver
doesn't know, then the interval is [0, length of A-MPDU].  If the driver
knows precisely, then [x, x], otherwise [x, y] where x != y.

Dave

-- 
David Young
dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org    Urbana, IL    (217) 721-9981
