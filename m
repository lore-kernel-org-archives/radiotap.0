Return-Path: <SRS0=1rHw=C6=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BDEC43465
	for <radiotap@archiver.kernel.org>; Mon, 21 Sep 2020 17:17:59 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68CAA2085B
	for <radiotap@archiver.kernel.org>; Mon, 21 Sep 2020 17:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="icwQrnMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68CAA2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 43CF584DA4; Mon, 21 Sep 2020 17:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 2276B84D25
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 17:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id KGAW3Q9NSQAU for <radiotap@radiotap.org>;
	Mon, 21 Sep 2020 17:17:56 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 6692984CE9
	for <radiotap@radiotap.org>; Mon, 21 Sep 2020 17:17:56 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id o16so15913647qkj.10
        for <radiotap@radiotap.org>; Mon, 21 Sep 2020 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=F5BFsKwlEXI4DgOKz411HoOPiQt9Ws+j0KY0ALhjp9Q=;
        b=icwQrnMtfLsVfJl8g4KgJ52LdIrFf9Hx+aVMnlippZaz/XY7KPmsTCwOPNjdYH3yeM
         hx+jRbwnMm3xK/HiSUXVseFcUZEPw4dL/GXzHlChhUAtDrfuIegYLiuGVGN9jGdBzbDt
         0x0ioL7sBkGSH9jkDzCpFnzPRXDF/5h5OFFko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=F5BFsKwlEXI4DgOKz411HoOPiQt9Ws+j0KY0ALhjp9Q=;
        b=WGxmUUP+xYG2zuXKNedflJKJKlFjFPGP1BKrn/DdqYfLkM2rZtA6jfF9fUqA2GBJKG
         SeuzuCWMk9gCau5LHSfK3kVgI/uOzBw/ZVXboFLZsxstAC9/w0Sf1dkCAHezFv8pez3P
         w9Y7tkWmCDUDKVFJoeWsKzBOfFhc/VnqOE9dzuQuu14mKjHTSM6cqMPHmqKnQKROekvf
         sguPhdsJm0D0HAUseg0TxrZKUJWYPJ8WqAdStuXYBCw9K1TuFTtyPhOnGM+wlD0ofTYI
         DQFDwgEvzm5iTsEcANg+VOHHhTX6pSdrlMsZq3/XwpYIk7ETz5FgwjLrvnkwk/CJLfbp
         BALw==
X-Gm-Message-State: AOAM531DW3uCNY0eiQjSmtJ4aJRxJ1rh9BzlYA+23YyivTx/iKgclvcA
	WCy3EySUzrbP9Rwm1ULJ7/CsuZRvI/gQIfPb
X-Google-Smtp-Source: ABdhPJzoExD8VGGR6kMMUdPfm5+73gJr/K9WjlG/yEKvmwRqX+No/1zbRrxciWQpHUdEu91+/4fopg==
X-Received: by 2002:a37:a311:: with SMTP id m17mr843256qke.442.1600708675146;
        Mon, 21 Sep 2020 10:17:55 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id h68sm9680836qkf.30.2020.09.21.10.17.54
        for <radiotap@radiotap.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 10:17:54 -0700 (PDT)
Date: Mon, 21 Sep 2020 13:17:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: radiotap@radiotap.org
Subject: Archival testing, please ignore
Message-ID: <20200921171752.zs3ws37jhqlub5g7@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hello:

My apologies and please ignore this message. I am trying to track down 
why the archive on lore.kernel.org/radiotap is not being updated.  
Hopefully, tracking this message will help us narrow down the problem.

-K
