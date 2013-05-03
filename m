From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH] tcpdump: add STBC Rx support
Date: Fri,  3 May 2013 21:53:56 +0200
Message-ID: <1367610836-3303-5-git-send-email-linux__5754.06395732916$1367610867$gmane$org@rempel-privat.de>
References: <1367527479.11375.19.camel@jlt4.sipsolutions.net>
 <1367610836-3303-1-git-send-email-linux@rempel-privat.de>
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1367610836-3303-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: radiotap@radiotap.org

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 ieee802_11_radio.h | 6 ++++++
 print-802_11.c     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/ieee802_11_radio.h b/ieee802_11_radio.h
index 5aff137..65c25df 100644
--- a/ieee802_11_radio.h
+++ b/ieee802_11_radio.h
@@ -277,6 +277,7 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_GUARD_INTERVAL_KNOWN	0x04
 #define IEEE80211_RADIOTAP_MCS_HT_FORMAT_KNOWN		0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_TYPE_KNOWN		0x10
+#define IEEE80211_RADIOTAP_MCS_STBC_KNOWN		0x20
 
 /* For IEEE80211_RADIOTAP_MCS flags */
 #define IEEE80211_RADIOTAP_MCS_BANDWIDTH_MASK	0x03
@@ -287,5 +288,10 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_SHORT_GI		0x04 /* short guard interval */
 #define IEEE80211_RADIOTAP_MCS_HT_GREENFIELD	0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
+#define IEEE80211_RADIOTAP_MCS_STBC_MASK	0x60
+#define		IEEE80211_RADIOTAP_MCS_STBC_1	1
+#define		IEEE80211_RADIOTAP_MCS_STBC_2	2
+#define		IEEE80211_RADIOTAP_MCS_STBC_3	3
+#define IEEE80211_RADIOTAP_MCS_STBC_SHIFT	5
 
 #endif /* _NET_IF_IEEE80211RADIOTAP_H_ */
diff --git a/print-802_11.c b/print-802_11.c
index 97badb9..5f65752 100644
--- a/print-802_11.c
+++ b/print-802_11.c
@@ -2184,6 +2184,11 @@ print_radiotap_field(struct cpack_state *s, u_int32_t bit, u_int8_t *flags,
 				(u2.u8 & IEEE80211_RADIOTAP_MCS_FEC_LDPC) ?
 				"LDPC" : "BCC");
 		}
+		if (u.u8 & IEEE80211_RADIOTAP_MCS_STBC_KNOWN) {
+			printf("RX-STBC%u ",
+				(u2.u8 & IEEE80211_RADIOTAP_MCS_STBC_MASK) >> IEEE80211_RADIOTAP_MCS_STBC_SHIFT);
+		}
+	
 		break;
 		}
 	}
-- 
1.8.1.2
