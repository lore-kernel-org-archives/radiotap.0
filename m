From: "Alwin Beukers" <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [RFC] VHT fields
Date: Fri, 15 Jun 2012 08:15:26 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B306505FEEE@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

> On Tue, 2012-06-12 at 15:05 +0000, Alwin Beukers wrote:=0A=
> > Hi everyone,=0A=
> >=0A=
> > This is a proposal for adding support for 802.11ac. Four fields were=0A=
> added to the suggested-fields section:=0A=
> >=0A=
> > http://www.radiotap.org/suggested-fields/SU_VHT=0A=
> > http://www.radiotap.org/suggested-fields/MU_VHT=0A=
> > http://www.radiotap.org/suggested-fields/GROUP_ID=0A=
> > http://www.radiotap.org/suggested-fields/PARTIAL_AID=0A=
> >=0A=
> > A Wireshark patch for parsing SU_VHT, GROUP_ID and PARTIAL_AID is=0A=
> attached.=0A=
> =0A=
> What's the reason for splitting it up?=0A=
=0A=
Johannes,=0A=
=0A=
The reason for splitting it up is to avoid extra overhead related to MU-MIM=
O =0A=
when describing VHT SU PPDUs. The separation is based on the different PLCP=
 =0A=
header formats (VHT-SIG-A1/A2/B) for SU and MU PPDUs:=0A=
=0A=
SU PPDUs:=0A=
- Only one NSTS, MCS and Coding field.=0A=
- Partial AID identifies recipient=0A=
- Group ID is always 0 (addressed to AP/mesh STA) or 63 (addressed to STA)=
=0A=
=0A=
MU PPDUs:=0A=
- NSTS, MCS and Coding fields for up to four users=0A=
- Partial AID is not applicable=0A=
- Group ID is 1..62=0A=
=0A=
All fields common to both SU and MU are in the SU_VHT field. The MU_VHT fie=
ld =0A=
contains additional information for MU PPDUs. The GROUP_ID and PARTIAL_AID=
=0A=
fields have varying value or applicability.=0A=
=0A=
So for SU PPDUs you would likely have SU_VHT and PARTIAL_AID fields, and ma=
ybe=0A=
a GROUP_ID field (for SU the GROUP_ID field only provides direction info th=
at=0A=
could also be determined from PARTIAL_AID and/or MAC header).=0A=
For MU PPDUs you would have SU_VHT (for the common fields as well as =0A=
NSTS/MCS/Coding for the first user), MU_VHT (for NSTS/MCS/Coding for=0A=
additional users), and GROUP_ID.=0A=
=0A=
By combining fields we can reduce complexity at the expense of some increas=
ed=0A=
overhead, what are your thoughts on his? Also, I was wondering if we need a=
ll=0A=
of the 'known' flags in SU_VHT. The MCS field (after which SU_VHT was model=
ed)=0A=
also has these, but I don=92t know the rationale behind them. Can one assum=
e a=0A=
driver has full access to the PLCP header and thus can fill in most of fiel=
ds=0A=
in the SU_VHT field?=0A=
=0A=
Thanks,=0A=
Alwin=0A=
 =0A=
> johannes=0A=
> =0A=
=0A=
