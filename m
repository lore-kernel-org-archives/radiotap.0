From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Mon, 18 Apr 2011 12:01:13 +0200
Message-ID: <1303120873.3588.5.camel@jlt3.sipsolutions.net>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	 <loom.20110418T114722-716@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <loom.20110418T114722-716-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2011-04-18 at 09:49 +0000, Roberto Riggio wrote:

> > Here is the draft of the field: http://www.radiotap.org/suggested-fields/MCS
> > 
> > and here there are patches for the radiotap parser, mac80211, tcpdump
> > and wireshark:
> > 
> > http://teknoraver.net/software/radiotap_mcs/
> 
> do you have an updated version of your patch for the current (or a recent) 
> compat wireless?

The MCS field was adopted and the Linux kernel supports it out of the
box now, along with wireshark trunk.

johannes
