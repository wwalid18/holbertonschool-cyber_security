#!/bin/bash
whois $1 | awk -F': ' '/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Phone Ext:|Fax|Fax Ext:|Email)/ {gsub(/^ +| +$/, "", $2); print $1" "$2","$2}' > "$1.csv"
