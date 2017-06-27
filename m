From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Tue, 27 Jun 2017 15:41:58 +0200
Message-ID: <1498570918.13489.1.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
	 <1487162908.31885.1.camel@sipsolutions.net>
	 <1487764486.2215.5.camel@sipsolutions.net>
	 <1488266885.2388.0.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1488266885.2388.0.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2017-02-28 at 08:28 +0100, Johannes Berg wrote:
> On Wed, 2017-02-22 at 12:54 +0100, Johannes Berg wrote:
> > > 
> > 
> > Anyway, that proposal missed a number of things and didn't really
> > make any sense, here's a new one:
> > 
> > http://www.radiotap.org/fields/HE
> > http://www.radiotap.org/fields/HE-MU-common
> > http://www.radiotap.org/fields/HE-MU-user
> 
> FWIW, I've not pursued this further for now since the spec is still a
> moving target. I'm told HE-SIG-B is fairly stable, but HE-SIG-A is
> still a heavily contended topic (at least some parts of it)

In the meantime, I've come to the conclusion that it's a stupid idea to
encode the data like in HE-SIG-A, for multiple reasons:

1) the encoding heavily depends on the PPDU type (SU, ER SU, MU, TB),
and there's practically nothing common between them - this means
decoding has lots of special cases

2) the encoding is really really tight on bits, doing tricks like
DCM=STBC=1 to indicate a 5th possibility for the 2-bit LTF+GI field,
this also makes it awkward to decode again in tools like wireshark

3) TB PPDUs don't even contain the necessary rate data, it's given by
the trigger frame, so one would have to correlate that during encoding.
For pure sniffer mode, that may be necessary, but for some "monitor
while operating" modes, the real rate etc. would be available

(and there are probably more reasons)

I'm going on sabbatical soon, but I'll revisit this in September or
later to come up with a better proposal.

johannes
