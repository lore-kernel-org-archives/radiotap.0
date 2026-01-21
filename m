Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7285C4450D
	for <radiotap@archiver.kernel.org>; Wed, 21 Jan 2026 11:50:01 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id BB7C784E9E; Wed, 21 Jan 2026 11:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 98B4384D96
	for <radiotap@radiotap.org>; Wed, 21 Jan 2026 11:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id m-tF7biD899z for <radiotap@radiotap.org>;
	Wed, 21 Jan 2026 11:50:00 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 9499C84D56
	for <radiotap@radiotap.org>; Wed, 21 Jan 2026 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=qUkUGMf8tZBRBlzIVHZpfFnjIKiwja5zHk9zE3qTykM=;
	t=1768996199; x=1770205799; b=YmLYHSB3deKnAYQf9+p4pqE65Th7C8blheTDa6T/OUQH7yu
	nbv9sVu2jLm0wRvmXt3SWaX2X5VVY1c9DqKHVtpqhmR4JuNZFMd969yZp4nl7YMm59spTY7tLtePJ
	1q6z2E8bB1wm8iC+MOSYrM+bowfaLBooSfEfU4/Tbnx2FO0LQilgJ8K2reUSWL406FwwpW5gvLqCQ
	nf4sZDB0b2pGCeat3VDksrqi77UlXU3tY6zl6VQjX8bE3/1zjg+LNOSAhQrvhpTnUrXVzsCFNrYce
	OYm2VZcwpnXmMUg46rax+o+eJiiegjaf1TBn33+N0oloT03Jzrg3yAWPC4vL5Dww==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1viWij-000000000XB-1lK0
	for radiotap@radiotap.org;
	Wed, 21 Jan 2026 12:49:57 +0100
Message-ID: <e23c581ef63590c1301dfca0e8b334c136c1c3f1.camel@sipsolutions.net>
Subject: Re: [RFC v2 3/3] UHR: add new field
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Wed, 21 Jan 2026 12:49:56 +0100
In-Reply-To: <3093e9429200b1a107b3cc2834ba9cee4a077b0d.camel@sipsolutions.net> (sfid-20260121_123131_828551_570CD5DC)
References: <20260114120835.238489-1-johannes@sipsolutions.net>
		 <20260114120835.238489-4-johannes@sipsolutions.net>
		 (sfid-20260114_130849_598485_DB866C88) <3093e9429200b1a107b3cc2834ba9cee4a077b0d.camel@sipsolutions.net>
	 (sfid-20260121_123131_828551_570CD5DC)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Wed, 2026-01-21 at 12:31 +0100, Johannes Berg wrote:
>=20
> ### `user_info`
>=20
> > **bits**         | **non-MU-MIMO / Co-SR** | **MU-MIMO / Co-BF** |
> > **`0x0001f000`** | MCS | (same) |
> > **`0x000f0000`** | (overlap) | Spatial Configuration |

No, that had a bug, now obvious with the selective quoting :)

Packing it a bit differently so that the table is easier to read (fewer
"overlap" lines) and filling the hole at 0x800, I arrive at:

| **bits**         | **non-MU-MIMO / Co-SR** | **MU-MIMO / Co-BF** |
| **`0x000007ff`** | STA-ID | (same) |
| **`0x0000f800`** | MCS | (same) |
| **`0x00070000`** | NSS (0=3D1 spatial stream, 1=3D2 spatial streams, ...)=
 | (overlap) |
| **`0x00080000`** | (reserved) | (overlap) |
| **`0x000f0000`** | (overlap) | Spatial Configuration |
| **`0x00100000`** | UEQM | Disregard |
| **`0x00200000`** | Beamforming | BSS Color Indication |
| **`0x00c00000`** | UEQM Pattern | (reserved) |
| **`0x01000000`** | Coding (0 for BCC, 1 for LDPC) | (same) |
| **`0x02000000`** | 2xLDPC | (same) |
| **`0xfc000000`** | (reserved) | (reserved) |

johannes
