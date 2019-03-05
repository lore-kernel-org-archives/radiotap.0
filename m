From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Radiotap header for S1G captures and associated changes and other definitions
Date: Tue, 5 Mar 2019 07:29:19 -0800
Message-ID: <CACyXjPxL1Jr7xXCh9tDBaORB5YyiJH7Zb2H+sKsz3mjUCbxkkQ@mail.gmail.com>
References: <CACyXjPy-Lr143wcWaLkv-xgs9Ebc0j8pYfw8MzMXNEv2tLA0Kg@mail.gmail.com>
 <56728a565c1f84862615f8804881bf72b7d12511.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <56728a565c1f84862615f8804881bf72b7d12511.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, Tasheng Lin <tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, "Aaron J. Lee" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Mar 5, 2019 at 3:58 AM Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wr=
ote:
>
> Hi Richard,
>
> > 1. Channel field:
> >
> > 3 new values for Mask: 0x0002 for 700 MHz, 0x0004 for 800 MHz and
> > 0x0008 for 900 MHz spectrum channels respectively.
>
> How much space do we have there btw? We're going to get 6-7 GHz channels
> soon ... perhaps we should just give up on this field and put the actual
> frequency & bandwidth etc. somewhere? If we don't already ...

Yes, although that is possibly a more general question. S1G will
always be below 1GHz, I believe.

However, in general, I think we need a separate field that specifies
the BW as a string, and probably even one per antenna.

> > NDP type:
> > 0x00: NDP Control frame
> > 0x01: NDP Management frame
> > 0x02-0xFF: Reserved
> >
> > NDP data:
> >
> > These are as defined in 802.11ah-2016 Section 9.9 except that the top
> > two bits of data[4] are:
> >
> > 0x00: 1MHz
> > 0x01: 2MHz
> > 0x02-0x03: Reserved
>
> Is it really worth packing this into the end? You could have lots of
> space in e.g. the data2 or NDP type fields (I guess, you reserved lots
> of values there).
>
> > The S1G NPD format is essentially from section 9.9 of 802.11ah-2016
> > with some additional syntactic sugar:
> >
> > It is a 40-bit field.
>
> Not sure I understand this sentence. What's the syntactic sugar in being
> a 40-bit field?
>
> > In between, a 1MHz NDP CMAC frame contains 26 used bits and 13 unused
> > bits. The used bits are defined in section 9.9 of 802.11ah-2016. A
> > 2MHz NDP CMAC frame contains 37 used bits and one unused bit. Again,
> > the used bits are defined in 802.11ah-2016.
>
> Right.
>
> However, these also come with a 1-bit "NDP indication", 4-bit CRC and 6-
> bit tail; perhaps it should be at least *possible* to capture those too,
> even if nobody might do that right now? Then you'd need a total of 48
> bits for this, afaict.
>
>
> I guess a more fundamental question would be whether we should treat
> these as metadata or payload. Obviously here we're treating them as
> metadata and saying (by way of the 0-length field) that there's no
> payload. But perhaps these *should* in fact be the payload instead, and
> not use the 0-length field at all?
>
> I really don't know the answer to that. It seems fairly obvious that
> this one is more convenient, and the format of those frames is very
> specific to the S1G things, and they couldn't really be used outside of
> S1G unlike the 802.11 header & frame. So I think I'm happy with this,
> just wanted to note this design decision explicitly.

I will clean up the others over the next few days, but yes, I went
back and forward between having the NDP info be a separate payload
versus placing it in the S1G header. Placing it in the S1G header is
more convenient but will mean moving code around over what we
currently have, however, that is relatively easy.

It is a matter of convenience.

A question for Aaron and the WFA folks, however, is: Is there utility
capturing the NDP indication, or is that already captured in IS NDP
above? Similarly, is it useful to capture the CRC and tail etc. Does
the hardware give you access to these extra fields?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
