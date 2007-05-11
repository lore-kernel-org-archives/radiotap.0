From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: BPF code generation for radiotap
Date: Fri, 11 May 2007 16:49:56 -0700
Message-ID: <46450124.1010809@alum.mit.edu>
References: <20070511231511.GB20770@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070511231511.GB20770-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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
> Can I help someone with BPF know-how to write a radiotap code generator?
> It would be great if we could use BPF to filter out packets with, say,
> an RSSI below a certain threshold.

That will be possible only if the RSSI can be found without a loop, or 
if you're willing to have all the filtering done in userland.  The 
kernel BPF interpreter doesn't support backwards branches; the userland 
one does, to support chasing IPv6 protocol headers, but backward 
branches completely screw up the optimizer (so it gets turned off).
