From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HT extensions
Date: Tue, 05 Oct 2010 20:27:43 +0200
Message-ID: <1286303263.3641.23.camel@jlt3.sipsolutions.net>
References: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
	 <20101005182108.GH14183@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20101005182108.GH14183-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2010-10-05 at 13:21 -0500, David Young wrote:

> > The "known" field indicates which flags are known:
> > 
> > 0x01: bandwidth
> > 0x02: MCS index known (in `mcs` part of the field)
> > 0x04: guard interval
> > 0x08: HT format
> > 0x10: FEC type
> > 0x20: a-MPDU status
> > 0x40: a-MPDU beginning/end
> > 0x80: reserved
> > 
> > The `flags` is any combination of the following:
> > 0x03: bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
> > 0x04: short GI
> > 0x08: 0: mixed, 1: greenfield
> > 0x10: 0: BCC, 1: LDPC
> > 0x20: a-MPDU status - 0: not part of an a-MPDU, 1: part of a-MPDU
> > 0x40: 0: first frame, 1: last frame
> > 0x80: reserved
> 
> Suggestion for clarity: name each of the flags in the "flags" field, and
> in the definition of the "known" field, indicate corresponding flags by
> name.

Yes, that'd help, good plan, I'll make some wiki edits and resend.

> How can an application use the first/last-frame information?

Well, right now my wireshark patch is simply displaying it, but it could
also link up frames of an a-MPDU so you can jump between them, and with
this it can know what the framing was. If you just know a frame was part
of an aMPDU you won't know which one, this should help.

johannes
