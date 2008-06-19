From: Loris Degioanni <loris.degioanni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 13:06:34 -0700
Message-ID: <485ABC4A.4060801@gmail.com>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <20080619185646.GA17738@che.ojctech.com> <1213902633.8967.84.camel@johannes.berg> <20080619193958.GB17738@che.ojctech.com> <485AB8B0.7060606@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <485AB8B0.7060606-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

Guy Harris wrote:

> David Young wrote:
>> On Thu, Jun 19, 2008 at 09:10:33PM +0200, Johannes Berg wrote:
>>> Problem is, wireshark actually takes bit 14 to mean "FCS in header".
>>
>> I'd forgotten about that, but I think that we still have some 
>> flexibility.
> 
> As per my mail, we can just take that out; OpenBSD defines it as "FCS in 
> header", but doesn't appear to use it, and I don't know of any other 
> system that uses it as "FCS in header".
> 
> Gerald, should we just remove the code that dissects 
> IEEE80211_RADIOTAP_FCS from the 1.0.1 Wireshark release, in preparation 
> for later releases interpreting presence bit 14 as RX flags?
> 

AirPcap uses the IEEE80211_RADIOTAP_FCS flag. We can remove it, but all 
the trace files produced with airpcap+radiotap until now include it.

Loris
