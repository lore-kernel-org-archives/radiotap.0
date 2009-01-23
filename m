From: =?ISO-8859-1?Q?Stefanik_G=E1bor?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fyi: list is back
Date: Fri, 23 Jan 2009 15:36:33 +0100
Message-ID: <69e28c910901230636v199acf09wc8b4433a87a6cbd8@mail.gmail.com>
References: <20090123011001.GI20748@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20090123011001.GI20748-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, Jan 23, 2009 at 2:10 AM, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> wrote:
> FYI, the radiotap list is now in service at radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org,
> hosted by the NetBSD Foundation.  All the subscriptions were moved
> over, however, some of your subscription preferences may have been
> botched, sorry!
>
> First order of business: a proposal to standardize fields
>
> 14 IEEE80211_RADIOTAP_RX_FLAGS
> 15 IEEE80211_RADIOTAP_TX_FLAGS
> 16 IEEE80211_RADIOTAP_RTS_RETRIES
> 17 IEEE80211_RADIOTAP_DATA_RETRIES
> and
> 18 IEEE80211_RADIOTAP_XCHANNEL
>
> But that will have to wait until tomorrow.
>
> Dave
>
> --
> David Young             OJC Technologies
> dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
>

Thanks, and good news!

By the way, I have a proposal for IEEE80211_RADIOTAP_TX_FLAGS:
Currently, this field is defined as a bitmap containing:
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
them. So, userspace can in these cases set TX_FLAGS |=3D 0x0010 and put
pre-generated sequence numbers on the packets it injects.

Similar to how 0x0008 works, this bit also should be used when packets
are being sent, as opposed to when they are being reported as having
been sent (like the first 3 bits).

I have posted a reference implementation on the linux-wireless mailing
list about a month ago, and it is also available here:
http://trac.aircrack-ng.org/svn/trunk/patches/mac80211_2.6.28-rc8-wl_frag+a=
ck_radiotap.patch
(Note that this patch may not clearly apply to 2.6.29-rc2 or the
current wireless-testing kernel, as it was made against the
master-2008-12-17 tag of wireless-testing.)

G=E1bor

--=20
Vista: [V]iruses, [I]ntruders, [S]pyware, [T]rojans and [A]dware. :-)
