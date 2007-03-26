From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Date: Sun, 25 Mar 2007 22:38:39 -0500
Message-ID: <20070326033839.GA24097__10646.4659948417$1216696499$gmane$org@che.ojctech.com>
References: <20070325232416.64xwkc0kw04oosg0@webmail.spamcop.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070325232416.64xwkc0kw04oosg0-2RFepEojUI3Rd1RZctBqVdHuzzzSOjJt@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

On Sun, Mar 25, 2007 at 11:24:16PM -0400, Pavel Roskin wrote:
> Hello!

(Oops, this time cc'd radiotap.)

The place to discuss this is the mailing list
radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org, which I have cc'd.  Subscribe at
<http://mail.ojctech.com/mailman/listinfo/radiotap>.  Please feel free
to circulate the URL.

> I have noticed two different incompatible changes to enum
> ieee80211_radiotap_type in ieee80211_radiotap.h.
> 
> One is found in the current wireless-2.6.git:
> 
>         IEEE80211_RADIOTAP_RX_FLAGS = 14,
>         IEEE80211_RADIOTAP_TX_FLAGS = 15,
>         IEEE80211_RADIOTAP_RTS_RETRIES = 16,
>         IEEE80211_RADIOTAP_DATA_RETRIES = 17,

These fields are slated to become part of the standard, I just haven't got
around to updating the manual page, yet.  I have time to do that tonight.

> It was added together with Marvell Libertas USB driver.

> Another set of the flags can be found in CVS OpenBSD:
> 
>         IEEE80211_RADIOTAP_FCS = 14,
>         IEEE80211_RADIOTAP_HWQUEUE = 15,
>         IEEE80211_RADIOTAP_RSSI = 16,

These fields are not part of the standard, and they will not become part
of the standard with these numbers.  This is the first time I have ever
heard of HWQUEUE and RSSI, actually.  What are they for?

> I think Marvell developers could act gracefully and push the flags it introduces
> to higher numbers.  Doing something like that on the OpenBSD side would be
> harder.  I would also like to see joining Rx and Tx flags into one 32-bit
> value.

> But we need some coordination when new fields are added to the protocol.

Right.  People must coordinate on the radiotap list.

> Uncalibrated RSSI may also be a candidate for
> the driver-specific data if OpenBSD can be persuaded to abandon its present
> number.

OpenBSD will need to abandon its present numbers in order to stay
compatible with tcpdump and wireshark.

> It's important that presence of driver specific fields doesn't break parsing of
> the standard fields, even if new fields are made standard.  I think driver
> specific flags don't belong to the it_present bitmap, but should go to the
> beginning of the driver specific area.

You are right that the driver-specific fields cannot go in the bitmap.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
