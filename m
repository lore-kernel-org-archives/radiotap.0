From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Vendor Namespace Question
Date: Tue, 04 Nov 2014 20:47:56 +0100
Message-ID: <1415130476.2064.22.camel@sipsolutions.net>
References: <54591CF9.7030106@verizon.net>
	 (sfid-20141104_203850_228702_C706EE9A)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54591CF9.7030106-H+0wwilmMs3R7s880joybQ@public.gmane.org> (sfid-20141104_203850_228702_C706EE9A)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "C. McPherson" <ccmcphe-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2014-11-04 at 13:37 -0500, C. McPherson wrote:
> Hello all:
> I was just trying to use the latest stable backports-3.18-rc1-1 and I 
> noticed that there is no longer structure members in the 
> ieee80211_rx_status structure for Vendor namespace information?  In my 
> backports 3.14 version I used them to add some register information to 
> the radiotap header in the lab. How does one use the vendor name space 
> without those structure members?

We removed this from the Linux kernel because there was no driver using
it and we needed the space for other purposes. That said, it shouldn't
be too difficult to put it back by keeping the OUI/subtype also in the
skb->data rather than the rx_status (which is now full enough to no
longer have space for it, I believe)

johannes

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
