From: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Subject: Re: Fields alignment when extended mask is present
Date: Mon, 21 Feb 2011 10:47:49 +0100
Message-ID: <4D6234C5.2020201@create-net.org>
References: <4D60F317.8090007@create-net.org> <1298280460.3707.1.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1298280460.3707.1.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Il 21/02/2011 10:27, Johannes Berg ha scritto:
> On Sun, 2011-02-20 at 11:55 +0100, Roberto Riggio wrote:
>> Hi,
>>
>> I'm generating a radio tap header with extended mask in order to
>> specify a multi rate retry chain. In the first mask i have 4 fields
>> each of them 8 bits long, so no padding problem.
>>
>> In the second, third and forth mask I have only the rate and the retries
>> fields should I use padding between one mask and the next:
>>
>> rate_1 (8)
>> retry_1 (8)
>> pad (8)
>> pad (8)
>> rate_2 (8)
>> retry_2 (8)
>> pad (8)
>> pad (8)
>>
>> or insted:
>>
>> rate_1 (8)
>> retry _1 (8)
>> rate_2 (8)
>> retry _2 (8)
> What's with the "(8)"? Generally, anything in the data portion of
> radiotap needs to be padded to the right position.
(8) was the field length. in the example above i;ve repoted
two different radiotap headers where i specify twice the rate
and the retries field.

of course i know that in this case i will have to put to it-present
bitmasks and i will have to set the bit 31 of the first bitmask to 1.

what i'm not sure is if i have to pad the first "block" to the word
boundary or not.

> johannes
>


-- 
--------------------------------------------------------
Roberto Riggio, Ph.D.
CREATE-NET
Network&  Security Solutions for Pervasive Computing Systems (iNSPIRE)
Senior Researcher
Via alla Cascata 56/D - 38123 Povo Trento (Italy)
e-mail: roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org
Tel: (+39) 0461 408400 - interno/extension 708
Fax: (+39) 0461 421157
www.create-net.org/~rriggio
--------------------------------------------------------

The information transmitted is intended only for the person or entity to
which it is addressed and may contain confidential and/or privileged
material. Any review, retransmission, dissemination or other use of, or
taking of any action in reliance upon, this information by persons or
entities other than the intended recipient is prohibited according to
the Italian Law 196/2003 of the Legislature. If you received this in
error, please contact the sender and delete the material from any
computer.

Le informazioni contenute in questo messaggio di posta elettronica e nei
file allegati sono da considerarsi strettamente riservate. Il loro
utilizzo e' consentito esclusivamente al destinatario del messaggio, per
le finalita' indicate nel messaggio stesso. Qualora riceveste questo
messaggio senza esserne il destinatario, Vi preghiamo cortesemente di
darcene notizia via e-mail e di procedere alla cancellazione del
messaggio stesso dal Vostro sistema. Trattenere il messaggio stesso,
divulgarlo anche in parte, distribuirlo ad altri soggetti, copiarlo,
od utilizzarlo per finalita' diverse, costituisce comportamento
contrario ai principi dettati dal D. Lgs. 196/2003.
