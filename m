Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1DDD111A8
	for <radiotap@archiver.kernel.org>; Fri, 28 Nov 2025 02:01:22 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id B69208570D; Fri, 28 Nov 2025 02:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 8F6A78570C
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 02:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=pobox.com header.b="JJIPJNvO";
	dkim=pass (2048-bit key) header.d=messagingengine.com
	header.b="y1GOYgty"
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 4WoDt1LW0RBu for <radiotap@radiotap.org>;
	Fri, 28 Nov 2025 02:01:20 +0000 (UTC)
X-Greylist: delayed 303 seconds by postgrey-1.37 at homeworld.NetBSD.org; Fri, 28 Nov 2025 02:01:20 UTC
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 42F9984D41
	for <radiotap@radiotap.org>; Fri, 28 Nov 2025 02:01:20 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1DE1D7A0609
	for <radiotap@radiotap.org>; Thu, 27 Nov 2025 20:56:16 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-05.internal (MEProxy); Thu, 27 Nov 2025 20:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1764294975; x=1764381375; bh=row4+8vpveyTPbKYag+/AvlOZYYomZbu
	bJf/U7wr0Ck=; b=JJIPJNvOAYPtBt/DX6p+nBlt8d+aCB96a656HJMLEG+tHUE0
	N/OwcqwCIJSFXN18XsxM9Rf8i6YjoyS/pB/4MjpnqAWU/gw2Po6midrxa0wcI8Ez
	XOETydJDMKj6s2IHkTlSPXet7EYzZkZgazRH+rNoIBEDS6q8yzCpZAFpoV1yIHvP
	g+b4Ai0ETcWK7wtPVhKUNtBfFltEm//CeKzNHTqjxTLo40o0lOfp6TZ7qAwVV+RE
	TxvyOSBedExPBdmsV2jngw9R8VTIbhj/bNQ1n1Ughg2/Ps/3p/OW5QU69aiphfQT
	Ii/29DOoOlugRRT9+GW7uVOzLJdQDUMeoYZXkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764294975; x=
	1764381375; bh=row4+8vpveyTPbKYag+/AvlOZYYomZbubJf/U7wr0Ck=; b=y
	1GOYgty1SnqcuASpvbfSgkqFb70Caj55zhbdza37R0BRFLZ28gMBFMQKaa+APoti
	8P4Aqzck35lQE7u0RGh9+u5H2JmIo5alWkLQ76FZZ9XHVMbOm2R0tjTvAk+R7tpZ
	IFZ3S5nRSPfGsMBCJS6bNFwiX2SgEoQ/HHcMM6GYncYKhElh0CSkhWb367nkzbIs
	mpCujQ5FZEDuH4y/LH18XTR2qGDwm7eJmltF9XYD2EEixPusXL9ae0Ucy+paSGy5
	JABWUKkg6SeQah562jofjHCS/gMKvmK2+X4rfYdIvlZbG1o+841Q2a5WZmSBMY8z
	zOzLvsCeoQvoYqDB0JfHg==
X-ME-Sender: <xms:PwEpaY6kXX8aszIURPTTnNYstkaD9EsUlnolEN6-YuPkjH3t3Sdhfw>
    <xme:PwEpafw1PKYZwV7b_nQ9BPe2d6ScF5Z21Eu3G9DKmS-pCrDRGhNaSjWob9d3Ru5sr
    MHoKflL-d07E_G0U4XSXgIvtDcFIWsWM5M2jpUHSXIv8uB_ZmLT>
X-ME-Received: <xmr:PwEpaSgxJDUepxEhStvI0tLW_L1DEj32cqMt1_BehUAf_E2OQARFVbXP0te7ASefKw1B3e48E9A5R6DYtWY7_tGpeqSn8SCIUNC4AjKxugSlMSXJyVVnzcH6F04zejZpTpd0RoUI9ytN4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeekieeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttddtvd
    enucfhrhhomhepffgrvhhiugcujghouhhnghcuoeguhihouhhnghesphhosghogidrtgho
    mheqnecuggftrfgrthhtvghrnhepuddvieffvedvieduhfevueefhfejgfevhfffhfegff
    evueetveekheejjefhjeffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepugihohhunhhgsehpohgsohigrdgtohhmpdhnsggprhgtphhtthhope
    dupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrrgguihhothgrphesrhgrughi
    ohhtrghprdhorhhg
X-ME-Proxy: <xmx:PwEpaZ_yEszWsmNO58M4Am4sy_aaZjAf-7nmHoQ9YPwtOtPNUNMsow>
    <xmx:PwEpafuSwvKCycGYuVoLNWqxRvjzCWa-TpqkH3I-h9lmoafzj9yM0w>
    <xmx:PwEpaQaYv77fFPe2dExWv1pmBmZQHFDeT94B0_xgb_hZWJqxa099uw>
    <xmx:PwEpafoT1lRnDqUPJlHEwOe3FR8p8Y4ox_feywrpyAGbFlewMYtwqg>
    <xmx:PwEpaVqtkUpLakiMBquudpOIPPsb-Z-4s3zQbP3w_mj-1-KxIf6tTBbG>
Feedback-ID: ibd28432f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <radiotap@radiotap.org>; Thu, 27 Nov 2025 20:56:15 -0500 (EST)
Received: by elmendorf.whitecoralislands.com (Postfix, from userid 1000)
	id D09E71BF0D8; Thu, 27 Nov 2025 19:56:14 -0600 (CST)
Date: Thu, 27 Nov 2025 19:56:14 -0600
From: David Young <dyoung@pobox.com>
To: radiotap@radiotap.org
Subject: radiotap.org domain expiration
Message-ID: <aSkBPqTF0KThhZFc@pobox.com>
Mail-Followup-To: radiotap@radiotap.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

FYI, the radiotap.org domain is expiring in a couple of weeks.  I don't
want to pay for its renewal any more.  Can I hand it off to somebody
else before it expires?

David

-- 
David Young
dyoung@pobox.com
