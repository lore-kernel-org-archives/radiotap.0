From: Simon Barber <simon-vp0mx6+5gkqFX2APIN6yfw@public.gmane.org>
Subject: MCS field - STBC and Ness
Date: Thu, 10 May 2012 17:31:28 -0700
Message-ID: <4FAC5DE0.90708@superduper.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org, wojciech.dubowik-ASv44eHyqLVBDgjK7y7TUQ@public.gmane.org
List-Id: radiotap@radiotap.org

Hi all,

I am writing a Wireshark extension to visualise 802.11 frames on a 
timeline. In order to do this I need to be able to calculate the 
duration from start of TX to end of TX for each frame.

For 802.11n I need to know the number of HT-DLTF and HT-ELTF training 
symbols that are sent in the header - I have everything else needed to 
calculate the duration. Given the MCS and the STBC and the Ness (Number 
of extension spatial streams) I can calculate the number of training 
symbols.

Both STBC and Ness are encoded in the HT-SIG transmitted at the start of 
each HT frame.

The current proposal (or has it not yet been accepted?) for STBC 
allocates just 1 bit - but the STBC field can have values or 0, 1 or 2.

Ness can be 0-3, so the remaining 2 bits could be allocated to Ness, but 
this does not solve the problem of how to encode the modes with 2 
spatial streams and 2 additional streams for STBC.

Does anyone know what current hardware supports - STBC values or 0,1,2? 
Ness values of 0-3?

Any suggestions for how to convey these

Simon
