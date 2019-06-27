From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DMG Support
Date: Thu, 27 Jun 2019 13:40:36 -0700
Message-ID: <CACyXjPzNkK6Uq5kbA8O2e_4szD7T9r6DifkLCQ5ks1h1e4sAPg@mail.gmail.com>
References: <CABPxzYLh=fcGFFAMxcNY9pFN8HOczgoPcYe_+NNMiW-uuRDe5Q@mail.gmail.com>
 <CACyXjPz5YD9VUcmbtO68nexEbjpaQOeZnLixs078c3FvW2B7eA@mail.gmail.com> <CABPxzYJyabjkEx5SwF_iED8=vBcUxFj7WtHYG=n8ssAb6u5O_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CABPxzYJyabjkEx5SwF_iED8=vBcUxFj7WtHYG=n8ssAb6u5O_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Krishna Chaitanya <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, Jun 27, 2019 at 12:56 PM Krishna Chaitanya
<chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Thu, Jun 27, 2019 at 11:46 PM Richard Sharpe
> <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Thu, Jun 27, 2019 at 10:16 AM Krishna Chaitanya
> > <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > Hi Guys,
> > >
> > > I am looking at support for DMG specific fields to radiotap, the only
> > > discussion I have found didn't reach any conclusion [1].
> > >
> > > Is there a plan to support these fields? It definitely needs a DMG
> > > Type field with at least below params (from top of my head)
> > >
> > > - MCS (and extended MCS) along with data rate mapping
> > >    - C-PHY
> > >    - SC-PHY
> > >    - Low power SC-PHY
> > >    -OFDM
> > > - Beam/Sector/Antenna ID Information
> > > - RCPI
> >
> > Is there any kernel capture code or any other device that would support=
 this?
> Yes, https://elixir.bootlin.com/linux/latest/source/drivers/net/wireless/=
ath/wil6210/txrx.c#L317.
> (Only upstream DMG driver) But, it has minimal info due to lack of DMG
> specific fields.
> Although, I am not sure whether it supports other PHY info than MCS and R=
SSI.
> We could query beams, but beam info is not present in rx_desc.
>
> > The general procedure to get there, however, is:
> >
> > 1. Propose the new header.
> > 2. Implement code in Wireshark to handle the header and include useful
> > info in the pseudo-header
> > 3. Implement code that can generate sample captures with the new header=
.
> > 4. Get someone to add such DMG support to DMG-capable devices to
> > generate the new header.
>
> Yes, that's the norm. Before proposing the fields, just wanted to
> check if there is an ongoing work or
> some kind of decision. So, should I go ahead and propose those fields?

I would say yes. Take note that any new headers should use the new TLV form=
at.

Also, there has been a proposal for an S1G header so you might want to
use the next available type.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
