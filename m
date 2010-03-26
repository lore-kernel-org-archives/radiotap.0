From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Thu, 25 Mar 2010 21:57:15 -0700
Message-ID: <1269579436.4581.0.camel@jlt3.sipsolutions.net>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <20100126174728.GV1060@ojctech.com>
	 <1264584965.25642.15.camel@johannes.local>
	 <20100127153002.GC1060@ojctech.com>
	 <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
	 <loom.20100201T230554-2@post.gmane.org> <20100202195424.GE1060@ojctech.com>
	 <20100325235000.GX414@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20100325235000.GX414-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2010-03-25 at 18:50 -0500, David Young wrote:
> On Tue, Feb 02, 2010 at 01:54:25PM -0600, David Young wrote:
> > On Mon, Feb 01, 2010 at 10:09:37PM +0000, Bill Stafford wrote:
> > > I also have a question about how the RadioTap design deals with information
> > > that may not be available. I know that RadioTap works for many different
> > > drivers, and I am wondering if all the drivers get full information about
> > > the packets.
> > 
> > The problem of don't-know/don't-care flags has come up before.  It'd be
> > nice to have a general solution.
> 
> I've been thinking about this.  Instead of adding 2**n-byte aligned
> fields with don't-know/don't-care flags, what do people think about
> using the presence bits in the header to indicate the presence of
> 1-bit-wide fields?

Seems like a good idea, but I would suggest reserving a whole block of
them, or potentially an entire namespace, so we don't end up aligning
all the time?

johannes
