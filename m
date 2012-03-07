From: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Subject: Re: Handling RADIOTAP_EXT
Date: Wed, 07 Mar 2012 09:20:06 +0100
Message-ID: <4F571A36.8020405@create-net.org>
References: <4F56879E.9030907@create-net.org> <1331107859.3519.4.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1331107859.3519.4.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On 03/07/2012 09:10 AM, Johannes Berg wrote:
> Can you elaborate what you mean? Do you want to keep something while
> using the library?

Let's assume that I'm the the following situation:

---
RATE (1) 54 Mbps
COUNT (1) 3
---
RATE (2) 18 Mbps
COUNT (2) 3
---
RATE (3) 6 Mbps
COUNT (3) 3
---

When I'm iterating over the header I could keep track of the namespace 
by incrementing an index after I have found the RETRIES field. This will 
work because the RETRIES field is always after the RATE field so my 
index is consistent.

On the other hand, if in the header MCS and RETRIES the approach above 
will not work, since the MCS field is after the RETRIES field.

So I was wondering if there is a way, while iterating over an header, to 
known how many time the RADIOTAP_NAMESPACE (or the EXT) field has been 
found.

> johannes
R.
