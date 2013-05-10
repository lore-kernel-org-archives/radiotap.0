From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Fwd: ieee80211_radiotap_iterator_next return values
Date: Fri, 10 May 2013 18:44:07 +0200
Message-ID: <1368204247.8390.20.camel@jlt4.sipsolutions.net>
References: <CAN_+VLVe6D=HLeKynF1OLnv=X4Pn34xfDUsR1rvVCCR5BB5xdg@mail.gmail.com>
	 <CAN_+VLVY9OY5OdAHs6mdzKLXcubAbHPXprsQis58+_ze939hQw@mail.gmail.com>
	 <1368192729.8390.17.camel@jlt4.sipsolutions.net>
	 <CAN_+VLX8_suEo_=C2sXoz00aRNtbAtpmKjfVUZVHc1RQbe29ew@mail.gmail.com>
	 <CAN_+VLXwax5Ok_BJ-d2ss8M90yyMjQ8smZo4uSpwGdnSQWSH-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAN_+VLXwax5Ok_BJ-d2ss8M90yyMjQ8smZo4uSpwGdnSQWSH-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Lee Hambley <lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2013-05-10 at 17:22 +0200, Lee Hambley wrote:
> To clarify, I'm using (at present) the implementation from
> http://airscan.googlecode.com/svn-history/r2/trunk/radiotap-parser.c -
> not being an expert in such things it looks like the use of
> le32_to_cpu is an indication that this is designed to be used in
> userspace, but still - the iteration function is still returning `1'.

That's a (slightly) different implementation that doesn't match the
other implementations you've been looking at. If you read the comments
in that file, it'll be obvious why it returns 1.

Basically though your problem is that you're taking the radiotap parser
from one place, and the example code from another, and the two differ in
API used.

johannes
