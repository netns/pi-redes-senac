#!/usr/bin/env bash

# docker pull rsyslog/rsyslog-collector:latest

docker run --name rsyslog -d \
  -v $(pwd)/etc-rsyslog:/etc/rsyslog.d:ro \
  -v $(pwd)/log:/var/log \
  -p 514:514/tcp \
  -p 514:514/udp \
  rsyslog/rsyslog-collector:latest
