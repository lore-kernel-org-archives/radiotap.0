From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: outgoing interface field
Date: Thu, 19 Jun 2008 15:41:45 -0400
Message-ID: <1213904505.3240.27.camel@dv>
References: <1213903728.8967.92.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <1213903728.8967.92.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

On Thu, 2008-06-19 at 21:28 +0200, Johannes Berg wrote:
> For our particular implementation of AP mode with hostapd in Linux, we
> are using radiotap-injection interfaces to send management frames.
> 
> Now, 802.11w (encrypted management frames) requires that those frames
> are encrypted, due to key management issues we need to do that in the
> kernel. This means we can no longer simply inject the frames, we need to
> know, in the kernel, which interface to search for the key, since
> multiple virtual AP interfaces/BSSes may be configured on a single PHY.
> 
> This requires that we have a radiotap field indicating the outgoing
> interface to use for such key lookups.

Are you injecting by sending data to a socket?  I think the sockets are
bound to VAPs, not to PHYs since VAPs are seen as network devices.

Besides, are you going to serve more than one VAP with one socket?  I
would not do it without a good reason.  I think ioctl on the socket
would be an easier solution, as it needs to be done once per VAP, not
once per packet.

>  Further uses would be to use, for
> data frames, the fragmentation/RTS threshold from the given interface.
> 
> I don't, off-hand, see any other OS requiring this, so I'm shopping
> around asking vendors if I can have part of their vendor OUI namespace
> (one of the sub-namespaces) for Linux, but if anybody sees value in such
> a field for other OSes we can also add it to the standard.

We could probably register an official Linux OUI for that if the code is
intended for Linux.

-- 
Regards,
Pavel Roskin
