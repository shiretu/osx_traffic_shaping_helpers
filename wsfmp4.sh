#!/bin/sh

#grab the params
BW=$1

sudo pfctl -a bandwidthLimitingStuff -F all

#delete the pipe
sudo dnctl pipe delete 1

#create the pipe
sudo dnctl pipe 1 config bw ${BW}KBytes/s

#list them
sudo dnctl pipe list

echo "dummynet in quick proto tcp from any to any port 5555 pipe 1\n \
dummynet out quick proto tcp from any port 5555 to any pipe 1"|sudo pfctl -a bandwidthLimitingStuff -f -
