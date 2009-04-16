From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: radiotap feature discovery
Date: Thu, 16 Apr 2009 13:24:28 -0500
Message-ID: <20090416182428.GA25412@ojctech.com>
References: <1239897757.14169.16.camel@johannes.local> <20090416171256.GY25412@ojctech.com> <1239903002.26575.17.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1239903002.26575.17.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, Apr 16, 2009 at 07:30:02PM +0200, Johannes Berg wrote:
> 
> > > The other way I could imagine would be to export, in a yet to be defined
> > > way, a radiotap header that lists the capabilities. For example, upon
> > > feature query you'd return a header like this:
> > > 
> > > 	0x00, 0x00,		// <-- radiotap version
> > > 	0x0b, 0x00,		// <- radiotap header length
> > > 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> > > 	0x00,			// <-- rate
> > > 	0x00,			// <-- tx power
> > > 	0x08, 0x00		// <-- tx flags
> > > 
> > > This would indicate support for controlling
> > >  * rate
> > >  * tx power
> > >  * tx flags - only no-ACK
> > > 
> > > How to export this information is to be determined and would most likely
> > > be platform dependent though.
> > 
> > Some standardization may be possible.  For example, Linux, *BSD, et
> > cetera, may be able to share a getsockopt(2) interface for querying
> > the capabilities on a socket.  Platforms with BPF could share an
> > ioctl(2) interface for the same.
> 
> Indeed, that would be doable. Any suggestions?
> 
> > > Thoughts?
> > 
> > Suppose that we let the OS pass back one or more "capability headers."
> > Each capability header consists of two radiotap headers.  The first
> > header contains supported Tx parameters.  The second header must be as
> > long as the first, and it is a bitmap that tells which bits are variable
> > (0) and which are fixed (1).  In your example, the first header
> > 
> > > 	0x00, 0x00,		// <-- radiotap version
> > > 	0x0b, 0x00,		// <- radiotap header length
> > > 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> > > 	0x00,			// <-- rate
> > > 	0x00,			// <-- tx power
> > > 	0x08, 0x00		// <-- tx flags
> > 
> > may be followed by the bitmap
> > 
> > > 	0xff, 0xff,		// <-- radiotap version
> > > 	0xf0, 0xff,		// <- radiotap header length
> > > 	0xfb, 0x7b, 0xff, 0xff,	// <-- bitmap
> > > 	0x00,			// <-- rate
> > > 	0x00,			// <-- tx power
> > > 	0xf7, 0xff		// <-- tx flags
> > 
> > meaning that only radiotap version 0 is supported, the header length is
> > somewhat variable, only rate, tx power and flags may be set, and only
> > the no-ACK Tx flag is allowed.
> 
> Hmm. That seems useful on first sight, but is it really? It seems to be
> useful only for things like the tx flags.

I think that the usefulness comes down to either the interpretation
(bad) or the rigor of the specification.

> Supporting multiple radiotap versions is still impossible, since the
> bits would have entirely different meanings, or even the format changed,
> otherwise we wouldn't have cycled the version number.

Sure.

> For the bitmap we already know - I don't think any reasonable
> implementation would _require_ some field to be present.

Neither do I.  I marked the bits in the presence bitmap 
as variable instead of fixed for that reason.  Do you think it
is too confusing for the fields to still be present in the bitmask?

> For rate/txpower there may be limits you cannot express with this, but
> must discover in some other way, or the implementation just clamps or
> something.

You're right, there needs to be more to the capabilities spec than that.
We may need to indicate either a range or an enumeration of allowable
values.

We may also need to indicate that a particular Tx flags setting is only
permitted at a particular Tx rate setting, or vice versa.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
