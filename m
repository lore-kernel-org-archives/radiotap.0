From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] MCS extension
Date: Thu, 27 Jan 2011 14:09:45 +0100
Message-ID: <1296133785.3622.34.camel@jlt3.sipsolutions.net>
References: <1292694998.3653.33.camel@jlt3.sipsolutions.net>
	 <1295604481.3831.1.camel@jlt3.sipsolutions.net>
	 <20110121164137.GD24244@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20110121164137.GD24244-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, 2011-01-21 at 10:41 -0600, David Young wrote:
> On Fri, Jan 21, 2011 at 11:08:01AM +0100, Johannes Berg wrote:
> > On Sat, 2010-12-18 at 18:56 +0100, Johannes Berg wrote:
> > > This is a request for adoption of a new version of the MCS extension.
> > > I've split out the aMPDU extension since that seems more natural.
> > > 
> > > The MCS extension allows giving MCS information about a frame.
> > 
> > Any notes on this? Nobody objecting to the split between MCS and a-MPDU
> > that I now did? :-)
> 
> Thanks for the reminder.  Radiotap emails keep slipping over my email
> horizon. :-/
> 
> Looks good to me.  Thanks for doing this.

Thanks for looking, I got behind too. I've made the corresponding wiki
change now, and will go ahead and submit the patches I'd done.

Thanks! A-MPDU is next, and maybe those TX flags and retry things.

johannes
