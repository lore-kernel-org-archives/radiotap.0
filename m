From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MCS field - STBC and Ness
Date: Fri, 11 May 2012 20:35:46 +0200
Message-ID: <1336761346.8739.3.camel@jlt3.sipsolutions.net>
References: <4FAC5DE0.90708@superduper.net> <4FACBA13.9040509@neratec.com>
	 <4FAD41E4.3090803@superduper.net> <4FAD43F0.20807@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4FAD43F0.20807-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: Wojciech Dubowik <wojciech.dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, 2012-05-11 at 09:53 -0700, Simon Barber wrote:
> OK - perhaps a simpler/better suggestion would be for the STBC2 bit to 
> just be the second bit of STBC information.

Seems reasonable to me, then we'll have filled all the bits anyway.

johannes

> Simon
> 
> 
> On Fri 11 May 2012 09:44:20 AM PDT, Simon Barber wrote:
> > One possible solution would be to adopt your proposal to add a single
> > bit STBC, but also add a second bit to the 'knows' byte - STBC2. If
> > this second bit is set, then it indicates STBC=2. This would leave one
> > remaining bit in the 'knows' byte, to indicate the presence of Ness
> > information, and 2 bits in the 'flags' byte for 2 bits of Ness
> > information.
> >
> > Copying the MCS definition from the radiotap.org website:
> >
> > The known field indicates which information is known:
> >
> > known definition
> > 0x01 bandwidth
> > 0x02 MCS index known (in mcs part of the field)
> > 0x04 guard interval
> > 0x08 HT format
> > 0x10 FEC type
> > 0x20 STBC - STBC is known
> > 0x40 STBC2 - 2 STBC streams are present
> > 0x80 Ness - Number of extra spatial streams is known
> >
> > The flags field is any combination of the following:
> >
> > flag definition
> > 0x03 bandwidth - 0: 20, 1: 40, 2: 20L, 3: 20U
> > 0x04 guard interval - 0: long GI, 1: short GI
> > 0x08 HT format - 0: mixed, 1: greenfield
> > 0x10 FEC type - 0: BCC, 1: LDPC
> > 0x20 STBC - 0: no STBC streams, 1: 1 or 2 STBC streams (see STBC2)
> > 0xc0 Ness - Number of extra spatial streams.
> >
> > Simon
> >
> >
> >
> > On Fri 11 May 2012 12:04:51 AM PDT, Wojciech Dubowik wrote:
> >> Hello,
> >> Atheros families 9002 and 9003 support only one STBC stream. I think I
> >> have seen a Ralink chipset
> >> which supports 2 stream at least on receive. I am not sure about
> >> transmiter.
> >> On Atheros you get STBC flag and two bits Ness field for received
> >> packets but In the patch there is is only flag reading but you could
> >> add Ness yourself it's only two bits left from the flag.
> >>
> >> Myself I have tested only one stream but I did it only by looking
> >> whether other party is setting rx descriptor bit. I don't know how it
> >> looks "in the air". I trust manufacturer;o)
> >>
> >> It's true that only one bit was allocated in wireshark extension.
> >> Should have been two but it's a bit waste. My proposal wasn't accepted
> >> but in the end I think it's ok becasue I have managed to get all info
> >> in vendor namesapes where I can do what I want.
> >>
> >> Br,
> >> Wojtek
> >>
> >>>
> >>> I am writing a Wireshark extension to visualise 802.11 frames on a
> >>> timeline. In order to do this I need to be able to calculate the
> >>> duration from start of TX to end of TX for each frame.
> >>>
> >>> For 802.11n I need to know the number of HT-DLTF and HT-ELTF training
> >>> symbols that are sent in the header - I have everything else needed
> >>> to calculate the duration. Given the MCS and the STBC and the Ness
> >>> (Number of extension spatial streams) I can calculate the number of
> >>> training symbols.
> >>>
> >>> Both STBC and Ness are encoded in the HT-SIG transmitted at the start
> >>> of each HT frame.
> >>>
> >>> The current proposal (or has it not yet been accepted?) for STBC
> >>> allocates just 1 bit - but the STBC field can have values or 0, 1 or 2.
> >>>
> >>> Ness can be 0-3, so the remaining 2 bits could be allocated to Ness,
> >>> but this does not solve the problem of how to encode the modes with 2
> >>> spatial streams and 2 additional streams for STBC.
> >>>
> >>> Does anyone know what current hardware supports - STBC values or
> >>> 0,1,2? Ness values of 0-3?
> >>>
> >>> Any suggestions for how to convey these
> >>>
> >>> Simon
> >>
> 
