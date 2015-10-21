From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFC] VHT MU-MIMO correction
Date: Wed, 21 Oct 2015 11:15:06 +0200
Message-ID: <1445418906.4558.7.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

Hi,

As we're looking into MU-MIMO again, we found some issue with the way
the VHT radiotap field is defined. The issue is the following: the VHT
SIG-A field defines the NSTS (NSS) for each user, and it would be good
to have that shown. However, radiotap ties the validity of the MCS to
the existence of the NSS, which is incorrect.

Therefore, I suggest to make the following edit:

Change this language:

    If the NSS field for a user is zero, the user is not present and
    the MCS and coding (in the coding field) associated with that user
    are not valid. For SU PPDUs, only the first user will have a
    nonzero NSS field.

To read:

    If the NSS field for a user is zero, the user is not present and
    the MCS and coding (in the coding field) associated with that user
    are not valid. If the NSS field for a user is non-zero, but the MCS
    is not known (for example due to receiving only data for a single
    user), the MCS shall be set to 15.
    For SU PPDUs, only the first user will have a nonzero NSS field.


The coding should be known for all, since it's also part of VHT-SIG-A,
so I'm not suggesting to add validity flags for that. Does anyone think
that is necessary?

A wireshark patch won't really be necessary since it will already
display the MCS as "15 (invalid)" in this case, which seems reasonable
though it could be changed to just "not known" instead.

johannes
