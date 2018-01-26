From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Conflicting definitions between the radiotap HE PPDU format field
 and 802.11axD2
Date: Fri, 26 Jan 2018 06:50:52 -0800
Message-ID: <CACyXjPysLXqb4uqFeD2h3FGHJgYcnyRS_EEQYu9UmqAc=TvhCw@mail.gmail.com>
References: <CACyXjPzSHgyBkpXBR7=eqsfiCmeKBOsQD=0dJtUMwqUk=yWxYQ@mail.gmail.com>
 <1516963320.2189.22.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1516963320.2189.22.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Fri, Jan 26, 2018 at 2:42 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> Hi Richard,
>
> Sorry, it was too late last night to think clearly about this :-)
>
>> It seems that 802.11ax D2 defines, in Table 28-18, in HE-SIG-A, a
>> 1-bit format fields (B0) that takes the values 0 for HE TB PPDUs and 1
>> for HE SU PPDUs and that is reserved for others but must be set to 1.
>
> Correct. There are four PPDU types:
>  * HE SU PPDU
>  * HE ER SU PPDU
>  * HE TB PPDU
>  * HE MU PPDU
>
> The format bit distinguishes between TB and SU PPDUs. You'll note that
> this bit doesn't even exist in an MU PPDU.
>
> The actual differentiation between the four types is done in another
> way, I'm not entirely sure right now how, you can see it in 28.3.21, in
> particular in Figure 28-59.
>
> Basically what I decided to expose in radiotap is the HE sub-formats as
> per the RXVECTOR (and maybe TXVECTOR, if we use it for TX) parameters.
>
>> However, what seems to be the equivalent radiotap he ppdu format field
>> is 2 bits and uses different values.
>>
>> Have I misunderstood? What is the resolution of this?
>
> Does the above resolve this for you?

I think so. Someone who is involved with the spec also pointed out
that some of those bits are generated based on other criteria.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
