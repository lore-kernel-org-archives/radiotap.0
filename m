From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] TLV fields for radiotap
Date: Tue, 20 Nov 2018 21:09:39 +0100
Message-ID: <81658b7a400e6189c55587c8276d5555b6fe37f0.camel@sipsolutions.net>
References: <1531126034.3298.18.camel@sipsolutions.net>
	 <1536063298.3940.12.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1536063298.3940.12.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2018-09-04 at 14:14 +0200, Johannes Berg wrote:
> On Mon, 2018-07-09 at 10:47 +0200, Johannes Berg wrote:
> > Since there were no comments, let's make this more formal. Any
> > objections now?
> 
> Does this look like a good idea/compromise?
> 
> It's hard to do an entirely new version, then at least in Linux we'd
> probably have to be able to switch versions on the fly for some time,
> which is awkward ... but OTOH this feels a bit hackish.
> 
> No comments at all? :)

*crickets*

I guess I'll propose this more formally, since nobody really seems to
have any thoughts on the matter and parsing radiotap is notoriously
difficult :-)

FWIW, especially with vendor fields, there's a problem today: these
always come more or less last, so you have to understand all bits before
them. This is also true for radiotap, but due to sequential allocation,
if you care about a certain field today, your software is guaranteed to
be able to read it in the future too. If your software cares about a
vendor radiotap field, that's not true since other new standard fields
may be inserted before it...

Speak up now if you do think it's a bad idea ;-)

johannes
