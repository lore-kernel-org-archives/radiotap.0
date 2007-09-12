From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Wed, 12 Sep 2007 13:06:19 -0500
Message-ID: <20070912180619.GB17887@che.ojctech.com>
References: <1188512214.7585.3.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1188512214.7585.3.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Id: radiotap@radiotap.org

On Fri, Aug 31, 2007 at 12:16:54AM +0200, Johannes Berg wrote:
> Our radiotap header in Linux defines bit 14 as
> IEEE80211_RADIOTAP_RX_FLAGS; however running wireshark on it tells me
> that this bit means "FCS in header". Does anybody know which use is
> correct, if any?
> 
> Maybe we should simply skip to bit 32 or something and start redefining
> things properly?

There are technical reasons that we cannot simply skip.  I have a couple
of technical solutions in mind.

Solution 1: introduce a new bit, m, that nobody has used so far.
        Let it stand for the presence of a 32-bit magic number.
        When an interpreter sees a header whose presence bit 14 is
        set, let it test presence bit m.  If m is not present, let the
        interpreter abort.  If m is present, let the interpreter skip
        forward until it finds the magic at a 32-bit boundary.  Let it
        continue processing presence bits > m in the usual way.

Solution 2: increase the radiotap version number, and start over from
        bit 0.  Now we need a "legacy" parser for v0, 0 <= bit <= 13,
        and a "next gen" parser for v1.  No v0 header with bits >=
        14 set can be interpreted without ambiguity.

        2a: adopt all of the legacy presence bits 0 through 13 in v1
        2b: adopt some of the legacy presence bits in v1
        2c: start from scratch for v1

We could also use both Solution 1 and Solution 2; let interpreters treat
every v0 bit >= 14 as vendor-specific.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
