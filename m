Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F85C433EF
	for <radiotap@archiver.kernel.org>; Fri,  3 Dec 2021 08:35:33 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id CCCEB84ECD; Fri,  3 Dec 2021 08:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id AA01984EC7
	for <radiotap@radiotap.org>; Fri,  3 Dec 2021 08:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id ezQh3ptIvYI1 for <radiotap@radiotap.org>;
	Fri,  3 Dec 2021 08:35:30 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id F12E484CBC
	for <radiotap@radiotap.org>; Fri,  3 Dec 2021 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=mw1SrzZPFtSnv3BzWAFRYhfWcCLwaWRIdT/ul31HSWg=; t=1638520530; x=1639730130; 
	b=H91if/JDC1JMccN4Giol4P2JtOb9Jq5lgXxHVG0BmJ2B9ZIxW4ilJFcxpaGIPAqusetMOfSzNa7
	TRWKp0wbXfTJOcJcEnYyt4UnRjqUC9csKnxlLvv3myU/y29i3AwLVdmkdNMhswrgPqnc2I059b1Ha
	kC8Sl/Dg3S6Wqc6b8b9059SeGfOfyDXaGunikHg2nJuTXdacWvbph62zNTPdNcpWq7hAISBgMuogH
	wcybbWberfHj25GH9fBOBGeOKG/0URAWS2WH7Ug5N47l0p8VdPwIbRw2Y76cfxOXEN/terS0JKbDR
	1LfrXMjh2JqjiQlDETYFwepHA3F7Hy339hhg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mt42Q-006HCz-TG;
	Fri, 03 Dec 2021 09:35:27 +0100
Message-ID: <81f624878a2191586e72543a5b5dabc95d5673a6.camel@sipsolutions.net>
Subject: EHT definitions - U-SIG
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Cc: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Fri, 03 Dec 2021 09:35:26 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi,

I'm slowly digging through what's necessary for EHT, and so far I'm only
really happy with what I have for the easy part (U-SIG), so sending that
out here.

Note that the alignment of 4 bytes is harmless because this is going
into a TLV field that anyway requires 4-byte alignment in the first
place.

I am wondering if we should have two additional bits there - "CRC
checked" and "CRC bad", as there will be cases where we might be able to
provide parts of the U-SIG but not the entire CRC for offline checking,
and if the PLCP is indicated as bad
(https://www.radiotap.org/fields/RX%20flags.html) then I guess bad U-SIG
CRC would be indicated as that, and then having an extra two bits here
would let you figure out if it was bad in the U-SIG? But OTOH I'm not
sure it's really possible to provide the information anyway if the
checksums are bad somewhere along the line, so I haven't included that.

Note also that the U-SIG is meant to be forward-compatible in a sense,
so only some fields are defined to be fixed. Hence the inclusion of the
mask for all bits.

Comments welcome!

johannes

---
title: U-SIG
categories: [suggested]
---
Type
: 32

Structure
  - u32 common
  - u32 value, mask

Required Alignment
: 4

Unit(s)
: none

This field indicates - if known - the contents of the U-SIG.

Note that the common/value/mask fields are ordered in this way
so if they're all known, the U-SIG bits are all contiguous in
memory in the same way as over the air from bit 12 of the common
field to the end of the value field.

## common

| **`0x00000001`** | PHY version identifier known |
| **`0x00000002`** | BW known |
| **`0x00000004`** | UL/DL known |
| **`0x00000008`** | BSS Color known |
| **`0x00000010`** | TXOP known |
| **`0x00000fe0`** | (reserved) |
| **`0x00007000`** | PHY version identifier |
| **`0x00038000`** | BW |
| **`0x00040000`** | UL/DL |
| **`0x01f80000`** | BSS Color |
| **`0xfe000000`** | TXOP |

## value / mask

Contains a known mask and value for the remaining U-SIG bits
that can only be interpreted depending on the PHY version.

The bits are in the on-air order, i.e. U-SIG-1 `B20-25` followed
by U-SIG-2 `B0-25`. Thus, U-SIG-1 `B20-25` are in `mask` and
`value` bits `0x0000003f`.

Dissectors should show these per spec, in a PHY version specific
namespace (e.g. "U-SIG::EHT::PPDU-Type-And-Compression-Mode").

For the only currently defined version (PHY Version identifier 0
for EHT), the bits are shown in the following tables:

### EHT MU PPDU U-SIG contents

An EHT PPDU is an EHT MU PPDU if
* the UL/DL field is set to 0 and the PPDU Type And Compression Mode field is set to 0, 1 or 2;
* the UL/DL field is set to 1 and the PPDU Type And Compression Mode field is set to 1.

| **bits**         | **U-SIG reference** | **Content** |
| **`0x0000001f`** | `U-SIG-1 B20-B24`   | Disregard (all ones) |
| **`0x00000020`** | `U-SIG-1 B25`       | Validate (must be 1) |
| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
| **`0x00000100`** | `U-SIG-2 B2`        | Validate (must be 1) |
| **`0x00003e00`** | `U-SIG-2 B3-B7`     | Punctured Channel Information |
| **`0x00004000`** | `U-SIG-2 B8`        | Validate (must be 1) |
| **`0x00018000`** | `U-SIG-2 B9-B10`    | EHT-SIG MCS |
| **`0x003e0000`** | `U-SIG-2 B11-B15`   | Number Of EHT-SIG Symbols |
| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` to `U-SIG-2 B15`) |
| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |

### EHT TB PPDU U-SIG contents

An EHT PPDU is a EHT TB PPDU if
* the UL/DL field is set to 1 and the PPDU Type And Compression Mode field is set to 0.

| **bits**         | **U-SIG reference** | **Content** |
| **`0x0000003f`** | `U-SIG-1 B20-B25`   | Disregard (all ones) |
| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
| **`0x00000100`** | `U-SIG-2 B2`        | Validate (must be 1) |
| **`0x00001e00`** | `U-SIG-2 B3-B6`     | Spatial Reuse 1 |
| **`0x0001e000`** | `U-SIG-2 B7-B10`    | Spatial Reuse 2 |
| **`0x003e0000`** | `U-SIG-2 B11-B15`   | Disregard (...) |
| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` to `U-SIG-2 B15`) |
| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |

