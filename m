From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Fri, 17 Apr 2009 11:50:59 +0200
Message-ID: <1239961859.26575.44.camel@johannes.local>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com>
	 <69e28c910904161147h5a68d3b5nd054b043d6ad2719@mail.gmail.com>
	 <1239908374.26575.20.camel@johannes.local>
	 <200904162110.05150.mb@bu3sch.de>  <20090416204806.GD25412@ojctech.com>
	 <69e28c910904161824t7af6860dxebf3a13069b924d5@mail.gmail.com>
	 (sfid-20090417_032507_012632_CF7AA3F9)
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-UZ9g0TTlwNU2A7OJblho"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <69e28c910904161824t7af6860dxebf3a13069b924d5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20090417_032507_012632_CF7AA3F9)
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: =?ISO-8859-1?Q?G=E1bor?= Stefanik <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-UZ9g0TTlwNU2A7OJblho
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-04-17 at 03:24 +0200, G=C3=A1bor Stefanik wrote:

> > I see the point that Michael is making.  What do you think?  Shall
> > we treat it as a 2-bit wide unsigned integer field in the Tx flags,
> > instead?
> >
>=20
> IMO that is a good idea, if we accept having non-booleans in a flags
> field. In that case, this proposal comes to my mind:
> -Define the second and third bits (mask 0x0006) as a quad-state flag
> indicating the use of RTS/CTS. So, we can have these values for the
> flag (accessible as (TXFlags & 0x0006) >> 1):
> 0: neither
> 1: rts
> 2: cts
> 3: auto-select (only makes sense when sending & during feature discovery)=
--=-UZ9g0TTlwNU2A7OJblho--
