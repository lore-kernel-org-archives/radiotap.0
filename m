From: Dan White <dwhite-EDswToCxbKc@public.gmane.org>
Subject: How do I parse alternate namespaces?
Date: Sun, 25 Sep 2011 21:12:25 -0500
Message-ID: <20110926021224.GA10126@dan.olp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

I am attempting to write a radiotap parser (in C) and I'm looking for
assistance with how to parse alternative namespaces.

This is so far what I've found on the website for guidance:

Main Page:

   Provided bit 31 of the it_present field is not set, the data for fields
   specified in the it_present bitmask immediately follow the radiotap
   header. If it is set, then more it_present words follow and the radiotap
   data follows after the it_present word that has bit 31 unset. Multiple
   namespaces may be present.
...
   Defined (and suggested) fields are listed with their bit number. Due to
   the use of bit 31 to indicate a chained bitmask, the values 31, 63, etc.
   (n * 32 - 1) are reserved. Vendor-specified namespaces and radiotap
   namespace reset additionally reserves bits 29 and 30 in each bitmask as
   well, extending the reserved numbers to 29, 30, 31, 61, 62, 63, etc. (n
   * 32 - 3, n * 32 - 2, n * 32 - 1).

Reset to Radiotap Namespace

   This field is reserved in all namespaces and every it_present word, the
   standard radiotap namespace as well as all vendor namespaces. It is
   mutually exclusive with the Vendor Namespace field, setting both is
   undefined.

   Upon interpreting this field, the interpreter shall reset its
   presence-bitmap index to 0 and its namespace to the default radiotap
   namespace, and change to the default radiotap namespace, before it
   interprets subsequent presence-bitmap words.

Vendor Namespace

Structure
u8 OUI[3], u8 sub_namespace, u16 skip_length

Required Alignment
2

   This field is reserved in all namespaces and every it_present word, the
   standard radiotap namespace as well as all vendor namespaces. It is
   mutually exclusive with the Reset to Radiotap Namespace field, setting
   both is undefined.

   The Vendor Namespace Field contains three sub-fields. The first sub-field
   is 3 bytes long. It contains the vendor's IEEE 802 Organizationally
   Unique Identifier (OUI). The fourth byte is a vendor-specific "namespace
   selector."

   Before it resumes interpretation of presence bits in the following 32-bit
   presence words, if any, the interpreter shall reset its presence-bitmap
   index to 0, and change to the vendor namespace specified by the OUI and
   selector.

   The fifth and sixth bytes, skip_length, comprise a 16 bit little-endian
   value that tells the interpreter how many bytes of data after the end of
   the Vendor Namespace Field can only be interpreted according to the
   vendor namespace. If a radiotap header changes to a namespace that the
   interpreter does not understand, and back, the interpreter may resume
   interpretation in the new namespace by skipping skip_length data bytes
   after the end of the Vendor Namespace Field. If a radiotap header changes
   from a vendor namespace to another vendor namespace, the 6-byte data
   describing the new vendor namespace shall not be accounted for in
   skip_length.


The basic structure of the radiotap header appears to be:

u_int8_t        it_version;
u_int8_t        it_pad;
u_int16_t       it_len;

And then one or more of:
u_int32_t       it_present;

Followed by a variable amount of field data corresponding to which fields
are enabled. Is that generally correct?

What is considered to be a namespace? Can one of the members of the
it_present array be a namespace, or is the namespace actually found inside
the field data?

In the case where there are are two it_present values, like:

11000000 00000000 00000000 00000000
00000000 00000000 00000000 11111111
<field data>

Is the second it_present value considered to be in a private namespace (in
which case I would reference the field data to determine what the namespace
is?), or would it be considered a part of the default namespace?

If so, what does the Reset to RadioTap Namespace bit do? Given:
11000000 00000000 00000000 00000000
00100000 00000000 00000000 11111111

Does this mean that the next it_present value, if present, will be
considered in the default namespace? If so, does 'the interpreter shall
reset its presence-bitmap index to 0' mean that the interpreter should
forget all the values that were specified in the first it_present value?

What does 'Required Alignment 2' mean?

What does 'If a radiotap header changes from a vendor namespace to another
vendor namespace, the 6-byte data describing the new vendor namespace shall
not be accounted for in skip_length.' mean? Can you provide an example for
that scenario?

Thank You.
-- 
Dan White
