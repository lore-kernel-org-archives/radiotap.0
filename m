From: <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: RE: Proposal for an S1G header for radiotap
Date: Fri, 1 Feb 2019 14:03:57 -0800
Message-ID: <01da01d4ba7a$08824ac0$1986e040$@gmail.com>
References: <CACyXjPwCydx6fumWdXdLvg-StsRcALBLc5+4fCsGDaC7tcZXCQ@mail.gmail.com> <8d1bb1c53c670e7cfddfc0cf2f5e2447b2ee2ecb.camel@sipsolutions.net> <CACyXjPzc--Deaecx9HuV5i0jyO5uUKFOqEeUaWWv3oYXqBqc8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPzc--Deaecx9HuV5i0jyO5uUKFOqEeUaWWv3oYXqBqc8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: ko
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: 'Richard Sharpe' <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Johannes Berg' <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, 'Ray Wang' <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org
List-Id: radiotap@radiotap.org

Hi Johannes and Richard,

Thank you for your work and great comments.

For the S-MPDU issue, S-MPDU is same as VHT single MPDU in 802.11ac.
If there's pre-defined field for VHT single MPDU, we could use that.

For the S1G NDP issue, I found that there's PHDR_802_11_SOUNDING_PSDU=20
for "0-length PSDU" field. That sounding PSDU means NDP sounding frame, =
I guess.
So I think we could add S1G NDP frames under "0-length PSDU" field.

--
Best,
Aaron J. Lee

-----Original Message-----
From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=20
Sent: Friday, February 1, 2019 10:35 AM
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org; Aaron J. Lee <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Ray Wang =
<rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>; tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org
Subject: Re: Proposal for an S1G header for radiotap

On Fri, Feb 1, 2019 at 3:33 AM Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:
>
> Hi Richard,
>
> > Attached is a git format-patch patch that contains a proposal for an =
S1G header.
> >
> > This proposal was created by Aaron Lee and underwent a couple of=20
> > rounds of modifications among the WFA folks.
> >
> > All I have done here is to transcribe it to the format required by=20
> > the documentation web site. Hopefully I have not changed any intent.
>
> Thanks for doing this! :)
>
> > Below is some feedback from Johannes about the proposal so he does=20
> > not have to retype it along with some comments from me.
>
> :-)
>
> Some *additional* feedback below - please do check my previous note=20
> about aggregation handling, this is very unclear to me.

I will look at the other comments separately, but I think Aggegration =
relates to A-MPDU if I am reading section 9.7 of 802.11ah-2016 =
correctly.

In which case, we already have an A-MPDU header but we might need some =
changes. Perhaps the WFA folks or Aaron can comment on this/

--
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
