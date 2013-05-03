From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Patches for STBC Standartisation
Date: Fri,  3 May 2013 21:53:52 +0200
Message-ID: <1367610836-3303-1-git-send-email-linux__13539.4548452043$1367610864$gmane$org@rempel-privat.de>
References: <1367527479.11375.19.camel@jlt4.sipsolutions.net>
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1367527479.11375.19.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: radiotap@radiotap.org

Here are two series of patches. First are kernel patches
and ath9k driver patch.
Second, is patch for tcpdump.

All of them was tested for 1,2 and 3 stream scenarious.
Sinse i do not have hardware which can recive more than 1 STBC
stream, i did some hacks to to produce this kind of captures.

Oleksij Rempel (3):
  mac80211: add STBC flag for radiotap
  ath9k: remove useless flag conversation.
  ath9k: check for Rx-STBC flag and pass it to ieee80211


-- 
1.8.1.2
