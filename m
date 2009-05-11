From: "iodavide-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org" <iodavide-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
Subject: Received Signal Strength - iwl3945
Date: Mon, 11 May 2009 15:26:05 +0200 (CEST)
Message-ID: <31453639.998951242048365543.JavaMail.defaultUser@defaultHost>
Reply-To: "iodavide-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org" <iodavide-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi
I'm using mac80211 for Intel(R) Pro Wireless 3945 in order to capture 
Received Signal Strength from Radiotap headers.

I've created two interface 
(wlan0 and mon0) up to the same Intel card and configured mon0 in monitor-mode.

Radiotap shows SSI Signal (dB) and SSI Noise (dB) but I've some doubts about 
their values.

I read that SSI is related to a not specified dB value of the 
card but I can't find more information about it and about relation between RSSI 
and RSS.

Noise is always 0dB and I read that signal-to-noise ratio (SNR) 
cannot be computed by ``SSI Signal - SSI Noise'' because the noise in Radiotap 
Header usually is captured as the background noise level when no packet is 
transmitted. Thus, the SSI Noise can be interpreted as link quality but cannot 
be used to properly compute the SNR.

Some of you know if I can trust in 
Radiotap SSI Signal dB value?
I need very reliable Received Signal Strength 
values! 
