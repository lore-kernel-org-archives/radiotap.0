From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [FINAL] namespaces and vendor extensions
Date: Sun, 10 Jan 2010 14:04:24 +0100
Message-ID: <1263128664.7773.10.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Since there were no unaddressed objections to this proposal, I'm
reposting here to make everyone aware this will become part of radiotap
standard, as requested by the standardisation process, I'll make the
respective wiki changes in about a week from now.

The change will add the following two fields to radiotap:

Vendor Namespace
Bit Number
        not applicable, bit 30 in every it_present word 
Structure
        u8 OUI[3], u8 sub_namespace, __le16 skip_length 
Required Alignment
        2 

This field is reserved in all namespaces and every it_present word, the
standard radiotap namespace as well as all vendor namespaces. It is
mutually exclusive with the "Reset to Radiotap Namespace" field, setting
both is undefined.

The Vendor Namespace Field contains three sub-fields. The first
sub-field is 3 bytes long. It contains the vendor's IEEE 802
Organizationally Unique Identifier (OUI). The fourth byte is a
vendor-specific "namespace selector." 

Before it resumes interpretation of presence bits in the following
32-bit presence words, if any, the interpreter shall reset its
presence-bitmap index to 0, and change to the vendor namespace specified
by the OUI and selector. 

The fifth and sixth bytes, skip_length, comprise a 16 bit little-endian
value that tells the interpreter how many bytes of data after the end of
the Vendor Namespace Field can only be interpreted according to the
vendor namespace. If a radiotap header changes to a namespace that the
interpreter does not understand, and back, the interpreter may resume
interpretation in the new namespace by skipping skip_length data bytes
after the end of the Vendor Namespace Field. If a radiotap header
changes from a vendor namespace to another vendor namespace, the 6-byte
data describing the new vendor namespace shall not be accounted for in
skip_length.


Reset to Radiotap Namespace
Bit Number
        not applicable, bit 29 in every it_present word 
Structure
        no contents 
Required Alignment
        N/A

This field is reserved in all namespaces and every it_present word, the
standard radiotap namespace as well as all vendor namespaces. It is
mutually exclusive with the "Vendor Namespace" field, setting both is
undefined.

Upon interpreting this field, the interpreter shall reset its
presence-bitmap index to 0 and its namespace to the default radiotap
namespace, and change to the default radiotap namespace, before it
interprets subsequent presence-bitmap words. 
