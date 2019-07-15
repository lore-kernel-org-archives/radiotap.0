From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Channel field info for 6 GHz channels
Date: Mon, 15 Jul 2019 09:06:08 +0200
Message-ID: <1ed8b7fd7008a356adb2020d2cd891bf93b3aea3.camel@sipsolutions.net>
References: <1F1CB1A0-193E-4591-AD86-ECEA34B97030@me.com>
	 <8e6970d56da3998227aef4df44c7430c9c41822c.camel@sipsolutions.net>
	 <3A61B59B-0D87-46AF-8943-5EF5A1207DFB@me.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <3A61B59B-0D87-46AF-8943-5EF5A1207DFB-BUHhN+a2lJ4@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi Bill,

> I took a look at the current Wireshark code and see that the bits are being used to set the phy type of the rx frame.
> 
> Here are some excerpts from packet-ieee80211-radiotap.c, creating some masks including the radiotap channel flags for 2g/5g:
> #define	IEEE80211_CHAN_DSSS \
> 	(IEEE80211_CHAN_2GHZ)
> #define	IEEE80211_CHAN_A \
> 	(IEEE80211_CHAN_5GHZ | IEEE80211_CHAN_OFDM)
> #define	IEEE80211_CHAN_B \
> 	(IEEE80211_CHAN_2GHZ | IEEE80211_CHAN_CCK)
> 
> Then in dissect_radiotap_channel(), paraphrasing the switch on the channel flags:
> 
[...]

Interesting, ok.

> The frequency could be used just as well, but I also see this comment in the same function:
> 	if (freq != 0) {
> 		/*
> 		 * XXX - some captures have 0, which is
> 		 * obviously bogus.
> 		 */
> I don’t know if captures that have a zero freq bother setting 2g/5g bits.

That I don't know either, I haven't ever seen any such captures.

> > OTOH, we could say it's not relevant and tools that want to
> > handle 6 GHz will just have to not use the bits. I don't know. Or we can
> > add a bit for 6-7 GHz?
> 
> I don’t think a 6 GHz bit is necessary. Maybe if there is no 6G bit
> the drivers will be more inclined to fill out the frequency.

I think mostly they do. In Linux certainly we always have it, you can't
really *not* have it. I've never seen any captures from elsewhere that
don't have it either.

> > Now, oddly enough, it looks like we don't actually capture the
> > *position* of the 40 MHz channel at all.
> 
> Not really an issue I think other than 2 GHz band use. Since 5G and 6G
> bands have non-overlapping channels of any bandwidth, given a 20 MHz
> primary channel, you know the one and only 40/80/160 that contains
> that channel.

At least theoretically, yes. For monitor mode we might actually want to
be able to capture non-standard deployments.

It occurred to me later though that this is something you have to
actually *configure* on the sniffer to start with, i.e. you have to tell
it "please capture on channel 36 80+80 MHz with CF1==xyz, CF2==abc". So
you already must have that information, though recording it again in the
file could be useful since you might not _remember_ it.

Except in merged multi-device captures or simulation scenarios, where
you could possibly have a single capture file that contains more than
just a single channel, in simulation possibly *everything* that was
going on...

> But 2 GHz 40MHz seems like it is left without knowing which of the 2
> 40MHz channels that contain a primary 20 MHz btwn 5-9.

Right, only out-of-band from configuration again.

> > If we need to capture more detailed channel position data (relative to
> > the primary channel whose center frequency is captured in the existing
> > channel field) I'd probably say we should have some new field that
> > captures this in more detail. In Linux, we capture the configuration in
> > something like
> > 
> > 	u32 control_freq;
> > 	enum ... bandwidth;
> > 	u32 center_freq1;
> > 	u32 center_freq2; // for 80+80
> > 
> > but we've already found that it's not sufficient for
> > * S1G, which has channels with fractional MHz center frequency
> > * EDMG, which has a bunch of non-contiguous chunks
> 
> I noticed that radiotap did not have any 80+80 encoding. 

We didn't actually need it, because we only captured the *rate*, and
those are the same for 160 and 80+80. 80+80 also doesn't really seem to
be used much in practice, if ever?

Anyway, again, if we need/want to capture it we'll need to add a new
field that captures the channel configuration for that frame.

> But it make sense to me to have some extended channel info in radiotap
> to encode these cases.  

Agree. I don't have a real need for that right now so am unlikely to
work on a proposal, but if somebody did I'd be willing to support it
with Linux code.

johannes
