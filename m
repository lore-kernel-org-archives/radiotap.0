From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] 0-length PSDU reporting
Date: Mon, 13 Aug 2018 12:35:37 +0200
Message-ID: <1534156537.3093.7.camel@sipsolutions.net>
References: <1529332670.3490.50.camel@sipsolutions.net>
	 <1531125042.3298.5.camel@sipsolutions.net>
	 <AEBBAD8F-A779-4E0A-B40D-659D55DFE847@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <AEBBAD8F-A779-4E0A-B40D-659D55DFE847-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, 2018-08-08 at 18:53 -0700, Guy Harris wrote:
> On Jul 9, 2018, at 1:30 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> 
> > The presence of this field indicates that there was no PSDU in or
> > captured for this PPDU, only the PHY data is valid and the radiotap
> > header is not followed by an 802.11 header.
> 
> Would the lack of any packet data, according to the appropriate packet
> length field (length field in the pcap per-packet header, Original
> Packet Length field in pcapng packet blocks, etc.), i.e. the packet
> length and the radiotap header length are equal, be sufficient to
> indicate that?

I think it's not sufficient.

> If so, should this be renamed to "0-length PSDU type"; if absent, the
> packet is a 0-length PSDU of unknown type?
> 
> Or could some 802.11 chip, when running in monitor mode, provide a
> packet with radio information and no 802.11 header or data on certain
> radio-layer error conditions?  If so, that means that an explicit
> indication is required.

Yes, one case for example is when you know the packet metadata because
you received it, but were unable to capture the data because it was a
multi-user transmission to a different user, or because it was a multi-
user transmission with more streams than you have RX chains, e.g. In
this case I'm not even sure you know the real length of the packet, to
be able to indicate it in the "Original Packet Length" field.

Additionally, I'm not sure it's possible to indicate an "Original Length
Field" all the way through from the kernel while capturing, I believe
only tcpdump/etc. will set this to long than the data frame from the
kernel when they explicitly truncate data.

johannes
