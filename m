From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: multi-antenna handling
Date: Wed, 25 Jun 2014 17:11:45 +0200
Message-ID: <1403709105.4140.13.camel@jlt4.sipsolutions.net>
References: <1345481425.4459.46.camel@jlt3.sipsolutions.net>
	 <1373273952.8312.7.camel@jlt4.sipsolutions.net>
	 <C7AC152F-CCC4-48E7-B752-71655EFD0C58@alum.mit.edu>
	 <1403679889.4140.2.camel@jlt4.sipsolutions.net>
	 <20140625090901.fa121a689f823f3af1db1e3a@lm7.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20140625090901.fa121a689f823f3af1db1e3a-yxGd9NVxpOI@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Matteo Cypriani <mcy-yxGd9NVxpOI@public.gmane.org>
Cc: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, 2014-06-25 at 09:09 -0400, Matteo Cypriani wrote:

> I observed the same on TP-Link TL-WDR3500 (which is also ath9k-based), and
> assumed the signal in the first namespace was an average of the two others.
> Should I understand this may be a wrong assumption?

Ah, there's a value in the first part, without per-antenna information -
that's the max of the per-antenna values.

johannes
