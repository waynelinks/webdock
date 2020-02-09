#!/usr/bin/env sh
set -e
. "$(dirname $0)/_config.sh"

override() {
  yq write --inplace "$helmValuesPath" $@
}

rm -f "$helmValuesPath"
cp "./.examples/${helmValuesPath}" "$helmValuesPath"

override 'httpServer.image.name' "$tempImageName"
override 'httpServer.image.tag' "dist-$tempImageVersion"
override 'httpServer.environmentVariables.encoded.GITHUB_TOKEN' "$GITHUB_TOKEN"
override 'httpServer.environmentVariables.encoded.NPM_TOKEN' "$NPM_TOKEN"

override 'tester.image.name' "$tempImageName"
override 'tester.image.tag' "builder-$tempImageVersion"
override 'tester.environmentVariables.encoded.GITHUB_TOKEN' "$GITHUB_TOKEN"
override 'tester.environmentVariables.encoded.NPM_TOKEN' "$NPM_TOKEN"
