From: Doug Clements <dclements-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Missing Rate information
Date: Fri, 16 Aug 2013 08:10:58 -0400
Message-ID: <CADVNyRYzrnBLAsnvGsGhX3iTu4884JwAvRE1mAKj3h0Vt_a9yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001a11c2c674c26f5c04e40f7bb3
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

--001a11c2c674c26f5c04e40f7bb3
Content-Type: text/plain; charset=ISO-8859-1

Hi,
   I'm trying to hunt down why some wifi frames captured by tshark are
missing Rate information. Rate: False is set in the header for a portion of
frames that I'm getting, but not all. Furthermore, it's only on one channel
on my network, so I'm sure it's some specific device or packet type that
isn't getting processed correctly. At first I thought maybe they were MCS
frames so the Rate would show up in those fields, but that does not appear
to be the case.

I'm using libpcap-1.0.0-6.20091201git117cb5.el6.x86_64 and
wireshark-1.2.15-2.el6_2.1.x86_64

Where should I go to find out how or why this field doesn't get populated,
or am I mis-interpreting the fields somehow?

Here are some stats from a script I whipped up:
Attempting to sample 1000000 frames per channel in under 12000 seconds
Attempting to sample channels ['6', '11']

#------------------------------------------------------------
Starting channel 6
Number of frames seen on channel 6: 229531

Frame counts by data rate on channel 6:

1.0: 163580
2.0: 85
5.5: 241
6.0: 60
11.0: 648
12.0: 1019
18.0: 222
24.0: 28750
36.0: 1524
48.0: 2579
54.0: 30823
Frames with no rates attached on channel 6: 0

#------------------------------------------------------------
Starting channel 11
Number of frames seen on channel 11: 360164

Frame counts by data rate on channel 11:

1.0: 5941
2.0: 29734
5.5: 21025
6.0: 79879
11.0: 2784
12.0: 3904
18.0: 2050
24.0: 15143
36.0: 11009
48.0: 41163
54.0: 6452
Frames with no rates attached on channel 11: 141080

#------------------------------------------------------------

And here is a complete frame which is missing the Rate (data removed)
Frame 1 (1583 bytes on wire, 1583 bytes captured)
    Arrival Time: Aug 15, 2013 14:49:00.222060000
    [Time delta from previous captured frame: 0.000000000 seconds]
    [Time delta from previous displayed frame: 0.000000000 seconds]
    [Time since reference or first frame: 0.000000000 seconds]
    Frame Number: 1
    Frame Length: 1583 bytes
    Capture Length: 1583 bytes
    [Frame is marked: False]
    [Protocols in frame: radiotap:wlan:data]
Radiotap Header v0, Length 29
    Header revision: 0
    Header pad: 0
    Header length: 29
    Present flags: 0x0008482b
        .... .... .... .... .... .... .... ...1 = TSFT: True
        .... .... .... .... .... .... .... ..1. = Flags: True
        .... .... .... .... .... .... .... .0.. = Rate: False
        .... .... .... .... .... .... .... 1... = Channel: True
        .... .... .... .... .... .... ...0 .... = FHSS: False
        .... .... .... .... .... .... ..1. .... = DBM Antenna Signal: True
        .... .... .... .... .... .... .0.. .... = DBM Antenna Noise: False
        .... .... .... .... .... .... 0... .... = Lock Quality: False
        .... .... .... .... .... ...0 .... .... = TX Attenuation: False
        .... .... .... .... .... ..0. .... .... = DB TX Attenuation: False
        .... .... .... .... .... .0.. .... .... = DBM TX Attenuation: False
        .... .... .... .... .... 1... .... .... = Antenna: True
        .... .... .... .... ...0 .... .... .... = DB Antenna Signal: False
        .... .... .... .... ..0. .... .... .... = DB Antenna Noise: False
        .... .... .... .... .1.. .... .... .... = RX flags: True
        .... .... .... .0.. .... .... .... .... = Channel+: False
        0... .... .... .... .... .... .... .... = Ext: False
    MAC timestamp: 169482895
    Flags: 0x10
        .... ...0 = CFP: False
        .... ..0. = Preamble: Long
        .... .0.. = WEP: False
        .... 0... = Fragmentation: False
        ...1 .... = FCS at end: True
        ..0. .... = Data Pad: False
        .0.. .... = Bad FCS: False
        0... .... = Short GI: False
    Channel frequency: 2462 [BG 11]
    Channel type: 802.11g (0x0480)
        .... .... ...0 .... = Turbo: False
        .... .... ..0. .... = Complementary Code Keying (CCK): False
        .... .... .0.. .... = Orthogonal Frequency-Division Multiplexing
(OFDM): False
        .... .... 1... .... = 2 GHz spectrum: True
        .... ...0 .... .... = 5 GHz spectrum: False
        .... ..0. .... .... = Passive: False
        .... .1.. .... .... = Dynamic CCK-OFDM: True
        .... 0... .... .... = Gaussian Frequency Shift Keying (GFSK): False
        ...0 .... .... .... = GSM (900MHz): False
        ..0. .... .... .... = Static Turbo: False
        .0.. .... .... .... = Half Rate Channel (10MHz Channel Width): False
        0... .... .... .... = Quarter Rate Channel (5MHz Channel Width):
False
    SSI Signal: -58 dBm
    Antenna: 1
    RX flags: 0x0000
        .... .... .... .... .... ..0. = Bad PLCP: False
IEEE 802.11 QoS Data, Flags: .p.....TC
    Type/Subtype: QoS Data (0x28)
    Frame Control: 0x4188 (Normal)
        Version: 0
        Type: Data frame (2)
        Subtype: 8
        Flags: 0x41
            .... ..01 = DS status: Frame from STA to DS via an AP (To DS: 1
>From DS: 0) (0x01)
            .... .0.. = More Fragments: This is the last fragment
            .... 0... = Retry: Frame is not being retransmitted
            ...0 .... = PWR MGT: STA will stay up
            ..0. .... = More Data: No data buffered
            .1.. .... = Protected flag: Data is protected
            0... .... = Order flag: Not strictly ordered
    Duration: 36
    BSS Id: Cisco_09:a3:b0 (d0:57:4c:09:a3:b0)
    Source address: 48:02:2a:46:95:1e (48:02:2a:46:95:1e)
    Destination address: Pegatron_43:e7:8e (70:71:bc:43:e7:8e)
    Fragment number: 0
    Sequence number: 3371
    Frame check sequence: 0x35fff536 [correct]
        [Good: True]
        [Bad: False]
    QoS Control
        Priority: 0 (Best Effort) (Best Effort)
        ...0 .... = QoS bit 4: Bits 8-15 of QoS Control field are TXOP
Duration Requested
        Ack Policy: Normal Ack (0x00)
        Payload Type: MSDU
        TXOP Duration Requested: no TXOP requested (0)
    CCMP parameters
        CCMP Ext. Initialization Vector: 0x0000014F5D2D
        Key Index: 0
Data (1516 bytes)

0000  79 5e d4 73 19 dc f9 dd 53 9a 1b f4 7c c5 41 b5   y^.s....S...|.A.
...
05e0  04 80 77 69 24 0e 61 8b 4e e9 0f 92               ..wi$.a.N...
    Data: 795ED47319DCF9DD539A1BF47CC541B51BF7282429604675...
    [Length: 1516]

Thanks!

--Doug

--001a11c2c674c26f5c04e40f7bb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br></div>=A0=A0 I&#39;m trying to hunt =
down why some wifi frames captured by tshark are missing Rate information. =
Rate: False is set in the header for a portion of frames that I&#39;m getti=
ng, but not all. Furthermore, it&#39;s only on one channel on my network, s=
o I&#39;m sure it&#39;s some specific device or packet type that isn&#39;t =
getting processed correctly. At first I thought maybe they were MCS frames =
so the Rate would show up in those fields, but that does not appear to be t=
he case.<br>

<br></div><div>I&#39;m using libpcap-1.0.0-6.20091201git117cb5.el6.x86_64 a=
nd wireshark-1.2.15-2.el6_2.1.x86_64<br><br></div><div>Where should I go to=
 find out how or why this field doesn&#39;t get populated, or am I mis-inte=
rpreting the fields somehow?<br>

<br></div><div>Here are some stats from a script I whipped up:<br>Attemptin=
g to sample 1000000 frames per channel in under 12000 seconds<br>Attempting=
 to sample channels [&#39;6&#39;, &#39;11&#39;]<br><br>#-------------------=
-----------------------------------------<br>

Starting channel 6<br>Number of frames seen on channel 6: 229531<br><br>Fra=
me counts by data rate on channel 6:<br><br>1.0: 163580<br>2.0: 85<br>5.5: =
241<br>6.0: 60<br>11.0: 648<br>12.0: 1019<br>18.0: 222<br>24.0: 28750<br>

36.0: 1524<br>48.0: 2579<br>54.0: 30823<br>Frames with no rates attached on=
 channel 6: 0<br><br>#-----------------------------------------------------=
-------<br>Starting channel 11<br>Number of frames seen on channel 11: 3601=
64<br>

<br>Frame counts by data rate on channel 11:<br><br>1.0: 5941<br>2.0: 29734=
<br>5.5: 21025<br>6.0: 79879<br>11.0: 2784<br>12.0: 3904<br>18.0: 2050<br>2=
4.0: 15143<br>36.0: 11009<br>48.0: 41163<br>54.0: 6452<br>Frames with no ra=
tes attached on channel 11: 141080<br>

<br>#------------------------------------------------------------<br><br></=
div>And here is a complete frame which is missing the Rate (data removed)<b=
r>Frame 1 (1583 bytes on wire, 1583 bytes captured)<br>=A0=A0=A0 Arrival Ti=
me: Aug 15, 2013 14:49:00.222060000<br>

=A0=A0=A0 [Time delta from previous captured frame: 0.000000000 seconds]<br=
>=A0=A0=A0 [Time delta from previous displayed frame: 0.000000000 seconds]<=
br>=A0=A0=A0 [Time since reference or first frame: 0.000000000 seconds]<br>=
=A0=A0=A0 Frame Number: 1<br>

=A0=A0=A0 Frame Length: 1583 bytes<br>=A0=A0=A0 Capture Length: 1583 bytes<=
br>=A0=A0=A0 [Frame is marked: False]<br>=A0=A0=A0 [Protocols in frame: rad=
iotap:wlan:data]<br>Radiotap Header v0, Length 29<br>=A0=A0=A0 Header revis=
ion: 0<br>=A0=A0=A0 Header pad: 0<br>

=A0=A0=A0 Header length: 29<br>=A0=A0=A0 Present flags: 0x0008482b<br>=A0=
=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... .... ...1 =3D TSFT: True<b=
r>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... .... ..1. =3D Flags: =
True<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... .... .0.. =3D R=
ate: False<br>

=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... .... 1... =3D Channel: =
True<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... ...0 .... =3D F=
HSS: False<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... ..1. ....=
 =3D DBM Antenna Signal: True<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... =
.... .... .0.. .... =3D DBM Antenna Noise: False<br>

=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .... 0... .... =3D Lock Qual=
ity: False<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... ...0 .... ....=
 =3D TX Attenuation: False<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... ...=
. ..0. .... .... =3D DB TX Attenuation: False<br>

=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... .0.. .... .... =3D DBM TX At=
tenuation: False<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .... 1... ...=
. .... =3D Antenna: True<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... ...0 =
.... .... .... =3D DB Antenna Signal: False<br>

=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... ..0. .... .... .... =3D DB Antenn=
a Noise: False<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .... .1.. .... .... =
.... =3D RX flags: True<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .... .0.. .... .=
... .... .... =3D Channel+: False<br>=A0=A0=A0=A0=A0=A0=A0 0... .... .... .=
... .... .... .... .... =3D Ext: False<br>

=A0=A0=A0 MAC timestamp: 169482895<br>=A0=A0=A0 Flags: 0x10<br>=A0=A0=A0=A0=
=A0=A0=A0 .... ...0 =3D CFP: False<br>=A0=A0=A0=A0=A0=A0=A0 .... ..0. =3D P=
reamble: Long<br>=A0=A0=A0=A0=A0=A0=A0 .... .0.. =3D WEP: False<br>=A0=A0=
=A0=A0=A0=A0=A0 .... 0... =3D Fragmentation: False<br>=A0=A0=A0=A0=A0=A0=A0=
 ...1 .... =3D FCS at end: True<br>

=A0=A0=A0=A0=A0=A0=A0 ..0. .... =3D Data Pad: False<br>=A0=A0=A0=A0=A0=A0=
=A0 .0.. .... =3D Bad FCS: False<br>=A0=A0=A0=A0=A0=A0=A0 0... .... =3D Sho=
rt GI: False<br>=A0=A0=A0 Channel frequency: 2462 [BG 11]<br>=A0=A0=A0 Chan=
nel type: 802.11g (0x0480)<br>=A0=A0=A0=A0=A0=A0=A0 .... .... ...0 .... =3D=
 Turbo: False<br>

=A0=A0=A0=A0=A0=A0=A0 .... .... ..0. .... =3D Complementary Code Keying (CC=
K): False<br>=A0=A0=A0=A0=A0=A0=A0 .... .... .0.. .... =3D Orthogonal Frequ=
ency-Division Multiplexing (OFDM): False<br>=A0=A0=A0=A0=A0=A0=A0 .... ....=
 1... .... =3D 2 GHz spectrum: True<br>=A0=A0=A0=A0=A0=A0=A0 .... ...0 ....=
 .... =3D 5 GHz spectrum: False<br>

=A0=A0=A0=A0=A0=A0=A0 .... ..0. .... .... =3D Passive: False<br>=A0=A0=A0=
=A0=A0=A0=A0 .... .1.. .... .... =3D Dynamic CCK-OFDM: True<br>=A0=A0=A0=A0=
=A0=A0=A0 .... 0... .... .... =3D Gaussian Frequency Shift Keying (GFSK): F=
alse<br>=A0=A0=A0=A0=A0=A0=A0 ...0 .... .... .... =3D GSM (900MHz): False<b=
r>

=A0=A0=A0=A0=A0=A0=A0 ..0. .... .... .... =3D Static Turbo: False<br>=A0=A0=
=A0=A0=A0=A0=A0 .0.. .... .... .... =3D Half Rate Channel (10MHz Channel Wi=
dth): False<br>=A0=A0=A0=A0=A0=A0=A0 0... .... .... .... =3D Quarter Rate C=
hannel (5MHz Channel Width): False<br>=A0=A0=A0 SSI Signal: -58 dBm<br>

=A0=A0=A0 Antenna: 1<br>=A0=A0=A0 RX flags: 0x0000<br>=A0=A0=A0=A0=A0=A0=A0=
 .... .... .... .... .... ..0. =3D Bad PLCP: False<br>IEEE 802.11 QoS Data,=
 Flags: .p.....TC<br>=A0=A0=A0 Type/Subtype: QoS Data (0x28)<br>=A0=A0=A0 F=
rame Control: 0x4188 (Normal)<br>=A0=A0=A0=A0=A0=A0=A0 Version: 0<br>

=A0=A0=A0=A0=A0=A0=A0 Type: Data frame (2)<br>=A0=A0=A0=A0=A0=A0=A0 Subtype=
: 8<br>=A0=A0=A0=A0=A0=A0=A0 Flags: 0x41<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 .... ..01 =3D DS status: Frame from STA to DS via an AP (To DS: 1 From =
DS: 0) (0x01)<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .... .0.. =3D More Fragm=
ents: This is the last fragment<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .... 0... =3D Retry: Frame is not being r=
etransmitted<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ...0 .... =3D PWR MGT: ST=
A will stay up<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ..0. .... =3D More Data=
: No data buffered<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .1.. .... =3D Prote=
cted flag: Data is protected<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0... .... =3D Order flag: Not strictly or=
dered<br>=A0=A0=A0 Duration: 36<br>=A0=A0=A0 BSS Id: Cisco_09:a3:b0 (d0:57:=
4c:09:a3:b0)<br>=A0=A0=A0 Source address: 48:02:2a:46:95:1e (48:02:2a:46:95=
:1e)<br>=A0=A0=A0 Destination address: Pegatron_43:e7:8e (70:71:bc:43:e7:8e=
)<br>

=A0=A0=A0 Fragment number: 0<br>=A0=A0=A0 Sequence number: 3371<br>=A0=A0=
=A0 Frame check sequence: 0x35fff536 [correct]<br>=A0=A0=A0=A0=A0=A0=A0 [Go=
od: True]<br>=A0=A0=A0=A0=A0=A0=A0 [Bad: False]<br>=A0=A0=A0 QoS Control<br=
>=A0=A0=A0=A0=A0=A0=A0 Priority: 0 (Best Effort) (Best Effort)<br>

=A0=A0=A0=A0=A0=A0=A0 ...0 .... =3D QoS bit 4: Bits 8-15 of QoS Control fie=
ld are TXOP Duration Requested<br>=A0=A0=A0=A0=A0=A0=A0 Ack Policy: Normal =
Ack (0x00)<br>=A0=A0=A0=A0=A0=A0=A0 Payload Type: MSDU<br>=A0=A0=A0=A0=A0=
=A0=A0 TXOP Duration Requested: no TXOP requested (0)<br>

=A0=A0=A0 CCMP parameters<br>=A0=A0=A0=A0=A0=A0=A0 CCMP Ext. Initialization=
 Vector: 0x0000014F5D2D<br>=A0=A0=A0=A0=A0=A0=A0 Key Index: 0<br>Data (1516=
 bytes)<br><br>0000=A0 79 5e d4 73 19 dc f9 dd 53 9a 1b f4 7c c5 41 b5=A0=
=A0 y^.s....S...|.A.<br>...<br>05e0=A0 04 80 77 69 24 0e 61 8b 4e e9 0f 92=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ..wi$.a.N...<br>

=A0=A0=A0 Data: 795ED47319DCF9DD539A1BF47CC541B51BF7282429604675...<br>=A0=
=A0=A0 [Length: 1516]<br><br></div><div>Thanks!<br></div><div><br></div>--D=
oug<br></div>

--001a11c2c674c26f5c04e40f7bb3--
