From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Proposal]TX flags
Date: Thu, 16 Apr 2009 20:47:13 +0200
Message-ID: <69e28c910904161147h5a68d3b5nd054b043d6ad2719@mail.gmail.com>
References: <69e28c910904141733m72ce521ap8f1865bec991fff7@mail.gmail.com>
	<1239902910.26575.14.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1239902910.26575.14.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: radiotap@radiotap.org

2009/4/16 Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>:
> On Wed, 2009-04-15 at 02:33 +0200, G=E1bor Stefanik wrote:
>
>> =A0 =A0- Define bit 1 (mask 0x0002) as "CTS-to-self protection",
>> =A0 =A0- Define bit 2 (mask 0x0004) as "RTS/CTS handshake",
>
> Since you're defining these for injection too I think it would be use=
ful
> to also define a way to _not_ use RTS or CTS, or define a way to use =
the
> default that the device would use from dot11RTSThreshold for example.
>
> Otherwise, when leaving out these bits, it wouldn't be clear whether
> that means "do not use, overriding default" or "use default".
>
> johannes
>

Here is how I think this can be done:
Because it's impossible to have a packet protected both by CTS-to-self
and by RTS/CTS, we can define the case where both the CTS and RTS
flags are set as "Automatically use RTS or CTS as needed". The same
should be true when the TX flags field is missing entirely. When the
TX flags field is present, and both flags are 0, that should be
interpreted as "don't protect the packet".

So, in summary, this is how things should be interpreted:

TX Flags absent: Use RTS & CTS as needed.
TX Flags present: {
RTS=3D0, CTS=3D0: Use neither RTS nor CTS.
RTS=3D0, CTS=3D1: Use CTS-to-self.
RTS=3D1, CTS=3D0: Use RTS/CTS-handshake.
RTS=3D1, CTS=3D1: Use RTS & CTS as needed.
}

Alternatively, the meanings of the {0,0} and {1,1} cases could be
switched around (making the {0,0} case more logical, at the expense of
the {1,1} one):

TX Flags absent: Use RTS & CTS as needed.
TX Flags present: {
RTS=3D0, CTS=3D0: Use RTS & CTS as needed.
RTS=3D0, CTS=3D1: Use CTS-to-self.
RTS=3D1, CTS=3D0: Use RTS/CTS-handshake.
RTS=3D1, CTS=3D1: Use neither RTS nor CTS.
}

(By reading the second proposal again, I find it more and more
sympathetic... but let the discussion decide.)

--G=E1bor

--=20
Vista: [V]iruses, [I]ntruders, [S]pyware, [T]rojans and [A]dware. :-)
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
