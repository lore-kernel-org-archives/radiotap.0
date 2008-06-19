From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 13:17:45 -0700
Message-ID: <485ABEE9.9060602@alum.mit.edu>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <20080619185646.GA17738@che.ojctech.com> <1213902633.8967.84.camel@johannes.berg> <20080619193958.GB17738@che.ojctech.com> <485AB8B0.7060606@alum.mit.edu> <485ABC4A.4060801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <485ABC4A.4060801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Loris Degioanni <loris.degioanni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Loris Degioanni wrote:

> AirPcap uses the IEEE80211_RADIOTAP_FCS flag. We can remove it, but all 
> the trace files produced with airpcap+radiotap until now include it.

Oh, well.

Is it time to either rev the version number or pick a new DLT_ for 
"standard" radiotap?

That doesn't help with existing captures - we'd probably have to add a 
preference setting to control how to interpret bit 14 (and bits 15 and 
16, if we ever add support for them, given that there's a collision 
between the NetBSD and OpenBSD uses of them) - but it'd at least give us 
a new DLT_ or version number value to use in the future, and anybody who 
wants tcpdump or Wireshark to interpret any presence bits in a 
non-standard fashion in files with that DLT_ value/version number can be 
politely told "no, ask for an assignment from the radiotap list".
