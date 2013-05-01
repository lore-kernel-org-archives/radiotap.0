From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Re: Standardisation - adding 2 bit STBC and Ness to MCS
Date: Wed, 01 May 2013 16:34:21 +0200
Message-ID: <518127ED.9060900__40512.8046324991$1367418879$gmane$org@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org, simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org, johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org, Adrian Chadd <adrian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: "ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org" <ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: radiotap@radiotap.org

Hallo all,


> http://www.radiotap.org/suggested-fields/MCS%20extension%20for%20STBC%2=
0and%20Ness
>
> I have posted 3 patches on the proposal page (see Attachments):
>
> 1. A patch that applies to the Linux kernel v3.7-rc1 to collect the new
> STBC and Ness parameters from a wireless driver, and add them into the
> MCS radiotap field.
> 2. A patch to the Intel wireless driver in the kernel to collect STBC
> and Ness information.
> 3. A patch to wireshark to display STBC and Ness information.
>
> With this I believe we have everything needed to start the 3 week
> comment period.

There is a bit more then 3 week now. I would like to have this approved :=
)
Are there any thing needed to finish this?

Beside, i have one question about how STBC work. According to differnet=20
docs, i assume that:
- STBC is done by sending, at least, two stream with same data in=20
different order.
- It means for me, that real use of STBC can be made only on MIMO hardwar=
e.
- If 1x1 receiver indicates that it got STBC encoded frame, it dos not=20
meant, it would be able to use redundant data from second stream.
- There are fallowing STBC schemes: Alamouti=E2=80=99s
STBC for 2 transmit antennas and orthogonal STBC for 3 and 4 transmit=20
antennas.

According to this information, what do we call 1,2 or 3 stream STBC?
Since STBC should have minimal 2 stream, but in same time we have 1x1=20
and 2x2 hardware which able to receive and decode STBC stream i assume:
	- RX-STBC1 is for compatibility only. No data redundancy.
	- RX-STBC12 - can be used Alamouti=E2=80=99s schema with 2 streams. Most=
ly used=20
method.
	- RX-STBC123 - is orthogonal schema and not widely used method. Since=20
last method use wide spectrum to transmit data comparable to SISO=20
stream, it makes almost no sense. But 3-stream method get optimal error=20
corect in compare with 2 and 4 strea schemas.

Do this assumptions correct?

PS: My assumptions based on "MIMO Space-Time Block Coding (STBC):
Simulations and Results"
--=20
Regards,
Oleksij
