From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 13:56:46 -0500
Message-ID: <20080619185646.GA17738@che.ojctech.com>
References: <1188512214.7585.3.camel@johannes.berg> <1213897499.8967.46.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Jun 19, 2008 at 07:44:59PM +0200, Johannes Berg wrote:
> Ok, I tried collecting all the information, and here's what I found so
> far:
> 
> http://www.radiotap.org/suggested-fields
> 
> Bits 14, 15 and 16 are defined twice.
> 
> Can we declare bits 14 through 18 reserved (i.e. may not be used) and
> continue life at 19? Current parsers would have to be changed (the only
> one I found is wireshark and internal ones like hostapd, Linux kernel)
> to treat the presence of those bits to be an abort-condition and as an
> error if there are any above them, current generators would have to stop
> generating those fields over time and instead generate standardised
> versions.
> 
> For me, of course, it would be more comfortable to stick with RX/TX
> flags in 14/15 and RTS retries in 16, but since it's not widely used in
> Linux yet I can easily discard them.

Johannes,

I favor these assignments:

14 /RX flags
15 /TX flags
16 /RTS retries
17 /data retries
18 /XChannel 

> We need to reach a decision though, this is blocking further work on 11w
> and AP mode in Linux. I'm willing to lead such an effort if you let me
> "take over" maintainership of the standard.

I think that what you mean is to lead a discussion of fields 14 and
beyond?  I reckon that no fewer than 4 persons or organizations have
"taken over" maintainership of the standard by now, and that is how we got
into the current mess, with the same bits used for different purposes. :-)

I initiated the mailing list so that there is one place to propose new
fields for discussion and adoption by the community of radiotap users.
It's not here so that anybody, least of all you and I, can tell everybody
else what the fields are.

I don't think that reaching agreement on fields 14 and greater is
necessarily so hard.  Here are three reasons why.

First, Guy Harris invited a lot of people to this discussion list who
seemed to have a stake in radiotap, and some of them did not show up.
As I said before, we do not have to act as advocates for people who don't
show up.  If the person who uses bit 14 for the flavor of packets will
not stand up for it here, then there is no use wringing our hands over
the conflicting assignment.

Agreement is in everybody's interest.  Disagreement is not.

This is not the IETF, but I think that "rough consensus and running
code" is a perfectly fine way to decide what fields we adopt, and there
is neither a consensus nor running code for some fields.  I think that
the lack of code makes the current "conflicts" easy to resolve: just how
much pain can we cause by assigning field 15 to Rx flags if some obscure
driver emits field 15 equal to a packet's smell, but neither WireShark
nor TCPDump interprets it at all?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
