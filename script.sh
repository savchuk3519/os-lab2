#!/usr/bin/env bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <log-files...>"
  exit 1
fi

grep -P '^/admin' "$@" \
  | grep -Pv '\t200$' \
  | grep -oP '\b((25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\b' \
  | sort -u

