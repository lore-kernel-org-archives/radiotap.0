From: Ivo van Doorn <ivdoorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] RCPI support in radiotap and in our wireless subsystems
Date: Thu, 6 Mar 2008 21:55:17 +0100
Message-ID: <200803062155.19725.IvDoorn__11570.4779200771$1216696539$gmane$org@gmail.com>
References: <43e72e890803061238u50847f1fs587627c5fac028d6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
In-Reply-To: <43e72e890803061238u50847f1fs587627c5fac028d6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org, Ivan Seskar <Seskar-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, Haris Kremo <harisk-NvJAj8134tRxEa0u/P/EHDe48wsgrGvP@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Simon Barber <simon-r/za7OOdgF0ztatW0fm/fQ@public.gmane.org>, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Luis Carlos Cobo <luisca-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Javier Cardona <javier-W/OLz77bvjtBDgjK7y7TUQ@public.gmane.org>, Sam Leffler <sam-zZXckVAlHaQAvxtiuMwx3w@public.gmane.org>, Jean Tourrilhes <jt-sDzT885Ts8HQT0dZR+AlfA@public.gmane.org>, Stefano Brivio <stefano.brivio-hl5o88x/ua9eoWH0uzbU5w@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi.

> ---
> 
> For ipw2200:
> 
> s8 antsignal = frame->rssi_dbm - IPW_RSSI_TO_DBM;
> 
> and IPW_RSSI_TO_DBM is set to 112.
> 
> Is antsignal above the "measure by the PHY sublayer of the received RF
> power in the channel measured over the entire received frame"?

For completeness, the rt2x00 & RSSI:

rt2400pci, rt2500pci, rt2500usb:
Same as ipw2200 only the IPW_RSSI_TO_DBM varies from 100 to 120 (as
hardcoded value in the register) to a unsigned char value read from
the EEPROM. The legacy drivers _suggest_ this is the rssi...

rt61pci, rt73usb:
The device reports an agc value, this is used as basis for a vague calculation
to determine the RSSI_TO_DBM offset based on LNA and current operating band.
Here too, the legacy driver suggests this is the rssi...

Ivo
