Return-Path: <SRS0=zM4B=FO=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F220C433FE
	for <radiotap@archiver.kernel.org>; Thu, 10 Dec 2020 05:48:08 +0000 (UTC)
X-Greylist: delayed 380 seconds by postgrey-1.34 at mail.kernel.org; Thu, 10 Dec 2020 05:48:06 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B406223D37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pobox.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B406223D37
	for <radiotap@archiver.kernel.org>; Thu, 10 Dec 2020 05:48:06 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 9127584D5F; Thu, 10 Dec 2020 05:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 6CF9784D56
	for <radiotap@netbsd.org>; Thu, 10 Dec 2020 05:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=pobox.com;
	domainkeys=pass (1024-bit key) header.from=dyoung@pobox.com
	header.d=pobox.com
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id UYlySeRtaEE5 for <radiotap@netbsd.org>;
	Thu, 10 Dec 2020 05:41:45 +0000 (UTC)
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id C95F684CDB
	for <radiotap@netbsd.org>; Thu, 10 Dec 2020 05:41:44 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 91CED8BEB9
	for <radiotap@netbsd.org>; Thu, 10 Dec 2020 00:41:41 -0500 (EST)
	(envelope-from dyoung@pobox.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
	:subject:message-id:mime-version:content-type; s=sasl; bh=EjifxO
	sY3Es9yKc2Ge/dvYRu11k=; b=HegsBablMXEQBmB8VtwRIPTPKlPwjlI3uf1c0n
	ZoWumhxficrtD6eDoKT6TtcWFi42QCZvqgjOgO7AbtBmcuNNStf6mr82dJteBZeO
	aFl7q+0nPwXsltysbHYscvNN9e0ru5usf/6w16g3nbXm6Mi+ttSwFaYsAZOyB/Vs
	g8x+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pobox.com; h=date:from:to
	:subject:message-id:mime-version:content-type; q=dns; s=sasl; b=
	s+wrcDdHWAwo8Sux4L1BRR39v/7cqGvC0+8/If46QpH6j6JK7qftj+NjPEkdsodF
	utDxPUnIuwN6FbkVVxXc2LHj+3WSA/rpYfeE8X61iDN3vh4ndLDqw8nCGv7xYSyj
	XmV0DLIkf5UiEwAFXMBDmOmjPqzsYIhhHDuaEnXgjRM=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 8957D8BEB8
	for <radiotap@netbsd.org>; Thu, 10 Dec 2020 00:41:41 -0500 (EST)
	(envelope-from dyoung@pobox.com)
Received: from elmendorf.whitecoralislands.com (unknown [67.173.96.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 200BA8BEB7
	for <radiotap@netbsd.org>; Thu, 10 Dec 2020 00:41:41 -0500 (EST)
	(envelope-from dyoung@pobox.com)
Received: by elmendorf.whitecoralislands.com (Postfix, from userid 1000)
	id 115C41BF07F; Wed,  9 Dec 2020 23:41:40 -0600 (CST)
Date: Wed, 9 Dec 2020 23:41:40 -0600
From: David Young <dyoung@pobox.com>
To: radiotap@netbsd.org
Subject: fyi: domains
Message-ID: <20201210054140.GO27306@pobox.com>
Mail-Followup-To: radiotap@netbsd.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Pobox-Relay-ID:
 6104583E-3AAA-11EB-A61D-74DE23BA3BAF-71664428!pb-smtp2.pobox.com
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

I renewed radiotap.org for another year.

The disused domains, radiotap.info and radiotap.net, will lapse in 7
days.

Dave

-- 
David Young
dyoung@pobox.com    Urbana, IL    (217) 721-9981
