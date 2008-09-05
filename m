From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: Bad FCS flag
Date: Fri, 5 Sep 2008 15:38:39 -0500
Message-ID: <20080905203839.GV29499@che.ojctech.com>
References: <1220646325.11109.21.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1220646325.11109.21.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, Sep 05, 2008 at 10:25:24PM +0200, Johannes Berg wrote:
> Hi,
> 
> Sorry I haven't actually updated my proposal, had other stuff.
> 
> Here's a representation of the non-conflict we're running into with RX
> flags:
> 
>  * wireshark defines that bit 6 in field 1 ("flags") means "bad FCS".

Johannes,

TCPDump uses this bit, too.  I think that we are stuck with it.

>  * the unofficial RX-flags stuff defines that bit 0 in "RX flags" means
>    "bad FCS"

Any users of this bit?

I think that TCPDump & Wireshark probably out-number the radiotap
interpreters who use the rx-flags bit :-), but I don't know how many
drivers there are who write headers with "bad FCS" in the rx flags bit.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
