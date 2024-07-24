Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95F4C3DA61
	for <radiotap@archiver.kernel.org>; Wed, 24 Jul 2024 10:58:05 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 9D0DE84EF6; Wed, 24 Jul 2024 10:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 7BB1084E8F
	for <radiotap@NetBSD.org>; Wed, 24 Jul 2024 10:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 4Lhlf23MIBfc for <radiotap@netbsd.org>;
	Wed, 24 Jul 2024 10:58:03 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 5DC0684CED
	for <radiotap@NetBSD.org>; Wed, 24 Jul 2024 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MuNS7LZDHzH2N9KaESFp6MX68Za2H6+9TtnC+oKA+b8=;
	t=1721818683; x=1723028283; b=uxexOoLdpVnYQqA8siQ3wxNTSRaT62KGFZLoJJj03ZDEIjy
	w2eXKEtE/9hCtuc45Mdx+b1kM/n/PFJNz0o+TNZ9A/pJOU8pIcXDO++38q/72lcpJBu3S+LbUYYyV
	d7e1pxfJ2TXZP+wG+6vJoGV7ClCy/pikuTuQp6cC/K5YuCMXavy+wKkHTOV3ZnCT5MB+l+XSyP5bf
	XtlifEnOa542fN/i3Smv0nJWN4RwGHkgzcL9w9y/iP0fupDuI500T76E/42CombRL3ZN52d/ouwei
	mj3usIiCwUewQmZwFXReruDWjP+r82bY7d6eGmJqebn2Y+dWFwRTgbLNxXlLU/9w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sWZh2-0000000DUu9-3Fe1;
	Wed, 24 Jul 2024 12:58:00 +0200
Message-ID: <1fff21828808ad4f092524a405dea4f5c4cff10d.camel@sipsolutions.net>
Subject: Re: EHT NSS units question
From: Johannes Berg <johannes@sipsolutions.net>
To: Ben Greear <greearb@candelatech.com>, radiotap@NetBSD.org
Date: Wed, 24 Jul 2024 12:58:00 +0200
In-Reply-To: <5b1dcfcb-fcc8-4014-81a6-b307b05617af@candelatech.com>
References: <5b1dcfcb-fcc8-4014-81a6-b307b05617af@candelatech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Thu, 2024-07-18 at 06:58 -0700, Ben Greear wrote:
> Hello,
>=20
> I would like to know if the units for NSS for EHT user element
> are zero based (ie, 0x0 means 1NSS) or ones-based (0x1 means 1NSS).
>=20
>  From what I can tell, wireshark is using zero based counting, but
> mt76 driver is using ones-based counting when filling in the radiotap hea=
der.
>=20
> I am not sure which one to fix...
>=20

Looks like we never fully defined this ... Arguably having 4 bits means
that we intended to have 1-8 (and perhaps 0 mean "unknown"), but having
another bit for "I knew the NSS" kind of made that unnecessary ...

But since both wireshark and iwlwifi agree to have 0=3D1NSS and 1=3D2NSS I
guess it's better to clarify that in the spec and fix mt76.

johannes
