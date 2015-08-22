From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Sat, 22 Aug 2015 15:24:37 -0700
Message-ID: <EB71A63E-9362-4C1F-9D31-0A935E436E9C@alum.mit.edu>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com> <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu> <CACyXjPx81fh_jeQSUjE-_w8NQ_Jr-ajmnVWSopfzcLPOWoGmGg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPx81fh_jeQSUjE-_w8NQ_Jr-ajmnVWSopfzcLPOWoGmGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org


On Aug 22, 2015, at 3:06 PM, Richard Sharpe =
<realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Sat, Aug 22, 2015 at 1:59 PM, Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>>=20
>> On Aug 22, 2015, at 12:41 PM, Richard Sharpe =
<realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>=20
>>> The Present flags say that Flags are present, Channel is present and
>>> HT Information is present.
>>=20
>> By "HT Information" do you mean "the MCS field"?
>=20
> I suspect so. The Present flags are 0x0a000800. The HT information
> present flag appears to indicate that MCS information is present.

The Wireshark dissector refers to the MCS field as the "HT information" =
field when dissecting the presence flags.

(Note that Wireshark is not the authoritative reference for anything in =
radiotap.)
