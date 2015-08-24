From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Mon, 24 Aug 2015 09:40:13 +0200
Message-ID: <1440402013.3735.1.camel@sipsolutions.net>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
	 <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
	 <1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1606812C-649C-4C06-ABE0-AE2F4474BCD0-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Sat, 2015-08-22 at 16:34 -0700, Guy Harris wrote:
> 
> For what it's worth, it appears that the wil6210 driver:
> 
> 	https://wireless.wiki.kernel.org/en/users/drivers/wil6210
> 
> uses the MCS field and its mcs value for 11ad.  It can also be 
> configured to supply raw "PHY data" with a vendor-namespace field.
> 
> So code that processes radiotap headers, such as Wireshark's radiotap
> -header dissector, will have to interpret packets with an MCS field 
> and a channel frequence in the 11ad range as being 11ad packets, and 
> treat the mcs value in the MCS field as an 11ad MCS, not an 11n MCS.

That just seems really lazy though - I think we should rather fix that
driver and define a proper 60G radiotap field.

johannes
