#!/usr/bin/env bash
set -e

echo '[WebDock] Initialising...'

docker volume create registry_data
docker start registry || docker run \
  --detach \
  --restart always \
  --publish 5000:5000 \
  --mount type=volume,source=registry_data,destination=/var/lib/registry \
  --name registry \
registry:latest

docker volume create global_npm_cache
docker volume create global_yarn_cache
docker volume create global_composer_cache

export VERSION=0.0.1-example
for component in \
  'dev/webdock/sandbox/standalone-firefox' \
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
  'dev/webdock/domain/web-client-compose'
# Apps do not use backing services out of the box.
# 'dev/webdock/sandbox/backing-services-compose'
do
  cd $component

  if [[ -x hooks/build.bash ]]
  then
    hooks/build.bash
  fi
  if [[ -f .dist/.env ]]
  then
    ln -sf .dist/.env .env
  fi
  if [[ -x hooks/deploy.bash ]]
  then
    hooks/deploy.bash
  fi
  if [[ -x helpers/init-codebase.bash ]]
  then
    helpers/init-codebase.bash
  fi
  if [[ -x helpers/reset-files-permissions.bash ]]
  then
    helpers/reset-files-permissions.bash
  fi
  if [[ -x helpers/run-unit-tests.bash ]]
  then
    helpers/run-unit-tests.bash
  fi
  if [[ -x hooks/test.bash ]]
  then
    hooks/test.bash
  fi
  if [[ -x hooks/destroy.bash ]]
  then
    hooks/destroy.bash
  fi
  if [[ -x hooks/publish.bash ]]
  then
    hooks/publish.bash
  fi

  cd ../../../..
done

echo '[WebDock] Project is ready to explore!'
