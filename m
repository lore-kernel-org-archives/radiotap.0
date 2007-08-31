From: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Fri, 31 Aug 2007 09:50:44 -0700
Message-ID: <46D846E4.20103@wireshark.org>
References: <1188512214.7585.3.camel@johannes.berg> <1188571628.24684.7.camel@dv>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1188571628.24684.7.camel@dv>
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
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

Pavel Roskin wrote:
> On Fri, 2007-08-31 at 00:16 +0200, Johannes Berg wrote:
>> Our radiotap header in Linux defines bit 14 as
>> IEEE80211_RADIOTAP_RX_FLAGS; however running wireshark on it tells me
>> that this bit means "FCS in header". Does anybody know which use is
>> correct, if any?
> 
> As far as I know, "FCS in header" is a FreeBSD thing, which came to
> Linux in MadWifi.  "Rx flags" comes from Linux Libertas driver.
> 
> The standard uses the later:
> http://netbsd.gw.com/cgi-bin/man-cgi?ieee80211_radiotap+9+NetBSD-current
> 
> MadWifi has removed the non-standard use of bit 14.  Now it's time to
> fix wireshark.

The problem is a little more widespread than that.  Packet-radiotap.h in 
the Wireshark sources has the following comments:

/*
  * AAAAAAAAAAAAAAAAAAAAAAAAAARGH.
  *
  * The current FreeBSD ieee80211_radiotap.h has IEEE80211_RADIOTAP_XCHANNEL
  * as 14.
  *
  * The current NetBSD ieee80211_radiotap.h has IEEE80211_RADIOTAP_RX_FLAGS
  * as 14.
  *
  * The current OpenBSD ieee80211_radiotap.h has IEEE80211_RADIOTAP_FCS as
  * 14.
  *
  * NetBSD and OpenBSD also differ on what comes *after* 14.
  *
  * They all use the same DLT_ value for "802.11+radiotap".
  *
  * This is all wonderfully appreciated by those of us who write code to
  * read files containing packets with radiotap headers.  I will see if
  * I can apply a little cluebat-fu here.
  */

and

     /* XXX - IEEE80211_RADIOTAP_FCS is used by MadWifi and AirPcap, but
      * was never officially assigned. */

I'll open a ticket on Wireshark's Bugzilla so we (Wireshark) don't lose 
track of this before the next release.  I'll talk to the guys here 
(CACE) about fixing AirPcap as well.

An earlier email from David Young discussed placing the Radiotap 
documentation in a more "official" location -- I think this would help 
immensely.  For a developer starting from scratch, it's not immediately 
obvious where the canonical Radiotap specification is and it's very easy 
to get started down the wrong path.  For example, if NetBSD Radiotap 
header and man page show up in Google's rankings for "radiotap" and 
"radiotap specification", they're pretty far down the list.
