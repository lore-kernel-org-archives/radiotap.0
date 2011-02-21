From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Fields alignment when extended mask is present
Date: Mon, 21 Feb 2011 10:27:40 +0100
Message-ID: <1298280460.3707.1.camel@jlt3.sipsolutions.net>
References: <4D60F317.8090007@create-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4D60F317.8090007-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Cc: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Sun, 2011-02-20 at 11:55 +0100, Roberto Riggio wrote:
> Hi,
> 
> I'm generating a radio tap header with extended mask in order to
> specify a multi rate retry chain. In the first mask i have 4 fields
> each of them 8 bits long, so no padding problem.
> 
> In the second, third and forth mask I have only the rate and the retries
> fields should I use padding between one mask and the next:
> 
> rate_1 (8)
> retry_1 (8)
> pad (8)
> pad (8)
> rate_2 (8)
> retry_2 (8)
> pad (8)
> pad (8)
> 
> or insted:
> 
> rate_1 (8)
> retry _1 (8)
> rate_2 (8)
> retry _2 (8)

What's with the "(8)"? Generally, anything in the data portion of
radiotap needs to be padded to the right position.

johannes
