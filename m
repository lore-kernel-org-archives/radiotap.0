From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: Allocation of new presence bits, eg for HE, etc
Date: Fri, 15 Dec 2017 09:21:20 +0100
Message-ID: <1513326080.26976.90.camel@sipsolutions.net>
References: <CACyXjPwCj1nmGyh-EDHOVn1aT30WEKdEQrRpOTnQqaV7mV0C0Q@mail.gmail.com>
	 <20171214174316.GL12698@pobox.com>
	 <CAF7Mx6q-vv3=nKX=aG5Mg6t0r7_VLQuxt-By2exavf6V6yqvHg@mail.gmail.com>
	 <CAF7Mx6pY+zjr9b9iL4B0O2Lqy2-EdvPZ9Uok4DYHN1ns4-GGMQ@mail.gmail.com>
	 <CAF7Mx6oZbpHebL7dO-jB0ngCZoqjRO2O=a456QJfQr1PRQ3-vw@mail.gmail.com>
	 <CACyXjPzQ8Qc6xqwhjUXggASkG8QVTHGad-4E56iUyjyYAk0jjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CACyXjPzQ8Qc6xqwhjUXggASkG8QVTHGad-4E56iUyjyYAk0jjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: Richard Sharpe <realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

On Thu, 2017-12-14 at 10:05 -0800, Richard Sharpe wrote:
> 
> Yes, I noticed those, but no bit assignments have been made. At least
> one organization is interested in this.

:-)

> Is it a case of ANA (Add Next Available?)

Yeah, that's really the only thing that makes sense, since parsing
relies on the bit order.

I've made my experimental Linux patches write it with bit 23 (and
haven't implemented the HE-MU/other-user yet).

> It will mean making sure that the tools doing captures add the bits
> and that things like Wireshark are backward compatible.

Yeah.

Maybe we can/should have a "tentatively defined" state? I have been
reluctant to post this for formal adoption because the HE spec isn't
done yet, but at the same time we want this to be already usable by
people.

johannes
