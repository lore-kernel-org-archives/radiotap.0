From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: Vendor extensions on radiotap for Atheros
Date: Wed, 26 Aug 2009 14:51:15 -0500
Message-ID: <20090826195115.GF1260@ojctech.com>
References: <43e72e890908261052g237dd19cy18baa900721f245a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <43e72e890908261052g237dd19cy18baa900721f245a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Joshua Zhao <Joshua.Zhao-DlyHzToyqoxBDgjK7y7TUQ@public.gmane.org>, Matt Smith <Matt.Smith-DlyHzToyqoxBDgjK7y7TUQ@public.gmane.org>, Jouni Malinen <j@w1.fi>
List-Id: radiotap@radiotap.org

On Wed, Aug 26, 2009 at 10:52:30AM -0700, Luis R. Rodriguez wrote:
> [ resending to the right new e-mail distribution list now ]
> 
> Atheros would like to start using Radiotap vendor extensions [1]. Do
> we just start using our OUI for this, extend the extension info on the
> wiki and perhaps contribute parsing of it to existing parsers?
> 
> Is that the procedure?

Yes, except we haven't adopted vendor extensions as a standard.  Step 1:
propose (and adopt) vendor extensions as a standard.  Step 2: the rest.

> [1] http://www.radiotap.org/Discussion/Vendor-Extensions

I think it is a good description, is it understood by everyone?

I should underscore that for backwards compatibility, an implementation
should not interpret bit 29 or bit 30 as an implicit extension of the
presence-bitmap, but you still have to use bit 31, the presence-bitmap
extension bit, to extend the bitmap.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
