From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Mon, 13 Feb 2017 21:14:49 +0100
Message-ID: <1487016889.19813.11.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
	 <D96F5F50-5B44-487C-8FF8-36A793960B7D@superduper.net>
	 <1487014748.19813.5.camel@sipsolutions.net>
	 <0FB8C34C-910C-404F-97BA-18BB7F8949C4@superduper.net>
	 <1487015370.19813.7.camel@sipsolutions.net>
	 <4443A151-EFD0-44A4-A892-C40218EE0291@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4443A151-EFD0-44A4-A892-C40218EE0291-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2017-02-13 at 12:08 -0800, Simon Barber wrote:
> And even then, where would the multiple MPDUs go, and how would they
> be delimited? 

That's a good point. Perhaps it was intended to convey some sort of
half-decoding? I frankly don't remember any discussions about this.

> If this option is unused, and unusable, and it causes big issues with
> UI, then could it be deprecated? (say only the first set of
> parameters are valid, all others are unused?)

Does it cause problems in any UI? wireshark just displays all the
fields, so it shouldn't really cause any problems.

Anyway, this has certainly never been generated on Linux, and probably
not elsewhere, so I have no objection to deprecating it and marking
those fields reserved or so.

johannes
