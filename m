From: Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Fri, 31 Aug 2007 09:33:12 -0700
Message-ID: <46D842C8.2000006@errno.com>
References: <1188512214.7585.3.camel@johannes.berg> <1188571628.24684.7.camel@dv> <46D84073.3090709@errno.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <46D84073.3090709-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>, radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Sam Leffler wrote:
> Pavel Roskin wrote:
>> On Fri, 2007-08-31 at 00:16 +0200, Johannes Berg wrote:
>>  
>>> Our radiotap header in Linux defines bit 14 as
>>> IEEE80211_RADIOTAP_RX_FLAGS; however running wireshark on it tells me
>>> that this bit means "FCS in header". Does anybody know which use is
>>> correct, if any?
>>>     
>>
>> As far as I know, "FCS in header" is a FreeBSD thing, which came to
>> Linux in MadWifi.  "Rx flags" comes from Linux Libertas driver.
>>
>> The standard uses the later:
>> http://netbsd.gw.com/cgi-bin/man-cgi?ieee80211_radiotap+9+NetBSD-current
>>
>> MadWifi has removed the non-standard use of bit 14.  Now it's time to
>> fix wireshark.
>>
>>  
>>> Maybe we should simply skip to bit 32 or something and start redefining
>>> things properly?
>>>     
>>
>> And what would be "properly"?  How would it prevent drivers from adding
>> non-standard fields?
>>
>>   
> freebsd never had "fcs in header".

Let me rephrase.  From the CVS commit that removed it's definiteion on 
freebsd:

o remove reference to IEEE80211_RADIOTAP_FCS; it was never used, instead
  the flags are marked with IEEE80211_RADIOTAP_F_FCS to indicate whether
  or not FCS is present

I used to try and sync against other .h files.  I no longer find it useful.

    Sam
