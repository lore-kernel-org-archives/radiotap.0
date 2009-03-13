From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [UPDATE] RX flags
Date: Fri, 13 Mar 2009 12:43:30 +0100
Message-ID: <1236944610.5235.32.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-42fVuD7h9b5T1p8ikIoN"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-42fVuD7h9b5T1p8ikIoN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Since there were no objections, we have adopted the following radiotap
changes:

 1) Add the "bad FCS" flag to the flags field (field 1) with the bit
    number 6, i.e. mask 0x40. [1]
 2) Define the new RX flags field at field number 14, with the following
    definition:
     - field contents: a single 16-bit integer
     - field alignment: 2
     - define bit 0 (mask 0x0001) to be reserved (it was defined by some
       implementations as "bad FCS" which is in the flags field)
     - define bit 1 (mask 0x0002) of this field to mean "frame has bad
       PLCP"
     - all other bits (mask 0xfffc) shall be reserved for future
       assignment


I will take care to update the Linux implementation, any pointers on
where to send the wireshark patch would be appreciated.

johannes

--=-42fVuD7h9b5T1p8ikIoN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJJukbfAAoJEKVg1VMiehFYQb8QAJ3oV6mfu0hsNj8/Zs7+gbOl
XXaSegveUsJv3Qa4QJcc8MEoYcyD8tZRlJ/nDoYv++ZYrfO7b5KR60W1/RPERZYv
kt+ZuHnLGwH4BNDdqdTfaxrLpSjW9o4v37gDxNlGFb41NeZk80wW8MmYaz7g+pH3
Z0jnFqkRtsT9vnd4wLgTKVcUKIetDO9NS7GtWql/0Bg1PMXgZQumNeM32PWnfV92
HcEfTkzpbp5Mu+yNVEfTpvWOSRLhUHC2sCXXHti00pXdAmp3tuIXivqKaf2RMke8
IIu3loD67fFhMJP18hbvlfRhV7VaZru6Z4mko1WJeClsy2/ZIW7CqXT2VAOzvazX
AVp1nQds23Jto9RmwMhu76ipwIMlyGuekOrAkJbHwirdptdX/eFUXJOIyqd4zJGa
EEaVkg2bcv/jzeEjToIXnaXGuwVUksSYFsv2Cncphzmf4I4lKPk/PsUIhQ+81Atn
lfy7A7lzxcS3VhImBFcM/oDWrw5IQN8Lx2tDJG1OJagFbt18RvObYbkTZplziffV
wIOYy+bCYZ3vhz3ZoGc9VJf5iwJWUJNFtn3FmE1ybpwH9EGL6zy9K5o/nmKQ7H29
nGGNAam2EuJSzdZJOMegbn/08cU80Nkdy4ybEc8efwHqLA0SQLHrBmpSbGt2Tk9U
GaEqgeh7YwqHAF/agBJl
=E04l
-----END PGP SIGNATURE-----

--=-42fVuD7h9b5T1p8ikIoN--
