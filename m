From: Simon Wunderlich <simon.wunderlich-Y4E02TeZ33kaBlGTGt4zH4SGEyLTKazZ@public.gmane.org>
Subject: [PATCH] add channel fields for GSM, turbo, half and quarter rates
Date: Thu, 20 Jun 2013 11:58:15 +0200
Message-ID: <1371722295-4769-1-git-send-email-siwu@hrz.tu-chemnitz.de>
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Simon Wunderlich <siwu-MaAgPAbsBIVS8oHt8HbXEIQuADTiUCJX@public.gmane.org>
List-Id: radiotap@radiotap.org

Wireshark already implements these fields. As they are not yet taken
according to the official list, add them.

Signed-off-by: Simon Wunderlich <siwu-MaAgPAbsBIVS8oHt8HbXEIQuADTiUCJX@public.gmane.org>
---
 radiotap.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/radiotap.h b/radiotap.h
index 37d7630..1daa257 100644
--- a/radiotap.h
+++ b/radiotap.h
@@ -222,6 +222,10 @@ enum ieee80211_radiotap_type {
 #define	IEEE80211_CHAN_PASSIVE	0x0200	/* Only passive scan allowed */
 #define	IEEE80211_CHAN_DYN	0x0400	/* Dynamic CCK-OFDM channel */
 #define	IEEE80211_CHAN_GFSK	0x0800	/* GFSK channel (FHSS PHY) */
+#define	IEEE80211_CHAN_GSM	0x1000	/* GSM (900 MHz) */
+#define	IEEE80211_CHAN_STURBO	0x2000	/* Static Turbo */
+#define	IEEE80211_CHAN_HALF	0x4000	/* Half channel (10 MHz wide) */
+#define	IEEE80211_CHAN_QUARTER	0x8000	/* Quarter channel (5 MHz wide) */
 
 /* For IEEE80211_RADIOTAP_FLAGS */
 #define	IEEE80211_RADIOTAP_F_CFP	0x01	/* sent/received
-- 
1.7.10.4
