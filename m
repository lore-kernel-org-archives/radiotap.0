From: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Subject: Re: Sample parser for radiotap header
Date: Wed, 02 Mar 2011 09:42:46 +0100
Message-ID: <4D6E0306.1020307@create-net.org>
References: <408dc500-c062-ede0-c040-d21a120a386c@me.com>	 <4D67F6A1.6060301@create-net.org> <1299054063.4076.2.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1299054063.4076.2.camel-8upI4CBIZJIJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>, radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Il 02/03/2011 09:21, Johannes Berg ha scritto:
> You must be doing something wrong then, it is definitely parsing such
> radiotap headers, hopefully correctly. There are examples in the check/
> directory for it, e.g. 00.bin:
> 00000000  00 00 20 00 01 00 00 a0  01 00 00 00 00 00 00 00
> 00000010  11 22 33 44 55 66 77 88  aa bb cc dd ee ff 00 11
>
> is a radiotap header with two TSFT fields. I think you most likely
> forgot to reset the namespace.
Could you elaborate on this? What I'm doing is basically the following:

int ret = ieee80211_radiotap_iterator_init(&iterator, rthdr, skb->len, 
NULL);

the in the while loop i use:

ret = ieee80211_radiotap_iterator_next(&iterator);

and check the value of: iterator.this_arg_index

What do you mean by resetting the namespace?
> johannes

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
