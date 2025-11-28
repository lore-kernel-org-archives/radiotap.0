Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3CAD116F1
	for <radiotap@archiver.kernel.org>; Fri, 28 Nov 2025 16:41:38 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 546ED85762; Fri, 28 Nov 2025 16:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 31F328575D
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 16:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 8Hcmudl-_lSM for <radiotap@radiotap.org>;
	Fri, 28 Nov 2025 16:41:36 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 5061785673
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bSsM2LuLFPllah/GofFd7/fxGiqHhox+OV7ThLxioh0=;
	t=1764348096; x=1765557696; b=ciBGXAeMTOuOj5qtIGvbxdSPfgA4NEXIrH6161Yg57hV8Ar
	tt7UFdlPPY+pEiPawmhZeMUZJb7FRUPF0JWZb/f8jPhXWu3vPPrX5JmWjuMfzyANRPl1ykEUO7W9w
	V7UVZXibsgHldwALS6jMkPUc87SDXf6MbE2gxjA1bkUrN9cM+C+lPEs1tAkza0ozApNzT8J1mXT07
	MuPacvWqczLpzkz2K1V1c2LieMCpXVUZP7uWZL3lMvd3y+y2yzvKzX8A5aEMhGmamgvSlFiArjqT0
	lOY6WsMbGuJvub9JUsO1VkoWLKUD4BO6sGrCSpTNHdv+oH2BNV+rRZhCRluTzOlA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1vP0ub-00000003Jmr-0psB;
	Fri, 28 Nov 2025 17:01:33 +0100
From: Benjamin Berg <benjamin@sipsolutions.net>
To: radiotap@radiotap.org
Cc: Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH 2/2] add a new field for SERVICE field information
Date: Fri, 28 Nov 2025 17:00:18 +0100
Message-ID: <20251128160018.300334-3-benjamin@sipsolutions.net>
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

This can be used to report information used for bandwidth signalling.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
---
 fields/SERVICE field.md | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 fields/SERVICE field.md

diff --git a/fields/SERVICE field.md b/fields/SERVICE field.md
new file mode 100644
index 0000000..ff9919b
--- /dev/null
+++ b/fields/SERVICE field.md	
@@ -0,0 +1,42 @@
+---
+title: SERVICE field
+categories: [defined]
+type: 36
+---
+Type
+: 36
+
+Structure
+: u8 known
+: u8 flags
+: u16 service\_field
+: u8 ch\_bw\_in\_non\_ht
+
+Unit(s)
+: none
+
+For some frames, the scrambler and SERVICE field bits may be used to encode
+further information about the frame. This field exists to report related
+information when available.
+
+The `known` field indicates which information is known:
+
+| **flag** | **definition** | **notes** |
+| 0x01 | service field known | The service field bits in `service_field` are valid. |
+| 0x02 | scrambler init known | The lower bits in `service_field` represent the scrambler initialization value. |
+| 0x03 | dynamic BW in non-HT known | In `ch_bw_in_non_ht` part of the field. |
+
+The `flags` field is any combination of the following:
+
+| **flag** | **definition** | **notes** |
+| 0x01 | dynamic BW in non-HT | Set if the dynamic BW in non-HT bit was set in the scrambler bits |
+| 0x02 | 11bit scrambler init | Set for frames that have 11 bit of scrambler initialization (e.g. EHT) |
+
+The `service_field` may contain both the scrambler initialization and the SERVICE field value
+that was received depending on the flags in `known`. The lower bits are used to store the
+scrambler initialization as the SERVICE field must be all zero there.
+The scrambler initialization may be 7 or 11 bit long depending on the PHY type of the frame.
+If it is 11 bit, then the corresponding bit is set in `flags`.
+
+The `ch_bw_in_non_ht` field contains the value of `CH_BANDWIDTH_IN_NON_HT` as defined in
+IEEE802.11REVmf-D1.0 Table 17-8 - "TXVECTOR parameter `CH_BANDWIDTH_IN_NON_HT` values".
-- 
2.51.1

