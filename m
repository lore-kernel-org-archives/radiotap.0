From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Wed, 15 Feb 2017 09:58:17 +0100
Message-ID: <1487149097.4026.15.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
	 <D96F5F50-5B44-487C-8FF8-36A793960B7D@superduper.net>
	 <1487014748.19813.5.camel@sipsolutions.net>
	 <0FB8C34C-910C-404F-97BA-18BB7F8949C4@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <0FB8C34C-910C-404F-97BA-18BB7F8949C4-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2017-02-13 at 11:42 -0800, Simon Barber wrote:
> It’s not correctly implemented on captures from Macs - it increments
> for every MPDU. TSF is reliable on all platforms that I’ve seen,
> although has different reference points for different platforms.

On this point, btw, you should probably just tell somebody to fix it :)

We can add all the standard ways we want to, but if people don't use
them correctly there's not much we can do about it. I don't want to add
yet another standard way to do this, just to have the next guy use it
wrong ...

johannes
