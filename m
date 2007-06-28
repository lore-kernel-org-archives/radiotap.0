From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: WiMAX extensions
Date: Wed, 27 Jun 2007 20:10:44 -0500
Message-ID: <20070628011044.GD23293@che.ojctech.com>
References: <50721.65.74.1.247.1178691838.squirrel@webmail.cs.umd.edu> <20070513033218.GL20770@che.ojctech.com> <465B128D.9070904@cs.umd.edu> <2A4D4978-D308-40EA-89D5-A2304A5947C7@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2A4D4978-D308-40EA-89D5-A2304A5947C7-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

On Wed, Jun 27, 2007 at 04:45:04PM -0700, Guy Harris wrote:
> 
> On May 28, 2007, at 10:34 AM, Charles Clancy wrote:
> 
> >Suggested new fields:
> 
> 	...
> 
> >- received frequency (in kHz, MHz is not specific enough)
> 
> So that'd be an alternative to IEEE80211_RADIOTAP_CHANNEL and  
> IEEE80211_RADIOTAP_XCHANNEL, both of which give the frequency in MHz?
> 
> (BTW, the current FreeBSD ieee80211_radiotap.h defines  
> IEEE80211_RADIOTAP_XCHANNEL as 14 and the current NetBSD  
> ieee80211_radiotap.h defines IEEE80211_RADIOTAP_RX_FLAGS as 14.   
> Hopefully one or the other of those is *NOT* currently being used, as  
> that means that tcpdump, Wireshark, etc. can't handle a property with  
> a code of 14 *AND*, at least as I understand the way radiotap works,  
> can't handle anything after 14, either, as they don't know how long  
> that property is.  NetBSD and OpenBSD also collide on the value of 14,  
> as well as values after it.)

Guy, your understanding is correct.  The divergence is not good for
anyone.  The responsible people in OpenBSD and FreeBSD should bring
proposals to the list in order to get presence bits assigned.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
