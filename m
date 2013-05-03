From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH 3/3] ath9k: check for Rx-STBC flag and pass it to ieee80211
Date: Fri,  3 May 2013 21:53:55 +0200
Message-ID: <1367610836-3303-4-git-send-email-linux__20272.8971526541$1367614853$gmane$org@rempel-privat.de>
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
 drivers/net/wireless/ath/ath9k/mac.c | 5 +++++
 drivers/net/wireless/ath/ath9k/mac.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/mac.c b/drivers/net/wireless/ath/ath9k/mac.c
index a52081d..d055e38 100644
--- a/drivers/net/wireless/ath/ath9k/mac.c
+++ b/drivers/net/wireless/ath/ath9k/mac.c
@@ -593,6 +593,11 @@ int ath9k_hw_rxprocdesc(struct ath_hw *ah, struct ath_desc *ds,
 		(ads.ds_rxstatus3 & AR_GI) ? RX_FLAG_SHORT_GI : 0;
 	rs->flag |=
 		(ads.ds_rxstatus3 & AR_2040) ? RX_FLAG_40MHZ : 0;
+	if (AR_SREV_9280_20_OR_LATER(ah))
+		rs->flag |=
+			(ads.ds_rxstatus3 & AR_STBC) ?
+				/* we can only Nss=1 STBC */
+				(1 << RX_FLAG_STBC_SHIFT) : 0;
 
 	if (ads.ds_rxstatus8 & AR_PreDelimCRCErr)
 		rs->rs_flags |= ATH9K_RX_DELIM_CRC_PRE;
diff --git a/drivers/net/wireless/ath/ath9k/mac.h b/drivers/net/wireless/ath/ath9k/mac.h
index 3f1e775..b02dfce 100644
--- a/drivers/net/wireless/ath/ath9k/mac.h
+++ b/drivers/net/wireless/ath/ath9k/mac.h
@@ -534,7 +534,8 @@ struct ar5416_desc {
 #define AR_2040             0x00000002
 #define AR_Parallel40       0x00000004
 #define AR_Parallel40_S     2
-#define AR_RxStatusRsvd30   0x000000f8
+#define AR_STBC             0x00000008 /* on ar9280 and later */
+#define AR_RxStatusRsvd30   0x000000f0
 #define AR_RxAntenna	    0xffffff00
 #define AR_RxAntenna_S	    8
 
-- 
1.8.1.2
