Return-Path: <SRS0=i3nQ=DX=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764BEC433E7
	for <radiotap@archiver.kernel.org>; Fri, 16 Oct 2020 20:07:06 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A5F20874
	for <radiotap@archiver.kernel.org>; Fri, 16 Oct 2020 20:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H72+84AP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A5F20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id C3A2384D6A; Fri, 16 Oct 2020 20:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 9FF8A84D58
	for <radiotap@netbsd.org>; Fri, 16 Oct 2020 20:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=gmail.com
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id FDgtA7a3MuqW for <radiotap@netbsd.org>;
	Fri, 16 Oct 2020 20:07:03 +0000 (UTC)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 9ED9E84D2F
	for <radiotap@netbsd.org>; Fri, 16 Oct 2020 20:07:02 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a9so4535715lfc.7
        for <radiotap@netbsd.org>; Fri, 16 Oct 2020 13:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=3AtVE7fxJKmNe5p+Jua/+B7K2rjXkI/T6dOmqUaZCzE=;
        b=H72+84APrE7OFanyDdH/uH8jn3+BB2HBlSSQN7CY6SMsOjUaSI5WLgWeXiJMeb9oJC
         e/dCsJPRmbxP2y6J/vFaWKLCkHanK5AKZ+FPJMB5SezRgcuoVvu94hX7gujZjvbnwpWo
         sXhsDFBoN/4FBQAjyvQJ1sfqIQ5t5e/yqRiPcQ7by+Kx8Dgd/tJn5fCphGWFfuxkCTMO
         1nQquMVZKJIkTX3UAheiHiRyXp5PRVQF9i0+jnPiiYHHEJiwwBAdyxMy+r/2OrKoS0T6
         3Tqp9EKPLsl2EY14/NiqmLD5RmhVj23w5EL0rwdYVlg4dxqDesHPVLILK4Z1Curjc2rb
         B15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=3AtVE7fxJKmNe5p+Jua/+B7K2rjXkI/T6dOmqUaZCzE=;
        b=MmYYttQ/ncPlIzXnSecV7URLFsw+AZRCnWoP2fIRRAgBu7buksOqdd6v3bZidnop63
         +PHMLJ9NWpw9fgepaKSxGFxClrF8qXSQp3MsoF4u5NPJ0/yKY9+VAh3e09DBkiQW5uID
         pNBt+XwktGwLSl2nNIhh5iTEKVRVufK9Fv4N2iakGTF16NvvqpbFrPFIyayWcE3yl+HE
         cha7zwdK3ZRSblrWYxtKh6oPNFb6HzdIfZCnZ2EFVxwwZV/6va0Pl4fmOhwGg3ua2HGc
         4ZOCcZbYxbdNbnSvgs+QQtNBEsPofL//ohX3BtHLUyYCkOx6Apy4l9zEc2yLEct+SFG1
         AEcQ==
X-Gm-Message-State: AOAM531sOYoOVhyooe3eT0p+1CQOMsrlfVwfaRFR7qTz1QMYY1EAl7vF
	k15mS1nd755I5xxVCD9YtCwv7fov6n6DC3BRERhSAsrQFz4Irw==
X-Google-Smtp-Source: ABdhPJw3ndxAt+LGA8rdogfjvixL8yISD1QpfZ08oU+/Rwk18rvwRAYN9pRW7U3J/BdW2CjSyAvrZek8kf7yZWfIATE=
X-Received: by 2002:a19:80d5:: with SMTP id b204mr1906048lfd.384.1602878820646;
 Fri, 16 Oct 2020 13:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFXAJYyXk+T1SZOjV0wBwfqsk4txMYEXajXmhvugW2ppcWVqtQ@mail.gmail.com>
In-Reply-To: <CAFXAJYyXk+T1SZOjV0wBwfqsk4txMYEXajXmhvugW2ppcWVqtQ@mail.gmail.com>
From: Mathy Vanhoef <vanhoefm@gmail.com>
Date: Sat, 17 Oct 2020 00:06:49 +0400
Message-ID: <CAFXAJYydMGh+vT9-dVTRi82=pyp0xx4xSmTN023A6rOnW55bHA@mail.gmail.com>
Subject: Re: [RFA] TX Flags field
To: radiotap@netbsd.org
Content-Type: text/plain; charset="UTF-8"
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

I think this can be adopted now?

In the meantime OpenBSD has also removed the "hardware_queue" that was
conflicting with the bit number for the TX flags field, see
https://marc.info/?l=openbsd-cvs&m=160223361331358&w=2 This means the
following remark that the TX flags field clashes with OpenBSD does not
have to be included anymore:

On Fri, Oct 9, 2020 at 2:28 PM Mathy Vanhoef <vanhoefm@gmail.com> wrote:
> Used by NetBSD and Linux, clashes with ../hardware queue\_ as used in OpenBSD.

Best regards,
Mathy
