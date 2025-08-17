#!/bin/bash
whois $1 | awk -F': ' '/Registrant (Organization|State\/Province|Country|Email)|Admin (Organization|State\/Province|Country|Email)|Tech (Organization|State\/Province|Country|Email)/ {gsub(/^ +| +$/,"",$2); print $1","$2}' > $1.csv
