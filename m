From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: ancient list archives
Date: Fri, 12 Apr 2019 12:30:17 -0500
Message-ID: <20190412173017.GC2885@pobox.com>
References: <8eb90652f3c204abd8a05231aac9d675caedbf3e.camel@sipsolutions.net>
 <20190412171108.GA2885@pobox.com>
 <0be21ebd81ff48a096204cc0586bef4002a0690e.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="qMm9M+Fa2AknHoGS"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0be21ebd81ff48a096204cc0586bef4002a0690e.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I found a little bit more in an old sent-mail folder.  It's possible
that some of these bounced for one reason or another.  Attached is
everything I have, February through March.

Dave

-- 
David Young
dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org    Urbana, IL    (217) 721-9981

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Tue, 6 Feb 2007 15:48:14 -0600
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Subject: test
Message-ID: <20070206214814.GB31900-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.1i

Test.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Tue, 6 Feb 2007 16:02:52 -0600
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Subject: test
Message-ID: <20070206220252.GC31900-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.1i

Test.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Tue, 6 Feb 2007 16:06:00 -0600
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Subject: test
Message-ID: <20070206220600.GD31900-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.1i


-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Sun, 25 Mar 2007 23:09:24 -0500
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Subject: vendor-specific fields?
Message-ID: <20070326040924.GB24097-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.1i

I have received a few questions about vendor-specific fields in radiotap
headers.  I don't think vendor-specific fields belong in public radiotap
headers, but here is a trick by which a vendor can insert them for their
own private use:

After the last field indicated by the presence bitmap, it_present (plus
extensions), let the vendor insert their 3-byte Organizationally Unique
Identifier (OUI), and a 1-byte length field that tells the length of
the vendor-specific fields that will follow, not counting the OUI +
length field.  Let the vendor insert as many of these (OUI, length,
fields) tuples as they like, using whichever of their OUIs as they like,
up to the maximum size of a radiotap header.  The vendor needs to set
it_len equal to the length of the header and presence bitmap, radiotap
fields, and vendor fields, so that a parser such as libpcap's can skip
over the whole header.

Make sense?

I hope we can avoid the proliferation "in the wild" of vendor-specific
ways of annotating 802.11 packets.  Let vendor fields stay private to the
vendors' development.  I don't think the trick I suggest above should be
blessed by the radiotap documentation, and I hope that the maintainers
of wireshark, tcpdump, and libpcap will not bless interpreters for
vendor-specific fields.  One of the principle aims of radiotap is,
after all, to produce a device-independent radio capture header. :-)

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Sun, 25 Mar 2007 22:38:39 -0500
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Subject: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Message-ID: <20070326033839.GA24097-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
References: <20070325232416.64xwkc0kw04oosg0-2RFepEojUI3Rd1RZctBqVdHuzzzSOjJt@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070325232416.64xwkc0kw04oosg0-2RFepEojUI3Rd1RZctBqVdHuzzzSOjJt@public.gmane.org>
User-Agent: Mutt/1.4.1i

On Sun, Mar 25, 2007 at 11:24:16PM -0400, Pavel Roskin wrote:
> Hello!

(Oops, this time cc'd radiotap.)

The place to discuss this is the mailing list
radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org, which I have cc'd.  Subscribe at
<http://mail.ojctech.com/mailman/listinfo/radiotap>.  Please feel free
to circulate the URL.

> I have noticed two different incompatible changes to enum
> ieee80211_radiotap_type in ieee80211_radiotap.h.
> 
> One is found in the current wireless-2.6.git:
> 
>         IEEE80211_RADIOTAP_RX_FLAGS = 14,
>         IEEE80211_RADIOTAP_TX_FLAGS = 15,
>         IEEE80211_RADIOTAP_RTS_RETRIES = 16,
>         IEEE80211_RADIOTAP_DATA_RETRIES = 17,

These fields are slated to become part of the standard, I just haven't got
around to updating the manual page, yet.  I have time to do that tonight.

> It was added together with Marvell Libertas USB driver.

> Another set of the flags can be found in CVS OpenBSD:
> 
>         IEEE80211_RADIOTAP_FCS = 14,
>         IEEE80211_RADIOTAP_HWQUEUE = 15,
>         IEEE80211_RADIOTAP_RSSI = 16,

These fields are not part of the standard, and they will not become part
of the standard with these numbers.  This is the first time I have ever
heard of HWQUEUE and RSSI, actually.  What are they for?

> I think Marvell developers could act gracefully and push the flags it introduces
> to higher numbers.  Doing something like that on the OpenBSD side would be
> harder.  I would also like to see joining Rx and Tx flags into one 32-bit
> value.

> But we need some coordination when new fields are added to the protocol.

Right.  People must coordinate on the radiotap list.

> Uncalibrated RSSI may also be a candidate for
> the driver-specific data if OpenBSD can be persuaded to abandon its present
> number.

OpenBSD will need to abandon its present numbers in order to stay
compatible with tcpdump and wireshark.

> It's important that presence of driver specific fields doesn't break parsing of
> the standard fields, even if new fields are made standard.  I think driver
> specific flags don't belong to the it_present bitmap, but should go to the
> beginning of the driver specific area.

You are right that the driver-specific fields cannot go in the bitmap.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Mon, 26 Mar 2007 11:59:08 -0500
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Subject: Re: RFC: radiotap discrepancy in Linux vs OpenBSD
Message-ID: <20070326165908.GK31621-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
References: <20070325232416.64xwkc0kw04oosg0-2RFepEojUI3Rd1RZctBqVdHuzzzSOjJt@public.gmane.org> <20070326033839.GA24097-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org> <43e72e890703260841v56047559y90b7c25c9c458564-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43e72e890703260841v56047559y90b7c25c9c458564-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
User-Agent: Mutt/1.4.1i

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

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Mon, 26 Mar 2007 14:50:45 -0500
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Subject: Re: [Radiotap] Query about recent Radiotap changes
Message-ID: <20070326195045.GA11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mail-Followup-To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
References: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
User-Agent: Mutt/1.4.1i

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

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Mon, 26 Mar 2007 14:53:08 -0500
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Subject: Re: [Radiotap] Query about recent Radiotap changes
Message-ID: <20070326195308.GB11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mail-Followup-To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
References: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> <20070326195045.GA11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070326195045.GA11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
User-Agent: Mutt/1.4.1i

On Mon, Mar 26, 2007 at 02:50:45PM -0500, David Young wrote:
> You could say these fields became part of the standard through the first
> and last radiotap fields amnesty.  I am not 

going to finish that sentence, apparently.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS
Content-Type: message/rfc822
Content-Disposition: inline

Date: Mon, 26 Mar 2007 16:17:32 -0500
From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Subject: Re: [Radiotap] Query about recent Radiotap changes
Message-ID: <20070326211732.GF11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
Mail-Followup-To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
References: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> <20070326195045.GA11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org> <F63792BF-FB34-46CB-A541-E33015EEF69E-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F63792BF-FB34-46CB-A541-E33015EEF69E-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
User-Agent: Mutt/1.4.1i

On Tue, Mar 27, 2007 at 09:11:17AM +1200, Scott Raynel wrote:
> Hello again,
> 
> On 27/03/2007, at 7:50 AM, David Young wrote:
> 
> >
> >The _F_RX_BADFCS flag in the field IEEE80211_RADIOTAP_RX_FLAGS is
> >redundant.  The flag duplicates the function of the _F_FCS field in
> >the IEEE80211_RADIOTAP_FLAGS field.  TIMTOWTDI is a recipe for design
> >complexity.
> 
> I was under the impression that IEEE80211_RADIOTAP_F_RX_BADFCS  
> duplicated the function of the _F_BADFCS, not _F_FCS, which indicates  
> the presence of FCS bytes in the frame. Or am I missing something?

You're right.  It duplicates the _F_BADFCS flag, not _F_FCS.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933

--qMm9M+Fa2AknHoGS--
