From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: radiotap library
Date: Sun, 10 Jan 2010 14:08:40 +0100
Message-ID: <1263128920.7773.14.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

As part of my work on vendor extensions, I've pulled the code from
Andy's parser into a library.

I've copied it into wireshark for the patch there, but it could also
link the library which has well-known advantages and disadvantages.

You can find the library here: http://git.sipsolutions.net/radiotap.git/
(the web interface can also create tarballs if you click on "tree" and
then "snapshot").

Would anyone be interested in this work for using it for other tools?
And also, could somebody help me link wireshark with that library?

johannes
