From: Anand Madhusoodanan <anandaragorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Help needed with Constructing radiotap header and ieee80211 header structures
Date: Sat, 9 Jun 2012 01:37:32 -0400
Message-ID: <8D50B2E8-3094-4A4B-B91A-6E32F9B0C04F@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: multipart/alternative; boundary="Apple-Mail=_3AACC99A-7052-4E07-B612-A7CD84B9E8B0"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--Apple-Mail=_3AACC99A-7052-4E07-B612-A7CD84B9E8B0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi ,
I need some help with a Wifi experiment i am trying to set up.
I am trying to communicate between two laptop machines using Wifi.=20

The structure of the radiotap header=20
and ieee80211 header i am using are

 struct ieee80211_radiotap_header {
unsigned char it_version;
uint16_t it_len;       =20
uint32_t it_present;
 };

 /* Structure for 80211 header */

 struct ieee80211_hdr_3addr {
    uint16_t frame_ctl[2];
    uint16_t duration_id;
    unsigned char addr1[ETH_ALEN];
    unsigned char addr2[ETH_ALEN];
    unsigned char addr3[ETH_ALEN];
    uint16_t seq_ctl;
  };

struct packet {
   struct ieee80211_radiotap_header rtap_header;
   struct ieee80211_hdr_3addr iee802_header;
   unsigned char payload[30];

  };

  /* In main program */

   struct packet mypacket;
   struct ieee80211_radiotap_header ratap_header;
   struct ieee80211_hdr_3addr iee802_header;

   unsigned char addr1[ETH_ALEN] =3D {0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};  =
/* broadcast address */
   unsigned char addr2[ETH_ALEN] =3D {0x28,0xcf,0xda,0xde,0xd3,0xcc};  =
/* mac address of  =20
                                                                      =
network card */
   unsigned char addr3[ETH_ALEN] =3D {0xd8,0xc7,0xc8,0xd7,0x9f,0x21};   =
/* mac address of  =20
                                                  access point i am =
trying to connect to */

  /* Radio tap header data */
   ratap_header.it_version =3D 0x00;
   ratap_header.it_len =3D 0x07;     =20
   ratap_header.it_present =3D  (1 << IEEE80211_RADIOTAP_RATE);

   mypacket.rtap_header =3D ratap_header;

   /* ieee80211 header data */

    iee802_header.frame_ctl[0] =3D IEEE80211_FC0_VERSION_0  |
                                                   =
IEEE80211_FC0_TYPE_MGT |=20
                                                    =
IEEE80211_FC0_SUBTYPE_BEACON;

   iee802_header.frame_ctl[1] =3DIEEE80211_FC1_DIR_NODS;
    strcpy(iee802_header.addr1,addr1);
    strcpy(iee802_header.addr2,addr2);
    strcpy(iee802_header.addr3,addr3);
    iee802_header.seq_ctl =3D 0x1086;

    mypacket.iee802_header=3Diee802_header;

   /* Payload */

   unsigned char payload[PACKET_LENGTH]=3D"temp";

   strcpy(mypacket.payload , payload);

I am able to receive the packets when i test the transmission=20
and reception on the same laptop. However i=20
am not able to receive the packet transmitted on a=20
different laptop. Wireshark does not show the packet=20
as well. Can you point out the mistake i am making?

Thanks and Regards,
Anand.


--Apple-Mail=_3AACC99A-7052-4E07-B612-A7CD84B9E8B0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><div =
style=3D"color: rgb(34, 34, 34); font-family: arial, sans-serif; =
font-size: 13px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: 2; =
text-align: -webkit-auto; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgba(255, 255, 255, 0.917969); ">Hi ,</div><pre =
style=3D"white-space: pre-wrap; color: rgb(34, 34, 34); font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: -webkit-auto; =
text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgba(255, 255, 255, 0.917969); ">I need some help with =
a Wifi experiment i am trying to set up.</pre><pre style=3D"white-space: =
pre-wrap; color: rgb(34, 34, 34); font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; =
text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgba(255, 255, 255, 0.917969); position: static; =
z-index: auto; ">I am trying to communicate between two laptop machines =
using Wifi.&nbsp;</pre><pre style=3D"white-space: pre-wrap; color: =
rgb(34, 34, 34); font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: 2; =
text-align: -webkit-auto; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, =
0.917969); position: static; z-index: auto; ">
The structure of the radiotap header=20
and ieee80211 header i am using are

 struct ieee80211_radiotap_header {
unsigned char it_version;
uint16_t it_len;       =20
uint32_t it_present;
 };

 /* Structure for 80211 header */

 struct ieee80211_hdr_3addr {
    uint16_t frame_ctl[2];
    uint16_t duration_id;
    unsigned char addr1[ETH_ALEN];
    unsigned char addr2[ETH_ALEN];
    unsigned char addr3[ETH_ALEN];
    uint16_t seq_ctl;
  };

struct packet {
   struct ieee80211_radiotap_header rtap_header;
   struct ieee80211_hdr_3addr iee802_header;
   unsigned char payload[30];

  };

  /* In main program */

   struct packet mypacket;
   struct ieee80211_radiotap_header ratap_header;
   struct ieee80211_hdr_3addr iee802_header;

   unsigned char addr1[ETH_ALEN] =3D =
{0xFF,0xFF,0xFF,0xFF,0xFF,<wbr>0xFF};  /* broadcast address */
   unsigned char addr2[ETH_ALEN] =3D =
{0x28,0xcf,0xda,0xde,0xd3,<wbr>0xcc};  /* mac address of  =20
                                                                      =
network card */
   unsigned char addr3[ETH_ALEN] =3D =
{0xd8,0xc7,0xc8,0xd7,0x9f,<wbr>0x21};   /* mac address of  =20
                                                  access point i am =
trying to connect to */

  /* Radio tap header data */
   ratap_header.it_version =3D 0x00;
   ratap_header.it_len =3D 0x07;     =20
   ratap_header.it_present =3D  (1 &lt;&lt; IEEE80211_RADIOTAP_RATE);

   mypacket.rtap_header =3D ratap_header;

   /* ieee80211 header data */

    iee802_header.frame_ctl[0] =3D IEEE80211_FC0_VERSION_0  |
                                                   =
IEEE80211_FC0_TYPE_MGT |=20
                                                    =
IEEE80211_FC0_SUBTYPE_BEACON;

   iee802_header.frame_ctl[1] =3DIEEE80211_FC1_DIR_NODS;
    strcpy(iee802_header.addr1,<wbr>addr1);
    strcpy(iee802_header.addr2,<wbr>addr2);
    strcpy(iee802_header.addr3,<wbr>addr3);
    iee802_header.seq_ctl =3D 0x1086;

    mypacket.iee802_header=3Diee802_<wbr>header;

   /* Payload */

   unsigned char payload[PACKET_LENGTH]=3D"temp";

   strcpy(mypacket.payload , payload);

I am able to receive the packets when i test the transmission=20
and reception on the same laptop. However i=20
am not able to receive the packet transmitted on a=20
different laptop. Wireshark does not show the packet=20
as well. Can you point out the mistake i am making?</pre><pre =
style=3D"white-space: pre-wrap; color: rgb(34, 34, 34); font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: -webkit-auto; =
text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgba(255, 255, 255, 0.917969); "><br></pre><pre =
style=3D"white-space: pre-wrap; color: rgb(34, 34, 34); font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: -webkit-auto; =
text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgba(255, 255, 255, 0.917969); ">Thanks and =
Regards,</pre><pre style=3D"white-space: pre-wrap; color: rgb(34, 34, =
34); font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
-webkit-auto; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgba(255, 255, 255, =
0.917969); ">Anand.</pre><div><br></div></body></html>=

--Apple-Mail=_3AACC99A-7052-4E07-B612-A7CD84B9E8B0--
