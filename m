From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] RX flags
Date: Mon, 7 Jul 2008 13:12:17 -0500
Message-ID: <20080707181217.GL1269@che.ojctech.com>
References: <1214478891.20763.38.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1214478891.20763.38.camel-YfaajirXv214zXjbi5bjpg@public.gmane.org>
Sender: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
Errors-To: radiotap-admin-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap <radiotap-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org>
List-Id: radiotap@radiotap.org

On Thu, Jun 26, 2008 at 01:14:50PM +0200, Johannes Berg wrote:
> This is a request for adoption of the following new radiotap features:
> 
>  * a new flag in the "flags" field (field 1):
>     - short guard interval
>  * the new "RX flags" field (field 14), currently containing the
>    following flag:
> ???    - bad FCS

>     - bad PLCP

Thanks for bringing this proposal.  I agree with it, for one.  I have
a few clarifying questions.

Just to be clear, perhaps cite the IEEE specs where they define FCS and
short GI.  Implementors will want to know, is FCS failure different
than ICV failure?  Presumably, by "bad PLCP," PLCP CRC check failure
is intended.

> I propose to make changes to radiotap as follows [1]:
> 
>  1) Reserve bit number 6 (mask 0x40) of the flags field (field 1)
>     because it was used by some implementations (wireshark) as "bad FCS"

Pleas excuse my forgetfulness. :-) Is there a conflict with "bad FCS"
at bit 6 field 1?  Is there representation for the conflict on the list?
If not, I may bring a second proposal to assign bit 6 for bad FCS,
the rationale being that the bit is already used in that way, and some
implementations may avoid including an Rx flags field by using bit 6
field 1.

> I have attached two patches implementing these changes in
> 
>  * Linux for drivers using mac80211 (the generic 802.11 stack) and the
>    libertas driver for Marvell hardware (no other driver uses these
>    flags);
> 
>  * wireshark, adding an option to dissect bit 14 as "FCS in header" for
>    non-standard radiotap files created by some tools (some of the
>    proposals above are already implemented in wireshark)
> 
> Unless further discussion shows this proposal to be infeasible, I will
> repost the "normative" changes (possibly as amended in the discussion)
> on July 7 to be adopted on July 14, at which point I will make the
> changes to the radiotap.org website.
> 
> johannes
> 
> [1] radiotap.org is the authoritative source, once the changes are
>     adopted by the list I will make the changes there, we do not
>     currently maintain a radiotap header file
> ???[2] ???This fills up the flags field because it is only 8 bits long.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933 ext 24
