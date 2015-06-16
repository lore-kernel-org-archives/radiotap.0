From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Format of a capture with multiple MPDUs from an A-MPDU?
Date: Tue, 16 Jun 2015 09:06:13 +0200
Message-ID: <1434438373.2337.5.camel@sipsolutions.net>
References: <7517A666-A4BD-44A5-9E5A-EEED0B55939A@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <7517A666-A4BD-44A5-9E5A-EEED0B55939A-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, radiotap <radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>
List-Id: radiotap@radiotap.org

On Mon, 2015-06-15 at 19:08 -0700, Guy Harris wrote:
> In Wireshark bug 11277:
> 
> 	https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=11277
> 
> somebody complained that a capture containing what I infer was a bunch
> of de-aggregated MPDUs from an A-MPDU wasn't dissected correctly
> because Wireshark didn't assume that the frame data following the
> radiotap header began with an MPDU delimiter of the sort described in
> 8.6.1 "A-MPDU format" in 802.11-2012.
> 
> Is the intent that a de-aggregated MPDU from an A-MPDU begin with a
> delimiter, or not?  If so, the Wireshark dissector needs to be fixed;
> if not, ns3 needs to be fixed.  In either case, the radiotap spec
> should probably indicate what the payload following the radiotap
> header should look like if the radiotap header has the A-MPDU status
> field, to prevent bugs of this sort (whatever sort that might be) from
> showing up in other software.

I certainly didn't intend to have it that way, and we've never generated
(or been able to) such a file in Linux.

The documentation (http://www.radiotap.org/defined-fields/A-MPDU%
20status) also states

"The presence of this field indicates that the frame was received as
part of an a-MPDU."

and I'd say that we meant this to mean that it's a normal frame like any
other.

Additionally, the A-MPDU status information has the ability to include
the delimiter CRC value, so there's no need to include the MPDU
delimiter since it (apart from the reserved bits being potentially set
by a confused transmitter) can be fully reconstructed using just the
length of the frame (known from the pcap - radiotap len or so) and the
CRC value.

I wouldn't even recommend using a reserved bit to indicate "MPDU
delimiter is present" since that will break all radiotap parsers that
are unable to understand that bit, which would be unfortunate. Such
metadata should, IMHO, be added to a radiotap field since the "contents"
of the frames is always assumed to start with an 802.11 header.

johannes
