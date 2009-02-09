From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] RX flags
Date: Mon, 9 Feb 2009 12:00:53 -0600
Message-ID: <1234172982.4175.184.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


--=-lUysiMTCgz5FaPq+jp+v
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is a request for adoption of the following new radiotap features:

 * a new flag in the "flags" field (field 1):
    - bad FCS
 * the new "RX flags" field (field 14), currently containing the
   following flag:
    - bad PLCP

Rationale:

      * The "bad FCS" flag is evidently useful when the driver knows
        that the FCS was bad but cannot get the FCS itself from the
        hardware, or when the FCS cannot be verified in software because
        of hardware decryption.
      * The "bad PLCP" flag is useful to detect spurious non-802.11
        transmissions that may be interfering with 802.11 operation and
        broken packets, if hardware is capable of passing such "frames"
        to the driver


I propose to make changes to radiotap as follows:

 1) Add the "bad FCS" flag to the flags field (field 1) with the bit
    number 6, i.e. mask 0x40. [1]
 2) Define the new RX flags field at field number 14, with the following
    definition:
     - field contents: a single 16-bit integer
     - field alignment: 2
     - define bit 0 (mask 0x0001) to be reserved (it was defined by some
       implementations as "bad FCS" which is in the flags field)
     - define bit 1 (mask 0x0002) of this field to mean "frame has bad
       PLCP"
     - all other bits (mask 0xfffc) shall be reserved for future
       assignment


I have attached two patches implementing these changes in

 * Linux for drivers using mac80211 (the generic 802.11 stack) and the
   libertas driver for Marvell hardware (no other driver uses these
   flags);

 * wireshark, adding an option to dissect bit 14 as "FCS in header" for
   non-standard radiotap files created by some tools (some of the
   proposals above are already implemented in wireshark)

Barring objections, I will repost the normative changes on in two weeks
time (Feb 23.) to be adopted on March 2, at which point I will make the
changes to the radiotap.org website and post the Linux patch for
inclusion.

johannes

=EF=BB=BF[1] =EF=BB=BFThis leaves one bit (0x80) in the flags which wiresha=
rk interprets
as "short guard interval" (from 11n) which may be added in a later
proposal


--=-lUysiMTCgz5FaPq+jp+v
Content-Disposition: attachment; filename=035-linux-radiotap-rxflags.patch
Content-Type: text/x-vhdl; name=035-linux-radiotap-rxflags.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

---
 drivers/net/wireless/libertas/radiotap.h |   10 ----------
 drivers/net/wireless/libertas/rx.c       |   12 ++----------
 include/net/ieee80211_radiotap.h         |    4 +++-
 net/mac80211/rx.c                        |    7 ++++---
 4 files changed, 9 insertions(+), 24 deletions(-)

--- wireless-testing.orig/drivers/net/wireless/libertas/radiotap.h	2009-01-29 19:23:02.000000000 +0100
+++ wireless-testing/drivers/net/wireless/libertas/radiotap.h	2009-02-04 16:06:27.000000000 +0100
@@ -33,22 +33,12 @@ struct rx_radiotap_hdr {
 	struct ieee80211_radiotap_header hdr;
 	u8 flags;
 	u8 rate;
-	u16 chan_freq;
-	u16 chan_flags;
-	u8 antenna;
 	u8 antsignal;
-	u16 rx_flags;
-#if 0
-	u8 pad[IEEE80211_RADIOTAP_HDRLEN - 18];
-#endif
 } __attribute__ ((packed));
 
 #define RX_RADIOTAP_PRESENT (			\
 	(1 << IEEE80211_RADIOTAP_FLAGS) |	\
 	(1 << IEEE80211_RADIOTAP_RATE) |	\
-	(1 << IEEE80211_RADIOTAP_CHANNEL) |	\
-	(1 << IEEE80211_RADIOTAP_ANTENNA) |	\
 	(1 << IEEE80211_RADIOTAP_DB_ANTSIGNAL) |\
-	(1 << IEEE80211_RADIOTAP_RX_FLAGS) |	\
 	0)
 
--- wireless-testing.orig/include/net/ieee80211_radiotap.h	2009-01-29 19:23:02.000000000 +0100
+++ wireless-testing/include/net/ieee80211_radiotap.h	2009-02-04 16:06:27.000000000 +0100
@@ -230,8 +230,10 @@ enum ieee80211_radiotap_type {
 						 * 802.11 header and payload
 						 * (to 32-bit boundary)
 						 */
+#define IEEE80211_RADIOTAP_F_BADFCS	0x40	/* bad FCS */
+
 /* For IEEE80211_RADIOTAP_RX_FLAGS */
-#define IEEE80211_RADIOTAP_F_RX_BADFCS	0x0001	/* frame failed crc check */
+#define IEEE80211_RADIOTAP_F_RX_BADPLCP	0x0002	/* frame has bad PLCP */
 
 /* For IEEE80211_RADIOTAP_TX_FLAGS */
 #define IEEE80211_RADIOTAP_F_TX_FAIL	0x0001	/* failed due to excessive
--- wireless-testing.orig/drivers/net/wireless/libertas/rx.c	2009-01-29 19:23:02.000000000 +0100
+++ wireless-testing/drivers/net/wireless/libertas/rx.c	2009-02-04 16:06:27.000000000 +0100
@@ -351,19 +351,11 @@ static int process_rxed_802_11_packet(st
 	radiotap_hdr.hdr.it_pad = 0;
 	radiotap_hdr.hdr.it_len = cpu_to_le16 (sizeof(struct rx_radiotap_hdr));
 	radiotap_hdr.hdr.it_present = cpu_to_le32 (RX_RADIOTAP_PRESENT);
-	/* unknown values */
-	radiotap_hdr.flags = 0;
-	radiotap_hdr.chan_freq = 0;
-	radiotap_hdr.chan_flags = 0;
-	radiotap_hdr.antenna = 0;
-	/* known values */
+	if (!(prxpd->status & cpu_to_le16(MRVDRV_RXPD_STATUS_OK)))
+		radiotap_hdr.flags |= IEEE80211_RADIOTAP_F_BADFCS;
 	radiotap_hdr.rate = convert_mv_rate_to_radiotap(prxpd->rx_rate);
 	/* XXX must check no carryout */
 	radiotap_hdr.antsignal = prxpd->snr + prxpd->nf;
-	radiotap_hdr.rx_flags = 0;
-	if (!(prxpd->status & cpu_to_le16(MRVDRV_RXPD_STATUS_OK)))
-		radiotap_hdr.rx_flags |= IEEE80211_RADIOTAP_F_RX_BADFCS;
-	//memset(radiotap_hdr.pad, 0x11, IEEE80211_RADIOTAP_HDRLEN - 18);
 
 	/* chop the rxpd */
 	skb_pull(skb, sizeof(struct rxpd));
--- wireless-testing.orig/net/mac80211/rx.c	2009-02-04 16:03:34.000000000 +0100
+++ wireless-testing/net/mac80211/rx.c	2009-02-04 16:06:27.000000000 +0100
@@ -142,6 +142,8 @@ ieee80211_add_rx_radiotap_header(struct 
 	/* IEEE80211_RADIOTAP_FLAGS */
 	if (local->hw.flags & IEEE80211_HW_RX_INCLUDES_FCS)
 		*pos |= IEEE80211_RADIOTAP_F_FCS;
+	if (status->flag & (RX_FLAG_FAILED_FCS_CRC | RX_FLAG_FAILED_PLCP_CRC))
+		*pos |= IEEE80211_RADIOTAP_F_BADFCS;
 	if (status->flag & RX_FLAG_SHORTPRE)
 		*pos |= IEEE80211_RADIOTAP_F_SHORTPRE;
 	pos++;
@@ -204,9 +206,8 @@ ieee80211_add_rx_radiotap_header(struct 
 	/* ensure 2 byte alignment for the 2 byte field as required */
 	if ((pos - (unsigned char *)rthdr) & 1)
 		pos++;
-	/* FIXME: when radiotap gets a 'bad PLCP' flag use it here */
-	if (status->flag & (RX_FLAG_FAILED_FCS_CRC | RX_FLAG_FAILED_PLCP_CRC))
-		*(__le16 *)pos |= cpu_to_le16(IEEE80211_RADIOTAP_F_RX_BADFCS);
+	if (status->flag & RX_FLAG_FAILED_PLCP_CRC)
+		*(__le16 *)pos |= cpu_to_le16(IEEE80211_RADIOTAP_F_RX_BADPLCP);
 	pos += 2;
 }
 

--=-lUysiMTCgz5FaPq+jp+v
Content-Disposition: attachment; filename=wireshark-radiotap-rxflags.patch
Content-Type: text/x-vhdl; name=wireshark-radiotap-rxflags.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

---
 epan/dissectors/packet-radiotap.c |  131 +++++++++++++++++++++++++-------------
 1 file changed, 87 insertions(+), 44 deletions(-)

--- wireshark.orig/epan/dissectors/packet-radiotap.c	2008-09-12 22:36:17.000000000 +0200
+++ wireshark/epan/dissectors/packet-radiotap.c	2008-09-12 22:43:28.000000000 +0200
@@ -35,6 +35,7 @@
 #include <epan/packet.h>
 #include <epan/crc32.h>
 #include <epan/frequency-utils.h>
+#include <epan/prefs.h>
 #include "packet-ieee80211.h"
 #include "packet-radiotap.h"
 
@@ -71,23 +72,6 @@ struct ieee80211_radiotap_header {
 #define RADIOTAP_LENGTH_OFFSET	2	/* offset of length field */
 #define RADIOTAP_PRESENT_OFFSET	4	/* offset of "present" field */
 
-/*
- * AAAAAAAAAAAAAAAAAAAAAAAAAARGH.
- *
- * The current NetBSD ieee80211_radiotap.h has IEEE80211_RADIOTAP_RX_FLAGS
- * as 14.
- *
- * The current OpenBSD ieee80211_radiotap.h has IEEE80211_RADIOTAP_FCS as
- * 14.
- *
- * NetBSD and OpenBSD also differ on what comes *after* 14.
- *
- * They all use the same DLT_ value for "802.11+radiotap".
- *
- * This is all wonderfully appreciated by those of us who write code to
- * read files containing packets with radiotap headers.  I will see if
- * I can apply a little cluebat-fu here.
- */
 enum ieee80211_radiotap_type {
     IEEE80211_RADIOTAP_TSFT = 0,
     IEEE80211_RADIOTAP_FLAGS = 1,
@@ -103,7 +87,7 @@ enum ieee80211_radiotap_type {
     IEEE80211_RADIOTAP_ANTENNA = 11,
     IEEE80211_RADIOTAP_DB_ANTSIGNAL = 12,
     IEEE80211_RADIOTAP_DB_ANTNOISE = 13,
-    IEEE80211_RADIOTAP_FCS = 14,
+    IEEE80211_RADIOTAP_RX_FLAGS = 14,
     IEEE80211_RADIOTAP_XCHANNEL = 18,
     IEEE80211_RADIOTAP_EXT = 31
 };
@@ -167,6 +151,9 @@ enum ieee80211_radiotap_type {
 #define	IEEE80211_RADIOTAP_F_BADFCS	0x40	/* does not pass FCS check */
 #define	IEEE80211_RADIOTAP_F_SHORTGI	0x80	/* HT short GI */
 
+/* For IEEE80211_RADIOTAP_RX_FLAGS */
+#define IEEE80211_RADIOTAP_F_RX_BADPLCP		0x0002 /* bad PLCP */
+
 /* XXX need max array size */
 static const int ieee80211_htrates[16] = {
 	13,		/* IFM_IEEE80211_MCS0 */
@@ -210,6 +197,8 @@ static int hf_radiotap_channel_flags_gsm
 static int hf_radiotap_channel_flags_sturbo = -1;
 static int hf_radiotap_channel_flags_half = -1;
 static int hf_radiotap_channel_flags_quarter = -1;
+static int hf_radiotap_rxflags = -1;
+static int hf_radiotap_rxflags_badplcp = -1;
 static int hf_radiotap_xchannel = -1;
 static int hf_radiotap_xchannel_frequency = -1;
 static int hf_radiotap_xchannel_flags = -1;
@@ -258,7 +247,8 @@ static int hf_radiotap_present_dbm_tx_at
 static int hf_radiotap_present_antenna = -1;
 static int hf_radiotap_present_db_antsignal = -1;
 static int hf_radiotap_present_db_antnoise = -1;
-static int hf_radiotap_present_fcs = -1;
+static int hf_radiotap_present_hdrfcs = -1;
+static int hf_radiotap_present_rxflags = -1;
 static int hf_radiotap_present_xchannel = -1;
 static int hf_radiotap_present_ext = -1;
 
@@ -280,12 +270,16 @@ static int hf_radiotap_fcs_bad = -1;
 static gint ett_radiotap = -1;
 static gint ett_radiotap_present = -1;
 static gint ett_radiotap_flags = -1;
+static gint ett_radiotap_rxflags = -1;
 static gint ett_radiotap_channel_flags = -1;
 static gint ett_radiotap_xchannel_flags = -1;
 
 static dissector_handle_t ieee80211_handle;
 static dissector_handle_t ieee80211_datapad_handle;
 
+/* Settings */
+static gboolean radiotap_bit14_fcs = FALSE;
+
 static void
 dissect_radiotap(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree);
 
@@ -447,7 +441,7 @@ proto_register_radiotap(void)
 #define RADIOTAP_MASK_ANTENNA               0x00000800
 #define RADIOTAP_MASK_DB_ANTSIGNAL          0x00001000
 #define RADIOTAP_MASK_DB_ANTNOISE           0x00002000
-#define RADIOTAP_MASK_FCS                   0x00004000
+#define RADIOTAP_MASK_RX_FLAGS              0x00004000
 #define RADIOTAP_MASK_XCHANNEL              0x00040000
 #define RADIOTAP_MASK_EXT                   0x80000000
 
@@ -522,9 +516,14 @@ proto_register_radiotap(void)
 	FT_BOOLEAN, 32, NULL, RADIOTAP_MASK_DB_ANTNOISE,
 	"Specifies if the RF signal power at antenna in dBm field is present", HFILL } },
 
-    { &hf_radiotap_present_fcs,
+    { &hf_radiotap_present_rxflags,
+      { "RX flags", "radiotap.present.rxflags",
+	FT_BOOLEAN, 32, NULL, RADIOTAP_MASK_RX_FLAGS,
+	"Specifies if the RX flags field is present", HFILL } },
+
+    { &hf_radiotap_present_hdrfcs,
       { "FCS in header", "radiotap.present.fcs",
-	FT_BOOLEAN, 32, NULL, RADIOTAP_MASK_FCS,
+	FT_BOOLEAN, 32, NULL, RADIOTAP_MASK_RX_FLAGS,
 	"Specifies if the FCS field is present", HFILL } },
 
     { &hf_radiotap_present_xchannel,
@@ -650,6 +649,15 @@ proto_register_radiotap(void)
        { "Quarter Rate Channel (5MHz Channel Width)", "radiotap.channel.type.quarter",
 	 FT_BOOLEAN, 16, NULL, 0x8000, "Channel Type Quarter Rate", HFILL } },
 
+    { &hf_radiotap_rxflags,
+      { "RX flags", "radiotap.rxflags",
+	FT_UINT16, BASE_HEX, NULL, 0x0, "", HFILL } },
+
+    { &hf_radiotap_rxflags_badplcp,
+       { "Bad PLCP", "radiotap.rxflags.badplcp",
+	 FT_BOOLEAN, 24, NULL, IEEE80211_RADIOTAP_F_RX_BADPLCP,
+	 "Frame with bad PLCP", HFILL } },
+
     { &hf_radiotap_xchannel,
       { "Channel number", "radiotap.xchannel",
 	FT_UINT32, BASE_DEC, NULL, 0x0, "", HFILL } },
@@ -776,15 +784,24 @@ proto_register_radiotap(void)
     &ett_radiotap,
     &ett_radiotap_present,
     &ett_radiotap_flags,
+    &ett_radiotap_rxflags,
     &ett_radiotap_channel_flags,
     &ett_radiotap_xchannel_flags
   };
+  module_t *radiotap_module;
 
   proto_radiotap = proto_register_protocol("IEEE 802.11 Radiotap Capture header", "802.11 Radiotap", "radiotap");
   proto_register_field_array(proto_radiotap, hf, array_length(hf));
   proto_register_subtree_array(ett, array_length(ett));
   register_dissector("radiotap", dissect_radiotap, proto_radiotap);
 
+  radiotap_module = prefs_register_protocol(proto_radiotap, NULL);
+  prefs_register_bool_preference(radiotap_module, "bit14_fcs_in_header",
+      "Assume bit 14 means FCS in header",
+      "Radiotap has a bit to indicate whether the FCS is still on the frame or not. "
+      "Some generators (e.g. AirPcap) use a non-standard radiotap flag 14 to put "
+      "the FCS into the header.",
+      &radiotap_bit14_fcs);
 }
 
 static void
@@ -794,11 +811,7 @@ dissect_radiotap(tvbuff_t *tvb, packet_i
     proto_tree *pt, *present_tree = NULL;
     proto_tree *ft, *flags_tree = NULL;
     proto_item *ti = NULL;
-    proto_item *hdr_fcs_ti = NULL;
-    int hdr_fcs_offset = 0;
     int align_offset, offset;
-    guint32 sent_fcs = 0;
-    guint32 calc_fcs;
     tvbuff_t *next_tvb;
     guint32 version;
     guint length, length_remaining;
@@ -807,6 +820,11 @@ dissect_radiotap(tvbuff_t *tvb, packet_i
     guint8 db, rflags;
     guint32 present, next_present;
     int bit;
+    /* backward compat with bit 14 == fcs in header */
+    proto_item *hdr_fcs_ti = NULL;
+    int hdr_fcs_offset = 0;
+    guint32 sent_fcs = 0;
+    guint32 calc_fcs;
 
     if(check_col(pinfo->cinfo, COL_PROTOCOL))
 	col_set_str(pinfo->cinfo, COL_PROTOCOL, "WLAN");
@@ -883,8 +901,12 @@ dissect_radiotap(tvbuff_t *tvb, packet_i
         tvb, 4, 4, TRUE);
     proto_tree_add_item(present_tree, hf_radiotap_present_db_antnoise,
         tvb, 4, 4, TRUE);
-    proto_tree_add_item(present_tree, hf_radiotap_present_fcs,
-        tvb, 4, 4, TRUE);
+    if (radiotap_bit14_fcs)
+        proto_tree_add_item(present_tree, hf_radiotap_present_hdrfcs,
+            tvb, 4, 4, TRUE);
+    else
+        proto_tree_add_item(present_tree, hf_radiotap_present_rxflags,
+            tvb, 4, 4, TRUE);
     proto_tree_add_item(present_tree, hf_radiotap_present_xchannel,
         tvb, 4, 4, TRUE);
     proto_tree_add_item(present_tree, hf_radiotap_present_ext,
@@ -1209,21 +1231,40 @@ dissect_radiotap(tvbuff_t *tvb, packet_i
 	    offset+=2;
 	    length_remaining-=2;
 	    break;
-	case IEEE80211_RADIOTAP_FCS:
-        /* This handles the case of an FCS existing inside the radiotap header. */
-	    align_offset = ALIGN_OFFSET(offset, 4);
-	    offset += align_offset;
-	    length_remaining -= align_offset;
-	    if (length_remaining < 4)
-		break;
-        if (tree) {
-        sent_fcs = tvb_get_ntohl(tvb, offset);
-		hdr_fcs_ti = proto_tree_add_uint(radiotap_tree, hf_radiotap_fcs,
-				tvb, offset, 4, sent_fcs);
-        hdr_fcs_offset = offset;
-        }
-	    offset+=4;
-	    length_remaining-=4;
+	case IEEE80211_RADIOTAP_RX_FLAGS:
+	    if (radiotap_bit14_fcs) {
+	        align_offset = ALIGN_OFFSET(offset, 4);
+	        offset += align_offset;
+	        length_remaining -= align_offset;
+	        if (length_remaining < 4)
+	            break;
+                if (tree) {
+                    sent_fcs = tvb_get_ntohl(tvb, offset);
+                    hdr_fcs_ti = proto_tree_add_uint(radiotap_tree, hf_radiotap_fcs,
+                                                     tvb, offset, 4, sent_fcs);
+                    hdr_fcs_offset = offset;
+                }
+                offset+=4;
+                length_remaining-=4;
+	    } else {
+	        proto_item *it;
+
+                align_offset = ALIGN_OFFSET(offset, 2);
+                offset += align_offset;
+                length_remaining -= align_offset;
+                if (length_remaining < 2)
+                    break;
+                if (tree) {
+                    flags = tvb_get_letohs(tvb, offset);
+                    it = proto_tree_add_uint(radiotap_tree, hf_radiotap_rxflags,
+                            tvb, offset, 2, flags);
+                    flags_tree = proto_item_add_subtree(it, ett_radiotap_rxflags);
+                    proto_tree_add_boolean(flags_tree, hf_radiotap_rxflags_badplcp,
+                            tvb, offset, 1, flags);
+                }
+                offset+=2;
+                length_remaining-=2;
+            }
 	    break;
 	default:
 	    /*
@@ -1244,7 +1285,9 @@ dissect_radiotap(tvbuff_t *tvb, packet_i
     /* Grab the rest of the frame. */
 	next_tvb = tvb_new_subset(tvb, length, -1, -1);
 
-    /* If we had an in-header FCS, check it. */
+    /* If we had an in-header FCS, check it.
+     * This can only happen if the backward-compat configuration option
+     * is chosen by the user. */
     if (hdr_fcs_ti) {
         /* It would be very strange for the header to have an FCS for the
          * frame *and* the frame to have the FCS at the end, but it's possible, so

--=-lUysiMTCgz5FaPq+jp+v--
