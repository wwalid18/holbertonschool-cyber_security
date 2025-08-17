#!/bin/bash
subfinder -silent -d $1 | xargs -I{} sh -c 'ip=$(dig +short {} | head -n1); echo "{},$ip"' > $1.txt