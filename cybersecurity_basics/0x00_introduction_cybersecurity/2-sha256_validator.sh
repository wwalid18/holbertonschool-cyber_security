#!/bin/bash
[ "$(sha256sum "$1" | cut -d' ' -f1 | grep -c "^$2$")" -eq 1 ] && echo "$1: OK" || echo "$1: FAILED"
