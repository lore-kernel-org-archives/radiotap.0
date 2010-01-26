From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Tue, 26 Jan 2010 11:47:29 -0600
Message-ID: <20100126174728.GV1060@ojctech.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Jan 26, 2010 at 03:26:07PM +0100, Matteo Croce wrote:
> Hi,
> the MCS filed is in the suggested fields since about a month, now I
> request its approval.
> 
> Here is the draft of the field: http://www.radiotap.org/suggested-fields/MCS

FreeBSD uses the flags field and the channel flags to indicate Short
GI and 40 MHz frames.  Let's adopt the FreeBSD definitions for that
purpose.

I think that it may be a good idea to add an MCS rate field instead of
to overload the legacy rate field, as FreeBSD does.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
