From: Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Sun, 23 Aug 2009 10:27:24 -0400
Message-ID: <20090823142724.GA29917@drd1813>
References: <4A8EAFA6.9010608@gmail.com>
 <1250865255.4600.6.camel@johannes.local>
 <69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com>
 <1250865918.4600.9.camel@johannes.local>
 <69e28c910908210804h6181aab1w4a864392239aa1ac@mail.gmail.com>
Reply-To: Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <69e28c910908210804h6181aab1w4a864392239aa1ac-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: G?bor Stefanik <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <damien.bergamini-GANU6spQydw@public.gmane.org>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-mobile <freebsd-mobile-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, misc-openbsd <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, tech-openbsd <tech-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, netbsd-net <tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>, wireshark-dev <wireshark-dev-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2009 at 05:04:20PM +0200, G?bor Stefanik wrote:
> > Besides,
> > you're supposed to make at least two implementations when proposing a
> > standard field.
>=20
> If I remember correctly, I made an implementation for the Linux kernel
> (a generator-side implementation) and one for Wireshark (a parser-side
> implementation). Or should I make two generator-side implementations
> according to the requirement (e.g. one for Linux, another for
> OpenBSD)?

Once there's a spec that's a little more stable I can add it to lorcon, so
that will give you 2 userspace implementations for tx (assuming aircrack
adopts it) with different authors.

-m

--=20
Mike Kershaw/Dragorn <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>
GPG Fingerprint: 3546 89DF 3C9D ED80 3381  A661 D7B2 8822 738B BDB1

"A baby seal walks into a club..."

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEARECAAYFAkqRUcwACgkQ17KIInOLvbHnEwCgtNpP2szed35FZIurTJJ+Ixix
VqAAn2std79YDlBkC+scYtfesZA6BT+o
=E+r3
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
