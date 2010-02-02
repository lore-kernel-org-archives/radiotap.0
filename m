From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Tue, 2 Feb 2010 12:24:07 -0600
Message-ID: <20100202182406.GD1060@ojctech.com>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com>
 <loom.20100202T174119-204@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <loom.20100202T174119-204-eS7Uydv5nfjZ+VzJOa5vwg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Tue, Feb 02, 2010 at 05:36:17PM +0000, Bill Stafford wrote:
> Matteo Croce <technoboy85@...> writes:
> > Before it's approved I would ask the crew what is the best
> > thing to do with the old rate field when the MCS one is set.
> > We can leave it set with a value of 0 or just omitting it when
> > the MCS is set.  The latter makes more sense to me.
> 
> Omitting the Rate field seems like the most logical, but does not
> help out legacy parsers. The Rate field can represent the 20 MHz
> HT rates up to MCS 14 (13 ShortGI), and some of the higher
> indexes. This means a legacy parser could show accurate rate for
> all but the highest phy rates if the Rate field was included.
> 
> You mention the possibility of leaving the Rate field in with a
> value of 0. That would be a good obvious key for someone looking
> over a capture to know that the rate could not be represented.

I favor omitting the legacy rate field from HT frames.

In standards-ese, I propose:

        An implementation SHOULD NOT use the legacy rate field to
        represent the transmission rate of any HT frame.

        If the legacy rate field cannot perfectly represent a
        frame's transmission rate (e.g., it is a 288.9 Mbps HT
        frame), an implementation MUST omit the legacy rate field.

Even if the legacy field can represent the HT rate, it may be misleading
to compare the legacy rate field in an HT frame with the legacy rate
field in a legacy frame, because of the different types and amount of
overhead involved in the HT & legacy transmissions.  Also, comparing the
legacy rate of two HT transmissions, one whose rate is representable in
the legacy rate field and one whose rate is not representable, will not
be too useful.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
