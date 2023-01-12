Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4039EC54EBC
	for <radiotap@archiver.kernel.org>; Thu, 12 Jan 2023 08:30:09 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 5FAEB84D67; Thu, 12 Jan 2023 08:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 374F484D67
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 08:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id YqXqKAWe3aZf for <radiotap@radiotap.org>;
	Thu, 12 Jan 2023 08:30:07 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 630E784D28
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=jumIaVKnvOYddqJE7ijlxlBtRU8DSX1M6h9Ok8kVfXE=;
	t=1673512207; x=1674721807; b=DZUYgY2ezgcePJqFgTvfp1jJARN8mbmwNOo97wsLd6Mpdnv
	DviMf3l8qXGfMNrhjLEVrEg4W7sdCADTp/UIAh4WW1EFFgSepZ1A1b89Gki41UO/t1gDgnSiG3wh8
	DY/4WMODVBYC1See5lIQ7wcpWZtCNXepYGjSbsu6rIK1jguX5VHl4E+0a/KHE7RyfQgQEClC0XaxT
	whMvvkXoKctaiG/chOMNWVf8jvvJGEVeVms3FRnaN2xT/TeewRTiH6r9erjvEtN70uR16cpuNVRVU
	Yfua8nDrVKzkVCf7zTr5azPEyXUFbRKudhck1iqeaFJAW4DSAj9k+yuqSQ/Woedg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pFsyK-00H0Nj-38;
	Thu, 12 Jan 2023 09:30:05 +0100
Message-ID: <143aa6a90e85ce0e23e0ee01b67160c1853676f0.camel@sipsolutions.net>
Subject: Re: Copy-and-paste error on the page for the "antenna noise" field?
From: Johannes Berg <johannes@sipsolutions.net>
To: Guy Harris <gharris@sonic.net>
Cc: "radiotap@radiotap.org" <radiotap@radiotap.org>
Date: Thu, 12 Jan 2023 09:30:04 +0100
In-Reply-To: <6D2D4EA8-721A-4D2F-B12D-97501DAFF928@sonic.net>
References: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
	 <af138b26bee9b940b50f8014fa330f3aefe87b4f.camel@sipsolutions.net>
	 <6D2D4EA8-721A-4D2F-B12D-97501DAFF928@sonic.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Thu, 2023-01-12 at 00:15 -0800, Guy Harris wrote:
> On Jan 11, 2023, at 11:46 PM, Johannes Berg <johannes@sipsolutions.net> w=
rote:
>=20
> > Hm. Yeah, seems like? This is really old :-)
>=20
> Yeah, I only noticed it when looking at, and copying and pasting text
> from, the ""antenna noise" page, to provide a comment on

Right.

> 	https://ask.wireshark.org/question/30268/how-to-get-noise-level-in-80211=
-headers-in-wireshark/
>=20
> I infer, from the Wireshark dissection of the radiotap header, that
> their adapter, or the driver for it, provides only "antenna signal"
> information and no "antenna noise" information.

I don't know what adapter they're using to capture, but it _looks_ like
mac80211 (with the per-antenna signal encoded that way), and then quite
possibly Intel (WFA uses it), and then yes - we don't provide noise
information in the Intel NICs.

johannes

