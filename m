Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F38FCCA470
	for <radiotap@archiver.kernel.org>; Tue,  7 Oct 2025 11:45:18 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 4E07585A85; Tue,  7 Oct 2025 11:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 2B943857E2
	for <radiotap@netbsd.org>; Tue,  7 Oct 2025 11:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id KpbOJ0KyeDea for <radiotap@netbsd.org>;
	Tue,  7 Oct 2025 11:45:16 +0000 (UTC)
X-Greylist: delayed 1452 seconds by postgrey-1.37 at homeworld.NetBSD.org; Tue, 07 Oct 2025 11:45:16 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 07BAA84CD8
	for <radiotap@netbsd.org>; Tue,  7 Oct 2025 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=Qxe4gwYnfifrwPfr2Ya3wgbW9B+oojN6XIy21SxpiXE=; t=1759837516; x=1761047116; 
	b=q0MieLpB1ml33KVsLeVG0PJxH/F1WTbQDH444UodqJj1TCPA85PEui/OB8kOQaFgH+tr3O+6sja
	rw1Y2SzqdqZC335MJ69bzF+cXmXAS0OJtwUXWZLR09ObJLiMwieDSKh7jvu0S1MaH3Vkab2l+4fS9
	qRwirPzA5K8isxh5OsGOuMUhxWFcRFBlWFkHj5gk9ZRjQBPdUUh9FLUtOb3nao51QPdmL1OMIW/eZ
	g/Glf8XVHDjyNZ6ujCNWyhH5v1c9mvZ6EXIDrqI264R+9LLD05VZVSG0+08nhZeJVwbLk70IQHsLB
	4YzNzh3X2ptyeMcy/h0HZYD/PvwwMMDxkWCw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v65kZ-0000000GKPn-1w5a
	for radiotap@netbsd.org;
	Tue, 07 Oct 2025 13:21:00 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@netbsd.org
Subject: [PATCH] U-SIG: add UHR descriptions
Date: Tue,  7 Oct 2025 13:20:57 +0200
Message-ID: <20251007112057.389005-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Add descriptions of the UHR U-SIG formats. This is not
normative for radiotap since we just follow IEEE 802.11.
---
 fields/U-SIG.md | 54 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 3 deletions(-)

diff --git a/fields/U-SIG.md b/fields/U-SIG.md
index a804e6d66e29..55d960670c74 100644
--- a/fields/U-SIG.md
+++ b/fields/U-SIG.md
@@ -56,8 +56,8 @@ by U-SIG-2 `B0-25`. Thus, U-SIG-1 `B20-25` are in `mask` and
 Dissectors should show these per spec, in a PHY version specific
 namespace (e.g. "U-SIG::EHT::PPDU-Type-And-Compression-Mode").
 
-For the only currently defined version (PHY Version identifier 0
-for EHT), the bits are shown in the following tables:
+For the currently defined versions (PHY Version identifier 0
+for EHT, 1 for UHR), the bits are shown in the following tables:
 
 ### EHT MU PPDU U-SIG contents
 
@@ -79,7 +79,7 @@ An EHT PPDU is an EHT MU PPDU if
 
 ### EHT TB PPDU U-SIG contents
 
-An EHT PPDU is a EHT TB PPDU if
+An EHT PPDU is an EHT TB PPDU if
 * the UL/DL field is set to 1 and the PPDU Type And Compression Mode field is set to 0.
 
 | **bits**         | **U-SIG reference** | **Content** |
@@ -91,3 +91,51 @@ An EHT PPDU is a EHT TB PPDU if
 | **`0x003e0000`** | `U-SIG-2 B11-B15`   | Disregard (...) |
 | **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` to `U-SIG-2 B15`) |
 | **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |
+
+### UHR MU PPDU U-SIG contents
+
+A UHR PPDU is a UHR MU PPDU if
+* the UL/DL field is set to 0 and the PPDU Type And Compression Mode field is set to 0, 1 or 2;
+* the UL/DL field is set to 1 and the PPDU Type And Compression Mode field is set to 1.
+
+| **bits**         | **U-SIG reference** | **Content** |
+| **`0x0000003f`** | `U-SIG-1 B20-B25`   | BSS Color 2 (under conditions, see spec) |
+| **`0x0000001f`** | `U-SIG-1 B20-B24`   | Disregard (if not BSS Color 2) |
+| **`0x00000020`** | `U-SIG-1 B25`       | Validate (must be 1, if not BSS Color 2) |
+| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
+| **`0x00000100`** | `U-SIG-2 B2`        | Co-BF/Co-SR Indication |
+| **`0x00003e00`** | `U-SIG-2 B3-B7`     | Punctured Channel Information |
+| **`0x00004000`** | `U-SIG-2 B8`        | Validate (must be 1) |
+| **`0x00018000`** | `U-SIG-2 B9-B10`    | UHR-SIG MCS |
+| **`0x003e0000`** | `U-SIG-2 B11-B15`   | Number Of UHR-SIG Symbols |
+| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` to `U-SIG-2 B15`) |
+| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |
+
+### UHR TB PPDU U-SIG contents
+
+A UHR PPDU is a UHR TB PPDU if
+* the UL/DL field is set to 1 and the PPDU Type And Compression Mode field is set to 0.
+
+| **bits**         | **U-SIG reference** | **Content** |
+| **`0x0000003f`** | `U-SIG-1 B20-B25`   | Disregard (all ones) |
+| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
+| **`0x00000100`** | `U-SIG-2 B2`        | Validate (must be 1) |
+| **`0x00001e00`** | `U-SIG-2 B3-B6`     | Spatial Reuse 1 |
+| **`0x0001e000`** | `U-SIG-2 B7-B10`    | Spatial Reuse 2 |
+| **`0x003e0000`** | `U-SIG-2 B11-B15`   | Disregard (...) |
+| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` to `U-SIG-2 B15`) |
+| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |
+
+### UHR ELR PPDU U-SIG contents
+
+A UHR PPDU is a UHR ELR PPDU if
+* the PPDU Type And Compression Mode field is set to 3.
+
+| **bits**         | **U-SIG reference** | **Content** |
+| **`0x0000001f`** | `U-SIG-1 B20-B24`   | Disregard |
+| **`0x00000020`** | `U-SIG-1 B25`       | Validate (must be 1) |
+| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
+| **`0x0007ff00`** | `U-SIG-2 B2-B12`    | STA-ID |
+| **`0x00380000`** | `U-SIG-2 B13-B15`   | ELR Validate |
+| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` to `U-SIG-2 B15`) |
+| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |
-- 
2.51.0

