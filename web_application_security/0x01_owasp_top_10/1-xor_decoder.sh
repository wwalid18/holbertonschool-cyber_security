#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 {xor}encoded_string"
    exit 1
fi
encoded_string="${1#\{xor\}}"
decoded_bytes=$(echo -n "$encoded_string" | base64 -d 2>/dev/null | od -An -tu1)
if [ -z "$decoded_bytes" ]; then
    echo "Error: Invalid base64 encoding or empty result"
    exit 1
fi
xor_key=95
result=""
for byte in $decoded_bytes; do
    xor_val=$((byte ^ xor_key))
    result+=$(printf "\\$(printf '%03o' "$xor_val")")
done
echo "$result"