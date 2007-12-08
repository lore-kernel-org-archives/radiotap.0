From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: rfc: "canonical" radiotap parser
Date: Sat, 08 Dec 2007 11:39:57 +0100
Message-ID: <1197110397.4171.46.camel@johannes.berg>
References: <20071207045545.GO3568@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mhRsvgjiaQfs8NewnruW"
In-Reply-To: <20071207045545.GO3568-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org, Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-mhRsvgjiaQfs8NewnruW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Dave,

I just took a quick look at the parser, it looks pretty good. Andy has
done something similar and was willing to relicense it under BSD last I
asked him, his code is part of the Linux kernel right now:

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dblob=
;f=3Dnet/wireless/radiotap.c;hb=3DHEAD

It does a lot less than your parser since that already includes code to
print out the result which we obviously don't have in the kernel, but
other than that it's pretty similar conceptually. Just for reference.
Yours also has more detailed error reporting.

Small question on the code: why did you declare that radiotap_field is
aligned? It can potentially come from anywhere unaligned, no?

johannes

--=-mhRsvgjiaQfs8NewnruW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUAR1p0fKVg1VMiehFYAQK1ew//VuJ3GFDpFgzw7Z2mFegRygBHaZ1t4dXk
Of2fOabcEvbSm2xR7+0K/hnZ8gx1Tm8Xe/JoZujzREe4QajQj997vPmdfkVC72gv
VkN82msoBWTcyzvB0bQrnrueOBfFcxqJWmJpBewRJL4eFbfYPOsh/G/VBT2NZS9v
UVv8jLVU0BlQXJ+NVJwnRestRvEatn2MHjtb0n01NcTFiUtFX+XX18Nz2z5CJdlk
kVWsYURI/uyPzeqlp0cz7W6CIAQdXFxPOZ0rb3Balt6C3ccX4Zj6UCrx3vASlrjE
7IYj3g2wXvxmlyK2lGbCFOmOlcgzIDqZDE/cRNPzZjlLKmdGZbhJkVtZoJFSUJbn
jn9+/qq06GWatofeGWH/oVCAEd99eSQXisnJTXR4hEqg6cm0kUTVD6E0MVuW6LX4
2QhQb6PHPPm2T/PCDXp9mcI862nb8mhX/gC8o+SU85e3+eVup+JOM6NVeA4UnebZ
aGNQXDD4guqdHBk92cgUkkj37ID5lpSsygWYH3R1VYFhxrpfMSFlQbQOTvqALxGA
DF6NZ5lDZ+73THpopXc21ND5kj6yRmlc5lWRPuX0zlkc16crxF7CbCgaf3r6Dz2T
Ce3yRU+EcYDCIp+vcJelosu4etKiArtMCxHtnkSPTdeb2CdOr0RrTazaN26TXWAM
yYcj9ilGhIo=
=M4fo
-----END PGP SIGNATURE-----

--=-mhRsvgjiaQfs8NewnruW--
