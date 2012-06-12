From: "Alwin Beukers" <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [RFC] VHT fields
Date: Tue, 12 Jun 2012 15:05:26 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Cc: Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi everyone,

This is a proposal for adding support for 802.11ac. Four fields were added =
to the suggested-fields section:

http://www.radiotap.org/suggested-fields/SU_VHT
http://www.radiotap.org/suggested-fields/MU_VHT
http://www.radiotap.org/suggested-fields/GROUP_ID
http://www.radiotap.org/suggested-fields/PARTIAL_AID

A Wireshark patch for parsing SU_VHT, GROUP_ID and PARTIAL_AID is attached.

Any thoughts?

Thanks,
Alwin

---

Index: epan/dissectors/packet-ieee80211-radiotap-defs.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- epan/dissectors/packet-ieee80211-radiotap-defs.h	(revision 43220)
+++ epan/dissectors/packet-ieee80211-radiotap-defs.h	(working copy)
@@ -204,6 +204,10 @@
 	IEEE80211_RADIOTAP_DATA_RETRIES =3D 17,
 	IEEE80211_RADIOTAP_XCHANNEL =3D 18, /* Unofficial, used by FreeBSD */
 	IEEE80211_RADIOTAP_MCS =3D 19,
+	IEEE80211_RADIOTAP_SU_VHT =3D 20,
+	IEEE80211_RADIOTAP_GROUP_ID =3D 21,
+	IEEE80211_RADIOTAP_PARTIAL_AID =3D 22,
+	IEEE80211_RADIOTAP_MU_VHT =3D 23,
=20
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE =3D 29,
@@ -270,4 +274,60 @@
 #define IEEE80211_RADIOTAP_MCS_FEC_LDPC		0x10
 #define IEEE80211_RADIOTAP_MCS_STBC		0x20
=20
+/* For IEEE80211_RADIOTAP_SU_VHT */
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_STBC	0x01
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_TXOP_PS	0x02
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_GI	0x04
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_CODING	0x08
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_BF	0x10
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_BW	0x20
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_NSTS	0x40
+#define IEEE80211_RADIOTAP_SU_VHT_HAVE_MCS_NSS	0x80
+
+#define IEEE80211_RADIOTAP_SU_VHT_STBC		0x01
+#define IEEE80211_RADIOTAP_SU_VHT_TXOP_PS	0x02
+#define IEEE80211_RADIOTAP_SU_VHT_SGI		0x04
+#define IEEE80211_RADIOTAP_SU_VHT_SGI_NSYM_DA	0x08
+#define IEEE80211_RADIOTAP_SU_VHT_CODING_LDPC	0x10
+#define IEEE80211_RADIOTAP_SU_VHT_LDPC_EXTRA	0x20
+#define IEEE80211_RADIOTAP_SU_VHT_BF		0x40
+
+#define IEEE80211_RADIOTAP_SU_VHT_NSTS		0x0f
+#define IEEE80211_RADIOTAP_SU_VHT_BW		0xf0
+
+#define IEEE80211_RADIOTAP_SU_VHT_MCS		0x0f
+#define IEEE80211_RADIOTAP_SU_VHT_NSS		0x70
+
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20		IEEE80211_RADIOTAP_MCS_BW_20
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40		IEEE80211_RADIOTAP_MCS_BW_40
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20L	IEEE80211_RADIOTAP_MCS_BW_20L
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20U	IEEE80211_RADIOTAP_MCS_BW_20U
+#define IEEE80211_RADIOTAP_SU_VHT_BW_80		4
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40L	5
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40U	6
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20LL	7
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20LU	8
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20UL	9
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20UU	10
+#define IEEE80211_RADIOTAP_SU_VHT_BW_160	11
+#define IEEE80211_RADIOTAP_SU_VHT_BW_80L	12
+#define IEEE80211_RADIOTAP_SU_VHT_BW_80U	13
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40LL	14
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40LU	15
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40UL	16
+#define IEEE80211_RADIOTAP_SU_VHT_BW_40UU	17
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20LLL	18
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20LLU	19
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20LUL	20
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20LUU	21
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20ULL	22
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20ULU	23
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20UUL	24
+#define IEEE80211_RADIOTAP_SU_VHT_BW_20UUU	25
+
+/* For IEEE80211_RADIOTAP_MU_VHT */
+#define IEEE80211_RADIOTAP_MU_VHT_NSTS_MASK	0x07
+#define IEEE80211_RADIOTAP_MU_VHT_CODING_LDPC	0x08
+#define IEEE80211_RADIOTAP_MU_VHT_MCS		0xf0
+
 #endif				/* IEEE80211_RADIOTAP_H */
Index: epan/dissectors/packet-ieee80211-radiotap.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- epan/dissectors/packet-ieee80211-radiotap.c	(revision 43220)
+++ epan/dissectors/packet-ieee80211-radiotap.c	(working copy)
@@ -79,6 +79,137 @@
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
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20, "20 MHz" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20L, "20 MHz lower" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20U, "20 MHz upper" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40, "40 MHz" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20LL, "20 MHz, channel 1/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20LU, "20 MHz, channel 2/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20UL, "20 MHz, channel 3/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20UU, "20 MHz, channel 4/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40L, "40 MHz lower" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40U, "40 MHz upper" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_80, "80 MHz" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20LLL, "20 MHz, channel 1/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20LLU, "20 MHz, channel 2/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20LUL, "20 MHz, channel 3/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20LUU, "20 MHz, channel 4/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20ULL, "20 MHz, channel 5/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20ULU, "20 MHz, channel 6/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20UUL, "20 MHz, channel 7/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_20UUU, "20 MHz, channel 8/8" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40LL, "40 MHz, channel 1/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40LU, "40 MHz, channel 2/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40UL, "40 MHz, channel 3/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_40UU, "40 MHz, channel 4/4" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_80L, "80 MHz lower" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_80U, "80 MHz upper" },
+	{ IEEE80211_RADIOTAP_SU_VHT_BW_160, "160 MHz" },
+	{ 0, NULL }
+};
+
 #define MAX_MCS_INDEX	76
=20
 /*
@@ -553,6 +684,29 @@
 static int hf_radiotap_mcs_format =3D -1;
 static int hf_radiotap_mcs_fec =3D -1;
 static int hf_radiotap_mcs_stbc =3D -1;
+static int hf_radiotap_su_vht =3D -1;
+static int hf_radiotap_su_vht_known =3D -1;
+static int hf_radiotap_su_vht_have_stbc =3D -1;
+static int hf_radiotap_su_vht_have_txop_ps =3D -1;
+static int hf_radiotap_su_vht_have_gi =3D -1;
+static int hf_radiotap_su_vht_have_coding =3D -1;
+static int hf_radiotap_su_vht_have_bf =3D -1;
+static int hf_radiotap_su_vht_have_bw =3D -1;
+static int hf_radiotap_su_vht_have_nsts =3D -1;
+static int hf_radiotap_su_vht_have_mcs_nss =3D -1;
+static int hf_radiotap_su_vht_stbc =3D -1;
+static int hf_radiotap_su_vht_txop_ps =3D -1;
+static int hf_radiotap_su_vht_gi =3D -1;
+static int hf_radiotap_su_vht_sgi_nsym_da =3D -1;
+static int hf_radiotap_su_vht_coding =3D -1;
+static int hf_radiotap_su_vht_ldpc_extra =3D -1;
+static int hf_radiotap_su_vht_bf =3D -1;
+static int hf_radiotap_su_vht_bw =3D -1;
+static int hf_radiotap_su_vht_nsts =3D -1;
+static int hf_radiotap_su_vht_mcs =3D -1;
+static int hf_radiotap_su_vht_nss =3D -1;
+static int hf_radiotap_gid =3D -1;
+static int hf_radiotap_aid =3D -1;
=20
 /* "Present" flags */
 static int hf_radiotap_present_tsft =3D -1;
@@ -573,6 +727,7 @@
 static int hf_radiotap_present_rxflags =3D -1;
 static int hf_radiotap_present_xchannel =3D -1;
 static int hf_radiotap_present_mcs =3D -1;
+static int hf_radiotap_present_su_vht =3D -1;
 static int hf_radiotap_present_rtap_ns =3D -1;
 static int hf_radiotap_present_vendor_ns =3D -1;
 static int hf_radiotap_present_ext =3D -1;
@@ -601,6 +756,8 @@
 static gint ett_radiotap_vendor =3D -1;
 static gint ett_radiotap_mcs =3D -1;
 static gint ett_radiotap_mcs_known =3D -1;
+static gint ett_radiotap_su_vht =3D -1;
+static gint ett_radiotap_su_vht_known =3D -1;
=20
 static dissector_handle_t ieee80211_handle;
 static dissector_handle_t ieee80211_datapad_handle;
@@ -905,6 +1062,11 @@
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(MCS),
 		  "Specifies if the HT field is present", HFILL}},
=20
+		{&hf_radiotap_present_su_vht,
+		 {"VHT information", "radiotap.present.su_vht",
+		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(SU_VHT),
+		  "Specifies if the VHT field is present", HFILL}},
+
 		{&hf_radiotap_present_rtap_ns,
 		 {"Radiotap NS next", "radiotap.present.rtap_ns",
 		  FT_BOOLEAN, 32, NULL, RADIOTAP_MASK(RADIOTAP_NAMESPACE),
@@ -1261,6 +1423,100 @@
 		 {"MCS index", "radiotap.mcs.index",
 		  FT_UINT8, BASE_DEC, NULL, 0x0, NULL, HFILL}},
=20
+		{&hf_radiotap_su_vht,
+		 {"VHT information", "radiotap.vht",
+		  FT_NONE, BASE_NONE, NULL, 0x0, NULL, HFILL}},
+		{&hf_radiotap_su_vht_known,
+		 {"Known VHT information", "radiotap.vht.known",
+		  FT_UINT8, BASE_HEX, NULL, 0x0,
+		  "Bit mask indicating what VHT information is present", HFILL}},
+		{&hf_radiotap_su_vht_have_stbc,
+		 {"STBC", "radiotap.vht.have_stbc",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_STBC,
+		  "Space Time Block Coding information present", HFILL}},
+		{&hf_radiotap_su_vht_have_txop_ps,
+		 {"TXOP_PS_NOT_ALLOWED", "radiotap.vht.have_txop_ps",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_TXOP_PS,
+		  "TXOP_PS_NOT_ALLOWED information present", HFILL}},
+		{&hf_radiotap_su_vht_have_gi,
+		 {"Guard interval and SGI Nsym disambiguation", "radiotap.vht.have_gi",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_GI,
+		  "Short/Long guard interval and SGI Nsym disambiguation information pre=
sent", HFILL}},
+		{&hf_radiotap_su_vht_have_coding,
+		 {"Coding and LDPC extra symbol", "radiotap.vht.have_coding",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_CODING,
+		  "Coding and LDPC extra OFDM symbol information present", HFILL}},
+		{&hf_radiotap_su_vht_have_bf,
+		 {"Beamformed", "radiotap.vht.have_beamformed",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_BF,
+		  "Beamformed information present", HFILL}},
+		{&hf_radiotap_su_vht_have_bw,
+		 {"Bandwidth", "radiotap.mcs.have_bw",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_BW,
+		  "Bandwidth information present", HFILL}},
+		{&hf_radiotap_su_vht_have_nsts,
+		 {"Nsts", "radiotap.vht.have_nsts",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_NSTS,
+		  "Number of Space-time streams information present", HFILL}},
+		{&hf_radiotap_su_vht_have_mcs_nss,
+		 {"MCS index and Nss count", "radiotap.vht.have_mcs_nss",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_HAVE_MCS_NSS,
+		  "MCS index and Nss information present", HFILL}},
+		{&hf_radiotap_su_vht_stbc,
+		 {"STBC", "radiotap.vht.stbc",
+		  FT_BOOLEAN, 8, TFS(&tfs_on_off), IEEE80211_RADIOTAP_SU_VHT_STBC,
+		  "Space Time Block Coding flag", HFILL}},
+		{&hf_radiotap_su_vht_txop_ps,
+		 {"TXOP_PS_NOT_ALLOWED", "radiotap.vht.txop_ps",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_TXOP_PS,
+		  "Flag indicating whether STAs may doze during TXOP", HFILL}},
+		{&hf_radiotap_su_vht_gi,
+		 {"Guard interval", "radiotap.vht.gi",
+		  FT_UINT8, BASE_DEC, VALS(mcs_gi), IEEE80211_RADIOTAP_SU_VHT_SGI,
+		  "Short/Long guard interval", HFILL}},
+		{&hf_radiotap_su_vht_sgi_nsym_da,
+		 {"SGI Nsym disambiguation", "radiotap.vht.nsym_da",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_SGI_NSYM_DA,
+		  "Short Guard Interval Nsym disambiguation", HFILL}},
+		{&hf_radiotap_su_vht_coding,
+		 {"Coding", "radiotap.vht.coding",
+		  FT_UINT8, BASE_DEC, VALS(mcs_fec), IEEE80211_RADIOTAP_SU_VHT_CODING_LD=
PC,
+		  "Coding", HFILL}},
+		{&hf_radiotap_su_vht_ldpc_extra,
+		 {"LDPC extra OFDM symbol", "radiotap.vht.ldpc_extra",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_LDPC_EXTRA,
+		  "LDPC extra OFDM symbol", HFILL}},
+		{&hf_radiotap_su_vht_bf,
+		 {"Beamformed", "radiotap.vht.beamformed",
+		  FT_BOOLEAN, 8, NULL, IEEE80211_RADIOTAP_SU_VHT_BF,
+		  "Beamformed", HFILL}},
+		{&hf_radiotap_su_vht_bw,
+		 {"Bandwidth", "radiotap.vht.bw",
+		  FT_UINT8, BASE_DEC, VALS(vht_bandwidth), IEEE80211_RADIOTAP_SU_VHT_BW,
+		  "Bandwidth", HFILL}},
+		{&hf_radiotap_su_vht_nsts,
+		 {"Nsts", "radiotap.vht.nsts",
+		  FT_UINT8, BASE_DEC, NULL, IEEE80211_RADIOTAP_SU_VHT_NSTS,
+		  "Number of Space-time streams", HFILL}},
+		{&hf_radiotap_su_vht_mcs,
+		 {"MCS index", "radiotap.vht.mcs",
+		  FT_UINT8, BASE_DEC, NULL, IEEE80211_RADIOTAP_SU_VHT_MCS,
+		  "MCS index", HFILL}},
+		{&hf_radiotap_su_vht_nss,
+		 {"Nss", "radiotap.vht.nss",
+		  FT_UINT8, BASE_DEC, NULL, IEEE80211_RADIOTAP_SU_VHT_NSS,
+		  "Number of spatial streams", HFILL}},
+
+		{&hf_radiotap_gid,
+		 {"Group Id", "radiotap.gid",
+		  FT_UINT8, BASE_DEC, NULL, 0x0,
+		  "VHT Group Id", HFILL}},
+
+		{&hf_radiotap_aid,
+		 {"Partial AID", "radiotap.aid",
+		  FT_UINT16, BASE_DEC, NULL, 0x0,
+		  "VHT partial AID", HFILL}},
+
 		{&hf_radiotap_vendor_ns,
 		 {"Vendor namespace", "radiotap.vendor_namespace",
 		  FT_BYTES, BASE_NONE, NULL, 0x0,
@@ -1304,6 +1560,8 @@
 		&ett_radiotap_vendor,
 		&ett_radiotap_mcs,
 		&ett_radiotap_mcs_known,
+		&ett_radiotap_su_vht,
+		&ett_radiotap_su_vht_known
 	};
 	module_t *radiotap_module;
=20
@@ -1509,6 +1767,10 @@
 			proto_tree_add_item(present_tree,
 					    hf_radiotap_present_mcs, tvb,
 					    offset + 4, 4, ENC_LITTLE_ENDIAN);
+			proto_tree_add_item(present_tree,
+					    hf_radiotap_present_su_vht, tvb,
+					    offset + 4, 4, ENC_LITTLE_ENDIAN);
+
  always_bits:
 			proto_tree_add_item(present_tree,
 					    hf_radiotap_present_rtap_ns, tvb,
@@ -1939,6 +2201,7 @@
 			}
 			break;
 		}
+
 		case IEEE80211_RADIOTAP_MCS: {
 			proto_item *it;
 			proto_tree *mcs_tree =3D NULL, *mcs_known_tree;
@@ -2045,7 +2308,178 @@
 			}
 			break;
 		}
+
+		case IEEE80211_RADIOTAP_SU_VHT: {
+			proto_item *it;
+			proto_tree *mcs_tree =3D NULL, *mcs_known_tree;
+			guint8 mcs_known, mcs_flags, mcs_bw, mcs;
+			guint bandwidth =3D 0;
+			guint gi_length =3D 0;
+			guint nss =3D 0;
+			guint mcs_index =3D 0;
+			gboolean can_calculate_rate;
+
+			/*
+			 * Start out assuming that we can calculate the rate;
+			 * if we are missing any of the MCS index, channel
+			 * width, or guard interval length, we can't.
+			 */
+			can_calculate_rate =3D TRUE;
+
+			mcs_known =3D tvb_get_guint8(tvb, offset);
+			mcs_flags =3D tvb_get_guint8(tvb, offset + 1);
+			mcs_bw =3D tvb_get_guint8(tvb, offset + 2);
+			mcs =3D tvb_get_guint8(tvb, offset + 3);
+
+			if (tree) {
+				it =3D proto_tree_add_item(radiotap_tree, hf_radiotap_su_vht,
+						tvb, offset, 4, ENC_NA);
+				mcs_tree =3D proto_item_add_subtree(it, ett_radiotap_su_vht);
+				it =3D proto_tree_add_uint(mcs_tree, hf_radiotap_su_vht_known,
+						tvb, offset, 1, mcs_known);
+				mcs_known_tree =3D proto_item_add_subtree(it, ett_radiotap_su_vht_know=
n);
+
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_stbc,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_txop_ps,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_gi,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_coding,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_bf,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_bw,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_nsts,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+				proto_tree_add_item(mcs_known_tree, hf_radiotap_su_vht_have_mcs_nss,
+						tvb, offset, 1, ENC_LITTLE_ENDIAN);
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_STBC) {
+				if (mcs_tree)
+					proto_tree_add_boolean(mcs_tree, hf_radiotap_su_vht_stbc,
+							tvb, offset + 1, 1, mcs_flags);
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_TXOP_PS) {
+				if (mcs_tree)
+					proto_tree_add_boolean(mcs_tree, hf_radiotap_su_vht_txop_ps,
+							tvb, offset + 1, 1, mcs_flags);
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_GI) {
+				gi_length =3D (mcs_flags & IEEE80211_RADIOTAP_SU_VHT_SGI) ? 1 : 0;
+				if (mcs_tree) {
+					proto_tree_add_uint(mcs_tree, hf_radiotap_su_vht_gi,
+							tvb, offset + 1, 1, mcs_flags);
+					proto_tree_add_boolean(mcs_tree, hf_radiotap_su_vht_sgi_nsym_da,
+							tvb, offset + 1, 1, mcs_flags);
+				}
+			} else {
+				can_calculate_rate =3D FALSE;	/* no GI width */
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_CODING) {
+				if (mcs_tree) {
+					proto_tree_add_uint(mcs_tree, hf_radiotap_su_vht_coding,
+							tvb, offset + 1, 1, mcs_flags);
+					proto_tree_add_boolean(mcs_tree, hf_radiotap_su_vht_ldpc_extra,
+							tvb, offset + 1, 1, mcs_flags);
+				}
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_BF) {
+				if (mcs_tree)
+					proto_tree_add_boolean(mcs_tree, hf_radiotap_su_vht_bf,
+							tvb, offset + 1, 1, mcs_flags);
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_BW) {
+				guint bw_index =3D (mcs_bw & IEEE80211_RADIOTAP_SU_VHT_BW) >> 4;
+				if (bw_index <=3D sizeof(ieee80211_vht_bw2rate_index)/sizeof(ieee80211=
_vht_bw2rate_index[0]))
+					bandwidth =3D ieee80211_vht_bw2rate_index[bw_index];
+				else
+					can_calculate_rate =3D FALSE; /* unknown bandwidth */
+
+				if (mcs_tree)
+					proto_tree_add_uint_format(mcs_tree, hf_radiotap_su_vht_bw,
+							tvb, offset + 2, 1, bw_index,
+							"Bandwidth: %s",
+							val_to_str(bw_index, vht_bandwidth, "Unknown (0x%02x)"));
+			} else {
+				can_calculate_rate =3D FALSE;	/* no bandwidth */
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_NSTS) {
+				guint nsts =3D (mcs_bw & IEEE80211_RADIOTAP_SU_VHT_NSTS);
+				if (mcs_tree)
+					proto_tree_add_uint_format(mcs_tree, hf_radiotap_su_vht_nsts,
+							tvb, offset + 2, 1, nsts,
+							"Space-time streams: %u", nsts);
+			}
+
+			if (mcs_known & IEEE80211_RADIOTAP_SU_VHT_HAVE_MCS_NSS) {
+				mcs_index =3D (mcs & IEEE80211_RADIOTAP_SU_VHT_MCS);
+				nss =3D ((mcs & IEEE80211_RADIOTAP_SU_VHT_NSS) >> 4) + 1;
+				if (mcs_index > MAX_MCS_VHT_INDEX)
+					can_calculate_rate =3D FALSE;	/* Invalid index */
+
+				if (mcs_tree) {
+					proto_tree_add_uint_format(mcs_tree, hf_radiotap_su_vht_nss,
+							tvb, offset + 3, 1, nss,
+							"Spatial streams: %u", nss);
+					ti =3D proto_tree_add_uint_format(mcs_tree, hf_radiotap_su_vht_mcs,
+							tvb, offset + 3, 1, mcs_index,
+							"MCS: %u", mcs_index);
+
+					if (mcs_index > MAX_MCS_VHT_INDEX)
+						proto_item_append_text(ti, " (invalid)");
+					else
+						proto_item_append_text(ti, " (%s %s)",
+								ieee80211_vhtinfo[mcs_index].modulation,
+								ieee80211_vhtinfo[mcs_index].coding_rate);
+				}
+			} else {
+				can_calculate_rate =3D FALSE;	/* no MCS index */
+			}
+
+			if (can_calculate_rate) {
+				if (ieee80211_vhtinfo[mcs_index].rates[bandwidth][gi_length] !=3D 0.0)=
 {
+					float rate =3D ieee80211_vhtinfo[mcs_index].rates[bandwidth][gi_lengt=
h] * nss;
+					col_add_fstr(pinfo->cinfo, COL_TX_RATE, "%.1f", rate);
+					if (radiotap_tree) {
+						rate_ti =3D proto_tree_add_float_format(radiotap_tree,
+								hf_radiotap_datarate,
+								tvb, offset, 5, rate,
+								"Data Rate: %.1f Mb/s", rate);
+						PROTO_ITEM_SET_GENERATED(rate_ti);
+					}
+				}
+			}
+
+			break;
 		}
+
+		case IEEE80211_RADIOTAP_GROUP_ID:
+			if (tree) {
+				proto_tree_add_uint(radiotap_tree,
+						hf_radiotap_gid, tvb,
+						offset, 1,
+						tvb_get_guint8(tvb, offset));
+			}
+			break;
+
+		case IEEE80211_RADIOTAP_PARTIAL_AID:
+			if (tree) {
+				proto_tree_add_uint(radiotap_tree,
+						hf_radiotap_aid, tvb,
+						offset, 2,
+						tvb_get_letohs(tvb, offset));
+			}
+			break;
+		}
 	}
=20
 	if (err !=3D -ENOENT && tree) {
Index: epan/dissectors/packet-ieee80211-radiotap-iter.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- epan/dissectors/packet-ieee80211-radiotap-iter.c	(revision 43220)
+++ epan/dissectors/packet-ieee80211-radiotap-iter.c	(working copy)
@@ -50,11 +50,16 @@
 	/* [IEEE80211_RADIOTAP_RTS_RETRIES] =3D 16 */		{ 1, 1 },
 	/* [IEEE80211_RADIOTAP_DATA_RETRIES] =3D 17 */		{ 1, 1 },
 	/* [IEEE80211_RADIOTAP_XCHANNEL] =3D 18 */		{ 0, 0 }, /* Unofficial, used=
 by FreeBSD */
-	/* [IEEE80211_RADIOTAP_MCS] =3D 19 */			{ 1, 3 }
+	/* [IEEE80211_RADIOTAP_MCS] =3D 19 */			{ 1, 3 },
+	/* [IEEE80211_RADIOTAP_SU_VHT] =3D 20 */			{ 1, 4 },
+	/* [IEEE80211_RADIOTAP_GID] =3D 21 */			{ 1, 1 },
+	/* [IEEE80211_RADIOTAP_AID] =3D 22 */			{ 2, 2 },
 	/*
 	 * add more here as they are defined in
 	 * include/net/ieee80211_radiotap.h
 	 */
+	{ 0, 0 }, // TODO
+	{ 1, 5 }
 };
=20
 static const struct ieee80211_radiotap_namespace radiotap_ns =3D {
