From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT fields
Date: Thu, 05 Jul 2012 10:37:43 +0200
Message-ID: <1341477463.4455.17.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
	 <C6E8EE2D6B3ACB4582C1249E834B306506E807@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306506E807-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, 2012-07-04 at 17:18 +0000, Alwin Beukers wrote:
> Hi everyone,
> 
> Thanks for the feedback on the 802.11ac fields.
> 
> If there are no further suggestions, I would like to request the SU_VHT, MU_VHT and 
> PARTIAL_AID fields to be moved to the defined-fields section and have their bit numbers
> assigned. As the group ID was merged into SU_VHT, the GROUP_ID field can be dropped.
> 
> With the bit numbers assigned I can deliver the Wireshark patch for parsing these fields.

Can we also have a producer of the fields? I realise that may be hard to
do now without a driver? :-)

Please just use the next free bit numbers though, swapping those out
later will be easy, and that way we can see the code before adopting the
changes, this helps flush out implementation issues.

See also http://www.radiotap.org/Standardisation

johannes
