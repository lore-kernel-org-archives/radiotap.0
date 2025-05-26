Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F33C5B542
	for <radiotap@archiver.kernel.org>; Mon, 26 May 2025 06:54:48 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id 956C684DE0; Mon, 26 May 2025 06:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id 7306C84D84
	for <radiotap@netbsd.org>; Mon, 26 May 2025 06:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([127.0.0.1])
	by localhost (mail.netbsd.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id MG9PiCTkTWDv for <radiotap@netbsd.org>;
	Mon, 26 May 2025 06:54:46 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 4D5FD84CD9
	for <radiotap@netbsd.org>; Mon, 26 May 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=iTt14UTLGFCxqtOF06hgnUht/nVYSRkeF10chlk9kOE=;
	t=1748242486; x=1749452086; b=wBlBxB6p35FG4Wdo048Hb8B8pmm2aMpGze6oErt6netXlN0
	/3PNbjWioBCBke5VI+gCkusshH7DU7YrqmvfusstoFXblZn7NR8H66jlGzfjLTWLBSYLmk029BYaI
	AxKy9QeT97T7YebmyaPPJJsRvAFAkELEIjGpGwmWtAVI35isIHCRklfdlNFKlMAAVJ8GWrXAb2x9g
	Sa9aPbmlw+cwhRosO/qHkW8ySTC+sYuXXoDrSwX9Es/tcZ1eVIf/yjX8UdAJT8BHOkPVfds6LtbET
	XWwD2YpoY7YkpNy3H7pXXhik3p5+ikjA71KQKdU6d+gYUf+EMJSvFR10D5U2Mx+A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJRjL-0000000DCJu-42Ct;
	Mon, 26 May 2025 08:54:43 +0200
Message-ID: <6776b1cc7ab2ec5692adfc0db2f11b00bb7193ce.camel@sipsolutions.net>
Subject: Re: Proposed new channel flag (100kHz)
From: Johannes Berg <johannes@sipsolutions.net>
To: Adam Baumann <adam.baumann@morsemicro.com>, radiotap@netbsd.org
Date: Mon, 26 May 2025 08:54:39 +0200
In-Reply-To: <CANcD_5Cw__rxV4a2UDtoNAAKfY2320w1ovqH8G2z1MChvxzjnA@mail.gmail.com>
References: 
	<CANcD_5Cw__rxV4a2UDtoNAAKfY2320w1ovqH8G2z1MChvxzjnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Hi!

> I would like to propose a new flag for the channel field to allow the
> reporting of the frequency in units of 100kHz.
>=20
> A flag mask of 0x1000 would mean that the frequency is communicated in
> units of 100kHz instead of the current MHz.
>=20
> This is important for S1G as the center frequency can be at a 500kHz
> offset. For example in IEEE 80211ah channel 1 in the US the center
> frequency of 903.5 MHz. This is currently impossible to represent in a
> radiotap header. With this new flag the data could instead be
> represented as 9035 100kHz. Units of 100kHz were selected as it
> provides the accuracy required while not overflowing a u16.
>=20
> Please let me know your thoughts on this.

That seems questionable? Adding channel flags that will affect the
interpretation of existing values is just going to cause a mess where
everyone working with this has to identify whether or not they have
updated software etc.? Seems a bit messy.


We did add some flags with S1G before it seems:
https://www.radiotap.org/fields/Channel.html
However, I'll note that they're informational, i.e. they didn't really
change the interpretation of the value. Not sure why it was even done,
we probably should've just phased out the use of those flags instead.


Now, it seems perhaps the most natural place to put the frequency
could've been the S1G field:
https://www.radiotap.org/fields/S1G.html

Apparently we didn't? I have no idea why we wouldn't have ...


But the good thing is that the S1G field was defined to be generated as
a TLV, so where that's done we can simply add a u16 with the 100kHz
frequency to it, such as this:

diff --git a/fields/S1G.md b/fields/S1G.md
index 922c6e54c7dd..bf8cc1325974 100644
--- a/fields/S1G.md
+++ b/fields/S1G.md
@@ -8,6 +8,7 @@ TLV Type Number
=20
 Structure
 : u16 known, u16 data1, u16 data2
+: _u16 frequency [optional]_
=20
 Required Alignment
 : 2
@@ -30,7 +31,8 @@ Wireshark etc.
 | **`0x0020`** | MCS known |
 | **`0x0040`** | Color known |
 | **`0x0080`** | uplink indication known |
-| **`0xFF00`** | Reserved |
+| **`0x0800`** | frequency field present |
+| **`0xFE00`** | Reserved |
=20
 ## data1
=20
@@ -48,3 +50,9 @@ Wireshark etc.
 | **`0x0008`** | Uplink indication |
 | **`0x00F0`** | Reserved |
 | **`0xFF00`** | RSSI |
+
+## frequency
+
+This value can only be present if the S1G field is used as a TLV. In this =
case
+the `frequency field present` bit shall be set, and this 16-bit value cont=
ains
+the frequency in units of 100 kHz.


So that's a counter-proposal of sorts I guess, what do you think of
that? :)

johannes
