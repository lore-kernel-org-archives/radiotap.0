From: Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Query about recent Radiotap changes
Date: Mon, 26 Mar 2007 21:35:24 +1200
Message-ID: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08@gmail.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
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
List-Id: radiotap@radiotap.org

Hi!

Just noticed the changes that went into OpenBSD tonight, but I have a  
query as to one of the comments in the file:

/* For IEEE80211_RADIOTAP_RX_FLAGS */
#define IEEE80211_RADIOTAP_F_RX_BADFCS 0x0001  /* Frame failed CRC  
check.
						*
						* Deprecated: use the flag
						* IEEE80211_RADIOTAP_F_FCS in
						* the IEEE80211_RADIOTAP_FLAGS
						* field, instead.
						*/

/* For IEEE80211_RADIOTAP_TX_FLAGS */

What does the Deprecated warning apply to? I presume it's got to do  
with the old field, IEEE80211_RADIOTAP_FCS, but the comment is in an  
extremely weird place. It implies that the new _F_RX_BADFCS flag is  
deprecated.

Cheers,

--
Scott Raynel
WAND Network Research Group
Department of Computer Science
University of Waikato
New Zealand
