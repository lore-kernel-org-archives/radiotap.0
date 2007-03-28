From: Marcelo Tosatti <marcelo-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Date: Wed, 28 Mar 2007 15:04:13 -0300
Message-ID: <20070328180413.GC17793__33365.8662195832$1216696505$gmane$org@dmt>
References: <20070325232416.64xwkc0kw04oosg0@webmail.spamcop.net> <20070326033729.GG31621@che.ojctech.com> <1174949149.28132.49.camel@dv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1174949149.28132.49.camel@dv>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, Mar 26, 2007 at 06:45:49PM -0400, Pavel Roskin wrote:
> On Sun, 2007-03-25 at 22:37 -0500, David Young wrote:
> 
> > > One is found in the current wireless-2.6.git:
> > > 
> > >         IEEE80211_RADIOTAP_RX_FLAGS = 14,
> > >         IEEE80211_RADIOTAP_TX_FLAGS = 15,
> > >         IEEE80211_RADIOTAP_RTS_RETRIES = 16,
> > >         IEEE80211_RADIOTAP_DATA_RETRIES = 17,
> > 
> > These fields are slated to become part of the standard, I just haven't got
> > around to updating the manual page, yet.  I have time to do that tonight.
> 
> OK.  I was wrong to assume that non-standard fields were introduced on
> the Linux side.

I mentioned those in the past to David Young, but I forgot to resend
them to the radiotap list. 

>From what I gather he's OK with them.
