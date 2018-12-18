From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] TLV fields for radiotap
Date: Mon, 17 Dec 2018 20:05:26 -0600
Message-ID: <20181218020526.GH27633@pobox.com>
References: <1531126034.3298.18.camel@sipsolutions.net>
 <1536063298.3940.12.camel@sipsolutions.net>
 <81658b7a400e6189c55587c8276d5555b6fe37f0.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <81658b7a400e6189c55587c8276d5555b6fe37f0.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, Nov 20, 2018 at 09:09:39PM +0100, Johannes Berg wrote:
> On Tue, 2018-09-04 at 14:14 +0200, Johannes Berg wrote:
> > On Mon, 2018-07-09 at 10:47 +0200, Johannes Berg wrote:
> > > Since there were no comments, let's make this more formal. Any
> > > objections now?
> > 
> > Does this look like a good idea/compromise?
> > 
> > It's hard to do an entirely new version, then at least in Linux we'd
> > probably have to be able to switch versions on the fly for some time,
> > which is awkward ... but OTOH this feels a bit hackish.
> > 
> > No comments at all? :)
> 
> *crickets*

Sorry, I keep meaning to but forgetting to respond to this.

I had a thought about this tonight: maybe the solution is to define
a new radiotap field, "hint," that contains a hint about the offset
to a field.  The field begins with a 16-bit (?) field number, f, to
be interpreted in the current namespace.  Following that is a 16-bit
(?) absolute offset from the end of the hint field to field f.  If you
introduce your vendor namespace when the last-assigned presence bit is
bit p, and later you reuse the vendor namespace with newly-assigned
presence bit p+k, then you can supply a hint for the vendor namespace
field so that old readers can still benefit from presence bits 0..p and
your vendor fields.

Anyway, I've only just thought-up the hint field, so I am not even sure
that it's well-defined.

Dave

-- 
David Young
dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org    Urbana, IL    (217) 721-9981
