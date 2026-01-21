Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F12C44510
	for <radiotap@archiver.kernel.org>; Wed, 21 Jan 2026 11:31:28 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id C6EC98560D; Wed, 21 Jan 2026 11:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id A5BB98560C
	for <radiotap@radiotap.org>; Wed, 21 Jan 2026 11:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id wXAXpH1YW6qq for <radiotap@radiotap.org>;
	Wed, 21 Jan 2026 11:31:26 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 57EF484D96
	for <radiotap@radiotap.org>; Wed, 21 Jan 2026 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=tuo66Omxm1VH4U7gZEtDynfbVkuUYJPC7v6+nle48xE=;
	t=1768995086; x=1770204686; b=kFVCa6D5SvFKL1yeXFz85kJ3NnudzNIjXZdJOICCbQ64qYO
	hhLR1oopgAUZ/tPrhKDOT3rntKw1w1JlgbmwZW0ylFvQ5G9Hn0bdkn0+EKHPBbB6kLmCDVwqfIuA7
	6SRooGeWMgwywNEQ6nzGqIJlh9LeV2IU2yPk4v+0Biit7QCD+va3Mf66gGIR14HnU889JHptdddNn
	Y/TUe8sKi+6SQNnw2gkMI0ZtwqhQ3SVW26CjfUyooHSS8UWGrAhQzp6aR3HdQqy9MkovX+9DgEtFW
	h8tXHG69QZZodMIjyzMvVtPNupmjdEhY6dMIoTP/RLUynDCIkGX1KjOAjM2Qre9A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1viWQl-000000000CS-1L0W
	for radiotap@radiotap.org;
	Wed, 21 Jan 2026 12:31:23 +0100
Message-ID: <3093e9429200b1a107b3cc2834ba9cee4a077b0d.camel@sipsolutions.net>
Subject: Re: [RFC v2 3/3] UHR: add new field
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Wed, 21 Jan 2026 12:31:22 +0100
In-Reply-To: <20260114120835.238489-4-johannes@sipsolutions.net> (sfid-20260114_130849_598485_DB866C88)
References: <20260114120835.238489-1-johannes@sipsolutions.net>
	 <20260114120835.238489-4-johannes@sipsolutions.net>
	 (sfid-20260114_130849_598485_DB866C88)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

While implementing the user field,

On Wed, 2026-01-14 at 13:07 +0100, Johannes Berg wrote:
>=20
> +### `user_known`
> +
> +| **bits**         | **non-MU-MIMO / Co-SR** | **MU-MIMO / Co-BF** |
> +| **`0x00000001`** | STA-ID known | (same) |
> +| **`0x00000002`** | MCS known | (same) |
> +| **`0x00000004`** | NSS known | (reserved) |
> +| **`0x00000008`** | UEQM known | (reserved) |
> +| **`0x00000010`** | Beamforming And Coding / UEQM Pattern known | (rese=
rved) |

I realized that it's far simpler to split this up into Beamforming,
Coding and UEQM pattern separately.

> +| **`0x00000020`** | 2xLDPC known | (same) |
> +| **`0x00000040`** | (reserved) | Spatial Configuration known |
> +| **`0x00000080`** | (reserved) | Disregard known |
> +| **`0x00000100`** | (reserved) | Coding/BSS Color Indication known |
> +| **`0x00000200`** | User Encoding Block CRC known | (same) |
> +| **`0x00000400`** | User Encoding Block Tail known | (same) |
> +| **`0x0000f800`** | (reserved) | (reserved) |
> +| **`0x000f0000`** | User Encoding Block CRC (B23N-B23N+3) | (same) |
> +| **`0x03f00000`** | User Encoding Block Tail (B23N+4-B23N+9)| (same) |
> +| **`0x7c000000`** | (reserved) | (reserved) |
> +| **`0x80000000`** | Data captured for this user | (same) |
> +
> +### `user_info`
> +
> +| **bits**         | **non-MU-MIMO / Co-SR** | **MU-MIMO / Co-BF** |
> +| **`0x000007ff`** | STA-ID | (same) |
> +| **`0x0001f000`** | MCS | (same) |
> +| **`0x000e0000`** | NSS (0=3D1 spatial stream, 1=3D2 spatial streams, .=
..) | (overlap) |
> +| **`0x00100000`** | UEQM | (overlap) |
> +| **`0x00600000`** | Beamforming And Coding / UEQM Pattern | (overlap) |
> +| **`0x000f0000`** | (overlap) | Spatial Configuration |
> +| **`0x00100000`** | (overlap) | Disregard |
> +| **`0x00200000`** | (overlap) | Coding/BSS Color Indication |
> +| **`0x00400000`** | (overlap) | (reserved) |
> +| **`0x00800000`** | 2xLDPC | (same) |
> +| **`0xff000000`** | (reserved) | (reserved) |

which then also requires some more bits here. That should make it
simpler for wireshark too.

I'll update as follows I think:


### `user_known`

| **bits**         | **non-MU-MIMO / Co-SR** | **MU-MIMO / Co-BF** |
| **`0x00000001`** | STA-ID known | (same) |
| **`0x00000002`** | MCS known | (same) |
| **`0x00000004`** | NSS known | (reserved) |
| **`0x00000008`** | UEQM known | (reserved) |
| **`0x00000010`** | Beamforming known / UEQM Pattern known | (reserved) |
| **`0x00000020`** | Coding known / UEQM Pattern known | (reserved) |
| **`0x00000040`** | UEQM Pattern known | (reserved) |
| **`0x00000080`** | 2xLDPC known | (same) |
| **`0x00000100`** | (reserved) | Spatial Configuration known |
| **`0x00000200`** | (reserved) | Disregard known |
| **`0x00000400`** | (reserved) | Coding/BSS Color Indication known |
| **`0x00000800`** | User Encoding Block CRC known | (same) |
| **`0x00001000`** | User Encoding Block Tail known | (same) |
| **`0x0000e000`** | (reserved) | (reserved) |
| **`0x000f0000`** | User Encoding Block CRC (B23N-B23N+3) | (same) |
| **`0x03f00000`** | User Encoding Block Tail (B23N+4-B23N+9)| (same) |
| **`0x7c000000`** | (reserved) | (reserved) |
| **`0x80000000`** | Data captured for this user | (same) |

### `user_info`

| **bits**         | **non-MU-MIMO / Co-SR** | **MU-MIMO / Co-BF** |
| **`0x000007ff`** | STA-ID | (same) |
| **`0x0001f000`** | MCS | (same) |
| **`0x000e0000`** | NSS (0=3D1 spatial stream, 1=3D2 spatial streams, ...)=
 | (overlap) |
| **`0x00100000`** | UEQM | (overlap) |
| **`0x00200000`** | Beamforming | (overlap) |
| **`0x00400000`** | Coding (0 for BCC, 1 for LDPC) | (overlap) |
| **`0x01800000`** | UEQM Pattern | (reserved) |
| **`0x000f0000`** | (overlap) | Spatial Configuration |
| **`0x00100000`** | (overlap) | Disregard |
| **`0x00200000`** | (overlap) | Coding/BSS Color Indication |
| **`0x01c00000`** | (overlap) | (reserved) |
| **`0x02000000`** | 2xLDPC | (same) |
| **`0xfc000000`** | (reserved) | (reserved) |


even if some combinations are just not valid then, but otherwise the
parsing needs to depend on many bits and even the STA-ID.

johannes
