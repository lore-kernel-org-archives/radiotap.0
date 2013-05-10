From: Lee Hambley <lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: ieee80211_radiotap_iterator_next return values
Date: Fri, 10 May 2013 14:55:54 +0200
Message-ID: <CAN_+VLVY9OY5OdAHs6mdzKLXcubAbHPXprsQis58+_ze939hQw@mail.gmail.com>
References: <CAN_+VLVe6D=HLeKynF1OLnv=X4Pn34xfDUsR1rvVCCR5BB5xdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=047d7b414c2efd3fd504dc5cafdf
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAN_+VLVe6D=HLeKynF1OLnv=X4Pn34xfDUsR1rvVCCR5BB5xdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

--047d7b414c2efd3fd504dc5cafdf
Content-Type: text/plain; charset=UTF-8

Hi Guys,

I'm new on the list, playing around trying to extract the radiotap headers
from IEEE802.11 traffic, specifically relating to signal strength/etc.

I've got some code that is using the functions
ieee80211_radiotap_iterator_init() and ieee80211_radiotap_iterator_next()
 from radiotap-parser.c,

I'm not sure what I'm doing incorrectly, perhaps someone can educate me?
I'm using the sample code from
http://www.cs.fsu.edu/~baker/devices/lxr/http/source/linux/Documentation/networking/radiotap-headers.txt?v=2.6.25more
or less without modification, it fits very well to what I was trying
to achieve:

 /* where packet is `const u_char *packet' */

struct ieee80211_radiotap_iterator rti;
struct ieee80211_radiotap_header *rth = ( struct ieee80211_radiotap_header
* ) packet;
int ret = ieee80211_radiotap_iterator_init(&rti, rth, rth->it_len);
while(!ret) {
  printf("Itteration: %d\n", count++);
  ret = ieee80211_radiotap_iterator_next(&rti);
  if(ret) {
    continue;
  }
  switch(rti.this_arg_index) {
  default:
    printf("Constant: %d\n", *rti.this_arg);
    break;
  }
}

There's limited scope for having screwed something up in that code, I
think, I'm confused by the `1' being returned from `
ieee80211_radiotap_iterator_init' which according to the implenentation
doesn't seem like an error condition in the implementation
http://lxr.free-electrons.com/source/net/wireless/radiotap.c#L95

Thanks for anything anyone on the list can suggest, I'm out of my element
working at such a low level in C, but needs must!

- Lee Hambley

--047d7b414c2efd3fd504dc5cafdf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Hi Guys,
<div><br></div><div>I&#39;m new on the list, playing around trying to extra=
ct the radiotap headers from IEEE802.11 traffic,=C2=A0specifically=C2=A0rel=
ating to signal strength/etc.</div><div><br></div><div>I&#39;ve got some co=
de that is using the functions=C2=A0<span style=3D"color:rgb(153,0,0);font-=
family:Consolas,&#39;Liberation Mono&#39;,Courier,monospace;font-size:12px;=
font-weight:bold;line-height:18px;white-space:pre-wrap">ieee80211_radiotap_=
iterator_init()</span>=C2=A0and=C2=A0<span style=3D"color:rgb(153,0,0);font=
-family:Consolas,&#39;Liberation Mono&#39;,Courier,monospace;font-size:12px=
;font-weight:bold;line-height:18px;white-space:pre-wrap">ieee80211_radiotap=
_iterator_next()</span>=C2=A0from=C2=A0radiotap-parser.c,=C2=A0</div>

<div><br></div><div>I&#39;m not sure what I&#39;m doing incorrectly, perhap=
s someone can educate me? I&#39;m using the sample code from=C2=A0<a href=
=3D"http://www.cs.fsu.edu/~baker/devices/lxr/http/source/linux/Documentatio=
n/networking/radiotap-headers.txt?v=3D2.6.25" target=3D"_blank">http://www.=
cs.fsu.edu/~baker/devices/lxr/http/source/linux/Documentation/networking/ra=
diotap-headers.txt?v=3D2.6.25</a> more or less without modification, it fit=
s very well to what I was trying to achieve:</div>

<div><br></div><font face=3D"courier new, monospace">=C2=A0/* where packet =
is `const u_char *packet&#39; */<br><br>struct ieee80211_radiotap_iterator =
rti;<br>struct ieee80211_radiotap_header *rth =3D ( struct ieee80211_radiot=
ap_header * ) packet;<br>

int ret =3D ieee80211_radiotap_iterator_init(&amp;rti, rth, rth-&gt;it_len)=
;<br>while(!ret) {<br>=C2=A0 printf(&quot;Itteration: %d\n&quot;, count++);=
<br>=C2=A0 ret =3D ieee80211_radiotap_iterator_next(&amp;rti);<br>=C2=A0 if=
(ret) {<br>=C2=A0 =C2=A0 continue;<br>

=C2=A0 }<br>=C2=A0 switch(rti.this_arg_index) {<br></font><span style=3D"fo=
nt-family:&#39;courier new&#39;,monospace">=C2=A0 default:</span><font face=
=3D"courier new, monospace"><br>=C2=A0 =C2=A0 printf(&quot;Constant: %d\n&q=
uot;, *rti.this_arg);<br>

=C2=A0 =C2=A0 break;<br>=C2=A0 }</font><div><font face=3D"courier new, mono=
space">}</font></div><div><font face=3D"courier new, monospace"><br></font>=
</div><div><font face=3D"arial, helvetica, sans-serif">There&#39;s limited =
scope for having screwed something up in that code, I think, I&#39;m confus=
ed by the `</font><font face=3D"courier new, monospace">1</font><font face=
=3D"arial, helvetica, sans-serif">&#39; being returned from `</font><span s=
tyle=3D"font-family:&#39;courier new&#39;,monospace">ieee80211_radiotap_ite=
rator_init</span><span style=3D"font-family:arial,helvetica,sans-serif">&#3=
9; which according to the implenentation doesn&#39;t seem like an error con=
dition in the implementation=C2=A0</span><font face=3D"arial, helvetica, sa=
ns-serif"><a href=3D"http://lxr.free-electrons.com/source/net/wireless/radi=
otap.c#L95" target=3D"_blank">http://lxr.free-electrons.com/source/net/wire=
less/radiotap.c#L95</a></font></div>

<div><font face=3D"arial, helvetica, sans-serif"><br></font></div><div><fon=
t face=3D"arial, helvetica, sans-serif">Thanks for anything anyone on the l=
ist can suggest, I&#39;m out of my element working at such a low level in C=
, but needs must!</font></div>
<span class=3D"HOEnZb"><font color=3D"#888888">
<div><font face=3D"arial, helvetica, sans-serif"><br></font></div><div><fon=
t face=3D"arial, helvetica, sans-serif">- Lee Hambley</font></div></font></=
span></div>
</div><br></div>

--047d7b414c2efd3fd504dc5cafdf--
