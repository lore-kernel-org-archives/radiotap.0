From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Wed, 25 Jun 2014 19:07:05 -0700
Message-ID: <636CB894-79D9-4CC3-B820-833761A9666D@alum.mit.edu>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net> <1373273952.8312.7.camel@jlt4.sipsolutions.net> <C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu> <1403679889.4140.2.camel@jlt4.sipsolutions.net> <20140625090901.fa121a689f823f3af1db1e3a@lm7.fr> <1403709105.4140.13.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1403709105.4140.13.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Matteo Cypriani <mcy-yxGd9NVxpOI@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


On Jun 25, 2014, at 8:11 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:

> On Wed, 2014-06-25 at 09:09 -0400, Matteo Cypriani wrote:
>=20
>> I observed the same on TP-Link TL-WDR3500 (which is also =
ath9k-based), and
>> assumed the signal in the first namespace was an average of the two =
others.
>> Should I understand this may be a wrong assumption?
>=20
> Ah, there's a value in the first part, without per-antenna information =
-
> that's the max of the per-antenna values.

In the capture for the ask.wireshark.org question, frame 2 has -67 dBm =
in the first part, -68 dBm for antenna 0, and -73 dBm for antenna 1; I =
don't know what version of the kernel the machine in question is =
running, so I don't know what version of the ath9k driver it's running, =
but that's not a max or min or even an average.

Perhaps somebody needs to gently remind the maintainers of the ath9k =
driver not to put an extra signal value into the radiotap header, lest =
they confuse users.

The radiotap header dissects as:

Frame 2: 66 bytes on wire (528 bits), 66 bytes captured (528 bits)
Radiotap Header v0, Length 38
    Header revision: 0
    Header pad: 0
    Header length: 38
    Present flags
        .... .... .... .... .... .... .... ...1 =3D TSFT: True
        .... .... .... .... .... .... .... ..1. =3D Flags: True
        .... .... .... .... .... .... .... .1.. =3D Rate: True
        .... .... .... .... .... .... .... 1... =3D Channel: True
        .... .... .... .... .... .... ...0 .... =3D FHSS: False
        .... .... .... .... .... .... ..1. .... =3D dBm Antenna Signal: =
True
        .... .... .... .... .... .... .0.. .... =3D dBm Antenna Noise: =
False
        .... .... .... .... .... .... 0... .... =3D Lock Quality: False
        .... .... .... .... .... ...0 .... .... =3D TX Attenuation: =
False
        .... .... .... .... .... ..0. .... .... =3D dB TX Attenuation: =
False
        .... .... .... .... .... .0.. .... .... =3D dBm TX Power: False
        .... .... .... .... .... 0... .... .... =3D Antenna: False
        .... .... .... .... ...0 .... .... .... =3D dB Antenna Signal: =
False
        .... .... .... .... ..0. .... .... .... =3D dB Antenna Noise: =
False
        .... .... .... .... .1.. .... .... .... =3D RX flags: True
        .... .... .... .0.. .... .... .... .... =3D Channel+: False
        .... .... .... 0... .... .... .... .... =3D HT information: =
False
        .... .... ...0 .... .... .... .... .... =3D A-MPDU Status: False
        .... .... ..0. .... .... .... .... .... =3D VHT information: =
False
        ...0 0000 00.. .... .... .... .... .... =3D Reserved: 0x00000000
        ..1. .... .... .... .... .... .... .... =3D Radiotap NS next: =
True
        .0.. .... .... .... .... .... .... .... =3D Vendor NS next: =
False
        1... .... .... .... .... .... .... .... =3D Ext: True
        .... .... .... .... .... .... .... ...0 =3D TSFT: False
        .... .... .... .... .... .... .... ..0. =3D Flags: False
        .... .... .... .... .... .... .... .0.. =3D Rate: False
        .... .... .... .... .... .... .... 0... =3D Channel: False
        .... .... .... .... .... .... ...0 .... =3D FHSS: False
        .... .... .... .... .... .... ..1. .... =3D dBm Antenna Signal: =
True
        .... .... .... .... .... .... .0.. .... =3D dBm Antenna Noise: =
False
        .... .... .... .... .... .... 0... .... =3D Lock Quality: False
        .... .... .... .... .... ...0 .... .... =3D TX Attenuation: =
False
        .... .... .... .... .... ..0. .... .... =3D dB TX Attenuation: =
False
        .... .... .... .... .... .0.. .... .... =3D dBm TX Power: False
        .... .... .... .... .... 1... .... .... =3D Antenna: True
        .... .... .... .... ...0 .... .... .... =3D dB Antenna Signal: =
False
        .... .... .... .... ..0. .... .... .... =3D dB Antenna Noise: =
False
        .... .... .... .... .0.. .... .... .... =3D RX flags: False
        .... .... .... .0.. .... .... .... .... =3D Channel+: False
        .... .... .... 0... .... .... .... .... =3D HT information: =
False
        .... .... ...0 .... .... .... .... .... =3D A-MPDU Status: False
        .... .... ..0. .... .... .... .... .... =3D VHT information: =
False
        ...0 0000 00.. .... .... .... .... .... =3D Reserved: 0x00000000
        ..1. .... .... .... .... .... .... .... =3D Radiotap NS next: =
True
        .0.. .... .... .... .... .... .... .... =3D Vendor NS next: =
False
        1... .... .... .... .... .... .... .... =3D Ext: True
        .... .... .... .... .... .... .... ...0 =3D TSFT: False
        .... .... .... .... .... .... .... ..0. =3D Flags: False
        .... .... .... .... .... .... .... .0.. =3D Rate: False
        .... .... .... .... .... .... .... 0... =3D Channel: False
        .... .... .... .... .... .... ...0 .... =3D FHSS: False
        .... .... .... .... .... .... ..1. .... =3D dBm Antenna Signal: =
True
        .... .... .... .... .... .... .0.. .... =3D dBm Antenna Noise: =
False
        .... .... .... .... .... .... 0... .... =3D Lock Quality: False
        .... .... .... .... .... ...0 .... .... =3D TX Attenuation: =
False
        .... .... .... .... .... ..0. .... .... =3D dB TX Attenuation: =
False
        .... .... .... .... .... .0.. .... .... =3D dBm TX Power: False
        .... .... .... .... .... 1... .... .... =3D Antenna: True
        .... .... .... .... ...0 .... .... .... =3D dB Antenna Signal: =
False
        .... .... .... .... ..0. .... .... .... =3D dB Antenna Noise: =
False
        .... .... .... .... .0.. .... .... .... =3D RX flags: False
        .... .... .... .0.. .... .... .... .... =3D Channel+: False
        .... .... .... 0... .... .... .... .... =3D HT information: =
False
        .... .... ...0 .... .... .... .... .... =3D A-MPDU Status: False
        .... .... ..0. .... .... .... .... .... =3D VHT information: =
False
        ...0 0000 00.. .... .... .... .... .... =3D Reserved: 0x00000000
        ..0. .... .... .... .... .... .... .... =3D Radiotap NS next: =
False
        .0.. .... .... .... .... .... .... .... =3D Vendor NS next: =
False
        0... .... .... .... .... .... .... .... =3D Ext: False
    MAC timestamp: 1789208778
    Flags: 0x10
        .... ...0 =3D CFP: False
        .... ..0. =3D Preamble: Long
        .... .0.. =3D WEP: False
        .... 0... =3D Fragmentation: False
        ...1 .... =3D FCS at end: True
        ..0. .... =3D Data Pad: False
        .0.. .... =3D Bad FCS: False
        0... .... =3D Short GI: False
    Data Rate: 1.0 Mb/s
    Channel frequency: 2412 [BG 1]
    Channel type: 802.11g (pure-g) (0x00c0)
        .... .... ...0 .... =3D Turbo: False
        .... .... ..0. .... =3D Complementary Code Keying (CCK): False
        .... .... .1.. .... =3D Orthogonal Frequency-Division =
Multiplexing (OFDM): True
        .... .... 1... .... =3D 2 GHz spectrum: True
        .... ...0 .... .... =3D 5 GHz spectrum: False
        .... ..0. .... .... =3D Passive: False
        .... .0.. .... .... =3D Dynamic CCK-OFDM: False
        .... 0... .... .... =3D Gaussian Frequency Shift Keying (GFSK): =
False
        ...0 .... .... .... =3D GSM (900MHz): False
        ..0. .... .... .... =3D Static Turbo: False
        .0.. .... .... .... =3D Half Rate Channel (10MHz Channel Width): =
False
        0... .... .... .... =3D Quarter Rate Channel (5MHz Channel =
Width): False
    SSI Signal: -67 dBm
    RX flags: 0x0000
        .... .... .... .... .... ..0. =3D Bad PLCP: False
    SSI Signal: -68 dBm
    Antenna: 0
    SSI Signal: -73 dBm
    Antenna: 1
IEEE 802.11 Null function (No data), Flags: ...P...TC
