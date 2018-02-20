From: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] HE support
Date: Tue, 20 Feb 2018 08:05:48 -0800
Message-ID: <CACyXjPzHJ2CZPY0C0FqVpwy+wS+6u-BT846R0kdOXpW-FwN4fw@mail.gmail.com>
References: <1517300719.2189.51.camel@sipsolutions.net> <1519119420.16723.26.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1519119420.16723.26.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, Feb 20, 2018 at 1:37 AM, Johannes Berg
<johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> On Tue, 2018-01-30 at 09:25 +0100, Johannes Berg wrote:
>
>> Rather than copy/paste all the information into the email, here are the
>> links to the three newly defined fields.
>> http://www.radiotap.org/fields/HE
>> http://www.radiotap.org/fields/HE-MU
>> http://www.radiotap.org/fields/HE-MU-other-user
>>
>> I just made a minor change here to delete the duplicated field, and add
>> an RU offset field (with known flag, of course).
>
> Oops, I have to make another update to this - we need a
> "primary/secondary 80 MHz bit" (along with validity).
>
> I think I'll put that into data2 bits 0/31, any objections?

I have just posted a review for this and for the RU Allocation Offset chang=
es.

With luck they should get into 2.5.1.

https://code.wireshark.org/review/#/c/25927

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)
