From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Wed, 12 Sep 2007 15:03:58 -0400
Message-ID: <1189623838.15104.26.camel@dv>
References: <1188512214.7585.3.camel@johannes.berg>
	 <20070912180619.GB17887@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070912180619.GB17887-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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

Hello, David!

On Wed, 2007-09-12 at 13:06 -0500, David Young wrote:

> There are technical reasons that we cannot simply skip.  I have a couple
> of technical solutions in mind.

Before we start addressing the technical side, we should probably
consider the "political" side.  Did the documentation specify where
unapproved extensions should be encoded?  Were the extensions added in
violation of the rules?  How widespread is the non-standard use of bit
14?  What can be done to avoid such situations in the future?

I would hate to see the protocol changed to work around the symptoms
without addressing the real problem.

I would probably try to put the workaround completely in userspace.  I
think the bit 14 abusers can be detected by the fact that bit 14 is the
highest byte they set and that they allocate 2 extra bytes for the
header (since FCS is 32 whereas RX flags is 16 bit).

Failing that, I think we can just obsolete bit 14 and use something else
(e.g. bit 18) for RX flags, or squeeze RX flags into the TX flags field,
perhaps into the upper byte.  I think it's much less intrusive than
adding any "magic" that would need special interpretation.

My preference is to change the protocol version only if we are going to
support radically new media or change something fundamental in the way
the header data is aligned.  Just adding "magic" would probably require
the protocol change.

-- 
Regards,
Pavel Roskin
