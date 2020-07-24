Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 5FC2384D7E
	for <radiotap@netbsd.org>; Fri, 24 Jul 2020 05:58:50 +0000 (UTC)
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id GQeCD1E5-1pj for <radiotap@netbsd.org>;
	Fri, 24 Jul 2020 05:58:49 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits)) (No client certificate
 requested) by mail.netbsd.org (Postfix) with ESMTPS id 6EEAC84D47 for
 <radiotap@netbsd.org>; Fri, 24 Jul 2020 05:58:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u12so4572016lff.2
        for <radiotap@netbsd.org>; Thu, 23 Jul 2020 22:58:49 -0700 (PDT)
MIME-Version: 1.0
From: Mathy Vanhoef <vanhoefm@gmail.com>
Date: Fri, 24 Jul 2020 09:58:35 +0400
Message-ID: <CAFXAJYyqgCqhMB0sEY4t5K-PcCe4G1O6Ef1NYCpK=eZcuntVvw@mail.gmail.com>
Subject: Proposed Tx flag: don't reorder frames
Content-Type: text/plain; charset="UTF-8"
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: radiotap@netbsd.org

Hello all,

I propose to add a DONT_REORDER bit to the existing TX flags field.
When this flag is set, injected frames shouldn't be reordered relative
to other frames that also have this flag set (even when these frames
have different QoS TID values).

This for example allows userspace to inject frames that have different
QoS TID fields while assuring that they are transmitted in the order
as they were injected. In practice this is useful to perform certain
experiments where the order of transmitted frames is important.

Concretely the proposal is to add the following Tx flag:

 |`0x0004` |Transmission used RTS/CTS handshake |
 |`0x0008` |Transmission shall not expect an ACK frame and not retry
when no ACK is received |
 |`0x0010` |Transmission includes a pre-configured sequence number
that should not be changed by the driver's TX handlers |
+|`0x0020` |Transmission should not be reordered relative to other
frames that have this flag set |

Proposed patches for Linux and some of its drivers can be found here:
https://lore.kernel.org/linux-wireless/20200724054724.105520-1-Mathy.Vanhoef@kuleuven.be/T/#t

Proposed change for wireshark which parses the Tx flags, including the
new don't order flag, is here:
https://code.wireshark.org/review/#/c/37944/

And a proposed update to scapy to recognize the don't order flag:
https://github.com/secdev/scapy/pull/2734

Note that on the radiotap website the TX flags field is still listed
under the "suggested fields" page, but I'm assuming that by now this
field is approved (since it's used in Linux)?

Best regards,
Mathy


