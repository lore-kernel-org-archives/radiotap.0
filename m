From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: rfc: "canonical" radiotap parser
Date: Thu, 6 Dec 2007 22:55:45 -0600
Message-ID: <20071207045545.GO3568@che.ojctech.com>
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

At <http://svn.cuwireless.net/svn/cuw/trunk/src/radiotap/> is the radiotap
parser that I mentioned the other day.  I believe the parser captures
all of the essential ideas of radiotap.  It is also a somewhat useful
program that uses libpcap to listen on the interface you specify on the
command line for radiotap frames (DLT_IEEE802_11_RADIO).  I have tried
to make it just as portable and self-contained C99 code as I can.

The parser is table-driven: adding new fields is a matter of adding
entries to the tables field_spec[] and field_info[].  The first table,
field_spec[], contains the Minimal Specification for a field.  The Minimal
Specification is the field's alignment and its width.  The alignment
must be a power-of-two, whole number of bytes.  The width must be a
non-negative, whole number of bytes.  Every radiotap interpreter needs to
know the minimal specification of fields 0..n in order to skip past those
fields to a field of interest, field n+1.  The second table, field_info[],
tells each field's name (long and short form) and units.  I use some macro
magic to link each entry in field_info[] to its Minimal Specification.
Call the information in field_info[] and in field_spec[] for each field,
that field's Complete Specification.  An interpreter such as tcpdump or
wireshark needs a field's Complete Specification in order to render the
field for you and I to read it.

I have included all of these fields in the parser,

        IEEE80211_RADIOTAP_RX_FLAGS
        IEEE80211_RADIOTAP_TX_FLAGS
        IEEE80211_RADIOTAP_RTS_RETRIES
        IEEE80211_RADIOTAP_DATA_RETRIES
        IEEE80211_RADIOTAP_XCHANNEL

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
