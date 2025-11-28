Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF68D116EA
	for <radiotap@archiver.kernel.org>; Fri, 28 Nov 2025 08:11:34 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 9C1E48563E; Fri, 28 Nov 2025 08:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 7B49884EEC
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 08:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id gql1jLlS_OP0 for <radiotap@radiotap.org>;
	Fri, 28 Nov 2025 08:11:32 +0000 (UTC)
X-Greylist: delayed 1088 seconds by postgrey-1.37 at homeworld.NetBSD.org; Fri, 28 Nov 2025 08:11:32 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 591E684CD7
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+F3uYzjsOcsh9cCodW4xg3cX4gm8wA5SMgYJhT71kpg=;
	t=1764317492; x=1765527092; b=a7iLXDdF2dOe0cd/yaH6Jm5XKNTKUC+AlW8d0MvpVMnM3vx
	ckQgsRVRpLgkFSC4O9y62QFGCUTFqP1IjqUUWaueE8NBt0GHaaRDkjPNtT99+sz35MIWDqPnx3bKq
	buerOFX4rVWGwREaSObAA7vq2R9RY4XWdS2QsvBofzsj8VJNYN42tXQ/1ZdFDUhFHGJfM1fgs3jWD
	HtFs6g9o53+Jqst+plausWZtQnLfDJ/iGhMwFnegQdgbHOblB9V96QPYU4mtGARQ6RslEpt12eIiD
	GWK6B7iIl49KbP1dcFkiYUTzm+t3KxZmq30875oZ9sM6pNTaEYW7HpE9slpJ4+/Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vOtI9-00000002U8c-2HEq
	for radiotap@radiotap.org;
	Fri, 28 Nov 2025 08:53:21 +0100
Message-ID: <48fce6dd9c1d3bb3224348e5eb7ff64146753f3e.camel@sipsolutions.net>
Subject: Re: radiotap.org domain expiration
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Fri, 28 Nov 2025 08:53:20 +0100
In-Reply-To: <aSkBPqTF0KThhZFc@pobox.com>
References: <aSkBPqTF0KThhZFc@pobox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Thu, 2025-11-27 at 19:56 -0600, David Young wrote:
> FYI, the radiotap.org domain is expiring in a couple of weeks.  I don't
> want to pay for its renewal any more.  Can I hand it off to somebody
> else before it expires?

I can take, it at least for now, if nobody else has a better idea. I
think better contact me off-list to arrange a transfer in this case,
offhand I have no idea how that works :)

Longer term I can try to find a home for it in WFA maybe? But not sure
we can pull that off in "a couple of weeks" over Christmas. They do rely
on all of it for the tests/certification, after all.

johannes
