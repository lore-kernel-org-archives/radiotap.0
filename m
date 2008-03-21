From: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Subject: Adding "no-ack" flag to the radiotap flags
Date: Fri, 21 Mar 2008 21:32:55 +0100
Message-ID: <200803212132.55970.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi.

Currently, there's no way to define whether the hardware
should wait for an ACK for an injected frame or not.
This can be a performance bottleneck, as the hardware will
try to retransmit until it receives an ACK.

I suggest adding
#define IEEE80211_RADIOTAP_F_NOACK	0x40
so an application can define that it is not interested in
an ACK for the frame and the card should not bother retrying until
it received one.
When this flag is not set, the standard rules apply.

I don't see a use-case for overriding these rules to always
_expect_ an ACK, so I think a one-bit flag is OK.

-- 
Greetings Michael.
