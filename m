Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1FFC25B75
	for <radiotap@archiver.kernel.org>; Wed, 15 May 2024 09:37:49 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 5504584EF0; Wed, 15 May 2024 09:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 33F9184EDA
	for <radiotap@radiotap.org>; Wed, 15 May 2024 09:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 2e6dOHANsUvP for <radiotap@radiotap.org>;
	Wed, 15 May 2024 09:37:48 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 7553484D35
	for <radiotap@radiotap.org>; Wed, 15 May 2024 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=bFE6ZUZ8vwf1azRMiNKMOnSud9/8lciFqxqpClZJF5A=; t=1715765868; x=1716975468; 
	b=Ut0CBOp3rQlDrHrzsaUkmO22CcN+v3b1flFZN4UQdPD5s/lYHDPXXblA9m+jAANYHQa8nHcQMd3
	LuWySrNVoBOjSSCd6/1RkCOIFxZ31nKJjXtX8RBPuNA0U0pKHY8rBtXll6uVeL0evCUTJSqglk0aW
	CYj/Lk/MfYcTKM0QKdyrVil5nmyWciTrZ7wU70l0+Yv12Ulb0yLwH+t/YjA/Ewt45fPIdSMoTmWAr
	B5+0sv0IVTWDe3A63/O7PebDsQ2i/u683wA/Pom/40IBYam1qoJ8RzYpg86czW6FyRWeWuSlsb/IV
	6sJmMJvNRD5q8+MX8FTfosFeU6hmXhWnzLDQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1s7B50-00000006DNg-11nS
	for radiotap@radiotap.org;
	Wed, 15 May 2024 11:37:46 +0200
Message-ID: <53383c98330768858ffdaab344fb9495eeede093.camel@sipsolutions.net>
Subject: S1G field
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Wed, 15 May 2024 11:37:45 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi all,

So I've been doing some other work on radiotap (EHT, U-SIG, cleanups on
the site) and also added S1G - can someone double-check? I took the
version from Richard, and updated it a bit with what wireshark parses
now.

johannes
