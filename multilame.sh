#!/bin/bash
# inspired from the one at http://www.vidarholen.net/contents/blog/?p=9
# note that GNU parallel is probably a more elegant option to accomplish this


# Change the cores variable to the number of cores you have in your machine
# dual would be 2, quad would be 4, etc
# Note that you may count hyperthreaded cores if you wish
cores=8

# Change the switches variable to reflect the lame switches you wish to use
# See the following wiki article for more:
#http://wiki.hydrogenaudio.org/index.php?title=LAME
switches="-V 2"

encode() {
	. /etc/multilame.conf
	for file; do
		fileout=$(echo "$file" | sed s'/.wav//')
		lame "$switches" "$file" "$fileout".mp3; done
}

	export -f encode
	find . -name '*.wav' -print0 | xargs -0 -n 1 -P $cores bash -c 'encode "$@"' --
