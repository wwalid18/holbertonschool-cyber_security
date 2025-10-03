#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 NEW_HOST TARGET_URL FORM_DATA" >&2
  exit 2
fi

NEW_HOST=$1
TARGET_URL=$2
FORM_DATA=$3

curl -sS -X POST "$TARGET_URL" -H "Host: $NEW_HOST" -H "Content-Type: application/x-www-form-urlencoded" --data "$FORM_DATA"
