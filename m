From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT fields
Date: Thu, 05 Jul 2012 11:08:47 +0200
Message-ID: <1341479327.4455.35.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306505D68C-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2012-06-12 at 15:05 +0000, Alwin Beukers wrote:

> http://www.radiotap.org/suggested-fields/GROUP_ID

(I just deleted that)

> http://www.radiotap.org/suggested-fields/SU_VHT
> http://www.radiotap.org/suggested-fields/MU_VHT
> http://www.radiotap.org/suggested-fields/PARTIAL_AID

So one thing that strikes me is that this is not extensible at all any
more now inside the VHT fields, all the known flags are already used up.
I don't know if there's anything else in VHT that could possibly be of
relevance in the future though? Also, how stable is the VHT amendment? I
haven't followed it closely.

With the SU_VHT field being 5 bytes and the PARTIAL_AID requiring 2 byte
alignment, having them follow each other wastes a byte. I'm not worried
about that at all, but I wonder if splitting this into three fields is
really worth it? Given the many dependencies on SU/MU in all fields, it
almost seems that making them all one (slightly bigger) VHT field would
be easier to use?

If we wanted to go there, we could even use a union:

require 2 byte alignment of the VHT field, and then have
u8 known
u8 flags
u8 bw
u8 mcs
u8 gid
union {
	struct {
		u8 pad
		u16 partial_aid
	} su
	struct {
		u8 user1, user2, user3
	} mu
}



Also, looking at the fields in more detail, does it really make sense to
have the bits packed so tightly? NSTS and bandwidth for example, do they
really belong into the same field?

Also I think the coding/NSTS for the first and three other users should
be more regular? It seems then it wouldn't be possible to squeeze it all
into one byte per user, but ... does that really matter so much? This
isn't a huge amount of data.

Ok wait, I don't even see now how to distinguish between SU and MU
frames, except by the presence of the other fields? That's a bit
awkward, don't you think?

I think overall I'd probably just use a bit more space and make the
format more regular instead of packing MU/SU fields like MCS in with
common fields like NSS.


How about this:

u8 known         - maybe split this up further, or are there technical
                   reasons that e.g. if the coding is known the LDPC
                   extra symbol must also be known?
u8 flags         - add a MU/SU flag (and hope that all receivers know
                   this, or add a known flag?)
u8 bw            - only the bandwidth, not NSTS
u8 nss           - or maybe this could be packed with the bandwidth
u16 P_AID        - partial AID, valid only if SU
u8 NSTS[4]       - NSTS for up to 4 users
u8 mcs_coding[4] - MCS/coding/coding_known(?) for up to 4 users


Overall, this is just 6 bytes longer than your previous encoding (or
maybe 7 or 8 if flags/known now need to be extended), but I think it's
much more regular?

johannes
