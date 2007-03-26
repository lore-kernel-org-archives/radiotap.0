From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Date: Mon, 26 Mar 2007 11:59:08 -0500
Message-ID: <20070326165908.GK31621__35195.5230501064$1216696501$gmane$org@che.ojctech.com>
References: <20070325232416.64xwkc0kw04oosg0@webmail.spamcop.net> <20070326033839.GA24097@che.ojctech.com> <43e72e890703260841v56047559y90b7c25c9c458564@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43e72e890703260841v56047559y90b7c25c9c458564-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, Mar 26, 2007 at 11:41:38AM -0400, Luis R. Rodriguez wrote:
> CC'ing radiotap list, this time with your comments inline.
> 
> On 3/25/07, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> wrote:
> >On Sun, Mar 25, 2007 at 11:24:16PM -0400, Pavel Roskin wrote:
> >> Hello!
> >
> >(Oops, this time cc'd radiotap.)
> >
> >The place to discuss this is the mailing list
> >radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org, which I have cc'd.  Subscribe at
> ><http://mail.ojctech.com/mailman/listinfo/radiotap>.  Please feel free
> >to circulate the URL.
> >
> >> I have noticed two different incompatible changes to enum
> >> ieee80211_radiotap_type in ieee80211_radiotap.h.
> >>
> >> One is found in the current wireless-2.6.git:
> >>
> >>         IEEE80211_RADIOTAP_RX_FLAGS = 14,
> >>         IEEE80211_RADIOTAP_TX_FLAGS = 15,
> >>         IEEE80211_RADIOTAP_RTS_RETRIES = 16,
> >>         IEEE80211_RADIOTAP_DATA_RETRIES = 17,
> >
> >These fields are slated to become part of the standard, I just haven't got
> >around to updating the manual page, yet.  I have time to do that tonight.
> >
> >> It was added together with Marvell Libertas USB driver.
> >
> >> Another set of the flags can be found in CVS OpenBSD:
> >>
> >>         IEEE80211_RADIOTAP_FCS = 14,
> >>         IEEE80211_RADIOTAP_HWQUEUE = 15,
> >>         IEEE80211_RADIOTAP_RSSI = 16,
> >
> >These fields are not part of the standard, and they will not become part
> >of the standard with these numbers.  This is the first time I have ever
> >heard of HWQUEUE and RSSI, actually.  What are they for?
> 
> RSSI is Received Signal Strength Indication. Its a measurement of the
> received radio signal strength. Unfortunately though RSSI units used
> are arbitrary and the maximum value differs amongst chipsets. From
> wikipedia:
> 
> --
> RSSI measurements will vary from 0 to 255 depending on the vendor. It
> consists of a one byte integer value. A value of 1 will indicate the
> minimum signal strength detectable by the wireless card, while 0
> indicates no signal. The value has a maximum of RSSI_Max. For example,
> Cisco Systems cards will return a RSSI of 0 to 100. In this case, the
> RSSI_Max is 100. The Cisco card can report 101 distinct power levels.
> Another popular Wi-Fi chipset is made by Atheros. An Atheros based
> card will return a RSSI value of 0 to 60.
> --
> 
> As Samuel Barber had recommended before, we should probably instead
> adopt RCPI. Quoting from his e-mail:

RCPI sounds desirable.  Let us avoid labeling a field RCPI if it isn't.
We may need both fields, RSSI (defined: uncalibrated, unsigned, unitless
signal strength, greater numbers -> greater strength) and RCPI (defined
per 802.11k draft 5.0).

Is 802.11k changing very rapidly, esp. the RCPI definition?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
