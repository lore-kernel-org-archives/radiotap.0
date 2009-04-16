From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Thu, 16 Apr 2009 15:33:54 -0500
Message-ID: <20090416203353.GC25412@ojctech.com>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com> <1239902910.26575.14.camel@johannes.local> <69e28c910904161147h5a68d3b5nd054b043d6ad2719@mail.gmail.com> <1239908374.26575.20.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1239908374.26575.20.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Apr 16, 2009 at 08:59:34PM +0200, Johannes Berg wrote:
> On Thu, 2009-04-16 at 20:47 +0200, G?bor Stefanik wrote:
> 
> > Alternatively, the meanings of the {0,0} and {1,1} cases could be
> > switched around (making the {0,0} case more logical, at the expense of
> > the {1,1} one):
> > 
> > TX Flags absent: Use RTS & CTS as needed.
> > TX Flags present: {
> > RTS=0, CTS=0: Use RTS & CTS as needed.
> > RTS=0, CTS=1: Use CTS-to-self.
> > RTS=1, CTS=0: Use RTS/CTS-handshake.
> > RTS=1, CTS=1: Use neither RTS nor CTS.
> > }
> > 
> > (By reading the second proposal again, I find it more and more
> > sympathetic... but let the discussion decide.)
> 
> That _works_, but is impossible to describe in any feature discovery.

The discovery mechanism that we have begun to discuss would have a hard
time describing that feature at its current level of development, but
that is not the only feature that it will have a hard time describing.
Feature discovery may need more development before we measure new
proposals against it.  What do you think?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
