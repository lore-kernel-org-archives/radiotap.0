Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 7CC2C84D21
	for <radiotap@netbsd.org>; Wed, 11 Dec 2019 01:51:44 +0000 (UTC)
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id StkmQPN6yrOd for <radiotap@netbsd.org>;
	Wed, 11 Dec 2019 01:51:43 +0000 (UTC)
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id BE7CD84CEA
	for <radiotap@netbsd.org>; Wed, 11 Dec 2019 01:51:42 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Correct radiotap header for 802.11ad
From: Guy Harris <guy@alum.mit.edu>
In-Reply-To: <1442507879.2821.9.camel@sipsolutions.net>
Date: Tue, 10 Dec 2019 15:51:39 -0800
Message-Id: <C5FF46C6-BDEE-41D8-B7E1-1EFFE9411DE3@alum.mit.edu>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
 <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
 <1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
 <1440402013.3735.1.camel@sipsolutions.net>
 <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com>
 <55DE44EB.6080603@superduper.net>
 <126B842D-05EA-4510-BC9B-DB1A4AABEC12@alum.mit.edu>
 <1135A126-6A5A-4C84-A52D-13C0387609CC@alum.mit.edu>
 <1442507879.2821.9.camel@sipsolutions.net>
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "radiotap@netbsd.org" <radiotap@netbsd.org>, Simon Barber <simon@superduper.net>, Richard Sharpe <realrichardsharpe@gmail.com>

On Sep 17, 2015, at 9:37 AM, Johannes Berg <johannes@sipsolutions.net> wrote:

> Not being familiar with DMG, I can't really comment on this.
> 
> It does sound like we need *some* new field though, be it either a DMG
> field or a PLCP SIGNAL field, or perhaps even both.
> 
> Going back to the original thread though, I think using the MCS field
> is quite wrong.

But a presumably-Linux system does appear to use it; see Wireshark bug

	https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=16272

For now, I'll throw a hack into Wireshark to treat a signal >= 60 GHz as meaning 11ad, but, again, should there be additional fields for 11ad?

