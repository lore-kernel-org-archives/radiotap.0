From: Lee Hambley <lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fwd: ieee80211_radiotap_iterator_next return values
Date: Fri, 10 May 2013 17:22:48 +0200
Message-ID: <CAN_+VLXwax5Ok_BJ-d2ss8M90yyMjQ8smZo4uSpwGdnSQWSH-A@mail.gmail.com>
References: <CAN_+VLVe6D=HLeKynF1OLnv=X4Pn34xfDUsR1rvVCCR5BB5xdg@mail.gmail.com>
	<CAN_+VLVY9OY5OdAHs6mdzKLXcubAbHPXprsQis58+_ze939hQw@mail.gmail.com>
	<1368192729.8390.17.camel@jlt4.sipsolutions.net>
	<CAN_+VLX8_suEo_=C2sXoz00aRNtbAtpmKjfVUZVHc1RQbe29ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=047d7b414c2e528a2804dc5ebda4
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAN_+VLX8_suEo_=C2sXoz00aRNtbAtpmKjfVUZVHc1RQbe29ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

--047d7b414c2e528a2804dc5ebda4
Content-Type: text/plain; charset=UTF-8

To clarify, I'm using (at present) the implementation from
http://airscan.googlecode.com/svn-history/r2/trunk/radiotap-parser.c - not
being an expert in such things it looks like the use of le32_to_cpu is an
indication that this is designed to be used in userspace, but still - the
iteration function is still returning `1'.

Lee Hambley
--
http://lee.hambley.name/+49 (0) 170 298 5667


On 10 May 2013 16:40, Lee Hambley <lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi Johannes,
>
> I hadn't even considered that, I'll have to go and have a look for the
userspace implementation of those functions, I'd suppose that the ones I
have pulled in are probably from the kernel if they are returning `1`.
>
> Are these functions included with any of the radiotap (tcpdump, libpcap
in particular) codebases? Or something similar.
>
> Thanks, good to know I did manage to register myself for the list
correctly!
>
> Lee Hambley
> --
> http://lee.hambley.name/
> +49 (0) 170 298 5667
>
>
> On 10 May 2013 15:32, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
>>
>> On Fri, 2013-05-10 at 14:55 +0200, Lee Hambley wrote:
>>
>> > int ret = ieee80211_radiotap_iterator_init(&rti, rth, rth->it_len);
>> > while(!ret) {
>> >   printf("Itteration: %d\n", count++);
>> >   ret = ieee80211_radiotap_iterator_next(&rti);
>>
>> >
>> > There's limited scope for having screwed something up in that code, I
>> > think, I'm confused by the `1' being returned from
>> > `ieee80211_radiotap_iterator_init' which according to the
>> > implenentation doesn't seem like an error condition in the
>> > implementation
http://lxr.free-electrons.com/source/net/wireless/radiotap.c#L95
>>
>> I think you're confusing the userspace and Linux kernel implementation,
>> though they're very similar. In any case,
>> ieee80211_radiotap_iterator_next() cannot return 1, unless one of the
>> error values is defined to -1 (it returns -EINVAL and a few others)
>>
>> johannes
>>
>>
>

--047d7b414c2e528a2804dc5ebda4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To clarify, I&#39;m using (at present) the implementation =
from <a href=3D"http://airscan.googlecode.com/svn-history/r2/trunk/radiotap=
-parser.c">http://airscan.googlecode.com/svn-history/r2/trunk/radiotap-pars=
er.c</a> - not being an expert in such things it looks like the use of le32=
_to_cpu is an indication that this is designed to be used in userspace, but=
 still - the iteration function is still returning `1&#39;.<br>
<br>Lee Hambley<br>--<br><a href=3D"http://lee.hambley.name/">http://lee.ha=
mbley.name/</a>+49 (0) 170 298 5667<br><br><br>On 10 May 2013 16:40, Lee Ha=
mbley &lt;<a href=3D"mailto:lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">lee.hambley-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a=
>&gt; wrote:<br>
&gt;<br>&gt; Hi Johannes,<br>&gt;<br>&gt; I hadn&#39;t even considered that=
, I&#39;ll have to go and have a look for the userspace implementation of t=
hose functions, I&#39;d suppose that the ones I have pulled in are probably=
 from the kernel if they are returning `1`.<br>
&gt;<br>&gt; Are these functions included with any of the radiotap (tcpdump=
, libpcap in particular) codebases? Or something similar.<br>&gt;<br>&gt; T=
hanks, good to know I did manage to register myself for the list correctly!=
<br>
&gt;<br>&gt; Lee Hambley<br>&gt; --<br>&gt; <a href=3D"http://lee.hambley.n=
ame/">http://lee.hambley.name/</a><br>&gt; +49 (0) 170 298 5667<br>&gt;<br>=
&gt;<br>&gt; On 10 May 2013 15:32, Johannes Berg &lt;<a href=3D"mailto:joha=
nnes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org">johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org</a>&gt; wrote:<br>
&gt;&gt;<br>&gt;&gt; On Fri, 2013-05-10 at 14:55 +0200, Lee Hambley wrote:<=
br>&gt;&gt;<br>&gt;&gt; &gt; int ret =3D ieee80211_radiotap_iterator_init(&=
amp;rti, rth, rth-&gt;it_len);<br>&gt;&gt; &gt; while(!ret) {<br>&gt;&gt; &=
gt; =C2=A0 printf(&quot;Itteration: %d\n&quot;, count++);<br>
&gt;&gt; &gt; =C2=A0 ret =3D ieee80211_radiotap_iterator_next(&amp;rti);<br=
>&gt;&gt;<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; There&#39;s limited scope for h=
aving screwed something up in that code, I<br>&gt;&gt; &gt; think, I&#39;m =
confused by the `1&#39; being returned from<br>
&gt;&gt; &gt; `ieee80211_radiotap_iterator_init&#39; which according to the=
<br>&gt;&gt; &gt; implenentation doesn&#39;t seem like an error condition i=
n the<br>&gt;&gt; &gt; implementation <a href=3D"http://lxr.free-electrons.=
com/source/net/wireless/radiotap.c#L95">http://lxr.free-electrons.com/sourc=
e/net/wireless/radiotap.c#L95</a><br>
&gt;&gt;<br>&gt;&gt; I think you&#39;re confusing the userspace and Linux k=
ernel implementation,<br>&gt;&gt; though they&#39;re very similar. In any c=
ase,<br>&gt;&gt; ieee80211_radiotap_iterator_next() cannot return 1, unless=
 one of the<br>
&gt;&gt; error values is defined to -1 (it returns -EINVAL and a few others=
)<br>&gt;&gt;<br>&gt;&gt; johannes<br>&gt;&gt;<br>&gt;&gt;<br>&gt;<br></div=
>

--047d7b414c2e528a2804dc5ebda4--
