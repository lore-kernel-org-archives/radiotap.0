From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: crypto flag?
Date: Wed, 7 Dec 2011 11:47:30 -0800
Message-ID: <6561D89F-D6B0-47B6-9DCC-ABDC3BAD9452@alum.mit.edu>
References: <1323283809.3404.49.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1323283809.3404.49.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


On Dec 7, 2011, at 10:50 AM, Johannes Berg wrote:

> What would you think about a radiotap flag that tells wireshark what
> happened in the packet?

Other than saying "that tells the program reading the file what happened =
in the packet" - this shouldn't be thought of as Wireshark-specific - a =
flag of that sort makes sense; if there's some information that is =
necessary or every very helpful when processing a file, and the program =
that generates the file knows that information, the ideal is to have =
that information stored in the file somewhere that allows programs =
reading the file to get it.=
