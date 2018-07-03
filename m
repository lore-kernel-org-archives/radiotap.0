From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] 0-length PPDU reporting
Date: Tue, 03 Jul 2018 14:13:19 +0200
Message-ID: <1530619999.4735.21.camel@sipsolutions.net>
References: <1529332670.3490.50.camel@sipsolutions.net>
	 <1530542000.3117.4.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1530542000.3117.4.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

On Mon, 2018-07-02 at 16:33 +0200, Johannes Berg wrote:
> So, does anyone have anything else needed here?
> 
> ---
> title: 0-length-PPDU
> categories: [suggested]
> ---
> Bit Number
> : 26 (tentatively assigned, field data may change)
> 
> Structure
>   - u8 type
> 
> Required Alignment
> : None
> 
> Unit(s)
> : none
> 
> The presence of this field indicates that there was no PSDU in this
> PPDU,
> only the PHY data is valid and the radiotap header is not followed by an
> 802.11 header.
> 
> The type field indicates the type of PPDU.
> 
> > **type value** | **meaning** |
> > 0              | sounding PPDU |
> > 0xff           | vendor-specific |

We should add here

| 1 | data not captured |

e.g. for multi-user frames that we weren't configured to capture, etc.

johannes
