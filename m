From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: limit radiotap header size
Date: Mon, 06 Oct 2014 16:20:11 +0200
Message-ID: <1412605211.3098.13.camel@jlt4.sipsolutions.net>
References: <loom.20140915T220101-881@post.gmane.org>
	 <1410869888.2335.6.camel@jlt4.sipsolutions.net>
	 <loom.20140916T185055-769@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <loom.20140916T185055-769-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: freeman <freeman.wang-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2014-09-16 at 17:01 +0000, freeman wrote:

> Thanks for the help.
> It seems this kernel doc needs some update
> http://lxr.free-electrons.com/source/Documentation/networking/radiotap-headers.txt

That should probably just point to www.radiotap.org :)

> I think I was not clear in last email. If we have a tiny firmware to
> generate the radiotap header for received packets, and we have limited RAM,
> it might look attractive to only create a trimmed version radiotap header to
> the sniffer application. 
> 
> Given the design of the bitmap in the fixed header, I guess it allows us to
> only include a subset of all arguments, although it is always better to have
> more info sent up. So in memory constrained systems, how much freedom we
> have in creating radiotap headers?

You can chose to include or not include any information that you want.
The minimal radiotap header has a zero bitmap and no information at all
- but it's also useless. The more data you include, the more useful it
becomes.

> My dream is that a user application can send a 32bit bitmap to the device
> driver as a bitmask and the device only sends up those arguments enabled by
> the mask.

There's no API to send such down. If you invent API to send such down,
then you can of course build the header limited.

However, many times the capturing and analysis are done as two separate
steps, with the analysis being after the fact on a different system
etc., so I'm not sure how useful that would be. For my purposes I'd try
to always enable the maximum amount of information...

johannes
