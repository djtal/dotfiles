#!/bin/bash

find ~ -name '*.log' -print0 | xargs -0 -L1 stat -f'%z %N' | sort -rn | tee /tmp/fat-logfiles.txt | head
awk '{ total += $1 } END { printf "total: %5.2f MiB\n", total/1024/1024 }' < /tmp/fat-logfiles.txt
