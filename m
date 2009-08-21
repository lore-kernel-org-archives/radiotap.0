From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RTS/CTS + CTS-to-self
Date: Sat, 22 Aug 2009 00:47:19 +0200
Message-ID: <69e28c910908211547k7c48551aj4d9ac2d06ceeb6da@mail.gmail.com>
References: <4A8EAFA6.9010608@gmail.com> <1250865255.4600.6.camel@johannes.local>
	<69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com>
	<1250865918.4600.9.camel@johannes.local> <69e28c910908210804h6181aab1w4a864392239aa1ac@mail.gmail.com>
	<1250867479.4600.11.camel@johannes.local> <69e28c910908211455u5dcd70f0u94eab510ab91a69a@mail.gmail.com>
	<20090821223519.GE1436@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20090821223519.GE1436-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Dave Young <hidave.darkstar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Sat, Aug 22, 2009 at 12:35 AM, David Young<dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Aug 21, 2009 at 11:55:27PM +0200, G=E1bor Stefanik wrote:
>> 2009/8/21 Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>:
>> > On Fri, 2009-08-21 at 17:04 +0200, G=E1bor Stefanik wrote:
>> >
>> >> I've reworked RTS/CTS since then, just haven't got to sending a new
>> >> proposal yet. The current plan is as follows:
>> >>
>> >> TX_FLAGS & 0x0002: Use CTS
>> >> TX_FLAGS & 0x0004: Use RTS
>> >> TX_FLAGS & 0x0020: Disable RTS/CTS usage
>> >
>> > Seems a bit strange, wouldn't setting neither RTS nor CTS have the
>> > effect? Seems like 0x20 should rather be "use automatic and ignore the
>> > other bits". Anyway, not appropriate here, you should just bring a new
>> > proposal.
>>
>> The point is that if all bits are 0, auto-setup is used. The problem
>> with my original proposal (using two bits) was that an all-zero value
>> had different effect than not including the TX flags field (and simply
>> swapping "none" and "auto" would result in an illogicality where what
>> would logically be "use both" would become "use neither" - just the
>> opposite of its logical meaning). Making 0x20 mean "Auto-select
>> RTS/CTS", interpreting all-zeros as "Use neither", would have the same
>> problem as my proposal - all-zeros is different from a missing field.
>> (An empty, zeroed field 15 should have no effect on the process,
>> behaving as if field 15 was not present in the header.)
>
> G=E1bor,
>
> Please explain what is wrong with a two-bit (four-state) field like
> this?
>
> 00: Let the hardware, firmware, or device driver decide. =A0(I.e., same a=
s
> =A0 =A0omitting Tx flags altogether.)
> 01: Send RTS/CTS.
> 10: Send CTS to self.
> 11: Forbid CTS-to-self and RTS/CTS.

The 11 case is illogical. The logical meaning of 11 would be "use
both", but it actually means "use neither" - just the opposite.

However, now that I think of it - doesn't an RTS handshake use both
RTS and CTS packets?
In that case, the following layout makes sense:

First bit: use RTS.
Second bit: use CTS.

00: Auto-select
01: Use neither (this would logically mean "Use RTS, but not CTS" -
which is impossible.)
10: CTS-to-self (which uses only CTS, and no RTS frames are sent)
11: RTS handshake (uses both RTS and CTS, hence both bits set)

This has the following advantages:
-An all-zeros TX flags field is equivalent to having no TX flags field
in the header.
-The bits represent what packets are used by each protection method.
-No settings map to their logical opposites.

An alternative interpretation of the same scheme is this:

Second bit: use protection.
First bit: if protection is used, use RTS handshake; otherwise disable
auto-selection.

This produces the same mapping as the first.

>
> This is just a small modification to one of your previous proposals.
>
> (Note that I have trimmed the lengthy To: line!)
>
> Dave
>
> --
> David Young =A0 =A0 =A0 =A0 =A0 =A0 OJC Technologies
> dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org =A0 =A0 =A0Urbana, IL * (217) 278-3933
>



--=20
Vista: [V]iruses, [I]ntruders, [S]pyware, [T]rojans and [A]dware. :-)
