From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Resend] Proposal: Add a new flag to the proposed TX flags field to
	control the sequence number of injected packets
Date: Fri, 13 Mar 2009 16:02:09 +0100
Message-ID: <69e28c910903130802t1bd879av50e3d51c075f6e2c@mail.gmail.com>
References: <69e28c910902091056h119b3fa4g460e5e18288c1c3c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <69e28c910902091056h119b3fa4g460e5e18288c1c3c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

Currently the TX Flags field is defined as a bitmap containing:
0x0001 Transmission failed due to excessive retries
0x0002 Transmission used CTS-to-self protection
0x0004 Transmission used RTS/CTS handshake
0x0008 Transmission shall not expect an ACK frame and not retry when
no ACK is received

I'd like to propose the following additional bit:
0x0010 Transmission has the sequence and fragment numbers pre-set from
userspace and should not be renumbered

This bit is useful for packet injection, where userspace injectors
might want to control the sequence and fragment numbers of the packets
it injects. A particular example is aireplay-ng's -5 mode
(fragmentation attack), where userspace injects pre-made fragments
one-by-one. The wireless stack usually can't recognize that the
injected packets are fragments, and instead treats them as complete
packets, assigning a new sequence number to each fragment, preventing
the receiving party from correctly reassembling the fragmented packet.
The userspace does however know that the packets being injected are
fragments, and such can produce much more correct sequence numbers for
them. So, userspace can in these cases set TX_FLAGS |=3D3D 0x0010 and put
pre-generated sequence numbers on the packets it injects.

Similar to how 0x0008 works, this bit also should be used when packets
are being sent, as opposed to when they are being reported as having
been sent (like the first 3 bits).

I have posted a reference implementation on the linux-wireless mailing
list about a month ago, and it is also available here:
http://trac.aircrack-ng.org/svn/trunk/patches/mac80211_2.6.28-rc8-wl_frag+a=
=3D
ck_radiotap.patch
(Note that this patch may not clearly apply to 2.6.29-rc2 or the
current wireless-testing kernel, as it was made against the
master-2008-12-17 tag of wireless-testing.)

G=E1bor
