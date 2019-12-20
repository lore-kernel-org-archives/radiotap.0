Return-path: <bounces-radiotap-owner-johannes=sipsolutions.net@radiotap.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from localhost (localhost [127.0.0.1])
	by mail.netbsd.org (Postfix) with ESMTP id D2B4484DE4
	for <radiotap@netbsd.org>; Fri, 20 Dec 2019 21:56:30 +0000 (UTC)
Received: from mail.netbsd.org ([IPv6:::1])
	by localhost (mail.netbsd.org [IPv6:::1]) (amavisd-new, port 10025)
	with ESMTP id UyJze5oIoQRa for <radiotap@netbsd.org>;
	Fri, 20 Dec 2019 21:56:30 +0000 (UTC)
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.netbsd.org (Postfix) with ESMTPS id 10D1E84DDE
	for <radiotap@netbsd.org>; Fri, 20 Dec 2019 21:56:29 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Correct radiotap header for 802.11ad
From: Guy Harris <guy@alum.mit.edu>
In-Reply-To: <4cf0c2a4a2d1cd92dff4f1a791d74523e446cf01.camel@sipsolutions.net>
Date: Fri, 20 Dec 2019 13:56:16 -0800
Message-Id: <AC268742-D34D-411A-A170-B807010E13E6@alum.mit.edu>
References: <CACyXjPzq-ePB1ux6wi_Rv3onPKXomcJcm15XJwA51u0E4W2txw@mail.gmail.com>
 <38F46E1D-1C4A-48DC-A906-9522006E8474@alum.mit.edu>
 <1606812C-649C-4C06-ABE0-AE2F4474BCD0@alum.mit.edu>
 <1440402013.3735.1.camel@sipsolutions.net>
 <CACyXjPwSZPV+U_=zQpDBpeBnhMntzEFhyJnBOw3-N8qPfyHc1A@mail.gmail.com>
 <55DE44EB.6080603@superduper.net>
 <126B842D-05EA-4510-BC9B-DB1A4AABEC12@alum.mit.edu>
 <1135A126-6A5A-4C84-A52D-13C0387609CC@alum.mit.edu>
 <1442507879.2821.9.camel@sipsolutions.net>
 <C5FF46C6-BDEE-41D8-B7E1-1EFFE9411DE3@alum.mit.edu>
 <4cf0c2a4a2d1cd92dff4f1a791d74523e446cf01.camel@sipsolutions.net>
Sender: radiotap-owner@radiotap.org
List-Id: <radiotap.netbsd.org>
List-Unsubscribe: 
 <mailto:majordomo@radiotap.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
Content-Transfer-Encoding: 8bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "radiotap@netbsd.org" <radiotap@netbsd.org>, Simon Barber <simon@superduper.net>, Richard Sharpe <realrichardsharpe@gmail.com>, linux-wireless@vger.kernel.org, Maya Erez <merez@codeaurora.org>, wil6210@qti.qualcomm.com

On Dec 11, 2019, at 12:32 AM, Johannes Berg <johannes@sipsolutions.net> wrote:

> On Tue, 2019-12-10 at 15:51 -0800, Guy Harris wrote:
>> On Sep 17, 2015, at 9:37 AM, Johannes Berg <johannes@sipsolutions.net> wrote:
> 
> Reviving an old thread :-)

Yes - it came up with the Wireshark bug in question.

>> But a presumably-Linux system does appear to use it; see Wireshark bug
>> 
>> 	https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=16272
>> 
>> For now, I'll throw a hack into Wireshark to treat a signal >= 60 GHz
>> as meaning 11ad, 
> 
> I don't think that's quite right - you'll need to do something like >=
> 56 GHz.

Yes - there's a macro in Wireshark to test whether a frequency is in the 11ad range; it was testing for frequencies between 57 and 66 GHz.  I changed the code to use that.

I also changed it to test for 57 to 71 GHz; apparently, some regulatory domains have added (US) or may add (Canada, EU) more frequencies to the range allowed.


