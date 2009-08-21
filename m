From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Fri, 21 Aug 2009 23:55:27 +0200
Message-ID: <69e28c910908211455u5dcd70f0u94eab510ab91a69a@mail.gmail.com>
References: <4A8EAFA6.9010608@gmail.com> <1250865255.4600.6.camel@johannes.local>
	<69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com>
	<1250865918.4600.9.camel@johannes.local> <69e28c910908210804h6181aab1w4a864392239aa1ac@mail.gmail.com>
	<1250867479.4600.11.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1250867479.4600.11.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <damien.bergamini-GANU6spQydw@public.gmane.org>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, Dave Young <hidave.darkstar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-mobile <freebsd-mobile-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, misc-openbsd <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, tech-openbsd <tech-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, netbsd-net <tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>, wireshark-dev <wireshark-dev-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

2009/8/21 Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>:
> On Fri, 2009-08-21 at 17:04 +0200, G=E1bor Stefanik wrote:
>
>> I've reworked RTS/CTS since then, just haven't got to sending a new
>> proposal yet. The current plan is as follows:
>>
>> TX_FLAGS & 0x0002: Use CTS
>> TX_FLAGS & 0x0004: Use RTS
>> TX_FLAGS & 0x0020: Disable RTS/CTS usage
>
> Seems a bit strange, wouldn't setting neither RTS nor CTS have the
> effect? Seems like 0x20 should rather be "use automatic and ignore th=
e
> other bits". Anyway, not appropriate here, you should just bring a ne=
w
> proposal.

The point is that if all bits are 0, auto-setup is used. The problem
with my original proposal (using two bits) was that an all-zero value
had different effect than not including the TX flags field (and simply
swapping "none" and "auto" would result in an illogicality where what
would logically be "use both" would become "use neither" - just the
opposite of its logical meaning). Making 0x20 mean "Auto-select
RTS/CTS", interpreting all-zeros as "Use neither", would have the same
problem as my proposal - all-zeros is different from a missing field.
(An empty, zeroed field 15 should have no effect on the process,
behaving as if field 15 was not present in the header.)

>
>> If I remember correctly, I made an implementation for the Linux kern=
el
>> (a generator-side implementation) and one for Wireshark (a parser-si=
de
>> implementation). Or should I make two generator-side implementations
>> according to the requirement (e.g. one for Linux, another for
>> OpenBSD)?
>
> No, that was ok, I just meant that therefore by definition it can't b=
e a
> problem of lack of implementations.
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
