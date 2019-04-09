From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: gsmtap design/extensions?
Date: Tue, 09 Apr 2019 15:50:45 +0200
Message-ID: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org, openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn-yOkvZcmFvRU@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

As I'm looking into adding a generic cell modem framework to the linux
kernel (to create session netdevs etc.), I started looking for a
metadata encapsulation, a la Radiotap (I'm a wifi guy :-) ).

So obviously, I found gsmtap, but for my use case it doesn't really
address most of the interesting data, and it got me wondering. So a few
questions, if I may:

1) Why the design with encapsulating it in UDP? Radiotap is just a raw
   header without IP etc. in front, and you use it with tcpdump,
   wireshark or similar tools on the local system. What's the value in
   having something "network transparent"?

2) The format of gsmtap doesn't seem very extensible, but I guess a new
   version could be made that has a TLV-based format or so. I'd have
   argued that a new version isn't even needed, but the length field is
   only 8 bits right now which seems too short.

(speaking of versions - the docs say "version, set to 0x01 currently"
but "#define GSMTAP_VERSION 0x02")

3) Does the packet data follow the gsmtap header? It's not really clear
   to me based on reading the wireshark code.


In particular, the data I'm thinking of is higher-level things, like the
session ID for a frame when it's going through the kernel, or perhaps a
flow label on RX, etc.

Also, vendor-specific data would be useful, e.g. to encapsulate the
device-specific headers like QMI, where such metadata is encapsulated in
a vendor- or device-specific way, which you'd want to see for debugging
certain things, but for other things the generic "session ID" type
information - encoded in a vendor-agnostic way - would be better to show
in wireshark.


Since it doesn't seem possible to use gsmtap in the current version,
would it make sense to define a new gsmtap that (say) has version 3 or
something, followed by an overall length and TLVs? I do note that this
wouldn't be compatible with the current wireshark code as it doesn't
check the version, just shows it...

Or would it make more sense to define a new ARPHDR_WWANTAP like
ARPHDR_IEEE80211_RADIOTAP and just use that instead of encapsulating in
IP/UDP, and then have a completely new (extensible) protocol inside of
that? I'm not really sure I see the point of UDP encapsulation anyway.

Thanks,
johannes
