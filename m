From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: BPF code generation for radiotap
Date: Mon, 13 Aug 2007 08:34:45 +0200
Message-ID: <1186986885.27916.24.camel@johannes.berg>
References: <20070511231511.GB20770@che.ojctech.com>
	 <46450124.1010809@alum.mit.edu> <20070511235204.GC20770@che.ojctech.com>
	 <46451D83.2070003@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hoEWbYYs5hcq6HimE2BB"
In-Reply-To: <46451D83.2070003-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

--=-hoEWbYYs5hcq6HimE2BB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2007-05-11 at 18:50 -0700, Guy Harris wrote:

> I might have to work on the optimizer to handle code such as
>=20
> 	if (field XXX is present)
> 		add AAA to the offset into the packet;
> 	if (field YYY is present)
> 		add BBB to the offset into the packet;

I don't think that is completely correct, the radiotap header says that
fields are naturally aligned and this code doesn't handle that. In many
scenarios alignment will not be needed but I wouldn't want to rely on
that.

It'd have to look something like

if (field XXX is present)
	add A-1 to the offset
	mask offset with ~A
	/* do whatever with field XXX */
	add AAA to the offset into the packet
...
where A is the alignment of the field XXX.

This should be correct, but I can't seem to find an authoritative
statement on how exactly alignment is to be treated and whether it is
with respect to the beginning of the header (as it must be!)

Out of curiosity; what could be optimised with above code, and what does
that optimiser do?

johannes

--=-hoEWbYYs5hcq6HimE2BB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iD8DBQBGv/uF/ETPhpq3jKURAmTmAKCfJ8XYJlD9f3/dzEQArktZlqaftgCgshNF
kVj4QF9PjlcCoyUgXk1L26A=
=oRuE
-----END PGP SIGNATURE-----

--=-hoEWbYYs5hcq6HimE2BB--
