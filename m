From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [ADOPTION] TLV fields for radiotap
Date: Tue, 28 May 2019 10:28:01 +0200
Message-ID: <491eda86d6950994614d3ef095fcf91037f88aa3.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Oops, completely forgot that I still have to finish this!

Anyway, since there were no objections in much longer time, I guess we
can consider this adopted now. I'll work at least to get it into
wireshark, I think Richard had already polished my initial patch a bit
more.

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

If this bit is set higher bits may not be set (as they cannot be
parsed, given the variable length of this field) and the data of this
field fills the remaining radiotap data (as indicated by the length
field in the header); the data is understood as a type-length-value item
list with the following item structure:

 * u16 type
 * u16 length
 * data ("length" bytes)
 * 0-3 padding bytes
   The whole item is padded to a multiple of 4 bytes length, but that
   padding is not taken into account in the 'length' field.

The type is taken from the regular radiotap type (bit) allocation, but
the special values 29 and 31 are not valid.

The vendor namespace type (30) may be used as a TLV field, but has the
following modified format as a TLV:
 - u16 type (30)
 - u16 length (length of data, as usual)
 - data containing
   - u8 OUI[3]
   - u8 subtype
   - u16 presence type (index of the bit previously used in the
                        presence bitmap, e.g. 0 for BIT(0))
   - u16 reserved (padding for 4-byte alignment of vendor data)
   - vendor data
 - padding (if needed)
As a consequence, multiple TLV fields are needed for multiple vendor
data items.


If field alignment is necessary beyond the 4-byte alignment, type 28
(i.e. this field value) shall be used as padding with an appropriate
length (which would likely often be 0 for 8-byte alignment). This
ensures parser simplicity, it doesn't need to be aware of alignment
rules.


Generators should generate data in fields with type < 28 in regular non-
TLV fields, this ensures backward compatibility.

Generators shall use TLV fields for all fields with type >= 32.

Parsers shall be able to parse TLV fields with partial data present as
indicated by the length of the data, i.e. producers can omit bytes they
don't fill at the end of the data. Such bytes are assumed to be 0.
