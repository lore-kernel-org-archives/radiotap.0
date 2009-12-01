From: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 1 Dec 2009 08:32:04 -0800
Message-ID: <d521a2310912010832v37b8e970w588e3ace9f6fe97f@mail.gmail.com>
References: <1259258152.32372.90.camel@johannes.local>
	 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
	 <1259659011.32171.45.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1259659011.32171.45.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

Sorry, Johannes, you're right. I was kinda lost :(

Joshua

On Tue, Dec 1, 2009 at 1:16 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> w=
rote:
> Joshua,
>
>> For the structure of the vendor space, you extend 'skip_length' from 8
>> bits to 16 bits.
>> > Structure
>> > =A0 =A0 =A0 =A0u8 OUI[3], u8 sub_namespace, __le16 skip_length
>> I'm neutral on that. My question is why not extend 'sub_namespace' to
>> 16 bits too?
>
> I don't see much point in having more than 255 sub-namespaces per OUI,
> do you?
>
>> I hardly see that a vendor extension part can go over 255
>> bytes. But if that happens, it's quite likely that the extension may
>> contain more than 8 fields.
>
> Where are you taking 8 fields from? After the vendor extensions bit, the
> vendor extension puts vendor-defined presence bits into the it_present
> bitmap. Therefore, you have an unlimited number of fields per vendor
> sub-namespace, as such I see little reason to support more than 255
> sub-namespaces.
>
> johannes
>
