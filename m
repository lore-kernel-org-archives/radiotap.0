From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 01 Dec 2009 18:03:38 +0100
Message-ID: <1259687018.32171.96.camel@johannes.local>
References: <1259258152.32372.90.camel@johannes.local>
	 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
	 <1259659011.32171.45.camel@johannes.local>
	 <43e72e890912010843y208201aawb2ad95cbec98c814@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-xiDPmKBBSK8Kz9PyQJ9I"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <43e72e890912010843y208201aawb2ad95cbec98c814-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-xiDPmKBBSK8Kz9PyQJ9I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2009-12-01 at 08:43 -0800, Luis R. Rodriguez wrote:

> Wanted to clarify, on the vendor it_present bitmap, does it always
> have to also respect the bit for vendor extension bit 30? The current
> proposal seems to have language which would indicates so:
>=20
> "This field is reserved in all namespaces and every it_present word,
> the standard radiotap namespace as well as all vendor namespaces. "

Yes, we have already reserved bit 31 in all it_present words, and now we
also reserve bits 29 and 30, so that vendor extensions can only use
numbers 0-28, 32-60, 64-92, ...

> If so what is the point of the reset bit? What I mean is that if we
> give radiotap its own OUI technically we could just reset ourselves to
> the radiotap namespace by specifying the radiotap OUI with what I'd
> think would be optional radiotap subnamespace material (length could
> be 0 I take it).

Well I personally would rather reserve a bit than try to come up with a
radiotap OUI (how would it get that?) and then special-casing the length
field etc. That just means _more_ special cases in the parser, rather
than less.

johannes

--=-xiDPmKBBSK8Kz9PyQJ9I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLFUxnAAoJEODzc/N7+QmaySsP/1qqsSltADblPb+uUdTC2wjW
nYfDynO8BjVmlD4Cf/Fsz3ZcyWMtZq7b/kDIxaY7eTfDApi3Bstgg5mq9TAWwF8Y
7zpyk+2TvseVfx3bRQYnVQpT4yeQYWl6HJ7bLzZSjj4vWGZUTPn+luPkdv0Abqg9
6qdNXBVDlXOtY07hAXTvKNahlXYLs36jKeJUySnMfGLKxOpDbEIzWzM71hTcRjM7
L9Sk1KSCjf/evsab/x1Hri4OUN6ELtXkmwTysIYXpg3fiL658iB2sC+AbX7tz9ow
dqQuEl3M6RV1J/vuIwuWW+7VrOnYAr6l6qnmKGklvhHCfdwtph1DHAoYv3+JTLR2
oHSBb9AucvshmR2rmcof0CvqSZukS3OwfL5zadG2iAE2hJvXhes3XtB6npH9YNCT
trcfuCYMo3yPsQXTn+MH4ZuXamCByoDT8bqr1u2jPr5GrtRHNwIWrnaQCBFtyaMw
WaKpsirZq/eUogtCe/i9d5wm06GLM4D1ichKcDNm0BAi8HLkAI/U00WZsCK6Fn8m
fPoZrWoZ7/mAdFsx5y0XGtCg80NEYc4G3Fp3wiAwBTdoJ4Ji9CnYNQWN/pmdTz/B
4NxZjS3w+1YrFkOmiZJUKm5aGwMPXRrOYVYg3yHR4XbtvKiIk7RJNeuLOqVZ/CC9
Mlg6CgGN1Y1JNRJgXKYY
=/SrH
-----END PGP SIGNATURE-----

--=-xiDPmKBBSK8Kz9PyQJ9I--
