Return-Path: <SRS0=1rHw=C6=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01509C4741F
	for <radiotap@archiver.kernel.org>; Mon, 21 Sep 2020 23:52:50 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F1823A6B
	for <radiotap@archiver.kernel.org>; Mon, 21 Sep 2020 23:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="KWUzDVSM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43F1823A6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 5285384DA4; Mon, 21 Sep 2020 23:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 2C6B184D44
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 23:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=pobox.com;
	domainkeys=pass (1024-bit key) header.from=dyoung@pobox.com
	header.d=pobox.com
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id J-Z4l391HRf7 for <radiotap@radiotap.org>;
	Mon, 21 Sep 2020 23:52:47 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 7126084D25
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 23:52:47 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id E8D6687021
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 18:13:53 -0400 (EDT)
	(envelope-from dyoung@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
	:subject:message-id:references:mime-version:content-type
	:in-reply-to; s=sasl; bh=q0B0w3v3fNdtsyMiz7twZj0gzro=; b=KWUzDVS
	MO/4SDw2dWCO+ThiwCM0rCU37wDCShxSlT6Xrtc6T2rcVOU/5s7hWG/XgtpjTaiy
	BNTix3tWijwU3RQ7ApdWTvS9bC2tsxZ1cDI2BL7xAOlm5ZvHxXTwmOh2KYp5zlGv
	3Zpw2s2BgDZiEETUwcCCHukqCUUmFHsfkNNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=date:from:to
	:subject:message-id:references:mime-version:content-type
	:in-reply-to; q=dns; s=sasl; b=iBWWXE3CbiOP80XrBgKaefwRl2maPDKDs
	s/8U0M66dmN+JyV2zxdCdUeKJlNbHeeP6AZhKDP5XAMEm55sqHhvl9oMfS02FWPR
	CTQton2IoddyyncMMTDb/yGIm9N93sEhviFQ1BakLBYfmERi9pMyfJwC0XowxbcT
	8SjXhWDx5w=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id DFE6E87020
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 18:13:53 -0400 (EDT)
	(envelope-from dyoung@pobox.com)
Received: from elmendorf.whitecoralislands.com (unknown [67.173.96.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 4F52A8701F
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 18:13:53 -0400 (EDT)
	(envelope-from dyoung@pobox.com)
Received: by elmendorf.whitecoralislands.com (Postfix, from userid 1000)
	id 875F71BF074; Mon, 21 Sep 2020 17:13:52 -0500 (CDT)
Date: Mon, 21 Sep 2020 17:13:52 -0500
From: David Young <dyoung@pobox.com>
To: radiotap@radiotap.org
Subject: Re: Archival testing, please ignore
Message-ID: <20200921221352.GB721@pobox.com>
Mail-Followup-To: radiotap@radiotap.org
References: <20200921171752.zs3ws37jhqlub5g7@chatter.i7.local>
 <20200921182634.33vbtuxqtb2c6zsd@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921182634.33vbtuxqtb2c6zsd@chatter.i7.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Pobox-Relay-ID:
 BBEC8D2A-FC57-11EA-9CB2-01D9BED8090B-71664428!pb-smtp1.pobox.com
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Mon, Sep 21, 2020 at 02:26:34PM -0400, Konstantin Ryabitsev wrote:
> FYI, we tracked this down to the non-compliant List-ID header as set by 
> mail.netbsd.org:
> 
>   List-Id: radiotap.NetBSD.org
> 
> According to RFC 2919, the value should always be inside angle brackets, 
> so the way it is used above was resulting in an error. We've implemented 
> workarounds for now, so hopefully this and all ensuing messages should 
> get properly archived on lore.kernel.org.

Thank you for the heads-up.  I have forwarded your note to the NetBSD
admins.

Dave

-- 
David Young
dyoung@pobox.com    Urbana, IL    (217) 721-9981
