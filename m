From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: outgoing interface field
Date: Thu, 19 Jun 2008 22:14:22 +0200
Message-ID: <1213906462.8967.110.camel@johannes.berg>
References: <1213903728.8967.92.camel@johannes.berg>
	 <1213904505.3240.27.camel@dv>  <1213904654.8967.96.camel@johannes.berg>
	 <1213906196.3240.47.camel@dv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4CPdIf61WVnlIfJNMktn"
In-Reply-To: <1213906196.3240.47.camel@dv>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org, "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: radiotap@radiotap.org

--=-4CPdIf61WVnlIfJNMktn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2008-06-19 at 16:09 -0400, Pavel Roskin wrote:
> On Thu, 2008-06-19 at 21:44 +0200, Johannes Berg wrote:
> > > Are you injecting by sending data to a socket?  I think the sockets a=
re
> > > bound to VAPs, not to PHYs since VAPs are seen as network devices.
> >=20
> > Yes. The socket is bound to a _cooked monitor_ interface.
>=20
> Oh well, I should have guessed that.  Maybe we could introduce ioctl to
> put socket into "wireless injection mode", in which it would accept
> 802.11 packets with radiotap headers regardless of the interface mode.
> Then the sockets could be bound to the VAPs.

I don't want to see the kernel code for that.

> > > Besides, are you going to serve more than one VAP with one socket?  I
> > > would not do it without a good reason.  I think ioctl on the socket
> > > would be an easier solution, as it needs to be done once per VAP, not
> > > once per packet.
> >=20
> > Well, yes, of course we're going to serve multiple BSSes with one socke=
t
> > if they're all associated to one physical interface. Why not?
>=20
> It's a cleaner approach to respect the virtual interface abstraction
> existing in the kernel rather than ignore it.  The kernel presents
> separate network interfaces to the userspace.

Well yeah, but what point is there in having many sockets? Anyway, Jouni
and I have pretty much decided on this, and you don't really get a say
unless you provide =EF=BB=BFclean, working code :)
=EF=BB=BF
> Besides, radiotap headers are designed to be transferable between
> systems.  It should be possible to send frames with radiotap headers
> from another system, possibly with a different endianness and
> different
> wireless hardware.  Encoding local data (VAP number) makes radiotap
> headers system-specific.

This isn't designed to be ever saved to disk, it's for communication
between userspace and the kernel when running an AP. We just happen to
use radiotap for that to save inventing yet another interface.

> It's funny, we are creating the rules that exclude us, and then we are
> shopping around for sponsors.  We need exceptions for experimental use.

Actually, I just figured out that the OUIs have a 'locally assigned' bit
like MAC addresses (well I guess MAC addresses inherit it from OUIs), so
we can use that and assign "experimental" OUIs to ourselves as long as
they don't clash within radiotap.

johannes

--=-4CPdIf61WVnlIfJNMktn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWr4aAAoJEKVg1VMiehFYl/EP/0Ex5cnWSMXapieAaUvPJVju
Ef6kjlt4J4FkS5x3URsLxf/kRXIMFxKsRcfOUDCaSipZPJwTYEqYzR6ig3If3Iox
//Yl+AWRXeC05AZA2XxTkM0owBB4gJut7iIlnBQBGwdwaLfgmnWY2ISDEi+csIg3
A91FWI6Tu6ndxTjzzdxUJ/YnFp9FnAME0mw6PvCfVGAJd415h2vy4US0uOW6sTLy
xxuaF+kcgE/15xcLww3aUr0dx+HJqf+PJXoq5p+kxjrbkto7l+vQGSwLPeEV0JK3
pXC2QSoALnQq0ErXCDgOw8Bq9Z0NTil1pR89GKxDNAnLA6XNQfL9WvnogMMq4ulj
EFCIBs07AAwAnvftte4l1gBPNJHeK/PzHouNZAI4YOAB/z5ziFZpkIY9C3R3FP1Z
ikYtWCIH02Nku0YdFvWLV6mBA//9/HDjWZiTAv5LbTQUGUMLR2gufnTysYvEzctv
0dm7ISt1lBOzyIrBqfyX8Tj7BByXlOOmUzCzuBLiJAYCiY8spHFoHcAD4on0gP4e
WFgsJkU6veEHOiAyiM78LHMhf10sjOpVaUtXa3i8/eYJMf2fG/Wq+dv+8X7FSEdZ
uPpyxyTijMCxH5ZS0CjW/xghNoZBTVg2ZUN7DMRy18OhpxBXqqLs+1QeVnhW6k4q
XESuwnUBJMGh275DcclO
=lHN6
-----END PGP SIGNATURE-----

--=-4CPdIf61WVnlIfJNMktn--
