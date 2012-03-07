From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Handling RADIOTAP_EXT
Date: Wed, 07 Mar 2012 09:10:59 +0100
Message-ID: <1331107859.3519.4.camel@jlt3.sipsolutions.net>
References: <4F56879E.9030907@create-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4F56879E.9030907-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi

> I have a radiotap header with extended namespaces. Basically in each on 
> them I define a rate (either legacy or mcs) and a retry count.

Makes sense.

> I can correctly iterate over the header using the reference lib, however 
> I could not figure it out how to keep known the namespace index 
> currently being parsed.

Can you elaborate what you mean? Do you want to keep something while
using the library?

johannes
