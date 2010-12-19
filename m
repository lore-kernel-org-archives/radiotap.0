From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFC] a-MPDU extension
Date: Sun, 19 Dec 2010 11:34:25 +0100
Message-ID: <1292754865.3535.4.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-cd1yJw4Dy53K7Tkq5Z4X"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-cd1yJw4Dy53K7Tkq5Z4X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This isn't really an RFA yet since I haven't really talked to anyone
about it ...

Since I removed the aMPDU information from the MCS proposal, we should
add it back. I think it makes more sense to keep it separate anyway.

What I'm proposing is a new a-MPDU status field that is a simple
one-byte field, containing:

| mask | meaning
----------------------
| 0x80 | index valid
| 0x40 | reserved
| 0x3f | index in a-MPDU

The presence of the field indicates that the frame was part of an
aggregate, and if known, the index in the aggregate may be given by
setting the 0x80 bit and the lower bits appropriately.

Thoughts? Is there anything this doesn't cover? I have a wireshark
implementation (attached) but no capture implementation yet since I'm
still looking at some bigger changes to push this information through
the Linux wifi stack.

johannes

--=-cd1yJw4Dy53K7Tkq5Z4X
Content-Disposition: attachment; filename="002-radiotap-ampdu.patch"
Content-Type: text/x-patch; name="002-radiotap-ampdu.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

---
 epan/dissectors/packet-radiotap-defs.h |    9 ++++++
 epan/dissectors/packet-radiotap-iter.c |    3 +-
 epan/dissectors/packet-radiotap.c      |   43 +++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

--- trunk.orig/epan/dissectors/packet-radiotap-defs.h	2010-12-19 10:58:19.000000000 +0100
+++ trunk/epan/dissectors/packet-radiotap-defs.h	2010-12-19 10:58:22.000000000 +0100
@@ -182,6 +182,11 @@ struct ieee80211_radiotap_header {
  *     Contains a bitmap of known fields/flags, the flags, and
  *     the MCS index.
  *
+ * IEEE80211_RADIOTAP_AMPDU		u8		unitless
+ *
+ *     If present, frame was part of an aMPDU, if the highest
+ *     bit of the u8 is set the lowest 6 bits of it contain
+ *     the index of this frame in the aMPDU.
  */
 enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_TSFT = 0,
@@ -204,6 +209,7 @@ enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
 
 	IEEE80211_RADIOTAP_MCS = 19,
+	IEEE80211_RADIOTAP_AMPDU = 20,
 
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,
@@ -268,4 +274,7 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_MCS_FMT_GF		0x08
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
 
+#define IEEE80211_RADIOTAP_AMPDU_IDX_VALID	0x80
+#define IEEE80211_RADIOTAP_AMPDU_IDX_MASK	0x3f
+
 #endif				/* IEEE80211_RADIOTAP_H */
--- trunk.orig/epan/dissectors/packet-radiotap-iter.c	2010-12-19 10:58:19.000000000 +0100
+++ trunk/epan/dissectors/packet-radiotap-iter.c	2010-12-19 10:58:22.000000000 +0100
@@ -50,7 +50,8 @@ static const struct radiotap_align_size
 	/* [IEEE80211_RADIOTAP_RTS_RETRIES] = 16 */		{ 1, 1 },
 	/* [IEEE80211_RADIOTAP_DATA_RETRIES] = 17 */		{ 1, 1 },
 	/* currently undefined = 18 */				{ 0, 0 },
-	/* [IEEE80211_RADIOTAP_MCS] = 19 */			{ 1, 3 }
+	/* [IEEE80211_RADIOTAP_MCS] = 19 */			{ 1, 3 },
+	/* [IEEE80211_RADIOTAP_AMPDU] = 20 */			{ 1, 1 }
 	/*
 	 * add more here as they are defined in
 	 * include/net/ieee80211_radiotap.h
--- trunk.orig/epan/dissectors/packet-radiotap.c	2010-12-19 10:58:48.000000000 +0100
+++ trunk/epan/dissectors/packet-radiotap.c	2010-12-19 11:20:54.000000000 +0100
@@ -167,6 +167,9 @@ static int hf_radiotap_mcs_index = -1;
 static int hf_radiotap_mcs_gi = -1;
 static int hf_radiotap_mcs_format = -1;
 static int hf_radiotap_mcs_fec = -1;
+static int hf_radiotap_ampdu = -1;
+static int hf_radiotap_ampdu_agg = -1;
+static int hf_radiotap_ampdu_idx = -1;
 
 /* "Present" flags */
 static int hf_radiotap_present_tsft = -1;
@@ -187,6 +190,7 @@ static int hf_radiotap_present_hdrfcs =
 static int hf_radiotap_present_rxflags = -1;
 static int hf_radiotap_present_xchannel = -1;
 static int hf_radiotap_present_mcs = -1;
+static int hf_radiotap_present_ampdu = -1;
 static int hf_radiotap_present_rtap_ns = -1;
 static int hf_radiotap_present_vendor_ns = -1;
 static int hf_radiotap_present_ext = -1;
@@ -214,6 +218,7 @@ static gint ett_radiotap_channel_flags =
 static gint ett_radiotap_xchannel_flags = -1;
 static gint ett_radiotap_vendor = -1;
 static gint ett_radiotap_mcs = -1;
+static gint ett_radiotap_ampdu = -1;
 
 static dissector_handle_t ieee80211_handle;
 static dissector_handle_t ieee80211_datapad_handle;
@@ -514,6 +519,11 @@ void proto_register_radiotap(void)
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(MCS),
 		  "Specifies if the HT field is present", HFILL}},
 
+		{&hf_radiotap_present_ampdu,
+		 {"a-MPDU information", "radiotap.present.ampdu",
+		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(AMPDU),
+		  "Specifies if the a-MPDU field is present", HFILL}},
+
 		{&hf_radiotap_present_rtap_ns,
 		 {"Radiotap NS next", "radiotap.present.rtap_ns",
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(RADIOTAP_NAMESPACE),
@@ -837,6 +847,17 @@ void proto_register_radiotap(void)
 		 {"MCS index", "radiotap.mcs.index",
 		  FT_UINT8, BASE_DEC, NULL, 0x0, NULL, HFILL}},
 
+		{&hf_radiotap_ampdu,
+		 {"a-MPDU information", "radiotap.ampdu",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_ampdu_agg,
+		 {"frame was aggregated", "radiotap.ampdu.aggregated",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_ampdu_idx,
+		 {"index in aggregate", "radiotap.ampdu.index",
+		  FT_UINT8, BASE_DEC, NULL,
+		  IEEE80211_RADIOTAP_AMPDU_IDX_MASK, NULL, HFILL}},
+
 		{&hf_radiotap_vendor_ns,
 		 {"Vendor namespace", "radiotap.vendor_namespace",
 		  FT_BYTES, BASE_NONE, NULL, 0x0,
@@ -879,6 +900,7 @@ void proto_register_radiotap(void)
 		&ett_radiotap_xchannel_flags,
 		&ett_radiotap_vendor,
 		&ett_radiotap_mcs,
+		&ett_radiotap_ampdu,
 	};
 	module_t *radiotap_module;
 
@@ -1512,6 +1534,27 @@ dissect_radiotap(tvbuff_t * tvb, packet_
 						    tvb, offset + 2, 1, mcs);
 			break;
 		}
+		case IEEE80211_RADIOTAP_AMPDU: {
+			proto_item *it;
+			proto_tree *ampdu_tree;
+			guint8 value;
+
+			if (!tree)
+				break;
+
+			value = tvb_get_guint8(tvb, offset);
+
+			it = proto_tree_add_item(radiotap_tree, hf_radiotap_ampdu,
+						 tvb, offset, 1, FALSE);
+			ampdu_tree = proto_item_add_subtree(it, ett_radiotap_ampdu);
+			proto_tree_add_none_format(ampdu_tree, hf_radiotap_ampdu_agg,
+						   tvb, offset, 1,
+						   "frame was part of an a-MPDU");
+			if (value & IEEE80211_RADIOTAP_AMPDU_IDX_VALID)
+				proto_tree_add_uint(ampdu_tree, hf_radiotap_ampdu_idx,
+						    tvb, offset, 1, value);
+			break;
+		}
 		}
 	}
 

--=-cd1yJw4Dy53K7Tkq5Z4X--
