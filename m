From: Matteo Croce <technoboy85-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] HT extensions
Date: Tue, 21 Sep 2010 17:46:40 +0200
Message-ID: <AANLkTiknr0QOwAd8ayKkk=yJ3_q+GfC_unGucMDEjzP=@mail.gmail.com>
References: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1284595489.3707.54.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Sep 16, 2010 at 2:04 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> This is a request for adoption of the MCS/HT information we've talked
> about earlier, based on my second proposal that includes valid bits
> within the field.
>
> This proposal adds the following new field:
>
> Bit Number: 19
> Structure: u8 known, u8 flags, u8 mcs
> Required Alignment: 1
>
> The "mcs" field indicates the MCS rate index as in IEEE_802.11n-2009.
>
> The "known" field indicates which flags are known:
>
> 0x01: bandwidth
> 0x02: MCS index known (in `mcs` part of the field)
> 0x04: guard interval
> 0x08: HT format
> 0x10: FEC type
> 0x20: a-MPDU status
> 0x40: a-MPDU beginning/end
> 0x80: reserved
>
> The `flags` is any combination of the following:
> 0x03: bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
> 0x04: short GI
> 0x08: 0: mixed, 1: greenfield
> 0x10: 0: BCC, 1: LDPC
> 0x20: a-MPDU status - 0: not part of an a-MPDU, 1: part of a-MPDU
> 0x40: 0: first frame, 1: last frame
> 0x80: reserved
>
>
>
> Attached is a patch to Linux to generate this information (partially)
> and a patch for wireshark to read it -- the wireshark patch is on top of
> the refactoring I did in
> https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=3D4421
>
> johannes
>

Even if I'm the author of the original proposal I agree with the new format=
,
as many chipset can't report all the informations correctly.

--=20
Matteo Croce
OpenWrt developer
=C2=A0 _______=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 ________=C2=A0 =C2=A0 =C2=A0 =C2=A0 __
=C2=A0|=C2=A0 =C2=A0 =C2=A0=C2=A0 |.-----.-----.-----.|=C2=A0 |=C2=A0 |=C2=
=A0 |.----.|=C2=A0 |_
=C2=A0|=C2=A0=C2=A0 -=C2=A0=C2=A0 ||=C2=A0 _=C2=A0 |=C2=A0 -__|=C2=A0 =C2=
=A0=C2=A0 ||=C2=A0 |=C2=A0 |=C2=A0 ||=C2=A0=C2=A0 _||=C2=A0=C2=A0 _|
=C2=A0|_______||=C2=A0=C2=A0 __|_____|__|__||________||__|=C2=A0 |____|
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |__| W I R E L E S S=C2=A0=C2=A0 F R E E=
 D O M
=C2=A0KAMIKAZE (bleeding edge) ------------------
=C2=A0 * 10 oz Vodka=C2=A0 =C2=A0 =C2=A0=C2=A0 Shake well with ice and stra=
in
=C2=A0 * 10 oz Triple sec=C2=A0 mixture into 10 shot glasses.
=C2=A0 * 10 oz lime juice=C2=A0 Salute!
=C2=A0---------------------------------------------------
