From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: rfc: "canonical" radiotap parser
Date: Tue, 11 Dec 2007 14:32:52 +0100
Message-ID: <1197379972.4037.11.camel@johannes.berg>
References: <20071207045545.GO3568@che.ojctech.com>
	 <1197110397.4171.46.camel@johannes.berg>
	 <20071208210645.GX3568@che.ojctech.com>
	 <1197290250.6035.69.camel@johannes.berg>
	 <20071210191815.GE3568@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-rHhQo75KESjyZZ4T04PP"
In-Reply-To: <20071210191815.GE3568-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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
Cc: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

--=-rHhQo75KESjyZZ4T04PP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> The caller of radiotap_parse_first() must supply a 64-bit aligned
> ieee80211_radiotap_header in the first argument.  If the header is not
> so aligned, then the parse fails right away with RADIOTAP_ERROR_ALIGNMENT=
.

Ah. I missed that, sorry.

johannes

--=-rHhQo75KESjyZZ4T04PP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUAR16Rg6Vg1VMiehFYAQLZhA//cC4TnXmMX8LCn/MhKmL770Gg3Q79Ak/7
9kPcm/K0bflv3Yn0MptnlL8pP5fqPtkOGYn6MHrgnLzmYD/jOk4rPFzJ8lpI7QOq
6ZRaBF0AGjks/Omd2A3JnLEjpfwiTHjPqth/WbbnRBpFJHs2FUafpfBkqpayXAa7
InRC93RmIjoEYMwYA2TiQrbNzDc0H5gOebadfI5yEGzkU93uoeSFZagycnxX7an+
G35ohuxR00SuEWAGoIirPVsikGVgxlAWt+A64OtC8FzMNRvCZJBvw+zJlWcP+6uB
WePqAg3cJwhArvLcPu8T/BKZpPimntqgZu8w4WX+AOo/A8zft42kbZDcf5cPpgkM
fbS/rhfvksD16aGYvooWdCqBuO6zJ9Fm7wsTNg4XHqbXQG2DGqq3IFF3tL975AG3
iYvasRyMCUZGfEy31kD6s14WmxZdXu1iZ/6CKXQ6zFtHVQlT2whT4P6Rlh+9fM2Y
Esv/hdRPk2NtzGFBGy+8WZcPDvRvM0i02ZiwIObEbcFkBf0kn5WrKSPlcWQlA3Z9
sP+ConUrV9ahnj67x+dW3CH95obuQ6GOt0VMB4p9L/eUw2XNBwVPj3hJsSQrGpk7
beIdZyY+kgZZ9yGED2BJPT68hWQXf1fIpadNx07pPE0Vke200qxhvhsA+uGGwYaY
myDEzKUr+mU=
=iRMC
-----END PGP SIGNATURE-----

--=-rHhQo75KESjyZZ4T04PP--
