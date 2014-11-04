From: "C. McPherson" <ccmcphe-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Subject: Vendor Namespace Question
Date: Tue, 04 Nov 2014 13:37:45 -0500
Message-ID: <54591CF9.7030106@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hello all:
I was just trying to use the latest stable backports-3.18-rc1-1 and I 
noticed that there is no longer structure members in the 
ieee80211_rx_status structure for Vendor namespace information?  In my 
backports 3.14 version I used them to add some register information to 
the radiotap header in the lab. How does one use the vendor name space 
without those structure members?

Thanks for you assistance
Clyde


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
