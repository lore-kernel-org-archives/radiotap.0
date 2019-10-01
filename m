Return-Path: <SRS0=8ZJt=X2=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DE0C352AA
	for <radiotap@archiver.kernel.org>; Tue,  1 Oct 2019 08:51:44 +0000 (UTC)
X-Greylist: delayed 902 seconds by postgrey-1.34 at mail.kernel.org; Tue, 01 Oct 2019 08:51:44 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DB32133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DB32133F
	for <radiotap@archiver.kernel.org>; Tue,  1 Oct 2019 08:51:44 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id EC14F84DC2; Tue,  1 Oct 2019 08:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id D0C1084D9C
	for <radiotap@radiotap.org>; Tue,  1 Oct 2019 08:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id YZwSufy44UxB for <radiotap@radiotap.org>;
	Tue,  1 Oct 2019 08:36:41 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 463DD84D35
	for <radiotap@radiotap.org>; Tue,  1 Oct 2019 08:36:40 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.92.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1iFDeA-0002PZ-Hw
	for radiotap@radiotap.org; Tue, 01 Oct 2019 10:36:38 +0200
Message-ID: <0be92668cd7a0d4541dd63c5338976a49440522b.camel@sipsolutions.net>
Subject: FYI: new radiotap archive
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Tue, 01 Oct 2019 10:36:37 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: radiotap-owner@radiotap.org
List-Id: radiotap.NetBSD.org
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi all,

The kernel.org admins have graciously agreed to host a public-inbox
archive of this list at

https://lore.kernel.org/radiotap/


I've loaded into the the entire archive David Young and I had going back
to March 2007.

Just FYI, in case you need this.

Thanks,
johannes

