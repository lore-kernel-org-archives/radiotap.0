From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Proposal for an S1G header for radiotap
Date: Tue, 05 Feb 2019 10:55:27 +0100
Message-ID: <885a63e846a5c08b111601dfd25bf352c3763538.camel@sipsolutions.net>
References: <CACyXjPwCydx6fumWdXdLvg-StsRcALBLc5+4fCsGDaC7tcZXCQ@mail.gmail.com>
	 <8d1bb1c53c670e7cfddfc0cf2f5e2447b2ee2ecb.camel@sipsolutions.net>
	 <CACyXjPzc--Deaecx9HuV5i0jyO5uUKFOqEeUaWWv3oYXqBqc8g@mail.gmail.com>
	 <01da01d4ba7a$08824ac0$1986e040$@gmail.com>
	 <CY1PR07MB27160AEE154215058A2CA4F2FF920@CY1PR07MB2716.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CY1PR07MB27160AEE154215058A2CA4F2FF920-p80jK0/XGTb2cgXex6xO0uFPX92sqiQdvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Ray Wang <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, "yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Richard Sharpe' <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Tasheng Lin <tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi,

> As to Aggregation related to A-MPDU, from 802.11ah -2016 spec it can
> be seen the field is defined in SIG-2 of SIG field of S1G_SHORT
> preamble, SIG-A2 of SIG-A field of S1G_LONG preamble, and SIG-2 of SIG
> field of S1G_1M preamble.
> 
> If looking at 802.11-2016 and Draft P802.11ax_D3.3 specs, the same
> field is defined only in HT-SIG, but not in VHT-SIG-A and VHT-SIG-B,
> and not in HE-SIG-A.
> 
> From the spec perspective regarding the Aggregation field, 802.11ah is
> different from 802.11n/ac/ax.

Well, OK. But we still use the A-MPDU field for HT/VHT/HE, even if those
are also different. We've gone for a more semantic view I guess, and you
can easily distinguish which kind of frame you had by the presence of
HT/VHT/HE fields and/or channel information.

> As you pointed out, Richard, if the existing field can be reused it
> might need some changes. If defining a new one, the existing one
> probably also needs to be handled. 
> 
> What would you suggest is the best way to tackle it?

Can you say what you actually want to capture for aggregation data? So
far you only had an "aggregation" bit, which could be easily indicated
by the presence of the A-MPDU field. But the A-MPDU reference number in
radiotap, which is something that obviously doesn't even exist in the
802.11 spec, would make sense so you know which PSDUs belonged into the
same aggregate.

johannes
