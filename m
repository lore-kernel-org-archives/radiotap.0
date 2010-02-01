From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Mon, 1 Feb 2010 22:09:37 +0000 (UTC)
Message-ID: <loom.20100201T230554-2@post.gmane.org>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>  <20100126174728.GV1060@ojctech.com> <1264584965.25642.15.camel@johannes.local>  <20100127153002.GC1060@ojctech.com> <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Matteo Croce <technoboy85@...> writes:
> On Wed, Jan 27, 2010 at 4:30 PM, David Young <dyoung@...> wrote:
> > On Wed, Jan 27, 2010 at 10:36:05AM +0100, Johannes Berg wrote:
> >> On Tue, 2010-01-26 at 11:47 -0600, David Young wrote:
> >>
> >> > FreeBSD uses the flags field and the channel flags to indicate Sho=
rt
> >> > GI and 40 MHz frames. =C2=A0Let's adopt the FreeBSD definitions fo=
r that
> >> > purpose.
> >>
> >> I'd mostly agree, but I'm not sure what they really use the 40MHz fl=
ag
> >> for. For instance, might there be value in knowing that the AP opene=
d
> >> the channel for 40MHz, but for some reason we are doing 20MHz
> >> transmissions instead? And would this be an appropriate way of
> >> conferring that information?
> >
> > I should take a closer look at the implementation. =C2=A0A per-packet=
 radio
> > information header does not need to carry the information of what the
> > AP could have done, but didn't, does it? =C2=A0I think it should carr=
y the
> > information that describes the properties of the packet.
> >=20
> The channel width is a packet property in 802.11n IIRC

Yes, it is in both the TXVECTOR and RXVECTOR of the PHY service interface=
.

The MCS field description (http://www.radiotap.org/suggested-fields/MCS)
just shows a bit for 40 MHz Channel and a bit for Short GI.

On the "40 MHz Channel" bit, it seems like it make more sense as "40 MHz
transmission". That is, it is a description of the modulation of the
packet, not a description of the channel to which the radio is currently
tuned. But there is more to the packet bandwidth than just 20 vs 40
MHz. When a device is tuned to a 40 MHz channel, it may receive 20 MHz
packets on either half of the 40-wide channel.

So the bandwidth options for a packet when the device is tuned to a 40 MH=
z
channel are:
40 MHz (full 40 MHz bandwidth packet)
20L (20 MHz packet in the lower 20 MHz of the 40 MHz channel)
20U (20 MHz packet in the upper 20 MHz of the 40 MHz channel)

When tuned to a 20 MHz channel, the packets can only be 20MHz

There are other parameters to the modulation that seem like they are all
important. A field that is going to capture the MCS, transmission
bandwidth, and short/long GI, should also note the HT Format of
Mixed/Greenfield, and the FEC (Forward Error Correction) mode BCC/LDPC.

So should the flags be:
0x03 - Bandwidth (0 -> 20 MHz, 1 -> 40 MHz, 2 -> 20L, 3 -> 20U)
0x04 - GI (0 -> Long, 1 -> Short)
0x10 - Format (0 -> Mixed, 1 -> Greenfield)
0x20 - FEC mode (0 -> BCC, 1 -> LDPC)

I also have a question about how the RadioTap design deals with informati=
on
that may not be available. I know that RadioTap works for many different
drivers, and I am wondering if all the drivers get full information about
the packets. For example, is it better to have a single bit for the GI
Short/Long, or two bits? If there were two bits, one for Short GI, and on=
e
for Long GI, then a driver that did not get the GI information at all wou=
ld
send up a RadioTap header with neither bit set, indicating nothing about
the GI of the packet. If there is only one bit, then by not setting the
Short GI bit in the field, it is indicating a Long GI.

Also, on the use of RadioTap for a user app to attach modulation
information, using separate bits might be a way to leave the choice up to
the driver. So if the user app just wanted to send a frame with a
particular MCS, it could use this field, but leave both the Short GI and
Long GI bits zero, so that the driver would pick whatever is appropriate.

So if it was in this longer format the flags might be something like this=
:
0x0001 20 MHz
0x0002 40 MHz
0x0004 20L (20 MHz in lower half of 40 MHz channel)
0x0008 20U (20 MHz in upper half of 40 MHz channel)
0x0010 Long GI
0x0020 Short GI
0x0040 HT Format - Mixed
0x0080 HT Format - Greenfield
0x0100 FEC type BCC
0x0200 FEC type LDPC

It seems like this expanded bitfield might be better than the more compac=
t
version.

On Tue, 2010-01-26 at 11:47 -0600, David Young wrote:
> FreeBSD uses the flags field and the channel flags to indicate Short
> GI and 40 MHz frames.  Let's adopt the FreeBSD definitions for that
> purpose.

I can see using the channel bandwidth to indicate the packet transmission
bandwidth. In the expanded bit format above it would mean dropping the 20=
 MHz
and 40 MHz bits. When the radio is tuned to a 20 MHz channel, assume 20MH=
z
packets, and when tuned to 40 MHz assume 40 MHz packets. That covers the =
full
channel bandwidth modulations, but leaves 20-in-40 MHz packet modulations=
 to be
addressed.

When the radio is tuned to a 40 MHz channel, then the 20L and 20U bits co=
uld
indicate a 20 MHz packet on the lower or upper side of the 40 MHz channel=
. I
think leaving in the 20L/U bits would be better than changing the channel=
 field
to indicate the modulation of the packet. It might be better to leave the
channel field describing the channel to which the radio is tuned, and the=
se
20U/L bits to indicate how the receiver saw the packets. When capturing p=
ackets,
it would seem surprising to see the channel field indicating channel chan=
ges on
what might be a packet by packet basis. On the transmit side, where radio=
tap is
describing a frame transmit, it seems like it would be better to leave th=
e
channel field indicating a 40 MHz channel, and use the 20U/L bits when se=
nding
20-in-40 MHz packets, or leaving them clear to do a straight 40 MHz
transmission. Changing the channel bandwidth might lead a driver to switc=
h how
the radio is tuned which might be inefficient on what might be a packet b=
y
packet change.

The GI short/long attribute really seems to belong to info related to the=
 packet
modulation, not an attribute of the channel to which the radio is tuned.

-Bill
