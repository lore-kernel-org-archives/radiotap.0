From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Tue, 20 Feb 2018 17:42:18 +0100
Message-ID: <1519144938.16723.42.camel@sipsolutions.net>
References: <1517300719.2189.51.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1517300719.2189.51.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Ok, new attempt:

> It looks like the spec etc. has matured sufficiently to standardise the
> radiotap for HE. Richard Sharpe has also contributed an implementation
> for wireshark, and we have an implementation for our driver to report
> (a subset of) the information.
> 
> Rather than copy/paste all the information into the email, here are the
> links to the three newly defined fields.
> http://www.radiotap.org/fields/HE
> http://www.radiotap.org/fields/HE-MU
> http://www.radiotap.org/fields/HE-MU-other-user

This is updated, with the following changes:

 * primary/secondary 80 MHz known & value bit
 * fixed bug with # of HE-SIG-B Symbols/MU-MIMO users known (duplicate)
 * split HE-MU HE-SIG-A bandwidth into bandwidth/puncturing

I guess that'll restart 3 weeks, even if it's basically merged into
wireshark etc. anyway so not really changeable at this point :-)

johannes
