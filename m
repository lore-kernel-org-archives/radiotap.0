From: RHS Linux User <xxx-hj3ALZ0n2zLQT0dZR+AlfA@public.gmane.org>
Subject: Re: packet injection and Suggested fields -
Date: Wed, 18 Feb 2009 06:27:40 -0500 (EST)
Message-ID: <Pine.LNX.3.95.1090218062405.1345C-100000@nei>
References: <1234946748.4149.12.camel@johannes.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1234946748.4149.12.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Vipin M <vipintm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


Hi All,

   A comment about packet injection.

   Given a "real" monitor mode (all packets and packet fragments).
   AND a REAL injection mode,

   MOST ALL of the driver packet bugs could be ELIMINATED [bypassed] with
the proper driver.

   Also ANY number of APs can be created. Mesh can be made to really work
reliably, etc.

   Subject, as mentioned, to radio [channel changing] limitations of
course.

   warm regards from COLD NH USA,
   wiz


On Wed, 18 Feb 2009, Johannes Berg wrote:

> Hi,
> 
> > 1) In packet injection if radiotap values link "Channel" is set to a
> > specific channel does it send in that channel  or it is only for
> > sniffing.
> 
> Since your PHY can only be on one channel at a time, I suspect this
> field isn't useful for injection. We certainly haven't implemented it in
> Linux.
> 
> > 2) The suggested fields ( http://www.radiotap.org/suggested-fields )
> > can be used, is they are incorporated.
> 
> Certainly, for example the 0x0008 bit in
> http://www.radiotap.org/suggested-fields/TX%20flags is useful only for
> injection.
> 
> Maybe we need to clarify which fields are useful for injection and
> should be supported if injection control is supported?
> 
> johannes
> 
