From: Krishna Chaitanya <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Query] Decryption and Monitor Mode
Date: Wed, 6 Nov 2013 01:22:20 +0530
Message-ID: <CABPxzY++gCivs1u8nDtAeB5=p+ZkGHXmOnqud1hkh=TWB5Xprg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

In our internal tests we make use of monitor mode heavily for all the
debugging, especially with security related issues (as packets are
already decrypted).

But as the decryption is done in HW (most cases), the HW decrypts the
packet but still retains the Security Header and sends to the host (at
least in our solution), we remove that header while giving the packet
to network stack but while giving it to the monitor mode we do not
strip off that and also protection=1.

With this wireshark is not able to decode the packets, even thought
they are decrypted. I propose 2 solutions

Radiotap and Wireshark:

1) Add 2 flags to the radiotap RX Flags (HW Decrypted the packet,
Packet has security Header (for some chipsets which consume the
security header as well..??).)

Based on these the wireshark dissector decodes the packet accordingly.

mac80211:

2) Remove the security header information in the monitor path as well
based on the existing RX_FLAGS.


Solutions 2 looks more elegant and simple, any comments?

-- 
Thanks,
Regards,
Chaitanya T K.
