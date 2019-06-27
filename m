From: Krishna Chaitanya <chaitanya.mgit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DMG Support
Date: Thu, 27 Jun 2019 22:45:54 +0530
Message-ID: <CABPxzYLh=fcGFFAMxcNY9pFN8HOczgoPcYe_+NNMiW-uuRDe5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Unsubscribe: <mailto:majordomo-sUITvd46vNxg9hUCZPvPmw@public.gmane.org?subject=Unsubscribe%20radiotap&body=unsubscribe%20radiotap>
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: realrichardsharpe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi Guys,

I am looking at support for DMG specific fields to radiotap, the only
discussion I have found didn't reach any conclusion [1].

Is there a plan to support these fields? It definitely needs a DMG
Type field with at least below params (from top of my head)

- MCS (and extended MCS) along with data rate mapping
   - C-PHY
   - SC-PHY
   - Low power SC-PHY
   -OFDM
- Beam/Sector/Antenna ID Information
- RCPI

[1] https://seclists.org/wireshark/2015/Aug/158

-- 
Thanks,
Regards,
Chaitanya T K.
