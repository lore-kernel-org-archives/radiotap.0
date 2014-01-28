From: krama <krama.one-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: radiotap header used in packet injection on monitor mode
Date: Tue, 28 Jan 2014 09:51:23 +0000 (UTC)
Message-ID: <loom.20140128T105036-85@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

In our internal tests we make use of monitor mode (on wireshark) for all the
debugging, especially with security related issues (as packets are
already decrypted).

As i am "injecting the packet on to the network" using a "simulator" built
by own (very similar to the file2air) with the help of lorcon library, there
we are setting the radiotap header as 14 bytes and writing the buffer on to
the sockets and sending the frame.

But when the same frame is captured in wireshark is having different header
length. Why is it happening so ?

Is it the problem in setting the radiotap header arguments in lorcon or what.

Thanks & Regards
Krama
