Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE autolearn=no autolearn_force=no
	version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id C028B84D7B
	for <radiotap@netbsd.org>; Wed, 11 Dec 2019 12:58:06 +0000 (UTC)
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id cU2uEaIN0TPz for <radiotap@netbsd.org>;
	Wed, 11 Dec 2019 12:58:06 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate
 requested) by mail.netbsd.org (Postfix) with ESMTPS id C3A3B84D33 for
 <radiotap@netbsd.org>; Wed, 11 Dec 2019 12:58:05 +0000 (UTC)
Message-ID: <8f7c0c22c9732cc831686df4b93dedf37e72d219.camel@sipsolutions.net>
Subject: Re: Correct radiotap header for 802.11ad
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 11 Dec 2019 13:57:58 +0100
In-Reply-To: <CABPxzY+0v-Rb-GWkL-iwCfefzhFE5AiGBh2xxV_U_OC0Q+eoVQ@mail.gmail.com>
References: 
	<CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
	 <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
	 <1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
	 <1440402013.3735.1.camel@sipsolutions.net>
	 <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com>
	 <55DE44EB.6080603@superduper.net>
	 <126B842D-05EA-4510-BC9B-DB1A4AABEC12@alum.mit.edu>
	 <1135A126-6A5A-4C84-A52D-13C0387609CC@alum.mit.edu>
	 <1442507879.2821.9.camel@sipsolutions.net>
	 <C5FF46C6-BDEE-41D8-B7E1-1EFFE9411DE3@alum.mit.edu>
	 <4cf0c2a4a2d1cd92dff4f1a791d74523e446cf01.camel@sipsolutions.net>
	 <CABPxzY+0v-Rb-GWkL-iwCfefzhFE5AiGBh2xxV_U_OC0Q+eoVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: Guy Harris <guy@alum.mit.edu>, "radiotap@netbsd.org" <radiotap@netbsd.org>, Simon Barber <simon@superduper.net>, Richard Sharpe <realrichardsharpe@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, Maya Erez <merez@codeaurora.org>, wil6210@qti.qualcomm.com

On Wed, 2019-12-11 at 15:09 +0530, Krishna Chaitanya wrote:
> 
> > For both the Linux userspace reporting and radiotap then, this
> > completely ignores the existence of the MCSes 9.1 and 12.1-12.6, which
> > cannot be captured in either format right now. Maybe the extended SC
> > MCSes are just not used by equipment in the field?
> > 
> They are used. Unfortunately, Linux-wireless doesn't have native support for DMG
> wil6210 and our driver has to workaround by using HT IE's
> (ieee80211_supported_band).

You make it sound like that some sort of thing that Linux cannot really
do better. That's far from the truth! We keep extending this (HT, VHT,
HE recently) and there's no fundamental reason we couldn't do extensions
for DMG. It's just that nobody who actually has a driver for Linux
bothered doing so!

> > In any case, to capture DMG properly I'd say we need a new radiotap
> > field with at least
> >  * (base) MCS
> >  * Extended SC MCS bit
> > and it should probably optionally cover the other possible fields as
> > well
> >  * Scrambler Initialization
> >  * Length (?)
> >  * Additional PPDU bit
> >  * PPDU type bit
> >  * Training Length
> >  * Beam Tracking Request
> >  * Last RSSI
> >  * Turnaround
> yes, we definitely need this, there are some additional fields in
> 11ay, but I guess that
> discussion is for another time.

Somebody (@QCA I guess, I don't have any functioning driver/hardware for
Linux for this) really should sit down and define the extensions to
cfg80211/nl80211 to capture the data properly, and a radiotap extension.
None of that is hard, I've done it for VHT before and HE recently.

johannes



