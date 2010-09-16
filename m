From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] HT extensions
Date: Thu, 16 Sep 2010 02:04:49 +0200
Message-ID: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-NjqGm7IgAwqUof39WHTi"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-NjqGm7IgAwqUof39WHTi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a request for adoption of the MCS/HT information we've talked
about earlier, based on my second proposal that includes valid bits
within the field.

This proposal adds the following new field:

Bit Number: 19
Structure: u8 known, u8 flags, u8 mcs
Required Alignment: 1

The "mcs" field indicates the MCS rate index as in IEEE_802.11n-2009.

The "known" field indicates which flags are known:

0x01: bandwidth
0x02: MCS index known (in `mcs` part of the field)
0x04: guard interval
0x08: HT format
0x10: FEC type
0x20: a-MPDU status
0x40: a-MPDU beginning/end
0x80: reserved

The `flags` is any combination of the following:
0x03: bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
0x04: short GI
0x08: 0: mixed, 1: greenfield
0x10: 0: BCC, 1: LDPC
0x20: a-MPDU status - 0: not part of an a-MPDU, 1: part of a-MPDU
0x40: 0: first frame, 1: last frame
0x80: reserved



Attached is a patch to Linux to generate this information (partially)
and a patch for wireshark to read it -- the wireshark patch is on top of
the refactoring I did in
https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=4421

johannes

--=-NjqGm7IgAwqUof39WHTi
Content-Disposition: attachment; filename="016-mac80211-ht-rtap.patch"
Content-Type: text/x-patch; name="016-mac80211-ht-rtap.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

---
 include/net/ieee80211_radiotap.h |   24 ++++++++++++++++++++++++
 net/mac80211/rx.c                |   17 +++++++++++++++++
 2 files changed, 41 insertions(+)

--- wireless-testing.orig/net/mac80211/rx.c	2010-09-15 16:54:55.000000000 +0200
+++ wireless-testing/net/mac80211/rx.c	2010-09-16 01:31:12.000000000 +0200
@@ -85,6 +85,9 @@ ieee80211_rx_radiotap_len(struct ieee802
 	if (len & 1) /* padding for RX_FLAGS if necessary */
 		len++;
 
+	if (status->flag & RX_FLAG_HT) /* HT info */
+		len += 3;
+
 	return len;
 }
 
@@ -193,6 +196,20 @@ ieee80211_add_rx_radiotap_header(struct
 		rx_flags |= IEEE80211_RADIOTAP_F_RX_BADPLCP;
 	put_unaligned_le16(rx_flags, pos);
 	pos += 2;
+
+	if (status->flag & RX_FLAG_HT) {
+		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_HT);
+		*pos++ = IEEE80211_RADIOTAP_HT_HAVE_MCS |
+			 IEEE80211_RADIOTAP_HT_HAVE_GI |
+			 IEEE80211_RADIOTAP_HT_HAVE_BW;
+		*pos = 0;
+		if (status->flag & RX_FLAG_SHORT_GI)
+			*pos |= IEEE80211_RADIOTAP_HT_SGI;
+		if (status->flag & RX_FLAG_40MHZ)
+			*pos |= IEEE80211_RADIOTAP_HT_BW_40;
+		pos++;
+		*pos++ = status->rate_idx;
+	}
 }
 
 /*
--- wireless-testing.orig/include/net/ieee80211_radiotap.h	2010-09-14 07:22:01.000000000 +0200
+++ wireless-testing/include/net/ieee80211_radiotap.h	2010-09-16 01:30:42.000000000 +0200
@@ -199,6 +199,8 @@ enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_RTS_RETRIES = 16,
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
 
+	IEEE80211_RADIOTAP_HT = 19,
+
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,
 	IEEE80211_RADIOTAP_VENDOR_NAMESPACE = 30,
@@ -245,6 +247,28 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_F_TX_CTS	0x0002	/* used cts 'protection' */
 #define IEEE80211_RADIOTAP_F_TX_RTS	0x0004	/* used rts/cts handshake */
 
+
+/* For IEEE80211_RADIOTAP_HT */
+#define IEEE80211_RADIOTAP_HT_HAVE_BW		0x01
+#define IEEE80211_RADIOTAP_HT_HAVE_MCS		0x02
+#define IEEE80211_RADIOTAP_HT_HAVE_GI		0x04
+#define IEEE80211_RADIOTAP_HT_HAVE_FMT		0x08
+#define IEEE80211_RADIOTAP_HT_HAVE_FEC		0x10
+#define IEEE80211_RADIOTAP_HT_HAVE_AMPDU_STAT	0x20
+#define IEEE80211_RADIOTAP_HT_HAVE_AMPDU_POS	0x40
+
+#define IEEE80211_RADIOTAP_HT_BW_MASK		0x03
+#define		IEEE80211_RADIOTAP_HT_BW_20	0
+#define		IEEE80211_RADIOTAP_HT_BW_40	1
+#define		IEEE80211_RADIOTAP_HT_BW_20L	2
+#define		IEEE80211_RADIOTAP_HT_BW_20U	3
+#define IEEE80211_RADIOTAP_HT_SGI		0x04
+#define IEEE80211_RADIOTAP_HT_FMT_GF		0x08
+#define IEEE80211_RADIOTAP_HT_FEC_LDPC		0x10
+#define IEEE80211_RADIOTAP_HT_AMPDU_PART	0x20
+#define IEEE80211_RADIOTAP_HT_AMPDU_END		0x40
+
+
 /* Ugly macro to convert literal channel numbers into their mhz equivalents
  * There are certianly some conditions that will break this (like feeding it '30')
  * but they shouldn't arise since nothing talks on channel 30. */

--=-NjqGm7IgAwqUof39WHTi
Content-Disposition: attachment; filename="003-radiotap-ht.patch"
Content-Type: text/x-patch; name="003-radiotap-ht.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

---
 epan/dissectors/packet-radiotap-defs.h |   23 ++++++
 epan/dissectors/packet-radiotap-iter.c |    1 
 epan/dissectors/packet-radiotap.c      |  118 +++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)

--- trunk.orig/epan/dissectors/packet-radiotap-defs.h	2010-09-16 01:34:01.000000000 +0200
+++ trunk/epan/dissectors/packet-radiotap-defs.h	2010-09-16 01:34:06.000000000 +0200
@@ -196,6 +196,8 @@ enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_RTS_RETRIES = 16,
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
 
+	IEEE80211_RADIOTAP_HT = 19,
+
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,
 	IEEE80211_RADIOTAP_VENDOR_NAMESPACE = 30,
@@ -242,4 +244,25 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_F_TX_CTS	0x0002	/* used cts 'protection' */
 #define IEEE80211_RADIOTAP_F_TX_RTS	0x0004	/* used rts/cts handshake */
 
+
+/* For IEEE80211_RADIOTAP_HT */
+#define IEEE80211_RADIOTAP_HT_HAVE_BW		0x01
+#define IEEE80211_RADIOTAP_HT_HAVE_MCS		0x02
+#define IEEE80211_RADIOTAP_HT_HAVE_GI		0x04
+#define IEEE80211_RADIOTAP_HT_HAVE_FMT		0x08
+#define IEEE80211_RADIOTAP_HT_HAVE_FEC		0x10
+#define IEEE80211_RADIOTAP_HT_HAVE_AMPDU_STAT	0x20
+#define IEEE80211_RADIOTAP_HT_HAVE_AMPDU_POS	0x40
+
+#define IEEE80211_RADIOTAP_HT_BW_MASK		0x03
+#define		IEEE80211_RADIOTAP_HT_BW_20	0
+#define		IEEE80211_RADIOTAP_HT_BW_40	1
+#define		IEEE80211_RADIOTAP_HT_BW_20L	2
+#define		IEEE80211_RADIOTAP_HT_BW_20U	3
+#define IEEE80211_RADIOTAP_HT_SGI		0x04
+#define IEEE80211_RADIOTAP_HT_FMT_GF		0x08
+#define IEEE80211_RADIOTAP_HT_FEC_LDPC		0x10
+#define IEEE80211_RADIOTAP_HT_AMPDU_PART	0x20
+#define IEEE80211_RADIOTAP_HT_AMPDU_END		0x40
+
 #endif				/* IEEE80211_RADIOTAP_H */
--- trunk.orig/epan/dissectors/packet-radiotap-iter.c	2010-09-16 01:34:01.000000000 +0200
+++ trunk/epan/dissectors/packet-radiotap-iter.c	2010-09-16 01:34:06.000000000 +0200
@@ -37,6 +37,7 @@ static const struct radiotap_align_size
 	[IEEE80211_RADIOTAP_TX_FLAGS] = { .align = 2, .size = 2, },
 	[IEEE80211_RADIOTAP_RTS_RETRIES] = { .align = 1, .size = 1, },
 	[IEEE80211_RADIOTAP_DATA_RETRIES] = { .align = 1, .size = 1, },
+	[IEEE80211_RADIOTAP_HT] = { .align = 1, .size = 3, },
 	/*
 	 * add more here as they are defined in
 	 * include/net/ieee80211_radiotap.h
--- trunk.orig/epan/dissectors/packet-radiotap.c	2010-09-16 01:34:01.000000000 +0200
+++ trunk/epan/dissectors/packet-radiotap.c	2010-09-16 02:03:00.000000000 +0200
@@ -161,6 +161,14 @@ static int hf_radiotap_ven_oui = -1;
 static int hf_radiotap_ven_subns = -1;
 static int hf_radiotap_ven_skip = -1;
 static int hf_radiotap_ven_data = -1;
+static int hf_radiotap_ht = -1;
+static int hf_radiotap_ht_bw = -1;
+static int hf_radiotap_ht_mcs = -1;
+static int hf_radiotap_ht_gi = -1;
+static int hf_radiotap_ht_format = -1;
+static int hf_radiotap_ht_fec = -1;
+static int hf_radiotap_ampdu_status = -1;
+static int hf_radiotap_ampdu_position = -1;
 
 /* "Present" flags */
 static int hf_radiotap_present_tsft = -1;
@@ -180,6 +188,7 @@ static int hf_radiotap_present_db_antnoi
 static int hf_radiotap_present_hdrfcs = -1;
 static int hf_radiotap_present_rxflags = -1;
 static int hf_radiotap_present_xchannel = -1;
+static int hf_radiotap_present_ht = -1;
 static int hf_radiotap_present_rtap_ns = -1;
 static int hf_radiotap_present_vendor_ns = -1;
 static int hf_radiotap_present_ext = -1;
@@ -206,6 +215,7 @@ static gint ett_radiotap_rxflags = -1;
 static gint ett_radiotap_channel_flags = -1;
 static gint ett_radiotap_xchannel_flags = -1;
 static gint ett_radiotap_vendor = -1;
+static gint ett_radiotap_ht = -1;
 
 static dissector_handle_t ieee80211_handle;
 static dissector_handle_t ieee80211_datapad_handle;
@@ -355,6 +365,38 @@ void proto_register_radiotap(void)
 		{0, NULL},
 	};
 
+	static const value_string ht_bandwidth[] = {
+		{ IEEE80211_RADIOTAP_HT_BW_20, "20 MHz" },
+		{ IEEE80211_RADIOTAP_HT_BW_40, "40 MHz" },
+		{ IEEE80211_RADIOTAP_HT_BW_20L, "20 MHz lower" },
+		{ IEEE80211_RADIOTAP_HT_BW_20U, "20 MHz upper" },
+	};
+
+	static const value_string ht_format[] = {
+		{ 0, "mixed" },
+		{ 1, "greenfield" },
+	};
+
+	static const value_string ht_fec[] = {
+		{ 0, "BCC" },
+		{ 1, "LDPC" },
+	};
+
+	static const value_string ampdu_status[] = {
+		{ 0, "not aggregated" },
+		{ 1, "aggregated" },
+	};
+
+	static const value_string ampdu_position[] = {
+		{ 0, "beginning" },
+		{ 1, "end" },
+	};
+
+	static const value_string ht_gi[] = {
+		{ 0, "long" },
+		{ 1, "short" },
+	};
+
 	static const true_false_string preamble_type = {
 		"Short",
 		"Long",
@@ -479,6 +521,11 @@ void proto_register_radiotap(void)
 		  "Specifies if the extended channel info field is present",
 		  HFILL}},
 
+		{&hf_radiotap_present_ht,
+		 {"HT information", "radiotap.present.ht",
+		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(HT),
+		  "Specifies if the HT field is present", HFILL}},
+
 		{&hf_radiotap_present_rtap_ns,
 		 {"Radiotap NS next", "radiotap.present.rtap_ns",
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(RADIOTAP_NAMESPACE),
@@ -779,6 +826,37 @@ void proto_register_radiotap(void)
 		  FT_INT32, BASE_DEC, NULL, 0x0,
 		  "Transmit power in decibels per one milliwatt (dBm)", HFILL}},
 
+		{&hf_radiotap_ht,
+		 {"HT information", "radiotap.ht",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_ht_bw,
+		 {"HT bandwidth", "radiotap.ht.bw",
+		  FT_UINT8, BASE_DEC, VALS(ht_bandwidth),
+		  IEEE80211_RADIOTAP_HT_BW_MASK, NULL, HFILL}},
+		{&hf_radiotap_ht_gi,
+		 {"HT guard interval", "radiotap.ht.gi",
+		  FT_UINT8, BASE_DEC, VALS(ht_gi), IEEE80211_RADIOTAP_HT_SGI,
+		  "Sent/Received guard interval", HFILL}},
+		{&hf_radiotap_ht_format,
+		 {"HT format", "radiotap.ht.format",
+		  FT_UINT8, BASE_DEC, VALS(ht_format), IEEE80211_RADIOTAP_HT_FMT_GF,
+		  "HT format", HFILL}},
+		{&hf_radiotap_ht_fec,
+		 {"HT FEC", "radiotap.ht.fec",
+		  FT_UINT8, BASE_DEC, VALS(ht_fec), IEEE80211_RADIOTAP_HT_FEC_LDPC,
+		  "HT forward error correction", HFILL}},
+		{&hf_radiotap_ampdu_status,
+		 {"a-MPDU status", "radiotap.ampdu.status",
+		  FT_UINT8, BASE_DEC, VALS(ampdu_status), IEEE80211_RADIOTAP_HT_AMPDU_PART,
+		  "a-MPDU status", HFILL}},
+		{&hf_radiotap_ampdu_position,
+		 {"a-MPDU position", "radiotap.ampdu.position",
+		  FT_UINT8, BASE_DEC, VALS(ampdu_position), IEEE80211_RADIOTAP_HT_AMPDU_END,
+		  "a-MPDU position", HFILL}},
+		{&hf_radiotap_ht_mcs,
+		 {"HT MCS index", "radiotap.ht.mcs",
+		  FT_UINT8, BASE_DEC, NULL, 0x0, NULL, HFILL}},
+
 		{&hf_radiotap_vendor_ns,
 		 {"Vendor namespace", "radiotap.vendor_namespace",
 		  FT_BYTES, BASE_NONE, NULL, 0x0,
@@ -820,6 +898,7 @@ void proto_register_radiotap(void)
 		&ett_radiotap_channel_flags,
 		&ett_radiotap_xchannel_flags,
 		&ett_radiotap_vendor,
+		&ett_radiotap_ht,
 	};
 	module_t *radiotap_module;
 
@@ -1405,6 +1484,45 @@ dissect_radiotap(tvbuff_t * tvb, packet_
 			}
 			break;
 		}
+		case IEEE80211_RADIOTAP_HT: {
+			proto_item *it;
+			proto_tree *ht_tree;
+			guint8 ht_known, ht_flags;
+			guint8 mcs;
+
+			if (!tree)
+				break;
+
+			ht_known = tvb_get_guint8(tvb, offset);
+			ht_flags = tvb_get_guint8(tvb, offset + 1);
+			mcs = tvb_get_guint8(tvb, offset + 2);
+
+			it = proto_tree_add_item(radiotap_tree, hf_radiotap_ht,
+						 tvb, offset, 3, FALSE);
+			ht_tree = proto_item_add_subtree(it, ett_radiotap_ht);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_BW)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ht_bw,
+						    tvb, offset + 1, 1, ht_flags);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_GI)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ht_gi,
+						    tvb, offset + 1, 1, ht_flags);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_FMT)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ht_format,
+						    tvb, offset + 1, 1, ht_flags);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_FEC)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ht_fec,
+						    tvb, offset + 1, 1, ht_flags);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_AMPDU_STAT)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ampdu_status,
+						    tvb, offset + 1, 1, mcs);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_AMPDU_POS)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ampdu_position,
+						    tvb, offset + 1, 1, mcs);
+			if (ht_known & IEEE80211_RADIOTAP_HT_HAVE_MCS)
+				proto_tree_add_uint(ht_tree, hf_radiotap_ht_mcs,
+						    tvb, offset + 2, 1, mcs);
+			break;
+		}
 		}
 	}
 

--=-NjqGm7IgAwqUof39WHTi--
