Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE autolearn=no autolearn_force=no
	version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 696F284D3A
	for <radiotap@netbsd.org>; Fri, 24 Jul 2020 11:13:56 +0000 (UTC)
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id cte3E16c3Cin for <radiotap@netbsd.org>;
	Fri, 24 Jul 2020 11:13:56 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate
 requested) by mail.netbsd.org (Postfix) with ESMTPS id 90CC184D22 for
 <radiotap@netbsd.org>; Fri, 24 Jul 2020 11:13:54 +0000 (UTC)
Message-ID: <1f5e4f999c980e86ebec213b0b3bfcd9d22ede15.camel@sipsolutions.net>
Subject: Re: Proposed Tx flag: don't reorder frames
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 24 Jul 2020 13:13:51 +0200
In-Reply-To: <CAFXAJYyqgCqhMB0sEY4t5K-PcCe4G1O6Ef1NYCpK=eZcuntVvw@mail.gmail.com>
References: 
	<CAFXAJYyqgCqhMB0sEY4t5K-PcCe4G1O6Ef1NYCpK=eZcuntVvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: Mathy Vanhoef <vanhoefm@gmail.com>, radiotap@netbsd.org

On Fri, 2020-07-24 at 09:58 +0400, Mathy Vanhoef wrote:

> I propose to add a DONT_REORDER bit to the existing TX flags field.
> When this flag is set, injected frames shouldn't be reordered relative
> to other frames that also have this flag set (even when these frames
> have different QoS TID values).
> 
> This for example allows userspace to inject frames that have different
> QoS TID fields while assuring that they are transmitted in the order
> as they were injected. In practice this is useful to perform certain
> experiments where the order of transmitted frames is important.

Interesting.

> Note that on the radiotap website the TX flags field is still listed
> under the "suggested fields" page, but I'm assuming that by now this
> field is approved (since it's used in Linux)?

No, it never was. I made an attempt at some point, but abandoned it for
some reason.

I see no reason why it couldn't be done though, and I guess this new
flag could be included from the start.

johannes



