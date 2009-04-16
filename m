From: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Thu, 16 Apr 2009 21:10:04 +0200
Message-ID: <200904162110.05150.mb@bu3sch.de>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com> <69e28c910904161147h5a68d3b5nd054b043d6ad2719@mail.gmail.com> <1239908374.26575.20.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1239908374.26575.20.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: =?utf-8?q?G=C3=A1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thursday 16 April 2009 20:59:34 Johannes Berg wrote:
> On Thu, 2009-04-16 at 20:47 +0200, G=C3=A1bor Stefanik wrote:
>=20
> > Alternatively, the meanings of the {0,0} and {1,1} cases could be
> > switched around (making the {0,0} case more logical, at the expense=
 of
> > the {1,1} one):
> >=20
> > TX Flags absent: Use RTS & CTS as needed.
> > TX Flags present: {
> > RTS=3D0, CTS=3D0: Use RTS & CTS as needed.
> > RTS=3D0, CTS=3D1: Use CTS-to-self.
> > RTS=3D1, CTS=3D0: Use RTS/CTS-handshake.
> > RTS=3D1, CTS=3D1: Use neither RTS nor CTS.

The first and the last thing let my head explode, because it's not what=
 somebody
would expect from such bits. This kind of logic is also used in wext. A=
nd it's why I hate wext.
"bit0 means x, bit1 means y, buuuuuuuuuuuuuuuut iff both bits are set t=
he whole logic
is inverted and whatever..."
That complicates _every_ single test of the bit (always need if (bit0 i=
s set but not bit1))
It produces spaghetti code interpreting these bits with lots of branche=
s and special
conditions that nobody does understand by reading the code alone.
If you can't encode your functionality into a boolean, do _NOT_ use bit=
s to encode it.
Use integers to encode tristate or quadstate or whatever.
You essentially _did_ that already, if you look at your bits. You use t=
he two individual bits
as 2bit integer value. So why not spell it out and use an integer field=
 for that information?

--=20
Greetings, Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
