From: Matteo Croce <technoboy85-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: MCS field: RFA
Date: Tue, 26 Jan 2010 15:26:07 +0100
Message-ID: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,
the MCS filed is in the suggested fields since about a month, now I
request its approval.

Here is the draft of the field: http://www.radiotap.org/suggested-fields/MCS

and here there are patches for the radiotap parser, mac80211, tcpdump
and wireshark:

http://teknoraver.net/software/radiotap_mcs/

Before it's approved I would ask the crew what is the best thing to do
with the old rate field
when the MCS one is set.
We can leave it set with a value of 0 or just omitting it when the MCS is set.
The latter makes more sense to me.

Cheers,
Matteo Croce
