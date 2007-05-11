From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: BPF code generation for radiotap
Date: Fri, 11 May 2007 18:52:04 -0500
Message-ID: <20070511235204.GC20770@che.ojctech.com>
References: <20070511231511.GB20770@che.ojctech.com> <46450124.1010809@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46450124.1010809-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

On Fri, May 11, 2007 at 04:49:56PM -0700, Guy Harris wrote:
> David Young wrote:
> >Can I help someone with BPF know-how to write a radiotap code generator?
> >It would be great if we could use BPF to filter out packets with, say,
> >an RSSI below a certain threshold.
> 
> That will be possible only if the RSSI can be found without a loop, or 
> if you're willing to have all the filtering done in userland.  The 

Right now, all radiotap fields can be found without a loop.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
