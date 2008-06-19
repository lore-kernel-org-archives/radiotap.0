From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 21:10:33 +0200
Message-ID: <1213902633.8967.84.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
	 <20080619185646.GA17738@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-IocJzWMUi5c6T6P3T6Oi"
In-Reply-To: <20080619185646.GA17738-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-IocJzWMUi5c6T6P3T6Oi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 13:56 -0500, David Young wrote:

> I favor these assignments:
>=20
> 14 /RX flags
> 15 /TX flags
> 16 /RTS retries
> 17 /data retries
> 18 /XChannel=20

That'd be great to me. Want me to declare them that on the wiki, move
them over to the defined-fields and add the other ones as "suggested
fields" without assigned numbers?

> I think that what you mean is to lead a discussion of fields 14 and
> beyond?  I reckon that no fewer than 4 persons or organizations have
> "taken over" maintainership of the standard by now, and that is how we go=
t
> into the current mess, with the same bits used for different purposes. :-=
)
>=20
> I initiated the mailing list so that there is one place to propose new
> fields for discussion and adoption by the community of radiotap users.
> It's not here so that anybody, least of all you and I, can tell everybody
> else what the fields are.

Yeah, I know, it's a mess and will always be unless we discuss things
here and on the wiki.

> I don't think that reaching agreement on fields 14 and greater is
> necessarily so hard.  Here are three reasons why.
>=20
> First, Guy Harris invited a lot of people to this discussion list who
> seemed to have a stake in radiotap, and some of them did not show up.
> As I said before, we do not have to act as advocates for people who don't
> show up.  If the person who uses bit 14 for the flavor of packets will
> not stand up for it here, then there is no use wringing our hands over
> the conflicting assignment.
>=20
> Agreement is in everybody's interest.  Disagreement is not.
>=20
> This is not the IETF, but I think that "rough consensus and running
> code" is a perfectly fine way to decide what fields we adopt, and there
> is neither a consensus nor running code for some fields.  I think that
> the lack of code makes the current "conflicts" easy to resolve: just how
> much pain can we cause by assigning field 15 to Rx flags if some obscure
> driver emits field 15 equal to a packet's smell, but neither WireShark
> nor TCPDump interprets it at all?

True.

Problem is, wireshark actually takes bit 14 to mean "FCS in header".
Easily changed though if Gerald is willing to take such a patch, I can
cook up a patch to make it parse the fields above.

johannes

--=-IocJzWMUi5c6T6P3T6Oi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWq8mAAoJEKVg1VMiehFYH8oP/iTY9MWWM0hpalrIIwztaCJU
8bDfIcJe4VNKS5JsrjX0AaV7Pmm7RJHETNp93S3bIDwXpOkOHzUGhm5bD1Jn5qqi
K31aTlMhOACpdkgSBugpn7n9loEyiLe1X2HxU1rzyv2KrFHvlRQymaQUsgFXB8mR
g5h8D7TdcUbhTY6EKU9I2fboDn0MPTkMvqf43PLrpfHqPi7YJBH+e5v1MWPJRWxR
y4/5n2D7fyOqK+DHOeVgMkWZ1wx0/1NOaHv2Hh2ozBxPCS5FAy7w6BtqfMs/6Jy0
8fK9h/llHR4M9KVKNGYeZDsF3Ib0N2PU60dU2Vpht1Rpn9c9R0e9np5aanIGg6tf
+AJ+Tnix9RHSQyQqcjssAkYSEEGyN5ZLgxNJ6kb1nRaLABr40pTd/fs1q7/8wP0j
HcZ5HWkDZA9i14IuzepBQT4JMyd9oYxbqBj0PnP3U5V+eWzla29L/+IUNd7A/wqf
j4RpkmSR4ZlNBQrV7YvDA+rIjWe4D8jxejTsNaSHQ35H82ccrEnloAzyEbD3L8I3
qQcSw4++FImcfbCSrps03j2ekeeOvSCT/TQIUcawfAP+V5QVLnsdvxbJARq8hIFF
1oMX2vtDVoUkHrvtPDifgC6RKbWfln+MqX1g2dcYmi96EVPfc6PcDmPaWDUw7Y/j
Y0bOXbn/boiYT9ZEJtsJ
=4w+D
-----END PGP SIGNATURE-----

--=-IocJzWMUi5c6T6P3T6Oi--
