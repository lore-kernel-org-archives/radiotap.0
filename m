From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Would it be useful to have preferences for radiotap to allow
 handling of captures with conflicting presence flags?
Date: Thu, 14 Dec 2017 17:52:02 -0800
Message-ID: <7A209774-9919-455B-9E04-BDAF26BE99DA@alum.mit.edu>
References: <CACyXjPy9nUFhKmgzyVt6KBqHZW3oa0dgpkzQyGbtHHLOnC=f1w@mail.gmail.com>
 <481F8A87-D5A1-440F-832F-7E433179A7F9@alum.mit.edu>
 <CACyXjPyh6H6-8BeUY-OPWAmdGEpzAQpYgMYy3rWGfNUxGY1xsQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPyh6H6-8BeUY-OPWAmdGEpzAQpYgMYy3rWGfNUxGY1xsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Dec 14, 2017, at 4:13 PM, Richard Sharpe =
<realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Great. I will get to work adding some of the missing bits and maybe a
> preference around the tx_flags and hardward_queue.

My inclination is 1) not to add the presence bits for suggested fields =
to any code that processes radiotap headers unless there are capture =
files or devices that use them and 2) not to add preferences unless =
there are capture files or devices that one interpretation of the =
presence bit in question *and* capture files or devices that use the =
other interpretation.

If you're doing this because you're working on something that =
*generates* radiotap headers, I would suggest that you use only defined =
fields if possible and, if you need to add information that's *not* =
supported by any defined field, try to get a field defined - preferably =
with its own presence bit assigned.

> BTW, why is there what looks like 6-bytes of un-interpreted data
> between the rx-flags and timestamp info?

As the top-level radiotap page says:

	Radiotap requires that all fields in the radiotap header are =
aligned to natural boundaries. For radiotap, that means all 8-, 16-, =
32-, and 64-bit fields must begin on 8-, 16-, 32-, and 64-bit =
boundaries, respectively. In this way, generators and parsers can avoid =
unaligned accesses to radiotap capture fields. Radiotap-compliant =
generators must insert padding before a capture field to ensure its =
natural alignment. Radiotap-compliant packet parsers, such as =
tcpdump(8), expect and skip the padding.

RX flags:

	http://www.radiotap.org/fields/RX%20flags.html

is a 2-byte field, requiring 2-byte alignment.

Timestamp:

	http://www.radiotap.org/fields/timestamp.html

requires 8-byte alignment, as it includes an 8-byte numerical value.

So if you have an RX flags field that happens to be aligned on an 8-byte =
boundary, followed immediately by a timestamp field, there needs to be 6 =
bytes of padding after the RX flags field to align the timestamp field =
on an 8-byte boundary.=
