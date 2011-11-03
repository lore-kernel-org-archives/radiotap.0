From: Wojciech Dubowik <wojciech.dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] Add STBC rx flag to MCS field
Date: Thu, 03 Nov 2011 11:50:24 +0100 (CET)
Message-ID: <4073ad5f-c3e3-419f-98c0-0d0292a2589c@CHB500181>
References: <c5752a72-9cc4-4670-852c-b71960f98f81@CHB500181>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <c5752a72-9cc4-4670-852c-b71960f98f81@CHB500181>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hello,

Here is new proposal for MCS field extension with STBC flag.
Patches for wireshark, mac80211 and ath9k are below.
The proposal for MCS fields is not in wiki because it's
actually not a new field but extension to the existing one.

Wojtek


The new MCS field would look like:

**********************************
  MCS

Bit Number
    19 
Structure
    u8 known, u8 flags, u8 mcs 
Required Alignment
    1 

The mcs field indicates the MCS rate index as in IEEE_802.11n-2009

The known field indicates which information is known:
flag | definition
0x01 | bandwidth
0x02 | MCS index known (in mcs part of the field)
0x04 | guard interval 
0x08 | HT format
0x10 | FEC type 
0x20 | STBC
0xc0 | reserved

The flags field is any combination of the following:
flag | definition
0x03 | bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
0x04 | guard interval - 0: long GI, 1: short GI 
0x08 | HT format - 0: mixed, 1: greenfield
0x10 | FEC type - 0: BCC, 1: LDPC 
0x20 | STBC - 0: OFF, 1: ON
0xc0 | reserved

************************************

---
Index: epan/dissectors/packet-radiotap-defs.h
===================================================================
--- epan/dissectors/packet-radiotap-defs.h	(revision 39722)
+++ epan/dissectors/packet-radiotap-defs.h	(working copy)
@@ -258,6 +258,7 @@
 #define IEEE80211_RADIOTAP_MCS_HAVE_GI		0x04
 #define IEEE80211_RADIOTAP_MCS_HAVE_FMT		0x08
 #define IEEE80211_RADIOTAP_MCS_HAVE_FEC		0x10
+#define IEEE80211_RADIOTAP_MCS_HAVE_STBC	0x20
 
 #define IEEE80211_RADIOTAP_MCS_BW_MASK		0x03
 #define		IEEE80211_RADIOTAP_MCS_BW_20	0
@@ -267,5 +268,6 @@
 #define IEEE80211_RADIOTAP_MCS_SGI		0x04
 #define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
+#define IEEE80211_RADIOTAP_MCS_STBC		0x20
 
 #endif				/* IEEE80211_RADIOTAP_H */
Index: epan/dissectors/packet-radiotap.c
===================================================================
--- epan/dissectors/packet-radiotap.c	(revision 39722)
+++ epan/dissectors/packet-radiotap.c	(working copy)
@@ -546,11 +546,13 @@
 static int hf_radiotap_mcs_have_gi = -1;
 static int hf_radiotap_mcs_have_format = -1;
 static int hf_radiotap_mcs_have_fec = -1;
+static int hf_radiotap_mcs_have_stbc = -1;
 static int hf_radiotap_mcs_bw = -1;
 static int hf_radiotap_mcs_index = -1;
 static int hf_radiotap_mcs_gi = -1;
 static int hf_radiotap_mcs_format = -1;
 static int hf_radiotap_mcs_fec = -1;
+static int hf_radiotap_mcs_stbc = -1;
 
 /* "Present" flags */
 static int hf_radiotap_present_tsft = -1;
@@ -767,6 +769,12 @@
 		{ 1, "LDPC" },
 		{0, NULL}
 	};
+	
+	static const value_string mcs_stbc[] = {
+		{ 0, "off" },
+		{ 1, "on" },
+		{0, NULL}
+	};
 
 	static const value_string mcs_gi[] = {
 		{ 0, "long" },
@@ -1226,6 +1234,10 @@
 		 {"FEC", "radiotap.mcs.have_fec",
 		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_MCS_HAVE_FEC,
 		  "Forward error correction information present", HFILL}},
+		{&hf_radiotap_mcs_have_stbc,
+		 {"STBC", "radiotap.mcs.have_stbc",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_MCS_HAVE_STBC,
+		  "Space Time Block Coding information present", HFILL}},
 		{&hf_radiotap_mcs_have_index,
 		 {"MCS index", "radiotap.mcs.have_index",
 		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_MCS_HAVE_MCS,
@@ -1246,6 +1258,11 @@
 		 {"FEC", "radiotap.mcs.fec",
 		  FT_UINT8, BASE_DEC, VALS(mcs_fec), IEEE80211_RADIOTAP_MCS_FEC_LDPC,
 		  "forward error correction", HFILL}},
+		{&hf_radiotap_mcs_stbc,
+		 {"STBC", "radiotap.mcs.stbc",
+		  FT_UINT8, BASE_DEC, VALS(mcs_stbc), IEEE80211_RADIOTAP_MCS_STBC,
+		  "Space Time Block Code", HFILL}},
+
 		{&hf_radiotap_mcs_index,
 		 {"MCS index", "radiotap.mcs.index",
 		  FT_UINT8, BASE_DEC, NULL, 0x0, NULL, HFILL}},
@@ -1964,6 +1981,8 @@
 						    tvb, offset, 1, ENC_LITTLE_ENDIAN);
 				proto_tree_add_item(mcs_known_tree, hf_radiotap_mcs_have_fec,
 						    tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_mcs_have_stbc,
+						    tvb, offset, 1, ENC_LITTLE_ENDIAN);
 			}
 			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_BW) {
 				bandwidth = ((mcs_flags & IEEE80211_RADIOTAP_MCS_BW_MASK) == IEEE80211_RADIOTAP_MCS_BW_40) ?
@@ -1995,6 +2014,11 @@
 					proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_fec,
 							    tvb, offset + 1, 1, mcs_flags);
 			}
+			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_STBC) {
+				if (mcs_tree)
+					proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_stbc,
+							    tvb, offset + 1, 1, mcs_flags);
+			}
 			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_MCS) {
 				if (mcs_tree)
 					proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_index,
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
@@ -199,12 +199,15 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
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
diff --git a/drivers/net/wireless/ath/ath9k/ar9003_mac.c b/drivers/net/wireless/ath/ath9k/ar9003_mac.c
index b363cc0..efb670a 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_mac.c
+++ b/drivers/net/wireless/ath/ath9k/ar9003_mac.c
@@ -471,6 +471,7 @@ int ath9k_hw_process_rxdesc_edma(struct ath_hw *ah, struct ath_rx_status *rxs,
 	rxs->rs_antenna = (MS(rxsp->status4, AR_RxAntenna) & 0x7);
 	rxs->rs_flags  = (rxsp->status4 & AR_GI) ? ATH9K_RX_GI : 0;
 	rxs->rs_flags  |= (rxsp->status4 & AR_2040) ? ATH9K_RX_2040 : 0;
+	rxs->rs_flags |= (rxsp->status4 & AR_RxSTBC) ? ATH9K_RX_STBC : 0;
 
 	rxs->evm0 = rxsp->status6;
 	rxs->evm1 = rxsp->status7;
diff --git a/drivers/net/wireless/ath/ath9k/mac.c b/drivers/net/wireless/ath/ath9k/mac.c
index 6a8fdf3..1e64586 100644
--- a/drivers/net/wireless/ath/ath9k/mac.c
+++ b/drivers/net/wireless/ath/ath9k/mac.c
@@ -595,6 +595,8 @@ int ath9k_hw_rxprocdesc(struct ath_hw *ah, struct ath_desc *ds,
 		(ads.ds_rxstatus3 & AR_GI) ? ATH9K_RX_GI : 0;
 	rs->rs_flags |=
 		(ads.ds_rxstatus3 & AR_2040) ? ATH9K_RX_2040 : 0;
+	rs->rs_flags |=
+		(ads.ds_rxstatus3 & AR_RxSTBC) ? ATH9K_RX_STBC : 0;
 
 	if (ads.ds_rxstatus8 & AR_PreDelimCRCErr)
 		rs->rs_flags |= ATH9K_RX_DELIM_CRC_PRE;
diff --git a/drivers/net/wireless/ath/ath9k/mac.h b/drivers/net/wireless/ath/ath9k/mac.h
index 11dbd14..d0fda0e 100644
--- a/drivers/net/wireless/ath/ath9k/mac.h
+++ b/drivers/net/wireless/ath/ath9k/mac.h
@@ -191,6 +191,7 @@ struct ath_htc_rx_status {
 #define ATH9K_RX_DELIM_CRC_PRE    0x10
 #define ATH9K_RX_DELIM_CRC_POST   0x20
 #define ATH9K_RX_DECRYPT_BUSY     0x40
+#define ATH9K_RX_STBC             0x80
 
 #define ATH9K_RXKEYIX_INVALID	((u8)-1)
 #define ATH9K_TXKEYIX_INVALID	((u8)-1)
@@ -531,7 +532,8 @@ struct ar5416_desc {
 #define AR_2040             0x00000002
 #define AR_Parallel40       0x00000004
 #define AR_Parallel40_S     2
-#define AR_RxStatusRsvd30   0x000000f8
+#define AR_RxSTBC           0x00000008
+#define AR_RxStatusRsvd30   0x000000f0
 #define AR_RxAntenna	    0xffffff00
 #define AR_RxAntenna_S	    8
 
diff --git a/drivers/net/wireless/ath/ath9k/recv.c b/drivers/net/wireless/ath/ath9k/recv.c
index 67b862c..2c6606d 100644
--- a/drivers/net/wireless/ath/ath9k/recv.c
+++ b/drivers/net/wireless/ath/ath9k/recv.c
@@ -913,6 +913,8 @@ static int ath9k_process_rate(struct ath_common *common,
 			rxs->flag |= RX_FLAG_40MHZ;
 		if (rx_stats->rs_flags & ATH9K_RX_GI)
 			rxs->flag |= RX_FLAG_SHORT_GI;
+		if (rx_stats->rs_flags & ATH9K_RX_STBC)
+			rxs->flag |= RX_FLAG_STBC;
 		rxs->rate_idx = rx_stats->rs_rate & 0x7f;
 		return 0;
 	}
---
