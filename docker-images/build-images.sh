#!/usr/bin/env sh

for directory in "jenkins-master" "jenkins-slave" "fluent-collector" "fluent-forwarder" "php-web-server-foundation" "web-client-foundation" "web-assets-builder" "php-web-server" "php-web-server-tester" "web-client" "web-client-tester"
  do
    cd $directory && docker-compose build && cd ..
  done
