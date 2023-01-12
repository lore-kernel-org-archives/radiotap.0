Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367DBC54EBD
	for <radiotap@archiver.kernel.org>; Thu, 12 Jan 2023 07:46:22 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 3CEB584D67; Thu, 12 Jan 2023 07:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 1957184D4B
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 07:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id uhZMJb5Zd7yf for <radiotap@radiotap.org>;
	Thu, 12 Jan 2023 07:46:20 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 556BD84D00
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Uh5s1hQb4eOQSUHudvbjO5NdJpMWK3TIZTMeOI5d5L8=;
	t=1673509579; x=1674719179; b=u44Sqr0KGdxZhOozL9PTqOxk3E1jN+InAG4KmGFtQDd9BBW
	KnEVKcOC4y6Htai/cYsHVIimeHl5tjWy44oRdTdDx1FytvN7H8tNExBU+KqTqbFhokbe1ueZN1xzV
	wmXhofEdZlaYbvc+cqAjPRo/9OgJH0+1T4CMdM46yb0D2sJsKh7+BHTd8JEzrbshTT70pixuPum0p
	K01ttrgp5kgFOvt35stjpxp164zvesVoH7VjzX+k+kc7P0InG5kRGB+WGU3nH/RnZ2E+zjb1hoImW
	k9Agufv2iKCDITJCv4evU1xMYiP5XrwM21WqiL6RmQC3/HGlF3KqNAPu8iUAVVKQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pFsHv-00Gz2X-2H;
	Thu, 12 Jan 2023 08:46:15 +0100
Message-ID: <af138b26bee9b940b50f8014fa330f3aefe87b4f.camel@sipsolutions.net>
Subject: Re: Copy-and-paste error on the page for the "antenna noise" field?
From: Johannes Berg <johannes@sipsolutions.net>
To: Guy Harris <gharris@sonic.net>, "radiotap@radiotap.org"
	 <radiotap@radiotap.org>
Date: Thu, 12 Jan 2023 08:46:14 +0100
In-Reply-To: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
References: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Wed, 2023-01-11 at 19:16 -0800, Guy Harris wrote:
> The page for the "antenna noise" field, at
>=20
> 	http://www.radiotap.org/fields/Antenna%20noise.html
>=20
> describes it as
>=20
> 	RF noise power at the antenna. This field contains a single
> signed 8-bit value, which indicates the RF signal power at the
> antenna, in decibels difference from 1mW.
>=20
> It looks as if this was copied and pasted from the "antenna signal"
> page, with the first instance of "signal" replaced by noise, but the
> second instance left as "signal".

Hm. Yeah, seems like? This is really old :-)

You could argue that noise is also some kind of "RF signal" but yeah, it
seems to make sense to change that.

Any other opinions?

johannes
