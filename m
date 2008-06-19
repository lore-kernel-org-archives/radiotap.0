From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: outgoing interface field
Date: Thu, 19 Jun 2008 16:09:56 -0400
Message-ID: <1213906196.3240.47.camel@dv>
References: <1213903728.8967.92.camel@johannes.berg>
	 <1213904505.3240.27.camel@dv>  <1213904654.8967.96.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <1213904654.8967.96.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

On Thu, 2008-06-19 at 21:44 +0200, Johannes Berg wrote:
> > Are you injecting by sending data to a socket?  I think the sockets are
> > bound to VAPs, not to PHYs since VAPs are seen as network devices.
> 
> Yes. The socket is bound to a _cooked monitor_ interface.

Oh well, I should have guessed that.  Maybe we could introduce ioctl to
put socket into "wireless injection mode", in which it would accept
802.11 packets with radiotap headers regardless of the interface mode.
Then the sockets could be bound to the VAPs.

> > Besides, are you going to serve more than one VAP with one socket?  I
> > would not do it without a good reason.  I think ioctl on the socket
> > would be an easier solution, as it needs to be done once per VAP, not
> > once per packet.
> 
> Well, yes, of course we're going to serve multiple BSSes with one socket
> if they're all associated to one physical interface. Why not?

It's a cleaner approach to respect the virtual interface abstraction
existing in the kernel rather than ignore it.  The kernel presents
separate network interfaces to the userspace.

>  It makes
> the code much cleaner and nicer. Why do you think I need a good reason
> to do this? I think you need a good reason _not to_ and this isn't a
> good reason. Besides, ioctls suck.

ioctls suck for global configuration.  They are adequate for configuring
particular sockets or file descriptors.

Besides, radiotap headers are designed to be transferable between
systems.  It should be possible to send frames with radiotap headers
from another system, possibly with a different endianness and different
wireless hardware.  Encoding local data (VAP number) makes radiotap
headers system-specific.

> > We could probably register an official Linux OUI for that if the
> code is
> > intended for Linux.
> 
> Who'd pay for it, and why bother to pollute the OUI namespace with
> something we're not using elsewhere?

It's funny, we are creating the rules that exclude us, and then we are
shopping around for sponsors.  We need exceptions for experimental use.

-- 
Regards,
Pavel Roskin
