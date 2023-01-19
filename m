Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B0AC004D4
	for <radiotap@archiver.kernel.org>; Thu, 19 Jan 2023 19:17:48 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 564A484D8D; Thu, 19 Jan 2023 19:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 334D884D8B
	for <radiotap@radiotap.org>; Thu, 19 Jan 2023 19:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id 4IiN6BfLVuz8 for <radiotap@radiotap.org>;
	Thu, 19 Jan 2023 19:17:46 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id A8F6F84CBC
	for <radiotap@radiotap.org>; Thu, 19 Jan 2023 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=htEDNq6Z2YiMj/qZuGK8Ux5VJAV15/EyeDhr+syydRY=;
	t=1674155865; x=1675365465; b=a0ZRAjIlx7pxWYBKSRnjCTCwCo5sdF+TGg83vXyZSV20+st
	2ujNy//sEGG3imXPsCQXt6lmTG5mmWdH1cgEKabQsw43cHLF0W7PgeZt5lJMJqf53RYrpDmDUKEQ6
	//BpwLSR17v/bbSJodw/Th0ifm8cqO3rKzBfu/7OpukFE99garQjfo7JuDuFbtb1WIMiA82B0OmEB
	bbtTs+bYK+gPkjlkxnNq1uXJdOweQTSGGgzdoSsyumADFaCp29HiUyk82n091P8DfeNS6Pv2+In9t
	kG5K4oXF2i4VhyUCByBiphL/mV8iBosE9gB/NeSfTHYAPclgBV0a6KoF+qZkFPQg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pIaPu-006cgR-23;
	Thu, 19 Jan 2023 20:17:42 +0100
Message-ID: <632d65809d73ab9ce2b0e22f9857230fd5a296df.camel@sipsolutions.net>
Subject: Re: Copy-and-paste error on the page for the "antenna noise" field?
From: Johannes Berg <johannes@sipsolutions.net>
To: Guy Harris <gharris@sonic.net>
Cc: "radiotap@radiotap.org" <radiotap@radiotap.org>
Date: Thu, 19 Jan 2023 20:17:41 +0100
In-Reply-To: <965F651B-6310-4B52-B12B-6F54785C1525@sonic.net>
References: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
	 <af138b26bee9b940b50f8014fa330f3aefe87b4f.camel@sipsolutions.net>
	 <6D2D4EA8-721A-4D2F-B12D-97501DAFF928@sonic.net>
	 <143aa6a90e85ce0e23e0ee01b67160c1853676f0.camel@sipsolutions.net>
	 <965F651B-6310-4B52-B12B-6F54785C1525@sonic.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Thu, 2023-01-12 at 00:58 -0800, Guy Harris wrote:
> On Jan 12, 2023, at 12:30 AM, Johannes Berg <johannes@sipsolutions.net> w=
rote:
>=20
> > I don't know what adapter they're using to capture, but it _looks_ like
> > mac80211 (with the per-antenna signal encoded that way),
>=20
> Should that encoding scheme be documented, so as to encourage its use
> in other OS's 802.11 frameworks?

I don't know.

For the record, the encoding is to use a separate radiotap namespace for
each antenna, and then put an antenna signal and antenna field into it,
with the signal value and antenna number, respectively.

It's honestly not the greatest encoding, but it's sometimes useful to
have that data.

I've been hoping to replace namespaces with TLVs, but obviously in this
case that doesn't work since the namespace holds the two pieces of
information together ...

johannes
