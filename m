From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Proposal for an S1G header for radiotap
Date: Tue, 05 Feb 2019 10:17:41 +0100
Message-ID: <70cb8aa80158ca9f8db78815747e38366c3e8e71.camel@sipsolutions.net>
References: <CACyXjPwCydx6fumWdXdLvg-StsRcALBLc5+4fCsGDaC7tcZXCQ@mail.gmail.com>
	 <8d1bb1c53c670e7cfddfc0cf2f5e2447b2ee2ecb.camel@sipsolutions.net>
	 <CACyXjPzc--Deaecx9HuV5i0jyO5uUKFOqEeUaWWv3oYXqBqc8g@mail.gmail.com>
	 <01da01d4ba7a$08824ac0$1986e040$@gmail.com>
	 (sfid-20190201_230402_264728_5BA08FEC)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <01da01d4ba7a$08824ac0$1986e040$@gmail.com> (sfid-20190201_230402_264728_5BA08FEC)
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: yodazhong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 'Richard Sharpe' <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, 'Ray Wang' <rwang-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org>, tlin-+OaQ/Okkt+3YtjvyW6yDsg@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

> For the S-MPDU issue, S-MPDU is same as VHT single MPDU in 802.11ac.
> If there's pre-defined field for VHT single MPDU, we could use that.

Since it's kind of packed into an A-MPDU header, we have indeed added
the A-MPDU field for this to capture the EOF bit in VHT single MPDU.

> For the S1G NDP issue, I found that there's PHDR_802_11_SOUNDING_PSDU 
> for "0-length PSDU" field. That sounding PSDU means NDP sounding frame, I guess.
> So I think we could add S1G NDP frames under "0-length PSDU" field.

Sounds good to me. It would mean wireshark shows no PSDU.

johannes
