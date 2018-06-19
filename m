From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [RFC] 0-length PPDU reporting
Date: Tue, 19 Jun 2018 14:20:06 -0700
Message-ID: <3028EC8F-6CFD-4F52-8349-D49B1F37AC22@alum.mit.edu>
References: <1529332670.3490.50.camel@sipsolutions.net>
 <00986C20-9443-40FC-9A7E-DE636A743951@superduper.net>
 <1529349637.3092.8.camel@sipsolutions.net>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1529349637.3092.8.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>, radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Jun 18, 2018, at 12:20 PM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> =
wrote:

> A wireshark patch should be pretty simple, just don't call through to
> the 802.11 dissector?

Yes, although if it has radio information you should call through to the =
"802.11 radio" dissector (so that it shows the radio information in a =
pseudo-header-independent format) and pass along information to let it =
know that *it* shouldn't call through to the 802.11 frame dissector.=
