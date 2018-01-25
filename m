From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Conflicting definitions between the radiotap HE PPDU format field and 802.11axD2
Date: Thu, 25 Jan 2018 07:32:17 -0800
Message-ID: <CACyXjPzSHgyBkpXBR7=eqsfiCmeKBOsQD=0dJtUMwqUk=yWxYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi folks,

It seems that 802.11ax D2 defines, in Table 28-18, in HE-SIG-A, a
1-bit format fields (B0) that takes the values 0 for HE TB PPDUs and 1
for HE SU PPDUs and that is reserved for others but must be set to 1.

However, what seems to be the equivalent radiotap he ppdu format field
is 2 bits and uses different values.

Have I misunderstood? What is the resolution of this?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
