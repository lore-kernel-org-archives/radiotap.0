From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH] add MCS_STBC and MCS_NESS fields
Date: Fri, 17 May 2013 09:00:10 +0200
Message-ID: <1368774010-5864-1-git-send-email-linux@rempel-privat.de>
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org, radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: radiotap@radiotap.org

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 radiotap.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/radiotap.h b/radiotap.h
index a566024..37d7630 100644
--- a/radiotap.h
+++ b/radiotap.h
@@ -267,6 +267,10 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_HAVE_GI		0x04
 #define IEEE80211_RADIOTAP_MCS_HAVE_FMT		0x08
 #define IEEE80211_RADIOTAP_MCS_HAVE_FEC		0x10
+#define IEEE80211_RADIOTAP_MCS_HAVE_STBC	0x20
+#define IEEE80211_RADIOTAP_MCS_HAVE_NESS	0x40
+#define IEEE80211_RADIOTAP_MCS_NESS_BIT1	0x80
+
 
 #define IEEE80211_RADIOTAP_MCS_BW_MASK		0x03
 #define		IEEE80211_RADIOTAP_MCS_BW_20	0
@@ -276,5 +280,11 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_SGI		0x04
 #define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
+#define IEEE80211_RADIOTAP_MCS_STBC_MASK	0x60
+#define IEEE80211_RADIOTAP_MCS_STBC_SHIFT	5
+#define		IEEE80211_RADIOTAP_MCS_STBC_1	1
+#define		IEEE80211_RADIOTAP_MCS_STBC_2	2
+#define		IEEE80211_RADIOTAP_MCS_STBC_3	3
+#define IEEE80211_RADIOTAP_MCS_NESS_BIT0	0x80
 
 #endif				/* IEEE80211_RADIOTAP_H */
-- 
1.8.1.2
