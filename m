From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Thu, 16 Apr 2009 10:37:24 -0500
Message-ID: <20090416153724.GX25412@ojctech.com>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <69e28c910904141733m72ce521ap8f1865bec991fff7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, Apr 15, 2009 at 02:33:05AM +0200, G?bor Stefanik wrote:
> I propose the following suggested Radiotap features to be standardised:
> 
> * A new, 16-bit wide "TX flags" field (field number 15), containing
> the following flags:
>    - TX failed due to excessive retries,
>    - CTS-to-self protection,
>    - RTS/CTS-handshake,
>    - Frame shall not be ACKed ("No-ACK"), and
>    - Sequence number shall not be recalculated ("No-Seq").

Thanks.

FWIW, these assignments are compatible with NetBSD.  They appear to be
compatible with FreeBSD, too.

> If no one objects to this proposal in 7 days, I will resubmit it as a
> formal RFA, to allow eventual adoption.

Great!

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
