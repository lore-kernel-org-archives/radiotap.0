From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: BPF code generation for radiotap
Date: Fri, 11 May 2007 18:50:59 -0700
Message-ID: <46451D83.2070003@alum.mit.edu>
References: <20070511231511.GB20770@che.ojctech.com> <46450124.1010809@alum.mit.edu> <20070511235204.GC20770@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070511235204.GC20770-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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

David Young wrote:

> Right now, all radiotap fields can be found without a loop.

I.e., can be found with a completely unrolled loop.

I might have to work on the optimizer to handle code such as

	if (field XXX is present)
		add AAA to the offset into the packet;
	if (field YYY is present)
		add BBB to the offset into the packet;

etc. - I remember seeing problems such as that when trying to handle 
either the token ring header (which is variable-length, with source 
routing stuff) or the 802.11 header in full generality (some frames have 
4 MAC addresses - those are frames being sent from one access point to 
another access point, right?).
