From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: rfc: "canonical" radiotap parser
Date: Sat, 8 Dec 2007 15:06:45 -0600
Message-ID: <20071208210645.GX3568@che.ojctech.com>
References: <20071207045545.GO3568@che.ojctech.com> <1197110397.4171.46.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1197110397.4171.46.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

On Sat, Dec 08, 2007 at 11:39:57AM +0100, Johannes Berg wrote:
> Hi Dave,
> 
> I just took a quick look at the parser, it looks pretty good. Andy has
> done something similar and was willing to relicense it under BSD last I
> asked him, his code is part of the Linux kernel right now:
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=net/wireless/radiotap.c;hb=HEAD

I will take a look at that.

> Small question on the code: why did you declare that radiotap_field is
> aligned? It can potentially come from anywhere unaligned, no?

I was trying to give the compiler a hint to help it generate better
code on architectures, such as ARM, where unaligned loads may take
many instructions.  Making the whole structure 64-bit aligned doesn't
sit very well with me.  I believe this is better,

union radiotap_field { 
        int8_t          f_i8[8];
        uint8_t         f_u8[8];
        uint16_t        f_u16[4];
        uint32_t        f_u32[2];
        uint64_t        f_u64;
        struct radiotap_xchan {
                uint32_t        xc_flags;
                uint16_t        xc_mhz;
                uint8_t         xc_chan;
                int8_t          xc_dbm;
        } f_xchan __attribute__((__packed__, __aligned__(4)));
        struct radiotap_chan {
                uint16_t        c_mhz; 
                uint16_t        c_flags;
        } f_chan __attribute__((__packed__, __aligned__(2)));
};
 
Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
