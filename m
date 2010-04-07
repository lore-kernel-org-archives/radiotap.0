From: David Young <dyoung-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Google Summer of Code: radiotap applications
Date: Wed, 7 Apr 2010 15:00:27 -0500
Message-ID: <20100407200027.GU26548@ojctech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounces-radiotap-owner-gnwr-radiotap=gmane.org-sUITvd46vNxg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
Sender: radiotap-owner-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
To: tech-net-S783fYmB3Ccdnm+yROfE0A@public.gmane.org
Cc: radiotap-sUITvd46vNxg9hUCZPvPmw@public.gmane.org
List-Id: radiotap@radiotap.org

Attention students,

I invite you to propose Radiotap applications to the NetBSD Foundation
for the Google Summer of Code.

Radiotap is a device-independent radio information header for 802.11.
It originates from the NetBSD project, but Mac OS X, Linux, and all of
the BSDs are using it.  WLAN drivers use radiotap to pass an 802.11
packet's "meta-information" through the operating system's packet tap.
"Meta-information" typically includes the received signal strength,
noise/interference strength, bitrate, channel, and a microsecond
hardware timestamp.

I want to encourage Radiotap proposals in two major thematic areas,
however, other proposals are ok, too.

Theme 1: Eyes and ears on WLAN activity.

  Recording just a few seconds of Radiotap + 802.11 activity
  produces reams and reams of data.  To reduce the data to
  useful information "by hand" is tremendously difficult.
  We can imagine software that illuminates trends in radiotap
  information:

  * number of WLAN networks and devices detected
  * rate of packet arrival
  * strength of received WLAN packets
  * 802.11 conversations: data + ack, rts + cts + data + ack, data +
    retry + retry + ack
  * prevailing operating modes (.11n, .11g, .11b), bitrates, inter-frame
    spaces
  * 802.11 traffic coordination (or lack thereof)

  Here are a couple of specific applications ideas in this theme:

    Radiotap timeline: write an application that draws an interactive
      timeline on the host computer's framebuffer, labeled with graphic
      representations of 802.11 packets and their Radiotap information.

    Radiotap sonifier: write an application that uses some combination
      of tones, noise, and speech synthesis to render a real-time WLAN
      "soundscape" on /dev/audio.

    Radiotap kaleidoscope: use Radiotap to drive a pleasing, dynamic
      full-screen display by transforming received packets' properties
      into hue, saturation, and geometric transformations.

Theme 2: Computer-aided Radiotap design and verification.

  Radiotap header design aid: First, write a program that reads a
    specification of Radiotap fields (width, alignment, presence-bit
    number) and one or more presence bitmaps, each paired with its
    probability of occurrence, and computes the expectation of the
    length of the corresponding radiotap headers.  Then, extend the
    program to re-assign presence bits in order to optimize the length
    of the Radiotap headers.  (Optimal headers are shorter.)

  Radiotap header verification: write programs and scripts for
    emitting synthetic Radiotap headers and for verifying Radiotap
    headers' compliance to the standard's specification.

Dave

-- 
David Young             OJC Technologies
dyoung-eZodSLrBbDpBDgjK7y7TUQ@public.gmane.org      Urbana, IL * (217) 278-3933
