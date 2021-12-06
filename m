Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560CDC433EF
	for <radiotap@archiver.kernel.org>; Mon,  6 Dec 2021 20:10:10 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 5AA2484D60; Mon,  6 Dec 2021 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 3910884D41
	for <radiotap@radiotap.org>; Mon,  6 Dec 2021 20:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id y62y3CTJW4Ta for <radiotap@radiotap.org>;
	Mon,  6 Dec 2021 20:10:08 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 72B0B84D31
	for <radiotap@radiotap.org>; Mon,  6 Dec 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=EaQINWGWkS/7na++CLOWqLtbParwnk+rl2nUvaEFqC0=;
	t=1638821408; x=1640031008; b=F5QnTMnM/892bNzgzMEi/RD1e/v6+wJ7COLqA93FAke/SrB
	qtnXNNVDZ3Tf6ILutcD6wLGKta9iN7tzUSxI27dNaUcwWCBpZQ0fHlWkoJW4I9nJPuGkFJaP6Awp9
	/VyCTYjNGVgQKQjHtVP+2AkUF9hHqStmrI+Lk3WUvBxd0Dv40YxjdZopQXMHKqUw+nDGQc0xj8jx+
	+98SdpmLv0gvMG4+BlycyGiKUz9gMa/Ej2v0Sil/MtpbChDQrC3u9OURMc29KB1kePLvT8nq/FXIT
	/Ck6PXPEjil4z/druPCrluti7Utd6G6ZbPYMnRww3mmyHvs2VB8vv4BcRwmrFqeg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1muKJJ-007rXO-HI;
	Mon, 06 Dec 2021 21:10:05 +0100
Message-ID: <2f1e81e6f5771793f44940dea500357870035b8d.camel@sipsolutions.net>
Subject: Re: A modified, and maybe final, proposal for an S1G header for
 RadioTap
From: Johannes Berg <johannes@sipsolutions.net>
To: Richard Sharpe <realrichardsharpe@gmail.com>, radiotap@radiotap.org, Ray
 Wang <rwang@wi-fi.org>, Aaron Lee <jehun.lee@newracom.com>, Tasheng Lin
 <tlin@wi-fi.org>
Date: Mon, 06 Dec 2021 21:10:04 +0100
In-Reply-To: <CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
References: 
	<CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Sun, 2019-04-14 at 08:57 -0700, Richard Sharpe wrote:
> Hi folks,
> 
> Here is an updated proposal for this header.
> 

I think we should just adopt this. Years have literally passed, and I'm
pretty sure it's actually used as-is in the wild.

Any objections? If not I'll go add it to the spec soon.

johannes
