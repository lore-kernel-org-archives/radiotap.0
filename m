From: =?UTF-8?B?R8OhYm9yIFN0ZWZhbmlr?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Plans for an online meeting regarding Radiotap
Date: Fri, 21 Aug 2009 16:31:02 +0200
Message-ID: <4A8EAFA6.9010608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-4FwvQ6koJAc@public.gmane.org>
Cc: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-mobile <freebsd-mobile-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, misc-openbsd <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, tech-openbsd <tech-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, netbsd-net <tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>, wireshark-dev <wireshark-dev-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

Radiotap is a de-facto standard for 802.11 frame injection and receptio=
n.
Up to field ID 13, it can truly considered a standard (all current=20
implementations
agree on fields 1-13), but after that, implementations diverge widely.

Here is a map of how current implementations define field IDs 14 and up=
:

Linux (both mac80211 & madwifi, not sure about libertas) & NetBSD:
=46ield 14: RX flags (standardized field)
=46ield 15: TX flags
=46ield 16: RTS retries
=46ield 17: Data retries

=46reeBSD:
=46ields 14...17 skipped (incliding standardized field 14), field 18:=20
Extended channel

OpenBSD:
=46ield 14: FCS of the frame (clashes with standard - field 14 is defin=
ed=20
as RX flags!)
=46ield 15: Hardware queue
=46ield 16: RSSI

DragonFly BSD: No fields above 13 implemented.

Aircrack-ng:
=46ield 14: RX flags (as in the standard)
=46ield 15: TX flags

CACE AirPcap software:
=46ield 14: FCS of the frame (clashes with standard; the FCS is also ap=
pended
to the end of the packet, so this usage is unneeded)

Wireshark:
=46ield 14: RX flags, with option to decode FCS instead
=46ields 15...17 skipped
=46ield 18: Extended channel

Radiotap fields 14 and up need to be sorted out to allow further=20
advancements
of the standard. In the current state, essentially no fields can be=20
added without
risking a collision between implementations. To remedy this, I would=20
like to propose
an online mini-summit to be held on Freenode, with the goal of defining=
=20
a standard
way to use fields 14 and up.
The summit is to be held in IRC channel #radiotap, where interested=20
parties can join
the discussion and propose changes. My preferred time for this event is
August 25, 2009, 18:00 GMT; please let me know if this date is=20
unsuitable for any of
you, and I will try to find a better time for the summit when everyone=20
interested can attend.

My current proposal for the future standard field ordering beyond field=
 14:

=46ield 14: RX flags (as defined by the standard)
=46ield 15: TX flags (as used by Linux, NetBSD and aircrack-ng)
=46ield 16: RTS retry count (as used by Linux and NetBSD)
=46ield 17: Data retry count (as used by Linux and NetBSD)
=46ield 18: Extended channel (as used by FreeBSD and Wireshark)
=46ield 19: RSSI (OpenBSD's field 16 moved to field ID 19 to avoid coll=
isions)

In addition, the following new fields may be worth addition to the stan=
dard:
RTS threshold, Fragmentation threshold, Extended rate (with MCS index=20
support).
I'm deliberately not assigning field numbers to these proposed fields=20
yet to prevent
early, divergent implementations of them; the field IDs for these shoul=
d=20
be decided
during the summit.

I'm for dropping the following fields, please let me know during the su=
mmit
if there are any use cases for them:
-FCS of the frame (if we have FCS data, then it should be appended to t=
he
end of the frame, not put into the header)
-Hardware queue (I don't see the point of this... maybe a full QoS=20
control field
would be needed instead)

Hope to see you on Freenode at the set date. Again, if the time is a=20
problem,
respond, and I will try to find a better time.

Sincerely,
G=C3=A1bor Stefanik <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
