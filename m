From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFA] HE support
Date: Tue, 30 Jan 2018 09:25:19 +0100
Message-ID: <1517300719.2189.51.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

It looks like the spec etc. has matured sufficiently to standardise the
radiotap for HE. Richard Sharpe has also contributed an implementation
for wireshark, and we have an implementation for our driver to report
(a subset of) the information.

Rather than copy/paste all the information into the email, here are the
links to the three newly defined fields.
http://www.radiotap.org/fields/HE
http://www.radiotap.org/fields/HE-MU
http://www.radiotap.org/fields/HE-MU-other-user

I just made a minor change here to delete the duplicated field, and add
an RU offset field (with known flag, of course).

Our implementation for Linux is in this tree:

https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git/

related commits:
17df37ef01e234f06458ba6a8ca35303a4323db0
9dadcd648cb0e4dd64fb0df87257bbf1abeb5c19
a3e502d6096bb2b82550027324084c17602b56cd
a76d55a9481e2c7136bf72a4c7682048a0331aef
edb94a27eac211e0dd66920919895d7a27539d32
e374d21c07c23d391c913cc3a61f728df4089253

fdea7e21cd1a743232b70c370b1bb1199d487598
fabf74cdf60527eb2d5f76362fd40ba135853aa3
a10e644921c2d6b5ced56bb44fa2ff312ffae982
5126862ce3cea626fb0f9b4918e8b5d77803f6ba

(but you can just look at the code in net/mac80211/rx.c and
drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c)

We'll bring that upstream once radiotap is adopted.

Richard Sharpe's wireshark code is even partially merged already, see
here:
https://code.wireshark.org/review/#/c/25479/
https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commit;h=731a901a3e25839ef3e0d89a0a21edc69ae474df
https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commit;h=5f6571913b74c251abb45d2fec8c66f3c7cbe36d
https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commit;h=8d6202df4559d144bc8edc6fdf4bfa6112fe746f


So let's also start 3 weeks commenting period for this, I think whoever
is interested probably already saw it anyway :-)

johannes
