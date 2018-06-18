From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA v2] HE support
Date: Mon, 18 Jun 2018 15:56:39 +0200
Message-ID: <1529330199.3490.22.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Starting a new thread for this...

I think between reviews and using it in the first three 11ax plugfests
we've nailed down the bits enough to really standardise them now. I know
of one thing that's missing, which is the MIMO configuration in trigger-
based PPDUs - this isn't part of the HE-SIG-A because it's in the
trigger frame, and might never be. As we don't have any spare (2+6 for
known+data) bits in the HE radiotap data and only trigger-based PPDUs
would carry this, I'd propose a new field if these end up being needed.

Rather than copy/pasting everything, here are the definitions:

http://www.radiotap.org/fields/HE
http://www.radiotap.org/fields/HE-MU
http://www.radiotap.org/fields/HE-MU-other-user


Most of the HE support was already implemented in wireshark by Richard
(partially at least working for the WFA), thanks!

So as far as patches are concerned, we have that already in wireshark,
and producers are in our tree:

https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git/

We'll be upstreaming those in due course.


It's only been half a year since the first posting, so I guess we can do
another 3-week commenting period ;-)

johannes
