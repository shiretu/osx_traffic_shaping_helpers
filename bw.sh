#!/bin/sh

PIPE_NR=1

#the IN/OUT rates
MAX_RATE=100

#remove all pipes
dnctl pipe delete ${PIPE_NR}

#create the pipes
dnctl pipe ${PIPE_NR} config bw ${MAX_RATE}KBytes/s
#dnctl pipe ${PIPE_NR} config plr 0.2

#list them
dnctl pipe list

echo "dummynet in quick proto udp from any to any pipe ${PIPE_NR}" | pfctl -a bandwidthLimitingStuff -f -

