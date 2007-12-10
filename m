From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: rfc: "canonical" radiotap parser
Date: Mon, 10 Dec 2007 13:18:15 -0600
Message-ID: <20071210191815.GE3568@che.ojctech.com>
References: <20071207045545.GO3568@che.ojctech.com> <1197110397.4171.46.camel@johannes.berg> <20071208210645.GX3568@che.ojctech.com> <1197290250.6035.69.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1197290250.6035.69.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, Dec 10, 2007 at 01:37:30PM +0100, Johannes Berg wrote:
> 
> > I was trying to give the compiler a hint to help it generate better
> > code on architectures, such as ARM, where unaligned loads may take
> > many instructions.
> 
> Well, yes, but who guarantees that it actually *is* aligned that way?
> Radiotap only specifies that the fields are aligned with respect to the
> start of the header, but there's nothing that guarantees alignment of
> that.

The caller of radiotap_parse_first() must supply a 64-bit aligned
ieee80211_radiotap_header in the first argument.  If the header is not
so aligned, then the parse fails right away with RADIOTAP_ERROR_ALIGNMENT.

Really, radiotap_parse_first() should require either 32-bit alignment,
or alignment as great as the maximum alignment of all of the fields that
are present, whichever is greater.

I copy radiotap headers to ensure 64-bit alignment in
main.c:cap_cb().

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
