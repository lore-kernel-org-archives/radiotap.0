From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: use of radiotap bit 14?
Date: Sun, 7 Oct 2007 18:55:51 -0500
Message-ID: <20071007235551.GN6429@che.ojctech.com>
References: <1188512214.7585.3.camel@johannes.berg> <20070912180619.GB17887@che.ojctech.com> <1189668582.6161.91.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1189668582.6161.91.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
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

On Thu, Sep 13, 2007 at 09:29:42AM +0200, Johannes Berg wrote:
> On Wed, 2007-09-12 at 13:06 -0500, David Young wrote:
> 
> > Solution 2: increase the radiotap version number, and start over from
> >         bit 0.  Now we need a "legacy" parser for v0, 0 <= bit <= 13,
> >         and a "next gen" parser for v1.  No v0 header with bits >=
> >         14 set can be interpreted without ambiguity.
> > 
> >         2a: adopt all of the legacy presence bits 0 through 13 in v1
> >         2b: adopt some of the legacy presence bits in v1
> >         2c: start from scratch for v1
> 
> Personally, I favour solution 2a as it allows us to easily port parsers
> and even share code,

Johannes,

My problem with #2 right now is that you and I are acting as stronger
advocates for the folks who adopted conflicting radiotap numbers than
they themselves are.  Meanwhile, v0 has some momentum: FreeBSD has
introduced useful new fields, FreeBSD and NetBSD are in agreement,
and there are NO interpreters in tcpdump or in wireshark for any field
past 15.  Let's stick with v0 until somebody objects.

> but before we do that, we need a good way to allow
> vendor-specific extensions. I've been thinking that a format with an
> explicit length field like 802.11 information elements would have been
> easier for this (think 802.11 vendor-specific IEs) but I'm sure we can
> come up with a solution for vendor-specific fields, for example breaking
> the "bit ordering" == "element ordering" for them and requiring them to
> be last at all times or something similar.

I propose to add two new presence bits, 29 and 30.  Let them both reset
the bitmap index to 0.  That is, the bits in following next 32-bit
presence word are interpreted as bits in 0..31, not n..31+n.  We must
use both of these bits in conjunction with the extension bit, bit 31,
or else they will have no effect.

Let bit 29 make the interpreter change to a vendor namespace, and let
bit 30 make the interpreter change back to the default radiotap namespace.
Some detailed field specs follow.

Vendor Namespace Field (29)

        presence bit IEEE80211_RADIOTAP_NSVENDOR = 29
        1-byte alignment
        5 bytes long
        scope: this bit is reserved in all namespaces, and it is
               interpreted identically in every namespace

        The Vendor Namespace Field contains three sub-fields.  The first
        sub-field is 3 bytes long.  It contains the vendor's IEEE 802
        Organizationally Unique Identifier (OUI).  The fourth byte is
        a vendor-specific "namespace selector."

        Before it resumes interpretation of presence bits in the following
        32-bit presence words, if any, the interpreter shall reset its
        presence-bitmap index to 0, and change to the vendor namespace
        specified by the OUI and selector.

        The fifth byte, skip_length, tells the interpreter how many bytes
        of data after the end of the Vendor Namespace Field can only be
        interpreted according to the vendor namespace.  If a radiotap
        header changes to a namespace that the interpreter does not
        understand, and back, the interpreter may resume interpretation
        in the new namespace by skipping skip_length data bytes after
        the end of the Vendor Namespace Field.

Reset Namespace Field (30)

        presence bit IEEE80211_RADIOTAP_NSRESET = 30
        1-byte alignment
        0 bytes long
        scope: this bit is reserved in all namespaces, and it is
               interpreted identically in every namespace

        Upon interpreting this field, the interpreter shall reset its
        presence-bitmap index to 0, and change to the default radiotap
        namespace, before it interprets subsequent presence-bitmap words.

If we adopt Reset/Vendor Namespace, it is possible for a radiotap field
to appear twice or more in one radiotap header.  I believe that this is
a feature, and I have some ideas for using Reset Namespace to specify /
record transmit strategies.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
