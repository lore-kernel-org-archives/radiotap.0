From: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 01 Dec 2009 09:05:24 -0800
Message-ID: <4B154CD4.8020700@wireshark.org>
References: <1259258152.32372.90.camel@johannes.local>	 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com> <1259659011.32171.45.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1259659011.32171.45.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Johannes Berg wrote:
> Joshua,
> 
>> For the structure of the vendor space, you extend 'skip_length' from 8
>> bits to 16 bits.
>>> Structure
>>>        u8 OUI[3], u8 sub_namespace, __le16 skip_length

What happens if someone without an OUI wants to add a vendor extension?
Do they need to purchase an OUI or IAB from the IEEE?
