From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: TSFT
Date: Sat, 17 Nov 2012 19:43:49 +0100
Message-ID: <1353177829.9543.42.camel@jlt4.sipsolutions.net>
References: <50A72E17.6070207@superduper.net>
	 <20121117064848.GO21779@pixotech.com>
	 <1353141950.9543.3.camel@jlt4.sipsolutions.net>
	 <20121117174600.GQ21779@pixotech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20121117174600.GQ21779-Gq8g4XVd89tWk0Htik3J/w@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Sat, 2012-11-17 at 11:46 -0600, David Young wrote:

> > > > In my wireshark patch I've added options to interpret TSFT as the
> > > > start of end of the frame.

> Given that the adjustment is easy, I'm pretty sure we should not waste
> radiotap header space to describe the TSFT.
> 
> Wireshark doesn't already have more than two "interpretation modes" for
> radiotap headers, does it?  That would be too bad.  I realize that there
> may be already be a mode for a particular OS....

As I understood it, Simon is saying that he's adding one, but since he's
using Linux, which will have the adjustment in a matter of days, it
probably won't be necessary after all.

johannes
