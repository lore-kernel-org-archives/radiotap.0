From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [FINAL] timestamp field
Date: Fri, 5 Aug 2016 03:46:04 -0700
Message-ID: <3D113CB9-8919-47DB-96C1-9E40AB9AC9D6@alum.mit.edu>
References: <1470376101.2977.7.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1470376101.2977.7.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

On Aug 4, 2016, at 10:48 PM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:

> Since there was no objection, reposting as final - will adopt in a =
week
> from now unless there are any final objections.
>=20
> The definition can be found at
> http://www.radiotap.org/suggested-fields/timestamp

Does the fact that the Wireshark patch doesn't involve an =
FT_ABSOLUTE_TIME field mean that the time stamps aren't relative to some =
fixed time such as the UNIX epoch, so that they can be used to calculate =
the time between two events but not the wall-clock time of a single =
event?=
