#!/usr/bin/env bash

set -e
set -u
shopt -s nullglob

exec 200>/run/compress-cgnat.lock
flock -n 200 || exit 1

DATE=$(date -d 'yesterday' '+%Y/%m/%d')

for cgnat in /var/log/cgnat/*
do
	DIR="$cgnat/$DATE"

	[ -d "$DIR" ] && pigz -p "$(nproc)" --fast --quiet -- "$DIR"/*
done
