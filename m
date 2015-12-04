From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT MU-MIMO correction
Date: Fri, 04 Dec 2015 11:48:40 +0100
Message-ID: <1449226120.2574.0.camel@sipsolutions.net>
References: <1445418906.4558.7.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1445418906.4558.7.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

I guess this has passed a three-week minimum review time - bump, I'll
make those changes unless I hear objections within ~a week?

johannes

On Wed, 2015-10-21 at 11:15 +0200, Johannes Berg wrote:
> Hi,
>=20
> As we're looking into MU-MIMO again, we found some issue with the way
> the VHT radiotap field is defined. The issue is the following: the VHT
> SIG-A field defines the NSTS (NSS) for each user, and it would be good
> to have that shown. However, radiotap ties the validity of the MCS to
> the existence of the NSS, which is incorrect.
>=20
> Therefore, I suggest to make the following edit:
>=20
> Change this language:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0If the NSS field for a user is zero, the user i=
s not present and
> =C2=A0=C2=A0=C2=A0=C2=A0the MCS and coding (in the coding field) associ=
ated with that user
> =C2=A0=C2=A0=C2=A0=C2=A0are not valid. For SU PPDUs, only the first use=
r will have a
> =C2=A0=C2=A0=C2=A0=C2=A0nonzero NSS field.
>=20
> To read:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0If the NSS field for a user is zero, the user i=
s not present and
> =C2=A0=C2=A0=C2=A0=C2=A0the MCS and coding (in the coding field) associ=
ated with that user
> =C2=A0=C2=A0=C2=A0=C2=A0are not valid. If the NSS field for a user is n=
on-zero, but the MCS
> =C2=A0=C2=A0=C2=A0=C2=A0is not known (for example due to receiving only=
 data for a single
> =C2=A0=C2=A0=C2=A0=C2=A0user), the MCS shall be set to 15.
> =C2=A0=C2=A0=C2=A0=C2=A0For SU PPDUs, only the first user will have a n=
onzero NSS field.
>=20
>=20
> The coding should be known for all, since it's also part of VHT-SIG-A,
> so I'm not suggesting to add validity flags for that. Does anyone think
> that is necessary?
>=20
> A wireshark patch won't really be necessary since it will already
> display the MCS as "15 (invalid)" in this case, which seems reasonable
> though it could be changed to just "not known" instead.
>=20
> johannes
>=20
