From: freeman <freeman.wang-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: limit radiotap header size
Date: Tue, 16 Sep 2014 17:01:30 +0000 (UTC)
Message-ID: <loom.20140916T185055-769@post.gmane.org>
References: <loom.20140915T220101-881@post.gmane.org> <1410869888.2335.6.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Johannes Berg <johannes@...> writes:

> 
> On Mon, 2014-09-15 at 20:10 +0000, freeman wrote:
> 
> > Linux latest kernel (3.16) doc says there are only 13 argument options now.
> > Is it still true?
> 
> Where does it say that? I don't think there's any size limit on the
> radiotap header since multiple things could show up multiple times etc.
> and with the vendor namespace you could carry all kinds of other things.
> 
> > If we are concerned about the size of radiotap header and want to limit the
> > set of info we pass to the sniffer, can we arbitrarily remove any arguments
> > from the bitmap? I know it is probably designed so, just want to double
check :)
> 
> Not really, no, you'd have to adjust the rest of the header as well,
> basically parse and recreate it. Why would you want to anyway though?
> 
> johannes
> 
> 

Johannes

Thanks for the help.
It seems this kernel doc needs some update
http://lxr.free-electrons.com/source/Documentation/networking/radiotap-headers.txt

I think I was not clear in last email. If we have a tiny firmware to
generate the radiotap header for received packets, and we have limited RAM,
it might look attractive to only create a trimmed version radiotap header to
the sniffer application. 

Given the design of the bitmap in the fixed header, I guess it allows us to
only include a subset of all arguments, although it is always better to have
more info sent up. So in memory constrained systems, how much freedom we
have in creating radiotap headers?

My dream is that a user application can send a 32bit bitmap to the device
driver as a bitmask and the device only sends up those arguments enabled by
the mask.

Thanks
Freeman
 
