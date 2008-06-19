From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 14:13:21 -0400
Message-ID: <1213899201.2530.12.camel@dv>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <1213897499.8967.46.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>, radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, 2008-06-19 at 19:44 +0200, Johannes Berg wrote:
> Ok, I tried collecting all the information, and here's what I found so
> far:
> 
> http://www.radiotap.org/suggested-fields
> 
> Bits 14, 15 and 16 are defined twice.

If we call those fields "suggested", we deceive ourselves.  Suggested
fields should not come with bit numbers.  There bit numbers should be
assigned only when the suggestion is accepted.

> Can we declare bits 14 through 18 reserved (i.e. may not be used) and
> continue life at 19?

Perhaps you could add your proposal without a bit number and then ask
for the numbers to be assigned?  If 19 is the lowest uncontested number,
then it would be assigned.

There is no need to wait with your proposals until the contested fields
controversy is resolved.

-- 
Regards,
Pavel Roskin
