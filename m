From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: crypto flag?
Date: Wed, 07 Dec 2011 19:50:09 +0100
Message-ID: <1323283809.3404.49.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

Just wanted to see what people think ... I frequently find myself with
different pcap files:

 * OTA files: completely encrypted frames
 * locally created files (HW crypto): IV present but frame not encrypted
 * (infrequently, with other HW: files that have protection bit w/o IVs)

wireshark has a setting for this, but I find myself switching it around
all the time.

What would you think about a radiotap flag that tells wireshark what
happened in the packet?

johannes
