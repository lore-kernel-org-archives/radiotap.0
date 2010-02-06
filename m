From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Re: MCS field: RFA (wireshark patch)
Date: Sat, 6 Feb 2010 20:02:22 +0000 (UTC)
Message-ID: <loom.20100206T204036-824@post.gmane.org>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Matteo Croce <technoboy85@...> writes:
> and here there are patches for the radiotap parser, mac80211, tcpdump
> and wireshark:
> 
> http://teknoraver.net/software/radiotap_mcs/

What version of Wireshark is this patch for? I tried to apply it to 1.2.5 from
http://anonsvn.wireshark.org/viewvc/releases/wireshark-1.2.5/, but the files
from your patch: Index:

wireshark/epan/dissectors/packet-radiotap-defs.h Index:
wireshark/epan/dissectors/packet-radiotap-iter.c

Are not in the sources. They look like extractions from packet-radiotap.c

Also, wireshark 1.2.5 has this at the end of the packet-radiotap.c:enum
ieee80211_radiotap_type def:

    IEEE80211_RADIOTAP_DB_ANTNOISE = 13,
    IEEE80211_RADIOTAP_RX_FLAGS = 14,
    IEEE80211_RADIOTAP_XCHANNEL = 18,
    IEEE80211_RADIOTAP_EXT = 31
};

But your patch has:
 	IEEE80211_RADIOTAP_TX_FLAGS = 15,
 	IEEE80211_RADIOTAP_RTS_RETRIES = 16,
 	IEEE80211_RADIOTAP_DATA_RETRIES = 17,
+	IEEE80211_RADIOTAP_RATE_MCS = 19,
 
 	/* valid in every it_present bitmap, even vendor namespaces */
 	IEEE80211_RADIOTAP_RADIOTAP_NAMESPACE = 29,

So it looks like quite a bit different.
