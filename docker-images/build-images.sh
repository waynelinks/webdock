#!/usr/bin/env sh

for directory in \
  "jenkins-master" \
  "jenkins-slave" \
  "fluent-collector" \
  "fluent-forwarder" \
  "php-web-server-foundation" \
  "php-web-server" \
  "php-web-server-tester" \
  "web-assets-builder" \
  "web-client-foundation" \
  "web-client" \
  "web-client-tester"
do
  cd $directory && docker-compose build && VERSION="0.0.1-example" docker-compose build && cd ..
done
