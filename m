From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Fri, 21 Aug 2009 17:04:20 +0200
Message-ID: <69e28c910908210804h6181aab1w4a864392239aa1ac@mail.gmail.com>
References: <4A8EAFA6.9010608@gmail.com> <1250865255.4600.6.camel@johannes.local>
	<69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com>
	<1250865918.4600.9.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1250865918.4600.9.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <damien.bergamini-GANU6spQydw@public.gmane.org>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, Dave Young <hidave.darkstar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-mobile <freebsd-mobile-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, misc-openbsd <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, tech-openbsd <tech-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, netbsd-net <tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>, wireshark-dev <wireshark-dev-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

2009/8/21 Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>:
> On Fri, 2009-08-21 at 16:41 +0200, G=E1bor Stefanik wrote:
>
>> My intention with the meeting is to form an actual proposal that all
>> implementors can agree on. We can produce proposals, and even new
>> standardized fields to no avail, as some implementors (especially
>> OpenBSD) appear to be stuck with implementations that collide with t=
he
>> standard. These implementors need to be "awakened" and entered into
>> the discussions before anything can be done.
>
> There's nothing the standard can do about that. Like I said, we've
> talked about that enough in my opinion.
>
>> > Your own proposal had technical flaws (and in my opinion tried to =
do too
>> > much at a time) that you haven't addressed -- doing that would be =
much
>> > more productive than any such meeting.
>>
>> What technical flaws are you trying to point out exactly? (The TX
>> flags field? My point is that it's worthless to "standardize" TX fla=
gs
>> by extending it and moving to "Defined fields" if noone is willing t=
o
>> implement it.)
>
> But people are already implementing it, and if they do something else
> that's their problem. The flaw I'm thinking of was over the RTS/CTS
> handling where some people (including myself) had comments.

I've reworked RTS/CTS since then, just haven't got to sending a new
proposal yet. The current plan is as follows:

TX_FLAGS & 0x0002: Use CTS
TX_FLAGS & 0x0004: Use RTS
TX_FLAGS & 0x0020: Disable RTS/CTS usage

Or, in more C++-like notation:
switch (TX_FLAGS & 0x0026) {
       case 0x0002:
                 Use CTS;
                 break;
       case 0x0004:
       case 0x0006:
                 Use RTS;
                 break;
       case 0x0020:
                 Disable RTS/CTS usage;
                 break;
       default:
                 fall back to automatic selection
}

> Besides,
> you're supposed to make at least two implementations when proposing a
> standard field.

If I remember correctly, I made an implementation for the Linux kernel
(a generator-side implementation) and one for Wireshark (a parser-side
implementation). Or should I make two generator-side implementations
according to the requirement (e.g. one for Linux, another for
OpenBSD)?

>
> johannes
>



--=20
Vista: [V]iruses, [I]ntruders, [S]pyware, [T]rojans and [A]dware. :-)
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
