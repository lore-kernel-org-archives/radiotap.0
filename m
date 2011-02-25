From: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Subject: Re: Sample parser for radiotap header
Date: Fri, 25 Feb 2011 19:36:17 +0100
Message-ID: <4D67F6A1.6060301@create-net.org>
References: <408dc500-c062-ede0-c040-d21a120a386c@me.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------030306050007070701050202"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <408dc500-c062-ede0-c040-d21a120a386c-BUHhN+a2lJ4@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Cc: radiotap-qavaossjCcEdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

This is a multi-part message in MIME format.
--------------030306050007070701050202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/02/2011 07:16, Bill Stafford ha scritto:
>
> The radiotap.org site has a section for Parser Libraries where it lists:
> http://git.sipsolutions.net/radiotap.git/
Is this supposed to know about extended present bitmask? I'm creating a
packet with four chained present bitmask in order to specify a MRR chain.

The problem is that when I'm trying to parse the header with the lib only
the first "block" is parsed. In fact when I use the function:

ieee80211_radiotap_iterator_next

I get ENOENT as return code when the bit 31 is reached. Same result
i I try to pass this packet to the linux kernel where the iterator 
implementation
is the same.
>
> -Bill
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


--------------030306050007070701050202
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
    <title></title>
  </head>
  <body bgcolor="#ffffff" text="#000000">
    Il 24/02/2011 07:16, Bill Stafford ha scritto:<br>
    <blockquote cite="mid:408dc500-c062-ede0-c040-d21a120a386c-BUHhN+a2lJ4@public.gmane.org"
      type="cite"><span></span>
      <div><span><br>
        </span></div>
      <div><span>The radiotap.org site has a section for Parser
          Libraries where it lists:</span></div>
      <div><span><span class="Apple-style-span" style="font-family:
            sans-serif; font-size: 16px;"><a moz-do-not-send="true"
              class="http"
              href="http://git.sipsolutions.net/radiotap.git/"
              style="color: green; border-width: 0px; text-decoration:
              underline;">http://git.sipsolutions.net/radiotap.git/</a></span></span></div>
    </blockquote>
    Is this supposed to know about extended present bitmask? I'm
    creating a <br>
    packet with four chained present bitmask in order to specify a MRR
    chain.<br>
    <br>
    The problem is that when I'm trying to parse the header with the lib
    only<br>
    the first "block" is parsed. In fact when I use the function:<br>
    <br>
    ieee80211_radiotap_iterator_next<br>
    <br>
    I get ENOENT as return code when the bit 31 is reached. Same result<br>
    i I try to pass this packet to the linux kernel where the iterator
    implementation<br>
    is the same.<br>
    <blockquote cite="mid:408dc500-c062-ede0-c040-d21a120a386c-BUHhN+a2lJ4@public.gmane.org"
      type="cite">
      <div><span><br>
        </span></div>
      <div><span>-Bill</span></div>
      <div><span><br>
        </span></div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
--------------------------------------------------------
Roberto Riggio, Ph.D.
CREATE-NET
Network &amp; Security Solutions for Pervasive Computing Systems (iNSPIRE)
Senior Researcher
Via alla Cascata 56/D - 38123 Povo Trento (Italy)
e-mail: <a class="moz-txt-link-abbreviated" href="mailto:roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org">roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org</a>
Tel: (+39) 0461 408400 - interno/extension 708
Fax: (+39) 0461 421157
<a class="moz-txt-link-abbreviated" href="http://www.create-net.org/~rriggio">www.create-net.org/~rriggio</a>
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
</pre>
  </body>
</html>

--------------030306050007070701050202--
