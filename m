From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] HT extensions
Date: Tue, 5 Oct 2010 13:21:08 -0500
Message-ID: <20101005182108.GH14183@ojctech.com>
References: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284595489.3707.54.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Sep 16, 2010 at 02:04:49AM +0200, Johannes Berg wrote:
> This is a request for adoption of the MCS/HT information we've talked
> about earlier, based on my second proposal that includes valid bits
> within the field.
> 
> This proposal adds the following new field:
> 
> Bit Number: 19
> Structure: u8 known, u8 flags, u8 mcs
> Required Alignment: 1
> 
> The "mcs" field indicates the MCS rate index as in IEEE_802.11n-2009.
> 
> The "known" field indicates which flags are known:
> 
> 0x01: bandwidth
> 0x02: MCS index known (in `mcs` part of the field)
> 0x04: guard interval
> 0x08: HT format
> 0x10: FEC type
> 0x20: a-MPDU status
> 0x40: a-MPDU beginning/end
> 0x80: reserved
> 
> The `flags` is any combination of the following:
> 0x03: bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
> 0x04: short GI
> 0x08: 0: mixed, 1: greenfield
> 0x10: 0: BCC, 1: LDPC
> 0x20: a-MPDU status - 0: not part of an a-MPDU, 1: part of a-MPDU
> 0x40: 0: first frame, 1: last frame
> 0x80: reserved

Suggestion for clarity: name each of the flags in the "flags" field, and
in the definition of the "known" field, indicate corresponding flags by
name.

How can an application use the first/last-frame information?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
