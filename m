From: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Mon, 30 Nov 2009 14:41:25 -0800
Message-ID: <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
References: <1259258152.32372.90.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1259258152.32372.90.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

Johannes,

I support to extend the current radiotap field definitions especailly
for vendor extension part. I hope Wireshark can soon adopt the idea of
vendor extension. I have comments on a few details in your proposal.

For the structure of the vendor space, you extend 'skip_length' from 8
bits to 16 bits.
> Structure
>        u8 OUI[3], u8 sub_namespace, __le16 skip_length
I'm neutral on that. My question is why not extend 'sub_namespace' to
16 bits too? I hardly see that a vendor extension part can go over 255
bytes. But if that happens, it's quite likely that the extension may
contain more than 8 fields.

Personally I'm not in favor of the proposed bit 29 "reset namespace".
But I'm ok with it if everyone else adopts it.

Thanks,
Joshua


On Thu, Nov 26, 2009 at 9:55 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> [Gerald: I'm copying you directly because I have a question about this
> patch, please see at the end of the email]
>
> This is a request for adoption of the previously discussed namespace
> proposal from David.
>
> Namespaces in radiotap serve two different use cases:
> =A01) vendor extensions and
> =A02) multiple uses of a single radiotap field.
>
> Vendor extensions allows data from any number of different vendors to be
> present in a single radiotap header. Each vendor namespace contains
> present bits just like regular radiotap, but these bits are under the
> control of the vendor. To allow compliant parsers to read past vendor
> extensions, they also contain the data length.
>
> Resetting the radiotap namespace when extending the present bitmap
> serves to allow a radiotap field be specified multiple times. An example
> for that would be specifying multi-rate retries during injection or for
> TX status.
>
> In the current radiotap header, the IEEE80211_RADIOTAP_EXT bit (bit 31)
> is reserved in any it_present bitmap and indicates that the bitmap
> continues. This shall be true for bit 29 (reset radiotap namespace) and
> bit 30 (vendor namespace) as well.
>
> This proposal differs from David's original one by using different
> alignment and size for the vendor data specification, I have opted to
> use 16 bits for the vendor data length since some people want to put a
> lot of data like raw TX/RX hardware descriptors into vendor fields. I
> have also clarified the data length variable to specify the fact that
> when switching away from a vendor namespace to another vendor namespace,
> the vendor namespace data is not part of the vendor namespace data
> length ("If a radiotap header changes from a vendor namespace to another
> vendor namespace, the 6-byte data describing the new vendor namespace
> shall not be accounted for in skip_length.") The text describing that
> the two fields are mutually exclusive is also new.
>
> Correct, existing radiotap implementations are compatible with this
> proposal because they will stop parsing the radiotap header at bit 29/30
> since even though they do not know that these bits are reserved in all
> namespaces and it_present words they do know that they cannot understand
> these bits, regardless of which it_present they encounter them in,
> because they were not previously defined. [It seems to me that the
> existing wireshark implementation is not correct -- it doesn't properly
> skip over extended present bitmap words.]
>
> Note that before this proposal the bits 63, 95, (31+n*32) were reserved
> due to overlaying the extension bit, this proposal also reserves the
> bits 29+n*32 and 30+n*32 in all namespaces due to overlapping with the
> namespace changes bits.
>
> The normative text of this proposal follows (minus formatting):
>
> --- begin normative text ---
> Vendor Namespace
> Bit Number
> =A0 =A0 =A0 =A0not applicable, bit 30 in every it_present word
> Structure
> =A0 =A0 =A0 =A0u8 OUI[3], u8 sub_namespace, __le16 skip_length
> Required Alignment
> =A0 =A0 =A0 =A02
>
> This field is reserved in all namespaces and every it_present word, the
> standard radiotap namespace as well as all vendor namespaces. It is
> mutually exclusive with the "Reset to Radiotap Namespace" field, setting
> both is undefined.
>
> The Vendor Namespace Field contains three sub-fields. The first
> sub-field is 3 bytes long. It contains the vendor's IEEE 802
> Organizationally Unique Identifier (OUI). The fourth byte is a
> vendor-specific "namespace selector."
>
> Before it resumes interpretation of presence bits in the following
> 32-bit presence words, if any, the interpreter shall reset its
> presence-bitmap index to 0, and change to the vendor namespace specified
> by the OUI and selector.
>
> The fifth and sixth bytes, skip_length, comprise a 16 bit little-endian
> value that tells the interpreter how many bytes of data after the end of
> the Vendor Namespace Field can only be interpreted according to the
> vendor namespace. If a radiotap header changes to a namespace that the
> interpreter does not understand, and back, the interpreter may resume
> interpretation in the new namespace by skipping skip_length data bytes
> after the end of the Vendor Namespace Field. If a radiotap header
> changes from a vendor namespace to another vendor namespace, the 6-byte
> data describing the new vendor namespace shall not be accounted for in
> skip_length.
>
> Reset to Radiotap Namespace
> Bit Number
> =A0 =A0 =A0 =A0not applicable, bit 29 in every it_present word
> Structure
> =A0 =A0 =A0 =A0no contents
> Required Alignment
> =A0 =A0 =A0 =A0N/A
>
> This field is reserved in all namespaces and every it_present word, the
> standard radiotap namespace as well as all vendor namespaces. It is
> mutually exclusive with the "Vendor Namespace" field, setting both is
> undefined.
>
> Upon interpreting this field, the interpreter shall reset its
> presence-bitmap index to 0 and its namespace to the default radiotap
> namespace, and change to the default radiotap namespace, before it
> interprets subsequent presence-bitmap words.
>
>
> --- end normative text ---
>
> I have implemented this proposal in Andy Green's and my stand-alone
> radiotap parser library available on
> http://git.sipsolutions.net/radiotap.git/
> (git clone http://git.sipsolutions.net/radiotap.git/ to get it, the web
> interface can also generate tarballs).
>
> I have additionally implemented this proposal in wireshark, without any
> vendor extension parsing, by making wireshark use a copy of the above
> library.
>
> Gerald: Here's where I have a question -- is that acceptable to you? The
> files are licensed properly, but it does require pulling the entire
> radiotap header into memory with ep_tvb_memdup(). Are you ok with that?
> Everything else would be rather complicated, requiring a complete
> re-implementation of the parser which doesn't seem all that helpful.
>
> johannes
>
>
