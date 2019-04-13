From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Sat, 13 Apr 2019 00:55:29 -0700
Message-ID: <3658DF8E-535E-43C6-95FD-CE61E3A7164F@alum.mit.edu>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <20190410233213.GN25552@nataraja>
 <1462659018bc40830efbe2348791b8df45b54cff.camel@sipsolutions.net>
 <20190413073505.GD24451@nataraja>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190413073505.GD24451@nataraja>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>
List-Id: radiotap@radiotap.org

On Apr 13, 2019, at 12:35 AM, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org> wrote:

> the "physical link info" is present in GSMTAP, but the granularity of
> GSMTAP frames is not user-IP frames, but "MAC blocks".  So your user =
IP
> frame might not be visible as it's still compressed, encrypted,
> fragmented, etc.

The granularity of Ethernet frames is not user IP frames, but Ethernet =
datagrams, so you user IP frame might not be visible as it's fragmented =
(the fragments might still be IP datagrams, but they would have to be =
reassembled - which Wireshark, for example, does, for those people still =
doing NFS-over-UDP :-)).

"Encrypted" may not apply there, but it *does* apply for 802.11 frames =
on a protected network (which Wireshark can decrypt, if you have 1) the =
network password for WEP or WPA-Personal and 2) the EAPOL handshake for =
WPA-Personal).=
