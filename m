From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Endianness of particular fields?
Date: Mon, 18 Jun 2018 15:58:47 +0200
Message-ID: <1529330327.3490.23.camel@sipsolutions.net>
References: <83A13AAE-2089-4ED9-97D9-EDEBDD911955@alum.mit.edu>
	 <1519330795.2637.16.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1519330795.2637.16.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2018-02-22 at 21:19 +0100, Johannes Berg wrote:
> 
> I think we should just use {u,s}{64,32,16,8} and drop the whole __le
> thing.
> 
> I'd say we should just remove the wording about adopting the Linux
> convention. We'd never use __be16 or such anyway.

I removed it now, not sure why I forgot earlier. Sorry about that.

johannes
