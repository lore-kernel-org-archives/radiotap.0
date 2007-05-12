From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: BPF code generation for radiotap
Date: Fri, 11 May 2007 20:53:45 -0500
Message-ID: <20070512015344.GD20770@che.ojctech.com>
References: <20070511231511.GB20770@che.ojctech.com> <46450124.1010809@alum.mit.edu> <20070511235204.GC20770@che.ojctech.com> <46451D83.2070003@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46451D83.2070003-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

On Fri, May 11, 2007 at 06:50:59PM -0700, Guy Harris wrote:
> David Young wrote:
> 
> >Right now, all radiotap fields can be found without a loop.
> 
> I.e., can be found with a completely unrolled loop.

Correct.

*snip snip*
> or the 802.11 header in full generality (some frames have 
> 4 MAC addresses - those are frames being sent from one access point to 
> another access point, right?).

Right.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
