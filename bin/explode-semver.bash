#!/usr/bin/env bash

# string with {major}.{minor}.{patch}(-{label}) format
# http://semver.org
semver=$1

version=${semver%%-*}
version_array=(${version//./ })
major=${version_array[0]}
minor=${version_array[1]}
patch=${version_array[2]}
label=$(echo $semver | cut -d "-" -f2- -s)

if [ -n "$label" ]
then
    echo "$major.$minor.$patch-$label"
    echo "$major.$minor-$label"
    echo "$major-$label"
    echo "$label"
else
    echo "$major.$minor.$patch"
    echo "$major.$minor"
    echo "$major"
    echo "latest"
fi
