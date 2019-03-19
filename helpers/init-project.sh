#!/usr/bin/env sh
set -e

for image in \
  'docker-images/php-web-server-foundation' \
  'docker-images/php-web-server-app' \
  'docker-images/php-web-server-tester' \
  'docker-images/nodejs-foundation' \
  'docker-images/nodejs-web-server-foundation' \
  'docker-images/nodejs-web-server-app' \
  'docker-images/nodejs-web-server-tester' \
  'docker-images/web-assets-builder' \
  'docker-images/web-client-foundation' \
  'docker-images/web-client-app' \
  'docker-images/web-client-tester'
do
  cd $image
  if [ -e docker-compose.override.yml ]
  then
    rm docker-compose.override.yml
  fi
  hooks/build.sh; VERSION='0.0.1-example' hooks/build.sh
  hooks/test.sh
  cd ../..
done

for infrastructure in \
  'docker-composes/php-web-server' \
  'docker-composes/nodejs-web-server' \
  'docker-composes/web-client' \
  'docker-composes/backing-services'
do
  cd $infrastructure
  ln -sf .dist/.env .env
  hooks/deploy.sh
  if [ -x helpers/init-codebase.sh ]
  then
    helpers/init-codebase.sh
  fi
  if [ -x helpers/reset-files-permissions.sh ]
  then
    helpers/reset-files-permissions.sh
  fi
  hooks/test.sh
  hooks/destroy.sh
  cd ../..
done

echo '[Init] Done.'
