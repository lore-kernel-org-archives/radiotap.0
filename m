From: bruno randolf <bruno-L9ZBdB2wSWtl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC] RCPI support in radiotap and in our wireless subsystems
Date: Fri, 7 Mar 2008 09:32:50 +0900
Message-ID: <200803070932.51396.bruno__30458.2590856173$1216696539$gmane$org@thinktube.com>
References: <43e72e890803061238u50847f1fs587627c5fac028d6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
In-Reply-To: <43e72e890803061238u50847f1fs587627c5fac028d6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org, Ivan Seskar <Seskar-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, Haris Kremo <harisk-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Simon Barber <simon-r/za7OOdgF0ztatW0fm/fQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Luis Carlos Cobo <luisca-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Javier Cardona <javier-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>, Jean Tourrilhes <jt-sDzT885Ts8HQT0dZR+AlfA@public.gmane.org>, Stefano Brivio <stefano.brivio-hl5o88x/ua9eoWH0uzbU5w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org

On Friday 07 March 2008 05:38:45 Luis R. Rodriguez wrote:
> I've been reviewing use or RSSI value, signal strength and noise on
> several Linux drivers, namely MadWifi, ath5k, ipw2200 and b43, and how
> these are populated using radiotap headers. It quickly became clear we
> should probably abandon RSSI's use in radiotap and slowly move to
> using RCPI [1] for both radiotap and for later use on our wireless
> subsystems. Reasons for doing so is:

i think it's worth the effort to try to clean up this mess and get some 
standardisation between the devices as far as possible but i'm afraid we are 
at the mercy of the values the hardware gives us and the information we get 
from hardware vendors about the meaning of these values.

> a. Currently Radiotap's definition and use of
> IEEE80211_RADIOTAP_DB_ANTSIGNAL and IEEE80211_RADIOTAP_DBM_ANTSIGNAL
> is not so clear

i think it's quite clear, except that it does not state when this signal is 
supposed to be measured.

if all devices could use this in the same way that would already be great!

> For Atheros hardware:
>
> RSSI is defined to be equivalent to the Signal To Noise (SNR) [3] and
>
> SNR = Signal - Noise
>
> Now, this is great, however the next question is what Signal is and
> what Noise is. Is Signal or SNR here the "measure by the PHY sublayer
> of the received RF power in the channel measured over the entire
> received frame"?

no, according to the information we have from madwifi it is not:

/*
 * rx_rssi is in units of dbm above the noise floor.  This value
 * is measured during the preamble and PLCP; i.e. with the initial
 * 4us of detection.
 */
(this is copied from a comment in hal/ah_desc.h)

> So I propose IEEE80211_RADIOTAP_RCPI, defined as above, and hopefully
> we can start figuring out what exactly RSSI values are in the
> different cards we support to compute this. Comments?

it's good to extend radiotap to include this possibility, but at least for 
atheros hardware we know we can't supply this value (unless newer devices 
allow us to get a RCPI value somehow, but we probably would need atheros 
support to know that).

it would already be an important step to better define the variables inside 
mac80211, so drivers can report what they support (and mac80211 can make the 
translations to the weird values iwconfig uses).

right now the variable names inside mac80211 are really ambigous and not very 
well defined. in struct ieee80211_rx_status we have:

 * @ssi: signal strength when receiving this frame
 * @signal: used as 'qual' in statistics reporting
 * @noise: PHY noise when receiving this frame

it could be changed to something like:

 * @signal: signal strength in dBm above noise or RCPI according to flag
 * @noise: PHY noise in dBm when receiving this frame
 (remove ssi)

bruno
