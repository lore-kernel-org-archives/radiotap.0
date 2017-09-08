From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Fri, 08 Sep 2017 10:35:11 +0200
Message-ID: <1504859711.6177.12.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1486992211.19813.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi all,

I've updated my HE proposal:

http://www.radiotap.org/fields/HE
http://www.radiotap.org/fields/HE-MU
http://www.radiotap.org/fields/HE-MU-user

This now basically just requires the HE field even for MU
transmissions, with the HE-MU field giving some more detail of those;
the HE-MU-user is just for completeness so one can capture the SIG-B
for multiple users even if the frame isn't captured.

I'll still wait for the spec to settle down more until formally
proposing this, but feedback is very welcome.

johannes
