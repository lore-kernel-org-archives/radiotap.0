Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C9FD116E2
	for <radiotap@archiver.kernel.org>; Fri, 28 Nov 2025 16:41:31 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 2D56A85621; Fri, 28 Nov 2025 16:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 0C69484DF8
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 16:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id DTWeTfgVSW1f for <radiotap@radiotap.org>;
	Fri, 28 Nov 2025 16:41:30 +0000 (UTC)
X-Greylist: delayed 2396 seconds by postgrey-1.37 at homeworld.NetBSD.org; Fri, 28 Nov 2025 16:41:29 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id E7C2184DDB
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=K8kU2PG7Eu2SibxHVrzFzrjHV3sfddJmdenNyj7Oq9g=; t=1764348090; x=1765557690; 
	b=IZRm5YNZOofWqkkAUG8XfAQ2EOTuWoIisUJ2RfKct2Qq/JMqaNAFw0bVv9or6/6q0Eg0TwACJ4H
	13bt9J9lz+vOXdMC3prxgNRttIuC/oKOX1527a9ZG5uJFVB1wxkaalv63guLdmSh0FwlAkpHIC0w6
	3x6ai0H2AADjAtl0JbOFm0lFHC+Wq6KmRnDa9vYA3YNXpufto7/3sIgn90dTcZDt1ncSTJCvZjNVq
	FGtWPWN2uAgTd4CW94eLc4lBxXfRMY8Ndo4engrYgFjXH4T7SjxWS0gB/I2TiDr5eTCtwZ5F/LjSi
	+XkUy4MMHMmt5H7HK0dyaCXymRPVcuZd2PrQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1vP0uX-00000003Jmr-32qK;
	Fri, 28 Nov 2025 17:01:30 +0100
From: Benjamin Berg <benjamin@sipsolutions.net>
To: radiotap@radiotap.org
Cc: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCH 0/2] Add new fields relevant for bandwidth signalling
Date: Fri, 28 Nov 2025 17:00:16 +0100
Message-ID: <20251128160018.300334-1-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi all,

These new fields can be relevant when inspecting whether bandwidth
signalling is handled correctly. For this, the signalling information
itself can be reported as well as information about the observed signal
to determine whether the frame was duplicated over multiple channels.

We will post patches for iwlwifi that use these new fields.
Corresponding wireshark dissectors should also be submitted in due
course.

Benjamin

Benjamin Berg (2):
  add new observed energy field
  add a new field for SERVICE field information

 fields/SERVICE field.md   | 42 +++++++++++++++++++++++++++++++++++++++
 fields/observed energy.md | 27 +++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 fields/SERVICE field.md
 create mode 100644 fields/observed energy.md

-- 
2.51.1

