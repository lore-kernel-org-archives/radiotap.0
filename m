Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BA8D116F1
	for <radiotap@archiver.kernel.org>; Fri, 28 Nov 2025 16:41:35 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 0641484DF8; Fri, 28 Nov 2025 16:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id D517B84DF8
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 16:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id hztCTxTYyQqD for <radiotap@radiotap.org>;
	Fri, 28 Nov 2025 16:41:33 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 0B0058574B
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 16:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8yTxqx+p3KraiZhYkxVYG/ocCdYT3S6FTV4KLIXQR6I=;
	t=1764348093; x=1765557693; b=mFOYVCD7BeUnvxkODvsp8n5thWPwTmt2XM/WVT7XW3Cy6oi
	Wsolav4L4iYCgPvcgV8PXfZGBS3yx/gi1ZEFOvEABRkLPlNR/9scxWRKErjBEvESURVsTym40OBuh
	byCoVvd9JtorHd5B7vWDZe8uPNAGgDfqIMezmLQ6oJawT+BJ6vQ/4Ts4vafXqntatlsHbJ5jZAslD
	k4U4NqIKz4jXhCZ1UePHIHJjASm9SMCrTP4n+bZRSEHZf8zGHkzc0+91Tbb8WgsPklay92BecrNtT
	HfDuWvaiIvZt8aT20KGjI8+iLU/r4OXVL9DPFdeMY9Y1t6ywbzAsgjT5t0HgJoxQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1vP0ua-00000003Jmr-12QO;
	Fri, 28 Nov 2025 17:01:32 +0100
From: Benjamin Berg <benjamin@sipsolutions.net>
To: radiotap@radiotap.org
Cc: Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH 1/2] add new observed energy field
Date: Fri, 28 Nov 2025 17:00:17 +0100
Message-ID: <20251128160018.300334-2-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128160018.300334-1-benjamin@sipsolutions.net>
References: <20251128160018.300334-1-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

From: Benjamin Berg <benjamin.berg@intel.com>

This adds a new "observed energy" field of type 35 that can be used to
report information about signal duplication.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
---
 fields/observed energy.md | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 fields/observed energy.md

diff --git a/fields/observed energy.md b/fields/observed energy.md
new file mode 100644
index 0000000..df8d48b
--- /dev/null
+++ b/fields/observed energy.md	
@@ -0,0 +1,27 @@
+---
+title: Observed energy
+categories: [defined]
+type: 35
+---
+Type
+: 35
+
+Structure
+: u16 known
+: u16 bw
+
+Unit(s)
+: none
+
+This field contains information related to the energy that was observed and
+likely belong to the same transmission. This may be larger than the required
+signal bandwidth if the transmission was duplicated over multiple channels.
+
+The `known` field indicates which information is known:
+
+| **flag** | **definition** | **notes** |
+| 0x0001 | observed energy bandwidth known | In `bw` part of the field |
+
+The `bw` field encodes the observed bandwidth in MHz. The reported bandwidth is
+sufficient to contain all subchannels where energy likely belonging to the
+same transmission was observed.
-- 
2.51.1

