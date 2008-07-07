From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: naming conventions for "fixed" and "floating" bits
Date: Mon, 7 Jul 2008 13:00:22 -0500
Message-ID: <20080707180022.GK1269@che.ojctech.com>
References: <1213901682.8967.74.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1213901682.8967.74.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Jun 19, 2008 at 08:54:42PM +0200, Johannes Berg wrote:
> Hi,
> 
> When we were discussing the namespace bits 29 and 30 we really all knew
> we meant that those bits are reserved in _every_ 32-bit it_present value
> like the extension flag 31, not just reserved as field numbers.
> 
> Would anybody object to adopting the naming convention that the "fixed"
> bits be called "flags" and the "floating" bits be called "field
> indicators", or similar?

Works for me.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
