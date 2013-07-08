From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Mon, 08 Jul 2013 10:59:12 +0200
Message-ID: <1373273952.8312.7.camel@jlt4.sipsolutions.net>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1345481425.4459.46.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Mon, 2012-08-20 at 18:50 +0200, Johannes Berg wrote:

> I'm planning to modify this (in Linux) to include, where available,
> antenna index & per-antenna signal information by duplicating the
> radiotap namespace for each antenna, so that the header would, for
> example, read as follows for a 3x3 devices:
> 
>  * ... TSF, Flags, Rate, Channel, ...
>  * antenna signal: -40 dBm
>  * antenna: 0
>  * ... MCS, A-MPDU status, ...
>  * antenna signal: -45 dBm
>  * antenna: 1
>  * antenna signal: -43 dBm
>  * antenna: 2

FWIW, I've now implemented this in Linux (in mac80211), although I start
a new radiotap namespace for each antenna, separate from the first one,
so you'll see

 * any of: TSF, flags, rate, channel, MCS, a-mpdu, VHT, ...
(new radiotap namespace)
 * ant signal: -40 dBm
 * anntenna: 0
(new radiotap namespace)
 * ant signal: -45 dBm
 * anntenna: 1
... for however many antennas/chains there are.

johannes
