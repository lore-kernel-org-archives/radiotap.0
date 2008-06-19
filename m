From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Thu, 19 Jun 2008 22:25:18 +0200
Message-ID: <1213907118.8967.115.camel@johannes.berg>
References: <1188512214.7585.3.camel@johannes.berg>
	 <1213897499.8967.46.camel@johannes.berg>
	 <20080619185646.GA17738@che.ojctech.com>
	 <1213902633.8967.84.camel@johannes.berg>
	 <20080619193958.GB17738@che.ojctech.com> <485AB8B0.7060606@alum.mit.edu>
	 <485ABC4A.4060801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-2784HxwydaIjj4oEeCPf"
In-Reply-To: <485ABC4A.4060801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

--=-2784HxwydaIjj4oEeCPf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


> AirPcap uses the IEEE80211_RADIOTAP_FCS flag. We can remove it, but all=20
> the trace files produced with airpcap+radiotap until now include it.

Is that really going to be a problem? It'd be trivial to write a filter
that rewrites such existing files to have the FCS at end (I never
understood the need for in-header FCS anyway.) And even if you don't,
you only lose the FCS?

johannes

--=-2784HxwydaIjj4oEeCPf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Comment: Johannes Berg (powerbook)

iQIcBAABAgAGBQJIWsCqAAoJEKVg1VMiehFYKiwP/RgbPpArUIFP1gYuUUikRhEt
TpuHh2VyfbJNxxP7jXYY235GLut2oHiWrvZhj4CWQJ7hXfazO20sP6XfMEpO6HC4
eQiKlY0/6teQeG94nwLDiRDoj2ZVo7ITPw2kqg3qyla0nXLdt/qTEu+umRMGr2iC
TMgaCMGtik+JCqUGPJrgHUjHOq3LcRCBp9T2rhovLbJPqOeO/BRZeS9I35ViOyqa
MZhPof+BVCEhGQGu6ZLItrITfLRfQCAqFchrA+mP8m5GLOKq0stQSLEjZ0B/xMRQ
7evSjerAMVSBJzosjoOoLEZmqTQSTFWXsSrDH6bzlJON4ltzSLjfKK0cYB0CjKY3
Dy3rEYfqRg0yFQcSdraw1L3exi+zPhM0rQZ4OdN82Xoyjfq1koDQN6vaZXx2BUSX
vCLi9EU8+XC6T7RJ2nMZfVFLt2YwrL8/KOuwwUqoYkVXYv2IwS/KA7UlKOJtiZKl
gui7VlabsU73ieh9QVlfpwrpZYEBZsyAYkcCOE+6qvJnpZAFykDXVTlCVoSgGUze
8AyGsdNQeyROwJl/bdtD3VssVDkjF6W5kcKaUDdsAyxbxIdVbnQB3fN08rzII/KL
jk46yWHRvZTwkORg0JlXMh7og/ug6ljaKsly5r7ELRbYXagxzqltjaNOR5LeM3oY
tDCmy62zEPD//oz+O2xI
=8GIM
-----END PGP SIGNATURE-----

--=-2784HxwydaIjj4oEeCPf--
