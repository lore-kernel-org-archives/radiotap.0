From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 14:39:59 -0400
Message-ID: <1213900799.3240.15.camel@dv>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>  <1213899201.2530.12.camel@dv>
	 <1213899529.8967.62.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
In-Reply-To: <1213899529.8967.62.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

On Thu, 2008-06-19 at 20:18 +0200, Johannes Berg wrote:

> Well, yes, but it seemed prudent to not introduce a third
> "used-but-not-standardised" category and these bit numbers reflect the
> fact that they are indeed used with those bit numbers in varying OSes.

OK.  And proper proposals should have "unassigned" under "Bit Number".

> I hope the audience of this website is smart enough to realise that.

Sure, but the contested fields set a bad example.  It may be better to
write "don't do it again" in some places.

> > Perhaps you could add your proposal without a bit number and then ask
> > for the numbers to be assigned?  If 19 is the lowest uncontested number,
> > then it would be assigned.
> > 
> > There is no need to wait with your proposals until the contested fields
> > controversy is resolved.
> 
> Well, I don't have a proposal yet, those fields that are there are
> sufficient if we also accept the vendor-namespaces idea that I'm just
> trying to put into understandable words.

There should be a local/testing/vendor area or bit numbers so that the
proposals can be tested before they are submitted.  Another approach
would be to have an extra header consisting of items in the format like:

header length, in bytes
number of items (N)
vendor id for item 1
﻿length of item 1
﻿type of item 1
data of item 1
...
﻿vendor id for item N
length of item N
﻿﻿type of item N
data of item N

And the radiotap header would indicate whether the extra header is
present.  That would be very flexible for testing (item type could be
incremented when something changes).

-- 
Regards,
Pavel Roskin
