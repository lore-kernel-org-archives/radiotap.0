Return-Path: <bounces-radiotap-owner-radiotap=archiver.kernel.org@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48AEC83F12
	for <radiotap@archiver.kernel.org>; Mon, 28 Aug 2023 14:34:28 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 605)
	id E339A84E71; Mon, 28 Aug 2023 14:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id C144184D93
	for <radiotap@radiotap.org>; Mon, 28 Aug 2023 14:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at netbsd.org
Authentication-Results: mail.netbsd.org (amavisd-new);
	dkim=pass (2048-bit key) header.d=sipsolutions.net
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id JV4EI3Q6OKmn for <radiotap@radiotap.org>;
	Mon, 28 Aug 2023 14:34:25 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 35FF184D39
	for <radiotap@radiotap.org>; Mon, 28 Aug 2023 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=76XAJsAgz7qcUR2Og9FDKakvl6VKclmODMWdYXirQuc=; t=1693233265; x=1694442865; 
	b=DdYlFRrxTF95t1fS4Eakh0TWl4LKz7sLKnYrbi0FXtI+N6ggxj6KF3FPIRvspEfRGRRiw+12wzv
	IMVYn8YAjxZnCbFXdzOgYBNO1IEt91fh9bNootSKcrQ7MZIZBFoupc9ugRK0aSbqhMZRWucTkLhob
	1PiA22mYuOQsBKAdFrK/5LygPd69Ka0wWPpdGTuAsYsM8ikHcpXPYMdWklpzU8xay0cJyb+kc1B21
	gfd1rtpI4OqTPs4XV4ftgwyS9eE6Qaje1J1uBFiUEoMS6Z4PWIiJGtZI3Iq745GjeU5grogEk8jLH
	7yxMPoXRQhbK8b3DB0/ak/9jdMqMadw1IP7Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qadJt-00GtRU-35
	for radiotap@radiotap.org;
	Mon, 28 Aug 2023 16:34:22 +0200
Message-ID: <0a24ce293e808b94f1057b68159d95ebffb8634e.camel@sipsolutions.net>
Subject: [RFA] EHT (and U-SIG as part of it)
From: Johannes Berg <johannes@sipsolutions.net>
To: radiotap@radiotap.org
Date: Mon, 28 Aug 2023 16:34:21 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.NetBSD.org>
Precedence: bulk
List-Unsubscribe: <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>

Time flies, it's been almost a year and a half! There were a few
adjustments along the way, but mostly this was proven with code in
wireshark / Linux and being used for tests.

I think nothing will really need to change here now, and given how
deeply ingrained this is now in the infrastructure, we probably can only
make editoral changes to it ...

johannes


---
title: U-SIG
categories: [suggested]
---
Type
: 33

Structure
: - u32 common
  - u32 value, mask

Required Alignment
: 4

Unit(s)
: none

This field indicates the (known) contents of the U-SIG.

Note that the common/value/mask fields are ordered in this way
so if they're all known, the U-SIG bits are all contiguous in
memory in the same way as over the air from bit 12 of the common
field to the end of the value field.

## common

| **`0x00000001`** | PHY version identifier known |
| **`0x00000002`** | BW known |
| **`0x00000004`** | UL/DL known |
| **`0x00000008`** | BSS Color known |
| **`0x00000010`** | TXOP known |
| **`0x00000020`** | bad U-SIG CRC |
| **`0x00000040`** | validate bits checked |
| **`0x00000080`** | validate bits OK |
| **`0x00000f00`** | (reserved) |
| **`0x00007000`** | PHY version identifier |
| **`0x00038000`** | BW |
| **`0x00040000`** | UL/DL |
| **`0x01f80000`** | BSS Color |
| **`0xfe000000`** | TXOP |

Note: If the "bad U-SIG CRC" bit is set, the [RX flags](/fields/RX flags)
field should indicate PLCP CRC check failed as well, this bit just serves
to differentiate where the CRC check failed.

## value / mask

Contains a known mask and value for the remaining U-SIG bits
that can only be interpreted depending on the PHY version.

The bits are in the on-air order, i.e. U-SIG-1 `B20-25` followed
by U-SIG-2 `B0-25`. Thus, U-SIG-1 `B20-25` are in `mask` and
`value` bits `0x0000003f`.

Dissectors should show these per spec, in a PHY version specific
namespace (e.g. "U-SIG::EHT::PPDU-Type-And-Compression-Mode").

For the only currently defined version (PHY Version identifier 0
for EHT), the bits are shown in the following tables:

### EHT MU PPDU U-SIG contents

An EHT PPDU is an EHT MU PPDU if
* the UL/DL field is set to 0 and the PPDU Type And Compression Mode field =
is set to 0, 1 or 2;
* the UL/DL field is set to 1 and the PPDU Type And Compression Mode field =
is set to 1.

| **bits**         | **U-SIG reference** | **Content** |
| **`0x0000001f`** | `U-SIG-1 B20-B24`   | Disregard (all ones) |
| **`0x00000020`** | `U-SIG-1 B25`       | Validate (must be 1) |
| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
| **`0x00000100`** | `U-SIG-2 B2`        | Validate (must be 1) |
| **`0x00003e00`** | `U-SIG-2 B3-B7`     | Punctured Channel Information |
| **`0x00004000`** | `U-SIG-2 B8`        | Validate (must be 1) |
| **`0x00018000`** | `U-SIG-2 B9-B10`    | EHT-SIG MCS |
| **`0x003e0000`** | `U-SIG-2 B11-B15`   | Number Of EHT-SIG Symbols |
| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` t=
o `U-SIG-2 B15`) |
| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |

### EHT TB PPDU U-SIG contents

An EHT PPDU is a EHT TB PPDU if
* the UL/DL field is set to 1 and the PPDU Type And Compression Mode field =
is set to 0.

| **bits**         | **U-SIG reference** | **Content** |
| **`0x0000003f`** | `U-SIG-1 B20-B25`   | Disregard (all ones) |
| **`0x000000c0`** | `U-SIG-2 B0-B1`     | PPDU Type And Compression Mode |
| **`0x00000100`** | `U-SIG-2 B2`        | Validate (must be 1) |
| **`0x00001e00`** | `U-SIG-2 B3-B6`     | Spatial Reuse 1 |
| **`0x0001e000`** | `U-SIG-2 B7-B10`    | Spatial Reuse 2 |
| **`0x003e0000`** | `U-SIG-2 B11-B15`   | Disregard (...) |
| **`0x03c00000`** | `U-SIG-2 B16-B19`   | CRC (for the bits `U-SIG-1 B0` t=
o `U-SIG-2 B15`) |
| **`0xfc000000`** | `U-SIG-2 B20-B25`   | Tail (must be 0) |






---
title: EHT
categories: [suggested]
---
Type
: 34

Structure
: - u32 known
  - u32 data[9]
  - u32 user_info[] (Note this is variable length)

Required Alignment
: 4

Unit(s)
: none

## known

Note that for trigger-based (TB) PPDUs, the EHT-SIG isn't present over the
air as all the information for each station is provided in the trigger
frame. Sniffer should - where possible - provide a subset of the OFDMA
related fields to simplify understanding of the resulting capture (i.e. to
be able to read it without having to go back to the prior trigger frame.)

| **bits**         | **OFDMA (including TB)** | **MU-MIMO** | **EHT soundin=
g** |
| **`0x00000001`** | (reserved) | (reserved) | (reserved) |
| **`0x00000002`** | Spatial Reuse Known | (same) | (same) |
| **`0x00000004`** | GI (Guard Interval) Known | (same) | (same) |
| **`0x00000008`** | (reserved) | (reserved) | (reserved) |
| **`0x00000010`** | number of LTF symbols Known | (same) | (same) |
| **`0x00000020`** | LDPC Extra Symbol Segment Known | (same) | (reserved) =
|
| **`0x00000040`** | Pre-FEC Padding Factor Known | (same) | (reserved) |
| **`0x00000080`** | PE Disambiguity Known | (same) | (reserved) |
| **`0x00000100`** | Disregard Known | (same) | (reserved) |
| **`0x00000200`** | (reserved) | (reserved) | Disregard Known |
| **`0x00001c00`** | (reserved) | (reserved) | (reserved) |
| **`0x00002000`** | CRC1 Known | (same) | (same) |
| **`0x00004000`** | Tail1 Known | (same) | (same) |
| **`0x00008000`** | CRC2 Known | (reserved) | (reserved) |
| **`0x00010000`** | Tail2 Known | (reserved) | (reserved) |
| **`0x00020000`** | (reserved) | (reserved) | NSS Known |
| **`0x00040000`** | (reserved) | (reserved) | Beamformed Known |
| **`0x00080000`** | (reserved) | Number Of Non-OFDMA Users Known | (reserv=
ed) |
| **`0x00100000`** | (reserved) | User Encoding Block CRC Known | (reserved=
) |
| **`0x00200000`** | (reserved) | User Encoding Block Tail Known | (reserve=
d) |
| **`0x00400000`** | RU/MRU Size Known | (same) | (reserved) |
| **`0x00800000`** | RU/MRU Index Known | (same) | (reserved) |
| **`0x01000000`** | RU Allocation (TB format) Known | (same) | (reserved) =
|
| **`0x02000000`** | Primary 80 MHz Channel Position known | (same) | (same=
) |
| **`0xfc000000`** | (reserved) | (reserved) | (reserved) |

Note: The "RU/MRU Size" and "RU/MRU Index" fields are provided for sniffers
that cannot provide the entirety of the RU allocations and user information
fields (which would allow knowing exactly which AID got which RU allocation=
),
but can only provide a subset of the information. They apply only to the
captured AID. It's advantageous to provide this even when all the RU
Allocaction and User Information fields are known, so the display tool need
not parse all of them.

Some values here could also appear for non-OFDMA PPDUs.

## data[0]

| **bits**         | **meaning** |
| **`0x00000007`** | (reserved) |
| **`0x00000078`** | Spatial Reuse |
| **`0x00000180`** | GI (0=3D0.8us, 1=3D1.6us, 2=3D3.2us, 3=3Dreserved) |
| **`0x00000600`** | LTF symbol size (0=3Dunknown, 1=3D1x, 2=3D2x, 3=3D4x) =
|
| **`0x00003800`** | number of LTF symbols (0=3D1x, 1=3D2x, 2=3D4x, 3=3D6x,=
 4=3D8x, 5-7=3Dreserved) |
| **`0x00004000`** | LDPC extra symbol segment |
| **`0x00018000`** | Pre-FEC padding factor |
| **`0x00020000`** | PE Disambiguity |
| **`0x000c0000`** | Disregard (EHT sounding) |
| **`0x00300000`** | (reserved) (EHT sounding) |
| **`0x003c0000`** | Disregard (non EHT sounding) |
| **`0x03c00000`** | CRC1 (OFDMA: B0-16+9N, EHT sounding: B0-15, non-OFDMA:=
 B0-41) |
| **`0xfc000000`** | Tail1 |

## data[1]

| **bits** | **meaning** |
| **`0x0000001f`** | RU/MRU Size (0: 26, 1: 52, 2: 106, 3: 242, 4: 484, 5: =
996, 6: 2x996, 7: 4x996, 8: 52+26, 9: 106+26, 10: 484+242, 11: 996+484, 12:=
 996+484+242, 13: 2x996+484, 14: 3x996, 15: 3x996+484) |
| **`0x00001fe0`** | RU/MRU Index (see IEEE 802.11be Draft 1.3 section 36.3=
.2 "Subcarrier and resource allocation") |
| **`0x003fe000`** | RU Allocation 1 |
| **`0x00400000`** | RU Allocation 1 known |
| **`0x3f000000`** | (reserved) |
| **`0xc0000000`** | Primary 80 MHz Channel Position (0: lowest, 3: highest=
 in frequency)|

Note: The RU/MRU Size and RU/MRU Index are calculated fields, ideally the
sniffer should provide them for all OFDMA and punctured non-OFDMA PPDUs to
simplify filtering and other data uses.

Note: The Primary 80 MHz channel position is numbered from low frequency to
high frequency. Also note that it is required in order to decode the "RU
Allocation (TB format)" field, since the decoding thereof requires doing th=
e
table lookup from 802.11be Table 9-53b (Lookup table for X1 and N) to have
the correct values for interpretation of 802.11be Table 9-53a (Encoding of
PS160 and RU Allocation subfields in an EHT variant User Info field).

## data[2]-data[6]

| **bits** | **meaning** |
| **`0x000001ff`** | RU Allocation X |
| **`0x00000200`** | RU Allocation X known |
| **`0x0007fc00`** | RU Allocation (X + 1) |
| **`0x00080000`** | RU Allocation (X + 1) known |
| **`0x1ff00000`** | RU Allocation (X + 2) |
| **`0x20000000`** | RU Allocation (X + 2) known |
| **`0xc0000000`** | (reserved) |

### RU Allocation field order

Together with the "RU Allocation 1" field from data[1], the RU Allocation
fields shall be in the following order:

| RU Allocation                        | 20MHz | 40MHz | 80MHz | 160MHz | 3=
20MHz |
| :---                                 | :---: | :---: | :---: |  :---: |  =
:---: |
| Content Channel 1 RU Allocation 1::1 |     X |     X |     X |      X |  =
    X |
| Content Channel 2 RU Allocation 1::1 |     - |     X |     X |      X |  =
    X |
| Content Channel 1 RU Allocation 1::2 |     - |     - |     X |      X |  =
    X |
| Content Channel 2 RU Allocation 1::2 |     - |     - |     X |      X |  =
    X |
| Content Channel 1 RU Allocation 2::1 |     - |     - |     - |      X |  =
    X |
| Content Channel 2 RU Allocation 2::1 |     - |     - |     - |      X |  =
    X |
| Content Channel 1 RU Allocation 2::2 |     - |     - |     - |      X |  =
    X |
| Content Channel 2 RU Allocation 2::2 |     - |     - |     - |      X |  =
    X |
| Content Channel 1 RU Allocation 2::3 |     - |     - |     - |      - |  =
    X |
| Content Channel 2 RU Allocation 2::3 |     - |     - |     - |      - |  =
    X |
| Content Channel 1 RU Allocation 2::4 |     - |     - |     - |      - |  =
    X |
| Content Channel 2 RU Allocation 2::4 |     - |     - |     - |      - |  =
    X |
| Content Channel 1 RU Allocation 2::5 |     - |     - |     - |      - |  =
    X |
| Content Channel 2 RU Allocation 2::5 |     - |     - |     - |      - |  =
    X |
| Content Channel 1 RU Allocation 2::6 |     - |     - |     - |      - |  =
    X |
| Content Channel 2 RU Allocation 2::6 |     - |     - |     - |      - |  =
    X |

## data[7]

| **bits** | **meaning** |
| **`0x0000000f`** | CRC2 (OFDMA only: for RU Allocation-2) |
| **`0x000003f0`** | Tail2 (OFDMA only: after RU Allocation-2) |
| **`0x00000c00`** | (reserved) |
| **`0x0000f000`** | NSS (EHT sounding) |
| **`0x00010000`** | Beamformed (EHT sounding) |
| **`0x000e0000`** | Number Of Non-OFDMA Users |
| **`0x00f00000`** | User Encoding Block CRC |
| **`0x3f000000`** | User Encoding Block Tail |
| **`0xc0000000`** | (reserved) |

## data[8]

| **bits** | **meaning** |
| **`0x00000001`** | RU Allocation (TB format): PS 160 |
| **`0x00000002`** | RU Allocation (TB format): B0 |
| **`0x000001fc`** | RU Allocation (TB format): B7--B1 |
| **`0xfffffe00`** | (reserved) |

Note: the `0x1ff` bits here indicate the RU Allocation for the captured
station (AID) in the trigger-based (TB) format, per Table 9-53a "Encoding o=
f
PS160 and RU Allocation subfields in an EHT variant User Info field". This
may be given by the sniffer even for downlink OFDMA PPDUs if calculated fro=
m
the RU Allocation from EHT-SIG for the given station. Note the bit split to
ease cross-referencing Table 9-53a.

## `user_info` entry

Each `user_info` entry carries information for a given user entry
in the EHT preamble. If multiple user fields are captured, ideally
all of them are, and they should be given in the same order as they
were ordered in the frame.

Note that to simplify parsing we indicate non-MU-MIMO (e.g. OFDMA) and
MU-MIMO information via separate known bits, so that parsers can show
these fields without consulting other information to know the PPDU type.

The "Data captured for this user" bit indicates which user the data was
captured for that this radiotap header is attached to. It should be set
for exactly one `user_info` entry in the entire radiotap header, even if
potentially the entire EHT field is given multiple times.

| **bits**         | **non-MU-MIMO** | **MU-MIMO** |
| **`0x00000001`** | STA-ID known | (same) |
| **`0x00000002`** | MCS known | (same) |
| **`0x00000004`** | Coding known | (same) |
| **`0x00000008`** | Reserved known | (reserved) |
| **`0x00000010`** | NSS known | (reserved) |
| **`0x00000020`** | Beamforming known | (reserved) |
| **`0x00000040`** | (reserved) | Spatial Configuration known |
| **`0x00000080`** | Data captured for this user | (same) |
| **`0x0007ff00`** | STA-ID | (same) |
| **`0x00080000`** | Coding | (same) |
| **`0x00f00000`** | MCS | (same) |
| **`0x0f000000`** | NSS | (overlap) |
| **`0x10000000`** | Reserved | (overlap) |
| **`0x20000000`** | Beamforming | (overlap) |
| **`0x3f000000`** | (overlap) | Spatial Configuration |
| **`0xc0000000`** | (reserved) | (reserved) |


