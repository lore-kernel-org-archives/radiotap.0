From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 14:39:58 -0500
Message-ID: <20080619193958.GB17738@che.ojctech.com>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg> <20080619185646.GA17738@che.ojctech.com> <1213902633.8967.84.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1213902633.8967.84.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Jun 19, 2008 at 09:10:33PM +0200, Johannes Berg wrote:
> On Thu, 2008-06-19 at 13:56 -0500, David Young wrote:
> 
> > I favor these assignments:
> > 
> > 14 /RX flags
> > 15 /TX flags
> > 16 /RTS retries
> > 17 /data retries
> > 18 /XChannel 
> 
> That'd be great to me. Want me to declare them that on the wiki, move
> them over to the defined-fields and add the other ones as "suggested
> fields" without assigned numbers?

Well, you and I agree, but let us give everyone else a chance. :-)
Let's do this:

1 define the alignment, width, interpretation of the fields (I believe
  this is done, somewhere.)
2 produce implementations wireshark and/or tcpdump and for one or
  more driver
3 post fields and code here, and on the wiki
4 leave 7 days for discussion (ordinarily, this should be longer)
5 if the proposal withstands discussion, re-post proposal in final form
6 adopt the proposal in 7 days if there are no further objections
  (discussion is over, however, 7 days lets everyone verify that the
  proposal and amendments, as discussed, have become the standard)

> Problem is, wireshark actually takes bit 14 to mean "FCS in header".

I'd forgotten about that, but I think that we still have some flexibility.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
