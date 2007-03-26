From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Date: Mon, 26 Mar 2007 18:45:49 -0400
Message-ID: <1174949149.28132.49.camel__7064.59452999315$1216696504$gmane$org@dv>
References: <20070325232416.64xwkc0kw04oosg0@webmail.spamcop.net>
	 <20070326033729.GG31621@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070326033729.GG31621-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

On Sun, 2007-03-25 at 22:37 -0500, David Young wrote:

> > One is found in the current wireless-2.6.git:
> > 
> >         IEEE80211_RADIOTAP_RX_FLAGS = 14,
> >         IEEE80211_RADIOTAP_TX_FLAGS = 15,
> >         IEEE80211_RADIOTAP_RTS_RETRIES = 16,
> >         IEEE80211_RADIOTAP_DATA_RETRIES = 17,
> 
> These fields are slated to become part of the standard, I just haven't got
> around to updating the manual page, yet.  I have time to do that tonight.

OK.  I was wrong to assume that non-standard fields were introduced on
the Linux side.

> > Another set of the flags can be found in CVS OpenBSD:
> > 
> >         IEEE80211_RADIOTAP_FCS = 14,
> >         IEEE80211_RADIOTAP_HWQUEUE = 15,
> >         IEEE80211_RADIOTAP_RSSI = 16,
> 
> These fields are not part of the standard, and they will not become part
> of the standard with these numbers.  This is the first time I have ever
> heard of HWQUEUE and RSSI, actually.  What are they for?

IEEE80211_RADIOTAP_HWQUEUE specifies the hardware queue.  This is used
in the drivers for Atheros and Intel ipw3945 to report transmitted
frames to the userspace.

In case of Atheros, the value would always be 0, but the way it's
written (HAL_TX_QUEUE_ID_DATA_MIN), I assume the value is supposed to be
hardware specific rather than a number from the 802.11e standard.  Other
values in the same enum are 6, 7, 8 and 9.

In case of the ipw3945 driver, it's always 0, but it's used as an index
in an array of size 4, so at least it a number from 0 to 3.

The description in ieee80211_radiotap.h is: "A specific hardware queue
(used by WME)" and it's one 8-bit integer.

IEEE80211_RADIOTAP_HWQUEUE is described as "A relative Received Signal
Strength Index" and it's two 8-bit integers, RSSI and max RSSI.  It's
used by many drivers and includes uncalibrated signal data.  It looks
like noise data is not included.

-- 
Regards,
Pavel Roskin
