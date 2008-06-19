From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 11:34:43 -0700
Message-ID: <485AA6C3.8090303@alum.mit.edu>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <1213898387.8967.54.camel@johannes.berg> <485AA531.4010408@wireshark.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <485AA531.4010408-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Gerald Combs wrote:

> FreeBSD: http://www.freebsd.org/cgi/cvsweb.cgi/src/sys/net80211/ieee80211_radiotap.h

In particular, note both bits, as well as the comment for 
IEEE80211_RADIOTAP_RATE:

  * IEEE80211_RADIOTAP_RATE              uint8_t         500kb/s or index
  *
  *      Tx/Rx data rate.  If bit 0x80 is set then it represents an
  *      an MCS index and not an IEEE rate.

The BADFCS bit, and the comment for IEEE80211_RADIOTAP_RATE, but not the 
SHORTGI bit, are also in the NetBSD header:

	http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/net80211/ieee80211_radiotap.h

OpenBSD has none of them.
