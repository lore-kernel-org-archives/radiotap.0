From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Tue, 20 Feb 2018 10:37:00 +0100
Message-ID: <1519119420.16723.26.camel@sipsolutions.net>
References: <1517300719.2189.51.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1517300719.2189.51.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2018-01-30 at 09:25 +0100, Johannes Berg wrote:

> Rather than copy/paste all the information into the email, here are the
> links to the three newly defined fields.
> http://www.radiotap.org/fields/HE
> http://www.radiotap.org/fields/HE-MU
> http://www.radiotap.org/fields/HE-MU-other-user
> 
> I just made a minor change here to delete the duplicated field, and add
> an RU offset field (with known flag, of course).

Oops, I have to make another update to this - we need a
"primary/secondary 80 MHz bit" (along with validity).

I think I'll put that into data2 bits 0/31, any objections?

johannes
