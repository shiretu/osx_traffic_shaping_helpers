#!/bin/sh

#grab the params
BW=$1
PORT=$2

sudo pfctl -a bandwidthLimitingStuff -F all

#delete the pipe
sudo dnctl pipe delete 1

#create the pipe
sudo dnctl pipe 1 config bw ${BW}KBytes/s

#list them
sudo dnctl pipe list

echo "dummynet in quick proto udp from any to any port ${PORT} pipe 1\n \
dummynet out quick proto udp from any port ${PORT} to any pipe 1"|sudo pfctl -a bandwidthLimitingStuff -f -
