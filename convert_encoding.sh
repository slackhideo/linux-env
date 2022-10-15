#!/bin/sh
convert() {
    local dir="$1" encoding_new="$2"
    for I in $(find "$dir"); do
        encoding_orig=$(file -bi "$I" | cut -d= -f2)
        if [ "$encoding_orig" != "binary" -a "$encoding_orig" != "utf-8" ]; then
            mv -i "$I" "$I".tmp
            iconv -f "$encoding_orig" -t "$encoding_new" -o "$I" "$I".tmp
            rm "$I".tmp
        fi
    done
}
convert "${1:-.}" "${2:-utf8}"
