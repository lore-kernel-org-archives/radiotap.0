From: freeman <freeman.wang-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: limit radiotap header size
Date: Mon, 15 Sep 2014 20:10:55 +0000 (UTC)
Message-ID: <loom.20140915T220101-881@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi

Linux latest kernel (3.16) doc says there are only 13 argument options now.
Is it still true?

If we are concerned about the size of radiotap header and want to limit the
set of info we pass to the sniffer, can we arbitrarily remove any arguments
from the bitmap? I know it is probably designed so, just want to double check :)

Thanks
Freeman
