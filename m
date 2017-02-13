From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Mon, 13 Feb 2017 11:33:27 -0800
Message-ID: <D96F5F50-5B44-487C-8FF8-36A793960B7D@superduper.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_4C08E0A6-4AF3-48B5-830A-99EE01D6E515"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1486992211.19813.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org


--Apple-Mail=_4C08E0A6-4AF3-48B5-830A-99EE01D6E515
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

For HT and VHT one of the things that is missing is the total length of =
aggregates (including padding) - it=E2=80=99s in the L-SIG header, would =
be nice to have it exposed (since most chipsets pass up everything =
that=E2=80=99s in the header). I assume the same will be true for ax. =
Also some standardized way to put aggregates back together. My latest =
wireshark extension uses same TSF as that clue. See =
https://code.wireshark.org/review/#/c/20043/ =
<https://code.wireshark.org/review/#/c/20043/>

Simon

> On Feb 13, 2017, at 5:23 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:
>=20
> Hi,
>=20
> We're looking to add HE/11ax extensions to radiotap.
>=20
> Has anyone else already identified the data that would be necessary?
>=20
> So far I have - assuming 'presence bits' for each,
>=20
> for HE_SU:
> * beam change (1 bit)
> * UL/DL (1 bit)
> * MCS (4 bits)
> * DCM (1 bit)
> * BSS color (6 bits)
> * spatial reuse (TBD)
> * bandwidth
> * GI+LTF size (2 bits)
> * Nsts
> * TXOP duration (7 bits)
> * Coding (BCC/LDPC)
> * LDPC extra symbol flag
> * STBC flag
> * TX BF flag
> * pre-FEC padding factor
> * PE disambiguity
> * doppler mode
>=20
> for HE_MU:
> * UL/DL
> * MCS
> * DCM
> * BSS color
> * spatial reuse
> * TXOP Duration
> * bandwidth
> * # of HE SIGB symbols
> * SIG-B compression
> * GI+LTF size
> * # of HE-LTF symbols
> * LDPC extra symbol flag
> * STBC
> * pre-FEC padding factor
> * PE disambiguity
> * doppler mode
> * RU allocation
> * center 26 tone RU
> * per-user: STA-ID, Nsts, TX BF, MCS, DCM, Coding
>=20
> for HE_TRIG:
> (similar to HE_SU but a little restricted)
>=20
>=20
> Obviously a number of these fields are in all three formats, and I
> haven't really done a full size analysis, but perhaps we should split
> the extra MU fields into a separate bit so that they don't have to =
have
> space allocated to them when not used, for SU/TRIG formats?
>=20
> johannes


--Apple-Mail=_4C08E0A6-4AF3-48B5-830A-99EE01D6E515
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">For HT and VHT one of the things that is missing is the total =
length of aggregates (including padding) - it=E2=80=99s in the L-SIG =
header, would be nice to have it exposed (since most chipsets pass up =
everything that=E2=80=99s in the header). I assume the same will be true =
for ax. Also some standardized way to put aggregates back together. My =
latest wireshark extension uses same TSF as that clue. See&nbsp;<a =
href=3D"https://code.wireshark.org/review/#/c/20043/" =
class=3D"">https://code.wireshark.org/review/#/c/20043/</a><div =
class=3D""><br class=3D""></div><div class=3D"">Simon</div><div =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 13, 2017, at 5:23 AM, Johannes Berg &lt;<a =
href=3D"mailto:johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org" =
class=3D"">johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi,<br=
 class=3D""><br class=3D"">We're looking to add HE/11ax extensions to =
radiotap.<br class=3D""><br class=3D"">Has anyone else already =
identified the data that would be necessary?<br class=3D""><br =
class=3D"">So far I have - assuming 'presence bits' for each,<br =
class=3D""><br class=3D"">for HE_SU:<br class=3D""> * beam change (1 =
bit)<br class=3D""> * UL/DL (1 bit)<br class=3D""> * MCS (4 bits)<br =
class=3D""> * DCM (1 bit)<br class=3D""> * BSS color (6 bits)<br =
class=3D""> * spatial reuse (TBD)<br class=3D""> * bandwidth<br =
class=3D""> * GI+LTF size (2 bits)<br class=3D""> * Nsts<br class=3D""> =
* TXOP duration (7 bits)<br class=3D""> * Coding (BCC/LDPC)<br class=3D"">=
 * LDPC extra symbol flag<br class=3D""> * STBC flag<br class=3D""> * TX =
BF flag<br class=3D""> * pre-FEC padding factor<br class=3D""> * PE =
disambiguity<br class=3D""> * doppler mode<br class=3D""><br =
class=3D"">for HE_MU:<br class=3D""> * UL/DL<br class=3D""> * MCS<br =
class=3D""> * DCM<br class=3D""> * BSS color<br class=3D""> * spatial =
reuse<br class=3D""> * TXOP Duration<br class=3D""> * bandwidth<br =
class=3D""> * # of HE SIGB symbols<br class=3D""> * SIG-B compression<br =
class=3D""> * GI+LTF size<br class=3D""> * # of HE-LTF symbols<br =
class=3D""> * LDPC extra symbol flag<br class=3D""> * STBC<br class=3D""> =
* pre-FEC padding factor<br class=3D""> * PE disambiguity<br class=3D""> =
* doppler mode<br class=3D""> * RU allocation<br class=3D""> * center 26 =
tone RU<br class=3D""> * per-user: STA-ID, Nsts, TX BF, MCS, DCM, =
Coding<br class=3D""><br class=3D"">for HE_TRIG:<br class=3D"">(similar =
to HE_SU but a little restricted)<br class=3D""><br class=3D""><br =
class=3D"">Obviously a number of these fields are in all three formats, =
and I<br class=3D"">haven't really done a full size analysis, but =
perhaps we should split<br class=3D"">the extra MU fields into a =
separate bit so that they don't have to have<br class=3D"">space =
allocated to them when not used, for SU/TRIG formats?<br class=3D""><br =
class=3D"">johannes<br class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_4C08E0A6-4AF3-48B5-830A-99EE01D6E515--
