From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: RFC: moving Radiotap forward
Date: Mon, 16 Jul 2007 16:48:20 -0500
Message-ID: <20070716214820.GD19812@che.ojctech.com>
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

I have written some proposals and desires for moving Radiotap forward.

1 This list will "keep" the Radiotap standard.  That is, this is the venue
  at which to propose new fields for discussion and eventual adoption.
  We will adopt new fields into the standard when there is "rough
  consensus and running code."  Let's strive for general agreement of the
  list membership, at least one driver and at least one packet capture
  tool that groks a new field.

  The list membership needs to be representative of folks who have
  a stake in Radiotap, especially developers of device drivers
  for Linux, OpenSolaris, *BSD, et cetera, and developers of packet
  capture/filter/dissection/display software such as WireShark, libpcap,
  Kismet, and TCPDump.  "Are we all here?"

2 The Radiotap documentation needs to appear on "neutral ground" on the
  web---i.e., not in a NetBSD manual page.  Web resources need to be
  "beefed up" to include a careful specification, lists of assigned
  numbers, examples, reference implementations, and tests.  I have
  reserved a couple of Radiotap domain names to hold that information.
  Radiotap needs a volunteer web admin.

3 We need to set minimum requirements for a field, such as specifying
  its width, alignment, name, and interpretation.

4 We need to prioritize arresting Radiotap fragmentation.  I do not know
  if we can reconcile the conflicting uses for bits 14 and upward, but
  I hope Radiotap stakeholders can be reconciled with our introduction
  of a consensus process.

5 It seems to me that we need to decide

    Will we adopt fields for WiMax?  Do we have enough people both with a
    stake and with expertise in WiMax to do that?

    Do we / how will we support vendor-specific fields?

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
