Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C1FC54EBD
	for <radiotap@archiver.kernel.org>; Thu, 12 Jan 2023 10:13:56 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 530FF84CEF; Thu, 12 Jan 2023 10:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 303E184CEA
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 10:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Yhfgez31JGh2 for <radiotap@radiotap.org>;
	Thu, 12 Jan 2023 10:13:54 +0000 (UTC)
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id A70C784CBC
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 10:13:54 +0000 (UTC)
Received: from smtpclient.apple (173-228-4-18.dsl.dynamic.fusionbroadband.com [173.228.4.18])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 30C8F2NQ009833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Jan 2023 00:15:03 -0800
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Copy-and-paste error on the page for the "antenna noise" field?
From: Guy Harris <gharris@sonic.net>
In-Reply-To: <af138b26bee9b940b50f8014fa330f3aefe87b4f.camel@sipsolutions.net>
Date: Thu, 12 Jan 2023 00:15:02 -0800
Cc: "radiotap@radiotap.org" <radiotap@radiotap.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6D2D4EA8-721A-4D2F-B12D-97501DAFF928@sonic.net>
References: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
 <af138b26bee9b940b50f8014fa330f3aefe87b4f.camel@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Sonic-CAuth: UmFuZG9tSVb4l4+7mk8X/yky6yAee5qvjkeY21stlHPk+7HeWvlBy+soJqEu/H/GH0WZPxoMrHkVIxriFOnxPifEitL/V4Gn
X-Sonic-ID: C;erXQNlGS7RGa6B1nR+6Zsg== M;9GMHN1GS7RGa6B1nR+6Zsg==
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Jan 11, 2023, at 11:46 PM, Johannes Berg <johannes@sipsolutions.net> =
wrote:

> Hm. Yeah, seems like? This is really old :-)

Yeah, I only noticed it when looking at, and copying and pasting text =
from, the ""antenna noise" page, to provide a comment on

	=
https://ask.wireshark.org/question/30268/how-to-get-noise-level-in-80211-h=
eaders-in-wireshark/

I infer, from the Wireshark dissection of the radiotap header, that =
their adapter, or the driver for it, provides only "antenna signal" =
information and no "antenna noise" information.=
