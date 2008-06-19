From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 20:10:26 +0200
Message-ID: <1213899026.8967.56.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
	 <1189668582.6161.91.camel@johannes.berg>
	 <20071007235551.GN6429@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PGBlXqXoYd3W6kreMRKj"
In-Reply-To: <20071007235551.GN6429-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-PGBlXqXoYd3W6kreMRKj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> and there are NO interpreters in tcpdump or in wireshark for any field
> past 15.  Let's stick with v0 until somebody objects.

That's actually no longer true, wireshark interprets field 18 now :/

> I propose to add two new presence bits, 29 and 30.
[...]

I'm trying to capture this with examples here:
http://www.radiotap.org/Discussion/Vendor-Extensions

Look there in a bit.

johannes

--=-PGBlXqXoYd3W6kreMRKj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWqEOAAoJEKVg1VMiehFYAHMQAIbmjRtuf2o/gVX03PXU5NVo
d771aFGb+82gxGclkMC0QwmitdubdcwkBXPeARbLupTgJGZk6mIJ/V6V+A3xIE15
hEn58vxAbMXOOHSoBt+9uT+92u7SRqOEYXZhmDJ/2jjCF5DI9dvKP8tfJ7yhVo7C
faR5n78lZ0zzdY9GiwRTw7smaafp2rpoojNzoP362gBeSCI2rLpbC3D/6/jRtWFa
WduECbSt/HfQCUG+45AHAaNB6WIO8qxLahNSQQndzlqxDSTCVesG5hF4gn6fN2jp
wdXBRnw1PETEqIMUj3sYh2a4tRqFQucUKj9qR/kfuIekIUTrh/SaKEHctxGuXhQV
1goFB8csuTY9hym1CJomb0kW/43QPj6JWbHO7UERsfadYi7V1UO544JuF68ktmYK
PMDiZ6VJlg0MWb+5gT2xoxRKN1HcQXb0AI30uoT6GbZesZSdXgTzgXgLJ3oqFEG3
7fVX6OvQnEicfKtzDto5UPb3mAq3vT8koV3T8V4tek9EWI5ps+3gpngGkTXgkT3B
JnrVSNqQIpKZ2pcUMzPB1ZHUO4UFUNvkFsRB6SZpJMGkLWoSfg0POIwlLYdJNQt7
PP0HB2FeDi5ph6UkdHC9SYg1brOuto8YooOLE3uYfVJkGZ5692SymYLUv0W7qQw8
29a8uHUavtPdjRVjKtUh
=wPVD
-----END PGP SIGNATURE-----

--=-PGBlXqXoYd3W6kreMRKj--
