From: Charles Clancy <clancy-VX+DGZyGJwM3uPMLIKxrzw@public.gmane.org>
Subject: Re: RFC: moving Radiotap forward
Date: Wed, 18 Jul 2007 21:30:47 +0100
Message-ID: <469E7877.2080603@cs.umd.edu>
References: <20070716214820.GD19812@che.ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070716214820.GD19812-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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

> 1 This list will "keep" the Radiotap standard.  That is, this is the venue
>   at which to propose new fields for discussion and eventual adoption.
>   We will adopt new fields into the standard when there is "rough
>   consensus and running code."
 > ...
 > 3 We need to set minimum requirements for a field, such as specifying
 >   its width, alignment, name, and interpretation.

Sounds very IETF-ish.  Any thoughts on publishing Radiotap as an 
Internet Draft and eventually RFC?  You could set up an IANA registry 
for the extensible fields.  IETF is typically L3+, but Radiotap could be 
pitched abstractly enough that it wouldn't necessarily violate that.

I have significant experience with the IETF, and could help out with the 
process if the group is interested.

> 5 It seems to me that we need to decide
> 
>     Will we adopt fields for WiMax?  Do we have enough people both with a
>     stake and with expertise in WiMax to do that?

Well, I'm one...

>     Do we / how will we support vendor-specific fields?

In similar situations in the past, I've defined field identifiers in 
general to be 6 bytes, with the first four bytes being the vendor's 
object identifier (OID) and the last two being the actual field. 
OID==0x00000000 represents the non-vendor-specific list of 2^16 possible 
fields.

-- 
t. charles clancy, ph.d.  <>  tcc-e45ueOrobK4@public.gmane.org  <>  www.cs.umd.edu/~clancy
