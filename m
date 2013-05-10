From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Fwd: ieee80211_radiotap_iterator_next return values
Date: Fri, 10 May 2013 15:32:09 +0200
Message-ID: <1368192729.8390.17.camel@jlt4.sipsolutions.net>
References: <CAN_+VLVe6D=HLeKynF1OLnv=X4Pn34xfDUsR1rvVCCR5BB5xdg@mail.gmail.com>
	 <CAN_+VLVY9OY5OdAHs6mdzKLXcubAbHPXprsQis58+_ze939hQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAN_+VLVY9OY5OdAHs6mdzKLXcubAbHPXprsQis58+_ze939hQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Lee Hambley <lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2013-05-10 at 14:55 +0200, Lee Hambley wrote:

> int ret = ieee80211_radiotap_iterator_init(&rti, rth, rth->it_len);
> while(!ret) {
>   printf("Itteration: %d\n", count++);
>   ret = ieee80211_radiotap_iterator_next(&rti);

> 
> There's limited scope for having screwed something up in that code, I
> think, I'm confused by the `1' being returned from
> `ieee80211_radiotap_iterator_init' which according to the
> implenentation doesn't seem like an error condition in the
> implementation http://lxr.free-electrons.com/source/net/wireless/radiotap.c#L95

I think you're confusing the userspace and Linux kernel implementation,
though they're very similar. In any case,
ieee80211_radiotap_iterator_next() cannot return 1, unless one of the
error values is defined to -1 (it returns -EINVAL and a few others)

johannes
