Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8116FCCA470
	for <radiotap@archiver.kernel.org>; Wed,  8 Oct 2025 15:05:19 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 92E5385DB8; Wed,  8 Oct 2025 15:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 735F585D82
	for <radiotap@netbsd.org>; Wed,  8 Oct 2025 15:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id dARXkYeSXMfe for <radiotap@netbsd.org>;
	Wed,  8 Oct 2025 15:05:17 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 6465D8558A
	for <radiotap@netbsd.org>; Wed,  8 Oct 2025 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=phdM3vH64/gi9Y/O9yxh1Ix+OmepVJO1t+VjXlJYF4U=; t=1759935917; x=1761145517; 
	b=e/TEiL4xzxe5egvCIfKCjG50VjNy7Pbw46EFNiMxgv9nCJEU0AB2CfZp4OtibplNAfq9QLArUeQ
	PmhTR2BRCrrNEYUKpqCaSQQKqUqNgloCc0za6MBAmyhnbPQ7iB5qXUiPBXisswwJ3M8eHohezetvy
	4PA9D6VfOVlv8ertVay/f7wARMbjbBdoD6cVs1IrS17XX730WU5o18BkeI5Jt6gqE2yEC/s6ezCL3
	JObbLy6JYx5noY+/3cRFA3yrewn65/EWAah4t7pOV06JUICOo9uHzQ9Vw65xebwGjLT2WozWZpjiA
	phIG8B5NHn1Xk6VdLVw9YkgwcIY32ksQU9Cw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v6Vj8-00000000ZNO-43pK
	for radiotap@netbsd.org;
	Wed, 08 Oct 2025 17:05:15 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@netbsd.org
Subject: [PATCH] EHT: list a reserved bit
Date: Wed,  8 Oct 2025 17:05:13 +0200
Message-ID: <20251008150513.25206-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

This bit was previously not listed at all, correctly list
it as reserved.
---
 fields/EHT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fields/EHT.md b/fields/EHT.md
index 01cbf159d7a9..e24a69c7c6f0 100644
--- a/fields/EHT.md
+++ b/fields/EHT.md
@@ -86,7 +86,7 @@ Some values here could also appear for non-OFDMA PPDUs.
 | **`0x00001fe0`** | RU/MRU Index (see IEEE 802.11be Draft 1.3 section 36.3.2 "Subcarrier and resource allocation") |
 | **`0x003fe000`** | RU Allocation 1 |
 | **`0x00400000`** | RU Allocation 1 known |
-| **`0x3f000000`** | (reserved) |
+| **`0x3f800000`** | (reserved) |
 | **`0xc0000000`** | Primary 80 MHz Channel Position (0: lowest, 3: highest in frequency)|
 
 Note: The RU/MRU Size and RU/MRU Index are calculated fields, ideally the
-- 
2.51.0

