From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 13 Sep 2007 13:06:18 -0500
Message-ID: <20070913180618.GK17887@che.ojctech.com>
References: <1188512214.7585.3.camel@johannes.berg> <20070912180619.GB17887@che.ojctech.com> <1189623838.15104.26.camel@dv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1189623838.15104.26.camel@dv>
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

On Wed, Sep 12, 2007 at 03:03:58PM -0400, Pavel Roskin wrote:
> Hello, David!
> 
> On Wed, 2007-09-12 at 13:06 -0500, David Young wrote:
> 
> > There are technical reasons that we cannot simply skip.  I have a couple
> > of technical solutions in mind.
> 
> Before we start addressing the technical side, we should probably
> consider the "political" side.  Did the documentation specify where
> unapproved extensions should be encoded?  Were the extensions added in
> violation of the rules?  How widespread is the non-standard use of bit
> 14?  What can be done to avoid such situations in the future?
> 
> I would hate to see the protocol changed to work around the symptoms
> without addressing the real problem.

By the nature of radiotap, one cannot introduce an "unapproved extension"
at bit n without throwing off the interpretation of bits n+1 and above, be
they approved or not.  I do not think this could escape an implementor's
attention.  Radiotap did not ever provide for unapproved extensions.

IIRC, the documentation in the manual page has always named me as the
point of contact for extensions.  As we know, the manual page has not
been widely disseminated.  The header file, which has been copied around
a lot, has (ordinarily) contained my copyright, but it did not mention
any procedure for adding new fields.

I think that the divergence starting at bit 14 happened in this way:

        1 I miscommunicated.  I added the _FCS field to the header file
          in NetBSD in the middle of a discussion; subsequent discussion
          killed _FCS off.  I only removed _FCS when someone pointed
          out that I had mistakenly left it in.  The manual page has
          not always been adequate, and I have not been publicized it
          very well.

        2 Private radiotap development "leaked" into public.  That is
          how the _RX_FLAGS and _TX_FLAGS fields, which were not
          intentionally intended for public consumption, came to be in
          some Linux drivers.

        3 All communication about new radiotap fields has been reactive
          instead of proactive.

        4 Radiotap development had no "center."  You could not go
          to one place to find the standard, discussions, etc.

I think that having the wiki and mailing list will help #3 and #4.
Adding a method for embedding vendor-specific fields will help #2.
Centralizing the documentation at a Wiki will help it get the oversight
it needs; I hope that will protect against a mistake such as #1, and it
will provide the center.

I believe we are moving in the right direction to solve the political
problem.  I think that participation needs to widen, and I think that
we need to make good on "rough consensus and running code" by writing
more interpreter code for WireShark and TCPDump.

> I would probably try to put the workaround completely in userspace.  I
> think the bit 14 abusers can be detected by the fact that bit 14 is the
> highest byte they set and that they allocate 2 extra bytes for the
> header (since FCS is 32 whereas RX flags is 16 bit).

It's worse than that.  OpenBSD uses several bits.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
