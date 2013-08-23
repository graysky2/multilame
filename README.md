## Multilame
A pseudo multi-threaded bash script to parallel encode .wav to .mp3 via lame. Useful only if you have a pile of wav files lying around that you want encoded to mp3. Note this script does not support tagging so you'll need to use a util like picard or whatever to do that in a separate step.

## Dependencies
* lame
* findutils (xargs)

## Better options
There are better, more elegant options to accomplish this task, for example, using GNU parallel.  I wrote this script a while ago as a proof of concept before I discovered parallel.  Hope someone finds it useful.

`find /path/to/wavs -name '*.wav' | parallel lame -V 2 {}`
