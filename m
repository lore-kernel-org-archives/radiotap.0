From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Would it be useful to have preferences for radiotap to allow
 handling of captures with conflicting presence flags?
Date: Fri, 15 Dec 2017 09:24:00 +0100
Message-ID: <1513326240.26976.93.camel@sipsolutions.net>
References: <CACyXjPy9nUFhKmgzyVt6KBqHZW3oa0dgpkzQyGbtHHLOnC=f1w@mail.gmail.com>
	 <481F8A87-D5A1-440F-832F-7E433179A7F9@alum.mit.edu>
	 <CACyXjPyh6H6-8BeUY-OPWAmdGEpzAQpYgMYy3rWGfNUxGY1xsQ@mail.gmail.com>
	 <7A209774-9919-455B-9E04-BDAF26BE99DA@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <7A209774-9919-455B-9E04-BDAF26BE99DA-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2017-12-14 at 17:52 -0800, Guy Harris wrote:

> My inclination is 1) not to add the presence bits for suggested
> fields to any code that processes radiotap headers unless there are
> capture files or devices that use them and 

Absolutely - that's why we got this mailing list and process started in
the first place :-)

> 2) not to add preferences unless there are capture files or devices
> that one interpretation of the presence bit in question *and* capture
> files or devices that use the other interpretation.

Agree with this. We do have conflicts now because the spec historically
evolved in the header files in various *BSD & Linux trees, but that
should be a thing of the past now. At least, if anyone still does that
I'd hope we don't actually encourage it and add preferences for it.

> If you're doing this because you're working on something that
> *generates* radiotap headers, I would suggest that you use only
> defined fields if possible and, if you need to add information that's
> *not* supported by any defined field, try to get a field defined -
> preferably with its own presence bit assigned.

You could also use vendor fields if you really think it's not something
that benefits from proper definition/assignment.

johannes
