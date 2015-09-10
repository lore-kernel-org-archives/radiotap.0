From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Thu, 10 Sep 2015 11:25:02 -0700
Message-ID: <1135A126-6A5A-4C84-A52D-13C0387609CC@alum.mit.edu>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>	<38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>	<1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>	<1440402013.3735.1.camel@sipsolutions.net> <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com> <55DE44EB.6080603@superduper.net> <126B842D-05EA-4510-BC9B-DB1A4AABEC12@alum.mit.edu>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <126B842D-05EA-4510-BC9B-DB1A4AABEC12-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org" <radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>
Cc: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org


On Aug 26, 2015, at 6:17 PM, Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Aug 26, 2015, at 3:59 PM, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org> =
wrote:
>=20
>> The HT and VHT fields are missing various bits of phy layer info, and =
are defined missing enough bits for other fields. I've always thought It =
would be much simpler if these fields could convey the whole SIGNAL bits =
from the PLCP header, along with a mask in case it's not all available. =
The drivers I've seen have the whole PLCP SIGNAL field available.
>=20
> So that's the L-SIG bits from 20.3.9.3.5 "L-SIG definition"

I.e., L_DATARATE and L_LENGTH?

> and either the HT-SIG bits from 20.3.9.4.3 "HT-SIG definition"

I.e.:

	the MCS index

	CBW 20/40

	HT Length

	Smoothing

	Not Sounding

	Aggregation (PPDU contains an A-MPDU)

	STBC

	FEC coding

	Short GI

	N(ESS)

	CRC of the bits

	Tail Bits

The ones that aren't in the MCS field or the A-MPDU field are:

	HT Length - is that just the length of the data following the =
radiotap header?

	Smoothing

	Not Sounding

	CRC - is this of any interest?

	Tail Bits - always 0, so these are presumably not of interest

Can:

	whether "20" means "20", "20L", or "20U";

	HT mixed vs. greenfield;

both of which are available from the MCS field, be determined from the =
PLCP header?

Or is what "20" means not fully determinable for received packets, so =
that "20L", "20U", and "40" are indistinguishable, similar to what the =
Radiotap spec for the VHT field says?

20.3.9.5.4 "HT-greenfield format HT-SIG" says "The content and format of =
the HT-SIG of an HT-greenfield format frame is identical to the HT-SIG =
in an HT-mixed format frame, as described in 20.3.9.4.3.", so if that =
information can be determined for received frames, it sounds as if =
greenfield vs. mixed *can't* be determined from the HT-SIG bits.

> or the VHT-SIG-A bits from 11ac's 22.3.8.3.3 "VHT-SIG-A definition" =
and the VHT-SIG-B bits from 11ac's 22.3.8.3.6 "VHT-SIG-B definition"?

I.e.:

	BW

	STBC

	Group ID

	NSTS/Partial AID

	TXOPS_PS_NOT_ALLOWED

	Short GI

	Short GI NSYM Disambiguation

	SU/MU[0] Coding

	LDPC Extra OFDM Symbol

	SU VHT-MCS/MU[1-3] Coding

	Beamformed

	CRC

	Tail Bits

The ones that aren't in the MCS field are:

	CRC - is this of any interest?

	Tail Bits - always 0, so these are presumably not of interest

The spec for the VHT field says that NSTS "can be calculated from the =
NSS for that user and the STBC flag" and that, for received frames, the =
only bandwidth information you get is 20/40/80/160, which is presumably =
what you can get from BW.

For *transmitted* frames, I guess you have more control over how it's =
transmitted, which is presumably why there's a VHT field rather than =
just a PLCP header field.

I.e., as radiotap is used for transmission, it needs to include at least =
some of the parameters to the PHY service's transmission operation, =
which may not be available in the PLCP header.

> And for 11ad, would it be the bits from 21.5.3.1.1 "General"?

I.e.:

	Scrambler Initialization - probably not of interest

	MCS

	Length - is this just the length of the data following the =
radiotap header?

	Additional PPDU

	Packet Type

	Training Length

	Aggregation (PPDU contains an A-MPDU)

	Beam Tracking Request

	Tone Pairing Type

	DTP Indicator

	Last RSSI

	Turnaround

	HCS (a CRC)

So do we need all of those?

And is there anything more that would be needed for *injected* 11ad =
frames?  If so, that's an argument for a "DMG" field containing the =
interesting information from the PLCP header combined with information =
necessary for injected frames?=
