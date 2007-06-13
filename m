From: Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
Subject: PPI header specification
Date: Wed, 13 Jun 2007 15:16:14 -0700
Message-ID: <46706CAE.1010403@wireshark.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

We (CACE Technologies) recently worked on a project for a client that
required the use of 802.11n-specific packet header information.
Unfortunately, the project had a tight deadline, so we had to come up
with our own packet header instead of using Radiotap.

The new packet header (PPI) is based partially on Radiotap and documented at

  http://www.cacetech.com/documents/PPI_Header_format_1.0.pdf

I'm posting it here in the hopes that it will be useful in the
development of Radiotap's 802.11n extensions.
