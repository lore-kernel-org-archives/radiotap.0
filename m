Return-Path: <SRS0=i3nQ=DX=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28695C433E7
	for <radiotap@archiver.kernel.org>; Fri, 16 Oct 2020 20:20:42 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB1FF20878
	for <radiotap@archiver.kernel.org>; Fri, 16 Oct 2020 20:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB1FF20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id C2F0784E1B; Fri, 16 Oct 2020 20:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 8AEE384DE0
	for <radiotap@netbsd.org>; Fri, 16 Oct 2020 20:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id 0wcBpRJgNNhn for <radiotap@netbsd.org>;
	Fri, 16 Oct 2020 20:20:39 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 949E784DDA
	for <radiotap@netbsd.org>; Fri, 16 Oct 2020 20:20:38 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94)
	(envelope-from <johannes@sipsolutions.net>)
	id 1kTWDM-0078rs-Cl; Fri, 16 Oct 2020 22:20:36 +0200
Message-ID: <3a082d1643fc5980ab1f11acda7e855c3eed60c7.camel@sipsolutions.net>
Subject: Re: [RFA] TX Flags field
From: Johannes Berg <johannes@sipsolutions.net>
To: Mathy Vanhoef <vanhoefm@gmail.com>, radiotap@netbsd.org
Date: Fri, 16 Oct 2020 22:20:35 +0200
In-Reply-To: <CAFXAJYydMGh+vT9-dVTRi82=pyp0xx4xSmTN023A6rOnW55bHA@mail.gmail.com>
References: 
	<CAFXAJYyXk+T1SZOjV0wBwfqsk4txMYEXajXmhvugW2ppcWVqtQ@mail.gmail.com>
	 <CAFXAJYydMGh+vT9-dVTRi82=pyp0xx4xSmTN023A6rOnW55bHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Sat, 2020-10-17 at 00:06 +0400, Mathy Vanhoef wrote:
> I think this can be adopted now?

Yes, looks like :-)

> In the meantime OpenBSD has also removed the "hardware_queue" that was
> conflicting with the bit number for the TX flags field, see
> https://marc.info/?l=openbsd-cvs&m=160223361331358&w=2 This means the
> following remark that the TX flags field clashes with OpenBSD does not
> have to be included anymore:
> 
> On Fri, Oct 9, 2020 at 2:28 PM Mathy Vanhoef <vanhoefm@gmail.com> wrote:
> > Used by NetBSD and Linux, clashes with ../hardware queue\_ as used in OpenBSD.

Nice :-)

I'm just about to go on vacation for a week, but if nobody else beats me
to it I'll make the appropriate changes when I return.

johannes

