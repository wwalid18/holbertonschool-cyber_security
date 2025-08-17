#!/bin/bash
whois $1 | awk -F': ' '
BEGIN {
  for (i in arr) delete arr[i]
}
{
  key=$1; val=$2; gsub(/^ +| +$/,"",val)
  if (key ~ /Registrant (Organization|State\/Province|Country|Email)/ ||
      key ~ /Admin (Organization|State\/Province|Country|Email)/ ||
      key ~ /Tech (Organization|State\/Province|Country|Email)/)
    print key","val
}' > "$1.csv"
