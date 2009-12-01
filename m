From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 1 Dec 2009 11:31:23 -0600
Message-ID: <20091201173122.GD6179@ojctech.com>
References: <1259258152.32372.90.camel@johannes.local>
 <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
 <1259659011.32171.45.camel@johannes.local>
 <43e72e890912010843y208201aawb2ad95cbec98c814@mail.gmail.com>
 <1259687018.32171.96.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1259687018.32171.96.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Dec 01, 2009 at 06:03:38PM +0100, Johannes Berg wrote:
> On Tue, 2009-12-01 at 08:43 -0800, Luis R. Rodriguez wrote:
> > If so what is the point of the reset bit? What I mean is that if we
> > give radiotap its own OUI technically we could just reset ourselves to
> > the radiotap namespace by specifying the radiotap OUI with what I'd
> > think would be optional radiotap subnamespace material (length could
> > be 0 I take it).
> 
> Well I personally would rather reserve a bit than try to come up with a
> radiotap OUI (how would it get that?) and then special-casing the length
> field etc. That just means _more_ special cases in the parser, rather
> than less.

I'm not keen on adding a special case to the length field, either.
Implementing the namespace-reset bit is simple.

I foresee using namespace reset a lot in the same header [1].  Using a
vendor extension field of 5-plus bytes each time, instead, will use a
lot of bytes fast!

I think that getting an OUI for Radiotap would be expensive.

Dave

[1] I'm thinking of using namespace-reset in re-transmission histories/strategies.

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
