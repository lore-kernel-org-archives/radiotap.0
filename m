From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Wed, 12 Dec 2007 00:09:36 +0100
Message-ID: <1197414576.6558.52.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
	 <1189668582.6161.91.camel@johannes.berg>
	 <20071007235551.GN6429@che.ojctech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WjuCExwC37K2ShEKF6Ce"
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

--=-WjuCExwC37K2ShEKF6Ce
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

David,

> I propose to add two new presence bits, 29 and 30.  Let them both reset
> the bitmap index to 0.  That is, the bits in following next 32-bit
> presence word are interpreted as bits in 0..31, not n..31+n.  We must
> use both of these bits in conjunction with the extension bit, bit 31,
> or else they will have no effect.

The more I think about your proposal the more sense does it make :)

One thing occurred to me: this extension with bit 31 is interesting in
that it leads to holes in the numbering because number 63 can never be
assigned (it corresponds to 31 in the second bitmap). Similar things
will happen when 29/30 are reserved.

Since we haven't yet assigned anything above 23, maybe we should reserve
the flag bits 24..31 for global bits so future extensions like the
global bits 29/30 you defined could be done? As you certainly noticed
when defining the bits 29/30, this is perfectly compatible with current
parsers because they have to stop parsing at unknown bits anyway. This
would allow also allow us to declare that the bits in the second bitmap
start being numbered from 24 rather than 32 (because it doesn't matter
if existing parsers think it's an unknown bit 32 when it really is the
unknown bit 24). Of course the remaining 5 bits 24..28 would have to be
reserved and set zero, parsers would have to stop parsing when
encountering any of them set they cannot handle.

Basically this would lead to the following layout:

| n0..23 (24 bits) | g0..7 (8 bits) | n24..47 (24 bits) | g0..7 (8 bits) | =
...

rather than

| 0..28 (29 bits) | 29..31 (3 bits) | | 32..60 (29 bits) | 29..31 (3 bits) =
| ...

where n/g indicate that they're in the numbering/global space.

I'm only proposing to do the split as 24/8 because it seems more natural
to have a whole byte reserved in the upper part although it is likely
we'll never need the extra five global bits.

johannes

--=-WjuCExwC37K2ShEKF6Ce
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIVAwUAR18YrqVg1VMiehFYAQLWRg//RtrcB6eK7GPaREweRALYCZ+/C8yBJRMb
HWMNnO5IUlsh1sBLExyOzAVzP5Y54U/mEvIqsrkR4Jom2b3KtaaCIRgjdVj7wZX/
6+3u9U1s2EAwwfmU7sjq9okJ6zihlOYZCyj09bcfqXI1QsEGlhGK3mRv9+7swXOQ
d1O9l54OgPbqagxhd+Z2oDxF69L0VkB0rjQBT19pytaFZ1nvlyDCx7LMd5BdU5QT
HJZxTwkHqD8lPSCDGegxeA2XRYaX8tTDFFJxTY3ZochoUk9GMI8AjwmNvLF1eawF
KLSdjRKjMt+/OgFK5M+12EYmfEFSrrtqiAi0rDb4rQC64ng/q8oofa61GNWcjUrO
6QqVdqjwqZO6MzSNS7GNBkVTDqcQnFwIBevMWx9MNKbbUl3+LD4/s4xeVsvH/gSR
QMug7QM1xUOAsKcDADqgO2W0eEu3WQwqTcPa25sbGTkmyUqZc/rap5cSV7s7RJRS
3MhmrU/oarGIUdJgyBjz83b4R8arV5n32h+6I9xFJlPPgr0fhX5yDEas9c1U3o+4
4Jh4xhUnS0FZ4Nz9CZWw0079xCqdNxiZ2QP1qTEesrqDii6bivCsGztvUpQXkexp
/6lZf+5wHNDnJ+gv/gZ6TxROlcgsf2WK1t46ZYukpb9HGmdwHekOOYbyuvh+igcJ
RmFtp39S0GA=
=KEOo
-----END PGP SIGNATURE-----

--=-WjuCExwC37K2ShEKF6Ce--
