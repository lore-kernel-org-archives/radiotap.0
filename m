From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: WiMAX extensions
Date: Wed, 27 Jun 2007 16:45:04 -0700
Message-ID: <2A4D4978-D308-40EA-89D5-A2304A5947C7@alum.mit.edu>
References: <50721.65.74.1.247.1178691838.squirrel@webmail.cs.umd.edu> <20070513033218.GL20770@che.ojctech.com> <465B128D.9070904@cs.umd.edu>
Mime-Version: 1.0 (Apple Message framework v891)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
In-Reply-To: <465B128D.9070904-VX+DGZyGJwM3uPMLIKxrzw@public.gmane.org>
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

On May 28, 2007, at 10:34 AM, Charles Clancy wrote:

> Suggested new fields:

	...

> - received frequency (in kHz, MHz is not specific enough)

So that'd be an alternative to IEEE80211_RADIOTAP_CHANNEL and  
IEEE80211_RADIOTAP_XCHANNEL, both of which give the frequency in MHz?

(BTW, the current FreeBSD ieee80211_radiotap.h defines  
IEEE80211_RADIOTAP_XCHANNEL as 14 and the current NetBSD  
ieee80211_radiotap.h defines IEEE80211_RADIOTAP_RX_FLAGS as 14.   
Hopefully one or the other of those is *NOT* currently being used, as  
that means that tcpdump, Wireshark, etc. can't handle a property with  
a code of 14 *AND*, at least as I understand the way radiotap works,  
can't handle anything after 14, either, as they don't know how long  
that property is.  NetBSD and OpenBSD also collide on the value of 14,  
as well as values after it.)

> - whether the PDU contains a CRC32 at the end

There's already a flag for that in the IEEE80211_RADIOTAP_FLAGS field  
- IEEE80211_RADIOTAP_F_FCS.

> - whether the PDU is encrypted

There's a IEEE80211_RADIOTAP_F_WEP flag; should that become a "send  
with encryption" flag?  (What about WPA?)

Does "encrypted" here mean whether the frame contents are encrypted as  
delivered to the application, or whether the frame was encrypted when  
sent on the air?  (For 802.11, I think there are some cases where the  
adapter+driver deliver decrypted frames with the "encrypted" bit set  
in the header, which is why Wireshark has an option to ignore that bit.)
