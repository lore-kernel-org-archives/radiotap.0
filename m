From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Would it be useful to have preferences for radiotap to allow
 handling of captures with conflicting presence flags?
Date: Thu, 14 Dec 2017 15:24:41 -0800
Message-ID: <481F8A87-D5A1-440F-832F-7E433179A7F9@alum.mit.edu>
References: <CACyXjPy9nUFhKmgzyVt6KBqHZW3oa0dgpkzQyGbtHHLOnC=f1w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPy9nUFhKmgzyVt6KBqHZW3oa0dgpkzQyGbtHHLOnC=f1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Dec 14, 2017, at 1:06 PM, Richard Sharpe =
<realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I notice on this page
>=20
>  http://www.radiotap.org/fields/suggested
>=20
> it mentions that there are some conflicting usages of flag bits for =
radiotap.
>=20
> Currently, Wireshark knows about bit 14 in the presence flags, but
> hard-codes it for rx-Flags.

No, it has a preference for that, defaulting to rx-flags.  Tcpdump has =
no preference for it, hardwiring it to rx-flags.

> It also doesn't know about tx-Flags (or
> hardware-queue).
>=20
> Would it be useful to allow the user to specify they want to be able
> to switch between usages or are we trying to stamp out such
> conflicting uses?

The conflicts are historical; I think the intent for radiotap is that =
further conflicts be at least *very strongly* discouraged, if not simply =
forbidden.  I vote for "forbidden".  As the page you cite says:

	Note that some fields currently have numbers assigned already, =
this is due to different OSes defining different bits unilaterally. =
*Such mistakes should not be repeated in the future.*

(emphasis mine).

The radiotap spec doesn't control what code that processes radiotap =
headers does; it neither requires nor forbids preferences.  I don't =
think it should require or forbid them as a way of dealing with existing =
conflicts, but it should (and does) say that no requirement for a =
preference should be introduced in the future.=
