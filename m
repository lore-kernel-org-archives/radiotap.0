From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Thu, 12 Apr 2018 06:56:02 -0700
Message-ID: <CACyXjPzvxWOHa_1QBmSsE7EvVB=Xr1A27EqTybbj=ggmsAeO+A@mail.gmail.com>
References: <1517300719.2189.51.camel@sipsolutions.net> <1523525707.12930.6.camel@sipsolutions.net>
 <9FE36B35-5238-436D-9B5A-342C92D20701@alum.mit.edu> <1523526947.12930.8.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1523526947.12930.8.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Apr 12, 2018 at 2:55 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> On Thu, 2018-04-12 at 02:54 -0700, Guy Harris wrote:
>>
>> > What do you think? Could wireshark do a point release of 2.6.x and 2.5=
.x
>> > to include the changes? Or perhaps we could just say that 2.5.x would
>> > just be broken for this, and people should upgrade for HE?
>>
>>
>> n.{odd number}.x Wireshark releases are development releases; Gerald,
>> is there any reason to care whether 2.5.x is broken when it tries to
>> read this radiotap field?
>
> Ah, I wasn't aware of this, thanks.
>
>> 2.6.0 is scheduled for April 18th; Gerald, if we have a finalized
>> version of this radiotap field soon, would it be possible to get a
>> change for that into the 2.6.0 release?
>
> That's pretty soon, but another option would be to just #if 0 the broken
> code quickly? That's a bit annoying, but better than shipping something
> that we may have to break.

I can go with either approach ... coding the changes will not take
long :-) Sigh. The perils of trying to stay at the front if the
charge.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
