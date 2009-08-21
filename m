From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Fri, 21 Aug 2009 17:11:19 +0200
Message-ID: <1250867479.4600.11.camel@johannes.local>
References: <4A8EAFA6.9010608@gmail.com>
	 <1250865255.4600.6.camel@johannes.local>
	 <69e28c910908210741wd3bc391x311523f5b55fd4f1@mail.gmail.com>
	 <1250865918.4600.9.camel@johannes.local>
	 <69e28c910908210804h6181aab1w4a864392239aa1ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-ElfnJgk9tnc3Yp/l4bdE"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69e28c910908210804h6181aab1w4a864392239aa1ac-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?G=E1bor?= Stefanik <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <damien.bergamini-GANU6spQydw@public.gmane.org>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, Dave Young <hidave.darkstar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, freebsd-mobile <freebsd-mobile-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, misc-openbsd <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, tech-openbsd <tech-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, netbsd-net <tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>, wireshark-dev <wireshark-dev-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-ElfnJgk9tnc3Yp/l4bdE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-08-21 at 17:04 +0200, G=C3=A1bor Stefanik wrote:

> I've reworked RTS/CTS since then, just haven't got to sending a new
> proposal yet. The current plan is as follows:
>=20
> TX_FLAGS & 0x0002: Use CTS
> TX_FLAGS & 0x0004: Use RTS
> TX_FLAGS & 0x0020: Disable RTS/CTS usage

Seems a bit strange, wouldn't setting neither RTS nor CTS have the
effect? Seems like 0x20 should rather be "use automatic and ignore the
other bits". Anyway, not appropriate here, you should just bring a new
proposal.

> If I remember correctly, I made an implementation for the Linux kernel
> (a generator-side implementation) and one for Wireshark (a parser-side
> implementation). Or should I make two generator-side implementations
> according to the requirement (e.g. one for Linux, another for
> OpenBSD)?

No, that was ok, I just meant that therefore by definition it can't be a
problem of lack of implementations.

johannes

--=-ElfnJgk9tnc3Yp/l4bdE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJKjrkUAAoJEODzc/N7+QmalQsP/iShDji6pLnoxRRQH9hIITK5
Su/qvKUnalSzN+Yo0nw6SS2ZWDAApWGgQv0ipIS/1yDFyunsb0DFVte3YEyKU6el
cal0ncZFOVon+dguVzpHljD3DKPEsg92o9UzH0sKa3PLDIvqWXRAvgKlyP3cwTqG
aJwIOI0YiZpaEbF/VyeEVkjk7lXyzLxs238sC/H9ysXU9DuKlELadRyOBuLB0lt9
mIbVXCZSxe04jLMg7Yn5B5NCsdLcE1PrM1NmljCZWDeJW4aVdsAl5JGf10ewLetb
ea35bEZcr6W15CU/zotk+d03Ryf/rghwduPyIawcqtQtHhyIfqWlkxU0ikYgYJIM
y1Mh+ZD4F6cetzEHkORdMMzuWMkplvDReiu+l6+0zoKGqAa/pH1A+McitEHl6qTi
vQYyGZodDbAf9zWujmDSVHXECvkjeSRDbdFJiwz2MG3rcQYJmcWRhOaAnvAuh2j3
LOAWvOVVEA5eU/rZYyjVqcidwFkcEGlXzOuj9t+NkEg9X+BpEKmBdj4fPP2rEQNZ
xjZ7xrXRL7mw+nn3a2oJLMuzN9IPReuUotoHsSmuHijVUVqpIkhvC8ZDuwVDZtKR
Kw+NuFt75ViEaOCKUb/qEoJExpGxY0dG2JctnuZeeyIFushslEmzw07QwKXCNXdv
EaNIs2pGTsW1AyF/Fwh9
=Im+o
-----END PGP SIGNATURE-----

--=-ElfnJgk9tnc3Yp/l4bdE--

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
