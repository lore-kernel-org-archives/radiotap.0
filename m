From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [RFA] 0-length PSDU reporting
Date: Wed, 8 Aug 2018 18:53:29 -0700
Message-ID: <AEBBAD8F-A779-4E0A-B40D-659D55DFE847@alum.mit.edu>
References: <1529332670.3490.50.camel@sipsolutions.net>
 <1531125042.3298.5.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1531125042.3298.5.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Jul 9, 2018, at 1:30 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:

> The presence of this field indicates that there was no PSDU in or
> captured for this PPDU, only the PHY data is valid and the radiotap
> header is not followed by an 802.11 header.

Would the lack of any packet data, according to the appropriate packet =
length field (length field in the pcap per-packet header, Original =
Packet Length field in pcapng packet blocks, etc.), i.e. the packet =
length and the radiotap header length are equal, be sufficient to =
indicate that?

If so, should this be renamed to "0-length PSDU type"; if absent, the =
packet is a 0-length PSDU of unknown type?

Or could some 802.11 chip, when running in monitor mode, provide a =
packet with radio information and no 802.11 header or data on certain =
radio-layer error conditions?  If so, that means that an explicit =
indication is required.
