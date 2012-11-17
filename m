From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: TSFT
Date: Sat, 17 Nov 2012 10:56:24 -0800
Message-ID: <CB0A688B-46CF-4AB5-8E29-23B5F3022DD9@alum.mit.edu>
References: <50A72E17.6070207@superduper.net> <20121117064848.GO21779@pixotech.com> <1353141950.9543.3.camel@jlt4.sipsolutions.net> <20121117174600.GQ21779@pixotech.com>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20121117174600.GQ21779-Gq8g4XVd89tWk0Htik3J/w@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


On Nov 17, 2012, at 9:46 AM, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> wrote:

> Wireshark doesn't already have more than two "interpretation modes" =
for
> radiotap headers, does it?  That would be too bad.  I realize that =
there
> may be already be a mode for a particular OS....

That's the only preference setting Wireshark's radiotap dissection code =
has.

The OS in question is OpenBSD, as per

	http://www.radiotap.org/rejected-fields/FCS%20in%20header

OpenBSD's other collisions are 15 for hardware queue:

	http://www.radiotap.org/suggested-fields/hardware%20queue

rather than TX flags:

	http://www.radiotap.org/suggested-fields/TX%20flags

and RSSI:

	http://www.radiotap.org/suggested-fields/RSSI

rather than RTS retries:

	http://www.radiotap.org/suggested-fields/RTS%20retries

but the latter two are suggested fields rather than defined fields.

We could, I guess, define a "standard radiotap" link-layer type header =
value, and have dissectors that look at flags above 13 always handle =
those in the standard fashion and have programs that process radiotap =
headers in files either have a preference to control how to interpret =
the existing radiotap link-layer header type or just wire in one of the =
choices.  I don't know whether that's worth the effort.=
