Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2650C25B75
	for <radiotap@archiver.kernel.org>; Wed, 15 May 2024 07:49:24 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id CB18584EF0; Wed, 15 May 2024 07:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id A704484ED2
	for <radiotap@radiotap.org>; Wed, 15 May 2024 07:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id OWfhZTnZZriG for <radiotap@radiotap.org>;
	Wed, 15 May 2024 07:49:22 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 6C92B84CEB
	for <radiotap@radiotap.org>; Wed, 15 May 2024 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dTDO4aoO0MvsxiTbaCV6o9XX4Mz8+4+Dd3UUIPSS2j4=;
	t=1715759362; x=1716968962; b=LEZGZE3bv8xKkgJOx3v+FOUbGQDFhlEEe1Eb9vIaFCLqda6
	qxQ5LtNeKugjZrwN5JcaDQWuZ9wB+qEsM3CiEca1BJ0iH09GMYZhq5ycQKZD0V18YNVW5CIq9XCh4
	dD1hEsfobFDLPA+eVLjuXgUoRIErhfYaA9TcU4noy8jg3K7Td2jViNYjdNB9QJIf0WVBVgOpP33DA
	MJRqtxT/Ht6KNGExGKTH8Mm2MFlPjBKlMaYzsfacyidD8EXnSsYh9PJJC9J/VaLlhTX+WQqU0uTP8
	sXzXZ4tRak/sxxt1AF5My86q3ibcBavjJC6VfA23wEUSdEewpQDiIWDxjrjYryyA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1s79O3-000000064nn-0UHq
	for radiotap@radiotap.org;
	Wed, 15 May 2024 09:49:19 +0200
Message-ID: <46b6342096486631272e0b5073dc521bb487339f.camel@sipsolutions.net>
Subject: Re: [RFA] EHT (and U-SIG as part of it)
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Wed, 15 May 2024 09:49:18 +0200
In-Reply-To: <0a24ce293e808b94f1057b68159d95ebffb8634e.camel@sipsolutions.net>
References: 
	<0a24ce293e808b94f1057b68159d95ebffb8634e.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Mon, 2023-08-28 at 16:34 +0200, Johannes Berg wrote:
> Time flies, it's been almost a year and a half! There were a few
> adjustments along the way, but mostly this was proven with code in
> wireshark / Linux and being used for tests.
>=20

Umm. I completely forgot about this - I'll adopt this now, no comments
in 8.5 months should do it ;)

johannes
