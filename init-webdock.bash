#!/usr/bin/env bash
set -e

# Function displays "\n*** ble ble ble **********************************************...\n\n"
terminalColumnsCount="$(tput cols || echo 120)"
function printSeparator() {
  local row="*** $1 ***"
  while [[ "$(echo ${#row})" -lt "$terminalColumnsCount" ]]
  do
    row="$row*"
  done
  printf "\n$row\n\n"
}

export VERSION="0.0.1-example"

printSeparator "WebDock: initialising v$VERSION"

printSeparator "WebDock: deploying local Docker registry"
docker volume create docker_registry_data
docker start docker_registry || docker run \
  --detach \
  --restart always \
  --publish 5000:5000 \
  --mount type=volume,source=docker_registry_data,destination=/var/lib/registry \
  --name docker_registry \
registry:latest

printSeparator "WebDock: creating cache volumes"
docker volume create global_npm_cache
docker volume create global_yarn_cache
docker volume create global_composer_cache

# The order of the components is not accidental here
#
# Rich automated flow should take care about environments configuration management,
# components dependency management, repository tagging and other stuff
for component in \
  'dev/webdock/toolbox/standalone-firefox' \
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
do
  printSeparator "WebDock: entering component $component"
  cd $component
  pwd

  if [[ -f .dist/.env ]]
  then
    printSeparator "$component *** prepare local environment configuration"
    ln -sfv .dist/.env .env
  fi

  if [[ -x hooks/build.bash ]]
  then
    printSeparator "$component *** hooks/build.bash"
    hooks/build.bash
    VERSION="unreleased" hooks/build.bash
  fi
  if [[ -x hooks/test.bash ]]
  then
    printSeparator "$component *** hooks/test.bash"
    hooks/test.bash
  fi
  if [[ -x hooks/publish.bash ]]
  then
    printSeparator "$component *** hooks/publish.bash"
    hooks/publish.bash
  fi

  if [[ -x hooks/deploy.bash ]]
  then
    printSeparator "$component *** hooks/deploy.bash"
    hooks/deploy.bash
  fi
  if [[ -x helpers/init-codebase.bash ]]
  then
    printSeparator "$component *** helpers/init-codebase.bash"
    helpers/init-codebase.bash
  fi
  if [[ -x helpers/reset-files-permissions.bash ]]
  then
    printSeparator "$component *** helpers/reset-files-permissions.bash"
    helpers/reset-files-permissions.bash
  fi
  if [[ -x helpers/run-unit-tests.bash ]]
  then
    printSeparator "$component *** helpers/run-unit-tests.bash"
    helpers/run-unit-tests.bash
  fi
  if [[ -x helpers/run-target-tests.bash ]]
  then
    printSeparator "$component *** helpers/run-target-tests.bash"
    helpers/run-target-tests.bash
  fi
  if [[ -x hooks/destroy.bash ]]
  then
    printSeparator "$component *** hooks/destroy.bash"
    hooks/destroy.bash
  fi

  printSeparator "WebDock: leaving component $component"
  cd ../../../..
  pwd
done

printSeparator "WebDock: project is ready to explore!"
