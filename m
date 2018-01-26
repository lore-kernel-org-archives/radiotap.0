From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Conflicting definitions between the radiotap HE PPDU format
 field and 802.11axD2
Date: Fri, 26 Jan 2018 11:42:00 +0100
Message-ID: <1516963320.2189.22.camel@sipsolutions.net>
References: <CACyXjPzSHgyBkpXBR7=eqsfiCmeKBOsQD=0dJtUMwqUk=yWxYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPzSHgyBkpXBR7=eqsfiCmeKBOsQD=0dJtUMwqUk=yWxYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi Richard,

Sorry, it was too late last night to think clearly about this :-)

> It seems that 802.11ax D2 defines, in Table 28-18, in HE-SIG-A, a
> 1-bit format fields (B0) that takes the values 0 for HE TB PPDUs and 1
> for HE SU PPDUs and that is reserved for others but must be set to 1.

Correct. There are four PPDU types:
 * HE SU PPDU
 * HE ER SU PPDU
 * HE TB PPDU
 * HE MU PPDU

The format bit distinguishes between TB and SU PPDUs. You'll note that
this bit doesn't even exist in an MU PPDU.

The actual differentiation between the four types is done in another
way, I'm not entirely sure right now how, you can see it in 28.3.21, in
particular in Figure 28-59.

Basically what I decided to expose in radiotap is the HE sub-formats as
per the RXVECTOR (and maybe TXVECTOR, if we use it for TX) parameters.

> However, what seems to be the equivalent radiotap he ppdu format field
> is 2 bits and uses different values.
> 
> Have I misunderstood? What is the resolution of this?

Does the above resolve this for you?

johannes
