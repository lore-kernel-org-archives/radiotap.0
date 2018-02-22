From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Thu, 22 Feb 2018 12:13:55 +0100
Message-ID: <1519298035.2637.2.camel@sipsolutions.net>
References: <1517300719.2189.51.camel@sipsolutions.net>
	 <1519144938.16723.42.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1519144938.16723.42.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2018-02-20 at 17:42 +0100, Johannes Berg wrote:
> 
> > http://www.radiotap.org/fields/HE
> > http://www.radiotap.org/fields/HE-MU

Huh, looks like I've overdone it ...

The HE field and HE-MU field both define the # of HE LTF symbols ...

I'll remove it from the HE-MU field.

johannes
