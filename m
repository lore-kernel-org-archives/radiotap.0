From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Wed, 27 Jan 2010 09:30:02 -0600
Message-ID: <20100127153002.GC1060@ojctech.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
 <20100126174728.GV1060@ojctech.com>
 <1264584965.25642.15.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1264584965.25642.15.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, Jan 27, 2010 at 10:36:05AM +0100, Johannes Berg wrote:
> On Tue, 2010-01-26 at 11:47 -0600, David Young wrote:
> 
> > FreeBSD uses the flags field and the channel flags to indicate Short
> > GI and 40 MHz frames.  Let's adopt the FreeBSD definitions for that
> > purpose.
> 
> I'd mostly agree, but I'm not sure what they really use the 40MHz flag
> for. For instance, might there be value in knowing that the AP opened
> the channel for 40MHz, but for some reason we are doing 20MHz
> transmissions instead? And would this be an appropriate way of
> conferring that information?

I should take a closer look at the implementation.  A per-packet radio
information header does not need to carry the information of what the
AP could have done, but didn't, does it?  I think it should carry the
information that describes the properties of the packet.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
