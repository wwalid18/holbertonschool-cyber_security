#!/usr/bin/env bash
curl -sS -X POST "$2" -H "Host: $1" -H "Content-Type: application/x-www-form-urlencoded" --data "$3"
