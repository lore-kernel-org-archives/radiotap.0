From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Radiotap header for S1G captures and associated changes and other definitions
Date: Fri, 1 Mar 2019 17:59:58 -0800
Message-ID: <CACyXjPztSKzyZvJ_AmAD89rm_9dau4J5C7iHt+wkW9P6jLOvew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000000711b3058312e386"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, "Aaron J. Lee" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tasheng Lin <tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>
List-Id: radiotap@radiotap.org

--0000000000000711b3058312e386
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

This is a second attempt at a RADIOTAP header for S1G captures.

Aaron Lee did the work in creating these definitions. I simply transcribed =
them.

The attached patch defines changes to the Channel field, 0-length-MPDU
field and a new S1G field.

There is also and associated definition for S1G NPD frames, which are
40-bit non-MAC frames transmitted by S1G STAs. I have included the
definition of those in this email, and they are essentially from
802.11ah-2016 with a little bit of helpful framing.

1. Channel field:

3 new values for Mask: 0x0002 for 700 MHz, 0x0004 for 800 MHz and
0x0008 for 900 MHz spectrum channels respectively.

2. 0-length MPDU field:

1 new value: 0x02 in the type value: 2 indicates that an S1G NDP
40-bit frame follows.

Note, this seems weird. Maybe the name of the field needs changing to
non-MAC frame or something.

3. The new S1G frame.

It consists of three 16-bit fields:

U16 known, U16 data1, U16 data2

Known:
0x0001 S1G PPDU format known
0x0002 Response indication known
0x0004 Guard Interval known
0x0008 NSS known
0x0010 Bandwidth known
0x0020 MCS Known
0x0040 Color known
0xFF80 Reserved

Data1:
0x0003: S1G PPDU Format: 0=3DS1G_1M, 1=3DS1G_SHORT, 2=3DS1G_LONG
0x000C: Response indication: 0=3DNO_RESPONSE, 1=3DNDP_RESPONSE,
2=3DNORMAL_RESPONSE, 3=3DLONG_RESPPNSE
0x0010: Reserved
0x0020: Guard interval: 0=3DLong GI, 1=3DShort GI
0x00C0: Number spatial streams: 0=3D1 Spatial stream, 1=3D2, .. 3=3D4 Spati=
al streams
0x0F00: Bandwidth: 0=3D1MHz, 1=3D2MHz, 2=3D4MHz, 3=3D8MHz, 4=3D16MHz, 5-15 =
reserved
0xF000:  MCS (MCS rate index, 0-10, 11-15 reserved)

Data2:
0x000F: Color: 0-7
0xFFF0: Reserved

The S1G NPD format is essentially from section 9.9 of 802.11ah-2016
with some additional syntactic sugar:

It is a 40-bit field.

The first 8 bits distinguishes between Management and Control frames
using the values 0x0F (management) and 0x20 (control).

The last two bits indicates the bandwidth, between 1MHz and 2MHz,

In between, a 1MHz NDP CMAC frame contains 26 used bits and 13 unused
bits. The used bits are defined in section 9.9 of 802.11ah-2016. A
1MHz NDP CMAC frame contains 37 used bits and one unused bit. Again,
the used bits are defined in 802.11ah-2016.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

--0000000000000711b3058312e386
Content-Type: application/octet-stream;
	name="0001-Add-an-S1G-field-and-modify-the-0-length-PSDU-defini.patch"
Content-Disposition: attachment;
	filename="0001-Add-an-S1G-field-and-modify-the-0-length-PSDU-defini.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jsqu1zti0>
X-Attachment-Id: f_jsqu1zti0

RnJvbSBlZjk5MjEzYzcyMzVkNGFmZTAyODMzMWNkMDJiNTJjZGI2YjdiODJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNoYXJkIFNoYXJwZSA8cnNoYXJwZUBsb2NhbGhvc3QubG9j
YWxkb21haW4+CkRhdGU6IFRodSwgMzEgSmFuIDIwMTkgMTU6NDc6NTAgLTA4MDAKU3ViamVjdDog
W1BBVENIXSBBZGQgYW4gUzFHIGZpZWxkIGFuZCBtb2RpZnkgdGhlIDAtbGVuZ3RoIFBTRFUgZGVm
aW5pdGlvbiBmb3IKIFMxRyBORFAgaW5mbyBhcyB3ZWxsIGFzIGFkZCBzb21lIENoYW5uZWwgdmFs
dWVzLgoKVGhlIGF1dGhvciBpcyBBYXJvbiBMZWUuIFRyYW5zY3JpYmVkIGJ5IFJpY2hhcmQgU2hh
cnBlLgpTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFNoYXJwZSA8cmVhbHJpY2hhcmRzaGFycGVAZ21h
aWwuY29tPgotLS0KIGZpZWxkcy8wLWxlbmd0aC1QU0RVLm1kIHwgIDQgKysrLQogZmllbGRzL0No
YW5uZWwubWQgICAgICAgfCAgMyArKysKIGZpZWxkcy9TMUcubWQgICAgICAgICAgIHwgNDYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZmllbGRzL3N1Z2dl
c3RlZC5tZCAgICAgfCAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBmaWVsZHMvUzFHLm1kCgpkaWZmIC0tZ2l0
IGEvZmllbGRzLzAtbGVuZ3RoLVBTRFUubWQgYi9maWVsZHMvMC1sZW5ndGgtUFNEVS5tZAppbmRl
eCAzMDdjZWUwLi40YWY1NTY0IDEwMDY0NAotLS0gYS9maWVsZHMvMC1sZW5ndGgtUFNEVS5tZAor
KysgYi9maWVsZHMvMC1sZW5ndGgtUFNEVS5tZApAQCAtMTYsMTEgKzE2LDEzIEBAIFVuaXQocykK
IAogVGhlIHByZXNlbmNlIG9mIHRoaXMgZmllbGQgaW5kaWNhdGVzIHRoYXQgdGhlcmUgd2FzIG5v
IFBTRFUgaW4gb3IKIGNhcHR1cmVkIGZvciB0aGlzIFBQRFUsIG9ubHkgdGhlIFBIWSBkYXRhIGlz
IHZhbGlkIGFuZCB0aGUgcmFkaW90YXAKLWhlYWRlciBpcyBub3QgZm9sbG93ZWQgYnkgYW4gODAy
LjExIGhlYWRlci4KK2hlYWRlciBpcyBub3QgZm9sbG93ZWQgYnkgYW4gODAyLjExIGhlYWRlciwg
aG93ZXZlciwgb3RoZXIgdHlwZXMgb2YgZnJhbWVzCittYXkgZm9sbG93LCBsaWtlIGFuIFMxRyBO
RFAgZnJhbWUsIHdoaWNoIGlzIG9mIGZpeGVkIGxlbmd0aC4KIAogVGhlIHR5cGUgZmllbGQgaW5k
aWNhdGVzIHRoZSB0eXBlIG9mIFBQRFUuCiAKIHwgKip0eXBlIHZhbHVlKiogfCAqKm1lYW5pbmcq
KiB8CiB8IDAgICAgICAgICAgICAgIHwgc291bmRpbmcgUFBEVSB8CiB8IDEgICAgICAgICAgICAg
IHwgZGF0YSBub3QgY2FwdHVyZWQgKGUuZy4gbXVsdGktdXNlciBQUERVKSB8Cit8IDIgICAgICAg
ICAgICAgIHwgUzFHIE5EUCBDTUFDIGZyYW1lIC0gYSA0MC1iaXQgUzFHIE5EUCBDTUFDIGZyYW1l
IGZvbGxvd3MgfAogfCAweGZmICAgICAgICAgICB8IHZlbmRvci1zcGVjaWZpYyB8CmRpZmYgLS1n
aXQgYS9maWVsZHMvQ2hhbm5lbC5tZCBiL2ZpZWxkcy9DaGFubmVsLm1kCmluZGV4IDc4NGM1YzQu
LjU3NDc4NjIgMTAwNjQ0Ci0tLSBhL2ZpZWxkcy9DaGFubmVsLm1kCisrKyBiL2ZpZWxkcy9DaGFu
bmVsLm1kCkBAIC0yMSw2ICsyMSw5IEBAIEN1cnJlbnRseSwgdGhlIGZvbGxvd2luZyBmbGFncyBh
cmUgZGVmaW5lZDoKIAogfCAqKk1hc2sqKiB8ICoqTWVhbmluZyoqIHwKIHwgMHgwMDEwIHwgVHVy
Ym8gQ2hhbm5lbCB8Cit8IDB4MDAwMiB8IFMxRyA3MDBNSHogc3BlY3RydW0gY2hhbm5lbCB8Cit8
IDB4MDAwNCB8IFMxRyA4MDBNSHogc3BlY3RydW0gY2hhbm5lbCB8Cit8IDB4MDAwOCB8IFMxRyA5
MDBNSHogc3BlY3RydW0gY2hhbm5lbCB8CiB8IDB4MDAyMCB8IENDSyBjaGFubmVsIHwKIHwgMHgw
MDQwIHwgT0ZETSBjaGFubmVsIHwKIHwgMHgwMDgwIHwgMiBHSHogc3BlY3RydW0gY2hhbm5lbCB8
CmRpZmYgLS1naXQgYS9maWVsZHMvUzFHLm1kIGIvZmllbGRzL1MxRy5tZApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwLi44ZDMyNWNmCi0tLSAvZGV2L251bGwKKysrIGIvZmllbGRz
L1MxRy5tZApAQCAtMCwwICsxLDQ2IEBACistLS0KK3RpdGxlOiBTMUcKK2NhdGVnb3JpZXM6IFtz
dWdnZXN0ZWRdCistLS0KK0JpdCBOdW1iZXIKKzogMTYKKworU3RydWN0dXJlCis6IHUxNiBrbm93
biwgdTE2IGRhdGExLCB1MTYgZGF0YTIKKworUmVxdWlyZWQgQWxpZ25tZW50Cis6IDIKKworVW5p
dChzKQorOiBub25lCisKK1RoZSBwcmVzZW5jZSBvZiB0aGlzIGZpZWxkIGluZGljYXRlcyB0aGUg
ZnJhbWUgd2FzIGNhcHR1cmUgdXNpbmcgYW4gUzFHIHBoeS4KKworVGhpcyBmaWVsZCBjb250YWlu
cyBkYXRhIHRvIGFsbG93IGNvcnJlY3QgaGFuZGxpbmcgYnkgcHJvZ3JhbXMgbGlrZQorV2lyZXNo
YXJrIGV0Yy4KKworIyMga25vd24KKworfCAqKmAweDAwMDFgKiogfCBTMUcgUFBEVSBGb3JtYXQg
a25vd24gfAorfCAqKmAweDAwMDJgKiogfCBSZXNwb25zZSBpbmRpY2F0aW9uIGtub3duIHwKK3wg
KipgMHgwMDA0YCoqIHwgR3VhcmQgaW50ZXJ2YWwga25vd24gfAorfCAqKmAweDAwMDhgKiogfCBO
U1Mga25vd24gfCAKK3wgKipgMHgwMDEwYCoqIHwgQmFuZHdpZHRoIGtub3duIHwKK3wgKipgMHgw
MDIwYCoqIHwgTUNTIGtub3duIHwKK3wgKipgMHgwMDQwYCoqIHwgQ29sb3Iga25vd24gfAorfCAq
KmAweEZGODBgKiogfCBSZXNlcnZlZCB8CisKKyMjIGRhdGExCisKK3wgKipgMHgwMDAzYCoqIHwg
UzFHIFBQRFUgRm9ybWF0OiAwPVMxR18xTSwgMT1TMUdfU0hPUlQsIDI9UzFHX0xPTkcgfAorfCAq
KmAweDAwMENgKiogfCBSZXNwb25zZSBpbmRpY2F0aW9uOiAwPU5PX1JFU1BPTlNFLCAxPU5EUF9S
RVNQT05TRSwgMj1OT1JNQUxfUkVTUE9OU0UsIDM9TE9OR19SRVNQUE5TRSB8Cit8ICoqYDB4MDAx
MGAqKiB8IFJlc2VydmVkIHwKK3wgKipgMHgwMDIwYCoqIHwgR3VhcmQgaW50ZXJ2YWw6IDA9TG9u
ZyBHSSwgMT1TaG9ydCBHSSB8Cit8ICoqYDB4MDBDMGAqKiB8IE51bWJlciBzcGF0aWFsIHN0cmVh
bXM6IDA9MSBTcGF0aWFsIHN0cmVhbSwgMT0yLCAuLiAzPTQgU3BhdGlhbCBzdHJlYW1zIHwKK3wg
KipgMHgwRjAwYCoqIHwgQmFuZHdpZHRoOiAwPTFNSHosIDE9Mk1IeiwgMj00TUh6LCAzPThNSHos
IDQ9MTZNSHosIDUtMTUgcmVzZXJ2ZWQgfAorfCAqKmAweEYwMDBgKiogfCBNQ1MgKE1DUyByYXRl
IGluZGV4LCAwLTEwLCAxMS0xNSByZXNlcnZlZCkgfAorCisjIyBkYXRhMgorCit8ICoqYDB4MDAw
RmAqKiB8IENvbG9yOiAwLTcgfAorfCAqKmAweEZGRjBgKiogfCBSZXNlcnZlZCB8CmRpZmYgLS1n
aXQgYS9maWVsZHMvc3VnZ2VzdGVkLm1kIGIvZmllbGRzL3N1Z2dlc3RlZC5tZAppbmRleCAzMjU3
N2Q5Li5lYzU5OGJiIDEwMDY0NAotLS0gYS9maWVsZHMvc3VnZ2VzdGVkLm1kCisrKyBiL2ZpZWxk
cy9zdWdnZXN0ZWQubWQKQEAgLTE4LDMgKzE4LDQgQEAgVGhpcyB0YWJsZSBsaXN0cyB0aGUgZmll
bGRzIHNvbWUgT1NlcyBhc3NpZ25lZCBieSBiaXQgbnVtYmVyOgogfCAxNiB8IFtSVFMgcmV0cmll
c10oL2ZpZWxkcy9SVFMgcmV0cmllcyksIFtSU1NJXSgvZmllbGRzL1JTU0kpIHwKIHwgMTcgfCBb
ZGF0YSByZXRyaWVzXSgvZmllbGRzL2RhdGEgcmV0cmllcykgfAogfCAxOCB8IFtYQ2hhbm5lbF0o
L2ZpZWxkcy9YQ2hhbm5lbCkgfAorfCAyOCB8IFtTMUddKC9maWVsZHMvUzFHKSB8Ci0tIAoxLjgu
My4xCgo=
--0000000000000711b3058312e386--
