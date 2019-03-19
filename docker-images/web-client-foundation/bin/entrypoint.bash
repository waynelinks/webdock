#!/usr/bin/env bash
set -e

substitute_environment_variables()
{
  envsubst $(printenv | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

substitute_environment_variables < /etc/nginx/nginx.template.conf > /etc/nginx/nginx.conf

if [ -d /app/templates ]
then
  for template in $(ls /app/templates); do
    substitute_environment_variables < /app/templates/$template > /app/build/$template
  done
fi

exec "$@"
