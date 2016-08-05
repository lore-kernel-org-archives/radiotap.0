From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [FINAL] timestamp field
Date: Fri, 05 Aug 2016 12:49:14 +0200
Message-ID: <1470394154.2977.36.camel@sipsolutions.net>
References: <1470376101.2977.7.camel@sipsolutions.net>
	 <3D113CB9-8919-47DB-96C1-9E40AB9AC9D6@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <3D113CB9-8919-47DB-96C1-9E40AB9AC9D6-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, aviya.erenfeld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2016-08-05 at 03:46 -0700, Guy Harris wrote:
> On Aug 4, 2016, at 10:48 PM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org
> > wrote:
> 
> > Since there was no objection, reposting as final - will adopt in a
> > week
> > from now unless there are any final objections.
> > 
> > The definition can be found at
> > http://www.radiotap.org/suggested-fields/timestamp
> 
> Does the fact that the Wireshark patch doesn't involve an
> FT_ABSOLUTE_TIME field mean that the time stamps aren't relative to
> some fixed time such as the UNIX epoch, so that they can be used to
> calculate the time between two events but not the wall-clock time of
> a single event?

I don't see a way to make them absolute, but it's something we could
consider adding perhaps? Maybe eventually wifi hardware will have some
clock sync with something.

Right now my main use-case is going to be exporting the timestamp from
the hardware, which isn't like the existing MACTIME, and then using
that to synchronize two or more captures (by finding common frames,
like beacons).

I must admit I hadn't thought about absolute times in the context of
radiotap at all.

johannes
