From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: TLV extension for radiotap
Date: Mon, 18 Jun 2018 16:35:10 +0200
Message-ID: <1529332510.3490.47.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

With the HE additions, we had to make a few incompatible changes in the
last minute, which was somewhat annoying.

Things would be somewhat simpler if we'd been able to extend the length
of fields.

To that extent, before we run out of bits in the first 32-bit word
(we've allocated up to bit 22, 23-25 for HE, and 29-31 for extensions)
I'd like to propose the following additions to radiotap:


Bit 28 - TLV extension to radiotap

If this bit is set higher bits shall not be set and the data following
it is to be understand as a type-length-value format, with the following
structure:

 * u16 type
 * u16 length
 * data ("length" bytes)
 * 0-3 padding bytes
   The whole thing is padded to a multiple of 4 bytes length, but that
   padding is not taken into account in the 'length' field.

The type is taken from the regular radiotap bit allocation, but the
special values (bits 29-31) are not valid here.

If field alignment is necessary beyond the implied 4-byte alignment,
type==28 (this extension) shall be used as padding with an appropriate
length (which would likely often be 0 for 8-byte alignment). This
ensures parser simplicity, it doesn't need to be aware of alignment
rules.


For backward compatibility, generators should generate data in fields
with type < 32 in regular non-TLV type fields.

To ensure the ability to do extensions in the future, newly defined
fields should start at type 0x100, and those with a number >=0x100
should be parsed as having a minimum length of whatever they get defined
as, allowing for possible length extension to them if needed.
Additionally, parts of them may be defined as optional to start with,
which allows them to be parsed depending on the length, e.g. if some
data isn't known.

We can also define that fields with numbers >= 32 shall not be used in
regular presence bitmaps, but only in TLV type fields.

If we start here at 0x100 for new fields, using that is not really
feasible in presence bitmaps anyway (you'd need a long list of 8
presence bitmaps), we can also stop reserving every value that's
29/30/31 modulo 32.

If you pack vendor extension into the TLV format you end up with a
duplicated length (TLV length vs. skip_length), but I think that's
reasonable. If we like, we can define a new vendor extension TLV-type
field that contains only the OUI/subtype, and omits the skip_length.


Yes, this format is somewhat bigger than what we have now, but since we
generate and consume it in software I don't think we really need to
worry about that too much these days.

The alternative would be to define an entirely new radiotap header
version, which is possible, but doesn't allow us to be partially
backward compatible, which seems useful. If we were to do that, we'd
also only really save 4 bytes (the first it_present dword that indicates
TLV extension), so it's not really all that worthwhile.



The simplest way to generate a new TLV-type radiotap header would be

it_version = 0,
it_len     = ...,
it_present = 1 << 28,

followed by fields in type/length/data/padding format.

For backward compatibility, it would be useful to generate the currently
existing data (channel/rate/HT/VHT/A-MPDU/HE and whatnot) in bitmap-
based format, and then switch to TLV for future fields.

Thoughts?

johannes
