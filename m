From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFA] HT extensions
Date: Wed, 06 Oct 2010 11:23:36 +0200
Message-ID: <1286357016.3655.33.camel@jlt3.sipsolutions.net>
References: <1284595489.3707.54.camel@jlt3.sipsolutions.net>
	 <20101005182108.GH14183@ojctech.com>
	 <1286303263.3641.23.camel@jlt3.sipsolutions.net>
	 <20101005184252.GI14183@ojctech.com>
	 <1286304616.3641.25.camel@jlt3.sipsolutions.net>
	 <20101005185636.GJ14183@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20101005185636.GJ14183-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2010-10-05 at 13:56 -0500, David Young wrote:

> I favor leaving it off for now.

I was just editing my proposal for that, and it occurred to me that now
we have only one a-MPDU bit here in the MCS field, and technically
non-MCS frames can also be aggregated, so it never really belonged here
anyway.

Therefore, what do you think of these changes:

1) remove the a-MPDU bit from the MCS field completely

2) add a new a-MPDU field with the following definition:

bit number: 20
structure: u8 flags_idx
required alignment: 1

The presence of this field indicates that the frame was received as part
of an a-MPDU. The format of the flags_idx field is as follows:

bit 7:     index field valid, otherwise the index isn't known
bits 6-0:  index field -- zero-based index of
           this MPDU within the a-MPDU

(technically, only bits 5-0 are required for the index, because it can
only go up to 63)

johannes
