From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: limit radiotap header size
Date: Tue, 16 Sep 2014 14:18:08 +0200
Message-ID: <1410869888.2335.6.camel@jlt4.sipsolutions.net>
References: <loom.20140915T220101-881@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <loom.20140915T220101-881-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: freeman <freeman.wang-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2014-09-15 at 20:10 +0000, freeman wrote:

> Linux latest kernel (3.16) doc says there are only 13 argument options now.
> Is it still true?

Where does it say that? I don't think there's any size limit on the
radiotap header since multiple things could show up multiple times etc.
and with the vendor namespace you could carry all kinds of other things.

> If we are concerned about the size of radiotap header and want to limit the
> set of info we pass to the sniffer, can we arbitrarily remove any arguments
> from the bitmap? I know it is probably designed so, just want to double check :)

Not really, no, you'd have to adjust the rest of the header as well,
basically parse and recreate it. Why would you want to anyway though?

johannes
