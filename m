From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Correct radiotap header for 802.11ad
Date: Sat, 22 Aug 2015 12:41:48 -0700
Message-ID: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi folks,

I have some 802.11ad captures because of some fixes to the Wireshark
802.11 dissector I am looking at doing.

One thing I notice is that the radiotap header contains both a Channel fiel=
d
and an MCS field.

The Present flags say that Flags are present, Channel is present and
HT Information is present.

The channel frequency is 60480MHz which seems to be reasonable.

The MCS field says that the MCS index is present and that index is 0.

It seems to me that this last field is perhaps incorrect, because the
radiotap information dissector claims that the PHY type is 802.11n,
and that seems to come about because the radiotap header use the MCS
index info to claim that the PHY type was 802.11n.

Should I be letting the capture hardware vendor know that they are
generating the wrong info?

I probably should also have some override stuff in the radiotap
dissector that uses the frequency field to correctly set the PHY type.

Any comments?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
