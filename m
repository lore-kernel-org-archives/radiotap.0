From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT fields
Date: Fri, 24 Aug 2012 11:00:50 +0200
Message-ID: <1345798850.4503.2.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
	 <1341479327.4455.35.camel@jlt3.sipsolutions.net>
	 <C6E8EE2D6B3ACB4582C1249E834B306508054B@SJEXCHMB13.corp.ad.broadcom.com>
	 <1343057111.4584.22.camel@jlt3.sipsolutions.net>
	 <C6E8EE2D6B3ACB4582C1249E834B306508499C@SJEXCHMB13.corp.ad.broadcom.com>
	 <1345480938.4459.40.camel@jlt3.sipsolutions.net>
	 <C6E8EE2D6B3ACB4582C1249E834B30650B4151@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B30650B4151-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, 2012-08-24 at 07:46 +0000, Alwin Beukers wrote:
> > We're just discussing for Linux how to specify the channel parameters
> > and we need to consider 80+80 as well. Maybe these discussions should
> > cross-pollinate.
> 
> Yes. However, this issue isn't directly related to or blocking the VHT field 
> proposal, is it? Can I go ahead and post an adaptation request for that?

Right.

> > I see two basic options:
> >  * continue what we do now, and specify the control channel & type
> >    around it (40+/40+,...)
> >    + this is how linux works now
> >    - many many channel types (4 for 80 MHz, 8 for 160 MHz)
> >    - doesn't handle 80+80
> 
> When it comes to radiotap, this might do as an interim solution for chips
> that don't support 80+80 yet. The new channel types would fit in the
> XChannel field.

We could even do both unless the channel is 80+80 for older parsers like
existing wireshark since they'd then be able to parse at least
something.

> >  * specify the center frequency, width & control channel offset
> >    + more aligned with the spec (?)
> >    - requires backward compat handling
> >    - doesn't handle 80+80
> 
> I feel this is the best long-term solution. The 80+80 case could be handled 
> By adding a secondary center frequency.

Yeah, something like that. We need to work that out in Linux too, not
even sure there are chips that will support 80+80 though?

johannes
