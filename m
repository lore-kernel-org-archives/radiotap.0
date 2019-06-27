From: Krishna Chaitanya <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DMG Support
Date: Fri, 28 Jun 2019 01:26:12 +0530
Message-ID: <CABPxzYJyabjkEx5SwF_iED8=vBcUxFj7WtHYG=n8ssAb6u5O_g@mail.gmail.com>
References: <CABPxzYLh=fcGFFAMxcNY9pFN8HOczgoPcYe_+NNMiW-uuRDe5Q@mail.gmail.com>
 <CACyXjPz5YD9VUcmbtO68nexEbjpaQOeZnLixs078c3FvW2B7eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPz5YD9VUcmbtO68nexEbjpaQOeZnLixs078c3FvW2B7eA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, Jun 27, 2019 at 11:46 PM Richard Sharpe
<realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Thu, Jun 27, 2019 at 10:16 AM Krishna Chaitanya
> <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Hi Guys,
> >
> > I am looking at support for DMG specific fields to radiotap, the only
> > discussion I have found didn't reach any conclusion [1].
> >
> > Is there a plan to support these fields? It definitely needs a DMG
> > Type field with at least below params (from top of my head)
> >
> > - MCS (and extended MCS) along with data rate mapping
> >    - C-PHY
> >    - SC-PHY
> >    - Low power SC-PHY
> >    -OFDM
> > - Beam/Sector/Antenna ID Information
> > - RCPI
>
> Is there any kernel capture code or any other device that would support this?
Yes, https://elixir.bootlin.com/linux/latest/source/drivers/net/wireless/ath/wil6210/txrx.c#L317.
(Only upstream DMG driver) But, it has minimal info due to lack of DMG
specific fields.
Although, I am not sure whether it supports other PHY info than MCS and RSSI.
We could query beams, but beam info is not present in rx_desc.

> The general procedure to get there, however, is:
>
> 1. Propose the new header.
> 2. Implement code in Wireshark to handle the header and include useful
> info in the pseudo-header
> 3. Implement code that can generate sample captures with the new header.
> 4. Get someone to add such DMG support to DMG-capable devices to
> generate the new header.

Yes, that's the norm. Before proposing the fields, just wanted to
check if there is an ongoing work or
some kind of decision. So, should I go ahead and propose those fields?
