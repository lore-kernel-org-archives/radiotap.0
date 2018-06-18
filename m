From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFC] 0-length PPDU reporting
Date: Mon, 18 Jun 2018 16:37:50 +0200
Message-ID: <1529332670.3490.50.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

With HE in particular, but also previously, there are PPDUs that don't
carry any MAC header, for example sounding frames.

It seems useful to report these up, but they cause wireshark to display
an error since it's expecting to be able to decode the remainder of the
data after radiotap as an 802.11 frame.

To fix that, and to be able to show the type of PPDU, I think we should
add a new field, that contains just a 16-bit value (or 8? or even 32
since we often need more alignment anyway?) indicating the type of 0-
length PPDU.

Does anyone happen to have a more comprehensive list of PPDUs that are
like this?

johannes
