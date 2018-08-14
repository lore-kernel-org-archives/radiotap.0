From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] 0-length PSDU reporting
Date: Tue, 14 Aug 2018 10:30:04 +0200
Message-ID: <1534235404.3547.10.camel@sipsolutions.net>
References: <1529332670.3490.50.camel@sipsolutions.net>
	 <1531125042.3298.5.camel@sipsolutions.net>
	 <AEBBAD8F-A779-4E0A-B40D-659D55DFE847@alum.mit.edu>
	 <1534156537.3093.7.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1534156537.3093.7.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2018-08-13 at 12:35 +0200, Johannes Berg wrote:

> Yes, one case for example is when you know the packet metadata because
> you received it, but were unable to capture the data because it was a
> multi-user transmission to a different user, or because it was a multi-
> user transmission with more streams than you have RX chains, e.g. In
> this case I'm not even sure you know the real length of the packet, to
> be able to indicate it in the "Original Packet Length" field.
> 
> Additionally, I'm not sure it's possible to indicate an "Original Length
> Field" all the way through from the kernel while capturing, I believe
> only tcpdump/etc. will set this to long than the data frame from the
> kernel when they explicitly truncate data.

To clarify - I think this field will also be used (and I think that
should be valid) when you have a PPDU that did carry a PSDU, but you
don't know its length, and thus report

  frame length == captured length == radiotap header length.

Like I said, I don't currently see a way to - at least on Linux - report
frame length > captured length. Looking at libpcap's pcap-linux.c, we
see

        caplen = packet_len;
        if (caplen > handle->snapshot)
                caplen = handle->snapshot;

We do get packet_len as recvmsg(..., MSG_TRUNC), but inside the kernel
we cannot represent a message as simply not having the data and getting
truncated even without MSG_TRUNC, so that we can't actually get out of
recvmsg() with a packet_len bigger than the in-kernel buffer.

Guy, does that address your question sufficiently?

johannes
