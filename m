Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35824C4332F
	for <radiotap@archiver.kernel.org>; Thu, 20 Oct 2022 11:55:17 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 6C7A884D8A; Thu, 20 Oct 2022 11:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 48AE384D4A
	for <radiotap@radiotap.org>; Thu, 20 Oct 2022 11:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id bcCxsGpD92yb for <radiotap@radiotap.org>;
	Thu, 20 Oct 2022 11:55:16 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id C1CAF84CF7
	for <radiotap@radiotap.org>; Thu, 20 Oct 2022 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5bqoQwX6TEtyEZxbz/4NuRLLsFe8SnUCBu4cvVnYS9A=;
	t=1666266915; x=1667476515; b=bSEK6Smhs6EwIlsOtRWNVNrJG2t4cFh3HFEXpu7gGpoknWp
	9hxa+Ef7W7Bb8e3VQQRQCrxWGdVVKhf3Mole/HzGcjRF8tegbos/rUaPo63K5M4DW4EqTVt2EZMct
	y5s1e2EeItNuWQd7UQfzMdyP9OMRZ/pTMwXhVW8/u2PPfiQDEsnaTVxgF8iX0yDs3CI3eehIjetvD
	mKUdnzkowcu3MbgOfsnjXLPQCjL6TFW5e/6hN1ATitnJ2je4L0rN+Stwsl7JEC2Dm0aTWKYWMzQlb
	SaVJTomJOY2Zltr/aquuwhIgoazdEyOavhAmVjcJUZ6hxACNPKPRrPMtOeLKf2MA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1olU8m-00Byn1-2j
	for radiotap@radiotap.org;
	Thu, 20 Oct 2022 13:55:12 +0200
Message-ID: <5d5c0285de4a55c084466426f702a799fd5f712e.camel@sipsolutions.net>
Subject: Re: EHT definitions - U-SIG
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Thu, 20 Oct 2022 13:55:12 +0200
In-Reply-To: <c03df0feebbc88cb87f6aca1b5f039efbe2d59d0.camel@sipsolutions.net>
References: 
	<81f624878a2191586e72543a5b5dabc95d5673a6.camel@sipsolutions.net>
	 <c03df0feebbc88cb87f6aca1b5f039efbe2d59d0.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Mon, 2021-12-06 at 16:52 +0100, Johannes Berg wrote:
> Hi,
>=20
> Since it's all hard to read in plain markdown, I've uploaded it to the
> suggested fields:
>=20
> https://www.radiotap.org/fields/U-SIG

I just made one more minor update here.

> https://www.radiotap.org/fields/EHT

So maybe it's a good time to say that we have all the implementations
now in the driver and wireshark, and have been using it for the WFA
plugfests.

> The only thing I know of right now that I'm not entirely sure about is
> the Content Channel Index thing - i.e. "which preamble of the
> transmission did I capture". Our DSP appears to provide this in trigger-
> based RU allocation format, and I have to check how to use that
> properly.
>=20

That did indeed change a little bit since i posted it originally.

Did anyone ever review it? Or have objections to adopting it?

johannes
