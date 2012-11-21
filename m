From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: TSFT
Date: Wed, 21 Nov 2012 11:42:32 +0100
Message-ID: <1353494552.10444.18.camel@jlt4.sipsolutions.net>
References: <50A72E17.6070207@superduper.net>
	  <CAG6hwVNzGV1oSQqXKEvho_n8Tf2pmO3FcakKA9-53Zm2c1fB=Q@mail.gmail.com>
	  <50A88C3D.5030809@superduper.net>
	 <1353236845.9649.6.camel@jlt4.sipsolutions.net>
	 <50AC0791.3040005@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <50AC0791.3040005-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: Thomas Pedersen <thomas-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2012-11-20 at 14:43 -0800, Simon Barber wrote:
> One problem with fixing the calculations is that quite a lot of 
> information is needed to do the calculation correctly. In Intel's case I 
> don't know if Ness information is available, and this makes upto a 16us 
> difference in the PLCP header length.
> 
> Calculating the start of the MPDU from the end accurately requires 
> knowing the FEC scheme, the MCS, the guard interval, the bandwidth. Is 
> the FEC scheme known, or are all current cards only supporting BCC?

Good question, I don't really know.

> Do you know if Intel supports extension spatial streams? If not the 
> number is always 0. And FEC - is it always BCC?

I don't think our devices support extension spatial streams or anything
but BCC.

Overall though, I think there's an argument to be made here for simply
introducing a new radiotap timestamp field that gives the timestamp at
the end of the frame? This could be defined better and would be more
accurate.

I'm not sure I'd want to redefine the existing field in any way since
there are probably a whole bunch of implementations out there that just
stick whatever timestamp they have into the field, without regard for
where it is in the frame, and without regard for aggregation.

johannes
