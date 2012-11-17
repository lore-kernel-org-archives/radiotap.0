From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: Standardisation - adding 2 bit STBC and Ness to MCS
Date: Fri, 16 Nov 2012 22:32:05 -0800
Message-ID: <50A72F65.1090902@superduper.net>
References: <4FAC5DE0.90708@superduper.net> <4FACBA13.9040509@neratec.com>  <4FAD41E4.3090803@superduper.net> <4FAD43F0.20807@superduper.net>  <1336761346.8739.3.camel@jlt3.sipsolutions.net>  <4FADE69F.9040100@superduper.net>  <1341479550.4455.36.camel@jlt3.sipsolutions.net>  <5091C0BC.4040305@superduper.net> <509312DB.7070100@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <509312DB.7070100-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Cc: Wojciech Dubowik <wojciech.dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

http://www.radiotap.org/suggested-fields/MCS%20extension%20for%20STBC%20and%20Ness

I have posted 3 patches on the proposal page (see Attachments):

1. A patch that applies to the Linux kernel v3.7-rc1 to collect the new
STBC and Ness parameters from a wireless driver, and add them into the
MCS radiotap field.
2. A patch to the Intel wireless driver in the kernel to collect STBC
and Ness information.
3. A patch to wireshark to display STBC and Ness information.

With this I believe we have everything needed to start the 3 week
comment period.

Simon Barber
