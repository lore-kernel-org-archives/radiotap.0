From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Mon, 13 Feb 2017 12:08:41 -0800
Message-ID: <4443A151-EFD0-44A4-A892-C40218EE0291@superduper.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
 <D96F5F50-5B44-487C-8FF8-36A793960B7D@superduper.net>
 <1487014748.19813.5.camel@sipsolutions.net>
 <0FB8C34C-910C-404F-97BA-18BB7F8949C4@superduper.net>
 <1487015370.19813.7.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1487015370.19813.7.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

And even then, where would the multiple MPDUs go, and how would they be =
delimited? If this option is unused, and unusable, and it causes big =
issues with UI, then could it be deprecated? (say only the first set of =
parameters are valid, all others are unused?)

Simon

> On Feb 13, 2017, at 11:49 AM, Johannes Berg =
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
>=20
> On Mon, 2017-02-13 at 11:42 -0800, Simon Barber wrote:
>> It=E2=80=99s not correctly implemented on captures from Macs - it =
increments
>> for every MPDU. TSF is reliable on all platforms that I=E2=80=99ve =
seen,
>> although has different reference points for different platforms.
>>=20
>> One things that is very odd is the different parameters for MU - 4
>> sets, but I=E2=80=99ve only ever seen 1 MPDU reported. How is this =
supposed
>> to be used?
>=20
> I don't think it *can* be used by a real sniffer, unless it is somehow
> able to decode for multiple users at once?
>=20
> johannes
