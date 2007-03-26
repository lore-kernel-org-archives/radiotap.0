From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: vendor-specific fields?
Date: Sun, 25 Mar 2007 23:09:24 -0500
Message-ID: <20070326040924.GB24097@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
To: radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

I have received a few questions about vendor-specific fields in radiotap
headers.  I don't think vendor-specific fields belong in public radiotap
headers, but here is a trick by which a vendor can insert them for their
own private use:

After the last field indicated by the presence bitmap, it_present (plus
extensions), let the vendor insert their 3-byte Organizationally Unique
Identifier (OUI), and a 1-byte length field that tells the length of
the vendor-specific fields that will follow, not counting the OUI +
length field.  Let the vendor insert as many of these (OUI, length,
fields) tuples as they like, using whichever of their OUIs as they like,
up to the maximum size of a radiotap header.  The vendor needs to set
it_len equal to the length of the header and presence bitmap, radiotap
fields, and vendor fields, so that a parser such as libpcap's can skip
over the whole header.

Make sense?

I hope we can avoid the proliferation "in the wild" of vendor-specific
ways of annotating 802.11 packets.  Let vendor fields stay private to the
vendors' development.  I don't think the trick I suggest above should be
blessed by the radiotap documentation, and I hope that the maintainers
of wireshark, tcpdump, and libpcap will not bless interpreters for
vendor-specific fields.  One of the principle aims of radiotap is,
after all, to produce a device-independent radio capture header. :-)

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
