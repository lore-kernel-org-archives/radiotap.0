From: Andy Green <andy-/Zus8d0mwwtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: radiotap for TX
Date: Thu, 21 Jun 2007 22:12:56 +0100
Message-ID: <467AE9D8.2030602__48728.9385324859$1216696516$gmane$org@warmcat.com>
References: <1182375853.3714.103.camel@johannes.berg> <467AE460.1070606@errno.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
In-Reply-To: <467AE460.1070606-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

Sam Leffler wrote:

> Note that using a monitor mode interface for transmit is a bad idea.  It
> is likely you will encounter devices that disallow any packet transmit
> when operating in monitor mode.  In practice this can be worked around
> by using a non-monitor operating mode for the device (e.g. adhoc mode
> w/o setting up beacons) but exporting this notion to user mode is bad
> IMO.  In net80211 there is an adhoc-demo mode which is essentially adhoc
> mode which was originally added for functionality found in old lucent
> cards but more recently has been used for building applications that
> want a "raw 802.11 device".

Hi -

In mac80211 you can run multiple network interfaces off the one physical
device, so you can have an associated WPA connection on one network
interface and another logical "monitor mode" network interface up on the
one physical device.  "Monitor mode" in this case can be the results of
a promiscuous hardware RX that is filtered for the Managed mode logical
interface ... this is AIUI.  So in that way "Monitor Mode" no longer
means a single modal device setting, but really the delivery somehow of
packets to a logical network interface that belongs to the physical device.

Injecting down a "monitor mode interface" then only means to use a
logical network interface that locally is configured to "Monitor Mode",
it doesn't have the same definite implication for physical device
configuration as before mac80211.  (Well.. AIUI).  So hopefully this
objection may not apply.

-Andy
