Return-Path: <SRS0=Wf2D=DQ=radiotap.org=bounces-radiotap-owner-radiotap=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0FC433DF
	for <radiotap@archiver.kernel.org>; Fri,  9 Oct 2020 10:28:25 +0000 (UTC)
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D15F2226B
	for <radiotap@archiver.kernel.org>; Fri,  9 Oct 2020 10:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH+TY7Gv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D15F2226B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 028DE84D8A; Fri,  9 Oct 2020 10:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id D5D0884D84
	for <radiotap@netbsd.org>; Fri,  9 Oct 2020 10:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=gmail.com
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id yfjbIH7pkVS1 for <radiotap@netbsd.org>;
	Fri,  9 Oct 2020 10:28:22 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id B8AD484D44
	for <radiotap@netbsd.org>; Fri,  9 Oct 2020 10:28:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f21so9097197ljh.7
        for <radiotap@netbsd.org>; Fri, 09 Oct 2020 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=RC9ma2LEB/BdUS6HKEkLEpuWseY+avbH7tjltKGM6ks=;
        b=bH+TY7Gv8wtAXrv2bZV2rBYeTFd4wBzU+ijpGxX/ESGxd7xU9geiH4pxO6CGPiTxcB
         j86TkLClkxr4IojKrF6HPMa2+Yv7xmU1JibQS/nvKKKx5tRbbsEkO4SGi7FN0EKVUkrE
         h1q2ym2b5gMfxyt/p+Gc2Jl2u9P8Jucd76BeF3GEmYvLknocaHBaTjNyhxCW6dfuV+l4
         UHqjsqhn3bfYowxqlqDIVrzEMwBWo5IcfjyUzJ9v07IKS6gqEhuaw6IlxC2IeU1K9lzi
         I9eVd9gJ3QnA8OuYC0AR2F81SQerHYajmKScq/mKq7vrF7uXNmlUfZ83S4o5bgPhligU
         rxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RC9ma2LEB/BdUS6HKEkLEpuWseY+avbH7tjltKGM6ks=;
        b=rrPkJGvvH1EASeM1LtPiwtTbZabxWjfJ0ZzvT+NtgB6NBbl2lAePHhXOyK5xUULkDY
         5uAFzRDDlTryhR4tXFeNGOeEwr2soPrJ3DwT18mNhygC7pAGxwD+Rgd7DpPoTzqnKq4g
         oBNunXltM4K03ui0aBPTD5kxN4hSl0CAYo2sSXouOu8pFWaEabbOP58fCHRGZiZ+4Oa0
         noolgOwphmvCTmre21yqJx5Wu66tOWEv+h3bCQCCL7502j+2deWajyp0nUxPeL89vhmm
         BFX1AahqJsNPzkdYFQfhSUGJqE48OY9YeC53J4oPbzNhQblCkB/IeC5Fq8JlnPOIZf9Z
         9LJg==
X-Gm-Message-State: AOAM533ZTZ7vip17vpJArvXmcDgWtW/ayw45UBEDYrhZj4M/iKvuyCkQ
	ixHYNTxd+lzFWSzp2Ovg/BS9ZSSOiZKv9Bjs1H7RTXuTyNgzew==
X-Google-Smtp-Source: ABdhPJznwwEc2Gp49O0ZpzlLU6qM1W6nEe0FeJbTvvwIFT+8YknejdxBlkX9YvCMKTNfv7RNxsqoWFnsDuDk2v36OLk=
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr5006669ljj.268.1602239299334;
 Fri, 09 Oct 2020 03:28:19 -0700 (PDT)
MIME-Version: 1.0
From: Mathy Vanhoef <vanhoefm@gmail.com>
Date: Fri, 9 Oct 2020 14:28:08 +0400
Message-ID: <CAFXAJYyXk+T1SZOjV0wBwfqsk4txMYEXajXmhvugW2ppcWVqtQ@mail.gmail.com>
Subject: [RFA] TX Flags field
To: radiotap@netbsd.org
Content-Type: text/plain; charset="UTF-8"
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi all,

This is a request for adoption of the TX flags field (including a
DONT_REORDER bit) as a follow-up to the previous RFC mail. The TX
flags field is currently a suggested but not officially adopted field.
It's already used by Linux and NetBSD.

The bit number for the TX flags field (15) clashes with the 'hardware
queue' field in OpenBSD. Although some OpenBSD drivers fill in this
hardware queue field, I didn't find any OpenBSD programs that seem to
use it. So I think that OpenBSD can update their radiotap definition
to use the TX flags field with little negative impact (correct me if
I'm wrong!).

Below is the concrete proposal. This corresponds to the previously
suggested but not yet adopted TX flags field, along with a DONT_REODER
bit. When the DONT_REORDER bit is set, injected frames shouldn't be
reordered relative to other frames that also have this flag set (even
when these frames have different QoS TID values). This for example
allows userspace to inject frames that have different QoS TID fields
while assuring that they are transmitted in the order as they were
injected. In practice, this is useful to perform certain experiments
where the order of transmitted frames is important.

Linux is already using the TX flags field apart from the DONT_REORDER bit.

Proposed patches for the DONT_REORDER bit and some Linux drivers can
be found here:
https://lore.kernel.org/linux-wireless/20200724054724.105520-1-Mathy.Vanhoef@kuleuven.be/T/

Already adopted change for wireshark which parses the Tx flags,
including the new don't order flag, is here:
https://code.wireshark.org/review/#/c/37944/

And a proposed update to scapy to recognize the don't order flag:
https://github.com/secdev/scapy/pull/2734

Best regards,
Mathy


---
title: TX flags
categories: [suggested]
---
Bit Number
: 15

Structure
: u16 flags

Required Alignment
: 2

Unit
: bitmap

Properties of transmitted frames.

|**mask** |**meaning** |
|`0x0001` |Transmission failed due to excessive retries |
|`0x0002` |Transmission used CTS-to-self protection |
|`0x0004` |Transmission used RTS/CTS handshake |
|`0x0008` |Transmission shall not expect an ACK frame and not retry
when no ACK is received |
|`0x0010` |Transmission includes a pre-configured sequence number that
should not be changed by the driver's TX handlers |
|`0x0020` |Transmission should not be reordered relative to other
frames that have this flag set |

Discussion
==========

Used by NetBSD and Linux, clashes with ../hardware queue\_ as used in OpenBSD.

The no-ack bit (0x0008) is used for uses of radiotap when frames are
sent. Similarly, the no-seq bit (0x0010) is used to allow userspace to
send frames with a specific sequence number (e.g. when transmitting
fragments of a single frame one-by-one). When it is set, the frame
should be transmitted with the sequence number included in the 802.11
MAC header of the frame as received from userspace, regardless of the
state of the sequence counters in driver/hardware. When the
DONT_REORDER bit (0x0020) is set, injected frames aren't reordered
relative to other frames that also have this bit set (even when these
frames have different QoS TID values).
