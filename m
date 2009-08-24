From: Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Plans for an online meeting regarding Radiotap
Date: Mon, 24 Aug 2009 12:02:33 -0700
Message-ID: <8B11094E-7E69-446B-AE03-49BD3E28224D@alum.mit.edu>
References: <4A8EAFA6.9010608@gmail.com> <EE141467-6B64-48B1-AC4C-EA5BD08BDB00@alum.mit.edu>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <EE141467-6B64-48B1-AC4C-EA5BD08BDB00-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Richard Farina <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Kershaw <dragorn-8I8a9W+rkIX1ZkIrOfZKgqxOck334EZe@public.gmane.org>, Sam Leffler <sam-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Rafael Laufer <rlaufer-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Damien Bergamini <damien.bergamini-GANU6spQydw@public.gmane.org>, Sepherosa Ziehau <sepherosa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas d'Otreppe <tdotreppe-Vd9GllorE+ZAczc9/5Kimg@public.gmane.org>, radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org


On Aug 24, 2009, at 11:55 AM, Guy Harris wrote:

>> Wireshark:
>> Field 14: RX flags, with option to decode FCS instead
>> Fields 15...17 skipped
>
> No:
>
> Fields 15...17: not implemented, so if any of them are present, no  
> later fields are dissected
>
> Also:
>
> Tcpdump top-of-tree at tcpdump.org:
>
> Fields 14...17: not implemented, so if any of them are present, no  
> later fields are dissected
> Field 18: extended channel

Although field 18 is, I think, used only by FreeBSD, and it doesn't  
use fields 15-17, so those won't cause a problem for field 18.

>> My current proposal for the future standard field ordering beyond  
>> field 14:
>>
>> Field 14: RX flags (as defined by the standard)
>> Field 15: TX flags (as used by Linux, NetBSD and aircrack-ng)
>> Field 16: RTS retry count (as used by Linux and NetBSD)
>> Field 17: Data retry count (as used by Linux and NetBSD)
>> Field 18: Extended channel (as used by FreeBSD and Wireshark)
>
> ...and top-of-tree tcpdump.org tcpdump (taken from FreeBSD's tcpdump).

Sorry, that was a bit unclear - "...and top-of-tree tcpdump.org  
tcpdump (taken from FreeBSD's tcpdump)" applies to field 18, not to  
the other fields.

We should probably add support for field 14 (as defined by the  
standard) to tcpdump.
