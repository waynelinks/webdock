#!/usr/bin/env sh
set -e
. "$(dirname "$0")/_variables.sh"

echo 'Running installation tests...'
docker run --rm "${IMAGE}:${VERSION}" bash -c '
  php --version \
  && php-fpm --version \
  && pear version \
  && pecl version \
  && composer --version \
  && which cgi-fcgi \
  && nginx -v \
  && envsubst --version \
  && curl --version \
  && git --version
'
docker run --rm "${IMAGE}:${VERSION}" bash -c '
  if php -r "exit(extension_loaded(\"xdebug\") ? 1 : 0);"
  then
    echo "OK: Xdebug is disabled by default."
  else
    echo "ERROR: Xdebug is enabled by default."
    exit 1
  fi
'
docker run --rm "${IMAGE}:${VERSION}" bash -c '
  docker-php-ext-enable xdebug
  if php -r "exit(extension_loaded(\"xdebug\") ? 1 : 0);"
  then
    echo "ERROR: Xdebug can not be enabled."
    exit 1
  else
    echo "OK: Xdebug can be enabled."
  fi
'
