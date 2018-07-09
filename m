From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] TLV fields for radiotap
Date: Mon, 09 Jul 2018 10:47:14 +0200
Message-ID: <1531126034.3298.18.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Since there were no comments, let's make this more formal. Any
objections now?


--
title: TLV fields in radiotap
categories: [suggested]
--
Bit Number:
: 28

Structure:
: list of TLVs detailed below

Required alignment
: 4

Unit(s)
: unspecified

If this bit is set higher bits may not be set (as they cannot be parsed,
given the variable length of this field) and the data following it is to
be understand as a type-length-value format, with this structure:

 * u16 type
 * u16 length
 * data ("length" bytes)
 * 0-3 padding bytes
   The whole thing is padded to a multiple of 4 bytes length, but that
   padding is not taken into account in the 'length' field.

The type is taken from the regular radiotap type (bit) allocation, but
the special values (29 and 31) are not valid, vendor namespaces (type
30) may be used as TLV fields.

If field alignment is necessary beyond the 4-byte alignment, type 28
(i.e. this extension) shall be used as padding with an appropriate
length (which would likely often be 0 for 8-byte alignment). This
ensures parser simplicity, it doesn't need to be aware of alignment
rules.


Generators should generate data in fields with type < 28 in regular non-
TLV fields, this ensures backward compatibility.

Generators shall use TLV fields for all fields with type >= 32.

Parsers shall be able to parse TLV fields with partial data present,
i.e. allow parsing optional values at the end of a field.
