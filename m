From: Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14? [mostly 11n]
Date: Tue, 01 Jul 2008 09:35:23 -0700
Message-ID: <486A5CCB.1070606@errno.com>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <20080619185646.GA17738@che.ojctech.com> <1213902633.8967.84.camel@johannes.berg> <20080619193958.GB17738@che.ojctech.com> <485AB8B0.7060606@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
In-Reply-To: <485AB8B0.7060606-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Guy Harris wrote:
> David Young wrote:
>> On Thu, Jun 19, 2008 at 09:10:33PM +0200, Johannes Berg wrote:
>>> Problem is, wireshark actually takes bit 14 to mean "FCS in header".
>>
>> I'd forgotten about that, but I think that we still have some 
>> flexibility.
>
> As per my mail, we can just take that out; OpenBSD defines it as "FCS 
> in header", but doesn't appear to use it, and I don't know of any 
> other system that uses it as "FCS in header".

Right, as I told you that mechanism was only ever defined by netbsd. 
Pulling the FCS out of band is not a good idea.  Presumably obsd just 
brought it over.

>
> Gerald, should we just remove the code that dissects 
> IEEE80211_RADIOTAP_FCS from the 1.0.1 Wireshark release, in 
> preparation for later releases interpreting presence bit 14 as RX flags?

As Guy mentioned I worked with him to resolve at least one conflict 
between various systems.  The definitions in freebsd have been in use 
for a while and have shipped in released versions of the os so there are 
many data files "in the field" and unless there's some way to maintain 
backwards compatibility it's unlikely they'll change.

As to shortgi et al, I've had simple 11n sniffing support for ~2 years 
and sent Gerald+Guy my mods to provide the most basic support in 
wireshark (haven't pushed tcpdump mods upstream year but they are in 
freebsd cvs).  Since then I've done more involved changes for wireshark 
but haven't pushed them back because I first wanted to leverage the PPI 
dissector's support for reconstructing AMPDU aggregates.  However my 
other changes build on the earlier work and that work addresses issues 
more general than 11n so I believe they are worth keeping.

>
> The collision problem with 15 and 16 is worse - OpenBSD defines 15 as 
> IEEE80211_RADIOTAP_HWQUEUE, and defines 16 as IEEE80211_RADIOTAP_RSSI, 
> and several of their drivers use one or the other or both.  Wireshark 
> currently doesn't dissect them; it should dissect them according to 
> the standard.

I gave up trying to deal w/ obsd and tell anyone that comes to me w/ 
data files from them that they need to convert formats if they want to 
inspect the data.  I know that doesn't help but given the way radiotap 
is designed (ATM) I don't see a better solution.

    Sam
