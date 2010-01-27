From: Matteo Croce <technoboy85-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Wed, 27 Jan 2010 16:32:52 +0100
Message-ID: <40101cc31001270732h3e27511bn9270e2a5a082735f@mail.gmail.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
	<20100126174728.GV1060@ojctech.com> <1264584965.25642.15.camel@johannes.local>
	<20100127153002.GC1060@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20100127153002.GC1060-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Wed, Jan 27, 2010 at 4:30 PM, David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jan 27, 2010 at 10:36:05AM +0100, Johannes Berg wrote:
>> On Tue, 2010-01-26 at 11:47 -0600, David Young wrote:
>>
>> > FreeBSD uses the flags field and the channel flags to indicate Short
>> > GI and 40 MHz frames. =C2=A0Let's adopt the FreeBSD definitions for th=
at
>> > purpose.
>>
>> I'd mostly agree, but I'm not sure what they really use the 40MHz flag
>> for. For instance, might there be value in knowing that the AP opened
>> the channel for 40MHz, but for some reason we are doing 20MHz
>> transmissions instead? And would this be an appropriate way of
>> conferring that information?
>
> I should take a closer look at the implementation. =C2=A0A per-packet rad=
io
> information header does not need to carry the information of what the
> AP could have done, but didn't, does it? =C2=A0I think it should carry th=
e
> information that describes the properties of the packet.
>
> Dave
>
> --
> David Young =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OJC Technologies
> dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org =C2=A0 =C2=A0 =C2=A0Urbana, IL * (217) 278-3933
>

The channel width is a packet property in 802.11n IIRC
