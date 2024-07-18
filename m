Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D24C3DA49
	for <radiotap@archiver.kernel.org>; Thu, 18 Jul 2024 13:59:04 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 3D92084D5F; Thu, 18 Jul 2024 13:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 1893A84D4E
	for <radiotap@NetBSD.org>; Thu, 18 Jul 2024 13:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=candelatech.com
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id OW0A3cGVf337 for <radiotap@netbsd.org>;
	Thu, 18 Jul 2024 13:59:02 +0000 (UTC)
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 4D3DA84CFC
	for <radiotap@NetBSD.org>; Thu, 18 Jul 2024 13:59:02 +0000 (UTC)
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id A78E350517B
	for <radiotap@NetBSD.org>; Thu, 18 Jul 2024 13:59:01 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id C642AB8006C
	for <radiotap@NetBSD.org>; Thu, 18 Jul 2024 13:58:59 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.32.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 4E6F213C2B0
	for <radiotap@NetBSD.org>; Thu, 18 Jul 2024 06:58:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 4E6F213C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1721311139;
	bh=OhVPr9gpPHWgJnv5Xx49HOjN3rUH6JwTqSHMUz5rreI=;
	h=Date:To:From:Subject:From;
	b=BfHk5ToHlUgXj/SbV48kIz3biOc1pqa392foLwiu/Edv1wZZaaRyW3Iv9w0uhp2ZM
	 ouo820JQx0qoQaVclYUnv0T/beg5tXPiEAwK+M1E6dBp8jez6zQWJDzN1wVpwsjFaS
	 4bmaMKUMG6T0VG1aPsKRmKgZhbDYdP08zIT2kw0Q=
Message-ID: <5b1dcfcb-fcc8-4014-81a6-b307b05617af@candelatech.com>
Date: Thu, 18 Jul 2024 06:58:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: radiotap@NetBSD.org
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Subject: EHT NSS units question
Organization: Candela Technologies
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1721311140-sumAiXRpcIcx
X-MDID-O:
 us5;at1;1721311140;sumAiXRpcIcx;<greearb@candelatech.com>;bc1071551e12fa805b10cd6f38df2efc
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hello,

I would like to know if the units for NSS for EHT user element
are zero based (ie, 0x0 means 1NSS) or ones-based (0x1 means 1NSS).

 From what I can tell, wireshark is using zero based counting, but
mt76 driver is using ones-based counting when filling in the radiotap header.

I am not sure which one to fix...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com
