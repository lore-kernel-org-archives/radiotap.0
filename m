From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [ADOPTION] A-MPDU EOF bit
Date: Mon, 18 Jun 2018 15:59:48 +0200
Message-ID: <1529330388.3490.24.camel@sipsolutions.net>
References: <1516963842.2189.27.camel@sipsolutions.net>
	 <1519118967.16723.23.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1519118967.16723.23.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, 2018-02-20 at 10:29 +0100, Johannes Berg wrote:
> On Fri, 2018-01-26 at 11:50 +0100, Johannes Berg wrote:
> > Hi all,
> > 
> > As previously mentioned, here's my RFA for the EOF bit in the A-MPDU
> > field.
> > 
> > For HE in particular, we need to be able to capture the EOF bit in an
> > A-MPDU, but it also applies in VHT where single frames are really A-
> > MPDUs with just a single frame inside.
> > 
> > The change to make is the following:
> > 
> >  | **0x0010** | delimiter CRC error |
> >  | **0x0020** | delimiter CRC value known: the delimiter CRC value field is valid |
> > -| **0xffc0** | reserved |
> > +| **0x0040** | EOF value |
> > +| **0x0080** | EOF value known |
> > +| **0xff00** | reserved |
> > 
> > 
> > I have a patch to implement it in a generator here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git/commit/?id=55269b3861b4fbe21fdc6d7392cbe9c5bef98374
> > (I'll follow up with a driver patch, we have it but not pushed out yet)
> > 
> > Richard has a change for wireshark here:
> > https://code.wireshark.org/review/#/c/25472/
> > 
> > 
> > Hereby starting the 3-week discussion period :-)
> 
> Reminder - going to adopt next week.

Forgot this also, but pushed it now ...

johannes
