From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] 0-length PPDU reporting
Date: Mon, 18 Jun 2018 21:20:37 +0200
Message-ID: <1529349637.3092.8.camel@sipsolutions.net>
References: <1529332670.3490.50.camel@sipsolutions.net>
	 <00986C20-9443-40FC-9A7E-DE636A743951@superduper.net>
	 (sfid-20180618_180542_208407_0C406B67)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <00986C20-9443-40FC-9A7E-DE636A743951-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org> (sfid-20180618_180542_208407_0C406B67)
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2018-06-18 at 09:05 -0700, Simon Barber wrote:
> Some chipsets will also report particular types of noise as a special
> PPDU - used for radar detection - it might be nice to allow these as
> well.

Yeah, I guess we could define plenty of subtypes for these, and then you
can include all kinds of metadata you want.

These are somewhat less useful because you have less metadata, you
haven't even decoded any preambles in those cases, and you probably have
a ton of them if enabled, but sure, why not.

I'll try to build a list I guess, to come up with a proposal.

A wireshark patch should be pretty simple, just don't call through to
the 802.11 dissector?

johannes
