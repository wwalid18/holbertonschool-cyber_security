#!/bin/bash
whois $1 | awk -F': ' '/Registrant|Admin|Tech/ && $2{gsub(/^[ \t]+|[ \t]+$/,"",$2); sub(/Contact/,"",$1); print $1","$2}' >