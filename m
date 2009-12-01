From: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 1 Dec 2009 13:37:21 -0800
Message-ID: <43e72e890912011337l704c68ebscea8fd23160f7a8b@mail.gmail.com>
References: <1259258152.32372.90.camel@johannes.local> <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
	<1259659011.32171.45.camel@johannes.local> <4B154CD4.8020700@wireshark.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <4B154CD4.8020700-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, Dec 1, 2009 at 9:05 AM, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org> wrote:
> Johannes Berg wrote:
>> Joshua,
>>
>>> For the structure of the vendor space, you extend 'skip_length' from 8
>>> bits to 16 bits.
>>>> Structure
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 OUI[3], u8 sub_namespace, __le16 skip_le=
ngth
>
> What happens if someone without an OUI wants to add a vendor extension?
> Do they need to purchase an OUI or IAB from the IEEE?

No, you can use a locally administered OUI, there is a bit on the OUI
you can use to mark this.

  Luis
