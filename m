From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT fields
Date: Mon, 20 Aug 2012 18:42:18 +0200
Message-ID: <1345480938.4459.40.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
	 <1341479327.4455.35.camel@jlt3.sipsolutions.net>
	 <C6E8EE2D6B3ACB4582C1249E834B306508054B@SJEXCHMB13.corp.ad.broadcom.com>
	 <1343057111.4584.22.camel@jlt3.sipsolutions.net>
	 <C6E8EE2D6B3ACB4582C1249E834B306508499C@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306508499C-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, 2012-07-27 at 14:41 +0000, Alwin Beukers wrote:
> > One question on this:
> > 
> > "Note: for receive capture, the total bandwidth of the transmitter is
> > not generally known, so the bandwidth will only be recorded as 20, 40,
> > 80, or 160, with the Channel field indicating the transmission center
> > frequency."
> > 
> > I'm not sure that's generally true, though it points out something that
> > we may need to define in more detail: we have (in Linux at least) always
> > had the Channel field indicate the control channel, not the transmission
> > center frequency.
> 
> I think indicating the control channel wouldn't work very well in this case, 
> especially for >40MHz bandwidths.
> 
> How do you feel about extending [X]Channel with a flag that indicates 
> we're specifying transmission center frequency?

I don't think that'd be a good idea, it wouldn't be backward compatible.
We're just discussing for Linux how to specify the channel parameters
and we need to consider 80+80 as well. Maybe these discussions should
cross-pollinate.

I see two basic options:
 * continue what we do now, and specify the control channel & type
   around it (40+/40+,...)
   + this is how linux works now
   - many many channel types (4 for 80 MHz, 8 for 160 MHz)
   - doesn't handle 80+80
 * specify the center frequency, width & control channel offset
   + more aligned with the spec (?)
   - requires backward compat handling
   - doesn't handle 80+80

johannes
