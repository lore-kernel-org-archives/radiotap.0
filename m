From: Matteo Croce <technoboy85-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Thu, 21 Apr 2011 17:04:06 +0200
Message-ID: <BANLkTi=psWmOSJXDRQvGC2ABwYfR=8EFrg@mail.gmail.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
 <loom.20110418T114722-716@post.gmane.org> <1303120873.3588.5.camel@jlt3.sipsolutions.net>
 <4DAC0D1C.80306@create-net.org> <BANLkTikV_YxYnFxjHrFE7XgYfi1T7J=3Tw@mail.gmail.com>
 <4DAEDBAB.5070100@create-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4DAEDBAB.5070100-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

This patch allows to set the tx rate and retries when injecting,
and report correct MCS information on received frames.

Signed-off-by: Matteo Croce <matteo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

--- a/net/mac80211/tx.c	2011-04-18 15:30:13.540573589 +0200
+++ b/net/mac80211/tx.c	2011-04-19 16:17:19.072552828 +0200
@@ -1091,6 +1091,44 @@
 				tx->flags |= IEEE80211_TX_FRAGMENTED;
 			break;

+		case IEEE80211_RADIOTAP_RATE: {
+			info->control.rates[0].idx = 0;
+			if (*iterator.this_arg) {
+				int i;
+				for (i = 0; i < sband->n_bitrates; i++)
+					if (sband->bitrates[i].bitrate ==
+						*iterator.this_arg * 5) {
+						info->control.rates[0].idx = i;
+						break;
+					}
+			}
+			info->control.rates[0].flags = 0;
+			info->control.rates[1].idx = -1;
+			info->control.rates[2].idx = -1;
+			info->control.rates[3].idx = -1;
+			info->control.rates[4].idx = -1;
+			break;
+		}
+
+		case IEEE80211_RADIOTAP_DATA_RETRIES:
+			info->control.rates[0].count = *iterator.this_arg;
+			break;
+
+		case IEEE80211_RADIOTAP_MCS: {
+			u8 flags = iterator.this_arg[1];
+			u8 mcs = iterator.this_arg[2];
+			info->control.rates[0].idx = mcs;
+			info->control.rates[0].flags |=
+				IEEE80211_TX_RC_MCS;
+			if (flags & IEEE80211_RADIOTAP_MCS_BW_40)
+				info->control.rates[0].flags |=
+				IEEE80211_TX_RC_40_MHZ_WIDTH;
+			if (flags & IEEE80211_RADIOTAP_MCS_SGI)
+				info->control.rates[0].flags |=
+				IEEE80211_TX_RC_SHORT_GI;
+			break;
+		}
+
 		/*
 		 * Please update the file
 		 * Documentation/networking/mac80211-injection.txt
--- a/net/mac80211/ieee80211_i.h	2011-04-18 15:30:13.532573589 +0200
+++ b/net/mac80211/ieee80211_i.h	2011-04-18 17:06:47.904572241 +0200
@@ -1196,6 +1196,10 @@
 	u8 padding_for_rate;
 	__le16 tx_flags;
 	u8 data_retries;
+	/*HT info*/
+	u8 ht_known;
+	u8 ht_flag;
+	u8 ht_mcs;
 } __packed;


--- a/net/mac80211/status.c	2011-04-18 15:30:13.548573589 +0200
+++ b/net/mac80211/status.c	2011-04-18 17:23:40.560572005 +0200
@@ -405,6 +405,19 @@
 	    !(info->status.rates[0].flags & IEEE80211_TX_RC_MCS))
 		rthdr->rate = sband->bitrates[
 				info->status.rates[0].idx].bitrate / 5;
+	/* HT rates */
+	if (info->status.rates[0].flags & IEEE80211_TX_RC_MCS) {
+		rthdr->hdr.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_MCS);
+		rthdr->rate = 0;
+		rthdr->ht_known =	IEEE80211_RADIOTAP_MCS_HAVE_BW |
+					IEEE80211_RADIOTAP_MCS_HAVE_MCS |
+					IEEE80211_RADIOTAP_MCS_HAVE_GI;
+		rthdr->ht_mcs = info->status.rates[0].idx;
+		if (info->status.rates[0].flags & IEEE80211_TX_RC_40_MHZ_WIDTH)
+			rthdr->ht_flag |= IEEE80211_RADIOTAP_MCS_BW_40;
+		if (info->status.rates[0].flags & IEEE80211_TX_RC_SHORT_GI)
+			rthdr->ht_flag |= IEEE80211_RADIOTAP_MCS_SGI;
+	}

 	/* for now report the total retry_count */
 	rthdr->data_retries = retry_count;
--- a/net/wireless/radiotap.c	2011-04-18 15:30:13.524573589 +0200
+++ b/net/wireless/radiotap.c	2011-04-18 16:11:36.044573011 +0200
@@ -40,6 +40,7 @@
 	[IEEE80211_RADIOTAP_TX_FLAGS] = { .align = 2, .size = 2, },
 	[IEEE80211_RADIOTAP_RTS_RETRIES] = { .align = 1, .size = 1, },
 	[IEEE80211_RADIOTAP_DATA_RETRIES] = { .align = 1, .size = 1, },
+	[IEEE80211_RADIOTAP_MCS] = { .align = 1, .size = 3, },
 	/*
 	 * add more here as they are defined in radiotap.h
 	 */
