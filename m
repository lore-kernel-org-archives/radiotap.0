From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH] Add STBC rx flag to MCS field
Date: Mon, 07 Nov 2011 14:15:50 +0100
Message-ID: <1320671750.3993.43.camel@jlt3.sipsolutions.net>
References: <4073ad5f-c3e3-419f-98c0-0d0292a2589c@CHB500181>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4073ad5f-c3e3-419f-98c0-0d0292a2589c@CHB500181>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Wojciech Dubowik <wojciech.dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2011-11-03 at 11:50 +0100, Wojciech Dubowik wrote:

> 0x20 | STBC

> The flags field is any combination of the following:
> flag | definition

> 0x20 | STBC - 0: OFF, 1: ON

The only change is adding STBC to the MCS known and flags fields -- that
seems useful.

According to the procedures, let's start a three week timer, and if
nobody objects you should repost on Nov 28th (or so) and then adopt a
week later.

johannes
