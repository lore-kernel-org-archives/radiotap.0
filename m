From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Proposal for an S1G header for radiotap
Date: Thu, 31 Jan 2019 16:02:21 -0800
Message-ID: <CACyXjPwCydx6fumWdXdLvg-StsRcALBLc5+4fCsGDaC7tcZXCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000001c17d20580c9dcb7"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
Cc: "Aaron J. Lee" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org
List-Id: radiotap@radiotap.org

--0000000000001c17d20580c9dcb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

Attached is a git format-patch patch that contains a proposal for an S1G he=
ader.

This proposal was created by Aaron Lee and underwent a couple of
rounds of modifications among the WFA folks.

All I have done here is to transcribe it to the format required by the
documentation web site. Hopefully I have not changed any intent.

Below is some feedback from Johannes about the proposal so he does not
have to retype it along with some comments from me.

We should try to get this finalized as quickly as possible as quite a
bit of work is going on in this area.

Those who are interested in this topic should join the mailing list
because people may forget to reply-all!

> Channel field: This is a really old field, almost certainly somebody
> somewhere uses those bits they suggest already ... but I guess if
> wireshark doesn't parse them then that doesn't really matter, so I guess
> that'd be OK. I'd probably suggest using higher bits anyway, which are
> less likely to already be used.
>
> HALOW field: Mostly looks fine.
>
> I think the NDP indication (0x10 in data1) should probably be moved out
> into the 0-length psdu field we already have, so we don't need to handle
> special cases for it this in wireshark and other dissectors. The known
> bit for that (in known field) makes no sense anyway because clearly you
> have to know whether a packet was NDP or not. Unless I'm completely
> misunderstanding the meaning of this field.

The issue may be that an NDP actually carries non-MAC data. 25 bits in
the case of 1MHz NDPs and 37 bits in the case of 2MHz NDPs. If we can
shoehorn them into the 0-length-PSDU maybe we should.

> The "NSS" field is only 2 bits and can only capture values 0-3, not 1-4,
> so they probably mean the value inside is NSS-1, or NSS=3D=3Dfield+1. Fin=
e,
> but needs clarification.

Yeah. I unilaterally clarified that, so Aaron will have to look at it
and correct me if I am wrong.

> Aggregation bit isn't clear - don't they do things similarly to normal
> HT/VHT/HE A-MPDU and could re-use that field for aggregation? That can
> (optionally) also hold whether it was first/last and a cookie which
> frames belong together in an aggregation, so that's useful to have. IMHO
> should be moved to A-MPDU unless somebody can really explain why they
> need something special.
>
> And with that it easily fits into 2 u16 fields rather than 3 (actually
> it fits now even) so might be something to consider, though I don't
> really think space is much of a concern.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

--0000000000001c17d20580c9dcb7
Content-Type: application/octet-stream; name="0001-Add-an-S1G-field.patch"
Content-Disposition: attachment; filename="0001-Add-an-S1G-field.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jrla8yf50>
X-Attachment-Id: f_jrla8yf50

RnJvbSA2OGU2MGQwNTFiNDU5YTExNDRmYzgwNWM3YjcxNDkyODE1Y2JmYTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNoYXJkIFNoYXJwZSA8cnNoYXJwZUBsb2NhbGhvc3QubG9j
YWxkb21haW4+CkRhdGU6IFRodSwgMzEgSmFuIDIwMTkgMTU6NDc6NTAgLTA4MDAKU3ViamVjdDog
W1BBVENIXSBBZGQgYW4gUzFHIGZpZWxkLgoKVGhlIGF1dGhvciBpcyBBYXJvbiBMZWUuIFRyYW5z
Y3JpYmVkIGJ5IFJpY2hhcmQgU2hhcnBlLgpTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFNoYXJwZSA8
cmVhbHJpY2hhcmRzaGFycGVAZ21haWwuY29tPgotLS0KIGZpZWxkcy9DaGFubmVsLm1kICAgfCAg
MyArKysKIGZpZWxkcy9TMUcubWQgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBmaWVsZHMvc3VnZ2VzdGVkLm1kIHwgIDEgKwogMyBm
aWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZmllbGRz
L1MxRy5tZAoKZGlmZiAtLWdpdCBhL2ZpZWxkcy9DaGFubmVsLm1kIGIvZmllbGRzL0NoYW5uZWwu
bWQKaW5kZXggNzg0YzVjNC4uNTc0Nzg2MiAxMDA2NDQKLS0tIGEvZmllbGRzL0NoYW5uZWwubWQK
KysrIGIvZmllbGRzL0NoYW5uZWwubWQKQEAgLTIxLDYgKzIxLDkgQEAgQ3VycmVudGx5LCB0aGUg
Zm9sbG93aW5nIGZsYWdzIGFyZSBkZWZpbmVkOgogCiB8ICoqTWFzayoqIHwgKipNZWFuaW5nKiog
fAogfCAweDAwMTAgfCBUdXJibyBDaGFubmVsIHwKK3wgMHgwMDAyIHwgUzFHIDcwME1IeiBzcGVj
dHJ1bSBjaGFubmVsIHwKK3wgMHgwMDA0IHwgUzFHIDgwME1IeiBzcGVjdHJ1bSBjaGFubmVsIHwK
K3wgMHgwMDA4IHwgUzFHIDkwME1IeiBzcGVjdHJ1bSBjaGFubmVsIHwKIHwgMHgwMDIwIHwgQ0NL
IGNoYW5uZWwgfAogfCAweDAwNDAgfCBPRkRNIGNoYW5uZWwgfAogfCAweDAwODAgfCAyIEdIeiBz
cGVjdHJ1bSBjaGFubmVsIHwKZGlmZiAtLWdpdCBhL2ZpZWxkcy9TMUcubWQgYi9maWVsZHMvUzFH
Lm1kCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmE3MTlkZTgKLS0tIC9kZXYv
bnVsbAorKysgYi9maWVsZHMvUzFHLm1kCkBAIC0wLDAgKzEsNDkgQEAKKy0tLQordGl0bGU6IFMx
RworY2F0ZWdvcmllczogW3N1Z2dlc3RlZF0KKy0tLQorQml0IE51bWJlcgorOiAxNgorCitTdHJ1
Y3R1cmUKKzogdTE2IGtub3duLCB1MTYgZGF0YTEsIHUxNiBkYXRhMgorCitSZXF1aXJlZCBBbGln
bm1lbnQKKzogMgorCitVbml0KHMpCis6IG5vbmUKKworVGhlIHByZXNlbmNlIG9mIHRoaXMgZmll
bGQgaW5kaWNhdGVzIHRoZSBmcmFtZSB3YXMgY2FwdHVyZSB1c2luZyBhbiBTMUcgcGh5LgorCitU
aGlzIGZpZWxkIGNvbnRhaW5zIGRhdGEgdG8gYWxsb3cgY29ycmVjdCBoYW5kbGluZyBieSBwcm9n
cmFtcyBsaWtlCitXaXJlc2hhcmsgZXRjLgorCisjIyBrbm93bgorCit8ICoqYDB4MDAwMWAqKiB8
IFMxRyBQUERVIEZvcm1hdCBrbm93biB8Cit8ICoqYDB4MDAwMmAqKiB8IFJlc3BvbnNlIGluZGlj
YXRpb24ga25vd24gfAorfCAqKmAweDAwMDRgKiogfCBORFAga25vd24gfAorfCAqKmAweDAwMDhg
KiogfCBHdWFyZCBpbnRlcnZhbCBrbm93biB8Cit8ICoqYDB4MDAxMGAqKiB8IE5TUyBrbm93biB8
IAorfCAqKmAweDAwMjBgKiogfCBCYW5kd2lkdGgga25vd24gfAorfCAqKmAweDAwNDBgKiogfCBN
Q1Mga25vd24gfAorfCAqKmAweDAwODBgKiogfCBDb2xvciBrbm93biB8Cit8ICoqYDB4MDEwMGAq
KiB8IEFnZ3JlZ2F0aW9uIGtub3duIHwKK3wgKipgMHhGRTAwYCoqIHwgUmVzZXJ2ZWQgfAorCisj
IyBkYXRhMQorCit8ICoqYDB4MDAwM2AqKiB8IFMxRyBQUERVIEZvcm1hdDogMD1TMUdfMU0sIDE9
UzFHX1NIT1JULCAyPVMxR19MT05HIHwKK3wgKipgMHgwMDBDYCoqIHwgUmVzcG9uc2UgaW5kaWNh
dGlvbjogMD1OT19SRVNQT05TRSwgMT1ORFBfUkVTUE9OU0UsIDI9Tk9STUFMX1JFU1BPTlNFLCAz
PUxPTkdfUkVTUFBOU0UgfAorfCAqKmAweDAwMTBgKiogfCBORFA6IDA9Tm90IE5EUCwgMT1ORFAg
fAorfCAqKmAweDAwMjBgKiogfCBHdWFyZCBpbnRlcnZhbCB8IDA9TG9uZyBHSSwgMT1TaG9ydCBH
SSB8Cit8ICoqYDB4MDBDMGAqKiB8IE51bWJlciBzcGF0aWFsIHN0cmVhbXM6IDA9MSBTcGF0aWFs
IHN0cmVhbSwgMT0yLCAuLiAzPTQgU3BhdGlhbCBzdHJlYW1zIHwKK3wgKipgMHgwRjAwYCoqIHwg
QmFuZHdpZHRoOiAwPTFNSHosIDE9Mk1IeiwgMj00TUh6LCAzPThNSHosIDQ9MTZNSHogfAorfCAq
KmAweEYwMDBgKiogfCBNQ1MgKE1DUyByYXRlIGluZGV4LCAwLTEwLCAxMS0xNSByZXNlcnZlZCkg
fAorCisjIyBkYXRhMgorCit8ICoqYDB4MDAwRmAqKiB8IENvbG9yOiAwLTcgfAorfCAqKmAweDAw
MTBgKiogfCBBZ2dyZWdhdGlvbjogMD1ObyBhZ2dyZWdhdGlvbiwgMT1hZ2dyZWdhdGlvbiB8Cit8
ICoqYDB4RkZFMGAqKiB8IFJlc2VydmVkIHwKZGlmZiAtLWdpdCBhL2ZpZWxkcy9zdWdnZXN0ZWQu
bWQgYi9maWVsZHMvc3VnZ2VzdGVkLm1kCmluZGV4IDMyNTc3ZDkuLmVjNTk4YmIgMTAwNjQ0Ci0t
LSBhL2ZpZWxkcy9zdWdnZXN0ZWQubWQKKysrIGIvZmllbGRzL3N1Z2dlc3RlZC5tZApAQCAtMTgs
MyArMTgsNCBAQCBUaGlzIHRhYmxlIGxpc3RzIHRoZSBmaWVsZHMgc29tZSBPU2VzIGFzc2lnbmVk
IGJ5IGJpdCBudW1iZXI6CiB8IDE2IHwgW1JUUyByZXRyaWVzXSgvZmllbGRzL1JUUyByZXRyaWVz
KSwgW1JTU0ldKC9maWVsZHMvUlNTSSkgfAogfCAxNyB8IFtkYXRhIHJldHJpZXNdKC9maWVsZHMv
ZGF0YSByZXRyaWVzKSB8CiB8IDE4IHwgW1hDaGFubmVsXSgvZmllbGRzL1hDaGFubmVsKSB8Cit8
IDI4IHwgW1MxR10oL2ZpZWxkcy9TMUcpIHwKLS0gCjEuOC4zLjEKCg==
--0000000000001c17d20580c9dcb7--
