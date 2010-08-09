From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Mon, 09 Aug 2010 14:10:58 +0200
Message-ID: <1281355858.3845.42.camel@jlt3.sipsolutions.net>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <20100126174728.GV1060@ojctech.com>
	 <1264584965.25642.15.camel@johannes.local>
	 <20100127153002.GC1060@ojctech.com>
	 <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
	 <loom.20100201T230554-2@post.gmane.org> <20100202195424.GE1060@ojctech.com>
	 <20100325235000.GX414@ojctech.com>
	 <1269579436.4581.0.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1269579436.4581.0.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2010-03-25 at 21:57 -0700, Johannes Berg wrote:

> > > The problem of don't-know/don't-care flags has come up before.  It'd be
> > > nice to have a general solution.
> > 
> > I've been thinking about this.  Instead of adding 2**n-byte aligned
> > fields with don't-know/don't-care flags, what do people think about
> > using the presence bits in the header to indicate the presence of
> > 1-bit-wide fields?
> 
> Seems like a good idea, but I would suggest reserving a whole block of
> them, or potentially an entire namespace, so we don't end up aligning
> all the time?

I gave this a bit more thought, and I think I came to the conclusion
that this isn't such a great idea after all. But let me elaborate.

Adding single-bit fields has the advantage that they can be left out of
the header when, e.g., you just know the MCS, but you don't know whether
it was 20 or 40 MHz (which, incidentally, is quite useless).

However, you pay for it by alignment and waste presence bits in the
header. If you have a single 1-bit field present, then you need at least
7 more bits of padding. This can be mitigated by using 8 consecutive
presence bits, so that you just pay the alignment penalty once. You
could make a case for going to 16 then, but that wastes a lot of
presence bits.

But then assuming we use 8 presence bits/1-bit fields, as soon as any
one of them gets used (which we have to assume if they get used for HT
purposes) we use 2 bytes already. We still need the presence bit for the
MCS index as well. On a non-HT packet, we've now used up 9 presence
bits.

I think this wastes too much bits and makes things too complex. We could
reserve a namespace, but similar things happen.

Also, another point I wanted to make is that this puts related
information "far" from each other in terms of parsing the header.
Currently, when you parse a header, you can almost interpret each field
by itself. If we put HT flags and MCS information into separate
(single-bit) fields, then the data is spread apart. The spread becomes
if we'd reserve more bits and later use them.

All told, I think I'd prefer an approach where we put related
information into a single field. This leaves us two approaches (that I
can think of right now):

> So if it was in this longer format the flags might be something like
> this:
> 0x0001 20 MHz
> 0x0002 40 MHz
> 0x0004 20L (20 MHz in lower half of 40 MHz channel)
> 0x0008 20U (20 MHz in upper half of 40 MHz channel)
> 0x0010 Long GI
> 0x0020 Short GI
> 0x0040 HT Format - Mixed
> 0x0080 HT Format - Greenfield
> 0x0100 FEC type BCC
> 0x0200 FEC type LDPC

as proposed by Bill earlier in this thread, or a different approach I'd
like to point out:

known:
0x01	bandwidth
0x02	(reserved)
0x04	GI
0x08	format
0x10	FEC mode
flags:
0x03	bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
0x04	GI
0x08	format
0x10	FEC mode

This has two advantages:
 1) there are no invalid combinations, because "0x00,0x04"
    (unknown GI, long GI) just means "unknown GI", whereas
    the other way could lead to short-GI|long-GI being set
 2) it doesn't require a 16-bit field, so no extra padding
    will be necessary

If the information is present, the amount of data is the same, but if it
is not present just a single presence bit is used. I think this is also
an advantage.

I've put a modified proposal here:
http://www.radiotap.org/suggested-fields/MCS-proposal2

I also added some a-MPDU status bits. They might not quite belong to
HT/MCS only, but they will typically be used with that and everything
else can indeed be masked out if really necessary.

Thoughts?

johannes
