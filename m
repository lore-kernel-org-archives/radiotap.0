From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: multi-antenna handling
Date: Mon, 20 Aug 2012 18:50:25 +0200
Message-ID: <1345481425.4459.46.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

This isn't really a proposal for a field definition, but more a usage
clarification that I'm seeking.

When we have multiple RX chains, it is often useful to know how much
power was received by each chain, and which chain(s) a frame was
received on.

Today, many drivers give the maximum power over all chains as a single
value, and some drivers give no antenna information while other drivers
(ab)use the (unitless) antenna index field (bit 11) as an antenna
bitmap.


I'm planning to modify this (in Linux) to include, where available,
antenna index & per-antenna signal information by duplicating the
radiotap namespace for each antenna, so that the header would, for
example, read as follows for a 3x3 devices:

 * ... TSF, Flags, Rate, Channel, ...
 * antenna signal: -40 dBm
 * antenna: 0
 * ... MCS, A-MPDU status, ...
 * antenna signal: -45 dBm
 * antenna: 1
 * antenna signal: -43 dBm
 * antenna: 2


Does this seem like sane behaviour? If so, do you think it would be
worthwhile describing it somewhere on the wiki?

johannes
