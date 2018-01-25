From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Have new bits been defined for the A-MPDU Status field in the
 radiotap header for HE?
Date: Thu, 25 Jan 2018 17:15:35 +0100
Message-ID: <1516896935.2189.2.camel@sipsolutions.net>
References: <CACyXjPxfD2K_YdHJVU3gm3Ms90gqXV9YnDoQonMviN2y4qXk0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPxfD2K_YdHJVU3gm3Ms90gqXV9YnDoQonMviN2y4qXk0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2018-01-25 at 07:14 -0800, Richard Sharpe wrote:
> Hi folks,
> 
> I have a capture that has the value 0x00c0 in the A-MPDU Flags section
> of the A-MPDU status field. These bits are currently listed as
> reserved.
> 
> The HE folks are also saying they need to see an EOF bit to identify
> S-MPDU packets.
> 
> Does anyone know anything about that?

Yeah this probably came from us - I sent a note about it about 10 days
ago, that we were planning to make that addition.

Since I haven't heard anything about that, I think I'll just propose it
as an official part of the standard.

johannes
