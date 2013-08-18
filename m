From: "C. McPherson" <ccmcphe-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Subject: Channel Flags question
Date: Sun, 18 Aug 2013 14:01:45 -0400
Message-ID: <52110C09.5040306@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Hi:

in the Lab I have a Ubiquity bullet that I have configured for Turbo and 
10/5Mhz bandwidth which is using the Atheros 9280.  I have modified the 
Atheros ath9k driver to go into all three bandwidths (Turbo, 10/5Mhz), 
but I am having a problem trying to have to display the correct bit 
settings when I monitor my 2 Ubiquity's that are in these modes. 
According to ieee80211_radiotap.h there is a setting for Turbo, but 
there is no channel flag for either the 10Mhz or 5Mhz bandwidth. What 
channel flags should I use for the 10 and 5Mhz bandwidth?

Thanks
Clyde
