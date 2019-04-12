#!/usr/bin/env bash
set -e

inject_environment_variables()
{
  envsubst $(printenv | cut -f1 -d'=' | sed 's/.*/\\\${&}/' | tr '\n' ',')
}

if [[ "$(id --user)" == '0' ]]
then
  inject_environment_variables < /etc/nginx/nginx.template.conf > /etc/nginx/nginx.conf

  if [[ -d /app/build-templates ]]
  then
    for file in $(cd /app/build-templates; find . -maxdepth 1 -type f)
    do
      inject_environment_variables < /app/build-templates/$file > /app/build/$file
    done
  fi
fi

exec "$@"
