Return-Path: <SRS0=Kzwe=DJ=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FDEC4363D
	for <radiotap@archiver.kernel.org>; Fri,  2 Oct 2020 09:11:43 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1C720679
	for <radiotap@archiver.kernel.org>; Fri,  2 Oct 2020 09:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1C720679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id C3B6F84DF3; Fri,  2 Oct 2020 09:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id A78DB84D4C
	for <radiotap@netbsd.org>; Fri,  2 Oct 2020 09:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id 9YiCXpy71TW8 for <radiotap@netbsd.org>;
	Fri,  2 Oct 2020 09:11:41 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 1AFE084CFC
	for <radiotap@netbsd.org>; Fri,  2 Oct 2020 09:11:40 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1kOH6H-00F9Tv-VR; Fri, 02 Oct 2020 11:11:38 +0200
Message-ID: <cb3a3fced81f890bbaef44ddf67531ed9d583380.camel@sipsolutions.net>
Subject: Re: [RFC] TX Flags field
From: Johannes Berg <johannes@sipsolutions.net>
To: Mathy Vanhoef <vanhoefm@gmail.com>, radiotap@netbsd.org
Date: Fri, 02 Oct 2020 11:11:36 +0200
In-Reply-To: <CAFXAJYxEfhmRgpntfSFz3afKdfhT5bAyQVWDqpsPgiD9-zjFuw@mail.gmail.com>
References: 
	<CAFXAJYxEfhmRgpntfSFz3afKdfhT5bAyQVWDqpsPgiD9-zjFuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

[...]

> If no one objects to this proposal in 7 days, I will resubmit it as a
> formal RFA, to allow eventual adoption.

Thank you!

About time we pick this up for real :-)

johannes

