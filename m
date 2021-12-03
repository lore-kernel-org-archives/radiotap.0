Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581ADC433F5
	for <radiotap@archiver.kernel.org>; Fri,  3 Dec 2021 08:36:26 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id D02CB84F18; Fri,  3 Dec 2021 08:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id A9DAE84F06
	for <radiotap@radiotap.org>; Fri,  3 Dec 2021 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id aaZmqAe5zmP9 for <radiotap@radiotap.org>;
	Fri,  3 Dec 2021 08:36:25 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 18A7784EC7
	for <radiotap@radiotap.org>; Fri,  3 Dec 2021 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=KNiMN6Ijwaa0+kyu6IdvFkfIgezVmMhcSGbIwTTdXRI=;
	t=1638520585; x=1639730185; b=AfQGq6hABWmWhhaOo43rHzlTwPgn2iJbjDl4RvwTAqzwwYt
	BrYdcfavL5q7KW3C9HDB6EYkuxL0oKDqrDFkRwnHWN388MDCnZfWMbKktwuVgNQWP5xWwXv2KQIt/
	bvtebhPCGyg9d0Oy2F4NCnuZ4pRRvrQ02j6F6vZZKmV+fvDQaI5UJdqMIt5fkC8g3CrZIQEzoIB2v
	AKX6oS4mua95EfANUE8c2YaTZKG74aGgQJzvX+CmbqPsSowz0Zqatet3yhF/VvjecG673M2t377WS
	3RjVRfvNxwgDwzczOTfpr9Ra7eL/0Nm15+dNOFzunoaAzhoyTgMCxU2HCcva6OZA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mt43L-006HEl-F9;
	Fri, 03 Dec 2021 09:36:23 +0100
Message-ID: <50e74646fd67dfaef574cfb928c98bd44a76d126.camel@sipsolutions.net>
Subject: Re: EHT definitions - U-SIG
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Cc: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Fri, 03 Dec 2021 09:36:22 +0100
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

On Fri, 2021-12-03 at 09:35 +0100, Johannes Berg wrote:
> 
> ---
> title: U-SIG
> categories: [suggested]
> ---
> Type
> : 32
> 

Oops, that should be 33 I guess, we really should get the S1G stuff in.

johannes
