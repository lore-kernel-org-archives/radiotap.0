From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [RFC] VHT fields
Date: Tue, 12 Jun 2012 18:51:19 +0200
Message-ID: <1339519879.4531.13.camel@jlt3.sipsolutions.net>
References: <C6E8EE2D6B3ACB4582C1249E834B306505D68C@SJEXCHMB13.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <C6E8EE2D6B3ACB4582C1249E834B306505D68C-HXj2mutaA2obnnZVN+9SiJr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Alwin Beukers <alwin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: "radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org" <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Arend Van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pieter-Paul Giesberts <pieterpg-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bill Stafford <stafford-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, 2012-06-12 at 15:05 +0000, Alwin Beukers wrote:
> Hi everyone,
> 
> This is a proposal for adding support for 802.11ac. Four fields were added to the suggested-fields section:
> 
> http://www.radiotap.org/suggested-fields/SU_VHT
> http://www.radiotap.org/suggested-fields/MU_VHT
> http://www.radiotap.org/suggested-fields/GROUP_ID
> http://www.radiotap.org/suggested-fields/PARTIAL_AID
> 
> A Wireshark patch for parsing SU_VHT, GROUP_ID and PARTIAL_AID is attached.

What's the reason for splitting it up?

johannes
