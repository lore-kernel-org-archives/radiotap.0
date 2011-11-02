From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Regarding A-MPDU status field
Date: Wed, 02 Nov 2011 09:42:23 +0100
Message-ID: <1320223343.3950.29.camel@jlt3.sipsolutions.net>
References: <21E1C3B49A18BA428D58607D5EEA5398BB2E90@nasanexd02b.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <21E1C3B49A18BA428D58607D5EEA5398BB2E90-RqevaKtL5OWBP98+muIrrKRtKmQZhJ7pQQ4Iyu8u01E@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "Rao, Krishna" <kcrao-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

[please try writing text-only email]

> I noticed that the A-MPDU status field has been listed under
> =E2=80=98Suggested Fields=E2=80=99 (http://www.radiotap.org/suggested-f=
ields). I feel
> having this field will make things easier in some scenarios,
> especially when carrying out performance related analysis.

Indeed.

> I would like to request for this field to be made official.=20

I had worked on this for a while, but never followed through on the
process of formally adopting it.

Having a driver that supports this field would also be required so we
can judge its implementation, and so far I haven't had a chance to add
support to any driver. If you can do that for any of the QCA drivers
that would be helpful.

Also, the question about the contents came up at some points -- it might
also be helpful to know the padding length before/after (?) the packet
for example.

johannes
