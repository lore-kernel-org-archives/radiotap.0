From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Adding "no-ack" flag to the radiotap flags
Date: Thu, 19 Jun 2008 21:21:31 +0200
Message-ID: <1213903291.8967.86.camel@johannes.berg>
References: <200803212132.55970.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-QmKWEzT/HkGDjrMmvNs9"
In-Reply-To: <200803212132.55970.mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Cc: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

--=-QmKWEzT/HkGDjrMmvNs9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> I suggest adding
> #define IEEE80211_RADIOTAP_F_NOACK	0x40
> so an application can define that it is not interested in
> an ACK for the frame and the card should not bother retrying until
> it received one.
> When this flag is not set, the standard rules apply.
>=20
> I don't see a use-case for overriding these rules to always
> _expect_ an ACK, so I think a one-bit flag is OK.

I'd add it to the TX flags instead, especially seeing that the bit 0x40
is already assigned there in some BSDs.

johannes

--=-QmKWEzT/HkGDjrMmvNs9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWrG3AAoJEKVg1VMiehFYmc0P/0jUH/2dPXFyTaQvvwVfAclW
FhD00uv1guSuzQ6pnQ/6GjXUQYQMLQRqxVSkQDmGqY4hPzQqPYvkxXiRpx78njZh
LXRGjnDmXv8llcrJABSL+8gztjDDaWSfKCisbGAcNPLYR45hhlNQ4q9c11/gkq0w
5DEpgQodWZSkZhT6OLwW3oMIPyPcG4VT4qTUeyXxJ41EE1ksSgW6jvUoDM5u7Vaa
0270qiQ4ewEwDVLhKboY2hCKaBQj4/E7GC+KQCfSUjiAgXiBZ8NR7tLtfviUp2uY
uxajlIGT8B2VGztSMh3kPXwE1U1ZM+vXw43yYSMrTm91SoL7JR38mskoTwL/AMEV
GPQSdQLhC8bNv8lLYkRwUKY9QG78iya1I89MhNsg11Or8vanMlC4UGzZF06emMPc
vJESib9Tvaplu0Db7duaF4p9nKDx30YwmAAPjzM1OymqnH0eGxuovGIPs2cX6BFl
s/38N7ztAYs+1yzVsyS4gFZyHagGNETwFCr5ut5Um2xt/VFSuFMqUqNP+LoKDt2W
OAurRb0xGwNtCa2YC/9eBF3ZB59N3acaKQN0S8cFLt3Sf/K0vTQyzrXJuGOF3Liu
8XYT2fDfbcIsktPJHTT25gAZGBYPN+Y0EWhczbuzfGRMhsHUfF7gXvjiXeBNeXqj
YnWSjC76wLg8mO5QFfmy
=G07H
-----END PGP SIGNATURE-----

--=-QmKWEzT/HkGDjrMmvNs9--
