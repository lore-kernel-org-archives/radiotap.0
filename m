From: "Alwin Beukers" <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Wireshark patch for proposed VHT field
Date: Tue, 24 Jul 2012 15:44:36 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B3065080E1E@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi all,

This is the Wireshark patch for dissecting the proposed 802.11ac  radiotap =
field
(see http://www.radiotap.org/suggested-fields/VHT).

Your comments on this patch as well as on the proposed field are appreciate=
d.

Alwin


Index: epan/dissectors/packet-ieee80211-radiotap-defs.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- epan/dissectors/packet-ieee80211-radiotap-defs.h	(revision 43623)
+++ epan/dissectors/packet-ieee80211-radiotap-defs.h	(working copy)
@@ -204,6 +204,7 @@
 	IEEE80211_RADIOTAP_DATA_RETRIES =3D 17,
 	IEEE80211_RADIOTAP_XCHANNEL =3D 18, /* Unofficial, used by FreeBSD */
 	IEEE80211_RADIOTAP_MCS =3D 19,
+	IEEE80211_RADIOTAP_VHT =3D 20,
=20
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE =3D 29,
@@ -270,4 +271,54 @@
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
 #define IEEE80211_RADIOTAP_MCS_STBC		0x20
=20
+/* For IEEE80211_RADIOTAP_VHT */
+#define IEEE80211_RADIOTAP_VHT_HAVE_STBC	0x0001
+#define IEEE80211_RADIOTAP_VHT_HAVE_TXOP_PS	0x0002
+#define IEEE80211_RADIOTAP_VHT_HAVE_GI		0x0004
+#define IEEE80211_RADIOTAP_VHT_HAVE_SGI_NSYM_DA	0x0008
+#define IEEE80211_RADIOTAP_VHT_HAVE_LDPC_EXTRA	0x0010
+#define IEEE80211_RADIOTAP_VHT_HAVE_BF		0x0020
+#define IEEE80211_RADIOTAP_VHT_HAVE_BW		0x0040
+#define IEEE80211_RADIOTAP_VHT_HAVE_GID		0x0080
+#define IEEE80211_RADIOTAP_VHT_HAVE_PAID	0x0100
+
+#define IEEE80211_RADIOTAP_VHT_STBC		0x01
+#define IEEE80211_RADIOTAP_VHT_TXOP_PS		0x02
+#define IEEE80211_RADIOTAP_VHT_SGI		0x04
+#define IEEE80211_RADIOTAP_VHT_SGI_NSYM_DA	0x08
+#define IEEE80211_RADIOTAP_VHT_LDPC_EXTRA	0x10
+#define IEEE80211_RADIOTAP_VHT_BF		0x20
+
+#define IEEE80211_RADIOTAP_VHT_NSS		0x0f
+#define IEEE80211_RADIOTAP_VHT_MCS		0xf0
+
+#define IEEE80211_RADIOTAP_VHT_CODING_LDPC	0x01
+
+#define IEEE80211_RADIOTAP_VHT_BW_20		IEEE80211_RADIOTAP_MCS_BW_20
+#define IEEE80211_RADIOTAP_VHT_BW_40		IEEE80211_RADIOTAP_MCS_BW_40
+#define IEEE80211_RADIOTAP_VHT_BW_20L		IEEE80211_RADIOTAP_MCS_BW_20L
+#define IEEE80211_RADIOTAP_VHT_BW_20U		IEEE80211_RADIOTAP_MCS_BW_20U
+#define IEEE80211_RADIOTAP_VHT_BW_80		4
+#define IEEE80211_RADIOTAP_VHT_BW_40L		5
+#define IEEE80211_RADIOTAP_VHT_BW_40U		6
+#define IEEE80211_RADIOTAP_VHT_BW_20LL		7
+#define IEEE80211_RADIOTAP_VHT_BW_20LU		8
+#define IEEE80211_RADIOTAP_VHT_BW_20UL		9
+#define IEEE80211_RADIOTAP_VHT_BW_20UU		10
+#define IEEE80211_RADIOTAP_VHT_BW_160		11
+#define IEEE80211_RADIOTAP_VHT_BW_80L		12
+#define IEEE80211_RADIOTAP_VHT_BW_80U		13
+#define IEEE80211_RADIOTAP_VHT_BW_40LL		14
+#define IEEE80211_RADIOTAP_VHT_BW_40LU		15
+#define IEEE80211_RADIOTAP_VHT_BW_40UL		16
+#define IEEE80211_RADIOTAP_VHT_BW_40UU		17
+#define IEEE80211_RADIOTAP_VHT_BW_20LLL		18
+#define IEEE80211_RADIOTAP_VHT_BW_20LLU		19
+#define IEEE80211_RADIOTAP_VHT_BW_20LUL		20
+#define IEEE80211_RADIOTAP_VHT_BW_20LUU		21
+#define IEEE80211_RADIOTAP_VHT_BW_20ULL		22
+#define IEEE80211_RADIOTAP_VHT_BW_20ULU		23
+#define IEEE80211_RADIOTAP_VHT_BW_20UUL		24
+#define IEEE80211_RADIOTAP_VHT_BW_20UUU		25
+
 #endif				/* IEEE80211_RADIOTAP_H */
Index: epan/dissectors/packet-ieee80211-radiotap.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- epan/dissectors/packet-ieee80211-radiotap.c	(revision 43623)
+++ epan/dissectors/packet-ieee80211-radiotap.c	(working copy)
@@ -79,6 +79,143 @@
 #define	IEEE80211_CHAN_108PUREG \
 	(IEEE80211_CHAN_PUREG | IEEE80211_CHAN_TURBO)
=20
+#define MAX_MCS_VHT_INDEX	9
+
+/*
+ * Maps a VHT bandwidth index to ieee80211_vhtinfo.rates index.
+ */
+static const int ieee80211_vht_bw2rate_index[] =3D {
+		/*  20Mhz total */	0,
+		/*  40Mhz total */	1, 0, 0,
+		/*  80Mhz total */	2, 1, 1, 0, 0, 0, 0,
+		/* 160Mhz total */	3, 2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+struct mcs_vht_info {
+	char *modulation;
+	char *coding_rate;
+	float rates[4][2];
+};
+
+static const struct mcs_vht_info ieee80211_vhtinfo[MAX_MCS_VHT_INDEX+1] =
=3D {
+		/* MCS  0  */
+		{	"BPSK",		"1/2",
+				{		/* 20 Mhz */  {    6.5f,		/* SGI */    7.2f, },
+						/* 40 Mhz */  {   13.5f,		/* SGI */   15.0f, },
+						/* 80 Mhz */  {   29.3f,		/* SGI */   32.5f, },
+						/* 160 Mhz */ {   58.5f,		/* SGI */   65.0f, }
+				}
+		},
+		/* MCS  1  */
+		{	"QPSK",		"1/2",
+				{		/* 20 Mhz */  {   13.0f,		/* SGI */   14.4f, },
+						/* 40 Mhz */  {   27.0f,		/* SGI */   30.0f, },
+						/* 80 Mhz */  {   58.5f,		/* SGI */   65.0f, },
+						/* 160 Mhz */ {  117.0f,		/* SGI */  130.0f, }
+				}
+		},
+		/* MCS  2  */
+		{	"QPSK",		"3/4",
+				{		/* 20 Mhz */  {   19.5f,		/* SGI */   21.7f, },
+						/* 40 Mhz */  {   40.5f,		/* SGI */   45.0f, },
+						/* 80 Mhz */  {   87.8f,		/* SGI */   97.5f, },
+						/* 160 Mhz */ {  175.5f,		/* SGI */  195.0f, }
+				}
+		},
+		/* MCS  3  */
+		{	"16-QAM",	"1/2",
+				{		/* 20 Mhz */  {   26.0f,		/* SGI */   28.9f, },
+						/* 40 Mhz */  {   54.0f,		/* SGI */   60.0f, },
+						/* 80 Mhz */  {  117.0f,		/* SGI */  130.0f, },
+						/* 160 Mhz */ {  234.0f,		/* SGI */  260.0f, }
+				}
+		},
+		/* MCS  4  */
+		{	"16-QAM",	"3/4",
+				{		/* 20 Mhz */  {   39.0f,		/* SGI */   43.3f, },
+						/* 40 Mhz */  {   81.0f,		/* SGI */   90.0f, },
+						/* 80 Mhz */  {  175.5f,		/* SGI */  195.0f, },
+						/* 160 Mhz */ {  351.0f,		/* SGI */  390.0f, }
+				}
+		},
+		/* MCS  5  */
+		{	"64-QAM",	"2/3",
+				{		/* 20 Mhz */  {   52.0f,		/* SGI */   57.8f, },
+						/* 40 Mhz */  {  108.0f,		/* SGI */  120.0f, },
+						/* 80 Mhz */  {  234.0f,		/* SGI */  260.0f, },
+						/* 160 Mhz */ {  468.0f,		/* SGI */  520.0f, }
+				}
+		},
+		/* MCS  6  */
+		{	"64-QAM",	"3/4",
+				{		/* 20 Mhz */  {   58.5f,		/* SGI */   65.0f, },
+						/* 40 Mhz */  {  121.5f,		/* SGI */  135.0f, },
+						/* 80 Mhz */  {  263.3f,		/* SGI */  292.5f, },
+						/* 160 Mhz */ {  526.5f,		/* SGI */  585.0f, }
+				}
+		},
+		/* MCS  7  */
+		{	"64-QAM",	"5/6",
+				{		/* 20 Mhz */  {   65.0f,		/* SGI */   72.2f, },
+						/* 40 Mhz */  {  135.0f,		/* SGI */  150.0f, },
+						/* 80 Mhz */  {  292.5f,		/* SGI */  325.0f, },
+						/* 160 Mhz */ {  585.0f,		/* SGI */  650.0f, }
+				}
+		},
+		/* MCS  8  */
+		{	"256-QAM",	"3/4",
+				{		/* 20 Mhz */  {   78.0f,		/* SGI */   86.7f, },
+						/* 40 Mhz */  {  162.0f,		/* SGI */  180.0f, },
+						/* 80 Mhz */  {  351.0f,		/* SGI */  390.0f, },
+						/* 160 Mhz */ {  702.0f,		/* SGI */  780.0f, }
+				}
+		},
+		/* MCS  9  */
+		{	"256-QAM",	"5/6",
+				{		/* 20 Mhz */  {    0.0f,		/* SGI */    0.0f, },
+						/* 40 Mhz */  {  180.0f,		/* SGI */  200.0f, },
+						/* 80 Mhz */  {  390.0f,		/* SGI */  433.3f, },
+						/* 160 Mhz */ {  780.0f,		/* SGI */  866.7f, }
+				}
+		}
+};
+
+static const value_string vht_bandwidth[] =3D {
+	{ IEEE80211_RADIOTAP_VHT_BW_20, "20 MHz" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20L, "20 MHz lower" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20U, "20 MHz upper" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40, "40 MHz" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20LL, "20 MHz, channel 1/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20LU, "20 MHz, channel 2/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20UL, "20 MHz, channel 3/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20UU, "20 MHz, channel 4/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40L, "40 MHz lower" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40U, "40 MHz upper" },
+	{ IEEE80211_RADIOTAP_VHT_BW_80, "80 MHz" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20LLL, "20 MHz, channel 1/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20LLU, "20 MHz, channel 2/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20LUL, "20 MHz, channel 3/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20LUU, "20 MHz, channel 4/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20ULL, "20 MHz, channel 5/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20ULU, "20 MHz, channel 6/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20UUL, "20 MHz, channel 7/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_20UUU, "20 MHz, channel 8/8" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40LL, "40 MHz, channel 1/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40LU, "40 MHz, channel 2/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40UL, "40 MHz, channel 3/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_40UU, "40 MHz, channel 4/4" },
+	{ IEEE80211_RADIOTAP_VHT_BW_80L, "80 MHz lower" },
+	{ IEEE80211_RADIOTAP_VHT_BW_80U, "80 MHz upper" },
+	{ IEEE80211_RADIOTAP_VHT_BW_160, "160 MHz" },
+	{ 0, NULL }
+};
+
+static const value_string mcs_fec[] =3D {
+	{ 0, "BCC" },
+	{ 1, "LDPC" },
+	{ 0, NULL }
+};
+
 #define MAX_MCS_INDEX	76
=20
 /*
@@ -553,6 +690,32 @@
 static int hf_radiotap_mcs_format =3D -1;
 static int hf_radiotap_mcs_fec =3D -1;
 static int hf_radiotap_mcs_stbc =3D -1;
+static int hf_radiotap_vht =3D -1;
+static int hf_radiotap_vht_known =3D -1;
+static int hf_radiotap_vht_have_stbc =3D -1;
+static int hf_radiotap_vht_have_txop_ps =3D -1;
+static int hf_radiotap_vht_have_gi =3D -1;
+static int hf_radiotap_vht_have_sgi_nsym_da =3D -1;
+static int hf_radiotap_vht_have_ldpc_extra =3D -1;
+static int hf_radiotap_vht_have_bf =3D -1;
+static int hf_radiotap_vht_have_bw =3D -1;
+static int hf_radiotap_vht_have_gid =3D -1;
+static int hf_radiotap_vht_have_p_aid =3D -1;
+static int hf_radiotap_vht_stbc =3D -1;
+static int hf_radiotap_vht_txop_ps =3D -1;
+static int hf_radiotap_vht_gi =3D -1;
+static int hf_radiotap_vht_sgi_nsym_da =3D -1;
+static int hf_radiotap_vht_ldpc_extra =3D -1;
+static int hf_radiotap_vht_bf =3D -1;
+static int hf_radiotap_vht_bw =3D -1;
+static int hf_radiotap_vht_nsts[4] =3D { -1, -1, -1, -1 };
+static int hf_radiotap_vht_mcs[4] =3D { -1, -1, -1, -1 };
+static int hf_radiotap_vht_nss[4] =3D { -1, -1, -1, -1 };
+static int hf_radiotap_vht_coding[4] =3D { -1, -1, -1, -1 };
+static int hf_radiotap_vht_datarate[4] =3D { -1, -1, -1, -1 };
+static int hf_radiotap_vht_gid =3D -1;
+static int hf_radiotap_vht_p_aid =3D -1;
+static int hf_radiotap_vht_user =3D -1;
=20
 /* "Present" flags */
 static int hf_radiotap_present_tsft =3D -1;
@@ -573,6 +736,7 @@
 static int hf_radiotap_present_rxflags =3D -1;
 static int hf_radiotap_present_xchannel =3D -1;
 static int hf_radiotap_present_mcs =3D -1;
+static int hf_radiotap_present_vht =3D -1;
 static int hf_radiotap_present_rtap_ns =3D -1;
 static int hf_radiotap_present_vendor_ns =3D -1;
 static int hf_radiotap_present_ext =3D -1;
@@ -601,6 +765,9 @@
 static gint ett_radiotap_vendor =3D -1;
 static gint ett_radiotap_mcs =3D -1;
 static gint ett_radiotap_mcs_known =3D -1;
+static gint ett_radiotap_vht =3D -1;
+static gint ett_radiotap_vht_known =3D -1;
+static gint ett_radiotap_vht_user =3D -1;
=20
 static dissector_handle_t ieee80211_handle;
 static dissector_handle_t ieee80211_datapad_handle;
@@ -764,12 +931,6 @@
 		{0, NULL},
 	};
=20
-	static const value_string mcs_fec[] =3D {
-		{ 0, "BCC" },
-		{ 1, "LDPC" },
-		{0, NULL}
-	};
-
 	static const value_string mcs_gi[] =3D {
 		{ 0, "long" },
 		{ 1, "short" },
@@ -905,6 +1066,11 @@
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(MCS),
 		  "Specifies if the HT field is present", HFILL}},
=20
+		{&hf_radiotap_present_vht,
+		 {"VHT information", "radiotap.present.vht",
+		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(VHT),
+		  "Specifies if the VHT field is present", HFILL}},
+
 		{&hf_radiotap_present_rtap_ns,
 		 {"Radiotap NS next", "radiotap.present.rtap_ns",
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(RADIOTAP_NAMESPACE),
@@ -1261,6 +1427,169 @@
 		 {"MCS index", "radiotap.mcs.index",
 		  FT_UINT8, BASE_DEC, NULL, 0x0, NULL, HFILL}},
=20
+		{&hf_radiotap_vht,
+		 {"VHT information", "radiotap.vht",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_vht_known,
+		 {"Known VHT information", "radiotap.vht.known",
+		  FT_UINT8, BASE_HEX, NULL, 0x0,
+		  "Bit mask indicating what VHT information is present", HFILL}},
+		{&hf_radiotap_vht_user,
+		 {"User", "radiotap.vht.user",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_vht_have_stbc,
+		 {"STBC", "radiotap.vht.have_stbc",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_STBC,
+		  "Space Time Block Coding information present", HFILL}},
+		{&hf_radiotap_vht_have_txop_ps,
+		 {"TXOP_PS_NOT_ALLOWED", "radiotap.vht.have_txop_ps",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_TXOP_PS,
+		  "TXOP_PS_NOT_ALLOWED information present", HFILL}},
+		{&hf_radiotap_vht_have_gi,
+		 {"Guard interval", "radiotap.vht.have_gi",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_GI,
+		  "Short/Long guard interval information present", HFILL}},
+		{&hf_radiotap_vht_have_sgi_nsym_da,
+		 {"SGI Nsym disambiguation", "radiotap.vht.have_sgi_nsym_da",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_SGI_NSYM_DA,
+		  "Short guard interval Nsym disambiguation information present", HFILL}=
},
+		{&hf_radiotap_vht_have_ldpc_extra,
+		 {"LDPC extra OFDM symbol", "radiotap.vht.ldpc_extra",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_LDPC_EXTRA,
+		  "LDPC extra OFDM symbol information present", HFILL}},
+		{&hf_radiotap_vht_have_bf,
+		 {"Beamformed", "radiotap.vht.have_beamformed",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_BF,
+		  "Beamformed information present", HFILL}},
+		{&hf_radiotap_vht_have_bw,
+		 {"Bandwidth", "radiotap.mcs.have_bw",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_BW,
+		  "Bandwidth information present", HFILL}},
+		{&hf_radiotap_vht_have_gid,
+		 {"Group ID", "radiotap.mcs.have_gid",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_GID,
+		  "Group ID information present", HFILL}},
+		{&hf_radiotap_vht_have_p_aid,
+		 {"Partial AID", "radiotap.mcs.have_paid",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_HAVE_PAID,
+		  "Partial AID information present", HFILL}},
+		{&hf_radiotap_vht_stbc,
+		 {"STBC", "radiotap.vht.stbc",
+		  FT_BOOLEAN, 8, TFS(&tfs_on_off), IEEE80211_RADIOTAP_VHT_STBC,
+		  "Space Time Block Coding flag", HFILL}},
+		{&hf_radiotap_vht_txop_ps,
+		 {"TXOP_PS_NOT_ALLOWED", "radiotap.vht.txop_ps",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_TXOP_PS,
+		  "Flag indicating whether STAs may doze during TXOP", HFILL}},
+		{&hf_radiotap_vht_gi,
+		 {"Guard interval", "radiotap.vht.gi",
+		  FT_UINT8, BASE_DEC, VALS(mcs_gi), IEEE80211_RADIOTAP_VHT_SGI,
+		  "Short/Long guard interval", HFILL}},
+		{&hf_radiotap_vht_sgi_nsym_da,
+		 {"SGI Nsym disambiguation", "radiotap.vht.sgi_nsym_da",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_SGI_NSYM_DA,
+		  "Short Guard Interval Nsym disambiguation", HFILL}},
+		{&hf_radiotap_vht_ldpc_extra,
+		 {"LDPC extra OFDM symbol", "radiotap.vht.ldpc_extra",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_LDPC_EXTRA,
+		  "LDPC extra OFDM symbol", HFILL}},
+		{&hf_radiotap_vht_bf,
+		 {"Beamformed", "radiotap.vht.beamformed",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_VHT_BF,
+		  "Beamformed", HFILL}},
+		{&hf_radiotap_vht_bw,
+		 {"Bandwidth", "radiotap.vht.bw",
+		  FT_UINT8, BASE_DEC, VALS(vht_bandwidth), 0x0,
+		  "Bandwidth", HFILL}},
+		{&hf_radiotap_vht_nsts[0],
+		 {"Nsts 0", "radiotap.vht.nsts.0",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of Space-time streams", HFILL}},
+		{&hf_radiotap_vht_nsts[1],
+		 {"Nsts 1", "radiotap.vht.nsts.1",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of Space-time streams", HFILL}},
+		{&hf_radiotap_vht_nsts[2],
+		 {"Nsts 2", "radiotap.vht.nsts.2",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of Space-time streams", HFILL}},
+		{&hf_radiotap_vht_nsts[3],
+		 {"Nsts 3", "radiotap.vht.nsts.3",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of Space-time streams", HFILL}},
+		{&hf_radiotap_vht_mcs[0],
+		 {"MCS index 0", "radiotap.vht.mcs.0",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "MCS index", HFILL}},
+		{&hf_radiotap_vht_mcs[1],
+		 {"MCS index 1", "radiotap.vht.mcs.1",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "MCS index", HFILL}},
+		{&hf_radiotap_vht_mcs[2],
+		 {"MCS index 2", "radiotap.vht.mcs.2",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "MCS index", HFILL}},
+		{&hf_radiotap_vht_mcs[3],
+		 {"MCS index 3", "radiotap.vht.mcs.3",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "MCS index", HFILL}},
+		{&hf_radiotap_vht_nss[0],
+		 {"Nss 0", "radiotap.vht.nss.0",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of spatial streams", HFILL}},
+		{&hf_radiotap_vht_nss[1],
+		 {"Nss 1", "radiotap.vht.nss.1",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of spatial streams", HFILL}},
+		{&hf_radiotap_vht_nss[2],
+		 {"Nss 2", "radiotap.vht.nss.2",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of spatial streams", HFILL}},
+		{&hf_radiotap_vht_nss[3],
+		 {"Nss 3", "radiotap.vht.nss.3",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Number of spatial streams", HFILL}},
+		{&hf_radiotap_vht_coding[0],
+		 {"Coding 0", "radiotap.vht.coding.0",
+		  FT_UINT8, BASE_DEC, VALS(mcs_fec), 0x0,
+		  "Coding", HFILL}},
+		{&hf_radiotap_vht_coding[1],
+		 {"Coding 1", "radiotap.vht.coding.1",
+		  FT_UINT8, BASE_DEC, VALS(mcs_fec), 0x0,
+		  "Coding", HFILL}},
+		{&hf_radiotap_vht_coding[2],
+		 {"Coding 2", "radiotap.vht.coding.2",
+		  FT_UINT8, BASE_DEC, VALS(mcs_fec), 0x0,
+		  "Coding", HFILL}},
+		{&hf_radiotap_vht_coding[3],
+		 {"Coding 3", "radiotap.vht.coding.3",
+		  FT_UINT8, BASE_DEC, VALS(mcs_fec), 0x0,
+		  "Coding", HFILL}},
+		{&hf_radiotap_vht_datarate[0],
+		 {"Data rate (Mb/s) 0", "radiotap.vht.datarate.0",
+		  FT_FLOAT, BASE_NONE, NULL, 0x0,
+		  "Speed this frame was sent/received at", HFILL}},
+		{&hf_radiotap_vht_datarate[1],
+		 {"Data rate (Mb/s) 1", "radiotap.vht.datarate.1",
+		  FT_FLOAT, BASE_NONE, NULL, 0x0,
+		  "Speed this frame was sent/received at", HFILL}},
+		{&hf_radiotap_vht_datarate[2],
+		 {"Data rate (Mb/s) 2", "radiotap.vht.datarate.2",
+		  FT_FLOAT, BASE_NONE, NULL, 0x0,
+		  "Speed this frame was sent/received at", HFILL}},
+		{&hf_radiotap_vht_datarate[3],
+		 {"Data rate (Mb/s) 3", "radiotap.vht.datarate.3",
+		  FT_FLOAT, BASE_NONE, NULL, 0x0,
+		  "Speed this frame was sent/received at", HFILL}},
+		{&hf_radiotap_vht_gid,
+		 {"Group Id", "radiotap.vht.gid",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "Group Id", HFILL}},
+		{&hf_radiotap_vht_p_aid,
+		 {"Partial AID", "radiotap.paid",
+		  FT_UINT16, BASE_DEC, NULL, 0x0,
+		  "Partial AID", HFILL}},
+
 		{&hf_radiotap_vendor_ns,
 		 {"Vendor namespace", "radiotap.vendor_namespace",
 		  FT_BYTES, BASE_NONE, NULL, 0x0,
@@ -1304,6 +1633,9 @@
 		&ett_radiotap_vendor,
 		&ett_radiotap_mcs,
 		&ett_radiotap_mcs_known,
+		&ett_radiotap_vht,
+		&ett_radiotap_vht_known,
+		&ett_radiotap_vht_user
 	};
 	module_t *radiotap_module;
=20
@@ -1346,7 +1678,7 @@
 	int hdr_fcs_offset =3D 0;
 	guint32 sent_fcs =3D 0;
 	guint32 calc_fcs;
-	gint err;
+	gint err =3D -ENOENT;
 	struct ieee80211_radiotap_iterator iter;
 	void *data;
 	struct _radiotap_info *radiotap_info;
@@ -1509,6 +1841,10 @@
 			proto_tree_add_item(present_tree,
 					    hf_radiotap_present_mcs, tvb,
 					    offset + 4, 4, ENC_LITTLE_ENDIAN);
+			proto_tree_add_item(present_tree,
+					    hf_radiotap_present_vht, tvb,
+					    offset + 4, 4, ENC_LITTLE_ENDIAN);
+
  always_bits:
 			proto_tree_add_item(present_tree,
 					    hf_radiotap_present_rtap_ns, tvb,
@@ -2045,7 +2381,185 @@
 			}
 			break;
 		}
+
+		case IEEE80211_RADIOTAP_VHT: {
+			proto_item *it, *it_root =3D NULL;
+			proto_tree *su_vht_tree =3D NULL, *su_vht_known_tree, *user_tree;
+			guint16 known, p_aid;
+			guint8 flags, bw, mcs_nss, coding, gid;
+			guint bandwidth =3D 0;
+			guint gi_length =3D 0;
+			guint nss =3D 0;
+			guint mcs =3D 0;
+			guint nsts =3D 0;
+			guint user_coding =3D 0;
+			gboolean can_calculate_rate;
+			guint i;
+
+			/*
+			 * Start out assuming that we can calculate the rate;
+			 * if we are missing any of the MCS index, channel
+			 * width, or guard interval length, we can't.
+			 */
+			can_calculate_rate =3D TRUE;
+
+			known =3D tvb_get_letohs(tvb, offset);
+			flags =3D tvb_get_guint8(tvb, offset + 2);
+			bw =3D tvb_get_guint8(tvb, offset + 3);
+			coding =3D tvb_get_guint8(tvb, offset + 8);
+			gid =3D tvb_get_guint8(tvb, offset + 9);
+			p_aid =3D tvb_get_letohs(tvb, offset + 10);
+
+			if (tree) {
+				it_root =3D proto_tree_add_item(radiotap_tree, hf_radiotap_vht,
+						tvb, offset, 12, ENC_NA);
+				su_vht_tree =3D proto_item_add_subtree(it_root, ett_radiotap_vht);
+				it =3D proto_tree_add_uint(su_vht_tree, hf_radiotap_vht_known,
+						tvb, offset, 2, known);
+				su_vht_known_tree =3D proto_item_add_subtree(it, ett_radiotap_vht_know=
n);
+
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_stbc,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_txop_ps,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_gi,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_sgi_nsym_d=
a,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_ldpc_extra=
,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_bf,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_bw,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_gid,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(su_vht_known_tree, hf_radiotap_vht_have_p_aid,
+						tvb, offset, 2, ENC_LITTLE_ENDIAN);
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_STBC) {
+				if (su_vht_tree)
+					proto_tree_add_boolean(su_vht_tree, hf_radiotap_vht_stbc,
+							tvb, offset + 2, 1, flags);
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_TXOP_PS) {
+				if (su_vht_tree)
+					proto_tree_add_boolean(su_vht_tree, hf_radiotap_vht_txop_ps,
+							tvb, offset + 2, 1, flags);
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_GI) {
+				gi_length =3D (flags & IEEE80211_RADIOTAP_VHT_SGI) ? 1 : 0;
+				if (su_vht_tree) {
+					proto_tree_add_uint(su_vht_tree, hf_radiotap_vht_gi,
+							tvb, offset + 2, 1, flags);
+					proto_tree_add_boolean(su_vht_tree, hf_radiotap_vht_sgi_nsym_da,
+							tvb, offset + 2, 1, flags);
+				}
+			} else {
+				can_calculate_rate =3D FALSE;	/* no GI width */
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_LDPC_EXTRA) {
+				if (su_vht_tree) {
+					proto_tree_add_boolean(su_vht_tree, hf_radiotap_vht_ldpc_extra,
+							tvb, offset + 2, 1, flags);
+				}
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_BF) {
+				if (su_vht_tree)
+					proto_tree_add_boolean(su_vht_tree, hf_radiotap_vht_bf,
+							tvb, offset + 2, 1, flags);
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_BW) {
+				if (bw <=3D sizeof(ieee80211_vht_bw2rate_index)/sizeof(ieee80211_vht_b=
w2rate_index[0]))
+					bandwidth =3D ieee80211_vht_bw2rate_index[bw];
+				else
+					can_calculate_rate =3D FALSE; /* unknown bandwidth */
+
+				if (su_vht_tree)
+					proto_tree_add_uint_format(su_vht_tree, hf_radiotap_vht_bw,
+							tvb, offset + 3, 1, bw,
+							"Bandwidth: %s",
+							val_to_str(bw, vht_bandwidth, "Unknown (0x%02x)"));
+			} else {
+				can_calculate_rate =3D FALSE;	/* no bandwidth */
+			}
+
+			for(i=3D0; i<4; i++) {
+				mcs_nss =3D tvb_get_guint8(tvb, offset + 4 + i);
+				nss =3D (mcs_nss & IEEE80211_RADIOTAP_VHT_NSS);
+				mcs =3D (mcs_nss & IEEE80211_RADIOTAP_VHT_MCS) >> 4;
+				user_coding =3D (coding >> i) & IEEE80211_RADIOTAP_VHT_CODING_LDPC;
+
+				if ((known & IEEE80211_RADIOTAP_VHT_HAVE_STBC) && (flags & IEEE80211_R=
ADIOTAP_VHT_STBC))
+					nsts =3D 2 * nss;
+				else
+					nsts =3D nss;
+
+				if (nss) {
+					it =3D proto_tree_add_item(su_vht_tree, hf_radiotap_vht_user,
+						tvb, offset + 4, 5, ENC_NA);
+					proto_item_append_text(it, " %d: MCS %u", i, mcs);
+					user_tree =3D proto_item_add_subtree(it, ett_radiotap_vht_user);
+
+					it =3D proto_tree_add_uint_format(user_tree, hf_radiotap_vht_mcs[i],
+						tvb, offset + 4 + i, 1, mcs,
+						"MCS: %u", mcs);
+					if (mcs > MAX_MCS_VHT_INDEX) {
+						proto_item_append_text(it, " (invalid)");
+					} else {
+						proto_item_append_text(it, " (%s %s)",
+							ieee80211_vhtinfo[mcs].modulation,
+							ieee80211_vhtinfo[mcs].coding_rate);
+					}
+
+					proto_tree_add_uint_format(user_tree, hf_radiotap_vht_nss[i],
+						tvb, offset + 4 + i, 1, nss,
+						"Spatial streams: %u", nss);
+					proto_tree_add_uint_format(user_tree, hf_radiotap_vht_nsts[i],
+						tvb, offset + 4 + i, 1, nsts,
+						"Space-time streams: %u", nsts);
+					proto_tree_add_uint_format(user_tree, hf_radiotap_vht_coding[i],
+						tvb, offset + 8, 1, user_coding,
+						"Coding: %s", val_to_str(user_coding, mcs_fec, "Unknown (0x%02x)"));
+
+					if (can_calculate_rate) {
+						float rate =3D ieee80211_vhtinfo[mcs].rates[bandwidth][gi_length] * =
nss;
+						if (rate !=3D 0.0f) {
+							if (tree) {
+								rate_ti =3D proto_tree_add_float_format(user_tree,
+										hf_radiotap_vht_datarate[i],
+										tvb, offset, 12, rate,
+										"Data Rate: %.1f Mb/s", rate);
+								PROTO_ITEM_SET_GENERATED(rate_ti);
+							}
+						}
+					}
+				}
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_GID) {
+				if (su_vht_tree)
+					proto_tree_add_uint(su_vht_tree, hf_radiotap_vht_gid,
+							tvb, offset+9, 1, gid);
+			}
+
+			if (known & IEEE80211_RADIOTAP_VHT_HAVE_PAID) {
+				if (tree) {
+					proto_tree_add_uint(su_vht_tree, hf_radiotap_vht_p_aid,
+							tvb, offset+10, 2, p_aid);
+				}
+			}
+
+			break;
 		}
+
+		}
 	}
=20
 	if (err !=3D -ENOENT && tree) {
Index: epan/dissectors/packet-ieee80211-radiotap-iter.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- epan/dissectors/packet-ieee80211-radiotap-iter.c	(revision 43623)
+++ epan/dissectors/packet-ieee80211-radiotap-iter.c	(working copy)
@@ -50,7 +50,8 @@
 	/* [IEEE80211_RADIOTAP_RTS_RETRIES] =3D 16 */		{ 1, 1 },
 	/* [IEEE80211_RADIOTAP_DATA_RETRIES] =3D 17 */		{ 1, 1 },
 	/* [IEEE80211_RADIOTAP_XCHANNEL] =3D 18 */		{ 0, 0 }, /* Unofficial, used=
 by FreeBSD */
-	/* [IEEE80211_RADIOTAP_MCS] =3D 19 */			{ 1, 3 }
+	/* [IEEE80211_RADIOTAP_MCS] =3D 19 */			{ 1, 3 },
+	/* [IEEE80211_RADIOTAP_VHT] =3D 20 */			{ 2, 12 },
 	/*
 	 * add more here as they are defined in
 	 * include/net/ieee80211_radiotap.h
