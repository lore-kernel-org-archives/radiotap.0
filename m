From: Scott Raynel <scottraynel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Query about recent Radiotap changes
Date: Tue, 27 Mar 2007 09:11:17 +1200
Message-ID: <F63792BF-FB34-46CB-A541-E33015EEF69E@gmail.com>
References: <16B0F9F6-C3B2-4A00-A789-C1DD3E279D08@gmail.com> <20070326195045.GA11742@che.ojctech.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <20070326195045.GA11742-eZ+MEZF6i8Dc+919tysfdA@public.gmane.org>
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

Hello again,

On 27/03/2007, at 7:50 AM, David Young wrote:

>
> The _F_RX_BADFCS flag in the field IEEE80211_RADIOTAP_RX_FLAGS is
> redundant.  The flag duplicates the function of the _F_FCS field in
> the IEEE80211_RADIOTAP_FLAGS field.  TIMTOWTDI is a recipe for design
> complexity.

I was under the impression that IEEE80211_RADIOTAP_F_RX_BADFCS  
duplicated the function of the _F_BADFCS, not _F_FCS, which indicates  
the presence of FCS bytes in the frame. Or am I missing something?

Cheers,

--
Scott Raynel
WAND Network Research Group
Department of Computer Science
University of Waikato
New Zealand
