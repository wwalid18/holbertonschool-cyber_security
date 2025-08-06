#!/bin/bash
sha256sum "$1" | awk '{print $1}' | grep -q "^$2$" && echo "$1: OK" || echo "$1: FAILED"
