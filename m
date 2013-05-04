From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Patch for radiotap library
Date: Sat, 04 May 2013 08:22:05 +0200
Message-ID: <5184A90D.4080205@rempel-privat.de>
References: <1367527479.11375.19.camel@jlt4.sipsolutions.net> <1367610836-3303-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040800000308070105090202"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1367610836-3303-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
Cc: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

This is a multi-part message in MIME format.
--------------040800000308070105090202
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.05.2013 21:53, schrieb Oleksij Rempel:
> Here are two series of patches. First are kernel patches
> and ath9k driver patch.
> Second, is patch for tcpdump.
>
> All of them was tested for 1,2 and 3 stream scenarious.
> Sinse i do not have hardware which can recive more than 1 STBC
> stream, i did some hacks to to produce this kind of captures.
>
> Oleksij Rempel (3):
>    mac80211: add STBC flag for radiotap
>    ath9k: remove useless flag conversation.
>    ath9k: check for Rx-STBC flag and pass it to ieee80211

One more patch for radiotap lib.

-- 
Regards,
Oleksij

--------------040800000308070105090202
Content-Type: text/x-patch;
 name="0001-radiotap-add-STBC-Rx-fields.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-radiotap-add-STBC-Rx-fields.patch"

>From cf3cea707b5766d822ae595cc75849efa78cdb1e Mon Sep 17 00:00:00 2001
From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Date: Sat, 4 May 2013 08:19:07 +0200
Subject: [PATCH] radiotap: add STBC Rx fields.

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 radiotap.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/radiotap.h b/radiotap.h
index a566024..2538433 100644
--- a/radiotap.h
+++ b/radiotap.h
@@ -267,6 +267,7 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_HAVE_GI		0x04
 #define IEEE80211_RADIOTAP_MCS_HAVE_FMT		0x08
 #define IEEE80211_RADIOTAP_MCS_HAVE_FEC		0x10
+#define IEEE80211_RADIOTAP_MCS_HAVE_STBC	0x20
 
 #define IEEE80211_RADIOTAP_MCS_BW_MASK		0x03
 #define		IEEE80211_RADIOTAP_MCS_BW_20	0
@@ -276,5 +277,10 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_SGI		0x04
 #define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
+#define IEEE80211_RADIOTAP_MCS_STBC_MASK	0x60
+#define		IEEE80211_RADIOTAP_MCS_STBC_1	1
+#define		IEEE80211_RADIOTAP_MCS_STBC_2	2
+#define		IEEE80211_RADIOTAP_MCS_STBC_3	3
+#define IEEE80211_RADIOTAP_MCS_STBC_SHIFT	5
 
 #endif				/* IEEE80211_RADIOTAP_H */
-- 
1.8.1.2


--------------040800000308070105090202--
