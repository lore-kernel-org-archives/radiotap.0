Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95627C3DA63
	for <radiotap@archiver.kernel.org>; Wed, 24 Jul 2024 13:45:52 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 43DEB84EE2; Wed, 24 Jul 2024 13:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 1F1E784EDD
	for <radiotap@NetBSD.org>; Wed, 24 Jul 2024 13:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=candelatech.com
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 11ftFVTDYhZP for <radiotap@netbsd.org>;
	Wed, 24 Jul 2024 13:45:50 +0000 (UTC)
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 51F8F84CEA
	for <radiotap@NetBSD.org>; Wed, 24 Jul 2024 13:45:50 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 68F5F4000C3;
	Wed, 24 Jul 2024 13:45:48 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.33.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id EAC5113C2B0;
	Wed, 24 Jul 2024 06:45:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com EAC5113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1721828748;
	bh=wjv4FrmKMP3+DzAQr1l6iFdgDgq0EdvvK07M7uOztt8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MvO2FXWSxOfIF6qAMH8MHlsVhjNc5Iq9v9civd6jiJLEOum5sjYPNS2D5xIfj2m0I
	 TQwOyjZWCt6IwUxEkn/ebYsEgaXdpHqzDMKZ0vDP915v0TLwbg1kiuvRCDNFCqCicc
	 iZrtgSaVk7ysPmyOX7X97fOjGrcoXpFR+Z8qF01o=
Message-ID: <71d4c465-f709-4866-bc11-eb9c10e6bc80@candelatech.com>
Date: Wed, 24 Jul 2024 06:45:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: EHT NSS units question
To: Johannes Berg <johannes@sipsolutions.net>, radiotap@NetBSD.org
References: <5b1dcfcb-fcc8-4014-81a6-b307b05617af@candelatech.com>
 <1fff21828808ad4f092524a405dea4f5c4cff10d.camel@sipsolutions.net>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <1fff21828808ad4f092524a405dea4f5c4cff10d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1721828749-giItERi8gYHf
X-MDID-O:
 us5;ut7;1721828749;giItERi8gYHf;<greearb@candelatech.com>;f2a3fc4a0c033c298811697ca2338187
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On 7/24/24 03:58, Johannes Berg wrote:
> On Thu, 2024-07-18 at 06:58 -0700, Ben Greear wrote:
>> Hello,
>>
>> I would like to know if the units for NSS for EHT user element
>> are zero based (ie, 0x0 means 1NSS) or ones-based (0x1 means 1NSS).
>>
>>   From what I can tell, wireshark is using zero based counting, but
>> mt76 driver is using ones-based counting when filling in the radiotap header.
>>
>> I am not sure which one to fix...
>>
> 
> Looks like we never fully defined this ... Arguably having 4 bits means
> that we intended to have 1-8 (and perhaps 0 mean "unknown"), but having
> another bit for "I knew the NSS" kind of made that unnecessary ...
> 
> But since both wireshark and iwlwifi agree to have 0=1NSS and 1=2NSS I
> guess it's better to clarify that in the spec and fix mt76.

Ok thanks, I have a small patch that fixes mt76, will clean it up and post
to the wifi mailing list.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

