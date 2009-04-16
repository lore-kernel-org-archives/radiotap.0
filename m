From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Thu, 16 Apr 2009 15:48:06 -0500
Message-ID: <20090416204806.GD25412@ojctech.com>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com> <69e28c910904161147h5a68d3b5nd054b043d6ad2719@mail.gmail.com> <1239908374.26575.20.camel@johannes.local> <200904162110.05150.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200904162110.05150.mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, G?bor Stefanik <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Apr 16, 2009 at 09:10:04PM +0200, Michael Buesch wrote:
> On Thursday 16 April 2009 20:59:34 Johannes Berg wrote:
> > On Thu, 2009-04-16 at 20:47 +0200, G?bor Stefanik wrote:
> > 
> > > Alternatively, the meanings of the {0,0} and {1,1} cases could be
> > > switched around (making the {0,0} case more logical, at the expense of
> > > the {1,1} one):
> > > 
> > > TX Flags absent: Use RTS & CTS as needed.
> > > TX Flags present: {
> > > RTS=0, CTS=0: Use RTS & CTS as needed.
> > > RTS=0, CTS=1: Use CTS-to-self.
> > > RTS=1, CTS=0: Use RTS/CTS-handshake.
> > > RTS=1, CTS=1: Use neither RTS nor CTS.
> 
> The first and the last thing let my head explode, because it's not
> what somebody would expect from such bits. This kind of logic is also
> used in wext. And it's why I hate wext. "bit0 means x, bit1 means y,
> buuuuuuuuuuuuuuuut iff both bits are set the whole logic is inverted
> and whatever..."  That complicates _every_ single test of the bit
> (always need if (bit0 is set but not bit1)) It produces spaghetti code
> interpreting these bits with lots of branches and special conditions
> that nobody does understand by reading the code alone.  If you can't
> encode your functionality into a boolean, do _NOT_ use bits to encode
> it.  Use integers to encode tristate or quadstate or whatever.  You
> essentially _did_ that already, if you look at your bits. You use the
> two individual bits as 2bit integer value. So why not spell it out and
> use an integer field for that information?

G?bor,

I see the point that Michael is making.  What do you think?  Shall
we treat it as a 2-bit wide unsigned integer field in the Tx flags,
instead?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
