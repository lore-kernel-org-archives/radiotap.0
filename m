From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] RX flags
Date: Wed, 18 Feb 2009 20:04:16 -0600
Message-ID: <20090219020416.GM17342@ojctech.com>
References: <1234172982.4175.184.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1234172982.4175.184.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Mon, Feb 09, 2009 at 12:00:53PM -0600, Johannes Berg wrote:
> 
> --=-lUysiMTCgz5FaPq+jp+v
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: quoted-printable
> 
> This is a request for adoption of the following new radiotap features:
> 
>  * a new flag in the "flags" field (field 1):
>     - bad FCS
>  * the new "RX flags" field (field 14), currently containing the
>    following flag:
>     - bad PLCP

Thanks for bringing the proposal, Johannes.  I will update NetBSD to
agree with these field definitions, if their are not objections in the
timeline you have described:

> Barring objections, I will repost the normative changes on in two weeks
> time (Feb 23.) to be adopted on March 2, at which point I will make the
> changes to the radiotap.org website and post the Linux patch for
> inclusion.

AFAIK, your definitions are compatible with FreeBSD, too, which is a big
plus to my mind.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
