From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] timestamp field
Date: Thu, 02 Jun 2016 11:31:44 +0200
Message-ID: <1464859904.2169.5.camel@sipsolutions.net>
References: <1449236499.2574.4.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1449236499.2574.4.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2015-12-04 at 14:41 +0100, Johannes Berg wrote:
> Hi all,
>=20
> This is a request for adoption of the timestamp field as documented
> on http://www.radiotap.org/suggested-fields/timestamp
>=20
Repost, since I made a small change:

=C2=A0* changed sampling position 2 to be "end of PPDU"
=C2=A0* added sampling position 3 to mean
=C2=A0 =C2=A0"end of MPDU (after FCS)"

johannes
