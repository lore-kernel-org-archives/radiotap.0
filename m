From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: RE: [RFC] VHT fields
Date: Mon, 18 Jun 2012 14:01:02 +0200
Message-ID: <1340020862.4615.8.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505FEEE@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306505FEEE-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, 2012-06-15 at 08:15 +0000, Alwin Beukers wrote:

> The reason for splitting it up is to avoid extra overhead related to MU=
-MIMO=20
> when describing VHT SU PPDUs. The separation is based on the different =
PLCP=20
> header formats (VHT-SIG-A1/A2/B) for SU and MU PPDUs:
>=20
> SU PPDUs:
> - Only one NSTS, MCS and Coding field.
> - Partial AID identifies recipient
> - Group ID is always 0 (addressed to AP/mesh STA) or 63 (addressed to S=
TA)
>=20
> MU PPDUs:
> - NSTS, MCS and Coding fields for up to four users
> - Partial AID is not applicable
> - Group ID is 1..62
>=20
> All fields common to both SU and MU are in the SU_VHT field. The MU_VHT=
 field=20
> contains additional information for MU PPDUs. The GROUP_ID and PARTIAL_=
AID
> fields have varying value or applicability.

Ok.

> So for SU PPDUs you would likely have SU_VHT and PARTIAL_AID fields, an=
d maybe
> a GROUP_ID field (for SU the GROUP_ID field only provides direction inf=
o that
> could also be determined from PARTIAL_AID and/or MAC header).

Ok, I'm not too familiar with 11ac yet.

> For MU PPDUs you would have SU_VHT (for the common fields as well as=20
> NSTS/MCS/Coding for the first user), MU_VHT (for NSTS/MCS/Coding for
> additional users), and GROUP_ID.
>=20
> By combining fields we can reduce complexity at the expense of some inc=
reased
> overhead, what are your thoughts on his?=20

I don't really care much either way -- was mostly curious why you were
splitting it up so much.

I have a feeling though that the group ID would be useful to always
have, even if it's just 0/63 in the SU case, to make it easier on
filtering?

> Also, I was wondering if we need all
> of the 'known' flags in SU_VHT. The MCS field (after which SU_VHT was m=
odeled)
> also has these, but I don=E2=80=99t know the rationale behind them. Can=
 one assume a
> driver has full access to the PLCP header and thus can fill in most of =
fields
> in the SU_VHT field?

I know that's usually the case for your devices, but it isn't typically
the case for all the random devices out there ... so I think we should
have the known flags to not run into a situation later where a device
has to lie.

johannes
