Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC01C54EBD
	for <radiotap@archiver.kernel.org>; Thu, 12 Jan 2023 08:58:41 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id F276584D67; Thu, 12 Jan 2023 08:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id CFFF084C13
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 08:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id D7Losh5JcU_H for <radiotap@radiotap.org>;
	Thu, 12 Jan 2023 08:58:40 +0000 (UTC)
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 4A87D84D67
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 08:58:40 +0000 (UTC)
Received: from smtpclient.apple (173-228-4-18.dsl.dynamic.fusionbroadband.com [173.228.4.18])
	(authenticated bits=0)
	by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 30C8wdKt020571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Jan 2023 00:58:39 -0800
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Copy-and-paste error on the page for the "antenna noise" field?
From: Guy Harris <gharris@sonic.net>
In-Reply-To: <143aa6a90e85ce0e23e0ee01b67160c1853676f0.camel@sipsolutions.net>
Date: Thu, 12 Jan 2023 00:58:38 -0800
Cc: "radiotap@radiotap.org" <radiotap@radiotap.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <965F651B-6310-4B52-B12B-6F54785C1525@sonic.net>
References: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
 <af138b26bee9b940b50f8014fa330f3aefe87b4f.camel@sipsolutions.net>
 <6D2D4EA8-721A-4D2F-B12D-97501DAFF928@sonic.net>
 <143aa6a90e85ce0e23e0ee01b67160c1853676f0.camel@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Sonic-CAuth: UmFuZG9tSVaRPjKUBQ/MLPBVskGnn0rMYoDmu1HbG18/5bmVOuDwVlwC5VBMXdC/MjYKVx24U5hxMCAoMsakNqcxjQsckXwF
X-Sonic-ID: C;1oxNTleS7RGaG7ECP63e0g== M;+hl+TleS7RGaG7ECP63e0g==
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

On Jan 12, 2023, at 12:30 AM, Johannes Berg <johannes@sipsolutions.net> =
wrote:

> I don't know what adapter they're using to capture, but it _looks_ =
like
> mac80211 (with the per-antenna signal encoded that way),

Should that encoding scheme be documented, so as to encourage its use in =
other OS's 802.11 frameworks?

(My long to-do list includes adding support for per-antenna values in =
Wireshark's "radio information adaptation layer - the "802.11 radio =
information"  and supporting radiotap's encoding scheme as well as the =
schemes used by non-pcap/pcapng capture files.  That layer is intended =
to provide radio information in a metadata-format-independent form, with =
fewer metadata implementation details poking through, and additional =
information derived from the raw metadata.)=
