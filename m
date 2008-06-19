From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: outgoing interface field
Date: Thu, 19 Jun 2008 21:28:48 +0200
Message-ID: <1213903728.8967.92.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-SUBP4sweYpmk5M2kg+wV"
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Cc: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-SUBP4sweYpmk5M2kg+wV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

For our particular implementation of AP mode with hostapd in Linux, we
are using radiotap-injection interfaces to send management frames.

Now, 802.11w (encrypted management frames) requires that those frames
are encrypted, due to key management issues we need to do that in the
kernel. This means we can no longer simply inject the frames, we need to
know, in the kernel, which interface to search for the key, since
multiple virtual AP interfaces/BSSes may be configured on a single PHY.

This requires that we have a radiotap field indicating the outgoing
interface to use for such key lookups. Further uses would be to use, for
data frames, the fragmentation/RTS threshold from the given interface.

I don't, off-hand, see any other OS requiring this, so I'm shopping
around asking vendors if I can have part of their vendor OUI namespace
(one of the sub-namespaces) for Linux, but if anybody sees value in such
a field for other OSes we can also add it to the standard.

Thoughts?

johannes

--=-SUBP4sweYpmk5M2kg+wV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWrNsAAoJEKVg1VMiehFY43YQALQ9xu+065PIyISCeyfP+Tsp
L40KbAvxK3xpmuQJXw89qp8bDdlFaPUwetgeSz+AS608KRUYKhBui1hfW9iwRu8g
L5ZLGugPIPqKgPOCNrUi6nBtKhTwwVJlKL+X7wExLVh2Bpau0GvzlA4bYXmNnOTh
ZeH3fTxK6wLEdh6KjwhK1mUvlQfDY3EU+7hq3w7IxHM1FAmdw17q5SlzwCwiqeRJ
mD0rIS6eMqilHSoyHxIbbLsZWQKojx/RKo4tbOSlz6342PZ6yTDV325QQlh8LkEh
6Oc6Spnsso0LweXjo+YgC5ZLXeE3wSXqHMagAq8tmL3YuWisU3v9hme8tquPYNKn
Ki+I4f+Rsth825WxDvjrlc5wedt08Ej7B6K9LehEyy6Hdf5lTa/MiNJfquoHyEQn
TTbxEy+frpusX2JUg13wKZ8KE1IwlAgUscb74QFHTPtd0dHQbwsCpQZWGDTmI6IC
OoIW6OYkmaKNW153vrZiyflcbK9dKDFka6AgTFBf+MWQghx36ex5kfeOCjoR1ngZ
Y0CZc8MtbwxJUliDfM08EE4vNsUv/FwAcDCzI8KzFf2HSkPw4VMQq83O12jr8dq/
b1ia29boEFrbOP9e/no4JRn+BI6RyRa+IRPdEJu7A/PO3nz1bq0JLD85cY1Onxfw
IOKmliK0l/LIjAPc+k3v
=JZGJ
-----END PGP SIGNATURE-----

--=-SUBP4sweYpmk5M2kg+wV--
