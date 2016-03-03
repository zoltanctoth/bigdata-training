awk -F , '$5 != "" { print $3"\t"$5 }'
