From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Proposal for an S1G header for radiotap
Date: Fri, 01 Feb 2019 12:33:04 +0100
Message-ID: <8d1bb1c53c670e7cfddfc0cf2f5e2447b2ee2ecb.camel@sipsolutions.net>
References: <CACyXjPwCydx6fumWdXdLvg-StsRcALBLc5+4fCsGDaC7tcZXCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPwCydx6fumWdXdLvg-StsRcALBLc5+4fCsGDaC7tcZXCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
Cc: "Aaron J. Lee" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org
List-Id: radiotap@radiotap.org

Hi Richard,

> Attached is a git format-patch patch that contains a proposal for an S1G header.
> 
> This proposal was created by Aaron Lee and underwent a couple of
> rounds of modifications among the WFA folks.
> 
> All I have done here is to transcribe it to the format required by the
> documentation web site. Hopefully I have not changed any intent.

Thanks for doing this! :)

> Below is some feedback from Johannes about the proposal so he does not
> have to retype it along with some comments from me.

:-)

Some *additional* feedback below - please do check my previous note
about aggregation handling, this is very unclear to me.


> > I think the NDP indication (0x10 in data1) should probably be moved out
> > into the 0-length psdu field we already have, so we don't need to handle
> > special cases for it this in wireshark and other dissectors. The known
> > bit for that (in known field) makes no sense anyway because clearly you
> > have to know whether a packet was NDP or not. Unless I'm completely
> > misunderstanding the meaning of this field.
> 
> The issue may be that an NDP actually carries non-MAC data. 25 bits in
> the case of 1MHz NDPs and 37 bits in the case of 2MHz NDPs. If we can
> shoehorn them into the 0-length-PSDU maybe we should.

Oh. Maybe not then. How would these bits even be represented in
wireshark though?

Clearly, the 25/37 bits are not part of the radiotap header proposal
right now, but if they're non-MAC data they probably should be?

I'd almost think we should be doing something like:

 * add a new "S1G NDP" sub-item to "0-length PSDU" field, even if now
   strictly it's no longer "0-length" but more like "no-MSDU"... which
   really is the effect in wireshark anyway
 * remove NDP from the S1G field
 * add a separate radiotap field for S1G NDP data, containing a length
   bit and 37 data bits?

>  | **Mask** | **Meaning** |
>  | 0x0010 | Turbo Channel |
> +| 0x0002 | S1G 700MHz spectrum channel |
> +| 0x0004 | S1G 800MHz spectrum channel |
> +| 0x0008 | S1G 900MHz spectrum channel |
>  | 0x0020 | CCK channel |
>  | 0x0040 | OFDM channel |
>  | 0x0080 | 2 GHz spectrum channel |

That seems misplaced, should be after "Turbo Channel" I guess.

But also like I said above, some research on prior use of these bits
would be useful.
Looking at FreeBSD:
https://github.com/freebsd/freebsd/blob/master/sys/net80211/ieee80211_radiotap.h

they seem to have a few *higher* bits, but not lower ones. Maybe we can
risk it.

johannes
