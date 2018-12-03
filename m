From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] HE addition: TB PPDU bandwidth
Date: Mon, 03 Dec 2018 15:14:46 +0100
Message-ID: <8f56ce73baa72725c01eecef8645595cfea71b2b.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

Trigger-based PPDUs have an additional bandwidth that determines the
spectral mask etc., I forgot those before but now we need to be able to
look at them in a sniffer.

Since we have a few (very few!) reserved bits, change the HE field as
follows:

data 6

0x00e0  (reserved)

to

0x0020  TB PPDU bandwidth known
0x00c0  TB PPDU bandwidth (bits 24/25 from HE-SIG-A1),
        0: 20 MHz, 1: 40 MHz, 2: 80 MHz, 3: 160 MHz/80+80 MHz


The existing bandwidth field captures only the bandwidth/RU allocation
of the data, which in this case would be the RU allocation for the
captured transmitter, not the bandwidth of the overall transmission(s).

johannes
