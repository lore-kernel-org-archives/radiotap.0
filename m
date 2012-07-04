From: "Alwin Beukers" <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [RFC] VHT fields
Date: Wed, 4 Jul 2012 17:18:25 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B306506E807@SJEXCHMB13.corp.ad.broadcom.com>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306505D68C-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Cc: Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi everyone,

Thanks for the feedback on the 802.11ac fields.

If there are no further suggestions, I would like to request the SU_VHT, MU=
_VHT and=20
PARTIAL_AID fields to be moved to the defined-fields section and have their=
 bit numbers
assigned. As the group ID was merged into SU_VHT, the GROUP_ID field can be=
 dropped.

With the bit numbers assigned I can deliver the Wireshark patch for parsing=
 these fields.

Thanks,
Alwin

> Hi everyone,
>=20
> This is a proposal for adding support for 802.11ac. Four fields were adde=
d to the suggested-fields section:
>=20
> http://www.radiotap.org/suggested-fields/SU_VHT
> http://www.radiotap.org/suggested-fields/MU_VHT
> http://www.radiotap.org/suggested-fields/GROUP_ID
> http://www.radiotap.org/suggested-fields/PARTIAL_AID
>
> A Wireshark patch for parsing SU_VHT, GROUP_ID and PARTIAL_AID is attache=
d.
>=20
> Any thoughts?
>=20
> Thanks,
> Alwin
