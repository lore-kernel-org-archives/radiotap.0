From: "Alwin Beukers" <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [RFC] VHT fields
Date: Tue, 19 Jun 2012 11:37:09 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B3065061857@SJEXCHMB13.corp.ad.broadcom.com>
References: <C6E8EE2D6B3ACB4582C1249E834B306505FEEE@SJEXCHMB13.corp.ad.broadcom.com>,<4FDF7426.2050202@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4FDF7426.2050202-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Simon,=0A=
=0A=
> I'm not very familar with 11ac - but does this information together=0A=
> with the packet data give you enough to calculate precisely the=0A=
> packet's duration in time? Are there any duration fields, as there are=0A=
> in 11n that might be useful?=0A=
=0A=
Haven't tried it, but I think you would have all the required info.=0A=
=0A=
Section 22.3.2 of the 11ac draft has the durations of the training and=0A=
signal fields. The duration of VHT-LTF depends on the total number=0A=
of space-time streams (NSTS), which you can get from the SU_VHT=0A=
and MU_VHT fields.=0A=
=0A=
The radiotap header doesn't contain the data length from the =0A=
VHT-SIG-B field, but I guess you can get that from the packet data=0A=
itself. There is a datarate calculation in the Wireshark patch I sent=0A=
with the proposal.=0A=
=0A=
Alwin=0A=
=0A=
> =0A=
> Simon=0A=
