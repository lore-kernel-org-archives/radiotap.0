From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Fields alignment when extended mask is present
Date: Mon, 21 Feb 2011 10:50:47 +0100
Message-ID: <1298281847.3707.2.camel@jlt3.sipsolutions.net>
References: <4D60F317.8090007@create-net.org>
	 <1298280460.3707.1.camel@jlt3.sipsolutions.net>
	 <4D6234C5.2020201@create-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4D6234C5.2020201-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Cc: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2011-02-21 at 10:47 +0100, Roberto Riggio wrote:

> >> rate_1 (8)
> >> retry _1 (8)
> >> rate_2 (8)
> >> retry _2 (8)
> > What's with the "(8)"? Generally, anything in the data portion of
> > radiotap needs to be padded to the right position.
> (8) was the field length. in the example above i;ve repoted
> two different radiotap headers where i specify twice the rate
> and the retries field.
> 
> of course i know that in this case i will have to put to it-present
> bitmasks and i will have to set the bit 31 of the first bitmask to 1.
> 
> what i'm not sure is if i have to pad the first "block" to the word
> boundary or not.

I still don't get it. If the field length is 8 bits (1 byte) you don't
need any alignment anyway.

johannes
