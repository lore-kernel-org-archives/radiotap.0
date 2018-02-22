From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Endianness of particular fields?
Date: Thu, 22 Feb 2018 21:19:55 +0100
Message-ID: <1519330795.2637.16.camel@sipsolutions.net>
References: <83A13AAE-2089-4ED9-97D9-EDEBDD911955@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <83A13AAE-2089-4ED9-97D9-EDEBDD911955-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2018-02-22 at 10:13 -0800, Guy Harris wrote:
> 	http://www.radiotap.org
> 
> says
> 
> 	Important Radiotap Characteristics
> 
> 		...
> 
> 	* Data is specified in little endian byte-order, all data
> fields including the it_version, it_len and it_present fields in the
> radiotap header are to be specified in little endian byte-order. This
> wiki has adopted the Linux convention of using __le64, __le32 and
> __le16 for 64-, 32- and 16-bit little endian quantities.
> 
> However, for example
> 
> 	http://www.radiotap.org/fields/dB%20TX%20attenuation.html
> 
> says:
> 
> 	Structure
> 		u16
> 
> rather than __le{anything}.

Oops.

> I presume the *intent* is that data in particular fields always be
> little-endian.  

Yes.

> Part of the problem here is that the Linux convention, used to
> describe the comment headers specifies endianness rather than
> signedness (presumably everything is unsigned), and the convention
> used for particular fields specifies signedness rather than
> endianness (presumably everything is little-endian).

Yeah.

> Should the site use the {u,s}{64,32,16,8} convention uniformly, and
> say "all multi-byte fields in all the headers and the fields are
> little-endian", to make it a little clearer that fields, as well as
> headers, are little-endian?  (Or, alternatively, say "{u,s}_le_64",
> "{u,s}_le_32", etc., or something similar with fewer underscores as
> desired?)

I think we should just use {u,s}{64,32,16,8} and drop the whole __le
thing.

I'd say we should just remove the wording about adopting the Linux
convention. We'd never use __be16 or such anyway.

johannes
