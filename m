From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: TSFT
Date: Tue, 20 Nov 2012 14:43:29 -0800
Message-ID: <50AC0791.3040005@superduper.net>
References: <50A72E17.6070207@superduper.net>  <CAG6hwVNzGV1oSQqXKEvho_n8Tf2pmO3FcakKA9-53Zm2c1fB=Q@mail.gmail.com>  <50A88C3D.5030809@superduper.net> <1353236845.9649.6.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1353236845.9649.6.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Thomas Pedersen <thomas-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

One problem with fixing the calculations is that quite a lot of 
information is needed to do the calculation correctly. In Intel's case I 
don't know if Ness information is available, and this makes upto a 16us 
difference in the PLCP header length.

Calculating the start of the MPDU from the end accurately requires 
knowing the FEC scheme, the MCS, the guard interval, the bandwidth. Is 
the FEC scheme known, or are all current cards only supporting BCC?

Do you know if Intel supports extension spatial streams? If not the 
number is always 0. And FEC - is it always BCC?

Simon


On 11/18/2012 03:07 AM, Johannes Berg wrote:
> On Sat, 2012-11-17 at 23:20 -0800, Simon Barber wrote:
>> Unfortunately this patch does not do a very accurate calculation, so it
>> makes the problem worse. It simply multiplies rate by the number of
>> bits to get a time. This does not take into account the limited
>> accuracy in rate (11n has fractional rates), nor does it consider the
>> rounding into blocks caused by FEC, or symbols. As a result the data is
>> made worse by the current code. Either the code should do an accurate
>> fix, or it should record the raw value and let the end user correct it
>> properly.
>
> If we can, I'd say we should fix the calculations.
>
> The question is how we define it when the first bit of the MPDU can be
> fractional in a symbol?
>
> johannes
>
