From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA v3] TLV fields for radiotap
Date: Tue, 09 Apr 2019 13:21:19 +0200
Message-ID: <41a106db07ca04143ab20f668f0021a9d530ecd4.camel@sipsolutions.net>
References: <d1429268e48cd744bf4ed5fca04959821de2cda6.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-75iV/qd3d4VzHGD/erA9"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <d1429268e48cd744bf4ed5fca04959821de2cda6.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org


--=-75iV/qd3d4VzHGD/erA9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Some code to back this up :-)

Here's a preliminary wireshark patch:
https://p.sipsolutions.net/0ad94ec27dbe26ad.txt

It works, but it's debatable if we really should add everything inside
the TLV. I guess we sort of should, but it makes looking for things a
bit tricky, so I guess at least we should resolve the name of the field
in the item_tree.

I should probably also rename item -> field here and in the proposed
spec text.

Here's a very rudimentary - and sort of wrong - patch for hwsim to
generate a sample capture file.

https://p.sipsolutions.net/83c6ff1e85e3e678.txt

It's wrong because it shouldn't put the channel field into a TLV, but
that's good for demonstrating what happens.

Finally, attached is a single packet capture from a test run over hwsim,
which can be used with wireshark.


Once this is adopted I'd try to get the wireshark base changes in, and
then really using it will only happen with future fields, e.g. S1G.

johannes

--=-75iV/qd3d4VzHGD/erA9
Content-Type: application/vnd.tcpdump.pcap; name="tlv-example.pcap"
Content-Disposition: attachment; filename="tlv-example.pcap"
Content-Transfer-Encoding: base64

1MOyoQIABAAAAAAAAAAAAAAABAB/AAAAYH+sXH8bBQBMAQAATAEAAAAAQgAHAAAQIqybGheGBQAA
DLu7AwAEADwUwAAtAAoAIiIiIiIiIiIiIv//HgASABEiM0RVAFpaIiIiIiIiIiIiIkAAAAD/////
//8CAAAAAAD///////8AAAAAAQgMEhgkMEhgbC0afhAb//8AAAAAAAAAAAAAAQAAAAAAAAAAAAB/
CgQASgIBQABAAAG/DPoEgAOqqgAAqqoAAP8eIwF4yBJAABy/zgAAAAAAAAAA+v/6//r/+v/6//r/
3XAAUPIEEEoAARAQOgABABAIAAIxSBBHABA2LbR7pTpRkYj7VFi5hrLkEFQACAAAAAAAAAAAEDwA
AQMQAgACAAAQCQACAAAQEgACAAAQIQABIBAjAAEgECQAASAQEQAIRGV2aWNlIEEQSQAGADcqAAEg
3RFQb5oJAgIAJQAGBQBYWARRC3IA3QdQb5oWAwED


--=-75iV/qd3d4VzHGD/erA9--
