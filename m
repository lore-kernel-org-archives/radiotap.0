From: Bill Stafford <bill.stafford-BUHhN+a2lJ4@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Mon, 30 Aug 2010 21:21:10 +0000 (GMT)
Message-ID: <1c63b9f9-42f3-e339-f4d2-c00968261f5b@me.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_JJGk99A0wz8+gZdSQCKa7A)"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org


--Boundary_(ID_JJGk99A0wz8+gZdSQCKa7A)
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: quoted-printable

On Aug 09, 2010, at 05:10 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wr=
ote:=0AI've put a modified proposal here:=0Ahttp://www.radiotap.org/sugges=
ted-fields/MCS-proposal2=0A=0AI also added some a-MPDU status bits. They m=
ight not quite belong to=0AHT/MCS only, but they will typically be used wi=
th that and everything=0Aelse can indeed be masked out if really necessary=
=0A=0AThoughts?=0A=A0=0AI think the proposal2 looks great. The info mask =
is great for both tx specification and rx capture.=0A=0AAdding single-bit =
fields has the advantage that they can be left out of=0Athe header when, e=
g., you just know the MCS, but you don't know whether=0Ait was 20 or 40 M=
Hz (which, incidentally, is quite useless).=0A=A0=0AI think the mask for 2=
0/40 is useful when using radiotap headers to do packet transmit. Some tes=
t setups only need the raw 802.11 format and possibly some HT modulation i=
nformation, but may not care about 20/40. For instance, some test script m=
ay inject a packet for a STA to send to its associated AP and specify MCS =
0 (for robustness) but leave the 20/40 info out so that the driver just se=
nds at whatever the association has set up. Likewise, the test script may =
leave the shortGI/LDCP info unspecified.=0A=0A-Bill=0A=0A=

--Boundary_(ID_JJGk99A0wz8+gZdSQCKa7A)
Content-type: multipart/related;
 boundary="Boundary_(ID_+EeeMbUKcd7IaThjLmBcfw)"; type="text/html"


--Boundary_(ID_+EeeMbUKcd7IaThjLmBcfw)
Content-type: text/html; charset=ISO-8859-1
Content-transfer-encoding: quoted-printable

<html><body><div>On Aug 09, 2010, at 05:10 AM, Johannes Berg &lt;johannes@sipsolutions=
net&gt; wrote:</div><div><blockquote type=3D"cite"><div><div class=3D"_st=
retch">=0AI've put a modified proposal here:<br>=0A<a href=3D"http://www.r=
adiotap.org/suggested-fields/MCS-proposal2" _mce_href=3D"http://www.radiot=
ap.org/suggested-fields/MCS-proposal2">http://www.radiotap.org/suggested-f=
ields/MCS-proposal2</a><br>=0A<br>=0AI also added some a-MPDU status bits.=
 They might not quite belong to<br>=0AHT/MCS only, but they will typically=
 be used with that and everything<br>=0Aelse can indeed be masked out if r=
eally necessary.<br>=0A<br>=0AThoughts?</div></div></blockquote><span>&nbs=
p;</span></div><div><span>I think the proposal2 looks great. The info mask=
 is great for both tx specification and rx capture.</span></div><div><span=
><br></span></div><div><span><blockquote type=3D"cite" style=3D"padding-to=
p: 0px; border-left-width: 2px; border-left-style: solid; border-left-colo=
r: rgb(0, 51, 153); margin-top: 0px; margin-right: 0px; margin-bottom: 0px=
; margin-left: 0px; padding-right: 12px; padding-bottom: 0px; padding-left=
: 12px; color: rgb(0, 51, 153); " _mce_style=3D"padding-top: 0px; border-l=
eft-width: 2px; border-left-style: solid; border-left-color: #003399; padd=
ing-right: 12px; padding-bottom: 0px; padding-left: 12px; color: #003399; =
margin: 0px;"><div><div class=3D"_stretch" style=3D"font-family: Helvetica=
, Arial, Verdana, sans-serif; font-size: 13px; max-width: 100%; " _mce_sty=
le=3D"font-family: Helvetica, Arial, Verdana, sans-serif; font-size: 13px;=
 max-width: 100%;">Adding single-bit fields has the advantage that they ca=
n be left out of<br>the header when, e.g., you just know the MCS, but you =
don't know whether<br>it was 20 or 40 MHz (which, incidentally, is quite u=
seless).</div></div></blockquote><span>&nbsp;</span></span></div><div>I th=
ink the mask for 20/40 is useful when using radiotap headers to do packet =
transmit. Some test setups only need the raw 802.11 format and possibly so=
me HT modulation information, but may not care about 20/40. For instance, =
some test script may inject a packet for a STA to send to its associated A=
P and specify MCS 0 (for robustness) but leave the 20/40 info out so that =
the driver just sends at whatever the association has set up. Likewise, th=
e test script may leave the shortGI/LDCP info unspecified.</div><div><br><=
/div><div>-Bill</div><div><br></div></body></html>=

--Boundary_(ID_+EeeMbUKcd7IaThjLmBcfw)--

--Boundary_(ID_JJGk99A0wz8+gZdSQCKa7A)--
