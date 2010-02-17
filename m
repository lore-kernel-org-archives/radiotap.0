From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Assigning a new DLT_ value for "standardized" radiotap?
Date: Tue, 16 Feb 2010 18:08:15 -0800
Message-ID: <5F21AFA5-4D4C-49A0-A228-A1177630E366@alum.mit.edu>
Mime-Version: 1.0 (Apple Message framework v1078)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

The presence-bit-number collisions mentioned on the radiotap Web site =
appear to be due to OpenBSD doing its own thing:

	14: FCS in OpenBSD, RX Flags in the standard and assigned for =
that in NetBSD and Linux
	15: hardware queue in OpenBSD, proposed for TX flags in the =
standard and assigned for that in NetBSD and Linux
	16: RSSI in OpenBSD, proposed for RTS Retries in the standard =
and assigned for that in NetBSD and Linux

(There was also a brief period of time, between 2007-06-11 and =
2007-07-01, where FreeBSD used 14 for the extended channel information, =
but it got moved to 18; it appears that was done before FreeBSD 7.0 got =
released, so it doesn't appear that any *released* version used 14 for =
the extended channel information.)

I've filed an bug against this:

	=
http://cvs.openbsd.org/cgi-bin/query-pr-wrapper?full=3Dyes&numbers=3D5691

but nothing has been done for it; I've also asked Reyk Floeter about it, =
and heard nothing.  I forget whether I've asked Damien Bergamini about =
it or not.

Unfortunately, there are probably both OpenBSD and NetBSD/Linux captures =
out there with a network type value of 127, so we can't easily make =
tcpdump or Wireshark or... handle both automatically (a command-line =
flag for tcpdump and a preference for Wireshark could be used).  If we =
were to introduce a new DLT_ value for "standard radiotap", tcpdump and =
Wireshark could unconditionally interpret those presence bit values as =
having the NetBSD/Linux meaning, and use a flag/preference or whatever =
for the existing value (or just blow off OpenBSD).

Would that be useful?=
