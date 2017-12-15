From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Would it be useful to have preferences for radiotap to allow
 handling of captures with conflicting presence flags?
Date: Thu, 14 Dec 2017 16:13:54 -0800
Message-ID: <CACyXjPyh6H6-8BeUY-OPWAmdGEpzAQpYgMYy3rWGfNUxGY1xsQ@mail.gmail.com>
References: <CACyXjPy9nUFhKmgzyVt6KBqHZW3oa0dgpkzQyGbtHHLOnC=f1w@mail.gmail.com>
 <481F8A87-D5A1-440F-832F-7E433179A7F9@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <481F8A87-D5A1-440F-832F-7E433179A7F9-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, Dec 14, 2017 at 3:24 PM, Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Dec 14, 2017, at 1:06 PM, Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>
>> I notice on this page
>>
>>  http://www.radiotap.org/fields/suggested
>>
>> it mentions that there are some conflicting usages of flag bits for radi=
otap.
>>
>> Currently, Wireshark knows about bit 14 in the presence flags, but
>> hard-codes it for rx-Flags.
>
> No, it has a preference for that, defaulting to rx-flags.  Tcpdump has no=
 preference for it, hardwiring it to rx-flags.

Ahhh, I see you are correct. I looked for the radiotap protocol at
first and didn't see it. After you responded I looked in the code and
then discovered it was called 802.11 Radiotap. That's possibly a bit
onerous for users but that is a separate issue.

>> It also doesn't know about tx-Flags (or
>> hardware-queue).
>>
>> Would it be useful to allow the user to specify they want to be able
>> to switch between usages or are we trying to stamp out such
>> conflicting uses?
>
> The conflicts are historical; I think the intent for radiotap is that fur=
ther conflicts be at least *very strongly* discouraged, if not simply forbi=
dden.  I vote for "forbidden".  As the page you cite says:
>
>         Note that some fields currently have numbers assigned already, th=
is is due to different OSes defining different bits unilaterally. *Such mis=
takes should not be repeated in the future.*
>
> (emphasis mine).
>
> The radiotap spec doesn't control what code that processes radiotap heade=
rs does; it neither requires nor forbids preferences.  I don't think it sho=
uld require or forbid them as a way of dealing with existing conflicts, but=
 it should (and does) say that no requirement for a preference should be in=
troduced in the future.

Great. I will get to work adding some of the missing bits and maybe a
preference around the tx_flags and hardward_queue.

BTW, why is there what looks like 6-bytes of un-interpreted data
between the rx-flags and timestamp info?

I can send a capture if you would like to look.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
