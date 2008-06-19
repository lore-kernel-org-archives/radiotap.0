From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: outgoing interface field
Date: Thu, 19 Jun 2008 16:29:11 -0400
Message-ID: <1213907351.3240.54.camel@dv>
References: <1213903728.8967.92.camel@johannes.berg>
	 <1213904505.3240.27.camel@dv>  <1213904654.8967.96.camel@johannes.berg>
	 <1213906196.3240.47.camel@dv>  <1213906462.8967.110.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <1213906462.8967.110.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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
Cc: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org, "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, 2008-06-19 at 22:14 +0200, Johannes Berg wrote:

> > Besides, radiotap headers are designed to be transferable between
> > systems.  It should be possible to send frames with radiotap headers
> > from another system, possibly with a different endianness and
> > different
> > wireless hardware.  Encoding local data (VAP number) makes radiotap
> > headers system-specific.
> 
> This isn't designed to be ever saved to disk, it's for communication
> between userspace and the kernel when running an AP. We just happen to
> use radiotap for that to save inventing yet another interface.

Then there is very little point in discussing it.  I thought you were
going to suggest some elegant addition to the standard.  Piggybacking
the frames with some OS and system specific data is not.

> > It's funny, we are creating the rules that exclude us, and then we are
> > shopping around for sponsors.  We need exceptions for experimental use.
> 
> Actually, I just figured out that the OUIs have a 'locally assigned' bit
> like MAC addresses (well I guess MAC addresses inherit it from OUIs), so
> we can use that and assign "experimental" OUIs to ourselves as long as
> they don't clash within radiotap.

OK, fine.

-- 
Regards,
Pavel Roskin
