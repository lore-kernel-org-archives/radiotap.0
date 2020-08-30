Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 39FEF84DF3
	for <radiotap@netbsd.org>; Sun, 30 Aug 2020 00:05:50 +0000 (UTC)
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 9BoVQZBMMel5 for <radiotap@netbsd.org>;
	Sun, 30 Aug 2020 00:05:49 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits)) (No client certificate
 requested) by mail.netbsd.org (Postfix) with ESMTPS id 2910984D26 for
 <radiotap@netbsd.org>; Sun, 30 Aug 2020 00:05:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y2so233674lfy.10
        for <radiotap@netbsd.org>; Sat, 29 Aug 2020 17:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAFXAJYyqgCqhMB0sEY4t5K-PcCe4G1O6Ef1NYCpK=eZcuntVvw@mail.gmail.com>
 <1f5e4f999c980e86ebec213b0b3bfcd9d22ede15.camel@sipsolutions.net>
In-Reply-To: <1f5e4f999c980e86ebec213b0b3bfcd9d22ede15.camel@sipsolutions.net>
From: Mathy Vanhoef <vanhoefm@gmail.com>
Date: Sun, 30 Aug 2020 04:05:36 +0400
Message-ID: <CAFXAJYzsg+NB69NpeUHuiySMsC_h2yQTko3_4-23Msfj9YOBhA@mail.gmail.com>
Subject: Re: Proposed Tx flag: don't reorder frames
Content-Type: text/plain; charset="UTF-8"
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: radiotap@netbsd.org

To follow up on this: the only downside is that OpenBSD is using the
TX flags identifier to report the hardware queue on which a frame was
received.

Since Linux and NetBSD are using TX flags, and Wireshark decided to
already accept the patch to support TX flags as well, it seems to make
sense to let this identifier represent TX flags. Then only one
implementation (OpenBSD) would have to be updated to match this. I'm
assuming nobody would be against this, since there have been more than
three weeks to discuss this, and nobody brought this up.

What's the next step? Adopt the proposal in one week if there are no
further objections?

Best regards,
Mathy

PS: Is the archive on https://lore.kernel.org/radiotap/ being updated?


On Fri, Jul 24, 2020 at 3:13 PM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Fri, 2020-07-24 at 09:58 +0400, Mathy Vanhoef wrote:
>
> > I propose to add a DONT_REORDER bit to the existing TX flags field.
> > When this flag is set, injected frames shouldn't be reordered relative
> > to other frames that also have this flag set (even when these frames
> > have different QoS TID values).
> >
> > This for example allows userspace to inject frames that have different
> > QoS TID fields while assuring that they are transmitted in the order
> > as they were injected. In practice this is useful to perform certain
> > experiments where the order of transmitted frames is important.
>
> Interesting.
>
> > Note that on the radiotap website the TX flags field is still listed
> > under the "suggested fields" page, but I'm assuming that by now this
> > field is approved (since it's used in Linux)?
>
> No, it never was. I made an attempt at some point, but abandoned it for
> some reason.
>
> I see no reason why it couldn't be done though, and I guess this new
> flag could be included from the start.
>
> johannes
>


