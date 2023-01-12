Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA745C54EBC
	for <radiotap@archiver.kernel.org>; Thu, 12 Jan 2023 04:27:44 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 6222184D25; Thu, 12 Jan 2023 04:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 3BDF884D0C
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 04:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id WN-NqcFZy5VU for <radiotap@radiotap.org>;
	Thu, 12 Jan 2023 04:27:42 +0000 (UTC)
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id AF5E984D09
	for <radiotap@radiotap.org>; Thu, 12 Jan 2023 04:27:42 +0000 (UTC)
Received: from smtpclient.apple (173-228-4-18.dsl.dynamic.fusionbroadband.com [173.228.4.18])
	(authenticated bits=0)
	by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 30C3GBxX007682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <radiotap@radiotap.org>; Wed, 11 Jan 2023 19:16:11 -0800
From: Guy Harris <gharris@sonic.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Copy-and-paste error on the page for the "antenna noise" field?
Message-Id: <DABC59B1-A8E0-4B1B-8B60-3F0C81772893@sonic.net>
Date: Wed, 11 Jan 2023 19:16:10 -0800
To: "radiotap@radiotap.org" <radiotap@radiotap.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Sonic-CAuth: UmFuZG9tSVYn1c2SZ9Cx2DAJ/vxnvjcKLSam2ZUu2XhEO5iX9oCKc6wOAkmWDBD2d1EluycR21d86z0n3BMn6QIkQJ18891v
X-Sonic-ID: C;onyjdieS7RGaG7ECP63e0g== M;NE/pdieS7RGaG7ECP63e0g==
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

The page for the "antenna noise" field, at

	http://www.radiotap.org/fields/Antenna%20noise.html

describes it as

	RF noise power at the antenna. This field contains a single =
signed 8-bit value, which indicates the RF signal power at the antenna, =
in decibels difference from 1mW.

It looks as if this was copied and pasted from the "antenna signal" =
page, with the first instance of "signal" replaced by noise, but the =
second instance left as "signal".=
