From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 19:59:47 +0200
Message-ID: <1213898387.8967.54.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-NjzqBCyrNcTl7tGR055N"
In-Reply-To: <1213897499.8967.46.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-NjzqBCyrNcTl7tGR055N
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 19:44 +0200, Johannes Berg wrote:
> Ok, I tried collecting all the information, and here's what I found so
> far:
>=20
> http://www.radiotap.org/suggested-fields
>=20
> Bits 14, 15 and 16 are defined twice.

I just noticed that at least wireshark also defines two non-standard
bits for the 'flags' field (field bit 1):

=EF=BB=BF#define IEEE80211_RADIOTAP_F_BADFCS     0x40    /* does not pass F=
CS check */
#define IEEE80211_RADIOTAP_F_SHORTGI    0x80    /* HT short GI */


Also, it defines that if the rate (field bit 2) is >=3D 0x80 (or rather,
has bit 0x80 set) then the lower 4 bits are used to define some HT rate?

Where the hell did that come from?

Crap. I'm starting to consider just cycling the version number for linux
(to 42!) and you guys can play catch-up for each OS by itself rather
than us trying to figure out wtf. we should do.

:(

johannes

--=-NjzqBCyrNcTl7tGR055N
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWp6QAAoJEKVg1VMiehFYluIP/2VTme64ow9M+b32WWnlAEXz
bVSKLU8XjwcgStqQqqfE4DiQEvxo22CIGcYMeG9U1yIPEi+edxCZIUbBb94L5itH
XZFNm3HGmgoQ8q+tlcefzv3dqEZdo/DMXFzkvvIpeTEHqM+v9o9/cn7pzvvAbCr5
T/VMqjCgmywI/u7RC0vEpRyzSBaH/6HPHfJrhf1h3bvOP43pC7YxOXdLiW2AP7J6
5SXGPHZ6DCIN3W19yBMp5TyaS71ePz9Lzfiq9w/6ClActk5nps3D3ZU8904Y9j3d
I747LKI7hQmaoLIg6J5moWJwmzV0r0jBkpe37MEuBIjl5FIuPNqZF3aG9HwG0T2P
dc12aUG2Gmjo0z8iSDKPyMNikmJ6/A92NKo/CZf8lh7hz4A8XsRixr1+FO3C3yFg
cQzj2VwbhxK+8i9QI1cU/wXxYx96yXjHrwANWOH1jk9OZhqFeZvJLsI4hD4N1w0C
XPjYu6Yf1VTisiQxYOTPG2S9SyMO/Gxn31HLxASvP0PeY81zepYW6yGwEtFQ6RNd
LlU0gzONAu1p/P/WHTfIHse+aet/cGJNyhJ29wCaunJGPedovvenNUnNOuadTzD1
2F/YeyWRyqh0pTGS8/HBJU2TDGVybXgzEwVUxcuObquhxE6K2mPr/r/ws/LHXz9J
7BkRpxC6LRh68h8wpPUY
=ErlU
-----END PGP SIGNATURE-----

--=-NjzqBCyrNcTl7tGR055N--
