From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Wed, 22 Feb 2017 12:54:46 +0100
Message-ID: <1487764486.2215.5.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
	 <1487162908.31885.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1487162908.31885.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

> Something like
> 
> http://www.radiotap.org/fields/HE
> 
> but I'm not really sure
> * if sig_B_user[1] should be in HE or in HE multiuser
> * if 3 bits are really needed for the Center 26-tone RU field, I'm
> not sure how it could be non-present

It really can be non-present, obviously SIG-B common field is already
variable length :)

Anyway, that proposal missed a number of things and didn't really make
any sense, here's a new one:

http://www.radiotap.org/fields/HE
http://www.radiotap.org/fields/HE-MU-common
http://www.radiotap.org/fields/HE-MU-user

One thing I like less about this is that the bitrate of the MPDU will
be recorded in the "HE" field for SU/trigger-based PPDUs, but in the
"HE-MU-user" field for MU PPDUs. But since all the data is present, I
guess that's actually fine.

johannes
