#!/bin/bash
whois $1 | awk -F': ' '/Organization|State\/Province|Country|Email/ {gsub(/^ +| +$/,"",$2); print $1","$2}' > $1.csv
