From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: HE (11ax) extensions
Date: Wed, 15 Feb 2017 13:48:28 +0100
Message-ID: <1487162908.31885.1.camel@sipsolutions.net>
References: <1486992211.19813.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1486992211.19813.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2017-02-13 at 14:23 +0100, Johannes Berg wrote:
> Hi,
> 
> We're looking to add HE/11ax extensions to radiotap.

I looked more, and decided that it didn't really make a lot of sense to
parse it all and put it back together ... so instead, how about we just
put SIG-A1/A2/B common/B multiuser in?

Something like

http://www.radiotap.org/fields/HE

but I'm not really sure
* if sig_B_user[1] should be in HE or in HE multiuser
* if 3 bits are really needed for the Center 26-tone RU field, I'm not
sure how it could be non-present

Does this make sense?

johannes
