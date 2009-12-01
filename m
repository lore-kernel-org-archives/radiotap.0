From: "Luis R. Rodriguez" <mcgrof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFA] namespaces and vendor extensions
Date: Tue, 1 Dec 2009 09:46:35 -0800
Message-ID: <43e72e890912010946s4371c87h402383ddadb7de28@mail.gmail.com>
References: <1259258152.32372.90.camel@johannes.local> <d521a2310911301441l3c5503b5hf43d31a47e83fe4b@mail.gmail.com>
	<1259659011.32171.45.camel@johannes.local> <43e72e890912010843y208201aawb2ad95cbec98c814@mail.gmail.com>
	<1259687018.32171.96.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <1259687018.32171.96.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "Joshua (Shiwei) Zhao" <swzhao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Radiotap <radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>, Gerald Combs <gerald-IZ8446WsY0/dtAWm4Da02A@public.gmane.org>
List-Id: radiotap@radiotap.org

On Tue, Dec 1, 2009 at 9:03 AM, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote:
> On Tue, 2009-12-01 at 08:43 -0800, Luis R. Rodriguez wrote:
>
>> Wanted to clarify, on the vendor it_present bitmap, does it always
>> have to also respect the bit for vendor extension bit 30? The current
>> proposal seems to have language which would indicates so:
>>
>> "This field is reserved in all namespaces and every it_present word,
>> the standard radiotap namespace as well as all vendor namespaces. "
>
> Yes, we have already reserved bit 31 in all it_present words, and now we
> also reserve bits 29 and 30, so that vendor extensions can only use
> numbers 0-28, 32-60, 64-92, ...

OK thanks.

>> If so what is the point of the reset bit? What I mean is that if we
>> give radiotap its own OUI technically we could just reset ourselves to
>> the radiotap namespace by specifying the radiotap OUI with what I'd
>> think would be optional radiotap subnamespace material (length could
>> be 0 I take it).
>
> Well I personally would rather reserve a bit than try to come up with a
> radiotap OUI (how would it get that?)

We don't have to buy an OUI. We could use a locally administered OUI,
which you had pointed out a while back when were looking for a private
OUI for some other purpose, I forget what it was.

> and then special-casing the length field etc.

Well I'm not saying you would *have* to force the length of the
subnamespace stuff to be 0, you could technically still use it and
stuff new it_present stuff with additional subnamespace radiotap
stuff. With the current reset proposal if you wanted to switch from
one private namespace to another you'd use two words, one to indicate
the reset which will throw you back to the radiotap namespace and then
a vendor extension bit on the second word to indicate a vendor
extension on a new namespace.

I actually would not even bother using the it_present bitmap for my
own private namespace, instead I'd just use the whole subnamespace to
stuff whatever random crap I want. I also believe inserting plugins to
interpret private namespaces then becomes easier to add to the code.

>That just means _more_ special cases in the parser, rather
> than less.

I'm thinking of ways in which the radtiotap code which appends new
radiotap information can easily be added for vendor extensions, which
is what I really only care about right now. For Atheros vendor
namespace for example it would seem easier to just use the vendor
extension bit to indicate the atheros subnamespace will have content,
then just stuff all our data there. For mac80211 this would mean just
adding a possible driver->extend_radiotap() or something like this.
You could certainly pass along the it_present bitmap[s] for the vendor
too but it seems easier to me if that would not have to be passed at
all or kept record of.

  Luis
