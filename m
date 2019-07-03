From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Channel field info for 6 GHz channels
Date: Wed, 3 Jul 2019 14:27:25 -0700
Message-ID: <1F1CB1A0-193E-4591-AD86-ECEA34B97030@me.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Sorry for the basic questions on this.
Has there been any discussion on 6 GHz channels representation in a =
RadioTap header?

The Channel field has a frequency field and I see flags for 5G and 2G.

Should a 6 GHz channel just be represented in the Channel field as the =
center frequency of the entire channel BW and neither bits set for 5G or =
2G? (The frequency indicates that it is a 6G channel, so no need for a =
6G bit I imagine.)

Does the channel bandwidth information get encoded in the radiotap =
header? Or it just supposed to be inferred from the cf? (I think one cf =
in 6G can only belong to one 20/40/80/160 MHz channel.=20

I hope these are simple questions that might be answered off the cuff. =
If there is some code I should look to, please point me in the right =
direction.

Thanks in advance.

-Bill=
