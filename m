From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Mon, 24 Aug 2015 09:21:17 -0700
Message-ID: <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
	<38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
	<1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
	<1440402013.3735.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1440402013.3735.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, Aug 24, 2015 at 12:40 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> On Sat, 2015-08-22 at 16:34 -0700, Guy Harris wrote:
>>
>> For what it's worth, it appears that the wil6210 driver:
>>
>>       https://wireless.wiki.kernel.org/en/users/drivers/wil6210
>>
>> uses the MCS field and its mcs value for 11ad.  It can also be
>> configured to supply raw "PHY data" with a vendor-namespace field.
>>
>> So code that processes radiotap headers, such as Wireshark's radiotap
>> -header dissector, will have to interpret packets with an MCS field
>> and a channel frequence in the 11ad range as being 11ad packets, and
>> treat the mcs value in the MCS field as an 11ad MCS, not an 11n MCS.
>
> That just seems really lazy though - I think we should rather fix that
> driver and define a proper 60G radiotap field.

Can I suggest something like the following, although we have defined
the presence flags as a UINT32 for the moment in Wireshark:

--- ../linux-3.11-rc6/include/net/ieee80211_radiotap.h 2013-10-20
13:34:23.633866699 -0700
+++ ./include/net/ieee80211_radiotap.h 2015-08-24 09:12:12.416137951 -0700
@@ -190,6 +190,11 @@
  * IEEE80211_RADIOTAP_VHT u16, u8, u8, u8[4], u8, u8, u16
  *
  * Contains VHT information about this frame.
+ *
+ * IEEE80211_RADIOTAP_DMG       u8, u8
+ *
+ *      Contains DMG information about the frame. Currently presence flags
+ *      and the MCS index, if present.
  */
 enum ieee80211_radiotap_type {
  IEEE80211_RADIOTAP_TSFT =3D 0,
@@ -214,6 +219,7 @@
  IEEE80211_RADIOTAP_MCS =3D 19,
  IEEE80211_RADIOTAP_AMPDU_STATUS =3D 20,
  IEEE80211_RADIOTAP_VHT =3D 21,
+ IEEE80211_RADIOTAP_DMG =3D 22,

  /* valid in every it_present bitmap, even vendor namespaces */
  IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE =3D 29,

Also, there is the matter of whether or not we need to indicate Static
Tone Pairing and Dynamic Tone Pairing as that is a bit in the PHY
header and is needed to make sense of MCS values 13-17, maybe.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
