From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] MCS extension
Date: Sat, 18 Dec 2010 18:56:38 +0100
Message-ID: <1292694998.3653.33.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-CgRWJf9n4bx0UPy3HYtP"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-CgRWJf9n4bx0UPy3HYtP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a request for adoption of a new version of the MCS extension.
I've split out the aMPDU extension since that seems more natural.

The MCS extension allows giving MCS information about a frame.

The normative text of this proposal follows (minus formatting):
--- begin normative text ---
MCS

Bit number
	19
Structure
	u8 known, u8 flags, u8 mcs
Required alignment
	1

The MCS field indicates the MCS rate index as in IEEE_802.11n-2009.

The "known" field indicates which information is known:
| flag | definition
---------------------
| 0x01 | bandwidth
| 0x02 | MCS index known (in "mcs" part of the field)
| 0x04 | guard interval
| 0x08 | HT format
| 0x10 | FEC type
| 0xe0 | reserved

The "flags" field is any combination of the following:
| flag | definition
-----------------------------
| 0x03 | bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
| 0x04 | guard interval - 0: long GI, 1: short GI
| 0x08 | HT format - 0: mixed, 1: greenfield
| 0x10 | FEC type - 0: BCC, 1: LDPC
| 0xe0 | reserved

--- end normative text ---


I've implemented this in mac80211 (the Linux 802.11 stack) and in
wireshark, both patches are attached.

Due to holidays, I suggest the following timeline:
 * comment period until Jan. 15th
 * tentatively adopt Jan. 22nd
 * fully adopt end of January

I'm also preparing a separate aMPDU field -- see
http://www.radiotap.org/suggested-fields/aMPDU%20status

johannes

--=-CgRWJf9n4bx0UPy3HYtP
Content-Disposition: attachment; filename="014-mac80211-ht-rtap.patch"
Content-Type: text/x-patch; name="014-mac80211-ht-rtap.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

mac80211: add radiotap MCS information

From: Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

This adds the MCS information we currently get
from the drivers into radiotap.

Signed-off-by: Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 include/net/ieee80211_radiotap.h |   20 ++++++++++++++++++++
 net/mac80211/rx.c                |   17 +++++++++++++++++
 2 files changed, 37 insertions(+)

--- wireless-testing.orig/net/mac80211/rx.c	2010-12-17 19:34:51.000000000 +0100
+++ wireless-testing/net/mac80211/rx.c	2010-12-18 18:46:22.000000000 +0100
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
+		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_MCS);
+		*pos++ = IEEE80211_RADIOTAP_MCS_HAVE_MCS |
+			 IEEE80211_RADIOTAP_MCS_HAVE_GI |
+			 IEEE80211_RADIOTAP_MCS_HAVE_BW;
+		*pos = 0;
+		if (status->flag & RX_FLAG_SHORT_GI)
+			*pos |= IEEE80211_RADIOTAP_MCS_SGI;
+		if (status->flag & RX_FLAG_40MHZ)
+			*pos |= IEEE80211_RADIOTAP_MCS_BW_40;
+		pos++;
+		*pos++ = status->rate_idx;
+	}
 }
 
 /*
--- wireless-testing.orig/include/net/ieee80211_radiotap.h	2010-10-27 07:42:08.000000000 +0200
+++ wireless-testing/include/net/ieee80211_radiotap.h	2010-12-18 18:39:14.000000000 +0100
@@ -199,6 +199,8 @@ enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_RTS_RETRIES = 16,
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
 
+	IEEE80211_RADIOTAP_MCS = 19,
+
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,
 	IEEE80211_RADIOTAP_VENDOR_NAMESPACE = 30,
@@ -245,6 +247,24 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_F_TX_CTS	0x0002	/* used cts 'protection' */
 #define IEEE80211_RADIOTAP_F_TX_RTS	0x0004	/* used rts/cts handshake */
 
+
+/* For IEEE80211_RADIOTAP_MCS */
+#define IEEE80211_RADIOTAP_MCS_HAVE_BW		0x01
+#define IEEE80211_RADIOTAP_MCS_HAVE_MCS		0x02
+#define IEEE80211_RADIOTAP_MCS_HAVE_GI		0x04
+#define IEEE80211_RADIOTAP_MCS_HAVE_FMT		0x08
+#define IEEE80211_RADIOTAP_MCS_HAVE_FEC		0x10
+
+#define IEEE80211_RADIOTAP_MCS_BW_MASK		0x03
+#define		IEEE80211_RADIOTAP_MCS_BW_20	0
+#define		IEEE80211_RADIOTAP_MCS_BW_40	1
+#define		IEEE80211_RADIOTAP_MCS_BW_20L	2
+#define		IEEE80211_RADIOTAP_MCS_BW_20U	3
+#define IEEE80211_RADIOTAP_MCS_SGI		0x04
+#define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
+#define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
+
+
 /* Ugly macro to convert literal channel numbers into their mhz equivalents
  * There are certianly some conditions that will break this (like feeding it '30')
  * but they shouldn't arise since nothing talks on channel 30. */

--=-CgRWJf9n4bx0UPy3HYtP
Content-Disposition: attachment; filename="001-radiotap-mcs.patch"
Content-Type: text/x-patch; name="001-radiotap-mcs.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

---
 epan/dissectors/packet-radiotap-defs.h |   19 ++++++
 epan/dissectors/packet-radiotap-iter.c |    4 +
 epan/dissectors/packet-radiotap.c      |   92 +++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

--- trunk.orig/epan/dissectors/packet-radiotap-defs.h	2010-12-18 18:37:28.000000000 +0100
+++ trunk/epan/dissectors/packet-radiotap-defs.h	2010-12-18 18:37:54.000000000 +0100
@@ -198,6 +198,8 @@ enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_RTS_RETRIES = 16,
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
 
+	IEEE80211_RADIOTAP_MCS = 19,
+
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,
 	IEEE80211_RADIOTAP_VENDOR_NAMESPACE = 30,
@@ -244,4 +246,21 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_F_TX_CTS	0x0002	/* used cts 'protection' */
 #define IEEE80211_RADIOTAP_F_TX_RTS	0x0004	/* used rts/cts handshake */
 
+
+/* For IEEE80211_RADIOTAP_MCS */
+#define IEEE80211_RADIOTAP_MCS_HAVE_BW		0x01
+#define IEEE80211_RADIOTAP_MCS_HAVE_MCS		0x02
+#define IEEE80211_RADIOTAP_MCS_HAVE_GI		0x04
+#define IEEE80211_RADIOTAP_MCS_HAVE_FMT		0x08
+#define IEEE80211_RADIOTAP_MCS_HAVE_FEC		0x10
+
+#define IEEE80211_RADIOTAP_MCS_BW_MASK		0x03
+#define		IEEE80211_RADIOTAP_MCS_BW_20	0
+#define		IEEE80211_RADIOTAP_MCS_BW_40	1
+#define		IEEE80211_RADIOTAP_MCS_BW_20L	2
+#define		IEEE80211_RADIOTAP_MCS_BW_20U	3
+#define IEEE80211_RADIOTAP_MCS_SGI		0x04
+#define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
+#define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
+
 #endif				/* IEEE80211_RADIOTAP_H */
--- trunk.orig/epan/dissectors/packet-radiotap-iter.c	2010-12-18 18:37:28.000000000 +0100
+++ trunk/epan/dissectors/packet-radiotap-iter.c	2010-12-18 18:37:54.000000000 +0100
@@ -48,7 +48,9 @@ static const struct radiotap_align_size
 	/* [IEEE80211_RADIOTAP_RX_FLAGS] = 14 */		{ 2, 2 },
 	/* [IEEE80211_RADIOTAP_TX_FLAGS] = 15 */		{ 2, 2 },
 	/* [IEEE80211_RADIOTAP_RTS_RETRIES] = 16 */		{ 1, 1 },
-	/* [IEEE80211_RADIOTAP_DATA_RETRIES] = 17 */		{ 1, 1 }
+	/* [IEEE80211_RADIOTAP_DATA_RETRIES] = 17 */		{ 1, 1 },
+	/* currently undefined = 18 */				{ 0, 0 },
+	/* [IEEE80211_RADIOTAP_MCS] = 19 */			{ 1, 3 }
 	/*
 	 * add more here as they are defined in
 	 * include/net/ieee80211_radiotap.h
--- trunk.orig/epan/dissectors/packet-radiotap.c	2010-12-18 18:37:28.000000000 +0100
+++ trunk/epan/dissectors/packet-radiotap.c	2010-12-18 18:52:52.000000000 +0100
@@ -161,6 +161,12 @@ static int hf_radiotap_ven_oui = -1;
 static int hf_radiotap_ven_subns = -1;
 static int hf_radiotap_ven_skip = -1;
 static int hf_radiotap_ven_data = -1;
+static int hf_radiotap_mcs = -1;
+static int hf_radiotap_mcs_bw = -1;
+static int hf_radiotap_mcs_index = -1;
+static int hf_radiotap_mcs_gi = -1;
+static int hf_radiotap_mcs_format = -1;
+static int hf_radiotap_mcs_fec = -1;
 
 /* "Present" flags */
 static int hf_radiotap_present_tsft = -1;
@@ -180,6 +186,7 @@ static int hf_radiotap_present_db_antnoi
 static int hf_radiotap_present_hdrfcs = -1;
 static int hf_radiotap_present_rxflags = -1;
 static int hf_radiotap_present_xchannel = -1;
+static int hf_radiotap_present_mcs = -1;
 static int hf_radiotap_present_rtap_ns = -1;
 static int hf_radiotap_present_vendor_ns = -1;
 static int hf_radiotap_present_ext = -1;
@@ -206,6 +213,7 @@ static gint ett_radiotap_rxflags = -1;
 static gint ett_radiotap_channel_flags = -1;
 static gint ett_radiotap_xchannel_flags = -1;
 static gint ett_radiotap_vendor = -1;
+static gint ett_radiotap_mcs = -1;
 
 static dissector_handle_t ieee80211_handle;
 static dissector_handle_t ieee80211_datapad_handle;
@@ -355,6 +363,28 @@ void proto_register_radiotap(void)
 		{0, NULL},
 	};
 
+	static const value_string mcs_bandwidth[] = {
+		{ IEEE80211_RADIOTAP_MCS_BW_20, "20 MHz" },
+		{ IEEE80211_RADIOTAP_MCS_BW_40, "40 MHz" },
+		{ IEEE80211_RADIOTAP_MCS_BW_20L, "20 MHz lower" },
+		{ IEEE80211_RADIOTAP_MCS_BW_20U, "20 MHz upper" },
+	};
+
+	static const value_string mcs_format[] = {
+		{ 0, "mixed" },
+		{ 1, "greenfield" },
+	};
+
+	static const value_string mcs_fec[] = {
+		{ 0, "BCC" },
+		{ 1, "LDPC" },
+	};
+
+	static const value_string mcs_gi[] = {
+		{ 0, "long" },
+		{ 1, "short" },
+	};
+
 	static const true_false_string preamble_type = {
 		"Short",
 		"Long",
@@ -479,6 +509,11 @@ void proto_register_radiotap(void)
 		  "Specifies if the extended channel info field is present",
 		  HFILL}},
 
+		{&hf_radiotap_present_mcs,
+		 {"HT information", "radiotap.present.mcs",
+		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(MCS),
+		  "Specifies if the HT field is present", HFILL}},
+
 		{&hf_radiotap_present_rtap_ns,
 		 {"Radiotap NS next", "radiotap.present.rtap_ns",
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(RADIOTAP_NAMESPACE),
@@ -779,6 +814,29 @@ void proto_register_radiotap(void)
 		  FT_INT32, BASE_DEC, NULL, 0x0,
 		  "Transmit power in decibels per one milliwatt (dBm)", HFILL}},
 
+		{&hf_radiotap_mcs,
+		 {"MCS information", "radiotap.mcs",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_mcs_bw,
+		 {"bandwidth", "radiotap.mcs.bw",
+		  FT_UINT8, BASE_DEC, VALS(mcs_bandwidth),
+		  IEEE80211_RADIOTAP_MCS_BW_MASK, NULL, HFILL}},
+		{&hf_radiotap_mcs_gi,
+		 {"guard interval", "radiotap.mcs.gi",
+		  FT_UINT8, BASE_DEC, VALS(mcs_gi), IEEE80211_RADIOTAP_MCS_SGI,
+		  "Sent/Received guard interval", HFILL}},
+		{&hf_radiotap_mcs_format,
+		 {"format", "radiotap.mcs.format",
+		  FT_UINT8, BASE_DEC, VALS(mcs_format), IEEE80211_RADIOTAP_MCS_FMT_GF,
+		  "format", HFILL}},
+		{&hf_radiotap_mcs_fec,
+		 {"FEC", "radiotap.mcs.fec",
+		  FT_UINT8, BASE_DEC, VALS(mcs_fec), IEEE80211_RADIOTAP_MCS_FEC_LDPC,
+		  "forward error correction", HFILL}},
+		{&hf_radiotap_mcs_index,
+		 {"MCS index", "radiotap.mcs.index",
+		  FT_UINT8, BASE_DEC, NULL, 0x0, NULL, HFILL}},
+
 		{&hf_radiotap_vendor_ns,
 		 {"Vendor namespace", "radiotap.vendor_namespace",
 		  FT_BYTES, BASE_NONE, NULL, 0x0,
@@ -820,6 +878,7 @@ void proto_register_radiotap(void)
 		&ett_radiotap_channel_flags,
 		&ett_radiotap_xchannel_flags,
 		&ett_radiotap_vendor,
+		&ett_radiotap_mcs,
 	};
 	module_t *radiotap_module;
 
@@ -1420,6 +1479,39 @@ dissect_radiotap(tvbuff_t * tvb, packet_
 			}
 			break;
 		}
+		case IEEE80211_RADIOTAP_MCS: {
+			proto_item *it;
+			proto_tree *mcs_tree;
+			guint8 mcs_known, mcs_flags;
+			guint8 mcs;
+
+			if (!tree)
+				break;
+
+			mcs_known = tvb_get_guint8(tvb, offset);
+			mcs_flags = tvb_get_guint8(tvb, offset + 1);
+			mcs = tvb_get_guint8(tvb, offset + 2);
+
+			it = proto_tree_add_item(radiotap_tree, hf_radiotap_mcs,
+						 tvb, offset, 3, FALSE);
+			mcs_tree = proto_item_add_subtree(it, ett_radiotap_mcs);
+			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_BW)
+				proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_bw,
+						    tvb, offset + 1, 1, mcs_flags);
+			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_GI)
+				proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_gi,
+						    tvb, offset + 1, 1, mcs_flags);
+			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_FMT)
+				proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_format,
+						    tvb, offset + 1, 1, mcs_flags);
+			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_FEC)
+				proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_fec,
+						    tvb, offset + 1, 1, mcs_flags);
+			if (mcs_known & IEEE80211_RADIOTAP_MCS_HAVE_MCS)
+				proto_tree_add_uint(mcs_tree, hf_radiotap_mcs_index,
+						    tvb, offset + 2, 1, mcs);
+			break;
+		}
 		}
 	}
 

--=-CgRWJf9n4bx0UPy3HYtP--
