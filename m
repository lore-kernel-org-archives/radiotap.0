From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: TSFT
Date: Sat, 17 Nov 2012 11:46:00 -0600
Message-ID: <20121117174600.GQ21779@pixotech.com>
References: <50A72E17.6070207@superduper.net>
 <20121117064848.GO21779@pixotech.com>
 <1353141950.9543.3.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353141950.9543.3.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Sat, Nov 17, 2012 at 09:45:50AM +0100, Johannes Berg wrote:
> On Sat, 2012-11-17 at 00:48 -0600, David Young wrote:
> > On Fri, Nov 16, 2012 at 10:26:31PM -0800, Simon Barber wrote:
> > > In my wireshark patch I've added options to interpret TSFT as the
> > > start of end of the frame.
> > 
> > I think we need 1) a methodology for an author to identify their
> > device's reference point so that they can calibrate their driver to the
> > standard and/or 2) a radiotap datum that identifies the reference point
> > in use or 3) something entirely different.
> 
> FWIW, for the Atheros drivers we *just* added (1) to the Linux kernel,
> but for radiotap output we calculate the difference to the start of the
> frame, see here:
> 
> http://git.kernel.org/?p=linux/kernel/git/jberg/mac80211-next.git;a=commit;h=f4bda337bbb6e245e2a07f344990adeb6a70ff35
> 
> (the patches for the drivers are separate, but simply change the _START
> flag to _END)

Adjusting the NIC's TSFT in this way, so that the radiotap reference
point is according to spec, sounds right to me.

> I have no objections to (also) allowing this information to be in
> radiotap though, but I'm not sure we want to?

Given that the adjustment is easy, I'm pretty sure we should not waste
radiotap header space to describe the TSFT.

Wireshark doesn't already have more than two "interpretation modes" for
radiotap headers, does it?  That would be too bad.  I realize that there
may be already be a mode for a particular OS....

Dave

-- 
David Young
dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org    Urbana, IL    (217) 721-9981
