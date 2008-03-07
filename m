From: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] RCPI support in radiotap and in our wireless subsystems
Date: Fri, 7 Mar 2008 10:41:26 -0500
Message-ID: <43e72e890803070741q1e2558c2odb0046f7e519fc07__19695.3906016008$1216696541$gmane$org@mail.gmail.com>
References: <43e72e890803061238u50847f1fs587627c5fac028d6@mail.gmail.com>
	 <200803070932.51396.bruno@thinktube.com>
	 <43e72e890803061904h742df37fuaa12977c45e457a@mail.gmail.com>
	 <200803071757.19302.bruno@thinktube.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <200803071757.19302.bruno-L9ZBdB2wSWtl57MIdRCFDg@public.gmane.org>
Content-Disposition: inline
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: bruno randolf <bruno-L9ZBdB2wSWtl57MIdRCFDg@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org, Ivan Seskar <Seskar-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, Haris Kremo <harisk-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Simon Barber <simon-r/za7OOdgF0ztatW0fm/fQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Luis Carlos Cobo <luisca-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Javier Cardona <javier-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>, Jean Tourrilhes <jt-sDzT885Ts8HQT0dZR+AlfA@public.gmane.org>, Stefano Brivio <stefano.brivio-hl5o88x/ua9eoWH0uzbU5w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, Mar 7, 2008 at 3:57 AM, bruno randolf <bruno-L9ZBdB2wSWtl57MIdRCFDg@public.gmane.org> wrote:
> On Friday 07 March 2008 12:04:24 Luis R. Rodriguez wrote:
>  > >  it could be changed to something like:
>  > >
>  > >   * @signal: signal strength in dBm above noise or RCPI according to flag
>  >
>  > As it stands I don't think all drivers could populate this field under
>  > that description. For example, ssi in b43 is set to some magical value
>  > we have no clue what it means.
>  >
>  > We *could* test this stuff and see if it matches RCPI for each device,
>  > or just try to figure out at least what RSSI is wrt to the observed
>  > signal through a spectrum analyser (and even jssi is for b43) but I
>  > wonder how this will change upon hw revisions.
>  >
>  > >   * @noise: PHY noise in dBm when receiving this frame
>  > >   (remove ssi)
>  >
>  > Again, the problem in clarifying this also puts a restriction on what
>  > driver developers may know about their hardware.
>
>  yes, but you suggested RCPI which is even more difficult to deliver. well - i
>  don't know *any* device which could...

Well I was hoping we could see if we *could* deliver it, at least
within Atheros hardware but from what you tell me we can't. And from
what I gather from a few other wireless cards we can't either. The
idea was to propose it for radiotap but I do think its pointless if we
don't have hardware yet which we can produce those results.

>  ok. what about 3 hw flags then?
>
>  something like:
>  _SIGNAL_RSSI_UNITLESS
>  _SIGNAL_RSSI_DBM
>  _SIGNAL_RCPI

Seems reasonable.

>  so mac80211 can fill in the right radiotap headers, and drivers can make it
>  clear what they support. it's clear that drivers should strive to deliver the
>  most exact when they can.

Sounds good!

So having IEEE80211_RADIOTAP_DBM_ANTSIGNAL is preferable than
IEEE80211_RADIOTAP_DB_ANTSIGNAL in drivers, for obvious reasons. I'll
deal with another question with respect to mac80211 in another e-mail.

>  we have the same problem with the rx timestamp. we made a definition and ath5k
>  for example can't deliver. but i think a clear definition and a clear note
>  where it cannot be delivered is better than no definition at all :)

Sure, we have to take into consideration what other drivers can deliver as well.

  Luis
