From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Re: Correct radiotap header for 802.11ad
Date: Wed, 26 Aug 2015 15:56:07 -0700
Message-ID: <55DE4407.806@superduper.net>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com> <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <38F46E1D-1C4A-48DC-A906-9522006E8474-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

I've never seen a capture file with a correct or useful A-MPDU field! 
I'd also like to know more information - such as what amount of padding 
was there between MPDUs in the A-MPDU.

Simon

On 8/22/2015 1:59 PM, Guy Harris wrote:
> On Aug 22, 2015, at 12:41 PM, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> I have some 802.11ad captures because of some fixes to the Wireshark
>> 802.11 dissector I am looking at doing.
>>
>> One thing I notice is that the radiotap header contains both a Channel field
>> and an MCS field.
> That is to be expected for 11n packets.
>
>> The Present flags say that Flags are present, Channel is present and
>> HT Information is present.
> By "HT Information" do you mean "the MCS field"?
>
> The "MCS" field should, perhaps, have been called the "HT" field, as it's information for the HT (11n) PHY, just as the VHT field is information for the VHT (11ac) PHY.
>
>> The channel frequency is 60480MHz which seems to be reasonable.
>>
>> The MCS field says that the MCS index is present and that index is 0.
>>
>> It seems to me that this last field is perhaps incorrect, because the
>> radiotap information dissector claims that the PHY type is 802.11n,
>> and that seems to come about because the radiotap header use the MCS
>> index info to claim that the PHY type was 802.11n.
> Well, to be fair, that's the Wireshark code doing that, under the non-unreasonable assumption that if there's an MCS field it's an HT frame, just as it assumes that if there's a VHT field it's a VHT frame.
>
>  From the *radiotap* point of view, I would say that the last field is incorrect because the page for the MCS field on the radiotap site says:
>
> 	The mcs field indicates the MCS rate index as in IEEE_802.11n-2009.
>
> which, if we update it to say "as in Clause 20 of IEEE 802.11-2012", means it has values from 0 to 76, with modulations different from the ones in 11ad's Clause 21, i.e. the radiotap MCS field is *not* appropriate for 11ad.
>
>> Should I be letting the capture hardware vendor know that they are
>> generating the wrong info?
> I'm not even remotely an expert on 802.11 at the PHY level, but I suspect that what we really want for radiotap is a "DMG" field, containing 11ad-specific information.  It would include its own mcs field, giving the MCS values from Clause 21, and perhaps other information, such as a flag to indicate whether "Static Tone Pairing" or "Dynamic Tone Pairing" was used.  (Again, I leave it up to people more familiar with 802.11ad to decide what information would be useful.)
>
> Would the existing A-MPDU field suffice for MPDUs inside an 11ad A-MPDU?
