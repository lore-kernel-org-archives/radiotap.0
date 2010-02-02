From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Tue, 02 Feb 2010 19:20:37 +0100
Message-ID: <1265134837.29119.76.camel@johannes.local>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <loom.20100202T174119-204@post.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-UVQmKVaxGykaEQxZ8xGh"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <loom.20100202T174119-204-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--=-UVQmKVaxGykaEQxZ8xGh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-02 at 17:36 +0000, Bill Stafford wrote:

> Omitting the Rate field seems like the most logical, but does not
> help out legacy parsers.

I'm not sure I'm entirely convinced we should try to define this, some
implementations might not want to have a rate table for MCS rates, for
example.

> But on the upside, it is helpful for wireshark
> filters like "radiotap.datarate < 48" when you are trying to see
> any traffic that falls below 24 Mbps for example.

That would exclude any packets w/o the rate field as well, because of
the way filters work when fields are not present.

johannes

--=-UVQmKVaxGykaEQxZ8xGh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABAgAGBQJLaGzuAAoJEODzc/N7+QmagOUP/1MVGCA5QAzhU4H1tr68y0fX
e5Z8K9EhrSsYUBVIEl6hm01KWhxH7RVZPnJez7zUptDc9DgIbGhZTRkGvuPDQSCx
RmG15IHWU0SfSYAK89d7Qiz4j43Z4o2RGVM/tbHtQmZJLUtIck0PAv4cVEvLJUDy
BCT3B1rwg6co1C9nZhV+gktTXLGD/dBcU3vw2ST66eIh/TEGd6Z21vFhIU0v2oxt
gqYmOxz39YO0m/H+skkLR4w+85Iwaz4qi/xIqBlMf6DwDAbIQuVEG6zFZf1jdk0I
Lk+AEGaCL1QjzQTJtlozX+WrFnrVOc8f8ontNj44cqY6X+PuWx+5xdO3oXQo1Mxo
mzINKliYSMEHFTUeUrNLmFsV4s8OonWsu2rmjFRbykY/2FK9GSYu9or1UbjkHBFb
OWEAmxurBdq6ZIaj764H0PuwqBWpXZkYwIZH0XMyAfBPZWz+IEpgXka1YnSsL+nm
usm+tBf+btxSfG+IUAfmNwGD8hpJF0Qg0V4+qYmMOrFCChpa4rA/2A08j2YfJYSR
ZshuLmXVTWaw54valsYjKcg0cJO6qEEqdexEUBQwRap/YAKGitWtcFN4XrsEAjq0
0u9Np0mVe/Nxe42pc/AQ5d7hX29Y+WgNyWYAUDuAIBdObXBDEOSgyMoaQHVdw7jV
0kvKH+CiWoS7NyvedYN/
=e1+Y
-----END PGP SIGNATURE-----

--=-UVQmKVaxGykaEQxZ8xGh--
