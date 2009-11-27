From: Matteo Croce <matteo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: MCS rate suggested field - how about aggregation
Date: Fri, 27 Nov 2009 16:58:09 +0100
Message-ID: <40101cc30911270758w2606deb3vf15cf85cd8966926@mail.gmail.com>
References: <43e72e890911261350yadfa099n2c9d44d2f30d4845@mail.gmail.com>
	<1259313731.5428.6.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1259313731.5428.6.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, Nov 27, 2009 at 10:22 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> On Thu, 2009-11-26 at 13:50 -0800, Luis R. Rodriguez wrote:
>> Matteo added an MCS field as a suggested field:
>>
>> http://www.radiotap.org/suggested-fields/MCS
>
> He was going to submit an RFA -- can we not jump that? :)
>
>> Curious if anyone has thought about how to process aggregates though.
>
> FWIW, I think MCS and aggregation is logically different although they
> both belong to HT most of the time. Therefore, I think aggregates should
> be handled in a different field.
>
> johannes
>

I wrote some implementations for the MCS field for mac80211, tcpdump
and wireshark.
They can be found here: http://teknoraver.net/software/radiotap_mcs/

I attach the radiotap one below:

diff --git a/radiotap.c b/radiotap.c
index 0745ba8..a5c64a8 100644
--- a/radiotap.c
+++ b/radiotap.c
@@ -60,6 +60,7 @@ static const struct radiotap_align_size
rtap_namespace_sizes[] = {
 	[IEEE80211_RADIOTAP_TX_FLAGS] = { .align = 2, .size = 2, },
 	[IEEE80211_RADIOTAP_RTS_RETRIES] = { .align = 1, .size = 1, },
 	[IEEE80211_RADIOTAP_DATA_RETRIES] = { .align = 1, .size = 1, },
+	[IEEE80211_RADIOTAP_RATE_MCS] = { .align = 1, .size = 2, },
 	/*
 	 * add more here as they are defined in
 	 * include/net/ieee80211_radiotap.h
diff --git a/radiotap.h b/radiotap.h
index 87455eb..3c3f591 100644
--- a/radiotap.h
+++ b/radiotap.h
@@ -178,6 +178,11 @@ struct ieee80211_radiotap_header {
  *
  *     Number of unicast retries a transmitted frame used.
  *
+ * IEEE80211_RADIOTAP_RATE_MCS       2 x u8          data, bitmap
+ *
+ *     First byte is the MCS index of the rate,
+ *     second one has flags about channel width and guard interval
+ *
  */
 enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_TSFT = 0,
@@ -198,6 +203,7 @@ enum ieee80211_radiotap_type {
 	IEEE80211_RADIOTAP_TX_FLAGS = 15,
 	IEEE80211_RADIOTAP_RTS_RETRIES = 16,
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
+	IEEE80211_RADIOTAP_RATE_MCS = 19,

 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,
@@ -243,4 +249,8 @@ enum ieee80211_radiotap_type {
 #define IEEE80211_RADIOTAP_F_TX_CTS	0x0002	/* used cts 'protection' */
 #define IEEE80211_RADIOTAP_F_TX_RTS	0x0004	/* used rts/cts handshake */

+/* For IEEE80211_RADIOTAP_RATE_MCS */
+#define IEEE80211_RADIOTAP_RATE_MCS_40MHZ	0x01 /* 40 MHz channel width */
+#define IEEE80211_RADIOTAP_RATE_MCS_SHORT_GI	0x02 /* short guard interval */
+
 #endif				/* IEEE80211_RADIOTAP_H */
