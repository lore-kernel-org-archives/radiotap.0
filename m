From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: TSFT
Date: Fri, 16 Nov 2012 22:26:31 -0800
Message-ID: <50A72E17.6070207@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Cc: thomas-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

This is the current definition of TSFT:

"Value in microseconds of the MAC's 64-bit 802.11 Time Synchronization 
Function timer when the first bit of the MPDU arrived at the MAC. For 
received frames only."

My experience with TSFT is with Atheros cards, which record the 
timestamp at the end of the frame, not the start.

Do you know the behaivour of any particular capture systems re: TSFT - 
where do they timestamp the frame?

Furthermore for DSSS/CCK the definition above is reasonable, but for 
OFDM and HT (802.11n) the SIGNAL field (part of the PLCP header, not 
part of the MPDU) is part of the first data symbol. It would be much 
clearer to change the definition to state that the timestamp is at the 
start of this first SIGNAL/data symbol. Any objections to doing this, or 
preference to change the reference point to a different part of the frame?

In my wireshark patch I've added options to interpret TSFT as the start 
of end of the frame.

Simon
