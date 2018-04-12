From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Thu, 12 Apr 2018 11:55:47 +0200
Message-ID: <1523526947.12930.8.camel@sipsolutions.net>
References: <1517300719.2189.51.camel@sipsolutions.net>
	 <1523525707.12930.6.camel@sipsolutions.net>
	 <9FE36B35-5238-436D-9B5A-342C92D20701@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <9FE36B35-5238-436D-9B5A-342C92D20701-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, 2018-04-12 at 02:54 -0700, Guy Harris wrote:
> 
> > What do you think? Could wireshark do a point release of 2.6.x and 2.5.x
> > to include the changes? Or perhaps we could just say that 2.5.x would
> > just be broken for this, and people should upgrade for HE?
> 
> 
> n.{odd number}.x Wireshark releases are development releases; Gerald,
> is there any reason to care whether 2.5.x is broken when it tries to
> read this radiotap field?

Ah, I wasn't aware of this, thanks.

> 2.6.0 is scheduled for April 18th; Gerald, if we have a finalized
> version of this radiotap field soon, would it be possible to get a
> change for that into the 2.6.0 release?

That's pretty soon, but another option would be to just #if 0 the broken
code quickly? That's a bit annoying, but better than shipping something
that we may have to break.

johannes
