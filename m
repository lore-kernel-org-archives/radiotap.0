From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: Query about recent Radiotap changes
Date: Mon, 26 Mar 2007 14:50:45 -0500
Message-ID: <20070326195045.GA11742@che.ojctech.com>
References: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Mon, Mar 26, 2007 at 09:35:24PM +1200, Scott Raynel wrote:
> Hi!
> 
> Just noticed the changes that went into OpenBSD tonight, but I have a  
> query as to one of the comments in the file:
> 
> /* For IEEE80211_RADIOTAP_RX_FLAGS */
> #define IEEE80211_RADIOTAP_F_RX_BADFCS 0x0001  /* Frame failed CRC  
> check.
> 						*
> 						* Deprecated: use the flag
> 						* IEEE80211_RADIOTAP_F_FCS in
> 						* the 
> 						IEEE80211_RADIOTAP_FLAGS
> 						* field, instead.
> 						*/
> 
> /* For IEEE80211_RADIOTAP_TX_FLAGS */
> 
> What does the Deprecated warning apply to? I presume it's got to do  
> with the old field, IEEE80211_RADIOTAP_FCS, but the comment is in an  
> extremely weird place. It implies that the new _F_RX_BADFCS flag is  
> deprecated.

The _F_RX_BADFCS flag in the field IEEE80211_RADIOTAP_RX_FLAGS is
redundant.  The flag duplicates the function of the _F_FCS field in
the IEEE80211_RADIOTAP_FLAGS field.  TIMTOWTDI is a recipe for design
complexity.

The reasons I add the four new fields are three-fold:

        * keep my word that those fields would become part of the standard
        * standardize an existing practice that apparently came to
          be due to an innocent misunderstanding between myself and
          another developer
        * create a basis for adding new fields: the next available
	  type number is 18.

You could say these fields became part of the standard through the first
and last radiotap fields amnesty.  I am not 

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
