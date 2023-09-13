#!/bin/bash

qfile="$1"
sfile="$2"
opfile="$3"

blastn -query "$qfile" -subject "$sfile" -outfmt "6 qseqid sseqid length pident" | \
  awk '$3 == 28 && $4 == 100' > "$opfile"
perfect_match=$(wc -l < "$opfile")
echo " The No. of perfect matches are: $perfect_match"

