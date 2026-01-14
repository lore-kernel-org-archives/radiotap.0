Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BCBD29FF5
	for <radiotap@archiver.kernel.org>; Wed, 14 Jan 2026 12:08:30 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id CB9E585587; Wed, 14 Jan 2026 12:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id A87CC84DA8
	for <radiotap@radiotap.org>; Wed, 14 Jan 2026 12:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id NCUluk2C2fbA for <radiotap@radiotap.org>;
	Wed, 14 Jan 2026 12:08:27 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at homeworld.NetBSD.org; Wed, 14 Jan 2026 12:08:26 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id D7BAE85584
	for <radiotap@radiotap.org>; Wed, 14 Jan 2026 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IsQszgptaGnS0Ytyrt/VwbZGM5HApXIPHMm/lSJG/N0=;
	t=1768392506; x=1769602106; b=l8Zxx5mRj/yAoCN7PqjIfkMrcYf7d1HE9Xz+L5dT0y0sORz
	9tnAFsX8D4Wu7BPlSfiGpzOnpbvY1n0yh3r42hohxQxh5jISqDC1S4GQiyYilR0WZX0FnRqAACocT
	KAb5ysMgg2XKU32j6Smu8PW+qI+et2gi2MLKamUzzVxyLbq2LzwWRUTLW2JXG53NZUDj+4ZhfuWG7
	Cw78LTap2MZTLaWluhG+Tz9qaENbeOBa1Ceu9i3oHk85uxXY4zIdnksS+zu90/GLUEhtXOf8gO3lO
	eCIhYpQHNtDEIvH/FZ/hVTl7VetCUOdeQdpkDDDuD3IzbGWLfppoEHOkikJrzdPQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vfzao-0000000Bd5Z-3CsM
	for radiotap@radiotap.org;
	Wed, 14 Jan 2026 13:03:18 +0100
Message-ID: <a6f85fb7e529c65571faef6cb41824fcb1765715.camel@sipsolutions.net>
Subject: Re: [PATCH 0/2] Add new fields relevant for bandwidth signalling
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Wed, 14 Jan 2026 13:03:18 +0100
In-Reply-To: <20251128160018.300334-1-benjamin@sipsolutions.net>
References: <20251128160018.300334-1-benjamin@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Fri, 2025-11-28 at 17:00 +0100, Benjamin Berg wrote:
> Hi all,
>=20
> These new fields can be relevant when inspecting whether bandwidth
> signalling is handled correctly. For this, the signalling information
> itself can be reported as well as information about the observed signal
> to determine whether the frame was duplicated over multiple channels.
>=20
> We will post patches for iwlwifi that use these new fields.
> Corresponding wireshark dissectors should also be submitted in due
> course.

Anyone have any objections to this?

johannes
