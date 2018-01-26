From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Field defined twice in HE-MU
Date: Fri, 26 Jan 2018 19:17:13 +0100
Message-ID: <1516990633.2189.28.camel@sipsolutions.net>
References: <CACyXjPxD4gpsDWf9mBO8mzCxT7SYQjhV4+eAZ=x-D0Ut63K-NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPxD4gpsDWf9mBO8mzCxT7SYQjhV4+eAZ=x-D0Ut63K-NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2018-01-26 at 09:26 -0800, Richard Sharpe wrote:

> in http://www.radiotap.org/fields/HE-MU.html the flag SIG-B
> Compression known is defined in both flags1 and flags2.

Good catch. Let's (arbitrarily) pick the one in flags1 and mark the
other reserved?

johannes
