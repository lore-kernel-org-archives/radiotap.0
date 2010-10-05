From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HT extensions
Date: Tue, 05 Oct 2010 20:50:16 +0200
Message-ID: <1286304616.3641.25.camel@jlt3.sipsolutions.net>
References: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
	 <20101005182108.GH14183@ojctech.com>
	 <1286303263.3641.23.camel@jlt3.sipsolutions.net>
	 <20101005184252.GI14183@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20101005184252.GI14183-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2010-10-05 at 13:42 -0500, David Young wrote:
> On Tue, Oct 05, 2010 at 08:27:43PM +0200, Johannes Berg wrote:
> > On Tue, 2010-10-05 at 13:21 -0500, David Young wrote:
> > > How can an application use the first/last-frame information?
> > 
> > Well, right now my wireshark patch is simply displaying it, but it could
> > also link up frames of an a-MPDU so you can jump between them, and with
> > this it can know what the framing was. If you just know a frame was part
> > of an aMPDU you won't know which one, this should help.
> 
> I have my doubts about that.  How do you distinguish the case where the
> NIC gives you the first MPDU of A-MPDU 1 and the last MPDU of A-MPDU 2
> from the case where the NIC gives you the first and last MPDU of the
> same A-MPDU?

You mean with imperfect capturing? Otherwise you should've seen the last
of A-MPDU 1 inbetween that, I'd think. But you're right, doing this
perfectly is quite hard, and I don't really have a good use case in mind
either. I'm happy to leave it off, at least for now, until somebody can
demonstrate a working way to convey this information.

johannes
