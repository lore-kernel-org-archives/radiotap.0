From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Missing Rate information
Date: Fri, 16 Aug 2013 14:22:50 +0200
Message-ID: <1376655770.15299.25.camel@jlt4.sipsolutions.net>
References: <CADVNyRYzrnBLAsnvGsGhX3iTu4884JwAvRE1mAKj3h0Vt_a9yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CADVNyRYzrnBLAsnvGsGhX3iTu4884JwAvRE1mAKj3h0Vt_a9yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Doug Clements <dclements-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2013-08-16 at 08:10 -0400, Doug Clements wrote:
> Hi,
> 
>    I'm trying to hunt down why some wifi frames captured by tshark are
> missing Rate information. Rate: False is set in the header for a
> portion of frames that I'm getting, but not all. Furthermore, it's
> only on one channel on my network, so I'm sure it's some specific
> device or packet type that isn't getting processed correctly. At first
> I thought maybe they were MCS frames so the Rate would show up in
> those fields, but that does not appear to be the case.

It might have been useful to say what is *generating* those frames,
but ...


>     Present flags: 0x0008482b

This indicates there's MCS information, so you just need to upgrade
wireshark.

johannes
