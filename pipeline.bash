#!/usr/bin/env bash
set -e

# Function displays "\n*** 23:59:59 *** Foo bar baz **********************************************...\n\n"
terminalColumnsCount="$(tput cols || echo 80)"
function printPipelineHeader() {
  local row="*** $(date "+%T") *** $1 ***"
  while [[ "${#row}" -lt "$terminalColumnsCount" ]]
  do
    row="$row*"
  done
  printf "\n\e[90m$row\e[0m\n\n"
}

pipelineWatch="1"
pipelinePauseMessage="Press a key...

[Enter]   Continue
[Esc]     Disable pausing and continue
[Ctrl+C]  Break
"
function pausePipeline() {
  if [ "$pipelineWatch" == "1" ]
  then
    printPipelineHeader "Paused"
    printf "$pipelinePauseMessage"
    read -s -n1 keyPressed
    case "$keyPressed" in
      $'\e') # Escape
        pipelineWatch="0"
      ;;
    esac
    clear
    clear
  fi
}

printPipelineHeader "START"
pausePipeline

for projectComponent in \
  'images/the-nodejs' \
  'packages/the-greeter' \
  'images/the-web-cloud-server' \
  'images/the-web-cloud-tester' \
  'images/the-web-browser-client' \
  'images/the-web-browser-tester' \
  'charts/the-web-cloud-platform' \
  'charts/the-web-browser-platform'
do
  printPipelineHeader "Entering project component *** $projectComponent"
  cd "$projectComponent"
  pwd
  pausePipeline

  for generatedFile in \
    '.env' \
    'build' \
    'build.yaml' \
    'coverage' \
    'dist' \
    'docker-compose.override.yml' \
    'node_modules' \
    'values.local.yaml'
  do
    if [[ -d "$generatedFile" ]]
    then
      printPipelineHeader "Deleting generated directory *** $PWD/$generatedFile"
      rm --recursive --verbose "$generatedFile"
      pausePipeline
    fi
    if [[ -f "$generatedFile" ]]
    then
      printPipelineHeader "Deleting generated file *** $PWD/$generatedFile"
      rm --verbose "$generatedFile"
      pausePipeline
    fi
  done

  for exampleConfig in \
    '.env' \
    'docker-compose.override.yml' \
    'values.local.yaml'
  do
    if [[ -f ".examples/$exampleConfig" ]]
    then
      printPipelineHeader "Linking example config *** $PWD/.examples/$exampleConfig"
      ln --symbolic --verbose ".examples/$exampleConfig" .
      pausePipeline
    fi
  done

  for pipelineScript in \
    'build' \
    '.reset' \
    'run-vulnerabilities-scanning' \
    'lint' \
    'deploy' \
    'run-installation-tests' \
    'run-implementation-tests' \
    'run-unit-tests' \
    'run-integration-tests' \
    'run-system-tests' \
    'publish' \
    'destroy'
  do
    if [[ -x "pipeline/$pipelineScript.bash" ]]
    then
      printPipelineHeader "Executing pipeline script *** $PWD/pipeline/$pipelineScript.bash"
      "pipeline/$pipelineScript.bash"
      pausePipeline
    fi
  done

  printPipelineHeader "Leaving project component *** $projectComponent"
  cd ../..
  pwd
  pausePipeline
done

printPipelineHeader "END"
echo "Success!"
