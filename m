From: Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Fri, 20 Jun 2008 10:33:55 +1200
Message-ID: <A4D4B4B8-69A4-481D-BFA7-BEE0A52F3148@gmail.com>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <20080619185646.GA17738@che.ojctech.com>
Mime-Version: 1.0 (Apple Message framework v924)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
In-Reply-To: <20080619185646.GA17738-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi all,
On 20/06/2008, at 6:56 AM, David Young wrote:

> On Thu, Jun 19, 2008 at 07:44:59PM +0200, Johannes Berg wrote:
>> Ok, I tried collecting all the information, and here's what I found  
>> so
>> far:
>>
>> http://www.radiotap.org/suggested-fields
>>
>> Bits 14, 15 and 16 are defined twice.
>>
>> Can we declare bits 14 through 18 reserved (i.e. may not be used) and
>> continue life at 19? Current parsers would have to be changed (the  
>> only
>> one I found is wireshark and internal ones like hostapd, Linux  
>> kernel)
>> to treat the presence of those bits to be an abort-condition and as  
>> an
>> error if there are any above them, current generators would have to  
>> stop
>> generating those fields over time and instead generate standardised
>> versions.
>>
>> For me, of course, it would be more comfortable to stick with RX/TX
>> flags in 14/15 and RTS retries in 16, but since it's not widely  
>> used in
>> Linux yet I can easily discard them.
>
> Johannes,
>
> I favor these assignments:
>
> 14 /RX flags
> 15 /TX flags
> 16 /RTS retries
> 17 /data retries
> 18 /XChannel

For what it's worth, back in March 2007 I spent some time making sure  
that madwifi used these bit assignments (minus XChannel, which I  
hadn't heard of back then). I took the NetBSD headers to be the  
"official" source of the Radiotap standard.

Previously we had been using the in-header FCS flag, which I got rid of.

So, madwifi has been using these bit assignments for some time now -  
hopefully one more reason to not change them :)

Cheers,

--
Scott Raynel
WAND Network Research Group
Department of Computer Science
University of Waikato
New Zealand
