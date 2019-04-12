From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Fri, 12 Apr 2019 19:15:56 +0200
Message-ID: <f0a64bb751b8c601f58130a7f3a3158d70f18f63.camel@sipsolutions.net>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
	 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
	 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
	 <20190410234555.GO25552@nataraja>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190410234555.GO25552@nataraja>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>
Cc: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, 2019-04-11 at 01:45 +0200, Harald Welte wrote:
> Hi Johannes,
> 
> On Wed, Apr 10, 2019 at 09:23:13AM +0200, Johannes Berg wrote:
> > > but unfortunately, nobody has invested time into this (yet?).
> > 
> > 2012! 
> 
> Well, Osmocom is a very small community, with probably somewhere less than
> 25 active developers over the last few years (less than 15 full-time),
> with an *incredibly* large scope:  Implement virtually any protocol
> layer of any protocol stack on any of the 3GPP interfaces and all their
> related network elements for 2G/3G as well as even other technologies
> like TETRA, GMR-1, ...
> 
> And all that in a field of technology that has less free software than
> the Operating Systems world had in the mid-1990ies.  It really feels a
> bit like the Linux community 20 years ago.
> 
> So resources are always *extremely* tight, and given those limited
> resources, I'm actually very happy with the results by now, having
> automatied CI, build verifications, unit tests, functional test suites,
> end-to-end testing, and all the code we implemented on git.osmocom.org :)

:-)
Sure, I get it. Just a bit surprised I guess.

> While current GSMTAPv2 is ugly, it works rather solid for all known
> existing use cases, so there was no urgency to introduce a new version
> of it.

OK.

> > Not sure I get this, but I also don't really care all that much. 
> 
> Well, with all respect, GSMTAP was created for a variety of use cases,
> see my other lengthy mail.  It's fine if you don't care, but unless you
> could explain your use cases with a few paragraphs, neither you nor us
> are able to determine if there is common functionality and if it makes
> sense to use GSMTAP or not :)

Agree. Sorry about that. No disrespect was intended, but I'm still not
sure I understand the need for UDP encapsulation *as part of the
protocol*. I guess saying "GSMTAP can optionally be encapsulated in UDP
with the well-known port xyz" would be something else, and it'd make
more sense to me than saying it has to be.

> So far I have not seen any explanation about what kind of data you want
> to encapsulate at all.

Right, see my other mail(s) from today as well. Basically the IP frame
that we're actually sending, and then attaching to that the "session" or
"mux id" that it's being sent on. Sorry, I probably also don't know the
right term - those show up in the drivers now.

> > just a pretty strange design if the kernel were to output this, I'm not
> > even sure how I'd do that properly. I don't want to be generating UDP
> > packets there...
> 
> There are well-established APIs for having sockets in the kernel and for
> generating + receiving UDP packets from it.  NFS has been doing this for
> decades, as do various kernel-side tunneling helpers including the GTP
> kernel module.
> 
> I'm not saying it's the right approach for your problem, I'm just saying
> kernel-side code can for sure use UDP sockets.

Of course it *can*. But I don't think it makes *sense*. The key feature
here isn't communicating with somebody else (unlike NFS, GTP, GENEVE and
whatever other protocol they have). In fact, you shouldn't really care
about the communication part per se at all, I'd think.

> Sure, that works.  But the real question is, to me:  Are there common
> GSMTAP payload types that both the existing GSMTAP users carry, as well
> as what you would want to carry?  If yes, then it makes sense to think
> about a common encapsulation like GSMTAP.  If the payload types differ,
> then it seems rather like there are two distinct use cases that
> wouldn't benefit from standardizing on one format.

Agree, and I don't really know.

Maybe I should start differently. Do you have an example GSMTAP capture
file that I could look at in wireshark? Yes, I see you've pointed out
how I can get all the software running, but if you have a file already
that's almost certainly faster :-)

And then the question I'd want answer is this: If there's an IP frame
that I send to the modem from the application using a regular UDP or TCP
socket, what would the corresponding GSMTAP capture look like? Surely it
includes the IP frame in some way?!

If the answer to that question is yes, then I think there is some
overlap, because you can always imagine the modem receiving an IP frame
and telling you more about how it was encapsulated over the air, no?
Mind, most if not all modems probably don't actually do that today, but
I wonder how much of that is because of lack of infrastructure to do it,
vs. it just not being necessary - since I've been told that the modems
do in fact often output tracing that contains information about this.
Just not directly combined with the IP frame.

johannes
