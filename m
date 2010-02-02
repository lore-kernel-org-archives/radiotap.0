From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Tue, 2 Feb 2010 17:36:17 +0000 (UTC)
Message-ID: <loom.20100202T174119-204@post.gmane.org>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Matteo Croce <technoboy85@...> writes:
> Before it's approved I would ask the crew what is the best
> thing to do with the old rate field when the MCS one is set.
> We can leave it set with a value of 0 or just omitting it when
> the MCS is set.  The latter makes more sense to me.

Omitting the Rate field seems like the most logical, but does not
help out legacy parsers. The Rate field can represent the 20 MHz
HT rates up to MCS 14 (13 ShortGI), and some of the higher
indexes. This means a legacy parser could show accurate rate for
all but the highest phy rates if the Rate field was included.

You mention the possibility of leaving the Rate field in with a
value of 0. That would be a good obvious key for someone looking
over a capture to know that the rate could not be represented.

Another option would be to peg the rate value at the max (an odd
looking 127.5 Mbps). On the downside, this might be confusing if
someone looking over a capture did not know this was an invalid
11n data rate. But on the upside, it is helpful for wireshark
filters like "radiotap.datarate < 48" when you are trying to see
any traffic that falls below 24 Mbps for example. Even making the
filter "radiotap.datarate < 48 && radiotap.datarate != 0" would
not let you test for < 24 Mbps since some of the HT rates are
less than 24 Mbps.

Leaving the Rate field in place and setting to the max when
needed seems like it would be more helpful to legacy parsers. New
parsers can just ignore the Rate field if MCS is present and
calculate the rate from the MCS and other transmit factors (GI,
Bandwidth).

Hope this is helpful in discussion.

-Bill
