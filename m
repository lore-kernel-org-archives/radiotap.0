From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 22:06:53 +0200
Message-ID: <1213906013.8967.106.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
	 <20080619185646.GA17738@che.ojctech.com>
	 <1213902633.8967.84.camel@johannes.berg>
	 <20080619193958.GB17738@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-dEI3uA13p+bS9Y4tH2kJ"
In-Reply-To: <20080619193958.GB17738-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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
List-Id: radiotap@radiotap.org

--=-dEI3uA13p+bS9Y4tH2kJ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 14:39 -0500, David Young wrote:
> On Thu, Jun 19, 2008 at 09:10:33PM +0200, Johannes Berg wrote:
> > On Thu, 2008-06-19 at 13:56 -0500, David Young wrote:
> >=20
> > > I favor these assignments:
> > >=20
> > > 14 /RX flags
> > > 15 /TX flags
> > > 16 /RTS retries
> > > 17 /data retries
> > > 18 /XChannel=20
> >=20
> > That'd be great to me. Want me to declare them that on the wiki, move
> > them over to the defined-fields and add the other ones as "suggested
> > fields" without assigned numbers?
>=20
> Well, you and I agree, but let us give everyone else a chance. :-)

Heh yeah, sure.

> Let's do this:
>=20
> 1 define the alignment, width, interpretation of the fields (I believe
>   this is done, somewhere.)

http://www.radiotap.org/suggested-fields
click any of the links, there you have it.

I haven't decided yet whether radiotap.org should maintain a header
file. It would be nice for source-code interoperability, but in practice
the different OSes use different header files already...

> 2 produce implementations wireshark and/or tcpdump and for one or
>   more driver

Linux is actually shipping code now that will produce RX_FLAGS (in bit
14) with the IEEE80211_RADIOTAP_F_RX_BADFCS flag, but there's
IEEE80211_RADIOTAP_F_BADFCS in wireshark so maybe we should use that
instead.

> 3 post fields and code here, and on the wiki

I can do that.

> 4 leave 7 days for discussion (ordinarily, this should be longer)
> 5 if the proposal withstands discussion, re-post proposal in final form
> 6 adopt the proposal in 7 days if there are no further objections
>   (discussion is over, however, 7 days lets everyone verify that the
>   proposal and amendments, as discussed, have become the standard)

Sounds good. Should we document that process with a normal period of a
month before adoption after discussion/reposts?

johannes

--=-dEI3uA13p+bS9Y4tH2kJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWrxaAAoJEKVg1VMiehFYmCQP/3G8SfnHYGIzb6EIjcC2HQue
xG1jN4GRVwNEb0EicLivY/4g7iBjZsgdOZCy6yMfZSaUjxit2rmIuVPTDU6Fvk01
cwGZPp5Y60KtiDnHYXJz5LQrFfaIh85DJSrRPqgDwo5tQAujuTfhApq3EYZOkBh7
YCSxCIO8qdNtoqnJ8XYjqQv/c/aZfxbl36rTXxpGIUQcMhyuO2BLX1/NJk85UGfV
zRy4q9kZKZjIc2uqC5VA7vWGqNfSZ22MFgxt49+/6tF1rGWkWyT5OJC2/vRlJsp6
9VRMjSLO8pFGvLc7SoDfWxf+5XouwOl0ZVh3vj4edze0VHyaRpUtnBxHNK+JQIQl
K8KZmAn3W05L1iGZDLlifiYu84HLNbMu2N+pqamw+6NGIPAe3r7HO3m7TQAQuQkk
m9u6FE7jqNBOeABziUfUAs/EQHqmYmA1L+GNS2mCf4zM/jjtEdgKeHo/SE7W1VV7
+Z/WsbwcDYZwJugZKe8j/tUif0YlyAiPILCHbMIIQ6hwkvcgfY3npQyR9HSXXW4Z
8M32/6g6Bk+hLECaCz4Yl1H5SHLU+4bFSLtIRncMFyle9d+0+2/EczbC94BSbMa+
TmFqhJb++VAfZ0oMn0bI0r492aK8Zf0gZ1hWsb84oW/LXydsuiiemzQEDjV64Agc
yhQfkECL4BkrpEjU+Fwp
=DoJZ
-----END PGP SIGNATURE-----

--=-dEI3uA13p+bS9Y4tH2kJ--
