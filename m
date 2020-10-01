Return-Path: <SRS0=54vy=DI=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042A2C4727C
	for <radiotap@archiver.kernel.org>; Thu,  1 Oct 2020 05:59:31 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DED8221E7
	for <radiotap@archiver.kernel.org>; Thu,  1 Oct 2020 05:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+vONuWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DED8221E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id D648184DE9; Thu,  1 Oct 2020 05:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id B70DA84D6D
	for <radiotap@netbsd.org>; Thu,  1 Oct 2020 05:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=gmail.com
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id i2upvstO1LFA for <radiotap@netbsd.org>;
	Thu,  1 Oct 2020 05:59:28 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id D41FB84D66
	for <radiotap@netbsd.org>; Thu,  1 Oct 2020 05:59:27 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y17so5059845lfa.8
        for <radiotap@netbsd.org>; Wed, 30 Sep 2020 22:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aVKUnQt7zr12GuZYWhbR0l2shV0VJqWeZJWzcbvVd4g=;
        b=E+vONuWWPnpkPYLBiZXTYeRW58fkiYype0y2/X3nRFhlyW0APPgAtEww6RlPI+QWpA
         JCH2hCR/MM0cYg+JQwfZBpz4no5B4+eF4zLFXKt+yEzJp9S4S2DXJbqVh5LRhik8mrUp
         CiRe9773PSZPKSWPeCY6ynhabb8iPFyTgzdJwTO+fGS/BB4rMTaT8tgWDjX/i5BDGhlO
         ENNfzjGWotnnNnLbfkz29WccszTfpO1wbjFRHB93B5bZYyXwraanN7Axhi5rVgbzMclz
         H6t0dIIAypa/HWXmKaS+tibIZBp2DTE58WVBd/8DKOU3QlYCy4MWz7VFnhXvt7xcV4kd
         9Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVKUnQt7zr12GuZYWhbR0l2shV0VJqWeZJWzcbvVd4g=;
        b=KHqzC20oJesavwzgI6FYBNhs/Sl+L7Q3SjDKc2S0PMyApZ0FqP0ysQw6eNs1WufG0B
         MLdslYaYkR4zreTqtdyeiS+K+eUTKzdDMM0RtCDrmJLf+PkV0rG2xu4UxdFIPshNZbQc
         x8H4zsDEUZnLKqkjXaMQ6ghDFFChB4kNB8g47gqVbB3IOTOaClEFXgPKXAajoYUxStIa
         2rsZlQ4xLxiTqsZxxNZqgPbdgLbNsd2zB6g6ukGr/NPV7jaSJLvh0w3v0vQkvGQkgqv9
         RKMn5APas6EQ8CnTZ9wcKaevXpVABofmO8X7Y2/vXfBEQAU3le/N7fBpzzk+di1v6mS9
         K+kw==
X-Gm-Message-State: AOAM5324DpuCSxZ3JTTzdvexMaPaMlNx2mZLyOmILjAHEAWHitaDVZbv
	lXoYa6tWAceHFgUZj1AZzTT36t9sBwO/qbQMZsl272AFqug=
X-Google-Smtp-Source: ABdhPJwYiTwfNKuPvIG+EepNuFWOkBlPM+fFFXgU9FXFJhi29OGSwtsY8zc2HaiRHZj0upmtl5G8Wfg/1XxcgDr1V2g=
X-Received: by 2002:a19:7f47:: with SMTP id a68mr1912163lfd.264.1601531966069;
 Wed, 30 Sep 2020 22:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAFXAJYyqgCqhMB0sEY4t5K-PcCe4G1O6Ef1NYCpK=eZcuntVvw@mail.gmail.com>
 <1f5e4f999c980e86ebec213b0b3bfcd9d22ede15.camel@sipsolutions.net>
 <CAFXAJYzsg+NB69NpeUHuiySMsC_h2yQTko3_4-23Msfj9YOBhA@mail.gmail.com> <82c52c849dace45d056dcb2b83c9be94b54f9ccb.camel@sipsolutions.net>
In-Reply-To: <82c52c849dace45d056dcb2b83c9be94b54f9ccb.camel@sipsolutions.net>
From: Mathy Vanhoef <vanhoefm@gmail.com>
Date: Thu, 1 Oct 2020 09:59:14 +0400
Message-ID: <CAFXAJYzCqDfopYogH9jc0vr1MZR0n+5MesEgPrbqXxHqNSj8yQ@mail.gmail.com>
Subject: Re: Proposed Tx flag: don't reorder frames
To: Johannes Berg <johannes@sipsolutions.net>
Cc: radiotap@netbsd.org
Content-Type: text/plain; charset="UTF-8"
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

> I think we need to make a proper proposal again for the whole TX flags
> field, since that was never officially adopted?

That makes sense, I'll send a new mail for that in the next day(s).
