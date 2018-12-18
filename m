From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] TLV fields for radiotap
Date: Tue, 18 Dec 2018 14:45:25 +0100
Message-ID: <2c771c875d88d51d1cd98023686f084a5b6486bc.camel@sipsolutions.net>
References: <1531126034.3298.18.camel@sipsolutions.net>
	 <1536063298.3940.12.camel@sipsolutions.net>
	 <81658b7a400e6189c55587c8276d5555b6fe37f0.camel@sipsolutions.net>
	 <20181218020526.GH27633@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20181218020526.GH27633-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi Dave,

> Sorry, I keep meaning to but forgetting to respond to this.

No worries, but thanks you took the time to.

> I had a thought about this tonight: maybe the solution is to define
> a new radiotap field, "hint," that contains a hint about the offset
> to a field.  The field begins with a 16-bit (?) field number, f, to
> be interpreted in the current namespace.  Following that is a 16-bit
> (?) absolute offset from the end of the hint field to field f.  If you
> introduce your vendor namespace when the last-assigned presence bit is
> bit p, and later you reuse the vendor namespace with newly-assigned
> presence bit p+k, then you can supply a hint for the vendor namespace
> field so that old readers can still benefit from presence bits 0..p and
> your vendor fields.
> 
> Anyway, I've only just thought-up the hint field, so I am not even sure
> that it's well-defined.

Hmm. Actually, yes, I think that would work. However, it's hard to guess
which fields the parser can do, so unless you have a really smart parser
you'd end up with

fields 0..n, hint, n+1, hint, n+2, hint, n+3, vendor_data

A smarter parser that understands 0..n+2 might be able to read

fields 0..n, hint, n+1, n+2, n+3, vendor_data

but it'd have to keep track of the hint, and if it doesn't care about
the contents of the hint ... it could still restart parsing at that
point.

Also, you'd have to reserve a high bit for the "hint" field in every
presence bitmap (like we do for the extension and namespace switching
bits), and to have multiple hint fields you'd have to extend your
presence bitmap all the time too.

Actually, you say "in the current namespace", so you'd have to switch
namespaces for the hint field to vendor, and then back to normal. If you
imagine doing this in the near future when we've run out of bits in the
first presence DWORD, then to have a hint field followed by e.g.
radiotap field 32 (next presence dword bit 0), you'd need

<presence dword: (fields 0..n) | extension | switch to vendor>
<presence dword: 0 | hint | extension | switch to radiotap>
<presence dword: 0 | extension>
<presence dword: field 32 i.e. BIT(0) | extension | switch to vendor>
<presence dword: vendor field>

There, the third presence dword is just a filler to reach the field32
again after the extension. This is also something we didn't really
consider when we designed the extension/namespace switching.

Personally, I feel this is too complex, and only really addresses the
one case I mentioned with vendor fields. I could, btw, also address it
today without the hint field by ordering the presence bitmaps
accordingly, i.e. putting the new unknown fields after the vendor
extension, by just extending the presence bitmap further and further.
But again, then I actually need to know which parts the tools can parse,
etc.

With TLVs, you could also imagine a tool that really only cares about a
single radiotap field, and is able to parse it out easily without
knowing about all the other fields.

I'll need to think about it more, but I tend to think the complexity of
the parser and generator are a bit too much. It's already hard enough
(too hard really) to parse radiotap, this only makes it even harder.

johannes
