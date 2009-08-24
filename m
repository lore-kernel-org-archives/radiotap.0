From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Mon, 24 Aug 2009 11:55:11 -0700
Message-ID: <EE141467-6B64-48B1-AC4C-EA5BD08BDB00@alum.mit.edu>
References: <4A8EAFA6.9010608@gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4A8EAFA6.9010608-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <damien.bergamini-GANU6spQydw@public.gmane.org>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

(Removed mailing lists other than radiotap, fixed Damien Bergamini's =20
address, and removed the "other" David Young - the right David Young =20
is on the radiotap mailing list.)

On Aug 21, 2009, at 7:31 AM, G=E1bor Stefanik wrote:

> Radiotap is a de-facto standard for 802.11 frame injection and =20
> reception.
> Up to field ID 13, it can truly considered a standard (all current =20
> implementations
> agree on fields 1-13), but after that, implementations diverge widely.
>
> Here is a map of how current implementations define field IDs 14 and =20=

> up:

	...

> Wireshark:
> Field 14: RX flags, with option to decode FCS instead
> Fields 15...17 skipped

No:

Fields 15...17: not implemented, so if any of them are present, no =20
later fields are dissected

Also:

Tcpdump top-of-tree at tcpdump.org:

Fields 14...17: not implemented, so if any of them are present, no =20
later fields are dissected
Field 18: extended channel

> My current proposal for the future standard field ordering beyond =20
> field 14:
>
> Field 14: RX flags (as defined by the standard)
> Field 15: TX flags (as used by Linux, NetBSD and aircrack-ng)
> Field 16: RTS retry count (as used by Linux and NetBSD)
> Field 17: Data retry count (as used by Linux and NetBSD)
> Field 18: Extended channel (as used by FreeBSD and Wireshark)

...and top-of-tree tcpdump.org tcpdump (taken from FreeBSD's tcpdump).

> Field 19: RSSI (OpenBSD's field 16 moved to field ID 19 to avoid =20
> collisions)

So what does the value of that field mean?  The 802.11 spec just says

	The RSSI is an optional parameter that has a value of 0 through =
RSSI =20
Max. This parameter is a measure by
the PHY of the energy observed at the antenna used to receive the =20
current PPDU. RSSI shall be measured
between the beginning of the SFD and the end of the PLCP HEC. RSSI is =20=

intended to be used in a relative
manner. Absolute accuracy of the RSSI reading is not specified.

so its value doesn't intrinsically mean anything - the only thing you =20=

can do is say that, if the RSSI value is greater for packet B than for =20=

packet A, there was higher energy at the antenna when packet B was =20
received than when packet A was received.

If a driver supplies IEEE80211_RADIOTAP_DBM_ANTSIGNAL or =20
IEEE80211_RADIOTAP_DB_ANTSIGNAL, is the RSSI useful?

Are there any drivers that cannot supply =20
IEEE80211_RADIOTAP_DBM_ANTSIGNAL or IEEE80211_RADIOTAP_DB_ANTSIGNAL?=
