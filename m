Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E87CCA470
	for <radiotap@archiver.kernel.org>; Thu,  9 Oct 2025 09:11:30 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id A942E85A8F; Thu,  9 Oct 2025 09:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 840A685832
	for <radiotap@netbsd.org>; Thu,  9 Oct 2025 09:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id maTJmIkZhqiw for <radiotap@netbsd.org>;
	Thu,  9 Oct 2025 09:11:18 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 954B08575E
	for <radiotap@netbsd.org>; Thu,  9 Oct 2025 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=Xb6qox19T7JCTNkwt6LhKrILji+sZbZEuHt6sUuNnvw=; t=1760001077; x=1761210677; 
	b=wrHmgiLHdRzwLRCDG3EE0jpQLkJuuwiQp1k10G2QpcGqUOjfFH2O5RK9+7NOHlne24YF3Gdd7cw
	DYf+uFqgIS/yFeoZjGzHLRU01csw2OTovq8PcWeZAOuKAFVMzhH/404Jwli614nEyerYPy4ZqvL9i
	5fs+wPv0eb+ShjubX3LVmg7lH564AISA47XOI6REkyO+Ml9atmWS/lp53RXMf8rft0YxJEYsvtN22
	onVEEXp0QJQa00Ododbf6WaGEU1H3vIc/CPD7vMeO7sqK8KxBP8kHYz7aGLuW0sTmsJ40aeeFccAY
	7Wp2bGz6bejpQiAYtRROxctd1FLRrRTkZUng==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v6mg5-00000001vZt-3agr
	for radiotap@netbsd.org;
	Thu, 09 Oct 2025 11:11:14 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@netbsd.org
Subject: [RFC PATCH 0/2] UHR fields
Date: Thu,  9 Oct 2025 11:03:16 +0200
Message-ID: <20251009091110.10697-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi,

Over the last couple of days I've been working to define fields
for UHR, since we'll need them. I have neither a sniffer nor a
wireshark implementation yet, but that'll come in time. I'm not
sure if I'll work on wireshark myself though.

I've published these to my own forked github for easier review:

https://jmberg.github.io/radiotap.github.io/fields/UHR-ELR.html
https://jmberg.github.io/radiotap.github.io/fields/UHR.html

(and may continue to update those if I find issues)

I decided that ELR was sufficiently different that it was better
to have a separate field for it, since the MCS space is totally
different (just 0 and 1) etc.

The UHR field is copied from EHT with adjustments, so there may
be issues due to that, I'll have to review it again carefully
wrt. that, but it does inherit a lot from EHT. The concepts are
similar.

Any thoughts/comments welcome.

johannes

