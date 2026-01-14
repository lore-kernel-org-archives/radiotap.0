Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBA7D29FEF
	for <radiotap@archiver.kernel.org>; Wed, 14 Jan 2026 12:08:41 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 8FD2E85593; Wed, 14 Jan 2026 12:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 69F5D8558E
	for <radiotap@radiotap.org>; Wed, 14 Jan 2026 12:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id tRYWeICHVJ8X for <radiotap@radiotap.org>;
	Wed, 14 Jan 2026 12:08:40 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 9A14A85584
	for <radiotap@radiotap.org>; Wed, 14 Jan 2026 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:To:From:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=QPI1zgV+CoXrKrX9Nv/VExkL8u8mZ/5NMap/up1xRvk=; t=1768392519; x=1769602119; 
	b=FL7EdmIUG59tXIUKjty+mqGd4388IiumdQhJeuCalY9jii/a+8o7cK7o1jr64qi29xxlOk8djJh
	89cTay+y5pLe7W9GzSXEzKwxoFatsewp/wNjFoESj0vaczFihSGEQo5OQFas9bhHnZjX+RGTTfbXh
	7irP2eOlHjA8qaWPBRO5Hq+HnzusWetTZtcMTa8NM0jC26nwjByTmX98dv/TYHs0UHjzMB5cFWuFB
	NPF6jD57gGmmln7jJdovFpdpnElBY478Y4eOeOOCN0Jch5G+hyRihfD7oBVmvYJd+lIalxj4IjQr1
	4wl0Z9u+RamrV///nT7n5RF/UcBcgBqBevbQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vfzfx-0000000BdFW-29W4
	for radiotap@radiotap.org;
	Wed, 14 Jan 2026 13:08:37 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Subject: [RFC v2 0/3] UHR additions
Date: Wed, 14 Jan 2026 13:07:08 +0100
Message-ID: <20260114120835.238489-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Add the necessary documentation/fields for UHR/WiFi8.

We've reviewed this again carefully with a few people
and the only changes made are what I just described
in my other email.

johannes

