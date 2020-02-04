#!/usr/bin/env sh
set -ex
. "$(dirname $0)/_config.sh"

docker tag "$tempBuilderImage" "$builderImage"
docker tag "$tempDistImage" "$distImage"

#docker push "$builderImage"
#docker push "$distImage"
