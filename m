From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: www.radiotap.org
Date: Thu, 07 Sep 2017 16:41:17 +0200
Message-ID: <1504795277.6177.6.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: radiotap <radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org>
List-Id: radiotap@radiotap.org

Hi Dave,

Could you change www.radiotap.org to be a direct CNAME to
radiotap.github.io? It's currently a CNAME to
radiotap.sipsolutions.net, which is then a CNAME to radiotap.github.io,
but cutting out the extra step would be useful, and would help avoid a
github page build warning.

Thanks,
johannes
