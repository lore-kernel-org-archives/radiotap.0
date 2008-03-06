From: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC] RCPI support in radiotap and in our wireless subsystems
Date: Thu, 6 Mar 2008 15:38:45 -0500
Message-ID: <43e72e890803061238u50847f1fs587627c5fac028d6__44429.588240064$1216696538$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Cc: Ivan Seskar <Seskar-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, Haris Kremo <harisk-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Simon Barber <simon-r/za7OOdgF0ztatW0fm/fQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Luis Carlos Cobo <luisca-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Javier Cardona <javier-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>, Jean Tourrilhes <jt-sDzT885Ts8HQT0dZR+AlfA@public.gmane.org>, Stefano Brivio <stefano.brivio-hl5o88x/ua9eoWH0uzbU5w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org

I've been reviewing use or RSSI value, signal strength and noise on
several Linux drivers, namely MadWifi, ath5k, ipw2200 and b43, and how
these are populated using radiotap headers. It quickly became clear we
should probably abandon RSSI's use in radiotap and slowly move to
using RCPI [1] for both radiotap and for later use on our wireless
subsystems. Reasons for doing so is:

a. Currently Radiotap's definition and use of
IEEE80211_RADIOTAP_DB_ANTSIGNAL and IEEE80211_RADIOTAP_DBM_ANTSIGNAL
is not so clear and it seems different drivers set it to different
values. MadWifi uses DB_ANTSIGNAL for RSSI, ath5k uses DB_ANTSIGNAL as
RSSI + noise, ipw2200 doesn't set it despite it having a value which
can be used for it. The b43 driver, although like ath5k is a mac80211
driver, uses DB_ANTSIGNAL as:

        status.ssi = b43_rssi_postprocess(dev, jssi,
                                          (phystat0 & B43_RX_PHYST0_OFDM),
                                          (phystat0 & B43_RX_PHYST0_GAINCTL),
                                          (phystat3 & B43_RX_PHYST3_TRSTATE));

We have no clue what jssi is, nor what this yields, yet we use it.

b. For roaming purposes we need to standardize on a value so that the
upper layers can reliably count on for signal strength and I believe
RCPI was defined for just that purpose

c. For strong subsystem rate control algorithms we need to count on
reliable signal strength values. Right now mac80211's PID rate control
algorithm [2] doesn't make use of signal strength, it just uses
non-acked frames and re-transmission counters. I would think using
signal strength here might help somehow.

However, to support RCPI it seems you need to rely on a way to
accurately compute signal strength, but more accurately "received RF
power in the selected channel for a received frame. This parameter
shall be a measure by the PHY sublayer of the received RF power in the
channel measured over the entire received frame or by other equivalent
means which meet the specified accuracy". I've tried reviewing RSSI
value for a few hardware out there to see if we can easily start
adding support for this in our drivers but I am not confident in the
exact value that RSSI represents as it varies on hardware and there is
an obvious the lack of documentation in that area.

---

For Atheros hardware:

RSSI is defined to be equivalent to the Signal To Noise (SNR) [3] and

SNR = Signal - Noise

Now, this is great, however the next question is what Signal is and
what Noise is. Is Signal or SNR here the "measure by the PHY sublayer
of the received RF power in the channel measured over the entire
received frame"? Noise is computed upon noise calibration time, and I
think its computed during SIFS time, but I haven't yet finished
reading the patent that describes this stuff yet [4] so not too sure.
I guess its not important as long as we can rely on the value.

---

For ipw2200:

s8 antsignal = frame->rssi_dbm - IPW_RSSI_TO_DBM;

and IPW_RSSI_TO_DBM is set to 112.

Is antsignal above the "measure by the PHY sublayer of the received RF
power in the channel measured over the entire received frame"?

----

For Broadcom:

We have something called jssi and then get what we think is an RSSI
value. We don't know what either of them are.

        status.ssi = b43_rssi_postprocess(dev, jssi,
                                          (phystat0 & B43_RX_PHYST0_OFDM),
                                          (phystat0 & B43_RX_PHYST0_GAINCTL),
                                          (phystat3 & B43_RX_PHYST3_TRSTATE));

---

At least RCPI seems to be well defined, and I think we can add it to
radiotap for those drivers that can reliably compute this value.

Quoting from Simon's post:

"The allowed values for the Received Channel Power Indicator (RCPI) parameter
shall be an 8 bit value in the range from 0 through 220, with indicated
values rounded to the nearest 0.5 dB as follows:

0: Power < -110 dBm
1: Power = -109.5 dBm
2: Power = -109.0 dBm

and so on where

RCPI = int{(Power in dBm +110)*2} for 0dbm > Power > -110dBm

220: Power > -0 dBm
221-254: reserved
255: Measurement not available

RCPI shall equal the received RF power within an accuracy of +/-5 dB
(95% confidence interval) within the specified dynamic range of the
receiver. The received RF power shall be determined assuming a receiver
noise equivalent bandwidth equal to the channel bandwidth multiplied by
1.1."

So I propose IEEE80211_RADIOTAP_RCPI, defined as above, and hopefully
we can start figuring out what exactly RSSI values are in the
different cards we support to compute this. Comments?

  Luis

[1] http://www.mail-archive.com/netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg19487.html
[2] http://linuxwireless.org/en/developers/Documentation/mac80211/RateControl/PID
[3] http://madwifi.org/wiki/UserDocs/RSSI
[4] http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=7245893.PN.&OS=PN/7
