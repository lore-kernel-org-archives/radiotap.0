From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: crypto flag?
Date: Wed, 07 Dec 2011 22:07:49 +0100
Message-ID: <1323292069.3404.52.camel@jlt3.sipsolutions.net>
References: <1323283809.3404.49.camel@jlt3.sipsolutions.net>
	 <6561D89F-D6B0-47B6-9DCC-ABDC3BAD9452@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <6561D89F-D6B0-47B6-9DCC-ABDC3BAD9452-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, 2011-12-07 at 11:47 -0800, Guy Harris wrote:
> On Dec 7, 2011, at 10:50 AM, Johannes Berg wrote:
> 
> > What would you think about a radiotap flag that tells wireshark what
> > happened in the packet?
> 
> Other than saying "that tells the program reading the file what
> happened in the packet" - this shouldn't be thought of as
> Wireshark-specific - a flag of that sort makes sense; if there's some
> information that is necessary or every very helpful when processing a
> file, and the program that generates the file knows that information,
> the ideal is to have that information stored in the file somewhere
> that allows programs reading the file to get it.

Yes, you're right, it's not wireshark specific. I think that we know
this information when generating, and if not we can leave it out.

I think it'd have to be something like

name: crypto flags
bit number: xxx
structure: u8
unit: bitmap

0x01: IV present
0x02: frame encrypted
...

come to think of it, we could record a bit more info about crypto I
guess, at least in the case where we actually have keys (which happens
if you record on the same machine that is doing something)

I'll think about this a bit more to see if there's something else we can
record.

johannes
