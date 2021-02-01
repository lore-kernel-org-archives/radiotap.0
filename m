Return-Path: <SRS0=k8pb=HD=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E25C433DB
	for <radiotap@archiver.kernel.org>; Mon,  1 Feb 2021 15:13:57 +0000 (UTC)
X-Greylist: delayed 635 seconds by postgrey-1.34 at mail.kernel.org; Mon, 01 Feb 2021 15:13:55 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2468A64E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2468A64E97
	for <radiotap@archiver.kernel.org>; Mon,  1 Feb 2021 15:13:53 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id E278784D9B; Mon,  1 Feb 2021 15:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id BDA7084D98
	for <radiotap@radiotap.org>; Mon,  1 Feb 2021 15:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=gmail.com
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id UufhT9YiiMGv for <radiotap@radiotap.org>;
	Mon,  1 Feb 2021 15:03:19 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 97C5884D3D
	for <radiotap@radiotap.org>; Mon,  1 Feb 2021 15:03:18 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kg20so24873417ejc.4
        for <radiotap@radiotap.org>; Mon, 01 Feb 2021 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tumHah+ZxE7iqIppq53YDCXaZJC1kfEhYrsGEMK7n8s=;
        b=lJ9g7vUlxeAOi0VnGJsB2/zNcFCrfJ2WkbLEL+1rFiipk0p2DqoZt2NlqeHITK/EIH
         DJiSpTxyTT92jr9YXfpijKt5MLsUaULsX3WuifmBWtDIAufCCiiq3rDv3GVET0RaGzBy
         B0OdtpEn1RyKYf14c5JLqe6Tci0OxmXgf8Tg7GrS7Bb4taeZ0r/MmaHUhnYsCLz7oUxD
         xaPGFYF41WgwXzeY1uRKhaKMihIXYggNyb0zOaCw1Y2UpjbtTvVhuleIBxSRThnh5Qq1
         a5SMWzEd5OIpslomkErz6/LJDMsrUDfix10M+T4XOWZdAXF5Z3UZdmnty4W/7jIM3h0l
         WhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=tumHah+ZxE7iqIppq53YDCXaZJC1kfEhYrsGEMK7n8s=;
        b=d05Js1PmfjmifjPTXSJ6gryfg5pUx5OsiSTHIiMm6TEDzTD1HnbXFR7HAwqY2KrTAZ
         QRbe+Gorba49COR+kq2Hh29uwxCamFSbcUadEh1TChoKb2ZzmnpfJnEZjnIDat9LI8dX
         Cy8rqDcJ7/6rw7JIC62X9tD6xxoq4AVxLQ4Ts8ZAAFYNn0kQXhZ/yJFXlSiiuF3hEmbm
         J87UZP4lI2PvFWfiarP91GBF/grn4OaVc6TqHzJSIfDxIk+1V/Z3rcqF94V8PFH8SeMW
         9jc6j7dsby06aF9lpb+L/2L9bUm1njQm1VUHdNrZqMWy535zWhVihmMm+UjmU7K6eP3M
         PxeQ==
X-Gm-Message-State: AOAM533Cd+HGuPAvumvDE7+dF5Dp6oG838SC+6x3B2O548lQakjGRxWp
	tCguk7RM7JtWizbJT8q6hfISAi/4/aoKy3cQcL1aYxtM
X-Google-Smtp-Source: ABdhPJywfwBDY0l+EwgM8QV0jvNYFFRK8j7ytlzRnS+lnNfA4SP0O+keo4KOYV9QSnpcgf6W5wJGPWrx6xe/k5eIKhI=
X-Received: by 2002:a17:906:27d7:: with SMTP id k23mr6656890ejc.300.1612191796525;
 Mon, 01 Feb 2021 07:03:16 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
In-Reply-To: <CACyXjPx40--VvxKhxbM1tekOcoXtpt-Cu7_KCPTk_+khfkQkHw@mail.gmail.com>
From: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Mon, 1 Feb 2021 07:00:21 -0800
Message-ID: <CACyXjPyjGPtEc=K=u7M5JHbFEq9FoR3tfbjowEicffcF3xrXjg@mail.gmail.com>
Subject: Re: A modified, and maybe final, proposal for an S1G header for RadioTap
To: radiotap@radiotap.org, Aaron Lee <jehun.lee@newracom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Sun, Apr 14, 2019 at 8:57 AM Richard Sharpe
<realrichardsharpe@gmail.com> wrote:
>
> Hi folks,
>
> Here is an updated proposal for this header.
>
> It has undergone some modifications.
>
> I include the patch to the radiotap git repo as well as a small C
> program for generating such headers.
>
> I have moved to using TLVs and have integrated Johannes' code for
> handling Radiotap RLVs into Wireshark 2.6.2 and used my test program
> to test the code.
>
> The test code only generates three frames so far, but it could be
> modified to provide broarder coverage.
>
> I suggest that people making Radiotap proposals in the future should
> also include code for generating such headers as it is pretty easy to
> do so and makes it easier for people writing parsers.
>
> We want to move forward with this and I have code now that dissects it
> in Wireshark. Of course, that code is easy to change as well.
>
> Here are the changes for the Channel field. Add three seemingly unused va=
lues:
>
> | 0x0002 | S1G 700MHz spectrum channel |
> | 0x0004 | S1G 800MHz spectrum channel |
> | 0x0008 | S1G 900MHz spectrum channel |
>
> Here is the new S1G field. It uses TLV Type value 32.
>
> Note, we have also explicitly decided to place the Null Data Packet
> (NDP) info into the S1G header. This reduces the amount of change
> needed in dissectors but it does mean that the zero_length_ppdu
> infrastructure that is already in Wireshark for example.
>
> TLV Type Number
> : 32
>
> Structure
> : u16 known, u16 data1, u16 data2, u8 ndp_type, u8[5] ndp_data;
>
> Required Alignment
> : 4
>
> Unit(s)
> : none
>
> The presence of this field indicates the frame was capture using an S1G p=
hy.
>
> This field contains data to allow correct handling by programs like
> Wireshark etc.
>
> Is NDP indicates that this is an NDP frame, however, the content might
> not be known.
>
> ## known
>
> | **`0x0001`** | S1G PPDU Format known |
> | **`0x0002`** | Response indication known |
> | **`0x0004`** | Guard interval known |
> | **`0x0008`** | NSS known |
> | **`0x0010`** | Bandwidth known |
> | **`0x0020`** | MCS known |
> | **`0x0040`** | Color known |
> | **`0x0080`** | Is NDP, which means no packet data follows this header! =
|
> | **`0x0100`** | NDP content known |
> | **`0xFE00`** | Reserved |
>
> ## data1
>
> | **`0x0003`** | S1G PPDU Format: 0=3DS1G_1M, 1=3DS1G_SHORT, 2=3DS1G_LONG=
 |
> | **`0x000C`** | Response indication: 0=3DNO_RESPONSE, 1=3DNDP_RESPONSE,
> 2=3DNORMAL_RESPONSE, 3=3DLONG_RESPPNSE |
> | **`0x0010`** | Reserved |
> | **`0x0020`** | Guard interval: 0=3DLong GI, 1=3DShort GI |
> | **`0x00C0`** | Number spatial streams: 0=3D1 Spatial stream, 1=3D2, ..
> 3=3D4 Spatial streams |
> | **`0x0700`** | Bandwidth: 0=3D1MHz, 1=3D2MHz, 2=3D4MHz, 3=3D8MHz, 4=3D1=
6MHz,
> 5-15 reserved |
> | **`0x0800`** | Reserved |
> | **`0xF000`** | MCS (MCS rate index, 0-10, 11-15 reserved) |
>
> ## data2
>
> | **`0x0007`** | Color: 0-7 |
> | **`0xFFF8`** | Reserved |
>
> ## ndp_type
>
> This value is only defined if ndp_known is true.
>
> | **ndp_type value** | **Meaning** |
> | 0x00 | NDP Control frame |
> | 0x01 | NDP Management Frame |
> | 0x02-0xFF | Reserved |
>
> ## ndp_data
>
> This value is only defined if ndp_known is true. The bytes are as
> defined in IEEE802.11ah, Section 9.9, except that ndp_data[4] is
> defined as:
>
> | **`0x3F`** | used and unused bits depending on the BW field and type |
> | **`0xC0`** | Bandwidth: 0 =3D 1Mhz, 1 =3D 2MHz, 2-3 Reserved |

Can we move forward and accept this? It's been over a year and I am
trying to get code merged with Wireshark that uses this proposal.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
