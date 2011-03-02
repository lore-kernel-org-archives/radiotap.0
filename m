From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Sample parser for radiotap header
Date: Wed, 02 Mar 2011 09:21:03 +0100
Message-ID: <1299054063.4076.2.camel@jlt3.sipsolutions.net>
References: <408dc500-c062-ede0-c040-d21a120a386c@me.com>
	 <4D67F6A1.6060301@create-net.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4D67F6A1.6060301-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Cc: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>, radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2011-02-25 at 19:36 +0100, Roberto Riggio wrote:

> Is this supposed to know about extended present bitmask? I'm creating
> a packet with four chained present bitmask in order to specify a MRR
> chain.
> 
> The problem is that when I'm trying to parse the header with the lib
> only the first "block" is parsed. In fact when I use the function:
> 
> ieee80211_radiotap_iterator_next
> 
> I get ENOENT as return code when the bit 31 is reached. Same result
> i I try to pass this packet to the linux kernel where the iterator
> implementation is the same.

You must be doing something wrong then, it is definitely parsing such
radiotap headers, hopefully correctly. There are examples in the check/
directory for it, e.g. 00.bin:
00000000  00 00 20 00 01 00 00 a0  01 00 00 00 00 00 00 00 
00000010  11 22 33 44 55 66 77 88  aa bb cc dd ee ff 00 11

is a radiotap header with two TSFT fields. I think you most likely
forgot to reset the namespace.

johannes
