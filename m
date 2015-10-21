From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: [RFC] extended flags
Date: Wed, 21 Oct 2015 13:24:00 +0200
Message-ID: <1445426640.4558.31.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: radiotap-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
List-Id: radiotap@radiotap.org

I'd like to define flags to indicate
 * frame was decrypted (FC protected bit is set, but data is decrypted)
 * or not - frame is known to be encrypted
 * in this case - (ext)IV is present
 * in this case - MIC isn't present

Wireshark can be configured for this (apart from the MIC case), but
it's tedious to configure it according to the capture file you happen
to have at hand.

I suggest to define the following field:

= extended flags =

 Bit Number:: 22 (not assigned yet)
 Structure:: u32 flags
 Required Alignment:: 4
 Unit(s):: n/a

This field defines decryption flags for frames. The following flags are
defined:

|| '''value''' || '''meaning''' ||
|| `0x00000001` || frame is decrypted (but FC protected bit is set) ||
|| `0x00000002` || frame is encrypted (FC protected bit is also set) ||
|| `0x00000004` || (ext) IV is still present (reserved if 0x1 isn't set) ||
|| `0x00000008` || MIC is not present (should only be used if FCS is also not present, reserved if 0x1 isn't set) ||
|| `0xfffffff0` || (reserved) ||

If there are no objections I'll work on a wireshark patch (though
probably only in about two weeks from now, since I'll be travelling)

johannes
