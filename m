From: Roberto Riggio <roberto.riggio-2TmCWn7/4sHOQU1ULcgDhA@public.gmane.org>
Subject: Re: MCS field: RFA
Date: Fri, 22 Apr 2011 09:07:53 +0200
Message-ID: <4DB12949.5030203@create-net.org>
References: <40101cc31001260626g4a47b7c6gde6f99e477e69ac9@mail.gmail.com> <loom.20110418T114722-716@post.gmane.org> <1303120873.3588.5.camel@jlt3.sipsolutions.net> <4DAC0D1C.80306@create-net.org> <BANLkTikV_YxYnFxjHrFE7XgYfi1T7J=3Tw@mail.gmail.com> <4DAEDBAB.5070100@create-net.org> <BANLkTi=psWmOSJXDRQvGC2ABwYfR=8EFrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <BANLkTi=psWmOSJXDRQvGC2ABwYfR=8EFrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: Matteo Croce <technoboy85-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Il 21/04/2011 17:04, Matteo Croce ha scritto:
> --- a/net/mac80211/ieee80211_i.h	2011-04-18 15:30:13.532573589 +0200
> +++ b/net/mac80211/ieee80211_i.h	2011-04-18 17:06:47.904572241 +0200
> @@ -1196,6 +1196,10 @@
>   	u8 padding_for_rate;
>   	__le16 tx_flags;
>   	u8 data_retries;
> +	/*HT info*/
> +	u8 ht_known;
> +	u8 ht_flag;
> +	u8 ht_mcs;
>   } __packed;
This generates this compile time error:

make[4]: Entering directory 
`/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/linux-2.6.37.6'
   CC [M]  
/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06/net/mac80211/main.o
/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06/net/mac80211/main.c: 
In function 'ieee80211_register_hw':
/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06/net/mac80211/main.c:870:2: 
error: negative width in bit-field '<anonymous>'
make[6]: *** 
[/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06/net/mac80211/main.o] 
Error 1
make[5]: *** 
[/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06/net/mac80211] 
Error 2
make[4]: *** 
[_module_/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06] 
Error 2
make[4]: Leaving directory 
`/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/linux-2.6.37.6'
make[3]: *** [modules] Error 2
make[3]: Leaving directory 
`/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06'
make[2]: *** 
[/home/rriggio/src/wing/staging/kamikaze-trunk-26524/build_dir/linux-ixp4xx_wing/compat-wireless-2011-04-06/.built] 
Error 2
make[2]: Leaving directory 
`/home/rriggio/src/wing/staging/kamikaze-trunk-26524/package/mac80211'
make[1]: *** [package/mac80211/install] Error 2
make[1]: Leaving directory 
`/home/rriggio/src/wing/staging/kamikaze-trunk-26524'
make: *** [package/mac80211/install] Error 2
