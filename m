From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Wed, 10 Apr 2019 09:57:06 +0200
Message-ID: <6F1998DC-EFD2-4145-BD81-A80F9DC7ED2D__286.812269926884$1554887780$gmane$org@holtmann.org>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <46474c61d7748042cc0a1f23773186786020638e.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:NFC SUBSYSTEM" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Johannes,

>> FYI, there already was a discussion about GSMTAPv3:
>>=20
>> =
https://www.youtube.com/watch?v=3Dvum9jzavZi0&list=3DPL07C78AF831FFE8F9&in=
dex=3D10
>>=20
>> but unfortunately, nobody has invested time into this (yet?).
>=20
> 2012! But, umm, I don't really have time for a whole video right now -
> anyone have the slides? :-)
>=20
> But yeah, the first slides look sensible :-)
>=20
>>> 1) Why the design with encapsulating it in UDP?
>>=20
>> This gives us a possibility to "demux" multiple GSMTAP streams on the
>> receiving side, e.g. if you are running multiple processes.
>=20
> Not sure I get this, but I also don't really care all that much. It's
> just a pretty strange design if the kernel were to output this, I'm =
not
> even sure how I'd do that properly. I don't want to be generating UDP
> packets there...
>=20
> Perhaps we can define something (GSMTAPv3) to not really care how it's
> encapsulated, and for 'native' packet captures like what I want on =
Linux
> when integrated with the driver, actually use an ARPHDR_GSMTAP, and
> encapsulate in UDP when you create it in an application and want to =
send
> it elsewhere, rather than just writing it to a pcap file?

before you go all out and define this, it would suggest to understand =
what meta-data for the connection contexts you actually need as well. =
The data path itself is just a pipe and has not all the information =
attached with it. That goes via the control path and that is normally in =
user space and carries the real important information to make useful =
analysis of how the data path / context is setup.

=46rom what I am seeing right now is that unless you have a method to =
also feed the control path into your GSMTAPv3, then this is rather =
useless. The majority of the debugging is really done for the control =
path. For oFono that is OFONO_DEBUG=3D1 environment variable and while =
it works it is not the most elegant solution. I would love to feed that =
into a generic debugging / tap that you can read out later.

As a side note, for Bluetooth we created a path where the bluetoothd can =
feed back its control debugging data back into the Bluetooth monitor in =
the kernel to allow combined userspace, mgmt and HCI tracing. Some =
really nasty issues could only be triaged by having all the meta data =
with a common timestamp.

Regards

Marcel
