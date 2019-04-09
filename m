From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Radiotap header for S1G captures and associated changes and
 other definitions
Date: Tue, 09 Apr 2019 10:58:58 +0200
Message-ID: <6141d4a8b8422b0e7e06b1457bd9a46fae37a5c2.camel@sipsolutions.net>
References: <CACyXjPy-Lr143wcWaLkv-xgs9Ebc0j8pYfw8MzMXNEv2tLA0Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPy-Lr143wcWaLkv-xgs9Ebc0j8pYfw8MzMXNEv2tLA0Kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, Tasheng Lin <tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, "Aaron J. Lee" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Mon, 2019-03-04 at 19:18 -0800, Richard Sharpe wrote:
> This is a third attempt at a RADIOTAP header for S1G captures.

What's the status of this, were you going to resend?

Not sure I mentioned it before, but I think you shouldn't use bit 16 for
S1G, see below.

I just resent my proposal for TLV fields, and I also think we should get
that in before we add the S1G field, because ... we've run out of bits
in the first presence bitmap!

We're using all the bits 0-27 (other than 15 and 16 which are awkwardly
used for different things in different OSes).

Only bit 28 is free, bit 29 is the special "new radiotap namespace", bit
30 is the special "new vendor namespace", and bit 31 of course is the
extension.

Thus I think we should use bit 28 for the TLV switch so we won't always
have to generate an extension presence bitmap when we generate a TLV
type header.

What do you think?

johannes
