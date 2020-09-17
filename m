Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE autolearn=no autolearn_force=no
	version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 103B184DAF
	for <radiotap@netbsd.org>; Thu, 17 Sep 2020 09:57:35 +0000 (UTC)
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 60GRrL0EOOC2 for <radiotap@netbsd.org>;
	Thu, 17 Sep 2020 09:57:34 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate
 requested) by mail.netbsd.org (Postfix) with ESMTPS id 29C6A84D33 for
 <radiotap@netbsd.org>; Thu, 17 Sep 2020 09:57:34 +0000 (UTC)
Message-ID: <82c52c849dace45d056dcb2b83c9be94b54f9ccb.camel@sipsolutions.net>
Subject: Re: Proposed Tx flag: don't reorder frames
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 17 Sep 2020 11:57:30 +0200
In-Reply-To: <CAFXAJYzsg+NB69NpeUHuiySMsC_h2yQTko3_4-23Msfj9YOBhA@mail.gmail.com>
References: 
	<CAFXAJYyqgCqhMB0sEY4t5K-PcCe4G1O6Ef1NYCpK=eZcuntVvw@mail.gmail.com>
	 <1f5e4f999c980e86ebec213b0b3bfcd9d22ede15.camel@sipsolutions.net>
	 <CAFXAJYzsg+NB69NpeUHuiySMsC_h2yQTko3_4-23Msfj9YOBhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: Mathy Vanhoef <vanhoefm@gmail.com>
Cc: radiotap@netbsd.org

On Sun, 2020-08-30 at 04:05 +0400, Mathy Vanhoef wrote:
> To follow up on this: the only downside is that OpenBSD is using the
> TX flags identifier to report the hardware queue on which a frame was
> received.
> 
> Since Linux and NetBSD are using TX flags, and Wireshark decided to
> already accept the patch to support TX flags as well, it seems to make
> sense to let this identifier represent TX flags. Then only one
> implementation (OpenBSD) would have to be updated to match this. I'm
> assuming nobody would be against this, since there have been more than
> three weeks to discuss this, and nobody brought this up.
> 
> What's the next step? Adopt the proposal in one week if there are no
> further objections?

Sorry this took so long.

I think we need to make a proper proposal again for the whole TX flags
field, since that was never officially adopted?


> PS: Is the archive on https://lore.kernel.org/radiotap/ being updated?

Looks like no, I have asked the admins there, but didn't hear back yet.

johannes



