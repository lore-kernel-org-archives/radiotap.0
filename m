From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Tue, 20 Feb 2018 16:06:00 +0100
Message-ID: <1519139160.16723.39.camel@sipsolutions.net>
References: <1517300719.2189.51.camel@sipsolutions.net>
	 <1519119420.16723.26.camel@sipsolutions.net>
	 <1519131691.16723.35.camel@sipsolutions.net>
	 <CACyXjPxQLN3iiCjVu5X5ZQUMGBEY9FyM9dnPmEiT7XQnaUhjEQ@mail.gmail.com>
	 (sfid-20180220_160000_293915_8ACB462B)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPxQLN3iiCjVu5X5ZQUMGBEY9FyM9dnPmEiT7XQnaUhjEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20180220_160000_293915_8ACB462B)
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2018-02-20 at 06:59 -0800, Richard Sharpe wrote:
> 
> > I think it'd be better to split this:
> > flags1: 0x0080: reserved
> > flags2: 0x0003: bandwidth from bw field in HE-SIG-A with the values
> >                  0 - 20 MHz
> >                  1 - 40 MHz
> >                  2 - 80 MHz
> >                  3 - 160/80+80 MHz
> > flags2: 0x0004: bandwidth from bw field in HE-SIG-A known
> > flags2: 0x0008: preamble puncturing from bw field in HE-SIG-A known
> > flags2: 0x0300: preamble puncturing from bw field in HE-SIG-A,
> >                 with the values
> >                  0 - non-puncturing mode
> >                  1 - punctured secondary 20 MHz
> >                      (in primary 80 MHz if applicable)
> >                      [maps to HE-SIG-A bandwidth values 4 or 6]
> >                  2 - punctured but primary 40 MHz is presented
> >                      (in primary 80 MHz if applicable)
> >                      [maps to HE-SIG-A bandwidth values 5 or 7]
> > 
> > Richard, did you do any work on the HE-MU field yet that would collide
> > with such a change?
> 
> I have, but:
> 
> 1. It's WIP, so it has not been merged yet, and
> 2. It looks like maybe an hour's work at most to fix it.

Ok. Yeah, shouldn't be so hard to fix.

> So, I would say, accuracy is more important.

It's not really *inaccurate* as such, but it seems it'd be easier to
understand - and perhaps some devices would have the bandwidth but not
the puncturing mode available after decoding, for example.

I'll change it like that and resend the whole proposal.

johannes
