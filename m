From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: IEEE80211_RADIOTAP_DATA_RETRIES  for tx frames?
Date: Tue, 27 Nov 2007 21:15:58 -0600
Message-ID: <20071128031558.GQ3568@che.ojctech.com>
References: <200711281127.59233.bruno@thinktube.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200711281127.59233.bruno-L9ZBdB2wSWtl57MIdRCFDg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, Nov 28, 2007 at 11:27:59AM +0900, bruno randolf wrote:
> hello!
> 
> while working on packet injection for madwifi i came across the following 
> question:
> 
> can we use the IEEE80211_RADIOTAP_DATA_RETRIES for injected TX frames to 
> specifiy the number of retries to be used? 
> 
> this usage seems to be slighty different from the strict specification of 
> radiotap for this field (at least the version of the header we have included 
> in madwifi now) because it was concerned with received data frames only, and 
> we apply it to all kinds of frames to be TXed:
> 
> /*
>  * IEEE80211_RADIOTAP_DATA_RETRIES      u_int8_t        data
>  *
>  *     Number of unicast retries a transmitted frame used.
>  */
> 
> could we extend the meaning of this field to be applicable to transmit frames 
> too?

I think that we should.  I intend to use it that way, myself.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
