#!/usr/bin/env sh
set -e

echo '[WebDock] Initialising...'

for module in \
  'dev/webdock/basebox/nodejs-foundation' \
  'dev/webdock/basebox/nodejs-web-server-foundation' \
  'dev/webdock/basebox/php-web-server-foundation' \
  'dev/webdock/basebox/web-assets-builder' \
  'dev/webdock/basebox/web-client-foundation' \
  'dev/webdock/domain/nodejs-web-server-app' \
  'dev/webdock/domain/nodejs-web-server-tester' \
  'dev/webdock/domain/php-web-server-app' \
  'dev/webdock/domain/php-web-server-tester' \
  'dev/webdock/domain/web-client-app' \
  'dev/webdock/domain/web-client-tester' \
  'dev/webdock/domain/nodejs-web-server-compose' \
  'dev/webdock/domain/php-web-server-compose' \
  'dev/webdock/domain/web-client-compose' \
  'dev/webdock/sandbox/backing-services-compose'
do
  cd $module

  if [ -e .dist/docker-compose.override.yml ]
  then
    rm -f docker-compose.override.yml
  fi
  if [ -e .dist/.env ]
  then
    ln -sf .dist/.env .env
  fi

  if [ -x hooks/build.sh ]
  then
    hooks/build.sh
    VERSION='0.0.1-example' hooks/build.sh
  fi
  if [ -x hooks/deploy.sh ]
  then
    hooks/deploy.sh
  fi
  if [ -x helpers/init-codebase.sh ]
  then
    helpers/init-codebase.sh
  fi
  if [ -x helpers/reset-files-permissions.sh ]
  then
    helpers/reset-files-permissions.sh
  fi
  if [ -x hooks/test.sh ]
  then
    hooks/test.sh
  fi
  if [ -x hooks/destroy.sh ]
  then
    hooks/destroy.sh
  fi

  cd ../../../..
done

echo '[WebDock] Project is ready to explore!'
