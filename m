From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] timestamp field
Date: Thu, 02 Jun 2016 11:30:26 +0200
Message-ID: <1464859826.2169.4.camel@sipsolutions.net>
References: <1449236499.2574.4.camel@sipsolutions.net>
	 <1453293763.13263.8.camel@sipsolutions.net>
	 <569FC7FB.8090009@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <569FC7FB.8090009-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, 2016-01-20 at 09:46 -0800, Simon Barber wrote:
> I like this proposal. One aspect that is missing is to define the=C2=A0
> meaning of the timestamp with aggregates.=C2=A0

Actually, I think the field kinda already covers that.

If you have sampling position 0, then it ought to be of *that* MPDU, so
probably not present in any subframes but the first, unless you can
sample a different timestamp for each.

If you have sampling position 1 (PLCP start) then obviously that's at
the A-MPDU level and it doesn't matter if it's present in all or the
first only, in some ways. (Note that we found that Broadcom generates
an invalid A-MPDU reference field...)

Sampling position 2 - end of frame - I'll clarify to be "end of PPDU",
I think that's what ath* devices create.

johannes
