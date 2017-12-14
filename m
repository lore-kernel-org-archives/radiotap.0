From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Would it be useful to have preferences for radiotap to allow handling
 of captures with conflicting presence flags?
Date: Thu, 14 Dec 2017 13:06:53 -0800
Message-ID: <CACyXjPy9nUFhKmgzyVt6KBqHZW3oa0dgpkzQyGbtHHLOnC=f1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

I notice on this page

  http://www.radiotap.org/fields/suggested

it mentions that there are some conflicting usages of flag bits for radiota=
p.

Currently, Wireshark knows about bit 14 in the presence flags, but
hard-codes it for rx-Flags. It also doesn't know about tx-Flags (or
hardware-queue).

Would it be useful to allow the user to specify they want to be able
to switch between usages or are we trying to stamp out such
conflicting uses?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
