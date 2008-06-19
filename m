From: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 11:28:01 -0700
Message-ID: <485AA531.4010408@wireshark.org>
References: <1188512214.7585.3.camel@johannes.berg>	 <1213897499.8967.46.camel@johannes.berg> <1213898387.8967.54.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
In-Reply-To: <1213898387.8967.54.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Johannes Berg wrote:
> I just noticed that at least wireshark also defines two non-standard
> bits for the 'flags' field (field bit 1):
> 
> ﻿#define IEEE80211_RADIOTAP_F_BADFCS     0x40    /* does not pass FCS check */
> #define IEEE80211_RADIOTAP_F_SHORTGI    0x80    /* HT short GI */
> 
> 
> Also, it defines that if the rate (field bit 2) is >= 0x80 (or rather,
> has bit 0x80 set) then the lower 4 bits are used to define some HT rate?
> 
> Where the hell did that come from?

FreeBSD: http://www.freebsd.org/cgi/cvsweb.cgi/src/sys/net80211/ieee80211_radiotap.h
