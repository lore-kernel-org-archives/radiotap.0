From: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [RFC] VHT fields
Date: Wed, 13 Jun 2012 10:42:56 +0000
Message-ID: <C6E8EE2D6B3ACB4582C1249E834B306505DF7F@SJEXCHMB13.corp.ad.broadcom.com>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
 <1339519879.4531.13.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1339519879.4531.13.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Content-Language: en-US
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: 'Johannes Berg' <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

> On Tue, 2012-06-12 at 15:05 +0000, Alwin Beukers wrote:
> > Hi everyone,
> >
> > This is a proposal for adding support for 802.11ac. Four fields were
> added to the suggested-fields section:
> >
> > http://www.radiotap.org/suggested-fields/SU_VHT
> > http://www.radiotap.org/suggested-fields/MU_VHT
> > http://www.radiotap.org/suggested-fields/GROUP_ID
> > http://www.radiotap.org/suggested-fields/PARTIAL_AID
> >
> > A Wireshark patch for parsing SU_VHT, GROUP_ID and PARTIAL_AID is
> attached.
> 
> What's the reason for splitting it up?

Johannes,

The reason for splitting it up is to avoid extra overhead related to MU-MIMO when describing VHT SU PPDUs. The separation is based on the different PLCP header formats (VHT-SIG-A1/A2/B) for SU and MU PPDUs:

SU PPDUs:
- Only one NSTS, MCS and Coding field.
- Partial AID identifies recipient
- Group ID is always 0 (addressed to AP/mesh STA) or 63 (addressed to STA)

MU PPDUs:
- NSTS, MCS and Coding fields for up to four users
- Partial AID is not applicable
- Group ID is 1..62

All fields common to both SU and MU are in the SU_VHT field. The MU_VHT field contains additional information for MU PPDUs. The GROUP_ID and PARTIAL_AID fields have varying value or applicability.

So for SU PPDUs you would likely have SU_VHT and PARTIAL_AID fields, and maybe a GROUP_ID field (for SU the GROUP_ID field only provides direction info that could also be determined from PARTIAL_AID and/or MAC header).
For MU PPDUs you would have SU_VHT (for the common fields as well as NSTS/MCS/Coding for the first user), MU_VHT (for NSTS/MCS/Coding for additional users), and GROUP_ID.

By combining fields we can reduce complexity at the expense of some increased overhead, what are your thoughts on his? Also, I was wondering if we need all of the 'known' flags in SU_VHT. The MCS field (after which SU_VHT was modeled) also has these, but I don’t know the rationale behind them. Can one assume a driver has full access to the PLCP header and thus can fill in most of fields in the SU_VHT field?

Thanks,
Alwin
 
> johannes
> 
