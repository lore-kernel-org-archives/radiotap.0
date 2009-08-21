From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Fri, 21 Aug 2009 16:41:44 +0200
Message-ID: <69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com>
References: <4A8EAFA6.9010608@gmail.com> <1250865255.4600.6.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1250865255.4600.6.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <"damien bergamini"@free.fr>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, Dave Young <hidave.darkstar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-mobile <freebsd-mobile-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, misc-openbsd <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, tech-openbsd <tech-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, netbsd-net <tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>, wireshark-dev <wireshark-dev-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

2009/8/21 Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>:
> On Fri, 2009-08-21 at 16:31 +0200, G=E1bor Stefanik wrote:
>
>> Hope to see you on Freenode at the set date. Again, if the time is a
>> problem, respond, and I will try to find a better time.
>
> I don't think there's any need to have an IRC meeting. We've hashed o=
ut
> the way forward multiple times on the radiotap list. What is missing =
now
> isn't a consensus of how do things, but proposals and implementations=
=2E

My intention with the meeting is to form an actual proposal that all
implementors can agree on. We can produce proposals, and even new
standardized fields to no avail, as some implementors (especially
OpenBSD) appear to be stuck with implementations that collide with the
standard. These implementors need to be "awakened" and entered into
the discussions before anything can be done.

>
> Your own proposal had technical flaws (and in my opinion tried to do =
too
> much at a time) that you haven't addressed -- doing that would be muc=
h
> more productive than any such meeting.

What technical flaws are you trying to point out exactly? (The TX
flags field? My point is that it's worthless to "standardize" TX flags
by extending it and moving to "Defined fields" if noone is willing to
implement it.)

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
