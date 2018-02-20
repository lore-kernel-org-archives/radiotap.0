From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Tue, 20 Feb 2018 14:01:31 +0100
Message-ID: <1519131691.16723.35.camel@sipsolutions.net>
References: <1517300719.2189.51.camel@sipsolutions.net>
	 <1519119420.16723.26.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1519119420.16723.26.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2018-02-20 at 10:37 +0100, Johannes Berg wrote:
> On Tue, 2018-01-30 at 09:25 +0100, Johannes Berg wrote:
> 
> > Rather than copy/paste all the information into the email, here are the
> > links to the three newly defined fields.
> > http://www.radiotap.org/fields/HE
> > http://www.radiotap.org/fields/HE-MU
> > http://www.radiotap.org/fields/HE-MU-other-user
> > 
> > I just made a minor change here to delete the duplicated field, and add
> > an RU offset field (with known flag, of course).
> 
> Oops, I have to make another update to this - we need a
> "primary/secondary 80 MHz bit" (along with validity).
> 
> I think I'll put that into data2 bits 0/31, any objections?

Just found another thing too.

In HE-MU, I had defined:
flags1: 0x0080: Bandwidth from SIG-A known
flags2: 0x0007: Bandwidth from SIG-A

Where this was intended to be like in the spec, which means:
 0 - 20 MHz non-puncturing
 1 - 40 MHz non-puncturing
 2 - 80 MHz non-puncturing
 3 - 160/80+80 MHz non-puncturing
 4/5/6/7 - the various puncturing modes


I think it'd be better to split this:
flags1: 0x0080: reserved
flags2: 0x0003: bandwidth from bw field in HE-SIG-A with the values
                 0 - 20 MHz
                 1 - 40 MHz
                 2 - 80 MHz
                 3 - 160/80+80 MHz
flags2: 0x0004: bandwidth from bw field in HE-SIG-A known
flags2: 0x0008: preamble puncturing from bw field in HE-SIG-A known
flags2: 0x0300: preamble puncturing from bw field in HE-SIG-A,
                with the values
                 0 - non-puncturing mode
                 1 - punctured secondary 20 MHz
                     (in primary 80 MHz if applicable)
                     [maps to HE-SIG-A bandwidth values 4 or 6]
                 2 - punctured but primary 40 MHz is presented
                     (in primary 80 MHz if applicable)
                     [maps to HE-SIG-A bandwidth values 5 or 7]

Richard, did you do any work on the HE-MU field yet that would collide
with such a change?

johannes
