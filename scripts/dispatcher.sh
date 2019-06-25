#!/bin/bash

while read line; do
    if [[ "$line" =~ "\"" ]]; then
        echo "$line" | grep -o -P '(\[.*?\])|(["].*?["])|(\w+[ ])' | awk -f /dispatcher/scripts/dispatcher.awk
    else
        echo "$line" | awk -f /dispatcher/scripts/dispatcher-simple.awk
    fi
done

