From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: radiotap feature discovery
Date: Thu, 16 Apr 2009 12:12:56 -0500
Message-ID: <20090416171256.GY25412@ojctech.com>
References: <1239897757.14169.16.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1239897757.14169.16.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, Apr 16, 2009 at 06:02:37PM +0200, Johannes Berg wrote:
> Hi!
> 
> With all these injection things, we'll invariably find devices that do
> not support some of them, e.g. will not support not setting the sequence
> number because the hardware always assigns them.
> 
> Thus, I think we need a way to do feature discovery. This isn't relevant
> for RX -- there the driver just provides what it has -- but is for TX
> where tools would like to know what they can do.
> 
> One way I could think of would be to define a whole bunch of flags for
> the various injection features, and export those somehow. Not sure I
> like this, since it means we need to keep track of yet another bitmap.
> 
> The other way I could imagine would be to export, in a yet to be defined
> way, a radiotap header that lists the capabilities. For example, upon
> feature query you'd return a header like this:
> 
> 	0x00, 0x00,		// <-- radiotap version
> 	0x0b, 0x00,		// <- radiotap header length
> 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> 	0x00,			// <-- rate
> 	0x00,			// <-- tx power
> 	0x08, 0x00		// <-- tx flags
> 
> This would indicate support for controlling
>  * rate
>  * tx power
>  * tx flags - only no-ACK
> 
> How to export this information is to be determined and would most likely
> be platform dependent though.

Some standardization may be possible.  For example, Linux, *BSD, et
cetera, may be able to share a getsockopt(2) interface for querying
the capabilities on a socket.  Platforms with BPF could share an
ioctl(2) interface for the same.

> Thoughts?

Suppose that we let the OS pass back one or more "capability headers."
Each capability header consists of two radiotap headers.  The first
header contains supported Tx parameters.  The second header must be as
long as the first, and it is a bitmap that tells which bits are variable
(0) and which are fixed (1).  In your example, the first header

> 	0x00, 0x00,		// <-- radiotap version
> 	0x0b, 0x00,		// <- radiotap header length
> 	0x04, 0x84, 0x00, 0x00,	// <-- bitmap
> 	0x00,			// <-- rate
> 	0x00,			// <-- tx power
> 	0x08, 0x00		// <-- tx flags

may be followed by the bitmap

> 	0xff, 0xff,		// <-- radiotap version
> 	0xf0, 0xff,		// <- radiotap header length
> 	0xfb, 0x7b, 0xff, 0xff,	// <-- bitmap
> 	0x00,			// <-- rate
> 	0x00,			// <-- tx power
> 	0xf7, 0xff		// <-- tx flags

meaning that only radiotap version 0 is supported, the header length is
somewhat variable, only rate, tx power and flags may be set, and only
the no-ACK Tx flag is allowed.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
