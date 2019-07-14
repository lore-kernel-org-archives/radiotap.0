From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Re: Channel field info for 6 GHz channels
Date: Sun, 14 Jul 2019 14:10:29 -0700
Message-ID: <3A61B59B-0D87-46AF-8943-5EF5A1207DFB@me.com>
References: <1F1CB1A0-193E-4591-AD86-ECEA34B97030@me.com>
 <8e6970d56da3998227aef4df44c7430c9c41822c.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5F9D5D11-6526-4C58-9453-A77DBB4B24C9"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <8e6970d56da3998227aef4df44c7430c9c41822c.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--Apple-Mail=_5F9D5D11-6526-4C58-9453-A77DBB4B24C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks for the information Johannes.

>> The Channel field has a frequency field and I see flags for 5G and =
2G.
>=20
> I've always sort of thought the flags are kinda useless, but I don't
> know how those bits are really used, I guess you'd have to look at =
e.g.
> wireshark.

I took a look at the current Wireshark code and see that the bits are =
being used to set the phy type of the rx frame.

Here are some excerpts from packet-ieee80211-radiotap.c, creating some =
masks including the radiotap channel flags for 2g/5g:
#define	IEEE80211_CHAN_DSSS \
	(IEEE80211_CHAN_2GHZ)
#define	IEEE80211_CHAN_A \
	(IEEE80211_CHAN_5GHZ | IEEE80211_CHAN_OFDM)
#define	IEEE80211_CHAN_B \
	(IEEE80211_CHAN_2GHZ | IEEE80211_CHAN_CCK)

Then in dissect_radiotap_channel(), paraphrasing the switch on the =
channel flags:

	case IEEE80211_CHAN_DSSS:
		phdr->phy =3D PHDR_802_11_PHY_11_DSSS;
		break;

	case IEEE80211_CHAN_A:
		phdr->phy =3D PHDR_802_11_PHY_11A;
		phdr->phy_info.info_11a.has_turbo_type =3D TRUE;
		phdr->phy_info.info_11a.turbo_type =3D =
PHDR_802_11A_TURBO_TYPE_NORMAL;
		break;

	case IEEE80211_CHAN_B:
		phdr->phy =3D PHDR_802_11_PHY_11B;

The frequency could be used just as well, but I also see this comment in =
the same function:
	if (freq !=3D 0) {
		/*
		 * XXX - some captures have 0, which is
		 * obviously bogus.
		 */
I don=E2=80=99t know if captures that have a zero freq bother setting =
2g/5g bits.

> OTOH, we could say it's not relevant and tools that want to
> handle 6 GHz will just have to not use the bits. I don't know. Or we =
can
> add a bit for 6-7 GHz?

I don=E2=80=99t think a 6 GHz bit is necessary. Maybe if there is no 6G =
bit the drivers will be more inclined to fill out the frequency.

> Now, oddly enough, it looks like we don't actually capture the
> *position* of the 40 MHz channel at all.

Not really an issue I think other than 2 GHz band use. Since 5G and 6G =
bands have non-overlapping channels of any bandwidth, given a 20 MHz =
primary channel, you know the one and only 40/80/160 that contains that =
channel.
[btw, I am ignoring the legacy Japan channels 34,38,42,46, but they were =
never paired to 40MHz according to 802.11, but even if they were, given =
primary channel 34, you know that the 40MHz channel would be {34,38}, =
etc]

But 2 GHz 40MHz seems like it is left without knowing which of the 2 =
40MHz channels that contain a primary 20 MHz btwn 5-9.

> If we need to capture more detailed channel position data (relative to
> the primary channel whose center frequency is captured in the existing
> channel field) I'd probably say we should have some new field that
> captures this in more detail. In Linux, we capture the configuration =
in
> something like
>=20
> 	u32 control_freq;
> 	enum ... bandwidth;
> 	u32 center_freq1;
> 	u32 center_freq2; // for 80+80
>=20
> but we've already found that it's not sufficient for
> * S1G, which has channels with fractional MHz center frequency
> * EDMG, which has a bunch of non-contiguous chunks

I noticed that radiotap did not have any 80+80 encoding. I have not =
looked at S1G or EDMG, so can=E2=80=99t comment.
But it make sense to me to have some extended channel info in radiotap =
to encode these cases. =20

Thanks again.

-Bill


--Apple-Mail=_5F9D5D11-6526-4C58-9453-A77DBB4B24C9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Thanks for the information Johannes.<div class=3D""><br =
class=3D""></div><div class=3D""><div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""><blockquote type=3D"cite" =
class=3D"">The Channel field has a frequency field and I see flags for =
5G and 2G.<br class=3D""></blockquote><br class=3D"">I've always sort of =
thought the flags are kinda useless, but I don't<br class=3D"">know how =
those bits are really used, I guess you'd have to look at e.g.<br =
class=3D"">wireshark.</div></div></blockquote><div><br =
class=3D""></div><div><div class=3D"">I took a look at the current =
Wireshark code and see that the bits are being used to set the phy type =
of the rx frame.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Here are some excerpts from packet-ieee80211-radiotap.c, =
creating some masks including the radiotap channel flags for =
2g/5g:</div><div class=3D""><div class=3D""><font face=3D"Courier New" =
class=3D"">#define<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>IEEE80211_CHAN_DSSS \</font></div><div class=3D""><font =
face=3D"Courier New" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>(IEEE80211_CHAN_2GHZ)</font></div><div class=3D""><font =
face=3D"Courier New" class=3D"">#define<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>IEEE80211_CHAN_A =
\</font></div><div class=3D""><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>(IEEE80211_CHAN_5GHZ | IEEE80211_CHAN_OFDM)</font></div><div =
class=3D""><font face=3D"Courier New" class=3D"">#define<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>IEEE80211_CHAN_B \</font></div><div class=3D""><font =
face=3D"Courier New" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>(IEEE80211_CHAN_2GHZ | =
IEEE80211_CHAN_CCK)</font></div><div class=3D""><br =
class=3D""></div></div><div class=3D"">Then in =
dissect_radiotap_channel(), paraphrasing the switch on the channel =
flags:</div><div class=3D""><br class=3D""></div><div class=3D""><div =
class=3D""><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
IEEE80211_CHAN_DSSS:</font></div><div class=3D""><font face=3D"Courier =
New" class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
	</span>phdr-&gt;phy =3D =
PHDR_802_11_PHY_11_DSSS;</font></div><div class=3D""><font face=3D"Courier=
 New" class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
		</span>break;</font></div><div class=3D""><font =
face=3D"Courier New" class=3D""><br class=3D""></font></div><div =
class=3D""><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
IEEE80211_CHAN_A:</font></div><div class=3D""><font face=3D"Courier New" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>phdr-&gt;phy =3D PHDR_802_11_PHY_11A;</font></div><div =
class=3D""><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>phdr-&gt;phy_info.info_11a.has_turbo_type =3D =
TRUE;</font></div><div class=3D""><font face=3D"Courier New" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>phdr-&gt;phy_info.info_11a.turbo_type =3D =
PHDR_802_11A_TURBO_TYPE_NORMAL;</font></div><div class=3D""><font =
face=3D"Courier New" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>break;</font></div><div =
class=3D""><font face=3D"Courier New" class=3D""><br =
class=3D""></font></div><div class=3D""><font face=3D"Courier New" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>case IEEE80211_CHAN_B:</font></div><div class=3D""><font =
face=3D"Courier New" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>phdr-&gt;phy =3D =
PHDR_802_11_PHY_11B;</font></div></div><div class=3D""><br =
class=3D""></div></div><div>The frequency could be used just as well, =
but I also see this comment in the same function:</div><div><div><font =
face=3D"Courier New" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (freq !=3D 0) =
{</font></div><div><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>/*</font></div><div><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span> =
* XXX - some captures have 0, which is</font></div><div><font =
face=3D"Courier New" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span> * obviously =
bogus.</font></div><div><font face=3D"Courier New" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">		</span> =
*/</font></div><div class=3D"">I don=E2=80=99t know if captures that =
have a zero freq bother setting 2g/5g bits.</div><div class=3D""><br =
class=3D""></div></div><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D""> OTOH, we could say it's not relevant and =
tools that want to<br class=3D"">handle 6 GHz will just have to not use =
the bits. I don't know. Or we can<br class=3D"">add a bit for 6-7 =
GHz?<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>I don=E2=80=99t think a 6 GHz bit is necessary. =
Maybe if there is no 6G bit the drivers will be more inclined to fill =
out the frequency.</div><div><br class=3D""></div><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">Now, oddly =
enough, it looks like we don't actually capture the<br =
class=3D"">*position* of the 40 MHz channel at all.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Not =
really an issue I think other than 2 GHz band use. Since 5G and 6G bands =
have non-overlapping channels of any bandwidth, given a 20 MHz primary =
channel, you know the one and only 40/80/160 that contains that =
channel.</div><div><div>[btw, I am ignoring the legacy Japan channels =
34,38,42,46, but they were never paired to 40MHz according to 802.11, =
but even if they were, given primary channel 34, you know that the 40MHz =
channel would be {34,38}, etc]</div><div class=3D""><br =
class=3D""></div></div><div>But 2 GHz 40MHz seems like it is left =
without knowing which of the 2 40MHz channels that contain a primary 20 =
MHz btwn 5-9.</div><div><br class=3D""></div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D"">If we need to capture more =
detailed channel position data (relative to<br class=3D"">the primary =
channel whose center frequency is captured in the existing<br =
class=3D"">channel field) I'd probably say we should have some new field =
that<br class=3D"">captures this in more detail. In Linux, we capture =
the configuration in<br class=3D"">something like<br class=3D""><br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>u32 control_freq;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>enum ... bandwidth;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>u32 center_freq1;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>u32 center_freq2; // for 80+80<br =
class=3D""><br class=3D"">but we've already found that it's not =
sufficient for<br class=3D""> * S1G, which has channels with fractional =
MHz center frequency<br class=3D""> * EDMG, which has a bunch of =
non-contiguous chunks<br class=3D""></div></div></blockquote></div><br =
class=3D""></div><div class=3D"">I noticed that radiotap did not have =
any 80+80 encoding. I have not looked at S1G or EDMG, so can=E2=80=99t =
comment.</div><div class=3D"">But it make sense to me to have some =
extended channel info in radiotap to encode these cases. =
&nbsp;</div><div class=3D""><br class=3D""></div><div class=3D"">Thanks =
again.</div><div class=3D""><br class=3D""></div><div =
class=3D"">-Bill</div><div class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_5F9D5D11-6526-4C58-9453-A77DBB4B24C9--
