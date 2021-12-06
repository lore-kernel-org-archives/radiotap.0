Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95947C433EF
	for <radiotap@archiver.kernel.org>; Mon,  6 Dec 2021 15:52:53 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id C930684D41; Mon,  6 Dec 2021 15:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id A7A3E84D3F
	for <radiotap@radiotap.org>; Mon,  6 Dec 2021 15:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id CuT0BEq43vKh for <radiotap@radiotap.org>;
	Mon,  6 Dec 2021 15:52:51 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 30F6284CE3
	for <radiotap@radiotap.org>; Mon,  6 Dec 2021 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=vDkkijJcleK/JrJNxE83uwhsm6QXnGTh99rzz0O4HU8=;
	t=1638805971; x=1640015571; b=HxjB543z6Aix7V5RCuKUgOYOxS535UnvGMu1incLXo6TzpT
	QqOOZP8VAVJlKW3mtljGp25Kb2kpP6z3SrElG8GVgDmkVuu/quzCaxbdwlV2O6p9sBTyTsG7cyEMH
	IwzEjDCnwC2aZlMrft6wwszWN9XEePZ/qrrIsDOmJ90r1Et3XeMUc6c4inrBfqWmzNJ1JB7WaDYnA
	otyWFfq5nIwF7XWqC2i1a5n9QMyfwj9taJmmo1HoYYWcCuSG/HWoF9GMPQ5Qz0xeGGjkNyV7N8bLJ
	xvw3iCyFnwriWRhM/4Pstka9Vrt/ybdW9EqxbkvSszgA3TnUD4JYfIZw4zAjtdgg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1muGIJ-007lMT-Va;
	Mon, 06 Dec 2021 16:52:48 +0100
Message-ID: <c03df0feebbc88cb87f6aca1b5f039efbe2d59d0.camel@sipsolutions.net>
Subject: Re: EHT definitions - U-SIG
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Cc: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Mon, 06 Dec 2021 16:52:47 +0100
In-Reply-To: <81f624878a2191586e72543a5b5dabc95d5673a6.camel@sipsolutions.net>
References: 
	<81f624878a2191586e72543a5b5dabc95d5673a6.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi,

Since it's all hard to read in plain markdown, I've uploaded it to the
suggested fields:

https://www.radiotap.org/fields/U-SIG

https://www.radiotap.org/fields/EHT

The EHT one got pretty big, but OTOH since we have TLVs now we can make
it variable size, and don't need the split like we had with HE where we
did HE, HE-MU and HE-MU-other-user, which is nice.

Comments welcome. I'll probably (have to) continue to tweak it as our
implementation progresses, but all the bigger open questions I had are
resolved, and it looks like I can put everything our sniffer will report
into it.

The only thing I know of right now that I'm not entirely sure about is
the Content Channel Index thing - i.e. "which preamble of the
transmission did I capture". Our DSP appears to provide this in trigger-
based RU allocation format, and I have to check how to use that
properly.

johannes
