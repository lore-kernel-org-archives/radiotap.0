From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Date: Wed, 28 Mar 2007 16:33:32 -0400
Message-ID: <1175114012.9299.4.camel__41537.9305639819$1216696506$gmane$org@dv>
References: <20070325232416.64xwkc0kw04oosg0@webmail.spamcop.net>
	 <20070326033729.GG31621@che.ojctech.com> <1174949149.28132.49.camel@dv>
	 <20070328180413.GC17793@dmt>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070328180413.GC17793@dmt>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Marcelo Tosatti <marcelo-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>
Cc: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

On Wed, 2007-03-28 at 15:04 -0300, Marcelo Tosatti wrote:
> On Mon, Mar 26, 2007 at 06:45:49PM -0400, Pavel Roskin wrote:
> > On Sun, 2007-03-25 at 22:37 -0500, David Young wrote:
> > 
> > > > One is found in the current wireless-2.6.git:
> > > > 
> > > >         IEEE80211_RADIOTAP_RX_FLAGS = 14,
> > > >         IEEE80211_RADIOTAP_TX_FLAGS = 15,
> > > >         IEEE80211_RADIOTAP_RTS_RETRIES = 16,
> > > >         IEEE80211_RADIOTAP_DATA_RETRIES = 17,
> > > 
> > > These fields are slated to become part of the standard, I just haven't got
> > > around to updating the manual page, yet.  I have time to do that tonight.
> > 
> > OK.  I was wrong to assume that non-standard fields were introduced on
> > the Linux side.
> 
> I mentioned those in the past to David Young, but I forgot to resend
> them to the radiotap list. 

Then we need to remove IEEE80211_RADIOTAP_FCS from Linux
ieee80211_radiotap.h.  It's only present in a comment, but it's a
comment that can be harmful.  I could submit a patch, but it would
conflict with a patch that does sparse annotation.

OK, I'll submit both.

-- 
Regards,
Pavel Roskin
