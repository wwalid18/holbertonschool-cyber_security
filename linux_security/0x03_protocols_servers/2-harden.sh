#!/bin/bash
find / -type d -perm -0002 -ls 2>/dev/null | awk '{print $11}'
