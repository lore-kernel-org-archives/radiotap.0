From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Mon, 13 Feb 2017 20:39:08 +0100
Message-ID: <1487014748.19813.5.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
	 <D96F5F50-5B44-487C-8FF8-36A793960B7D@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <D96F5F50-5B44-487C-8FF8-36A793960B7D-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2017-02-13 at 11:33 -0800, Simon Barber wrote:
> For HT and VHT one of the things that is missing is the total length
> of aggregates (including padding) - it’s in the L-SIG header, would
> be nice to have it exposed (since most chipsets pass up everything
> that’s in the header).

I don't know about "most", but I know ours doesn't :-)

> Also some standardized way to put aggregates back together. My latest
> wireshark extension uses same TSF as that clue.
> See https://code.wireshark.org/review/#/c/20043/

We already have that, in the A-MPDU status field there's a reference
number that's supposed to be constant within the same A-MPDU and change
between consecutive A-MPDUs.

johannes
