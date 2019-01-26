#!/usr/bin/env sh

for directory in \
  "jenkins-master" \
  "jenkins-slave" \
  "fluent-collector" \
  "fluent-forwarder" \
  "php-web-server-foundation" \
  "web-assets-builder" \
  "web-client-foundation" \
  "php-web-server" \
  "php-web-server-tester" \
  "web-client" \
  "web-client-tester"
do
  cd $directory && docker-compose build && cd ..
done
