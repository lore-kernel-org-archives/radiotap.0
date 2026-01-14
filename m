Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF94D29FF8
	for <radiotap@archiver.kernel.org>; Wed, 14 Jan 2026 12:08:43 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id BF289855A6; Wed, 14 Jan 2026 12:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 955988559C
	for <radiotap@radiotap.org>; Wed, 14 Jan 2026 12:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id 8WiNevXEOz-h for <radiotap@radiotap.org>;
	Wed, 14 Jan 2026 12:08:41 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 9CC448558E
	for <radiotap@radiotap.org>; Wed, 14 Jan 2026 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Content-Type:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pL06EgnA/OHr7MOu/PeHUlrNyh+4WaAJE00K+0y7D7E=;
	t=1768392520; x=1769602120; b=a9xXuI7NViK3EGqAAT3+XlQSKzTU8WPY3gYdElY674pm8uk
	mBS8rfuYccI1rrFwt4kZ2FoTt6iEKdQQdSjOisZ8vO0iygqBehwgHtidbWdGvu+wTZWOiHED6jjRG
	gYHdouvnebHy/gmxNU12zVbWDCKYJw5MQICtDju6J8+eHDWa5+xg+vAVmXPlKn4GxyJj9I/KOn/2i
	fcKibdmlxSiNtaVhzL4IK+hUjdnIEP7y1+L2erkFCa9wx2dKJqhNi8xPR9bbvCDwBUavIPdXJc07W
	u3JNRBQynIKpqxqBbyZ/ygGDxRdPBMzsbukMbTnc2PVr9vr0S0pJ3XwdYatj/8rw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vfzfy-0000000BdFW-2Mw1
	for radiotap@radiotap.org;
	Wed, 14 Jan 2026 13:08:38 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Subject: [RFC v2 2/3] UHR-ELR: add a new field
Date: Wed, 14 Jan 2026 13:07:10 +0100
Message-ID: <20260114120835.238489-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114120835.238489-1-johannes@sipsolutions.net>
References: <20260114120835.238489-1-johannes@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

UHR adds a completely different PPDU type, UHR enhanced long range
(ELR) PPDUs. These are very much limited, with just two MCSes, one
spatial stream, 20 MHz only, etc. It's much easier to suppor them
in a separate, limited, UHR-ELR field than trying to put it into a
single field with other UHR PPDUs.

Add the UHR-ELR field for these PPDUs, other UHR PPDUs will be in
a different UHR field.
---
 fields/UHR-ELR.md | 78 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 fields/UHR-ELR.md

diff --git a/fields/UHR-ELR.md b/fields/UHR-ELR.md
new file mode 100644
index 000000000000..8b31b1d5c954
--- /dev/null
+++ b/fields/UHR-ELR.md
@@ -0,0 +1,78 @@
+---
+title: UHR-ELR
+categories: [suggested]
+type: 37
+---
+Type
+: 37 (not assigned yet)
+
+Structure
+: - u32 known
+  - u32 sig1, sig2, mark
+
+Required Alignment
+: 4
+
+Unit(s)
+: none
+
+This field represents (data taken from) the ELR preamble for a UHR
+ELR (enhanced long range) PPDU. Such PPDUs are always transmitted
+with a single spatial stream and on a 20 MHz channel.
+
+## known
+
+| **bits**         | **meaning** |
+| **`0x00000001`** | ELR Version Identifier Known |
+| **`0x00000002`** | UL/DL Known |
+| **`0x00000004`** | MCS Known |
+| **`0x00000008`** | Coding Known |
+| **`0x00000010`** | Length Known |
+| **`0x00000020`** | LDPC Extra OFDM Symbol Known |
+| **`0x00000040`** | ELR-SIG-1 CRC Known |
+| **`0x00000080`** | ELR-SIG-1 Tail Known |
+| **`0x00000100`** | STA-ID Known |
+| **`0x00000200`** | Disregard Known |
+| **`0x00000400`** | ELR-SIG-2 CRC Known |
+| **`0x00000800`** | ELR-SIG-2 Tail Known |
+| **`0x00001000`** | ELR-SIG-1 CRC Checked |
+| **`0x00002000`** | ELR-SIG-2 CRC Checked |
+| **`0x0000C000`** | (reserved) |
+| **`0x00010000`** | ELR-MARK BSS Color Known |
+| **`0xFFFE0000`** | (reserved) |
+
+## sig1
+
+Represents data from ELR-SIG-1, subject to availability (`known` flags)
+
+| **bits**         | **meaning** |
+| **`0x00000001`** | ELR Version Identifier |
+| **`0x00000002`** | UL/DL |
+| **`0x00000004`** | MCS |
+| **`0x00000008`** | Coding |
+| **`0x00001FF0`** | Length |
+| **`0x00002000`** | LDPC Extra OFDM Symbol |
+| **`0x0003C000`** | CRC |
+| **`0x00FC0000`** | Tail |
+| **`0x7F000000`** | (reserved) |
+| **`0x80000000`** | CRC valid (if checked) |
+
+## sig2
+
+Represents data from ELR-SIG-2, subject to availability (`known` flags)
+
+| **bits**         | **meaning** |
+| **`0x000007FF`** | STA-ID |
+| **`0x00003800`** | Disregard |
+| **`0x0003C000`** | CRC |
+| **`0x00FC0000`** | Tail |
+| **`0x7F000000`** | (reserved) |
+| **`0x80000000`** | CRC valid (if checked) |
+
+## mark
+
+Represents data from ELR-MARK, subject to availability (`known` flags)
+
+| **bits**         | **meaning** |
+| **`0x0000003F`** | BSS Color |
+| **`0xFFFFFFC0`** | (reserved) |
-- 
2.52.0

