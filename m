From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT fields
Date: Mon, 23 Jul 2012 17:25:11 +0200
Message-ID: <1343057111.4584.22.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
	 <1341479327.4455.35.camel@jlt3.sipsolutions.net>
	 <C6E8EE2D6B3ACB4582C1249E834B306508054B@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306508054B-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Mon, 2012-07-23 at 14:47 +0000, Alwin Beukers wrote:

> > So one thing that strikes me is that this is not extensible at all any
> > more now inside the VHT fields, all the known flags are already used up.
> > I don't know if there's anything else in VHT that could possibly be of
> > relevance in the future though? Also, how stable is the VHT amendment? I
> > haven't followed it closely.
> 
> I agree, it's a tight fit. I can't comment on the stability of the VHT amendment,
> but it would be good to have some room left anyway. We might even want 
> to add some info for 802.11ad at some point in the future, as it's also VHT.

Yeah, though that could be done as a separate field too.

> I have put a new proposal at http://www.radiotap.org/suggested-fields/VHT
> which is basically the format you are proposing but with a few tweaks.
> 
> As there is a fixed relation between NSS and NSTS, we can get by with only
> having four per-user NSS values in the field and drop NSTS[4], which saves
> one byte. The per-user MCS and NSS values are combined as they go
> naturally together.

Makes sense.

> There is no explicit difference between MU and SU frames, all the info
> is available in the VHT field. If required, one can still determine MU or SU 
> from the group ID and hide information that is not applicable.

Right, that also makes sense.
 
> The combined field is now 12 bytes and has some room to spare. I think
> it's a nice improvement over the previous proposal, would you agree?

Yes, I like it.

One question on this:

"Note: for receive capture, the total bandwidth of the transmitter is
not generally known, so the bandwidth will only be recorded as 20, 40,
80, or 160, with the Channel field indicating the transmission center
frequency."

I'm not sure that's generally true, though it points out something that
we may need to define in more detail: we have (in Linux at least) always
had the Channel field indicate the control channel, not the transmission
center frequency.

johannes
