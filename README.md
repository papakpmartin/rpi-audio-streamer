# rpi-audio-streamer

## What am I trying to do here?

I'd like to be able to set up a Raspberry Pi (presuming Rev 3, but perhaps Zero would do it?) to do the following:

* Be able to stream live audio on the LAN
* Be able to stream that same live audio to a Shoutcast feed
* Auto-start everything on power-up
* Not have hideous things happen when the power is unceremoniously lost

I've gotten very close, and I don't think this repo represents my latest. I started to have some trouble with Docker and so kept slogging along just on the Raspi itself.

### Miscellaneous notes

* I'm using USB for the audio in, not the built-in jack
* I'm using the Sinatra file just as kind of a "hello world" to see if streaming is working
* I've had good luck streaming on LAN, but once I add the shoucast section to `darkice.cfg`, darkice seems to want to die
* Conneting via Wi-Fi, not ethernet (because in my use case, being able to be wireless is much more important than the latency/performance hit)