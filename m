Return-Path: <SRS0=Ed2p=HE=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9890FC433DB
	for <radiotap@archiver.kernel.org>; Tue,  2 Feb 2021 21:00:13 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B8764F61
	for <radiotap@archiver.kernel.org>; Tue,  2 Feb 2021 21:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64B8764F61
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 9514B84DCF; Tue,  2 Feb 2021 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 746AB84DB3
	for <radiotap@radiotap.org>; Tue,  2 Feb 2021 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id jNpGr5fpevZ0 for <radiotap@radiotap.org>;
	Tue,  2 Feb 2021 21:00:09 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id B6D9084D12
	for <radiotap@radiotap.org>; Tue,  2 Feb 2021 21:00:07 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1l72mK-00F8VS-Cm; Tue, 02 Feb 2021 22:00:04 +0100
Message-ID: <e1a3173d370aa96d004359f9e7061e89ee478165.camel@sipsolutions.net>
Subject: Re: A modified, and maybe final, proposal for an S1G header for
 RadioTap
From: Johannes Berg <johannes@sipsolutions.net>
To: Richard Sharpe <realrichardsharpe@gmail.com>, radiotap@radiotap.org, Ray
 Wang <rwang@wi-fi.org>, Aaron Lee <jehun.lee@newracom.com>, Tasheng Lin
 <tlin@wi-fi.org>
Date: Tue, 02 Feb 2021 21:59:57 +0100
In-Reply-To: <CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
References: 
	<CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi Richard,

Couple of (last-minute!) comments ...

> Structure
> : u16 known, u16 data1, u16 data2, u8 ndp_type, u8[5] ndp_data;
> 
> Required Alignment
> : 4

If you only have u16 data, what's the value of 4-byte alignment?

> Is NDP indicates that this is an NDP frame, however, the content might
> not be known.

Should that have a note that the zero-length PSDU field should be set?
But if so, should that get a new sub-type for S1G NDP?

Otherwise:

> > **`0x0080`** | Is NDP, which means no packet data follows this header! |

this overlaps?

I guess it doesn't really matter though if that overlaps.

> > **`0x00C0`** | Number spatial streams: 0=1 Spatial stream, 1=2, ..
> 3=4 Spatial streams |

"Number of" I guess

johannes

