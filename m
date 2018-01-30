From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Is anyone capturing and adding HE-MU or HE-MU-other-user
 headers?
Date: Tue, 30 Jan 2018 09:09:04 +0100
Message-ID: <1517299744.2189.39.camel@sipsolutions.net>
References: <CACyXjPyFxVj3aNiGY-BWADiH0NeJjeh7hBYUsCSRB9JAQL2-uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPyFxVj3aNiGY-BWADiH0NeJjeh7hBYUsCSRB9JAQL2-uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2018-01-26 at 06:54 -0800, Richard Sharpe wrote:
> 
> So far, we have dissection of the suggested Radiotap HE header, but
> does anyone know if any capture software inserts HE-MU headers or
> HE-MU-other-user headers.

I'm not aware of any, we only have the base HE for now. I've started
preparing to some extent, but I don't think we have the low-level
firmware support yet.

johannes
