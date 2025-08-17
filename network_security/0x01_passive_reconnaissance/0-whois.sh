#!/bin/bash
whois $1 | awk -F': ' 'BEGIN{split("Registrant Admin Tech",a); split("Organization State/Province Country Email",b); for(i in a) for(j in b) f[a[i] " " b[j]]="";} /Registrant|Admin|Tech/ {gsub(/^ +| +$/,"",$2); f[$1" "$2]=$2} END{for(i in a) for(j in b) print a[i] " " b[j] "," f[a[i] " " b[j]]}' > $1.csv
