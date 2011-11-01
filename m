From: Wojciech Dubowik <Wojciech.Dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC] MCS Field: STBC flag
Date: Tue, 1 Nov 2011 09:34:10 +0000 (UTC)
Message-ID: <loom.20111101T094927-66@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hello,
  I have been doing some testing with STBC and I have noticed that it's not
available in radiotap fields.
We could add new flag to MCS field to support it:

...
0x08 | HT format
0x10 | FEC type 
0x20 | STBC

...
0x08 | HT format - 0: mixed, 1: greenfield
0x10 | FEC type - 0: BCC, 1: LDPC 
0x20 | STBC - 0: OFF, 1: ON

I have done already implementation for wireshark, mac80211 and ath9k. I haven't
tested it for other cards since I don't have one which supports STBC.

Here is proposed patch for radiotap in mac80211. I could send the rest if this
new flag definition is ok.

Wojtek

---
diff --git a/include/net/ieee80211_radiotap.h b/include/net/ieee80211_radiotap.h
index 7e2c4d4..31837d7 100644
--- a/include/net/ieee80211_radiotap.h
+++ b/include/net/ieee80211_radiotap.h
@@ -260,6 +260,7 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_HAVE_GI		0x04
 #define IEEE80211_RADIOTAP_MCS_HAVE_FMT		0x08
 #define IEEE80211_RADIOTAP_MCS_HAVE_FEC		0x10
+#define IEEE80211_RADIOTAP_MCS_HAVE_STBC	0x20
 
 #define IEEE80211_RADIOTAP_MCS_BW_MASK		0x03
 #define		IEEE80211_RADIOTAP_MCS_BW_20	0
@@ -269,7 +270,7 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_SGI		0x04
 #define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
-
+#define IEEE80211_RADIOTAP_MCS_STBC		0x20
 
 /* Ugly macro to convert literal channel numbers into their mhz equivalents
  * There are certianly some conditions that will break this (like feeding it '30')
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index dc1123a..0207210 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -671,6 +671,7 @@ enum mac80211_rx_flags {
 	RX_FLAG_HT		= 1<<9,
 	RX_FLAG_40MHZ		= 1<<10,
 	RX_FLAG_SHORT_GI	= 1<<11,
+	RX_FLAG_STBC		= 1<<12,
 };
 
 /**
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index b867bd5..358dbfe 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -199,12 +199,15 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local
*local,
 		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_MCS);
 		*pos++ = IEEE80211_RADIOTAP_MCS_HAVE_MCS |
 			 IEEE80211_RADIOTAP_MCS_HAVE_GI |
-			 IEEE80211_RADIOTAP_MCS_HAVE_BW;
+			 IEEE80211_RADIOTAP_MCS_HAVE_BW |
+			 IEEE80211_RADIOTAP_MCS_HAVE_STBC;
 		*pos = 0;
 		if (status->flag & RX_FLAG_SHORT_GI)
 			*pos |= IEEE80211_RADIOTAP_MCS_SGI;
 		if (status->flag & RX_FLAG_40MHZ)
 			*pos |= IEEE80211_RADIOTAP_MCS_BW_40;
+		if (status->flag & RX_FLAG_STBC)
+			*pos |= IEEE80211_RADIOTAP_MCS_STBC;
 		pos++;
 		*pos++ = status->rate_idx;
 	}
---
