From: Charles Clancy <clancy-VX+DGZyGJwM3uPMLIKxrzw@public.gmane.org>
Subject: Re: WiMAX extensions
Date: Mon, 28 May 2007 13:58:36 -0400
Message-ID: <465B184C.1000306@cs.umd.edu>
References: <50721.65.74.1.247.1178691838.squirrel@webmail.cs.umd.edu> <20070513033218.GL20770@che.ojctech.com> <465B128D.9070904@cs.umd.edu> <465B144F.2070403@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <465B144F.2070403-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sender: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
Errors-To: radiotap-admin-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Unsubscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org>
List-Help: <mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=help>
List-Subscribe: <http://mail.ojctech.com/mailman/listinfo/radiotap>,
	<mailto:radiotap-request-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org?subject=subscribe>
List-Archive: <http://mail.ojctech.com/pipermail/radiotap/>
To: radiotap-rN9S6JXhQ+WXmMXjJBpWqg@public.gmane.org
List-Id: radiotap@radiotap.org

Guy Harris wrote:
>> There would certainly be overlap with 802.11.  However most 
>> implementations I've seen seem to prefix the fields with IEEE80211_, 
>> so I'd think these would all need to be replicated for 802.16.  I'm 
>> not sure the best way to handle it.
> 
> Replicated, or renamed, with the old names kept around for source 
> compatibility - or with IEEE80211_ and IEEE80216_ names for the same value?

Ideally, I'd think renaming fields that apply to any wireless standard 
would be best, keeping around the old values for compatibility, of 
course.  Then there could be protocol-specific fields for each standard.

I think the following would be globally useful:

IEEE80211_RADIOTAP_TSFT
IEEE80211_RADIOTAP_RATE
IEEE80211_RADIOTAP_DB*
IEEE80211_RADIOTAP_ANTENNA
IEEE80211_RADIOTAP_FLAGS (though you might need a general flag set and a 
protocol-specific flag set)

Is Radiotap meant to be used on outgoing packets as well?  If so, there 
are a variety of outgoing packet fields that might also be useful.

-- 
t. charles clancy, ph.d.  <>  tcc-e45ueOrobK4@public.gmane.org  <>  www.cs.umd.edu/~clancy
