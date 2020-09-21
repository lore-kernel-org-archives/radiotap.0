Return-Path: <SRS0=1rHw=C6=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F683C4346E
	for <radiotap@archiver.kernel.org>; Mon, 21 Sep 2020 18:26:41 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC52920758
	for <radiotap@archiver.kernel.org>; Mon, 21 Sep 2020 18:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TOW7UgR3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC52920758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id A938B84DA1; Mon, 21 Sep 2020 18:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 8924084D26
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 18:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id tDIQjXxgwQJT for <radiotap@radiotap.org>;
	Mon, 21 Sep 2020 18:26:39 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id C658484CDF
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 18:26:38 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id n18so13298655qtw.0
        for <radiotap@radiotap.org>; Mon, 21 Sep 2020 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XgCD502xzcHaBOaymnjDL/71V9HJULAs0zTKWZfk65c=;
        b=TOW7UgR3ks53xgbXleSy2ASXPGbYjXFaxwA32gw4kaHaha44Cj3DM01jfbf4Yw6t7Q
         cKzmMjBy4dScYkI92PEZWIKieTYD1t4iMB7nt8XNJm3o5Yc88EAvBGdoTRRwt4dp0IBs
         7LJYdN3LusovTermwez23QNpkZqOqiKKHSuyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XgCD502xzcHaBOaymnjDL/71V9HJULAs0zTKWZfk65c=;
        b=BOUUG+eADjjjcGpnPGqqWJ0xshrHS03AdJPXkIjxj6+FGJIfrs7EECxYFgTx8MQNiY
         dRlSgO1BKbLesQ8oSFRnRfiLc6In2QSD/t6i2WKL6uZEqajdCppN4qCRrTZAtL5nDQmU
         KCm03QxwVVK4isD2eR6DDXVN2nYpp4vBYaLFutENr1diW3uaB2vi4Vvie58XdbBvNyJM
         f3AiFCa2twfUGxb/0iQRHZniII/zE7VFgsdipNED+MyPKPg6SdpH+aR9jgwvgnV4ZIpT
         vw5zVC499rWebjBTKEqdJ42WhqczU/obxe3Ct6OeIqoCDAqqXwDYfGHWgK/XP84JbixP
         TL9Q==
X-Gm-Message-State: AOAM532shrrqpQtD3TDFStJxMM7sgK3evYo3fM9s0wTjyYbQExr8grUp
	6AvuOPuIx1nYXCZPSBhz8KIXHvoVKhf9zzda
X-Google-Smtp-Source: ABdhPJz7TMaOrNQkyp7ZcdCp+lNVXU/C8IzYkciY5rCabgALbeOnjXEHwKLCa3hR41cjuzf7ZGROFA==
X-Received: by 2002:ac8:3175:: with SMTP id h50mr839914qtb.185.1600712797211;
        Mon, 21 Sep 2020 11:26:37 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id m24sm10452705qtn.59.2020.09.21.11.26.36
        for <radiotap@radiotap.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 11:26:36 -0700 (PDT)
Date: Mon, 21 Sep 2020 14:26:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: radiotap@radiotap.org
Subject: Re: Archival testing, please ignore
Message-ID: <20200921182634.33vbtuxqtb2c6zsd@chatter.i7.local>
References: <20200921171752.zs3ws37jhqlub5g7@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200921171752.zs3ws37jhqlub5g7@chatter.i7.local>
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Mon, Sep 21, 2020 at 01:17:52PM -0400, Konstantin Ryabitsev wrote:
> My apologies and please ignore this message. I am trying to track down 
> why the archive on lore.kernel.org/radiotap is not being updated.  
> Hopefully, tracking this message will help us narrow down the problem.

FYI, we tracked this down to the non-compliant List-ID header as set by 
mail.netbsd.org:

  List-Id: radiotap.NetBSD.org

According to RFC 2919, the value should always be inside angle brackets, 
so the way it is used above was resulting in an error. We've implemented 
workarounds for now, so hopefully this and all ensuing messages should 
get properly archived on lore.kernel.org.

Regards,
Konstantin
