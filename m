From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: HE (11ax) extensions
Date: Mon, 13 Feb 2017 14:23:31 +0100
Message-ID: <1486992211.19813.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

We're looking to add HE/11ax extensions to radiotap.

Has anyone else already identified the data that would be necessary?

So far I have - assuming 'presence bits' for each,

for HE_SU:
 * beam change (1 bit)
 * UL/DL (1 bit)
 * MCS (4 bits)
 * DCM (1 bit)
 * BSS color (6 bits)
 * spatial reuse (TBD)
 * bandwidth
 * GI+LTF size (2 bits)
 * Nsts
 * TXOP duration (7 bits)
 * Coding (BCC/LDPC)
 * LDPC extra symbol flag
 * STBC flag
 * TX BF flag
 * pre-FEC padding factor
 * PE disambiguity
 * doppler mode

for HE_MU:
 * UL/DL
 * MCS
 * DCM
 * BSS color
 * spatial reuse
 * TXOP Duration
 * bandwidth
 * # of HE SIGB symbols
 * SIG-B compression
 * GI+LTF size
 * # of HE-LTF symbols
 * LDPC extra symbol flag
 * STBC
 * pre-FEC padding factor
 * PE disambiguity
 * doppler mode
 * RU allocation
 * center 26 tone RU
 * per-user: STA-ID, Nsts, TX BF, MCS, DCM, Coding

for HE_TRIG:
(similar to HE_SU but a little restricted)


Obviously a number of these fields are in all three formats, and I
haven't really done a full size analysis, but perhaps we should split
the extra MU fields into a separate bit so that they don't have to have
space allocated to them when not used, for SU/TRIG formats?

johannes
