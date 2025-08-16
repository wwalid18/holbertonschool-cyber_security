#!/bin/bash
sudo ss -t -a -n -e -p | awk 'NR==1 {print "State   Recv-Q   Send-Q     Local Address:Port   Peer Address:Port   Process"} NR>1 {print}'
