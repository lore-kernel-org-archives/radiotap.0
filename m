From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: RTS/CTS + CTS-to-self
Date: Fri, 21 Aug 2009 17:35:19 -0500
Message-ID: <20090821223519.GE1436@ojctech.com>
References: <4A8EAFA6.9010608@gmail.com> <1250865255.4600.6.camel@johannes.local> <69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com> <1250865918.4600.9.camel@johannes.local> <69e28c910908210804h6181aab1w4a864392239aa1ac@mail.gmail.com> <1250867479.4600.11.camel@johannes.local> <69e28c910908211455u5dcd70f0u94eab510ab91a69a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <69e28c910908211455u5dcd70f0u94eab510ab91a69a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, Aug 21, 2009 at 11:55:27PM +0200, G=E1bor Stefanik wrote:
> 2009/8/21 Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>:
> > On Fri, 2009-08-21 at 17:04 +0200, G=E1bor Stefanik wrote:
> >
> >> I've reworked RTS/CTS since then, just haven't got to sending a new
> >> proposal yet. The current plan is as follows:
> >>
> >> TX_FLAGS & 0x0002: Use CTS
> >> TX_FLAGS & 0x0004: Use RTS
> >> TX_FLAGS & 0x0020: Disable RTS/CTS usage
> >
> > Seems a bit strange, wouldn't setting neither RTS nor CTS have the
> > effect? Seems like 0x20 should rather be "use automatic and ignore th=
e
> > other bits". Anyway, not appropriate here, you should just bring a ne=
w
> > proposal.
>=20
> The point is that if all bits are 0, auto-setup is used. The problem
> with my original proposal (using two bits) was that an all-zero value
> had different effect than not including the TX flags field (and simply
> swapping "none" and "auto" would result in an illogicality where what
> would logically be "use both" would become "use neither" - just the
> opposite of its logical meaning). Making 0x20 mean "Auto-select
> RTS/CTS", interpreting all-zeros as "Use neither", would have the same
> problem as my proposal - all-zeros is different from a missing field.
> (An empty, zeroed field 15 should have no effect on the process,
> behaving as if field 15 was not present in the header.)

G=E1bor,

Please explain what is wrong with a two-bit (four-state) field like
this?

00: Let the hardware, firmware, or device driver decide.  (I.e., same as
    omitting Tx flags altogether.)
01: Send RTS/CTS.
10: Send CTS to self.
11: Forbid CTS-to-self and RTS/CTS.

This is just a small modification to one of your previous proposals.

(Note that I have trimmed the lengthy To: line!)

Dave

--=20
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
