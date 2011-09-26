From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: How do I parse alternate namespaces?
Date: Mon, 26 Sep 2011 10:22:26 +0200
Message-ID: <1317025346.4117.19.camel@jlt3.sipsolutions.net>
References: <20110926021224.GA10126@dan.olp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20110926021224.GA10126-whqxDF3IS4PR7s880joybQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Dan White <dwhite-EDswToCxbKc@public.gmane.org>
Cc: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

Not sure if you didn't quote this or if it was missing from where you
quoted from, but let me add for reference:

> Reset to Radiotap Namespace

bit number 29 in every it_present word

> Vendor Namespace

bit number 30 in every it_present word


> The basic structure of the radiotap header appears to be:
> 
> u_int8_t        it_version;
> u_int8_t        it_pad;
> u_int16_t       it_len;
> 
> And then one or more of:
> u_int32_t       it_present;
> 
> Followed by a variable amount of field data corresponding to which fields
> are enabled. Is that generally correct?

Right.

> What is considered to be a namespace? Can one of the members of the
> it_present array be a namespace, or is the namespace actually found inside
> the field data?

Both really. First: if bit 29/30 are set, 31 also needs to be set for it
to make any sense at all. The bits are considered to be just numbers,
and every time bit 29/30 are set the numbering starts again from 0. When
30 is set, the next bit number is 0, but the interpretation is in the
namespace. Also, encountering that means there's the OUI data in the
data portion at that point.

> In the case where there are are two it_present values, like:
> 
> 11000000 00000000 00000000 00000000
> 00000000 00000000 00000000 11111111
> <field data>
> 
> Is the second it_present value considered to be in a private namespace (in
> which case I would reference the field data to determine what the namespace
> is?), or would it be considered a part of the default namespace?

It would be considered part of a private namespace, so upon reading bit
30 you need to read 6 bytes from the data for the OUI/subtype/skip_len.

> If so, what does the Reset to RadioTap Namespace bit do? Given:
> 11000000 00000000 00000000 00000000
> 00100000 00000000 00000000 11111111
> 
> Does this mean that the next it_present value, if present, will be
> considered in the default namespace? 

Well, if it's like that, the bit 29 there is an error since bit 31 isn't
set. If it was like this instead:
11000000 00000000 00000000 00000000
10100000 00000000 00000000 11111111
00000000 00000000 00000000 00000001

the data would have to be:
OUI [3], subtype, skip_len [2]  [for the first it_present word]
[skip_len bytes for the vendor namespace]
8 bytes for the TSF value [possibly padded to the right alignment]

So yes, as you see, the next it_present value will be considered in the
default namespace again, but with the first bit index 0.

Consider also this:
10100000 00000000 00000000 00000101
00000000 00000000 00000000 00000100

This indicates that there is a TSF field and _two_ rate fields, possibly
to indicate a retry at a lower rate for TX control or TX status
information (obviously this doesn't make sense for RX).


> If so, does 'the interpreter shall
> reset its presence-bitmap index to 0' mean that the interpreter should
> forget all the values that were specified in the first it_present value?

No, it just means that the interpreter restarts bit numbering at 0.

> What does 'Required Alignment 2' mean?

Alignment here means that if, counted from the start of the header, the
value would lie on a byte boundary that isn't a multiple of 2 (or 4 or 8
in some other fields) it needs to be padded first and the interpreter
needs to skip the padding. The padding will not contain any useful data.
Since the header length is variable, in my TSF/2xRate example above
there'd be 4 bytes of padding directly after the header first.

> What does 'If a radiotap header changes from a vendor namespace to another
> vendor namespace, the 6-byte data describing the new vendor namespace shall
> not be accounted for in skip_length.' mean? Can you provide an example for
> that scenario?

Well given the above example with vendor namespace, I said "skip_len
bytes for the vendor namespace". The 6 bytes "OUI[3], subtype,
skip_len[2]" aren't counted as part of skip_len since their length is
well-known. Remember that the skip_len allows parsers that don't
understand a specific vendor namespace to skip all fields in it without
having to abort parsing at that point.



In any case, why write your own parser? While that's perfectly valid of
course there's also a BSD-licensed reference implementation as a library
that you can use :-)

johannes
