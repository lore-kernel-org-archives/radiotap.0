From: Lee Hambley <lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: ieee80211_radiotap_iterator_next return values
Date: Fri, 10 May 2013 16:40:23 +0200
Message-ID: <CAN_+VLX8_suEo_=C2sXoz00aRNtbAtpmKjfVUZVHc1RQbe29ew@mail.gmail.com>
References: <CAN_+VLVe6D=HLeKynF1OLnv=X4Pn34xfDUsR1rvVCCR5BB5xdg@mail.gmail.com>
	<CAN_+VLVY9OY5OdAHs6mdzKLXcubAbHPXprsQis58+_ze939hQw@mail.gmail.com>
	<1368192729.8390.17.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=089e0122a146acf6e704dc5e25b4
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1368192729.8390.17.camel-8Nb76shvtaUJvtFkdXX2HixXY32XiHfO@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

--089e0122a146acf6e704dc5e25b4
Content-Type: text/plain; charset=UTF-8

Hi Johannes,

I hadn't even considered that, I'll have to go and have a look for the
userspace implementation of those functions, I'd suppose that the ones I
have pulled in are probably from the kernel if they are returning `1`.

Are these functions included with any of the radiotap (tcpdump, libpcap in
particular) codebases? Or something similar.

Thanks, good to know I did manage to register myself for the list correctly!

Lee Hambley
--
http://lee.hambley.name/
+49 (0) 170 298 5667


On 10 May 2013 15:32, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:

> On Fri, 2013-05-10 at 14:55 +0200, Lee Hambley wrote:
>
> > int ret = ieee80211_radiotap_iterator_init(&rti, rth, rth->it_len);
> > while(!ret) {
> >   printf("Itteration: %d\n", count++);
> >   ret = ieee80211_radiotap_iterator_next(&rti);
>
> >
> > There's limited scope for having screwed something up in that code, I
> > think, I'm confused by the `1' being returned from
> > `ieee80211_radiotap_iterator_init' which according to the
> > implenentation doesn't seem like an error condition in the
> > implementation
> http://lxr.free-electrons.com/source/net/wireless/radiotap.c#L95
>
> I think you're confusing the userspace and Linux kernel implementation,
> though they're very similar. In any case,
> ieee80211_radiotap_iterator_next() cannot return 1, unless one of the
> error values is defined to -1 (it returns -EINVAL and a few others)
>
> johannes
>
>
>

--089e0122a146acf6e704dc5e25b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Johannes,<div><br></div><div>I hadn&#39;t even consider=
ed that, I&#39;ll have to go and have a look for the userspace implementati=
on of those functions, I&#39;d suppose that the ones I have pulled in are p=
robably from the kernel if they are returning `1`.</div>
<div><br></div><div style>Are these functions included with any of the radi=
otap (tcpdump, libpcap in particular) codebases? Or something similar.</div=
><div style><br></div><div style>Thanks, good to know I did manage to regis=
ter myself for the list correctly!</div>
</div><div class=3D"gmail_extra"><br clear=3D"all"><div>Lee Hambley<div>--<=
/div><div><a href=3D"http://lee.hambley.name/" target=3D"_blank">http://lee=
.hambley.name/</a></div><div>+49 (0) 170 298 5667</div></div>
<br><br><div class=3D"gmail_quote">On 10 May 2013 15:32, Johannes Berg <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org" target=3D"_b=
lank">johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"im">On Fri, 2013-05-10 at 14:55 +0200, Lee Hambley wrote:<br>
<br>
&gt; int ret =3D ieee80211_radiotap_iterator_init(&amp;rti, rth, rth-&gt;it=
_len);<br>
&gt; while(!ret) {<br>
&gt; =C2=A0 printf(&quot;Itteration: %d\n&quot;, count++);<br>
&gt; =C2=A0 ret =3D ieee80211_radiotap_iterator_next(&amp;rti);<br>
<br>
&gt;<br>
</div><div class=3D"im">&gt; There&#39;s limited scope for having screwed s=
omething up in that code, I<br>
&gt; think, I&#39;m confused by the `1&#39; being returned from<br>
&gt; `ieee80211_radiotap_iterator_init&#39; which according to the<br>
&gt; implenentation doesn&#39;t seem like an error condition in the<br>
&gt; implementation <a href=3D"http://lxr.free-electrons.com/source/net/wir=
eless/radiotap.c#L95" target=3D"_blank">http://lxr.free-electrons.com/sourc=
e/net/wireless/radiotap.c#L95</a><br>
<br>
</div>I think you&#39;re confusing the userspace and Linux kernel implement=
ation,<br>
though they&#39;re very similar. In any case,<br>
ieee80211_radiotap_iterator_next() cannot return 1, unless one of the<br>
error values is defined to -1 (it returns -EINVAL and a few others)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
johannes<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--089e0122a146acf6e704dc5e25b4--
