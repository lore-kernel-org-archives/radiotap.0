Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E11EC433EF
	for <radiotap@archiver.kernel.org>; Mon, 20 Dec 2021 18:28:07 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id AFC0884F1A; Mon, 20 Dec 2021 18:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 8EFF184F17
	for <radiotap@netbsd.org>; Mon, 20 Dec 2021 18:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id mJUtbjdIuJt0 for <radiotap@netbsd.org>;
	Mon, 20 Dec 2021 18:28:05 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 7A5A784E53
	for <radiotap@netbsd.org>; Mon, 20 Dec 2021 18:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+qa/q+ZXs6LBoo7CpFGyx8FJzvhxHaDFzx+bzmm6SmA=;
	t=1640024885; x=1641234485; b=jUojVy7oSU4UNdKoBaL6xJf+JRWaPeaRkX0DzOUhWyRJBVs
	Zml/7t3JGRWjJ9NjFynV7ZC5O5/a66fC35uFG2B3wJt5EI0f0q8s5Z4mm3oUuWeiaHyF/dTgO2KSu
	ws7b0R4yAVLQkWNgS7kbvOv1kDyGMfmBWplZz0d24LQ1YvVCddAawe5uLOOkZMZ5tf50130KoSNtK
	fD5y1DN6+3ZOT7MMOcSZHKX7RBCz+f21dftKVpr3XegSLMUMOnO3z3mmDuLPw3Dwq6i9Y2KssKKB2
	5/17bUZNUVZvmd1R8K6INj6rme7/4ayqA+Wo/ouA3wrfFqZYfoLH5YM1rABGWrxA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mzNOC-00EDJl-PA;
	Mon, 20 Dec 2021 19:28:01 +0100
Message-ID: <1fb03c68beeabe5db206e73410821b92c6906ea8.camel@sipsolutions.net>
Subject: Re: fyi: domains
From: Johannes Berg <johannes@sipsolutions.net>
To: David Young <dyoung@pobox.com>, radiotap@netbsd.org
Date: Mon, 20 Dec 2021 19:28:00 +0100
In-Reply-To: <YcCzEnna1KGiQ1ax@pobox.com>
References: <20201210054140.GO27306@pobox.com>
	 <2634cf7d1df09492d5a0e1610e3c0b4ba9cab7d4.camel@sipsolutions.net>
	 <YcCzEnna1KGiQ1ax@pobox.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Mon, 2021-12-20 at 10:45 -0600, David Young wrote:
> On Mon, Dec 20, 2021 at 10:31:13AM +0100, Johannes Berg wrote:
> > Hi Dave, all,
> > 
> > On Wed, 2020-12-09 at 23:41 -0600, David Young wrote:
> > > I renewed radiotap.org for another year.
> > > 
> > 
> > Looks like it's been a year now and started being unavailable.
> 
> Oops!
> 
> I have renewed it, now.  I got mixed up, thinking for some reason that
> radiotap.net was the name we had settled on.  Sorry about that.

Oh, I thought you had released that one entirely.

Not that it would matter much.


> > Should we move off this entirely and just use the radiotap.github.io
> > name instead?
> 
> I feel that $18/year for a "freestanding" domain is not a lot to pay for
> some independence from GitHub, should it ever be necessary or desirable
> to change hosting.
> 

Thank you! I tend to agree, be willing to pitch in but I suppose quite
possibly at that low cost it's more expensive to figure out how to share
it...


FWIW, github now says:

   radiotap.org is improperly configured
   
   Domain does not resolve to the GitHub Pages server. For more
   information, see Learn more (NotServedByPagesError). We recommend you
   add an A record pointed to our IP addresses, or an ALIAS record
   pointing to radiotap.github.io.
   

Still works for www.radiotap.org, so I guess all is well, and as before,
just that it complains now somehow.

(I didn't even know there was an "ALIAS" record, hah!)

Again, thanks!

johannes
