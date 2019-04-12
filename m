From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: gsmtap design/extensions?
Date: Fri, 12 Apr 2019 21:49:42 +0200
Message-ID: <D4D12CF9-9CE5-46FB-9738-F89DB6B6F9EA__48093.3594446228$1555098595$gmane$org@holtmann.org>
References: <cf07ae24c436f92769f9289d208f01846ebe8826.camel@sipsolutions.net>
 <CAPEnp=bHTVARr7WA9Qkq4=y7kk8_FLWhrkqKOEXubMO4X=BHCw@mail.gmail.com>
 <46474c61d7748042cc0a1f23773186786020638e.camel@sipsolutions.net>
 <6F1998DC-EFD2-4145-BD81-A80F9DC7ED2D@holtmann.org>
 <1d64c578cd5b254d301cf1cac82f32a062916888.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1d64c578cd5b254d301cf1cac82f32a062916888.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Vadim Yanitskiy <axilirator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, OpenBSC Mailing List <openbsc-qjLDD68F18N4m7O/Vxda39i2O/JbrIOy@public.gmane.org>, Sean Tranchetti <stranche-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:NFC SUBSYSTEM" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Aleksander Morgado <aleksander-Dvg4H30XQSRVIjRurl1/8g@public.gmane.org>, Subash Abhinov Kasiviswanathan <subashab-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Johannes,

>> before you go all out and define this, it would suggest to understand
>> what meta-data for the connection contexts you actually need as well.
>> The data path itself is just a pipe and has not all the information
>> attached with it. That goes via the control path and that is normally
>> in user space and carries the real important information to make
>> useful analysis of how the data path / context is setup.
>=20
> Yes, that's true, though the control path is actually going through =
one
> of the data pipes as well.

I think that viewpoint is too simplistic. And for sure we have no such =
system where the control path is done as IP packets for Ethernet =
packets.

>> =46rom what I am seeing right now is that unless you have a method to
>> also feed the control path into your GSMTAPv3, then this is rather
>> useless.=20
>=20
> So the control path *itself* would be there, I guess, but ...
>=20
>> The majority of the debugging is really done for the control path. =
For
>> oFono that is OFONO_DEBUG=3D1 environment variable and while it works =
it
>> is not the most elegant solution. I would love to feed that into a
>> generic debugging / tap that you can read out later.
>=20
> there's definitely room for more information than _just_ the control
> path "chat", also application state etc. would be useful, and logging
> etc.
>=20
> Typically on wifi we feed all of this together into kernel tracing (to
> record with trace-cmd) rather than trying to encapsulate it some other
> way.
>=20
>> As a side note, for Bluetooth we created a path where the bluetoothd
>> can feed back its control debugging data back into the Bluetooth
>> monitor in the kernel to allow combined userspace, mgmt and HCI
>> tracing. Some really nasty issues could only be triaged by having all
>> the meta data with a common timestamp.
>=20
> Right. This is something we'd typically use tracing for in wifi.

Same thing, but different way of doing it. Mind you that Bluetooth =
support is older than tracing.

> I don't really know what the right model for WWAN would be, I guess.
>=20
>=20
> Right now - and I really should've said this before - really the only
> problem I was thinking of was how we can mux multiple "chat" sessions
> with a device into a single data stream.
>=20
> Currently, this is all vendor-specific. If you have a Qualcomm modem,
> you'd be able to see all the open sessions on the underlying netdev, =
and
> the QMI header tells you what session a given 'packet' belongs to, and
> if you follow along maybe you can figure out if this is a control or =
IP
> 'packet' (could be an AT command).
>=20
> cdc_mbim uses VLAN tags instead to achieve this, and decapsulates the
> VLAN tags to send them down to the hardware in a different way.
>=20
> There are a few reasons why I think that this model of having a single
> underlying netdev controlled by the modem driver, with additional
> netdevs layered on top in software will not work right in the future. =
I
> think drivers should and will need to migrate to creating "real" =
netdevs
> for the sessions instead of pure software ones.

I do not follow on why is that. Why would I care if wwan0 is =
self-sustained of just a VLAN device. Or for that matter any other kind =
of slave/child device. 3GPP and 3GPP2 are not Ethernet frame based. We =
only have raw IPv4 and IPv6 packets for the data path.

> But if you do this, you lose the ability to listen to all the session
> streams at the same time, you can only do it for each netdev. Adding
> this ability back seems worthwhile, but then we probably shouldn't do =
it
> in a vendor-specific way, but rather in a generic way.
>=20
> So basically right now that's all I'm trying to solve. In WiFi we =
don't
> have the problem of "sessions" because we just use the addresses in =
the
> frames to disambiguate - on such 'monitor' netdevs we see the frames
> including full 802.11 headers.

And for 3GPP you have context identifiers that at least within the =
context of the control path make logical sense of the data streams and =
what they are assigned to. This goes back to my original point. You need =
to capture the control path to see what APN context is set up and how. =
Mind you that you also have the fun between primary context and =
secondary context (primarily for quality of service in VoLTE cases).

> Now, here's maybe where I'm getting off the right path - in wifi we
> mostly couple that with PHY information as well, and so we have PHY
> information + full 802.11 headers + data for capturing what's going =
on.
> I figured that theoretically at least that would be possible/useful =
for
> the modem as well (obviously control packets have no PHY data), but
> there doesn't seem to be any hardware that would actually expose data =
in
> this way. Everyone I've spoken to says these things are only available
> as modem trace data. What I haven't figured out though is if that's by
> some other design trade-off, or just because no such infrastructure
> is/was available.
>=20
> It may well be that doing kernel-tracing instead of doing it via some
> kind of monitor netdev is perfectly sufficient, but I have a feeling
> that the relative simplicity of starting tcpdump/wireshark might be
> preferable.

As I said, as long as you do not get the QMI, AT command, MBIM etc. =
control path session recorded as well, you have nothing to really =
analyze.

Regards

Marcel
