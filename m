Return-Path: <SRS0=pIrv=HG=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27A3C433DB
	for <radiotap@archiver.kernel.org>; Thu,  4 Feb 2021 18:00:31 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F8264E16
	for <radiotap@archiver.kernel.org>; Thu,  4 Feb 2021 18:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F8264E16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 98675850DA; Thu,  4 Feb 2021 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 7129E850DB
	for <radiotap@radiotap.org>; Thu,  4 Feb 2021 18:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=gmail.com
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id FYE7yuqkC7Hm for <radiotap@radiotap.org>;
	Thu,  4 Feb 2021 18:00:28 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 7DA1584D2C
	for <radiotap@radiotap.org>; Thu,  4 Feb 2021 18:00:28 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hs11so6999490ejc.1
        for <radiotap@radiotap.org>; Thu, 04 Feb 2021 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+XZ+zy1nVstwtKk2JtTCUR3MFBRPF1ODJ921k8NOQRc=;
        b=BtvN0rw9R3ZFhBEAEJj7p1i6nM+9en7sxqL5oFd6f5DWGeX2BxXTUDIBGX+LTiwX9Y
         Ur00pQNvOexA9ewfC92zTxmpfBnCUZFLyqby1glOb6wu7PbRTOHTTFWP2Bv7WYbeYi35
         8P4q7syf1t1pP/1dWrbBC1EUjCd4KR3Sb+jvH13XFEjgLq61kFm4E0R0RuM4Mmn7NKH0
         +1+P8tXeRja5bVzJqWglW8GlOMmZyyNkmmCPTaVDdSUjljZNZO04hqhQPh31ObUsG0l3
         46fDeOxYL+PZmcr68cN6hG28IZ+LLc5vd416+fMpgTNiN/DpUOklKGqpkg3CwGKeSgzu
         weFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+XZ+zy1nVstwtKk2JtTCUR3MFBRPF1ODJ921k8NOQRc=;
        b=CR9yEtSblfQ0QcPjDno/5VzcF7u62GDcFEHTtRPUECMoFt+6/5pWTiP6DNRHFZFizG
         AHdQ2q+6dxxSjQ7Wj1ONcYl4NnpHL/N8AXIaeO6twqX5AjelB3Bdr9I+ZG5Uges39JnI
         pFzyWWtsVeU0HF7Kdw+yy4A0T/ajDnf+whPVbwNPFmKCLkd/0T7ssXpVmIKcoR/2nf76
         +ezG/vhZ/sP/r63YEc7anGkLvPxlKzd9IVuORS8rqk8oMx26Fxz+zu1lo+THtEGuiywh
         z17F/gpmk6jOJs3d8C0+sh9My4DprMXms+IB/wNDVfcV2FJIa2PMqmM2IQuLQvccHLmo
         VF5A==
X-Gm-Message-State: AOAM5314dsXYzTqUcR0QO7wgWysW+rlw4ZHUkMuHzA3M+H4gc5Mxeq0E
	YlLd/YpLbvUrkQIjaz3Tcf2/tYnABBY1Isivgvc=
X-Google-Smtp-Source: ABdhPJzrjlIYb+o7GgbGdOqsSUy+D3MAcR/Ez6hYQuVWQYRjvmBZtlZaH3P8A/9MFrEDVLF9fCUO2/VyDwg9l5C8JXw=
X-Received: by 2002:a17:906:27d7:: with SMTP id k23mr314323ejc.300.1612461622042;
 Thu, 04 Feb 2021 10:00:22 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
 <e1a3173d370aa96d004359f9e7061e89ee478165.camel@sipsolutions.net>
In-Reply-To: <e1a3173d370aa96d004359f9e7061e89ee478165.camel@sipsolutions.net>
From: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Thu, 4 Feb 2021 09:57:29 -0800
Message-ID: <CACyXjPwLCxaOa+1rjbeZoSG02KcePXdj83oPiFc58YcQfAqO2g@mail.gmail.com>
Subject: Re: A modified, and maybe final, proposal for an S1G header for RadioTap
To: Johannes Berg <johannes@sipsolutions.net>
Cc: radiotap@radiotap.org, Ray Wang <rwang@wi-fi.org>, 
	Aaron Lee <jehun.lee@newracom.com>, Tasheng Lin <tlin@wi-fi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Tue, Feb 2, 2021 at 1:00 PM Johannes Berg <johannes@sipsolutions.net> wr=
ote:
>
> Hi Richard,
>
> Couple of (last-minute!) comments ...
>
> > Structure
> > : u16 known, u16 data1, u16 data2, u8 ndp_type, u8[5] ndp_data;
> >
> > Required Alignment
> > : 4
>
> If you only have u16 data, what's the value of 4-byte alignment?

Good point.

> > Is NDP indicates that this is an NDP frame, however, the content might
> > not be known.
>
> Should that have a note that the zero-length PSDU field should be set?
> But if so, should that get a new sub-type for S1G NDP?

Hmmm, I need to look at that again in light of how the S1G NDP stuff played=
 out.

> Otherwise:
>
> > > **`0x0080`** | Is NDP, which means no packet data follows this header=
! |
>
> this overlaps?
>
> I guess it doesn't really matter though if that overlaps.

Will look at and fix.

> > > **`0x00C0`** | Number spatial streams: 0=3D1 Spatial stream, 1=3D2, .=
.
> > 3=3D4 Spatial streams |
>
> "Number of" I guess

OK. Will fix.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
