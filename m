From: Charles Clancy <clancy-VX+DGZyGJwM3uPMLIKxrzw@public.gmane.org>
Subject: Re: WiMAX extensions
Date: Mon, 28 May 2007 13:34:05 -0400
Message-ID: <465B128D.9070904@cs.umd.edu>
References: <50721.65.74.1.247.1178691838.squirrel@webmail.cs.umd.edu> <20070513033218.GL20770@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070513033218.GL20770-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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

David Young wrote:
>> I can put together a list of fields that it would be good to define, if
>> the list thinks this is an appropriate use for Radiotap.
> 
> Yes, please.

There would certainly be overlap with 802.11.  However most 
implementations I've seen seem to prefix the fields with IEEE80211_, so 
I'd think these would all need to be replicated for 802.16.  I'm not 
sure the best way to handle it.

In general, 802.16 is much more stateful than 802.11, so much less of 
the basic packet/network metadata is available in the headers. 
Consequently, there are more things that would be useful to see in the 
radiotap header.

Suggested new fields:
- TDD or FDD network
- uplink or downlink
- received frequency (in kHz, MHz is not specific enough)
- BSID (unlike 802.11, this is not in the MAC-CPS)
- whether the PDU contains a CRC32 at the end
- whether the PDU is encrypted
- UIUC or DIUC for the PDU, and associated modulation/coding


-- 
t. charles clancy, ph.d.  <>  tcc-e45ueOrobK4@public.gmane.org  <>  www.cs.umd.edu/~clancy
