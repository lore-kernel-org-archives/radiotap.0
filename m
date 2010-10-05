From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] HT extensions
Date: Tue, 5 Oct 2010 13:42:52 -0500
Message-ID: <20101005184252.GI14183@ojctech.com>
References: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
 <20101005182108.GH14183@ojctech.com>
 <1286303263.3641.23.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1286303263.3641.23.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Oct 05, 2010 at 08:27:43PM +0200, Johannes Berg wrote:
> On Tue, 2010-10-05 at 13:21 -0500, David Young wrote:
> > How can an application use the first/last-frame information?
> 
> Well, right now my wireshark patch is simply displaying it, but it could
> also link up frames of an a-MPDU so you can jump between them, and with
> this it can know what the framing was. If you just know a frame was part
> of an aMPDU you won't know which one, this should help.

I have my doubts about that.  How do you distinguish the case where the
NIC gives you the first MPDU of A-MPDU 1 and the last MPDU of A-MPDU 2
from the case where the NIC gives you the first and last MPDU of the
same A-MPDU?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
