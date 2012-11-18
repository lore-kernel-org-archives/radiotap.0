From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: TSFT
Date: Sat, 17 Nov 2012 23:20:29 -0800
Message-ID: <50A88C3D.5030809@superduper.net>
References: <50A72E17.6070207@superduper.net> <CAG6hwVNzGV1oSQqXKEvho_n8Tf2pmO3FcakKA9-53Zm2c1fB=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAG6hwVNzGV1oSQqXKEvho_n8Tf2pmO3FcakKA9-53Zm2c1fB=Q@mail.gmail.com>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Thomas Pedersen <thomas-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Unfortunately this patch does not do a very accurate calculation, so it 
makes the problem worse. It simply multiplies rate by the number of 
bits to get a time. This does not take into account the limited 
accuracy in rate (11n has fractional rates), nor does it consider the 
rounding into blocks caused by FEC, or symbols. As a result the data is 
made worse by the current code. Either the code should do an accurate 
fix, or it should record the raw value and let the end user correct it 
properly.

Simon


On Sat 17 Nov 2012 03:26:05 PM PST, Thomas Pedersen wrote:
> Hi Simon,
>
> On Fri, Nov 16, 2012 at 10:26 PM, Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org> wrote:
>> This is the current definition of TSFT:
>>
>> "Value in microseconds of the MAC's 64-bit 802.11 Time Synchronization
>> Function timer when the first bit of the MPDU arrived at the MAC. For
>> received frames only."
>>
>> My experience with TSFT is with Atheros cards, which record the timestamp at
>> the end of the frame, not the start.
>
> There is already a patch in mac80211-next which accounts for this and
> normalizes frame TSFT to beginning of frame.
>
>> Do you know the behaivour of any particular capture systems re: TSFT - where
>> do they timestamp the frame?
>>
>> Furthermore for DSSS/CCK the definition above is reasonable, but for OFDM
>> and HT (802.11n) the SIGNAL field (part of the PLCP header, not part of the
>> MPDU) is part of the first data symbol. It would be much clearer to change
>> the definition to state that the timestamp is at the start of this first
>> SIGNAL/data symbol. Any objections to doing this, or preference to change
>> the reference point to a different part of the frame?
>
> Keeping the TSFT at start of MPDU is cleaner from the user's point of view.
>
>> In my wireshark patch I've added options to interpret TSFT as the start of
>> end of the frame.
>
> I'm not sure which patch you're referring to, but it seems cleaner to
> handle normalizing TSFT to a single reference in the kernel.
>
> Thomas
