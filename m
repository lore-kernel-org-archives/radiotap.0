From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] TLV fields for radiotap
Date: Tue, 09 Apr 2019 10:38:37 +0200
Message-ID: <a6ec00b90901fba1264c8943003a25786a595d6d.camel@sipsolutions.net>
References: <1531126034.3298.18.camel@sipsolutions.net>
	 <1536063298.3940.12.camel@sipsolutions.net>
	 <81658b7a400e6189c55587c8276d5555b6fe37f0.camel@sipsolutions.net>
	 <20181218020526.GH27633@pobox.com>
	 <2c771c875d88d51d1cd98023686f084a5b6486bc.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <2c771c875d88d51d1cd98023686f084a5b6486bc.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2018-12-18 at 14:45 +0100, Johannes Berg wrote:

> > I had a thought about this tonight: maybe the solution is to define
> > a new radiotap field, "hint," that contains a hint about the offset
> > to a field.  The field begins with a 16-bit (?) field number, f, to
> > be interpreted in the current namespace.  Following that is a 16-bit
> > (?) absolute offset from the end of the hint field to field f.  If you
> > introduce your vendor namespace when the last-assigned presence bit is
> > bit p, and later you reuse the vendor namespace with newly-assigned
> > presence bit p+k, then you can supply a hint for the vendor namespace
> > field so that old readers can still benefit from presence bits 0..p and
> > your vendor fields.

I thought about this again ... and I decided I still don't think it's a
good idea.

> Hmm. Actually, yes, I think that would work. However, it's hard to guess
> which fields the parser can do, so unless you have a really smart parser
> you'd end up with
> 
> fields 0..n, hint, n+1, hint, n+2, hint, n+3, vendor_data

I think this one's the killer to me, in a sense.

If you think about it - yes, right now, you could say

   Implementations currently understand fields 0..HE-MU, and I want to
   have some new field (e.g. S1G) and will add a hint.

With this thinking, you get:

 0..HE-MU, vendor-data-hint, S1G, vendor-data

But like I described above, the next time you do this you probably don't
want to change it to be

 0..HE-MU, S1G, vendor-data-hint, EHT, vendor-data

but rather

 0..HE-MU, vendor-data-hint, S1G, vendor-data-hint, EHT, vendor-data

and that gets complex really fast, and also *bigger* than any sort of
TLV formatting would ever get.

I'll resend the adoption proposal now, I think it's the better solution.

johannes
