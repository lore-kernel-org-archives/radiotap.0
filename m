From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Channel field info for 6 GHz channels
Date: Fri, 12 Jul 2019 09:09:38 +0200
Message-ID: <8e6970d56da3998227aef4df44c7430c9c41822c.camel@sipsolutions.net>
References: <1F1CB1A0-193E-4591-AD86-ECEA34B97030@me.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1F1CB1A0-193E-4591-AD86-ECEA34B97030-BUHhN+a2lJ4@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

On Wed, 2019-07-03 at 14:27 -0700, Bill Stafford wrote:
> Sorry for the basic questions on this.
> Has there been any discussion on 6 GHz channels representation in a
> RadioTap header?

Not really.

> The Channel field has a frequency field and I see flags for 5G and 2G.

I've always sort of thought the flags are kinda useless, but I don't
know how those bits are really used, I guess you'd have to look at e.g.
wireshark. OTOH, we could say it's not relevant and tools that want to
handle 6 GHz will just have to not use the bits. I don't know. Or we can
add a bit for 6-7 GHz?

> Should a 6 GHz channel just be represented in the Channel field as the
> center frequency of the entire channel BW 

Note! I'm pretty sure that this field has always been used to represent
the *control channel* center frequency, so if you had a VHT 160 MHz
channel, it would've pointed to the primary 20 MHz channel's center
frequency. That we should probably keep.

> and neither bits set for 5G or 2G? (The frequency indicates that it is
> a 6G channel, so no need for a 6G bit I imagine.)

Neither bits makes sense, I guess.

> Does the channel bandwidth information get encoded in the radiotap
> header? Or it just supposed to be inferred from the cf? (I think one
> cf in 6G can only belong to one 20/40/80/160 MHz channel. 

The *bandwidth* usually gets encoded into the rate information. In the
6-7 GHz case you'd be using HE, so
http://www.radiotap.org/fields/HE

It's simpler for HT (http://www.radiotap.org/fields/MCS) where we just
have a couple of bits saying
	bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U

Now, oddly enough, it looks like we don't actually capture the
*position* of the 40 MHz channel at all.

If we need to capture more detailed channel position data (relative to
the primary channel whose center frequency is captured in the existing
channel field) I'd probably say we should have some new field that
captures this in more detail. In Linux, we capture the configuration in
something like

	u32 control_freq;
	enum ... bandwidth;
	u32 center_freq1;
	u32 center_freq2; // for 80+80

but we've already found that it's not sufficient for
 * S1G, which has channels with fractional MHz center frequency
 * EDMG, which has a bunch of non-contiguous chunks

johannes
