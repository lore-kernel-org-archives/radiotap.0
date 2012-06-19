From: "Alwin Beukers" <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [RFC] VHT fields
Date: Tue, 19 Jun 2012 10:56:15 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B306506180A@SJEXCHMB13.corp.ad.broadcom.com>
References: <C6E8EE2D6B3ACB4582C1249E834B306505FEEE@SJEXCHMB13.corp.ad.broadcom.com>,<1340020862.4615.8.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1340020862.4615.8.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Johannes,=0A=
=0A=
> I have a feeling though that the group ID would be useful to always=0A=
> have, even if it's just 0/63 in the SU case, to make it easier on=0A=
> filtering?=0A=
=0A=
Good point, putting this into the SU_VHT field and dropping VHT_GROUP=0A=
will make things easier.=0A=
 =0A=
> > Also, I was wondering if we need all=0A=
> > of the 'known' flags in SU_VHT. The MCS field (after which SU_VHT was=
=0A=
> > modeled)=0A=
> > also has these, but I don=92t know the rationale behind them. Can one=
=0A=
> > assume a=0A=
> > driver has full access to the PLCP header and thus can fill in most=0A=
> > of fields=0A=
> > in the SU_VHT field?=0A=
> =0A=
> I know that's usually the case for your devices, but it isn't typically=
=0A=
> the case for all the random devices out there ... so I think we should=0A=
> have the known flags to not run into a situation later where a device=0A=
> has to lie.=0A=
=0A=
Makes sense, I'll keep these in then.=0A=
=0A=
Thanks,=0A=
Alwin=0A=
