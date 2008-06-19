From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 12:33:47 -0700
Message-ID: <485AB49B.4080403@alum.mit.edu>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <20080619185646.GA17738@che.ojctech.com> <1213902633.8967.84.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1213902633.8967.84.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

> Problem is, wireshark actually takes bit 14 to mean "FCS in header".
> Easily changed though if Gerald is willing to take such a patch, I can
> cook up a patch to make it parse the fields above.

OpenBSD defines 14 as IEEE80211_RADIOTAP_FCS.  However, a search through 
the top-of-CVS-tree OpenBSD kernel code shows nothing that *uses* that 
presence bit, and neither top-of-tree FreeBSD nor NetBSD use it (I 
assume from what Sam Leffler said that no FreeBSD release did, and given 
that NetBSD uses it for other purposes I assume no NetBSD release did), 
and I assume, given that you're proposing this, that Linux doesn't use 
it for that purpose.

Given that I've gotten no response from the OpenBSD people from my mail 
and bug report about presence-bit collisions, I'd say Wireshark should 
conform to the standard, and if that breaks analysis of captures from 
OpenBSD systems, too bad.

(If that becomes an issue serious enough to care about, we could either 
get a new DLT_ value for standard radiotap headers, and use that, or rev 
the radiotap header version, but that wouldn't help with existing captures.)
